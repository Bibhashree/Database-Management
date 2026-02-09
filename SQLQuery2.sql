CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_no VARCHAR(50) NOT NULL
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_no VARCHAR(50) NOT NULL
);

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Course (
    c_id INT PRIMARY KEY,
    c_code VARCHAR(50) NOT NULL,
    c_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE CourseRegistration (
    reg_id INT PRIMARY KEY,
    student_id INT,
    c_id INT,
    reg_date DATE NOT NULL,
    reg_time TIME NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (c_id) REFERENCES Course(c_id)
);

INSERT INTO Teacher VALUES
(1, 'Ram', 'ram@gmail.com', '984122'),
(2, 'Shyam', 'shyam@gmail.com', '984132');

INSERT INTO Student VALUES
(1, 'Sita', 'sita@gmail.com', '981381'),
(2, 'Hari', 'hari@gmail.com', '984155');

INSERT INTO Department VALUES
(1, 'Mathematics'),
(2, 'IT');

INSERT INTO Course VALUES
(1, 'MTH101', 'Maths', 1),
(2, 'CMP205', 'DBMS', 2);

INSERT INTO CourseRegistration VALUES
(1, 1, 1, '2025-01-11', '10:00:00'),
(2, 2, 2, '2025-05-18', '09:00:00');

UPDATE Student
SET phone_no = '981318'
WHERE student_id = 1;

DELETE FROM Course
WHERE c_id = 2;
