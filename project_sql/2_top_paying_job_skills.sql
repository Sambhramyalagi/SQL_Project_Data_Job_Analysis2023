/*
    Question: What skills are required for the top-paying data analyst jobs?
    -- Use the top 10 highest_paying data analyst jobs from the first query.
    -- Add the specific skills required for these roles.
    Why? It provides a detailed look at which high_paying jobs demand certain skills,
        helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS (
        SELECT
                job_id,
                job_title,
                salary_year_avg,
                name AS company_name
        FROM 
                job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
        WHERE 
                job_title_short = 'Data Analyst' AND
                job_location LIKE '%India' AND
                salary_year_avg IS NOT NULL
        ORDER BY salary_year_avg DESC
        LIMIT 10
)
SELECT 
        top_paying_jobs.*,
        skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id;

/*
    Here are the insights from most demanded skill for high-paying jobs for 20
    Most Frequent Skills:
    SQL: Appears 5 times, making it the most sought-after skill.
    Oracle, Power BI, and MongoDB: Each appear 4 times, indicating high demand.
    Other Prominent Skills:
    AWS, Spark, and Python: Each show up 3 times.
    Databricks and Azure: Each appear 2 times.
*/