SELECT e.employee_id AS "Employee No",
       e.first_name || ' ' || e.last_name AS "Employee Name",
       d.department_name AS "Current Department",
       d2.department_name AS "Previous Department",
       jh.start_date AS "Previous Job Start Date",
       jh.end_date AS "Previous Job End Date"
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN job_history jh ON e.employee_id = jh.employee_id
JOIN departments d2 ON jh.department_id = d2.department_id
WHERE e.employee_id = :emp_id;
