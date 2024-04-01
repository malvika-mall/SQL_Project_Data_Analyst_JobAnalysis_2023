/*--Question 1: What are the top paying Data Analyst Jobs?
--Identify top 10 high paying jobs,
--Focus on job postings with salaries (remove null)
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location ='Anywhere' AND
    salary_year_avg IS NOT NULL;

