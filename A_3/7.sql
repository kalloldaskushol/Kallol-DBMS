SELECT 
    e.EMPLOYEE_ID AS "Employee No.", 
    e.FIRST_NAME || ' ' || e.LAST_NAME AS "Employee Name", 
    e.SALARY AS "Salary", 
    e.HIRE_DATE AS "Hired Date", 
    d.DEPARTMENT_NAME AS "Name of the Department" 
FROM 
    EMPLOYEES e
JOIN 
    DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN 
    JOBS j 
    ON e.JOB_ID = j.JOB_ID
WHERE 
    UPPER(j.JOB_TITLE) LIKE '%CLERK%'
ORDER BY 
    d.DEPARTMENT_NAME;
