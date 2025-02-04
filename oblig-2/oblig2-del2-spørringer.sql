-- DTE2509 - Oblig 2 - Del 1 - Spørringer
-- UiT Norges arktiske universitet

-- Bjarte Flø Lode
-- 02.02.2025

use EmployeeDB;

-- Oppgave 1

set time_zone = 'Europe/Oslo';
select date_format(now(), '%Y-%m-%dT%H:%i:%s+01') as "iso8601_current";

-- Oppgave 2
select ename, sal, comm, job from emp
    where comm is null or comm = 0;

-- Oppgave 3
select ename, sal, comm, job from emp
    where comm <> 500;

-- Oppgave 4
select ename, job from emp
    where job = (
        select job from emp 
            where ename = 'Jones'
    );

-- Oppgave 5
select ename, job from emp
    where job in (
        select job from emp 
            where deptno = 3
    )
    and deptno = 1;

-- Oppgave 6
select ename, job from emp
    where job not in (
        select job from emp 
            where deptno = 3
    )
    and deptno = 1;

-- Oppgave 7

select ename, job, deptno, sal from emp
    where (job, sal) in (
        select job, sal from emp
            where ename = 'Ford'
    );
