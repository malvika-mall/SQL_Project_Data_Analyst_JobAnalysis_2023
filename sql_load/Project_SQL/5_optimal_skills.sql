/* Query 5: What are the optimal skills for data analyst roles?
-High demand and High paying skills
-Identify skills that are in high demand as well high paying.
*/

WITH skills_demand AS 
	(SELECT 
		skills_dim.skill_id,
	 	skills_dim.skills,
		COUNT(skills_job_dim.job_id) AS demand_count
	FROM
		job_postings_fact
	INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
	INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
	WHERE job_title_short='Data Analyst' AND job_work_from_home= True
	GROUP BY
		skills_dim.skill_id, skills_dim.skills
	), 
average_salary AS
	(SELECT 
		skills_job_dim.skill_id,
		ROUND(AVG(salary_year_avg),2) AS avg_salary
	FROM
		job_postings_fact
	INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
	INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
	WHERE job_title_short='Data Analyst' 
		 AND salary_year_avg IS NOT NULL
		 AND job_work_from_home= True
	GROUP BY
		skills_job_dim.skill_id
	)
	
SELECT
	skills_demand.skill_id,
	skills_demand.skills,
	demand_count,
	avg_salary
FROM
	skills_demand
INNER JOIN average_salary ON skills_demand.skill_id=average_salary.skill_id
ORDER BY 
	demand_count DESC,
	avg_salary DESC
LIMIT 25;
