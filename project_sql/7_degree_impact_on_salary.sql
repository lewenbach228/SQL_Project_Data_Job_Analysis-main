/*
Question: Do Data Scientist positions without a degree requirement impact salary?
- Compare the average salaries of Data Scientist positions with and without degree requirements
- Focuses on job postings that have specified salaries (remove nulls)
- Why? To understand if educational requirements influence compensation for Data Scientist roles.
*/

SELECT
    CASE
        WHEN job_no_degree_mention = true THEN 'No Degree Required'
        ELSE 'Degree Required'
    END AS degree_status,
    AVG(salary_year_avg) AS average_salary
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND 
    salary_year_avg IS NOT NULL
GROUP BY
    job_no_degree_mention
ORDER BY
    average_salary DESC;


-- [
--   {
--     "degree_status": "Degree Required",
--     "average_salary": "136142.274214031493"
--   },
--   {
--     "degree_status": "No Degree Required",
--     "average_salary": "126516.011450381679"
--   }
-- ]