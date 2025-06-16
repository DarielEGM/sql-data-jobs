# Introduction
This project aims to provide a clear and data-driven view of the most relevant and high-paying 💰 job opportunities for the role of Data Analyst. Through the analysis of information related to salaries 💵, skill demand 📈, and market trends 🌐, the goal is to identify which knowledge and competencies 🧠 are most valuable for those currently working in or aspiring to enter this field.

🔍SQL queries? Check them out here: [project_sql_folder](/project_sql/)

# Background
Understanding the job market for Data Analysts is crucial in a rapidly evolving, data-driven world. This project was born out of the desire to gain deeper insights into the most in-demand 📈 and highest-paying 💰 skills in the field, allowing for a more focused and effective 🔍 job search.

By identifying the intersection between what companies need and what they’re willing to pay for, Data Analysts can make smarter career decisions, optimize their learning path 🧠, and position themselves competitively in the job market.

To guide this analysis, the project is structured around five key questions:

1.  What are the top-paying jobs for a Data Analyst? 💵

2.  What skills are required for these top-paying roles? 🧩

3.  What are the most in-demand skills for Data Analysts? 📈

4.  What are the top skills based on salary for this role? 💸

5.  What are the most optimal skills to learn for a data analyst looking to maximize job market value? 🎯


# Tools I Used
Tools I Used
To carry out the analysis and exploration in this project, the following tools were used:

-   **SQL:** Structured Query Language was used to query and manipulate the data efficiently, enabling the extraction of relevant insights from large datasets.

-   **PostgreSQL:** A powerful open-source relational database system used to store, manage, and analyze the data. It provided the environment for running complex queries and aggregations.

-   **Visual Studio Code:** A lightweight and versatile code editor that was used for writing SQL scripts and managing the project files, with support for extensions and version control integration.


# The Analysis
This project analyzes the Data Analyst job market to identify the most valuable skills in terms of salary 💰 and demand 📈. The aim is to help professionals make informed career and learning decisions.

Here’s a breakdown of the five core questions explored:
### 1.  Top paying Data Analyst Job
This query retrieves remote data analyst jobs and sorts them by average annual salary to highlight the highest-paying remote opportunities, focusing on key job details.

```sql
    SELECT 
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date,
        company_dim.name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE   
        job_location = 'Anywhere' AND job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
    ORDER BY    
        salary_year_avg DESC
    LIMIT 10;
```
Here is the breakdown for Top-Paying Jobs for a Data Analyst
-   Top Salary: The Data Analyst role at Mantys offers an extraordinary $650,000 average salary, indicating how lucrative certain remote roles can be.

-   Senior Titles Earn More: Roles like Director and Principal Data Analyst dominate the top 10, highlighting the salary boost associated with leadership and experience.

-   Remote Work Is Common: Every listing is fully remote (“Anywhere”), showing strong demand for data professionals regardless of geographic location.

-   Big Companies Pay Big: Major firms such as Meta, AT&T, and Pinterest are among the top-paying employers, reflecting strong corporate investment in data capabilities.

| Job Title                                       | Company Name                            | Location | Schedule Type | Average Salary (USD) | Date Posted |
| ----------------------------------------------- | --------------------------------------- | -------- | ------------- | -------------------- | ----------- |
| Data Analyst                                    | Mantys                                  | Anywhere | Full-time     | \$650,000            | 2023-02-20  |
| Director of Analytics                           | Meta                                    | Anywhere | Full-time     | \$336,500            | 2023-08-23  |
| Associate Director – Data Insights              | AT\&T                                   | Anywhere | Full-time     | \$255,829            | 2023-06-18  |
| Data Analyst, Marketing                         | Pinterest Job Advertisements            | Anywhere | Full-time     | \$232,423            | 2023-12-05  |
| Data Analyst (Hybrid/Remote)                    | Uclahealthcareers                       | Anywhere | Full-time     | \$217,000            | 2023-01-17  |
| Principal Data Analyst (Remote)                 | SmartAsset                              | Anywhere | Full-time     | \$205,000            | 2023-08-09  |
| Director, Data Analyst – HYBRID                 | Inclusively                             | Anywhere | Full-time     | \$189,309            | 2023-12-07  |
| Principal Data Analyst, AV Performance Analysis | Motional                                | Anywhere | Full-time     | \$189,000            | 2023-01-05  |
| Principal Data Analyst                          | SmartAsset                              | Anywhere | Full-time     | \$186,000            | 2023-07-11  |
| ERM Data Analyst                                | Get It Recruit – Information Technology | Anywhere | Full-time     | \$184,000            | 2023-06-09  |


