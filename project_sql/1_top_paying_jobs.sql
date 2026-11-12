/*
Question: What are the top-paying Data Scientist jobs?

- Identify the top 10 highest-paying Data Scientist roles available in the United Kingdom.
- Focus on job postings with specified salaries (exclude null salary values).
- Why? Highlights the highest-paying opportunities for Data Scientists and provides a starting point for understanding the roles and skills that offer strong earning potential.
*/

SELECT
job_id,
job_title,
job_location
job_schedule_type,
salary_year_avg,
job_posted_date,
name AS company_name
FROM
job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
job_title_short = 'Data Scientist' AND
job_location = 'United Kingdom' AND
salary_year_avg IS NOT NULL
ORDER BY
salary_year_avg DESC
LIMIT 10