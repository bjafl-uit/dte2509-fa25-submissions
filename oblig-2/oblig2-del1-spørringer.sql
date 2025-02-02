-- DTE2509 - Oblig 2 - Del 1 - Spørringer
-- UiT Norges arktiske universitet

-- Bjarte Flø Lode
-- 02.02.2025

-- Oppgave 1
select ename, sal, comm from emp
where comm > sal * 0.25;

-- Oppgave 2
select ename, (comm / sal) as "comm/sal", comm, sal from emp
where job = 'Salesman'
order by comm/sal desc;

-- Oppgave 3
select ename, sal, comm, 12 * (sal+comm) as sal_year from emp
where job = 'Salesman';

-- Oppgave 4
select avg(sal) as avg_sal from emp
where job = 'Clerk';

-- Oppgave 5
select sum(sal) as tot_salesmen_sal, sum(comm) as tot_salesmen_comm from emp
where job = 'Salesman';

-- Oppgave 6
select count(comm) as count_has_comm from emp
where comm > 0;

-- Oppgave 7
select count(distinct job) as distinct_job_dept_3 from emp
where deptno = 3;

-- Oppgave 8
select count(*) as emp_count_dept_3 from emp
where deptno = 3;

-- Oppgave 9
select deptno, round(avg(sal), 0) as avg_sal from emp 
group by deptno;

-- Oppgave 10
select concat(dname, ' - ', loc) as Departments from dept;

-- Oppgave 11
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

-- Oppgave 12
select substr(ename, 2) as name_part from emp;

-- Oppgave 13
set lc_time_names = 'no_NO';
select date_format(curdate(), '%e. %M %Y') as date;