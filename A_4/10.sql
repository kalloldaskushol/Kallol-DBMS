SELECT e.employee_id AS "Employee No",
       e.first_name || ' ' || e.last_name AS "Employee Name",
       e.salary,
       e.hire_date,
       d.department_name,
       j.job_title
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary >
      (SELECT AVG(e2.salary)
       FROM employees e2
       JOIN departments d2 ON e2.department_id = d2.department_id
       WHERE d2.department_name IN ('Sales', 'Marketing'));
