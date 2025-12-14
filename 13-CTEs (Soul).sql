-- CTEs --
 
 WITH CTE_Example(Gender,avg_salary) AS 
 (
    SELECT gender, AVG(salary)
    FROM employee_demographics AS dem
    JOIN employee_salary AS sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT AVG(avg_salary)
FROM CTE_Example;

