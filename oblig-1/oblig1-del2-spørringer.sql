-- DTE2509 - Oblig 1 - Del 1 - Spørringer
-- UiT Norges arktiske universitet

-- Bjarte Flø Lode
-- 17.01.2025

-- Oppgave 14
SELECT * 
FROM emp
WHERE deptno = 1 
AND job NOT IN ('Clerk', 'Manager');

-- Oppgave 15
SELECT * 
FROM emp
WHERE sal BETWEEN 1200 AND 1300;

-- Oppgave 16
SELECT ename, job, deptno 
FROM emp
WHERE job IN ('Salesman', 'Clerk', 'Analyst');

-- Oppgave 17
SELECT ename, job, sal 
FROM emp
WHERE sal NOT BETWEEN 1200 AND 1300;

-- Oppgave 18
SELECT ename, job, deptno 
FROM emp
WHERE job NOT IN ('Salesman', 'Clerk', 'Analyst');

-- Oppgave 19
SELECT ename, job, deptno 
FROM emp
WHERE ename LIKE 'M%';

-- Oppgave 20
SELECT ename, job, deptno 
FROM emp
WHERE ename LIKE 'AL%n';

-- Oppgave 21
SELECT sal, ename, deptno 
FROM emp
WHERE deptno = 3
ORDER BY sal;

-- Oppgave 22
SELECT sal, ename, deptno 
FROM emp
WHERE deptno = 3
ORDER BY sal DESC;

-- Oppgave 23
SELECT ename, job, sal 
FROM emp
ORDER BY job, sal DESC;

-- Oppgave 24
SELECT emp.ename, dept.loc 
FROM emp
JOIN dept 
    ON emp.deptno = dept.deptno
WHERE ename = 'Allen';

-- Oppgave 25
SELECT dept.deptno, dept.dname, emp.job, emp.ename
FROM dept
LEFT JOIN emp
    ON dept.deptno = emp.deptno
WHERE dept.deptno IN (3, 4);

-- Oppgave 26
SELECT dept.deptno, dept.dname, dept.loc
FROM dept
LEFT JOIN emp
    ON dept.deptno = emp.deptno
WHERE dept.deptno IN (3, 4)
AND emp.deptno IS NULL;