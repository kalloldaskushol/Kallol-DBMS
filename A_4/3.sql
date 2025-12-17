SELECT e.employee_id AS "Employee No",
       e.first_name || ' ' || e.last_name AS "Employee Name",
       d.department_name AS "Current Department",
       MONTHS_BETWEEN(SYSDATE, e.hire_date) AS "Total Job Length (Months)"
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.employee_id = :emp_id;
