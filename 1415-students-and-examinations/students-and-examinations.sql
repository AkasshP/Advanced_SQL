/* Write your PL/SQL query statement below */
WITH Exams AS (
    SELECT student_id, subject_name, COUNT(*) as attended 
    FROM Examinations 
    GROUP BY student_id, subject_name
),
 All_Subjects AS (
    SELECT s.student_id as student_id, s.student_name as student_name, sub.subject_name as subject_name,NVL(e.attended, 0) as attended_exams
    FROM Students s
    CROSS JOIN Subjects sub
    LEFT JOIN Exams e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
    order by s.student_id,sub.subject_name
)

select * from All_Subjects