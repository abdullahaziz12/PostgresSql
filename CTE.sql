-- Query 1: Show every employee alongside their department's max salary.
-- CTE computes max salary per dept, then joined back to every employee row
-- (so every employee sees the max for their own department, not just the top earner).
WITH max_salary AS (
    SELECT dept, MAX(salary) AS max_dept_salary 
    FROM bank 
    GROUP BY dept
)
SELECT b.name, b.surname, b.salary, m.max_dept_salary
FROM bank b
JOIN max_salary m ON b.dept = m.dept;


-- Query 2: Same CTE, but now filtered with WHERE so only the actual
-- top earner(s) of each department show up (their salary equals the dept max).
WITH max_salary AS (
    SELECT dept, MAX(salary) AS max_dept_salary 
    FROM bank 
    GROUP BY dept
)
SELECT b.name, b.surname, b.dept, b.salary, m.max_dept_salary
FROM bank b
JOIN max_salary m ON b.dept = m.dept
WHERE b.salary = m.max_dept_salary;


-- Query 3: Extended version of Query 2 -- CTE now also computes the average
-- salary per department, so the top earner's row also shows how their salary
-- compares to their department's average.
WITH max_salary AS (
    SELECT dept, AVG(salary) AS avg_salary, MAX(salary) AS max_dept_salary 
    FROM bank 
    GROUP BY dept
)
SELECT b.name, b.surname, b.dept, b.salary, m.avg_salary, m.max_dept_salary
FROM bank b
JOIN max_salary m ON b.dept = m.dept
WHERE b.salary = m.max_dept_salary;