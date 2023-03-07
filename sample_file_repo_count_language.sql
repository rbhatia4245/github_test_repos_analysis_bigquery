Select distinct language_name,
COUNT(language_repos.repo_name) as repo_count
from
(Select distinct language.name as language_name,
repo_name from
`bigquery-public-data.github_repos.languages`,
unnest(language) as language) language_repos inner join
(
  select distinct repo_name
  from `bigquery-public-data.github_repos.sample_files`
) sample_files_repos on language_repos.repo_name = sample_files_repos.repo_name
group by language_name
ORDER BY repo_count desc;

-- Save the results in table 'language_repo_count_sample'