/*
Question: What are the top-paying skills for Data Scientists?

- Calculate the average salary associated with each skill for Data Scientist positions.
- Focus on job postings with specified salaries, regardless of location.
- Why? Reveals how different skills relate to salary levels and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
skills,
ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
job_title_short = 'Data Scientist' 
AND salary_year_avg IS NOT NULL
AND job_work_from_home = True 
GROUP BY
skills
ORDER BY
avg_salary DESC
LIMIT 30;

/*
Insights:
- GDPR ranks as the highest-paying skill, with an average salary of 217,738, followed by Golang at 208,750.
- Specialised technologies such as OpenCV, Neo4j, DataRobot and Solidity feature among the highest-paying skills.
- Programming languages including Golang, C, Go, Rust, Julia and Scala highlight the value of software development skills.
- Data infrastructure tools such as DynamoDB, Redis, Cassandra, Airflow and BigQuery also feature prominently.
- Business intelligence tools such as MicroStrategy, Qlik and Looker demonstrate the importance of analytics and reporting capabilities.
- AI-related technologies such as DataRobot, Watson and Hugging Face also appear in the top 30.
- Why? These findings suggest that high-paying Data Scientist roles can reward a combination of programming, specialised technical knowledge, data infrastructure and analytical capabilities.
*/