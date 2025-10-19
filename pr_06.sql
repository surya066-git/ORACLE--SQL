
-- 12. Give the name and location of departments 
-- where the average salary is greater than 2000. [dname, loc]
SELECT d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY d.dname, d.loc
HAVING AVG(e.sal) >= 2000;

SELECT d.dname, d.loc
FROM emp e join dept d on e.deptno = d.deptno
GROUP BY d.dname, d.loc
HAVING AVG(e.sal) >= 2000;

-- 13. Give the salary categories where we can find exactly 3 employees. [category]
SELECT sc.category
FROM emp e, sal_cat sc
WHERE e.sal BETWEEN sc.lowest_sal AND sc.highest_sal
GROUP BY sc.category
HAVING COUNT(*) = 3;

-- 14. Give the salary categories 
-- where the employees in this category work on the same department. [category]
SELECT sc.category
FROM emp e, sal_cat sc
WHERE e.sal BETWEEN sc.lowest_sal AND sc.highest_sal
GROUP BY sc.category
HAVING COUNT(DISTINCT e.deptno) = 1;

-- 15. List the department number, department name and location for the departments 
-- having an employee with salary category 1. (deptno, dname, loc)
SELECT d.deptno, d.dname, d.loc
FROM emp e, dept d, sal_cat sc
WHERE  e.deptno = d.deptno AND e.sal BETWEEN sc.lowest_sal AND sc.highest_sal AND sc.category = 1
GROUP BY d.deptno, d.dname, d.loc
HAVING COUNT(*) = 1;

-- 16. List the department number, department name and location for the departments 
-- having at least two employees with salary category 1. (deptno, dname, loc)
SELECT d.deptno, d.dname, d.loc
FROM emp e, dept d, sal_cat sc
WHERE  e.deptno = d.deptno AND e.sal BETWEEN sc.lowest_sal AND sc.highest_sal AND sc.category = 1
GROUP BY d.deptno, d.dname, d.loc
HAVING COUNT(*) > 1;


