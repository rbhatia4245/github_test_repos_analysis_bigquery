This test repos contain sql queries that can be run in Google BigQuery and the results can be attached to looker studio. We tried to find what percent of repos in git hub had tests or test directories. Due to the limitation of 1 TB processing limit in free trial we used the sample files dataset within the git hub dataset. 
Google Data set - https://console.cloud.google.com/marketplace/product/github/github-repos?project=certain-acre-367603
Sample Big Query report with visualizations - https://lookerstudio.google.com/reporting/567d14a3-6cf1-4e1d-b816-cd9d23e27edf

Execution order of queries:
1. repo_count_language_total.sql
2. sample_file_repo_count_language.sql
3. top_5_demand_repo_count.sql
4. top_5_lang_test_repo_count.sql
5. test_repos_percentage.sql
6. test_repos_stats_language.sql
7. total_percent_test_nontest_repos.sql