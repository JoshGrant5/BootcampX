SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignment_duration, AVG(assignments.duration) AS average_estimated_duration
FROM assignments
JOIN assignment_submissions ON assignment_submissions.assignment_id = assignments.id
JOIN students ON students.id = student_id
WHERE students.end_date is NULL
GROUP BY students.name
HAVING AVG(assignments.duration) > AVG(assignment_submissions.duration)
ORDER BY AVG(assignment_submissions.duration);