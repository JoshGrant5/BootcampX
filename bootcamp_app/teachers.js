const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'vagrant'
});

const queryString = `
SELECT cohorts.name AS cohort, teachers.name
FROM teachers
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = $1
GROUP BY cohorts.name, teachers.name
ORDER BY teachers.name;
`;

const cohortName = process.argv[2];
const values = [cohortName];

pool.query(queryString, values)
.then(res => {
  console.log('connected');
  res.rows.forEach(teacher => {
    console.log(`${teacher.cohort}: ${teacher.name}`)
  })
})
.catch(err => console.error('query error', err.stack));