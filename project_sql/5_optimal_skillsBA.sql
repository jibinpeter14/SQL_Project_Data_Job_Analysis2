/*
Answer: What are the most optimal skills to learn (aka it’s in high demand 
and a high-paying skill) for a Business analyst?
- Identify skills in high demand and associated with high average salaries for Business Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries)
,offering strategic insights for career development in data analysis

NOTE: OPTIMAL: High demand AND High Paying
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
    WHERE 
        job_title_short = 'Business Analyst' 
        AND salary_year_avg IS NOT NULL 
        AND job_work_from_home = TRUE
    GROUP BY 
        skills_dim.skill_id
), average_salary AS (
SELECT 
    skills_job_dim.skill_id,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
 FROM job_postings_fact
 INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
 INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
 WHERE
     job_title_short = 'Business Analyst' 
      AND salary_year_avg IS NOT NULL 
      AND job_work_from_home =TRUE 
 GROUP BY 
      skills_job_dim.skill_id
)


SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

--REWRITING THIS SAME QUERY MORE CLEARLY
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
 FROM job_postings_fact
 INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
 INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
 WHERE
     job_title_short = 'Business Analyst' 
      AND salary_year_avg IS NOT NULL 
      AND job_work_from_home =TRUE 
 GROUP BY 
      skills_dim.skill_id
 HAVING COUNT(skills_job_dim.job_id) > 10
 ORDER BY
       avg_salary DESC,
       demand_count DESC
 LIMIT 25;

 /*
 Here's a breakdown of the results for high-demand, high-paying Business Analyst skills:
-SQL as the Core Driver:
-SQL shows the highest demand (42) with strong salary levels (~$99k), confirming it as the 
foundational skill for business analysts across top roles.
-Python as the Premium Skill:
-Python commands the highest average salary (~$116k), indicating that analysts who move into 
automation and advanced analytics earn significantly more.
-Visualization as a Baseline Expectation:
-Tableau and Excel have high demand (27 and 31), but slightly lower salaries (~$94k–$104k), 
suggesting reporting skills are essential but not major salary boosters.


[
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "20",
    "avg_salary": "116516"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "27",
    "avg_salary": "104233"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "42",
    "avg_salary": "99120"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "31",
    "avg_salary": "94132"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "12",
    "avg_salary": "90448"
  }
]
*/