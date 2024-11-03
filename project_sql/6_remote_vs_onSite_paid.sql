/*
Question: Are remote Data Scientist job offers better paid?
- Compare the average salaries of remote vs. on-site Data Scientist positions
- Focuses on job postings that have specified salaries (remove nulls)
- Why? To provide insights into the financial benefits of remote work opportunities in the Data Science field.
*/

SELECT
    CASE
        WHEN job_work_from_home = true THEN 'Remote'
        ELSE 'On-Site'
    END AS job_location,
    AVG(salary_year_avg) AS average_salary
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND 
    salary_year_avg IS NOT NULL
GROUP BY
    job_work_from_home
ORDER BY
    average_salary DESC;


-- [
--   {
--     "job_location": "Remote",
--     "average_salary": "144398.250196747114"
--   },
--   {
--     "job_location": "On-Site",
--     "average_salary": "134306.564273640157"
--   }
-- ]