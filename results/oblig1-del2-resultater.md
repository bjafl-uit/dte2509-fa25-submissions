> Time: 2025-01-26T13:25:35.960938
> File: oblig1-del2-spørringer.sql
> Query count: 13

## Oppgave 14

SQL Query:

```sql
SELECT *  FROM emp WHERE deptno = 1  AND job NOT IN ('Clerk', 'Manager');
```

| empno | ename | job | mgr | hiredate | sal | comm | deptno |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 7839 | King | President |  |  | 5000.0 |  | 1 |

## Oppgave 15

SQL Query:

```sql
SELECT *  FROM emp WHERE sal BETWEEN 1200 AND 1300;
```

| empno | ename | job | mgr | hiredate | sal | comm | deptno |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 7521 | Ward | Salesman | 7698 |  | 1250.0 | 500.0 | 3 |
| 7654 | Martin | Salesman | 7698 |  | 1250.0 | 1400.0 | 3 |
| 7934 | Miller | Clerk | 7782 |  | 1300.0 |  | 1 |

## Oppgave 16

SQL Query:

```sql
SELECT ename, job, deptno  FROM emp WHERE job IN ('Salesman', 'Clerk', 'Analyst');
```

| ename | job | deptno |
| --- | --- | --- |
| Smith | Clerk | 2 |
| Allen | Salesman | 3 |
| Ward | Salesman | 3 |
| Martin | Salesman | 3 |
| Scott | Analyst | 2 |
| Turner | Salesman | 3 |
| Adams | Clerk | 2 |
| James | Clerk | 3 |
| Ford | Analyst | 2 |
| Miller | Clerk | 1 |

## Oppgave 17

SQL Query:

```sql
SELECT ename, job, sal  FROM emp WHERE sal NOT BETWEEN 1200 AND 1300;
```

| ename | job | sal |
| --- | --- | --- |
| Smith | Clerk | 800.0 |
| Allen | Salesman | 1600.0 |
| Jones | Manager | 2975.0 |
| Blake | Manager | 2850.0 |
| Clark | Manager | 2450.0 |
| Scott | Analyst | 3000.0 |
| King | President | 5000.0 |
| Turner | Salesman | 1500.0 |
| Adams | Clerk | 1100.0 |
| James | Clerk | 950.0 |
| Ford | Analyst | 3000.0 |

## Oppgave 18

SQL Query:

```sql
SELECT ename, job, deptno  FROM emp WHERE job NOT IN ('Salesman', 'Clerk', 'Analyst');
```

| ename | job | deptno |
| --- | --- | --- |
| Jones | Manager | 2 |
| Blake | Manager | 3 |
| Clark | Manager | 1 |
| King | President | 1 |

## Oppgave 19

SQL Query:

```sql
SELECT ename, job, deptno  FROM emp WHERE ename LIKE 'M%';
```

| ename | job | deptno |
| --- | --- | --- |
| Martin | Salesman | 3 |
| Miller | Clerk | 1 |

## Oppgave 20

SQL Query:

```sql
SELECT ename, job, deptno  FROM emp WHERE ename LIKE 'AL%n';
```

| ename | job | deptno |
| --- | --- | --- |
| Allen | Salesman | 3 |

## Oppgave 21

SQL Query:

```sql
SELECT sal, ename, deptno  FROM emp WHERE deptno = 3 ORDER BY sal;
```

| sal | ename | deptno |
| --- | --- | --- |
| 950.0 | James | 3 |
| 1250.0 | Ward | 3 |
| 1250.0 | Martin | 3 |
| 1500.0 | Turner | 3 |
| 1600.0 | Allen | 3 |
| 2850.0 | Blake | 3 |

## Oppgave 22

SQL Query:

```sql
SELECT sal, ename, deptno  FROM emp WHERE deptno = 3 ORDER BY sal DESC;
```

| sal | ename | deptno |
| --- | --- | --- |
| 2850.0 | Blake | 3 |
| 1600.0 | Allen | 3 |
| 1500.0 | Turner | 3 |
| 1250.0 | Ward | 3 |
| 1250.0 | Martin | 3 |
| 950.0 | James | 3 |

## Oppgave 23

SQL Query:

```sql
SELECT ename, job, sal  FROM emp ORDER BY job, sal DESC;
```

| ename | job | sal |
| --- | --- | --- |
| Scott | Analyst | 3000.0 |
| Ford | Analyst | 3000.0 |
| Miller | Clerk | 1300.0 |
| Adams | Clerk | 1100.0 |
| James | Clerk | 950.0 |
| Smith | Clerk | 800.0 |
| Jones | Manager | 2975.0 |
| Blake | Manager | 2850.0 |
| Clark | Manager | 2450.0 |
| King | President | 5000.0 |
| Allen | Salesman | 1600.0 |
| Turner | Salesman | 1500.0 |
| Ward | Salesman | 1250.0 |
| Martin | Salesman | 1250.0 |

## Oppgave 24

SQL Query:

```sql
SELECT emp.ename, dept.loc  FROM emp JOIN dept      ON emp.deptno = dept.deptno WHERE ename = 'Allen';
```

| ename | loc |
| --- | --- |
| Allen | Chicago |

## Oppgave 25

SQL Query:

```sql
SELECT dept.deptno, dept.dname, emp.job, emp.ename FROM dept LEFT JOIN emp     ON dept.deptno = emp.deptno WHERE dept.deptno IN (3, 4);
```

| deptno | dname | job | ename |
| --- | --- | --- | --- |
| 3 | Sales | Clerk | James |
| 3 | Sales | Salesman | Turner |
| 3 | Sales | Manager | Blake |
| 3 | Sales | Salesman | Martin |
| 3 | Sales | Salesman | Ward |
| 3 | Sales | Salesman | Allen |
| 4 | Operations |  |  |

## Oppgave 26

SQL Query:

```sql
SELECT dept.deptno, dept.dname, dept.loc FROM dept LEFT JOIN emp     ON dept.deptno = emp.deptno WHERE dept.deptno IN (3, 4) AND emp.deptno IS NULL;
```

| deptno | dname | loc |
| --- | --- | --- |
| 4 | Operations | Boston |

