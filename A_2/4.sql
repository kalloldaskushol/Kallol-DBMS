SELECT
  EMPLOYEE_ID   AS "Employee No.",
  (FIRST_NAME || ' ' || LAST_NAME)  AS "Employee Name",
  SALARY    AS "Salary",
  HIRE_DATE   AS "Hired Date"
FROM EMPLOYEES
WHERE HIRE_DATE > TO_DATE('01-JAN-01','DD-MON-RR');