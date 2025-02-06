-- DTE2509 - Oblig 2 - Del 1 - Spørringer
-- UiT Norges arktiske universitet

-- Bjarte Flø Lode
-- 02.02.2025

use EmployeeDB;

-- Oppgave 1

-- Den følgende linjen hører helst til i en konfigurasjonsfil, men inkluderer
-- den her da jeg kjørte den for å sikre at tidssonen var riktig:
-- set time_zone = 'Europe/Oslo';

select date_format(now(), '%Y-%m-%dT%H:%i:%s+01') 
    as iso8601_current;

-- Oppgave 2
select 
    ename, 
    sal, 
    comm, 
    job 
from emp
where coalesce(comm, 0) = 0;

/*
Kommentar Oppgave 2: 
Oppgaven er ikke tydelig på hvordan en skal tolke hvem som ikke har provisjon og
hvem som har provisjon.  Det kan være naturlig å tenke at vi skal se på dem som
har provisjon NULL, da de ikke har provisjon, mens de som har 0 i provisjon kan
man tenke at de 'har provisjon' som en del av sin kontrakt, men ikke har tjent
provisjon enda. Jeg har valgt å inkludere 0 i provisjon, for å inkludere alle
som ikke har opptjent provisjon.
*/

-- Oppgave 3
select ename, sal, comm, job 
from emp
where coalesce(comm, 0) <> 500;

/* 
Kommentar Oppgave 3: 
Oppgaven ikke tydelig på hvordan null-verdier skal tolkes her. Resultattabell i
oppgaven har ikke inkludert null-verdier. Spørsmålet er å liste alle som ikke
har 500 i provisjon, og jeg tolker det som alle som ikke har verdien 500 i
provisjon, som inkluderer null-verdier.
*/

-- Oppgave 4
select ename, job 
from emp
where job = (
    select job 
    from emp 
    where ename = 'Jones'
);

-- Oppgave 5
select ename, job 
from emp
where 
    job in (
        select job 
        from emp 
        where deptno = 3
    )
    and deptno = 1;

-- Oppgave 6
select ename, job 
from emp
where 
    job not in (
        select job 
        from emp 
        where deptno = 3
    )
    and deptno = 1;

-- Oppgave 7

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

-- Opptage 8

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

-- Oppgave 9
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

-- Oppgave 10
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

-- Oppgave 11
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

-- Oppgave 12
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