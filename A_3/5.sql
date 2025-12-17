SELECT 
    e.EMPLOYEE_ID AS "Employee No.", 
    e.FIRST_NAME || ' ' || e.LAST_NAME AS "Employee Name", 
    e.SALARY AS "Salary", 
    e.HIRE_DATE AS "Hired Date", 
    d.DEPARTMENT_NAME AS "Name of the Department" 
FROM 
    EMPLOYEES e 
INNER JOIN 
    DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE 
    e.HIRE_DATE BETWEEN DATE '2001-01-01' AND DATE '2002-12-31'
ORDER BY 
    d.DEPARTMENT_NAME;

