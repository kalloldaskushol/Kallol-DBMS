SELECT
  EMPLOYEE_ID   AS "Employee No.",
  (FIRST_NAME || ' ' || LAST_NAME)  AS "Employee Name",
  SALARY    AS "Salary",
  HIRE_DATE   AS "Hired Date",
  DEPARTMENT_ID     AS "Department ID"
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;