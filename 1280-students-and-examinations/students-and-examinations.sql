-- Write your PostgreSQL query statement below
SELECT Students.student_id, Students.student_name, Subjects.subject_name , COUNT(Examinations.student_id) as attended_exams
FROM Students
CROSS JOIN Subjects
LEFT JOIN Examinations on Examinations.subject_name = Subjects.subject_name and Students.student_id = Examinations.student_id
GROUP BY Students.student_id, Students.student_name, Subjects.subject_name, Examinations.student_id
