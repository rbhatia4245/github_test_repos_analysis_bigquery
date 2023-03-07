Select 'test_repo_composition' as measure,
(SUM(language_repo_count)/SUM(repo_count)) * 100 as repo_percentage
from `group_project.picked_language_repo_count` a inner join `group_project.language_test_repo_count_sample` b on
a.language_name = b.language_name
UNION ALL
Select 'non_test_repo_composition' as measure,
(100 - ((SUM(language_repo_count)/SUM(repo_count)) * 100)) as repo_percentage
from `group_project.picked_language_repo_count` a inner join `group_project.language_test_repo_count_sample` b on
a.language_name = b.language_name;

--extract results to looker studio