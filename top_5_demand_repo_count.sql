Select * from `group_project.language_repo_count_sample`
where language_name in ('JavaScript','Python','Ruby','Java','Go');

-- save results in table named 'picked_language_repo_count'