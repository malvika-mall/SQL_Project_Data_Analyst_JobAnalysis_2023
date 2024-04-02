
--January
CREATE TABLE january_jobs AS
    Select *
    From job_postings_fact
    Where EXTRACT (Month From job_posted_date) =1;

--Febrauary
CREATE TABLE febrauary_jobs AS
    Select *
    From job_postings_fact
    Where EXTRACT (Month From job_posted_date) =2;

--March
CREATE TABLE january_jobs AS
    Select *
    From job_postings_fact
    Where EXTRACT (Month From job_posted_date) =3;