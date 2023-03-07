Select 'JavaScript' as language_name,
count(distinct repo_names.repo_name) as language_repo_count
from
(Select distinct repo_name
from `bigquery-public-data.github_repos.languages`,
unnest(language) as language
where language.name = 'JavaScript') repo_names inner join
(Select distinct repo_name
from `bigquery-public-data.github_repos.sample_files`
where right(path, 8) = '.test.js') test_repo_names on repo_names.repo_name = test_repo_names.repo_name
UNION ALL
Select 'Python' as language_name,
count(distinct repo_names.repo_name) as language_repo_count
from
(Select distinct repo_name
from `bigquery-public-data.github_repos.languages`,
unnest(language) as language
where language.name = 'Python') repo_names inner join
(
    Select distinct repo_name
      from `bigquery-public-data.github_repos.sample_files`
    where LOWER(path) like ('%test%')
) test_repo_names on repo_names.repo_name = test_repo_names.repo_name
UNION ALL
Select 'Java' as language_name,
count(distinct repo_names.repo_name) as language_repo_count
from
(Select distinct repo_name
from `bigquery-public-data.github_repos.languages`,
unnest(language) as language
where language.name = 'Java') repo_names inner join
(
    Select distinct repo_name
      from `bigquery-public-data.github_repos.sample_files`
    where LOWER(path) like ('%test%') or LOWER(path) like ('%tst%')
) test_repo_names on repo_names.repo_name = test_repo_names.repo_name
UNION ALL
Select 'Ruby' as language,
count(distinct repo_names.repo_name) as language_repo_count
from
(Select distinct repo_name
from `bigquery-public-data.github_repos.languages`,
unnest(language) as language
where language.name = 'Ruby') repo_names inner join
(
    Select distinct repo_name
      from `bigquery-public-data.github_repos.sample_files`
    where LOWER(path) like ('%test%') 
) test_repo_names on repo_names.repo_name = test_repo_names.repo_name
UNION ALL
Select 'Go' as language_name,
count(distinct repo_names.repo_name) as language_repo_count
from
(Select distinct repo_name
from `bigquery-public-data.github_repos.languages`,
unnest(language) as language
where language.name = 'Go') repo_names inner join
(
    Select distinct repo_name
      from `bigquery-public-data.github_repos.sample_files`
    where LOWER(path) like ('%test%') or LOWER(path) like ('%tst%')
) test_repo_names on repo_names.repo_name = test_repo_names.repo_name;

-- save result in table named '.language_test_repo_count_sample'.this shows repo count containing atleast one --test for each language
