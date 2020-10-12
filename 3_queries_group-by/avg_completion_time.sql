SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignment_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date is NULL
GROUP BY students.name
ORDER BY AVG(assignment_submissions.duration) DESC;