### 2.  Skills Required for Top Paying Roles
This query identifies the highest-paying remote Data Analyst jobs and retrieves the skills required for these roles, linking job and company details with their associated skills. Results are ordered by salary to highlight the most lucrative skill sets.

```sql
WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE   
        job_location = 'Anywhere' AND job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
    ORDER BY    
        salary_year_avg DESC
)


SELECT
    top_paying_jobs.job_id,
    top_paying_jobs.job_title,
    top_paying_jobs.salary_year_avg,
    skills_dim.skills
FROM 
    skills_job_dim
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN
    top_paying_jobs ON top_paying_jobs.job_id = skills_job_dim.job_id
ORDER BY    
    top_paying_jobs.salary_year_avg DESC
LIMIT 10;
```
Here is the breakdown for Skills Are Required for the Top-Paying Roles
-   The role of Associate Director – Data Insights at AT&T commands a high average salary of $255,829 and demands a broad technical skill set.

-   Essential programming languages include SQL, Python, and R, which form the backbone of data analysis and manipulation.

-    Cloud computing platforms like Azure and AWS are critical, reflecting the importance of cloud infrastructure in managing and analyzing data.

-   Expertise in big data and data engineering tools such as Databricks and PySpark highlights the role’s focus on scalable data processing.

-   Analytical and productivity tools like Pandas, Jupyter, and Excel are also required, underscoring the mix of programming and traditional data skills.

-   Overall, this combination of skills illustrates that top-paying data analyst roles require both advanced technical knowledge and proficiency with modern data science tools.

| Job ID | Job Title                          | Average Salary (USD) | Required Skill |
| ------ | ---------------------------------- | -------------------- | -------------- |
| 552322 | Associate Director – Data Insights | \$255,829            | SQL            |
| 552322 | Associate Director – Data Insights | \$255,829            | Python         |
| 552322 | Associate Director – Data Insights | \$255,829            | R              |
| 552322 | Associate Director – Data Insights | \$255,829            | Azure          |
| 552322 | Associate Director – Data Insights | \$255,829            | Databricks     |
| 552322 | Associate Director – Data Insights | \$255,829            | AWS            |
| 552322 | Associate Director – Data Insights | \$255,829            | Pandas         |
| 552322 | Associate Director – Data Insights | \$255,829            | PySpark        |
| 552322 | Associate Director – Data Insights | \$255,829            | Jupyter        |
| 552322 | Associate Director – Data Insights | \$255,829            | Excel          |


### 3.  Most In-Demand Skills for Data Analysts
This query identifies the most in-demand skills for Data Analysts by counting how frequently each skill appears across relevant job postings, ranking them to highlight the top skills currently sought by employers.

```sql
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
```
Here is the breakdown for Most In-Demand Skills for Data Analysts:
-   SQL is the most demanded skill, appearing in over 92,000 job postings, highlighting its fundamental importance for data analysts.

-   Excel remains a key tool, with strong demand across job listings, reflecting its continued relevance for data manipulation and reporting.

-   Programming skills such as Python are also highly sought after, demonstrating the value of coding capabilities in data analysis.

-   Data visualization tools like Tableau and Power BI show substantial demand, underlining the importance of effectively communicating data insights.

-   This distribution emphasizes a balanced need for database querying, programming, and visualization skills in the current job market.

| Skill    | Demand Count (Number of Job Postings) |
| -------- | ------------------------------------- |
| SQL      | 92,628                                |
| Excel    | 67,031                                |
| Python   | 57,326                                |
| Tableau  | 46,554                                |
| Power BI | 39,468                                |


### 4.  Top Salary-Based Skills
This query calculates the average salary associated with each skill for Data Analyst roles, ranking skills by their salary impact to identify which skills correlate with higher earnings.

```sql
SELECT 
    skills_dim.skills AS skill_name,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary_skill
FROM job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' 
    AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skill_name 
ORDER BY
    avg_salary_skill DESC;
```
Here is the breakdown for Skills with the Highest Average Salaries:

-   The skill svn leads the list with an average salary of $400,000, highlighting its high market value.

