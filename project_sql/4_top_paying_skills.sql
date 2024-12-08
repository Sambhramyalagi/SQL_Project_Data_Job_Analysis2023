/*
    Answer: What are the skills based on salary?
    -- Look at the average salary associated with each skill for Data Analyst positions
    -- Focuses on roles with specified salaries, reguardless of location
    -- Why? It reveals how different skills impact salary levels for Data Analysts and
        helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
        skills,
        ROUND (AVG (salary_year_avg), 0)AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
        job_title_short = 'Data Analyst' AND
        job_location LIKE '%India' AND
        salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;

/*

High-paying skills revolve around data technologies and programming: Skills such as PySpark, GitLab, PostgreSQL, 
and MySQL are highly valued, with an average salary of around $165,000. These tools are crucial in data engineering,
database management, and software development.

Big Data and Cloud technologies are in demand: Tools like Neo4j, Airflow, Kafka, and Databricks show significant 
earning potential, suggesting that expertise in big data technologies and cloud computing can lead to high-paying 
roles.

Data analytics and visualization tools also offer good salaries: Skills related to data analysis, such as Pandas,
DAX, and Matplotlib, although slightly lower in salary, still provide lucrative opportunities with an average salary
around $110,000 to $120,000.

*/