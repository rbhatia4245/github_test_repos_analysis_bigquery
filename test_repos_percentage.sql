Select a.language_name as language_name,
(language_repo_count/repo_count)*100 as percent_test_repos
from `group_project.picked_language_repo_count` a inner join `group_project.language_test_repo_count_sample` b
on a.language_name = b.language_name;

--extract results to looker studio