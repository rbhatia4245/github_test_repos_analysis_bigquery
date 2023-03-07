Select distinct language.name,
COUNT(language.name) as repo_count
from `bigquery-public-data.github_repos.languages`,
unnest(language) as language
group by language.name
ORDER BY repo_count DESC;

--just to give an idea of actual repo count. Since BigQuery has 1 TB procesing limit we will use sample db from here on.