SELECT COUNT(assistance_requests.*) AS total_assistances, students.name AS name
FROM assistance_requests
JOIN students ON students.id = student_id
GROUP BY students.name
HAVING students.name = 'Elliot Dickinson';