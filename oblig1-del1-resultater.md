# DTE2509 - Oblig 1 - Del 1 - Spørringer

> UiT Norges arktiske universitet
>
> Bjarte Flø Lode
> 17.01.2025
>
> File: oblig1-del1-spørringer.sql
> Query count: 13

Resultater fra kjørte spørringer.

## Oppgave 1

SQL Query:

```sql
SELECT * FROM dept;
```

| deptno | dname | loc |
| --- | --- | --- |
| 1 | Accounting | New York |
| 2 | Research | Dallas |
| 3 | Sales | Chicago |
| 4 | Operations | Boston |

## Oppgave 2

SQL Query:

```sql
SELECT * FROM emp;
```

| empno | ename | job | mgr | hiredate | sal | comm | deptno |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 7369 | Smith | Clerk | 7902.0 | 1980-12-17 | 800.0 |  | 2 |
| 7499 | Allen | Salesman | 7698.0 | 1981-02-20 | 1600.0 | 300.0 | 3 |
| 7521 | Ward | Salesman | 7698.0 | NaT | 1250.0 | 500.0 | 3 |
| 7566 | Jones | Manager | 7839.0 | NaT | 2975.0 |  | 2 |
| 7654 | Martin | Salesman | 7698.0 | NaT | 1250.0 | 1400.0 | 3 |
| 7698 | Blake | Manager | 7839.0 | NaT | 2850.0 |  | 3 |
| 7782 | Clark | Manager | 7839.0 | NaT | 2450.0 |  | 1 |
| 7788 | Scott | Analyst | 7566.0 | NaT | 3000.0 |  | 2 |
| 7839 | King | President |  | NaT | 5000.0 |  | 1 |
| 7844 | Turner | Salesman | 7698.0 | NaT | 1500.0 | 0.0 | 3 |
| 7876 | Adams | Clerk | 7788.0 | NaT | 1100.0 |  | 2 |
| 7900 | James | Clerk | 7698.0 | NaT | 950.0 |  | 3 |
| 7902 | Ford | Analyst | 7566.0 | NaT | 3000.0 |  | 2 |
| 7934 | Miller | Clerk | 7782.0 | NaT | 1300.0 |  | 1 |

## Oppgave 3

SQL Query:

```sql
SELECT job FROM emp;
```

| job |
| --- |
| Clerk |
| Salesman |
| Salesman |
| Manager |
| Salesman |
| Manager |
| Manager |
| Analyst |
| President |
| Salesman |
| Clerk |
| Clerk |
| Analyst |
| Clerk |

## Oppgave 4

SQL Query:

```sql
SELECT DISTINCT job FROM emp;
```

| job |
| --- |
| Clerk |
| Salesman |
| Manager |
| Analyst |
| President |

## Oppgave 5

SQL Query:

```sql
SELECT dname as Department FROM dept;
```

| Department |
| --- |
| Accounting |
| Research |
| Sales |
| Operations |

## Oppgave 6

SQL Query:

```sql
SELECT emp.* FROM emp JOIN dept ON emp.deptno = dept.deptno WHERE dept.dname = 'Sales';
```

| empno | ename | job | mgr | hiredate | sal | comm | deptno |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 7499 | Allen | Salesman | 7698 | 1981-02-20 | 1600.0 | 300.0 | 3 |
| 7521 | Ward | Salesman | 7698 | NaT | 1250.0 | 500.0 | 3 |
| 7654 | Martin | Salesman | 7698 | NaT | 1250.0 | 1400.0 | 3 |
| 7698 | Blake | Manager | 7839 | NaT | 2850.0 |  | 3 |
| 7844 | Turner | Salesman | 7698 | NaT | 1500.0 | 0.0 | 3 |
| 7900 | James | Clerk | 7698 | NaT | 950.0 |  | 3 |

## Oppgave 7

SQL Query:

```sql
SELECT ename, empno, deptno FROM emp WHERE job = 'Clerk';
```

| ename | empno | deptno |
| --- | --- | --- |
| Smith | 7369 | 2 |
| Adams | 7876 | 2 |
| James | 7900 | 3 |
| Miller | 7934 | 1 |

## Oppgave 8

SQL Query:

```sql
SELECT dname, deptno FROM dept WHERE deptno > 2;
```

| dname | deptno |
| --- | --- |
| Sales | 3 |
| Operations | 4 |

## Oppgave 9

SQL Query:

```sql
SELECT ename, sal, comm FROM emp WHERE comm > sal;
```

| ename | sal | comm |
| --- | --- | --- |
| Martin | 1250.0 | 1400.0 |

## Oppgave 10

SQL Query:

```sql
SELECT ename, sal, deptno FROM emp WHERE job = 'Salesman'      AND deptno = 3      AND sal >= 1500;
```

| ename | sal | deptno |
| --- | --- | --- |
| Allen | 1600.0 | 3 |
| Turner | 1500.0 | 3 |

## Oppgave 11

SQL Query:

```sql
SELECT ename, sal, job FROM emp WHERE job = 'Manager' OR sal > 3000;
```

| ename | sal | job |
| --- | --- | --- |
| Jones | 2975.0 | Manager |
| Blake | 2850.0 | Manager |
| Clark | 2450.0 | Manager |
| King | 5000.0 | President |

## Oppgave 12

SQL Query:

```sql
SELECT * FROM emp WHERE job = 'Manager' OR (deptno = 1 AND job = 'Clerk');
```

| empno | ename | job | mgr | hiredate | sal | comm | deptno |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 7566 | Jones | Manager | 7839 |  | 2975.0 |  | 2 |
| 7698 | Blake | Manager | 7839 |  | 2850.0 |  | 3 |
| 7782 | Clark | Manager | 7839 |  | 2450.0 |  | 1 |
| 7934 | Miller | Clerk | 7782 |  | 1300.0 |  | 1 |

## Oppgave 13

SQL Query:

```sql
SELECT ename, job, deptno FROM emp WHERE job = 'Manager' AND deptno <> 3;
```

| ename | job | deptno |
| --- | --- | --- |
| Jones | Manager | 2 |
| Clark | Manager | 1 |

