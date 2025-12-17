SELECT
  EMPLOYEE_ID   AS "Employee No.",
  (FIRST_NAME || ' ' || LAST_NAME)  AS "Employee Name",
  SALARY    AS "Salary",
  DEPARTMENT_ID     AS "Department ID"
FROM EMPLOYEES;