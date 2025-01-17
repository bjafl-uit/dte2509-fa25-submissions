-- DTE2509 - Oblig 1 - Del 1 - Spørringer
-- UiT Norges arktiske universitet

-- Bjarte Flø Lode
-- 17.01.2025


USE EmployeeDB;

-- Oppgave 1
SELECT * FROM dept;

-- Oppgave 2
SELECT * FROM emp;

-- Oppgave 3
SELECT job FROM emp;

-- Oppgave 4
SELECT DISTINCT job FROM emp;

-- Oppgave 5
SELECT dname as Department FROM dept;

-- Oppgave 6
SELECT emp.* FROM emp
JOIN dept ON emp.deptno = dept.deptno
WHERE dept.dname = 'Sales';

-- Oppgave 7
SELECT ename, empno, deptno FROM emp
WHERE job = 'Clerk';

-- Oppgave 8
SELECT dname, deptno FROM dept
WHERE deptno > 2;

-- Oppgave 9
SELECT ename, sal, comm FROM emp
WHERE comm > sal;

-- Oppgave 10
SELECT ename, sal, deptno FROM emp
WHERE job = 'Salesman' 
    AND deptno = 3 
    AND sal >= 1500;

-- Oppgave 11
SELECT ename, sal, job FROM emp
WHERE job = 'Manager' OR sal > 3000;

-- Oppgave 12
SELECT * FROM emp
WHERE job = 'Manager' OR (deptno = 1 AND job = 'Clerk');

-- Oppgave 13
SELECT ename, job, deptno FROM emp
WHERE job = 'Manager' AND deptno <> 3;