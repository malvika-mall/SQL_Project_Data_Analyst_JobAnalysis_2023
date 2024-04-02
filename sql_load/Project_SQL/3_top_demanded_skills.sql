/* --Query 3: What are the mpst demanded skills for data analyst jobs?
-Join job_postings_fact table to skills table using Inner Join.
-Find top 5 most demanded skills
-find all job posting with these skills.
*/

SELECT 
	skills,
	COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short='Data Analyst'
GROUP BY
	Skills
ORDER BY demand_count DESC
LIMIT 5;