/*
Question: What skills are required for the top-paying Business analyst jobs?
- Use the top 10 highest-paying Business Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

 WITH top_paying_jobs AS (
        SELECT 
            job_id,
            job_title,
            salary_year_avg,
            name AS company_name
        FROM 
            job_postings_fact
        LEFT JOIN  
            company_dim ON job_postings_fact.company_id = company_dim.company_id
        WHERE 
            job_title_short = 'Business Analyst' AND 
            job_location = 'Anywhere' AND
            salary_year_avg IS NOT NULL
        ORDER BY 
            salary_year_avg DESC
        LIMIT 10
 )

 SELECT top_paying_jobs.*,
 skills 
 FROM top_paying_jobs
 INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
 INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
 ORDER BY salary_year_avg DESC;

/* Here’s the breakdown of the most demanded skills based on the analysis:
SQL is leading with a bold count of 5.
Python is equally strong with a bold count of 5.
Excel remains highly relevant with a bold count of 4.
Tableau also appears frequently, with a bold count of 4.
Other analytical tools like Looker (2), R (2), and SAS (2) show moderate demand.
Cloud and platform tools such as BigQuery, GCP, and workflow tools appear in select high-paying roles.
[
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "sql"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "python"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "excel"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "tableau"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "looker"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "chef"
  },
  {
    "job_id": 112859,
    "job_title": "Manager II, Applied Science - Marketplace Dynamics",
    "salary_year_avg": "214500.0",
    "company_name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "salary_year_avg": "190000.0",
    "company_name": "Harnham",
    "skills": "sql"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "salary_year_avg": "190000.0",
    "company_name": "Harnham",
    "skills": "python"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "salary_year_avg": "190000.0",
    "company_name": "Harnham",
    "skills": "r"
  },
  {
    "job_id": 416185,
    "job_title": "Staff Revenue Operations Analyst",
    "salary_year_avg": "170500.0",
    "company_name": "Gladly",
    "skills": "excel"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "sql"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "python"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "bigquery"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "gcp"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "looker"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "word"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "sheets"
  },
  {
    "job_id": 1313937,
    "job_title": "Manager Analytics and Reporting",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "sql"
  },
  {
    "job_id": 1313937,
    "job_title": "Manager Analytics and Reporting",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "excel"
  },
  {
    "job_id": 1313937,
    "job_title": "Manager Analytics and Reporting",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "tableau"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "sql"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "python"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "r"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "sas"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "phoenix"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "excel"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "tableau"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "sas"
  },
  {
    "job_id": 661103,
    "job_title": "Marketing Analytics Manager",
    "salary_year_avg": "134550.0",
    "company_name": "Get It Recruit - Marketing",
    "skills": "tableau"
  }
]
*/