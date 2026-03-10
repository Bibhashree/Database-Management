USE CollegeDB;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Teacher;
DROP TABLE IF EXISTS Departmenttt;

CREATE TABLE Departmenttt (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) 
);

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(50),
    DepartmentID INT,
    CONSTRAINT fk_teacher
        FOREIGN KEY (DepartmentID) REFERENCES Departmenttt(DepartmentID)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    DepartmentID INT,
    CONSTRAINT fk_student
        FOREIGN KEY (DepartmentID) REFERENCES Departmenttt(DepartmentID)
);


INSERT INTO Departmenttt (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Management'),
(3, 'Engineering');

INSERT INTO Teacher (TeacherID, TeacherName, DepartmentID) VALUES
(101, 'Santost', 1),
(102, 'Binita', 2),
(103, 'Veer', 3);

INSERT INTO Student (StudentID, StudentName, Age, DepartmentID) VALUES
(1, 'Bibhashree', 20, 1),
(2, 'Swora', 21, 2),
(3, 'Sadiksha', 19, 1),
(4, 'Ram', 22, 3),
(5, 'Shyam', 20, 2);

CREATE VIEW StudentDepartmentTeacher AS
SELECT
    s.StudentID,
    s.StudentName,
    s.Age,
    d.DepartmentName,
    t.TeacherName
FROM Student s
INNER JOIN Departmenttt d 
    ON s.DepartmentID = d.DepartmentID
INNER JOIN Teacher t 
    ON d.DepartmentID = t.DepartmentID;

    select * from StudentDepartmentTeacher;

insert into StudentDepartmentTeacher values 
(6, 'Hari', 21, 'Computer Science', 'Mr. Sharma');  --doesn't work

update StudentDepartmentTeacher set StudentName = 'Sunny' --works
where StudentID = 2;

delete from StudentDepartmentTeacher where StudentID = 3;  --doesn't work


CREATE VIEW StudentDepartmentTeacher1 AS
SELECT 
    s.StudentID,
    s.StudentName,
    s.Age,
    s.DepartmentID
FROM Student s
INNER JOIN Departmenttt d 
    ON s.DepartmentID = d.DepartmentID
INNER JOIN Teacher t 
    ON d.DepartmentID = t.DepartmentID;


SELECT * FROM StudentDepartmentTeacher1;

INSERT INTO StudentDepartmentTeacher1 VALUES (6, 'Hari', 21, 3);--works

UPDATE StudentDepartmentTeacher1
SET StudentName = 'Jazzy'
WHERE StudentID = 5;-- works

delete from StudentDepartmentTeacher1 where StudentID = 3;  --doesn't work


CREATE VIEW DepartmentAge AS
SELECT 
    d.DepartmentName,
    MAX(s.Age) AS MaxAge,
    MIN(s.Age) AS MinAge
FROM Student s
INNER JOIN Departmenttt d 
    ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

select * from DepartmentAge;

insert into DepartmentAge values 
(Medicine, 22, 19);  --doesn't works

update DepartmentAge set MinAge = 18  --doesn't works
where DepartmentName = 'Engineering';

delete from DepartmentAge where DepartmentName = 'Engineering';  --doesn't work
