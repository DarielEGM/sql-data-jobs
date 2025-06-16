/*
**Question: What are the most in-demand skills for data analysts?**

- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    skills_job_dim
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN
    job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE   
    job_postings_fact.job_title_short = 'Data Analyst' 
GROUP BY
    skills_dim.skills
ORDER BY
    demand_count DESC
LIMIT 5;


/*
-Results of the query

[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]
*/