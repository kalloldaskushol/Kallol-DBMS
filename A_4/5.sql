SELECT j.job_title,
       MAX(e.salary) AS "Max Salary"
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title
ORDER BY j.job_title;
