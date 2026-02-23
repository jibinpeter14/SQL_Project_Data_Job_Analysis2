/*
Question: What are the most in-demand skills for Business analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a Business analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.  
*/
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
 FROM job_postings_fact
 INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
 INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
 WHERE 
    job_title_short = 'Business Analyst' 
    AND job_work_from_home = TRUE
 GROUP BY 
    skills 
 ORDER BY 
    demand_count DESC
 LIMIT 5;

 /* 
 Here's a breakdown of the results for most in-demand skills:

-SQL as the Market Standard:
--SQL dominates demand (1,266 postings), confirming it as the core technical 
requirement for business analysts across industries.
--Excel as the Operational Backbone:
--With 983 mentions, Excel remains deeply embedded in day-to-day business analysis,
 reporting, and stakeholder workflows.
--Visualization & Analytics Tools as Essential Skills:
--Tableau (728), Power BI (555), and Python (546) show that modern BA roles 
increasingly require data visualization and light technical analytics capabilities 
alongside traditional reporting.

[
  {
    "skills": "sql",
    "demand_count": "1266"
  },
  {
    "skills": "excel",
    "demand_count": "983"
  },
  {
    "skills": "tableau",
    "demand_count": "728"
  },
  {
    "skills": "power bi",
    "demand_count": "555"
  },
  {
    "skills": "python",
    "demand_count": "546"
  }
]

*/