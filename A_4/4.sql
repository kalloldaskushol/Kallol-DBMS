SELECT d.department_name,
       MIN(e.salary) AS "Minimum Salary"
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY d.department_name;
