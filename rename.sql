CREATE TABLE student(
name VARCHAR(30),
roll_no INT,
age INT
);

INSERT INTO student(name, roll_no, age) VALUES
('Bibhashree', 1, 19),
('Aayusha', 2, 19),
('Aavash', 3, 20),
('vanilla', 4, 19);

SELECT * FROM student;

EXEC sp_rename 'student.roll_no', 'rollno', 'COLUMN';

EXEC sp_rename 'student', 'student_details';

SELECT * FROM student;