SELECT e.employee_id AS "Employee No",
       e.first_name || ' ' || e.last_name AS "Employee Name",
       e.salary,
       e.hire_date,
       d.department_name AS "Current Department"
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.employee_id IN (
     SELECT employee_id
     FROM job_history
     WHERE start_date BETWEEN DATE '1996-01-01' AND DATE '2006-12-31'
        OR end_date BETWEEN DATE '1996-01-01' AND DATE '2006-12-31'
);
