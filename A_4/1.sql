SELECT e.employee_id AS "Employee No",
       e.first_name || ' ' || e.last_name AS "Employee Name",
       e.salary,
       e.hire_date,
       d.department_name AS "Department Name",
       j.job_title AS "Current Job"
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN jobs j ON e.job_id = j.job_id
WHERE d.department_name = 'Marketing';
