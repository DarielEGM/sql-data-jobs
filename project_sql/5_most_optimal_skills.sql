/*
**Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill) for a data analyst?** 

- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), offering strategic insights for career development in data analysis
*/

WITH demand_skills AS(
   SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS count_jobs 
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.salary_year_avg IS NOT NULL AND
    job_postings_fact.job_work_from_home = TRUE AND
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skill_id
), 
    average_salary AS(
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
    FROM
        job_postings_fact
    INNER JOIN
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
    job_postings_fact.salary_year_avg IS NOT NULL AND
    job_postings_fact.job_work_from_home = TRUE AND
    job_postings_fact.job_title_short = 'Data Analyst'
    GROUP BY
        skills_job_dim.skill_id
)


SELECT
    demand_skills.skills,
    demand_skills.count_jobs,
    average_salary.avg_salary
FROM
    demand_skills
INNER JOIN
   average_salary ON demand_skills.skill_id = average_salary.skill_id
ORDER BY
    demand_skills.count_jobs DESC,
    average_salary.avg_salary DESC
LIMIT 10;


/*
-Results of the query

[
  {
    "skills": "sql",
    "count_jobs": "398",
    "avg_salary": "97237"
  },
  {
    "skills": "excel",
    "count_jobs": "256",
    "avg_salary": "87288"
  },
  {
    "skills": "python",
    "count_jobs": "236",
    "avg_salary": "101397"
  },
  {
    "skills": "tableau",
    "count_jobs": "230",
    "avg_salary": "99288"
  },
  {
    "skills": "r",
    "count_jobs": "148",
    "avg_salary": "100499"
  },
  {
    "skills": "power bi",
    "count_jobs": "110",
    "avg_salary": "97431"
  },
  {
    "skills": "sas",
    "count_jobs": "63",
    "avg_salary": "98902"
  },
  {
    "skills": "sas",
    "count_jobs": "63",
    "avg_salary": "98902"
  },
  {
    "skills": "powerpoint",
    "count_jobs": "58",
    "avg_salary": "88701"
  },
  {
    "skills": "looker",
    "count_jobs": "49",
    "avg_salary": "103795"
  }
]
*/