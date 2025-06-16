/*
**Answer: What are the top skills based on salary?** 

- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve.
*/




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


/*
-Results of the query

[
  {
    "skill_name": "svn",
    "avg_salary_skill": "400000"
  },
  {
    "skill_name": "solidity",
    "avg_salary_skill": "179000"
  },
  {
    "skill_name": "couchbase",
    "avg_salary_skill": "160515"
  },
  {
    "skill_name": "datarobot",
    "avg_salary_skill": "155486"
  },
  {
    "skill_name": "golang",
    "avg_salary_skill": "155000"
  },
  {
    "skill_name": "mxnet",
    "avg_salary_skill": "149000"
  },
  {
    "skill_name": "dplyr",
    "avg_salary_skill": "147633"
  },
  {
    "skill_name": "vmware",
    "avg_salary_skill": "147500"
  },
  {
    "skill_name": "terraform",
    "avg_salary_skill": "146734"
  },
  {
    "skill_name": "twilio",
    "avg_salary_skill": "138500"
  },
  {
    "skill_name": "gitlab",
    "avg_salary_skill": "134126"
  },
  {
    "skill_name": "kafka",
    "avg_salary_skill": "129999"
  },
  {
    "skill_name": "puppet",
    "avg_salary_skill": "129820"
  },
  {
    "skill_name": "keras",
    "avg_salary_skill": "127013"
  },
  {
    "skill_name": "pytorch",
    "avg_salary_skill": "125226"
  },
  {
    "skill_name": "perl",
    "avg_salary_skill": "124686"
  },
  {
    "skill_name": "ansible",
    "avg_salary_skill": "124370"
  },
  {
    "skill_name": "hugging face",
    "avg_salary_skill": "123950"
  },
  {
    "skill_name": "tensorflow",
    "avg_salary_skill": "120647"
  },
  {
    "skill_name": "cassandra",
    "avg_salary_skill": "118407"
  },
  {
    "skill_name": "notion",
    "avg_salary_skill": "118092"
  },
  {
    "skill_name": "atlassian",
    "avg_salary_skill": "117966"
  },
  {
    "skill_name": "bitbucket",
    "avg_salary_skill": "116712"
  },
  {
    "skill_name": "airflow",
    "avg_salary_skill": "116387"
  },
  {
    "skill_name": "scala",
    "avg_salary_skill": "115480"
  },
  {
    "skill_name": "linux",
    "avg_salary_skill": "114883"
  },
  {
    "skill_name": "confluence",
    "avg_salary_skill": "114153"
  },
  {
    "skill_name": "pyspark",
    "avg_salary_skill": "114058"
  },
  {
    "skill_name": "mongodb",
    "avg_salary_skill": "113608"
  },
  {
    "skill_name": "aurora",
    "avg_salary_skill": "113394"
  },
  {
    "skill_name": "cordova",
    "avg_salary_skill": "113270"
  },
  {
    "skill_name": "gcp",
    "avg_salary_skill": "113065"
  },
  {
    "skill_name": "spark",
    "avg_salary_skill": "113002"
  },
  {
    "skill_name": "splunk",
    "avg_salary_skill": "112928"
  },
  {
    "skill_name": "databricks",
    "avg_salary_skill": "112881"
  },
  {
    "skill_name": "unify",
    "avg_salary_skill": "112317"
  },
  {
    "skill_name": "git",
    "avg_salary_skill": "112250"
  },
  {
    "skill_name": "dynamodb",
    "avg_salary_skill": "111840"
  },
  {
    "skill_name": "snowflake",
    "avg_salary_skill": "111578"
  },
  {
    "skill_name": "shell",
    "avg_salary_skill": "111496"
  },
  {
    "skill_name": "electron",
    "avg_salary_skill": "111175"
  },
  {
    "skill_name": "unix",
    "avg_salary_skill": "111123"
  },
  {
    "skill_name": "hadoop",
    "avg_salary_skill": "110888"
  },
  {
    "skill_name": "pandas",
    "avg_salary_skill": "110767"
  },
  {
    "skill_name": "node.js",
    "avg_salary_skill": "110230"
  },
  {
    "skill_name": "phoenix",
    "avg_salary_skill": "109259"
  },
  {
    "skill_name": "php",
    "avg_salary_skill": "109052"
  },
  {
    "skill_name": "neo4j",
    "avg_salary_skill": "108646"
  },
  {
    "skill_name": "nosql",
    "avg_salary_skill": "108331"
  },
  {
    "skill_name": "express",
    "avg_salary_skill": "108221"
  },
  {
    "skill_name": "watson",
    "avg_salary_skill": "108103"
  },
  {
    "skill_name": "redshift",
    "avg_salary_skill": "107969"
  },
  {
    "skill_name": "jira",
    "avg_salary_skill": "107931"
  },
  {
    "skill_name": "rust",
    "avg_salary_skill": "107925"
  },
  {
    "skill_name": "elasticsearch",
    "avg_salary_skill": "107816"
  },
  {
    "skill_name": "no-sql",
    "avg_salary_skill": "107405"
  },
  {
    "skill_name": "numpy",
    "avg_salary_skill": "107398"
  },
  {
    "skill_name": "db2",
    "avg_salary_skill": "107130"
  },
  {
    "skill_name": "swift",
    "avg_salary_skill": "107100"
  },
  {
    "skill_name": "redis",
    "avg_salary_skill": "107044"
  },
  {
    "skill_name": "postgresql",
    "avg_salary_skill": "106853"
  },
  {
    "skill_name": "plotly",
    "avg_salary_skill": "106603"
  },
  {
    "skill_name": "aws",
    "avg_salary_skill": "106440"
  },
  {
    "skill_name": "c++",
    "avg_salary_skill": "105696"
  },
  {
    "skill_name": "alteryx",
    "avg_salary_skill": "105580"
  },
  {
    "skill_name": "azure",
    "avg_salary_skill": "105400"
  },
  {
    "skill_name": "gdpr",
    "avg_salary_skill": "105329"
  },
  {
    "skill_name": "bigquery",
    "avg_salary_skill": "105238"
  },
  {
    "skill_name": "bash",
    "avg_salary_skill": "105075"
  },
  {
    "skill_name": "powershell",
    "avg_salary_skill": "105041"
  },
  {
    "skill_name": "mongo",
    "avg_salary_skill": "104274"
  },
  {
    "skill_name": "scikit-learn",
    "avg_salary_skill": "103932"
  },
  {
    "skill_name": "looker",
    "avg_salary_skill": "103855"
  },
  {
    "skill_name": "jupyter",
    "avg_salary_skill": "103522"
  },
  {
    "skill_name": "ibm cloud",
    "avg_salary_skill": "103313"
  },
  {
    "skill_name": "kubernetes",
    "avg_salary_skill": "103089"
  },
  {
    "skill_name": "angular",
    "avg_salary_skill": "102103"
  },
  {
    "skill_name": "flask",
    "avg_salary_skill": "101863"
  },
  {
    "skill_name": "asp.net",
    "avg_salary_skill": "101667"
  },
  {
    "skill_name": "sqlite",
    "avg_salary_skill": "101625"
  },
  {
    "skill_name": "python",
    "avg_salary_skill": "101512"
  },
  {
    "skill_name": "github",
    "avg_salary_skill": "101498"
  },
  {
    "skill_name": "jenkins",
    "avg_salary_skill": "101419"
  },
  {
    "skill_name": "mysql",
    "avg_salary_skill": "101381"
  },
  {
    "skill_name": "visio",
    "avg_salary_skill": "101036"
  },
  {
    "skill_name": "oracle",
    "avg_salary_skill": "100964"
  },
  {
    "skill_name": "qlik",
    "avg_salary_skill": "100933"
  },
  {
    "skill_name": "java",
    "avg_salary_skill": "100214"
  },
  {
    "skill_name": "chainer",
    "avg_salary_skill": "100000"
  },
  {
    "skill_name": "theano",
    "avg_salary_skill": "100000"
  },
  {
    "skill_name": "matlab",
    "avg_salary_skill": "99909"
  },
  {
    "skill_name": "unity",
    "avg_salary_skill": "99617"
  },
  {
    "skill_name": "dax",
    "avg_salary_skill": "99549"
  },
  {
    "skill_name": "ggplot2",
    "avg_salary_skill": "99416"
  },
  {
    "skill_name": "matplotlib",
    "avg_salary_skill": "99307"
  },
  {
    "skill_name": "docker",
    "avg_salary_skill": "99262"
  },
  {
    "skill_name": "yarn",
    "avg_salary_skill": "99150"
  },
  {
    "skill_name": "seaborn",
    "avg_salary_skill": "98748"
  },
  {
    "skill_name": "c",
    "avg_salary_skill": "98715"
  },
  {
    "skill_name": "r",
    "avg_salary_skill": "98708"
  },
  {
    "skill_name": "django",
    "avg_salary_skill": "98544"
  },
  {
    "skill_name": "flow",
    "avg_salary_skill": "98020"
  },
  {
    "skill_name": "tableau",
    "avg_salary_skill": "97978"
  },
  {
    "skill_name": "node",
    "avg_salary_skill": "97900"
  },
  {
    "skill_name": "spring",
    "avg_salary_skill": "97454"
  },
  {
    "skill_name": "go",
    "avg_salary_skill": "97267"
  },
  {
    "skill_name": "c#",
    "avg_salary_skill": "97248"
  },
  {
    "skill_name": "ssis",
    "avg_salary_skill": "97235"
  },
  {
    "skill_name": "sql",
    "avg_salary_skill": "96435"
  },
  {
    "skill_name": "sql server",
    "avg_salary_skill": "96191"
  },
  {
    "skill_name": "mariadb",
    "avg_salary_skill": "96000"
  },
  {
    "skill_name": "jquery",
    "avg_salary_skill": "95772"
  },
  {
    "skill_name": "t-sql",
    "avg_salary_skill": "95723"
  },
  {
    "skill_name": "microstrategy",
    "avg_salary_skill": "94486"
  },
  {
    "skill_name": "vba",
    "avg_salary_skill": "93845"
  },
  {
    "skill_name": "sas",
    "avg_salary_skill": "93707"
  },
  {
    "skill_name": "webex",
    "avg_salary_skill": "92500"
  },
  {
    "skill_name": "sap",
    "avg_salary_skill": "92446"
  },
  {
    "skill_name": "power bi",
    "avg_salary_skill": "92324"
  },
  {
    "skill_name": "pascal",
    "avg_salary_skill": "92000"
  },
  {
    "skill_name": "javascript",
    "avg_salary_skill": "91805"
  },
  {
    "skill_name": "ssrs",
    "avg_salary_skill": "91537"
  },
  {
    "skill_name": "cognos",
    "avg_salary_skill": "90407"
  },
  {
    "skill_name": "airtable",
    "avg_salary_skill": "90006"
  },
  {
    "skill_name": "clickup",
    "avg_salary_skill": "90000"
  },
  {
    "skill_name": "zoom",
    "avg_salary_skill": "89791"
  },
  {
    "skill_name": "typescript",
    "avg_salary_skill": "89323"
  },
  {
    "skill_name": "unreal",
    "avg_salary_skill": "89113"
  },
  {
    "skill_name": "sharepoint",
    "avg_salary_skill": "89027"
  },
  {
    "skill_name": "react",
    "avg_salary_skill": "88567"
  },
  {
    "skill_name": "drupal",
    "avg_salary_skill": "88328"
  },
  {
    "skill_name": "powerpoint",
    "avg_salary_skill": "88316"
  },
  {
    "skill_name": "firebase",
    "avg_salary_skill": "87500"
  },
  {
    "skill_name": "crystal",
    "avg_salary_skill": "87327"
  },
  {
    "skill_name": "visual basic",
    "avg_salary_skill": "86972"
  },
  {
    "skill_name": "arch",
    "avg_salary_skill": "86835"
  },
  {
    "skill_name": "windows",
    "avg_salary_skill": "86513"
  },
  {
    "skill_name": "excel",
    "avg_salary_skill": "86419"
  },
  {
    "skill_name": "symphony",
    "avg_salary_skill": "86267"
  },
  {
    "skill_name": "microsoft teams",
    "avg_salary_skill": "85570"
  },
  {
    "skill_name": "assembly",
    "avg_salary_skill": "85390"
  },
  {
    "skill_name": "asana",
    "avg_salary_skill": "85339"
  },
  {
    "skill_name": "css",
    "avg_salary_skill": "85317"
  },
  {
    "skill_name": "spss",
    "avg_salary_skill": "85293"
  },
  {
    "skill_name": "ms access",
    "avg_salary_skill": "84873"
  },
  {
    "skill_name": "cobol",
    "avg_salary_skill": "84745"
  },
  {
    "skill_name": "html",
    "avg_salary_skill": "84383"
  },
  {
    "skill_name": "sheets",
    "avg_salary_skill": "84130"
  },
  {
    "skill_name": "terminal",
    "avg_salary_skill": "83567"
  },
  {
    "skill_name": "slack",
    "avg_salary_skill": "83442"
  },
  {
    "skill_name": "word",
    "avg_salary_skill": "82941"
  },
  {
    "skill_name": "chef",
    "avg_salary_skill": "82825"
  },
  {
    "skill_name": "selenium",
    "avg_salary_skill": "82500"
  },
  {
    "skill_name": "fortran",
    "avg_salary_skill": "82500"
  },
  {
    "skill_name": "ruby",
    "avg_salary_skill": "80960"
  },
  {
    "skill_name": "outlook",
    "avg_salary_skill": "80680"
  },
  {
    "skill_name": "monday.com",
    "avg_salary_skill": "79000"
  },
  {
    "skill_name": "spreadsheet",
    "avg_salary_skill": "78466"
  },
  {
    "skill_name": "planner",
    "avg_salary_skill": "77039"
  },
  {
    "skill_name": "workfront",
    "avg_salary_skill": "76820"
  },
  {
    "skill_name": "wrike",
    "avg_salary_skill": "75000"
  },
  {
    "skill_name": "julia",
    "avg_salary_skill": "73680"
  },
  {
    "skill_name": "npm",
    "avg_salary_skill": "73419"
  },
  {
    "skill_name": "dart",
    "avg_salary_skill": "72674"
  },
  {
    "skill_name": "erlang",
    "avg_salary_skill": "72500"
  },
  {
    "skill_name": "smartsheet",
    "avg_salary_skill": "71221"
  },
  {
    "skill_name": "tidyverse",
    "avg_salary_skill": "70600"
  },
  {
    "skill_name": "vb.net",
    "avg_salary_skill": "69600"
  },
  {
    "skill_name": "wire",
    "avg_salary_skill": "68375"
  },
  {
    "skill_name": "opencv",
    "avg_salary_skill": "67818"
  },
  {
    "skill_name": "sass",
    "avg_salary_skill": "67699"
  },
  {
    "skill_name": "colocation",
    "avg_salary_skill": "67500"
  },
  {
    "skill_name": "trello",
    "avg_salary_skill": "65193"
  },
  {
    "skill_name": "vue",
    "avg_salary_skill": "65000"
  },
  {
    "skill_name": "macos",
    "avg_salary_skill": "57933"
  },
  {
    "skill_name": "graphql",
    "avg_salary_skill": "57009"
  },
  {
    "skill_name": "ruby on rails",
    "avg_salary_skill": "51059"
  }
]
*/