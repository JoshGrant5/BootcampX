SELECT SUM(completed_at - started_at) / COUNT(DISTINCT(cohorts.name)) AS average_total_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id;