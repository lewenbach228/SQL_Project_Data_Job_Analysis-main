/*
Question: What are the top-paying data Scientist jobs?
- Identify the top 10 highest-paying Data Scientist roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Scientists, offering insights into employment options and location flexibility.
*/

SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

/*
Here's the breakdown of the top data Scientist jobs in 2023:
Wide Salary Range: Top 10 paying data Scientist roles span from $300,000 to $550,000, indicating significant salary potential in the field.
Diverse Employers: Companies like Selby Jennings, Algo Capital Group, and Demandbase are among those offering high salaries, showing a broad interest across different industries.
Job Title Variety: There's a high diversity in job titles, from Staff Data Scientist to Head of Data Science, reflecting varied roles and specializations within data analytics.

RESULTS
=======
[
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "job_posted_date": "2023-08-16 16:05:16",
    "company_name": "Selby Jennings"
  },
  {
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "525000.0",
    "job_posted_date": "2023-09-01 19:24:02",
    "company_name": "Selby Jennings"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "job_id": 1742633,
    "job_title": "Head of Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "351500.0",
    "job_posted_date": "2023-07-12 03:07:31",
    "company_name": "Demandbase"
  },
  {
    "job_id": 551497,
    "job_title": "Head of Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "324000.0",
    "job_posted_date": "2023-05-26 22:04:44",
    "company_name": "Demandbase"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "job_posted_date": "2023-03-26 23:46:39",
    "company_name": "Teramind"
  },
  {
    "job_id": 1161630,
    "job_title": "Director of Data Science & Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "313000.0",
    "job_posted_date": "2023-08-23 22:03:48",
    "company_name": "Reddit"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "company_name": "Walmart"
  },
  {
    "job_id": 129924,
    "job_title": "Director of Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-01-21 11:09:36",
    "company_name": "Storm4"
  },
  {
    "job_id": 457991,
    "job_title": "Head of Battery Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-10-02 16:40:07",
    "company_name": "Lawrence Harvey"
  }
]
*/
