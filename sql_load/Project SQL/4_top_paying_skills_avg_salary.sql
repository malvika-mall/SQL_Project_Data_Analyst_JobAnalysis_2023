/* --Query 4: What are the top paying skills for Data Analyst roles?
-Look at average salary associated with each skills.
-Join job_postings_fact with skills_job_dim
*/


SELECT 
	skills,
	ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short='Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY
	Skills
ORDER BY avg_salary DESC
LIMIT 25;