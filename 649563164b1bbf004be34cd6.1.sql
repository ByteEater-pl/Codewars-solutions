SELECT
  RANK() OVER (ORDER BY total_score DESC, id) "rank",
  id student_id,
  name,
  total_score
FROM (
  SELECT
    students.*,
    (SELECT SUM(score)
      FROM courses
      WHERE
        student_id = students.id
        AND course_name IN ('Math', 'Science')
    ) total_score
  FROM students
) a;
