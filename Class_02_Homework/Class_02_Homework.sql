--Requirements
	--Find all Students  with FirstName = Antonio
	--Find all Students with DateOfBirth greater than ‘01.01.1999’
	--Find all Students with LastName starting With ‘J’ enrolled in January/1998
	--List all Students ordered  by FirstName
	--List all Teacher  Last Names and Student Last Names in single result set. Remove  duplicates 
	--Create  Foreign key constraints  from diagram or with script
	--List all possible combinations  of Courses  names and AchievementType names that can be passed  by student
	--List all Teachers  without exam Grade


USE [SEDCACADEMYDB]


	--Find all Students  with FirstName = Antonio

SELECT * FROM [dbo].[Student]
WHERE FirstName = 'Antonio';


	--Find all Students with DateOfBirth greater than ‘01.01.1999’

SELECT * FROM Student
WHERE DateOfBirth > '01.01.1999'

	--Find all Students with LastName starting With ‘J’ enrolled in January/1998

SELECT * FROM Student
WHERE LastName LIKE 'J%' AND MONTH(EnrolledDate) = 01 AND YEAR(EnrolledDate) = 1998;

	--List all Students ordered  by FirstName

SELECT * FROM Student
ORDER BY FirstName;


	--List all Teacher  Last Names and Student Last Names in single result set. Remove  duplicates 

SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student


	--Create  Foreign key constraints from diagram or with script

--Grade/StudentID
ALTER TABLE Grade
DROP COLUMN StudentID
GO
ALTER TABLE Grade
ADD StudentID int
GO
ALTER TABLE Grade WITH NOCHECK
ADD CONSTRAINT [FK_Student_ID]
FOREIGN KEY([StudentID])
REFERENCES Student ([ID])

--ALTER TABLE Grade
--DROP CONSTRAINT StudentID
--alter table Grade
--drop column StudentID

--Grade/CourseID
ALTER TABLE Grade
DROP COLUMN CourseID
GO
ALTER TABLE Grade
ADD CourseID int
GO
ALTER TABLE Grade WITH NOCHECK
ADD CONSTRAINT [FK_Course_ID]
FOREIGN KEY([CourseID])
REFERENCES Course ([ID])

--ALTER TABLE Grade
--DROP CONSTRAINT FK_COURSE_ID

--Grade/TeacherID
ALTER TABLE Grade
DROP COLUMN TeacherID
GO
ALTER TABLE Grade
ADD TeacherID int
GO
ALTER TABLE Grade WITH NOCHECK
ADD CONSTRAINT [FK_Teacher_ID]
FOREIGN KEY([TeacherID])
REFERENCES Teacher ([ID])

--ALTER TABLE Grade
--DROP CONSTRAINT FK_Teacher_ID

--GradeDetails/GradeID
ALTER TABLE GradeDetails
DROP COLUMN GradeID
GO
ALTER TABLE GradeDetails
ADD GradeID int
GO
ALTER TABLE GradeDetails WITH NOCHECK
ADD CONSTRAINT [FK_Grade_ID]
FOREIGN KEY([GradeID])
REFERENCES Grade ([ID])

--ALTER TABLE GradeDetails
--DROP CONSTRAINT FK_Grade_ID


	--List all possible combinations  of Courses  names and AchievementType names that can be passed  by student

SELECT AchievementType.[Name], Course.[Name] FROM AchievementType
CROSS JOIN Course


	--List all Teachers without exam Grade


SELECT * FROM Teacher AS t
LEFT JOIN Grade AS g
ON t.Id = g.Grade
WHERE g.Id IS NULL