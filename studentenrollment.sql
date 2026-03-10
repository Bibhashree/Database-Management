use Midterm;
Drop table if EXISTS student;
Drop table if EXISTS enrollments;
Drop table if EXISTS courses;

Create table student( 
    StudentId int primary key,
    Fullname varchar(500) not null,
    Email varchar(500) unique,
    DOB date not null,
    Gender varchar(50)
);

Create table courses(
    CourseID int primary key,
    CourseName varchar(500) not null,
    CreditHours int default 3
    );


Create table enrollments(
    EnrollmentID int primary key,
    StudentID int,
    CourseID int,
    Enrolldate date,
    Constraint FK_Enroll_Student
    Foreign key (StudentID) references student(StudentID),
    Constraint FK_Enroll_course
    Foreign key (CourseID) references courses(CourseID)
    );

    Insert into student values
    (1, 'Bibhashree Pradhan', 'bibs@gamil.com', '2006-08-26', 'Female'),
    (2, 'Aayusha Sunuwar', 'aisha@gmail.com', '2006-01-25', 'female'),
    (3, 'Aavash tamang', 'avs@gamil.com', '2004-08-27', 'male'),
    (4, 'Asheha dhungel', 'ash@gamil.com', '2006-06-16', 'Female'),
    (5, 'Aastik Shirpaili', 'aas@gamil.com', '2006-05-20', 'male');

    insert into courses values
    (1, 'math', 4),
    (2, 'English', 2),
    (3, 'history', 5);

    insert into enrollments values
    (1, 1, 2, '2026-02-01'),
    (2, 1, 1, '2026-02-01'),
    (3, 4, 1, '2026-02-01');

    Update student 
    set Email ='aavs@gmail.com' 
    where StudentID = 3;

    Delete from enrollments where CourseID = 4;

    select s.Fullname, c.CourseName, e.Enrolldate 
    from student s
    join enrollments e on s.StudentId = e.StudentID
    join courses c on c.CourseID = e.CourseID;

    select * from enrollments










