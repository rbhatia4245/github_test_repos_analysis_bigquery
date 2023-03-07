Select 'MAX' as stat, language_name, language_repo_count as test_repo_count
from `group_project.language_test_repo_count_sample`
where language_repo_count =
(Select MAX(language_repo_count) as lang_with_maxtests
from `group_project.language_test_repo_count_sample`)
UNION ALL
Select 'MIN' as stat, language_name, language_repo_count as test_repo_count
from `group_project.language_test_repo_count_sample`
where language_repo_count =
(Select MIN(language_repo_count) as lang_with_maxtests
from `group_project.language_test_repo_count_sample`)
UNION ALL
Select 'AVG' as stat, 'ALL' as language_name,
AVG(language_repo_count) as test_repo_count
from `group_project.language_test_repo_count_sample`;

--extract results to looker studio