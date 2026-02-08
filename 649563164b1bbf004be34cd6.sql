SELECT
  RANK() OVER (ORDER BY total_score DESC, id) "rank",
  id student_id,
  name,
  total_score
FROM (
  SELECT
    students.*,
    SUM(score) total_score
  FROM students, courses
  WHERE
    students.id = student_id
    AND course_name IN ('Math', 'Science')
  GROUP BY (students.id, students.name, students.email)
) a;
