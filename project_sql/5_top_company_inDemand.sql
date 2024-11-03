/*
Question: Which companies are offering the most Data Scientist jobs and what job channels do they use the most?
- Identify the top 10 companies that have the highest number of Data Scientist job postings available remotely
- Focuses on job postings that have specified channels (i.e., non-null values for job_via)
- BONUS: Include the average salary for Data Scientist roles at these companies
- Why? This will provide insights into the job market for Data Scientists, showing which companies are actively hiring and through which channels, helping job seekers target their applications effectively.
*/

SELECT
    name AS company_name,
    COUNT(job_id) AS job_count,
    job_via,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
GROUP BY
    company_name, job_via
ORDER BY
    job_count DESC
LIMIT 10;


-- [
--   {
--     "company_name": "Harnham",
--     "job_count": "34",
--     "job_via": "via LinkedIn",
--     "average_salary": "170441.176470588235"
--   },
--   {
--     "company_name": "Get It Recruit - Information Technology",
--     "job_count": "24",
--     "job_via": "via Get.It",
--     "average_salary": "127854.166666666667"
--   },
--   {
--     "company_name": "Patterned Learning AI",
--     "job_count": "15",
--     "job_via": "via ZipRecruiter",
--     "average_salary": "66666.666666666667"
--   },
--   {
--     "company_name": "Insight Global",
--     "job_count": "12",
--     "job_via": "via LinkedIn",
--     "average_salary": "128208.333333333333"
--   },
--   {
--     "company_name": "Motion Recruitment",
--     "job_count": "11",
--     "job_via": "via Motion Recruitment",
--     "average_salary": "146363.636363636364"
--   },
--   {
--     "company_name": "CyberCoders",
--     "job_count": "10",
--     "job_via": "via Indeed",
--     "average_salary": "146250.000000000000"
--   },
--   {
--     "company_name": "Intelletec",
--     "job_count": "10",
--     "job_via": "via LinkedIn",
--     "average_salary": "170750.000000000000"
--   },
--   {
--     "company_name": "Get It Recruit - Transportation",
--     "job_count": "8",
--     "job_via": "via Get.It",
--     "average_salary": "119500.000000000000"
--   },
--   {
--     "company_name": "CVS Health",
--     "job_count": "8",
--     "job_via": "via LinkedIn",
--     "average_salary": "143437.500000000000"
--   },
--   {
--     "company_name": "Averity",
--     "job_count": "7",
--     "job_via": "via LinkedIn",
--     "average_salary": "208928.571428571429"
--   }
-- ]