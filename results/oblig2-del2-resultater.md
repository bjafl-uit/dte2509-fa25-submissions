> Time: 2025-02-05T17:59:56.087051
> File: /home/bjafl/dev/dte2509-fa25-submissions/oblig-2/oblig2-del2-spørringer.sql
> Query count: 15

## 

SQL Query:

```sql
select date_format(now(), '%Y-%m-%dT%H:%i:%s+01') 
    as iso8601_current;
```

| iso8601_current |
| --- |
| 2025-02-05T17:59:56+01 |

## Oppgave 2

SQL Query:

```sql
select 
    ename, 
    sal, 
    comm, 
    job 
from emp
where coalesce(comm, 0) = 0;
```

| ename | sal | comm | job |
| --- | --- | --- | --- |
| Smith | 800 | (NULL) | Clerk |
| Jones | 2975 | (NULL) | Manager |
| Blake | 2850 | (NULL) | Manager |
| Clark | 2450 | (NULL) | Manager |
| Scott | 3000 | (NULL) | Analyst |
| King | 5000 | (NULL) | President |
| Turner | 1500 | 0 | Salesman |
| Adams | 1100 | (NULL) | Clerk |
| James | 950 | (NULL) | Clerk |
| Ford | 3000 | (NULL) | Analyst |
| Miller | 1300 | (NULL) | Clerk |

## Oppgave 3

SQL Query:

```sql
select ename, sal, comm, job 
from emp
where coalesce(comm, 0) <> 500;
```

| ename | sal | comm | job |
| --- | --- | --- | --- |
| Smith | 800 | (NULL) | Clerk |
| Allen | 1600 | 300 | Salesman |
| Jones | 2975 | (NULL) | Manager |
| Martin | 1250 | 1400 | Salesman |
| Blake | 2850 | (NULL) | Manager |
| Clark | 2450 | (NULL) | Manager |
| Scott | 3000 | (NULL) | Analyst |
| King | 5000 | (NULL) | President |
| Turner | 1500 | 0 | Salesman |
| Adams | 1100 | (NULL) | Clerk |
| James | 950 | (NULL) | Clerk |
| Ford | 3000 | (NULL) | Analyst |
| Miller | 1300 | (NULL) | Clerk |

## Oppgave 4

SQL Query:

```sql
select ename, job 
from emp
where job = (
    select job 
    from emp 
    where ename = 'Jones'
);
```

| ename | job |
| --- | --- |
| Jones | Manager |
| Blake | Manager |
| Clark | Manager |

## Oppgave 5

SQL Query:

```sql
select ename, job 
from emp
where 
    job in (
        select job 
        from emp 
        where deptno = 3
    )
    and deptno = 1;
```

| ename | job |
| --- | --- |
| Clark | Manager |
| Miller | Clerk |

## Oppgave 6

SQL Query:

```sql
select ename, job 
from emp
where 
    job not in (
        select job 
        from emp 
        where deptno = 3
    )
    and deptno = 1;
```

| ename | job |
| --- | --- |
| King | President |

## 

SQL Query:

```sql
select 
    ename,
    job, 
    deptno, 
    sal 
from emp
where (job, sal) in (
    select job, sal 
    from emp
    where ename = 'Ford'
);
```

| ename | job | deptno | sal |
| --- | --- | --- | --- |
| Scott | Analyst | 2 | 3000 |
| Ford | Analyst | 2 | 3000 |

## 

SQL Query:

```sql
select 
    ename, 
    job, 
    deptno, 
    sal 
from emp 
where 
    job = (
        select job
        from emp
        where ename = 'Jones'
    )
    or sal >= (
        select sal 
        from emp
        where ename = 'Ford'
    )
order by job, sal;
```

| ename | job | deptno | sal |
| --- | --- | --- | --- |
| Scott | Analyst | 2 | 3000 |
| Ford | Analyst | 2 | 3000 |
| Clark | Manager | 1 | 2450 |
| Blake | Manager | 3 | 2850 |
| Jones | Manager | 2 | 2975 |
| King | President | 1 | 5000 |

## Oppgave 9

SQL Query:

```sql
select ename, job 
from emp
where 
    job in (
        select job 
        from emp
        where deptno = (
            select deptno 
            from dept
            where dname = 'Sales'
        )
    )
    and deptno = 1
order by ename;
```

| ename | job |
| --- | --- |
| Clark | Manager |
| Miller | Clerk |

## Oppgave 10

SQL Query:

```sql
select ename, job, sal 
from emp
where sal = (
    select sal 
    from emp
    where ename = 'Scott'
)
union
select ename, job, sal 
from emp
where sal = (
    select sal
    from emp
    where ename = 'Ward'
);
```

| ename | job | sal |
| --- | --- | --- |
| Scott | Analyst | 3000 |
| Ford | Analyst | 3000 |
| Ward | Salesman | 1250 |
| Martin | Salesman | 1250 |

## Oppgave 11

SQL Query:

```sql
select ename, job 
from emp
where job in (
    select job 
    from emp
    where deptno = (
        select deptno 
        from dept
        where loc = 'Chicago'
    )
)
order by job;
```

| ename | job |
| --- | --- |
| Smith | Clerk |
| Adams | Clerk |
| James | Clerk |
| Miller | Clerk |
| Jones | Manager |
| Blake | Manager |
| Clark | Manager |
| Allen | Salesman |
| Ward | Salesman |
| Martin | Salesman |
| Turner | Salesman |

## Oppgave 12

SQL Query:

```sql
select 
    ename, 
    sal, 
    (sal/tot_sal)*100 as sal_percent
from (
    select 
        ename, 
        sal, 
        sum(sal) over() as tot_sal
    from emp
    group by ename, sal
) as emp_sal
order by sal_percent;
```

| ename | sal | sal_percent |
| --- | --- | --- |
| Smith | 800 | 2.76 |
| James | 950 | 3.27 |
| Adams | 1100 | 3.79 |
| Ward | 1250 | 4.31 |
| Martin | 1250 | 4.31 |
| Miller | 1300 | 4.48 |
| Turner | 1500 | 5.17 |
| Allen | 1600 | 5.51 |
| Clark | 2450 | 8.44 |
| Blake | 2850 | 9.82 |
| Jones | 2975 | 10.25 |
| Scott | 3000 | 10.34 |
| Ford | 3000 | 10.34 |
| King | 5000 | 17.23 |

