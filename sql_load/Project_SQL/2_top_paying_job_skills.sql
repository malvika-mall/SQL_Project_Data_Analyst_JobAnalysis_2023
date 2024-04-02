/*--Question 2: What are the top paying Data Analyst Jobs and associated skills?
--Identify top 10 high paying jobs,
--Focus on job postings with salaries (remove null)
--Join skills_job_dim to link associated skill
*/

WITH top_paying_jobs AS(
	SELECT
		job_id,
		job_title,
		salary_year_avg,
		name AS company_name
	FROM
		job_postings_fact
	LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
	WHERE 
		job_title_short = 'Data Analyst' AND
		job_location ='Anywhere' AND
		salary_year_avg IS NOT NULL
	ORDER BY
		salary_year_avg DESC
	LIMIT 10
)
SELECT 
	top_paying_jobs.*, 
	skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY salary_year_avg DESC;
