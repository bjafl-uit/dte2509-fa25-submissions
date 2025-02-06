from pathlib import Path
import sqlalchemy as sa
import pandas as pd
import json
from datetime import datetime
from typing import List, Dict, Any, Optional
import re

class SQLExecutor:
    def __init__(self, connection_string: str):
        """
        Initialize database connection
        
        Args:
            connection_string: Database connection string
            Example: "postgresql://user:password@localhost:5432/dbname"
                    "mysql://user:password@localhost:3306/dbname"
                    "sqlite:///path/to/db.sqlite"
        """
        self.engine = sa.create_engine(connection_string)
    
    def extract_queries(self, sql_file_path: str) -> List[Dict[str, str]]:
        """Extract SQL queries and their comments from file"""
        with open(sql_file_path, 'r') as file:
            content = file.read()
            
        # Split file into query blocks
        query_blocks = re.split(r'\n\s*\n', content)
        queries = []
        
        for block in query_blocks:
            # Skip empty blocks
            if not block.strip():
                continue
                
            # Extract comments and query
            lines = block.strip().split('\n')
            comments = []
            query_lines = []
            
            for line in lines:
                if line.strip().startswith('--'):
                    comments.append(line.strip()[2:].strip())
                else:
                    query_lines.append(line)
            
            query = '\n'.join(query_lines).strip()
            if query:  # Only add if there's a query
                queries.append({
                    'query': query,
                    'description': ' '.join(comments)
                })
        
        return queries

    def execute_query(self, query: str):
        """Execute a single query and return results"""
        query_parts = query.split(';')
        query_set_use = [q.strip()+';' for q in query_parts if q.strip().lower().startswith(('set', 'use'))]
        query_select = [q.strip()+';' for q in query_parts if q.strip().lower().startswith('select')]
        if len(query_set_use) > 0:
            with self.engine.connect() as conn:
                for q in query_set_use:
                    conn.execute(sa.text(q))
        if len(query_select) == 0:
            return None
        query = query_select[0]
        try:
            escaped_query = query.replace('%', '%%')
            df = pd.read_sql_query(escaped_query, self.engine, )
            # Convert datetime objects to strings 
            for col in df.select_dtypes(include=['datetime64']).columns:
                df[col] = df[col].astype(str)
            # Convert nan to None 
            df = df.where(pd.notnull(df), None)
            return df
        except Exception as e:
            print(f"Error executing query {query}: {str(e)}")
            return None
        


    def process_sql_file(self, sql_file_path: str, output_file_path: str, format='json'):
        """Process SQL file and save results as JSON"""
        queries = self.extract_queries(sql_file_path)
        metadata = {
                'timestamp': datetime.now().isoformat(),
                'sql_file': sql_file_path,
                'query_count': len(queries)
        }
        query_results = [(query_info, self.execute_query(query_info['query']))
                            for query_info in queries]

        if format == 'json':
            self.query_results_to_json(query_results, output_file_path, metadata)
        elif format == 'md':
            self.query_results_to_md(query_results, output_file_path, metadata)

    def query_results_to_json(self, query_results,  output_file, metadata):
        """ Save DataFrame to JSON file """
        results = {'metadata': {**metadata}, 'results': []}
        
        for i, [query_info, query_data] in enumerate(query_results, 1):
            if query_data is None:
                continue
            query_result = query_data.to_dict(orient='records')
            results['results'].append({
                'query_id': i,
                'description': query_info['description'],
                'query': query_info['query'],
                'data': query_result,
                'row_count': len(query_result) if query_result else 0
            })
        
        # Save results to JSON file
        with open(output_file, 'w') as f:
            json.dump(results, f, indent=2)
    def _format_value(self, value):
        if isinstance(value, str):
            try:
                num = float(value)
                if num.is_integer():
                    return str(int(num))
                return f'{num:.2f}'
            except ValueError:
                pass
        return str(value)
    def query_results_to_md(self, query_results,  output_file, metadata):
        """
        """
        results = f'> Time: {metadata['timestamp']}\n'
        results += f'> File: {metadata['sql_file']}\n'
        results += f'> Query count: {metadata['query_count']}\n\n'
        
        for i, [query_info, query_data] in enumerate(query_results, 1):
            if query_data is None:
                continue
            df = query_data.copy()
            df = df.fillna('(NULL)')
            df = df.astype(str)

            md_table = f"## {query_info['description']}\n\n"
            query = query_info['query']#.replace('\n', '\n\n')
            md_table += f"SQL Query:\n\n```sql\n{query}\n```\n\n"

            header = '| ' + ' | '.join(df.columns) + ' |'
            align = '| ' + ' | '.join(['---' for _ in df.columns]) + ' |'
            
            rows = []
            for _, row in df.iterrows():
                formatted_row = [self._format_value(value) for value in row]
                rows.append('| ' + ' | '.join(formatted_row) + ' |')
            
            md_table += '\n'.join([header, align] + rows)
            md_table += '\n\n'

            results += md_table
            
        with open(output_file, 'w') as f:
            f.write(results)


if __name__ == "__main__":

    connection_string = "mysql+pymysql://dte2509:badpwd@localhost:3306/EmployeeDB"
    sql_files = ["oblig-2/oblig2-del2-spørringer.sql"]
    output_filenames = ["oblig2-del2-resultater"]
    # sql_files = ["oblig1-del2-spørringer.sql"]
    # output_filenames = ["oblig1-del2-resultater"]
    extensions = ['json', 'md']
    save_dir = Path('results')
    
    input_output_pairs = {sql: [save_dir / f"{filename}.{ext}" for ext in extensions] for sql, filename in zip(sql_files, output_filenames)} | {Path(sql).absolute(): [save_dir / f"{filename}.{ext}" for ext in extensions] for sql, filename in zip(sql_files, output_filenames)}
    
    print("Connecting to database...", end=' ')
    try:
        executor = SQLExecutor(connection_string)
    except Exception as e:
        print("ERROR")
        print(f"Could not connect to database: {e}")
        print("Exiting...")
        raise SystemExit(1)
    else:
        print("OK!")

    print("Processing SQL files:")
    for sql_file, output_files in input_output_pairs.items():
        for output_file in output_files:
            print(f"{sql_file} -> {output_file}...", end=' ')
            try:
                ext = output_file.suffix[1:]
                executor.process_sql_file(str(sql_file), str(output_file), format=ext)
            except Exception as e:
                print("ERROR")
                print(f"Could not process SQL file: {e}")
                print("Exiting...")
                raise SystemExit(1)
            else:
                print(f"DONE!")