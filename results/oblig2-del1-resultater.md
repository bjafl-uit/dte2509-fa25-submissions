> Time: 2025-02-02T16:42:33.829619
> File: /home/bjafl/dev/dte2509-fa25-submissions/oblig-2/oblig2-del1-spørringer.sql
> Query count: 13

## Oppgave 1

SQL Query:

```sql
select ename, sal, comm from emp
where comm > sal * 0.25;
```

| ename | sal | comm |
| --- | --- | --- |
| Ward | 1250 | 500 |
| Martin | 1250 | 1400 |

## Oppgave 2

SQL Query:

```sql
select ename, (comm / sal) as "comm/sal", comm, sal from emp
where job = 'Salesman'
order by comm/sal desc;
```

| ename | comm/sal | comm | sal |
| --- | --- | --- | --- |
| Martin | 1.12 | 1400 | 1250 |
| Ward | 0.40 | 500 | 1250 |
| Allen | 0.19 | 300 | 1600 |
| Turner | 0 | 0 | 1500 |

## Oppgave 3

SQL Query:

```sql
select ename, sal, comm, 12 * (sal+comm) as sal_year from emp
where job = 'Salesman';
```

| ename | sal | comm | sal_year |
| --- | --- | --- | --- |
| Allen | 1600 | 300 | 22800 |
| Ward | 1250 | 500 | 21000 |
| Martin | 1250 | 1400 | 31800 |
| Turner | 1500 | 0 | 18000 |

## Oppgave 4

SQL Query:

```sql
select avg(sal) as avg_sal from emp
where job = 'Clerk';
```

| avg_sal |
| --- |
| 1037.50 |

## Oppgave 5

SQL Query:

```sql
select sum(sal) as tot_salesmen_sal, sum(comm) as tot_salesmen_comm from emp
where job = 'Salesman';
```

| tot_salesmen_sal | tot_salesmen_comm |
| --- | --- |
| 5600 | 2200 |

## Oppgave 6

SQL Query:

```sql
select count(comm) as count_has_comm from emp
where comm > 0;
```

| count_has_comm |
| --- |
| 3 |

## Oppgave 7

SQL Query:

```sql
select count(distinct job) as distinct_job_dept_3 from emp
where deptno = 3;
```

| distinct_job_dept_3 |
| --- |
| 3 |

## Oppgave 8

SQL Query:

```sql
select count(*) as emp_count_dept_3 from emp
where deptno = 3;
```

| emp_count_dept_3 |
| --- |
| 6 |

## Oppgave 9

SQL Query:

```sql
select deptno, round(avg(sal), 0) as avg_sal from emp 
group by deptno;
```

| deptno | avg_sal |
| --- | --- |
| 2 | 2175 |
| 3 | 1567 |
| 1 | 2917 |

## Oppgave 10

SQL Query:

```sql
select concat(dname, ' - ', loc) as Departments from dept;
```

| Departments |
| --- |
| Accounting - New York |
| Research - Dallas |
| Sales - Chicago |
| Operations - Boston |

## Oppgave 11

SQL Query:

```sql
select 
    ename, 
    job,
    case job 
        when 'Clerk' then 1
        when 'Salesman' then 2
        when 'Manager' then 3
        when 'Analyst' then 4
        when 'President' then 5
    end as job_class
from emp;
```

| ename | job | job_class |
| --- | --- | --- |
| Smith | Clerk | 1 |
| Allen | Salesman | 2 |
| Ward | Salesman | 2 |
| Jones | Manager | 3 |
| Martin | Salesman | 2 |
| Blake | Manager | 3 |
| Clark | Manager | 3 |
| Scott | Analyst | 4 |
| King | President | 5 |
| Turner | Salesman | 2 |
| Adams | Clerk | 1 |
| James | Clerk | 1 |
| Ford | Analyst | 4 |
| Miller | Clerk | 1 |

## Oppgave 12

SQL Query:

```sql
select substr(ename, 2) as name_part from emp;
```

| name_part |
| --- |
| mith |
| llen |
| ard |
| ones |
| artin |
| lake |
| lark |
| cott |
| ing |
| urner |
| dams |
| ames |
| ord |
| iller |

## Oppgave 13

SQL Query:

```sql
set lc_time_names = 'no_NO';
select date_format(curdate(), '%e. %M %Y') as date;
```

| date |
| --- |
| 2. februar 2025 |