-   It is followed by specialized technologies like solidity ($179,000), couchbase ($160,515), and datarobot ($155,486).

-   Other high-paying skills include golang ($155,000), mxnet ($149,000), and dplyr ($147,633).

-   Overall, these skills represent niche or advanced technologies that command top salaries.

| Skill Name | Average Salary (USD) |
| ---------- | -------------------- |
| svn        | 400,000              |
| solidity   | 179,000              |
| couchbase  | 160,515              |
| datarobot  | 155,486              |
| golang     | 155,000              |
| mxnet      | 149,000              |
| dplyr      | 147,633              |
| vmware     | 147,500              |
| terraform  | 146,734              |
| twilio     | 138,500              |


### 5.  Most Optimal Skills to Learn
This query identifies the most optimal skills for remote Data Analyst roles by combining skill demand and average salary. It ranks skills that are both highly sought after and well compensated to guide focused learning and career growth.

```sql
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
```
Here is the breakdown for Skills with the Highest Job Demand and Competitive Salaries:

-   SQL leads the market with 398 job postings, showing its foundational importance in data-related roles, though its average salary is $97,237—slightly below others with lower demand.

-   Excel follows with 256 listings, highlighting its ongoing relevance, particularly in business operations and reporting, but with a comparatively modest salary of $87,288.

-   Python ranks third in demand (236 jobs) but commands one of the highest average salaries at $101,397, reflecting its versatility and usage in advanced analytics and automation.

-   Tableau is close behind in demand (230 jobs) and offers a strong average salary of $99,288, reinforcing its value in data visualization roles.

-   R appears in 148 jobs with an average salary of $100,499, indicating its appeal in statistical modeling and academic data science.

-   Power BI, SAS, and Looker round out the top group, all showing moderate demand but high salary potential, especially Looker with $103,795, the highest-paying tool among the top 10.

Employers are prioritizing a combination of strong foundational tools (like SQL and Excel) and specialized analytics platforms (like Python, Looker, and R) when seeking data professionals, with salary premiums offered for those skilled in more advanced or niche technologies.

| Skills     | Count Jobs | Average Salary |
| ---------- | ---------- | -------------- |
| sql        | 398        | 97,237         |
| excel      | 256        | 87,288         |
| python     | 236        | 101,397        |
| tableau    | 230        | 99,288         |
| r          | 148        | 100,499        |
| power bi   | 110        | 97,431         |
| sas        | 63         | 98,902         |
| powerpoint | 58         | 88,701         |
| looker     | 49         | 103,795        |


# What I Learned
Working on this project allowed me to strengthen both my technical SQL skills and analytical approach to solving real-world problems. The key areas of growth include:

- Complex Query Construction: Built multi-step queries using **JOIN**s and WITH clauses to organize complex logic clearly.

- Data Aggregation: Used GROUP BY, COUNT(), and AVG() to summarize job and skill data effectively.

- Analytical Thinking: Translated real-world questions into focused SQL queries that uncovered meaningful insights.

# Insights
From the analysis, several key insights emerged:

1. Top-Paying Data Analyst Jobs: Remote Data Analyst roles can offer highly competitive salaries, with the highest reaching $650,000, highlighting the earning potential in remote positions.

2. Skills for Top-Paying Jobs: These high-paying roles consistently list SQL as a core requirement, reinforcing its importance for accessing top-tier opportunities.

3. Most In-Demand Skills: SQL also ranks as the most frequently required skill across job postings, making it essential for anyone entering or growing in the field.

4. Skills with Higher Salaries: More specialized tools like SVN and Solidity are associated with the highest average salaries, suggesting that learning niche or emerging technologies can significantly boost earning potential.

5. Optimal Skills for Job Market Value: SQL stands out as both highly demanded and well-paid, positioning it as one of the most optimal skills for Data Analysts looking to maximize their market value.

# Conclusions
This project provided valuable insights into the Data Analyst job market by analyzing salary trends, skill demand, and the intersection between both. It confirmed that SQL is not only the most in-demand skill but also a consistent requirement for the highest-paying roles — making it a top priority for anyone aiming to grow in the field.

By combining technical SQL skills with analytical thinking, the project demonstrated how data can be used to guide strategic career decisions. The findings can help aspiring and current Data Analysts prioritize their learning paths and focus on skills that offer the greatest return in today’s competitive job market.