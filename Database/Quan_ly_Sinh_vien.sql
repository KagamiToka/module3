create database if not exists QLSinh_Vien;
use QLSinh_Vien;
CREATE TABLE Class(
         ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
          ClassName VARCHAR(60) NOT NULL,
          StartDate DATETIME NOT NULL,
          Status BIT
);

CREATE TABLE Student(
          StudentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
          StudentName VARCHAR(30) NOT NULL,
          Address VARCHAR(50),
          Phone VARCHAR(20),
          Status BIT,
          ClassId INT NOT NULL,
          FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);

CREATE TABLE `Subject`(
         SubId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         SubName VARCHAR(30) NOT NULL,
         Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
         Status BIT DEFAULT 1
);

CREATE TABLE Mark(
        MarkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        SubId INT NOT NULL,
        StudentId INT NOT NULL,
        Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
        ExamTimes TINYINT DEFAULT 1,
        UNIQUE (SubId, StudentId),
        FOREIGN KEY (SubId) REFERENCES Subject (SubId),
        FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
 );
 
 INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
 INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
 select * from `Subject`
 where Credit = (select max(Credit) from `Subject`);
 
 select s.*, m.Mark 
 from `Subject` s join Mark m on s.SubId = m.SubId
 where m.Mark = (select max(m.Mark) from Mark m);
 
 select s.*, avg(m.Mark) as dtb
 from Student s join Mark m on s.StudentId = m.StudentId
 group by s.StudentId
 order by dtb desc;
 
 
 
 