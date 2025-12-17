SELECT 
    e.employee_id AS employee_no,
    e.first_name || ' ' || e.last_name AS employee_name,
    e.salary,
    e.hire_date,
    d.department_name
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
WHERE e.salary >
      (SELECT AVG(e2.salary)
       FROM hr.employees e2
       JOIN hr.departments d2 
       ON e2.department_id = d2.department_id
       WHERE UPPER(d2.department_name) = 'SALES');



