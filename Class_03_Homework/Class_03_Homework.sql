--HOMEWORK REQUIREMENTS
--●Calculate the count of all grades per Teacher in the system
--●Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
--●Find the Maximal Grade, and the Average Grade per Student on all grades in the system
--●Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
--●Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
--●List Student First Name and Last Name next to the other details from previous query
--●Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
--●Change the view to show Student First and Last Names instead of StudentID
--●List all rows from view ordered by biggest Grade Count

USE [SEDCACADEMYDB]

--●Calculate the count of all grades per Teacher in the system

SELECT Teacher.FirstName , Teacher.LastName, COUNT(*) as Total_Number_of_grades FROM Grade
	JOIN Teacher ON TeacherID = Teacher.Id
GROUP BY Teacher.FirstName, Teacher.LastName
ORDER BY Total_Number_of_grades DESC


--●Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT t.FirstName, t.LastName, COUNT(*) as Number_of_grades FROM Grade
    JOIN Teacher AS t ON TeacherId = t.Id
WHERE StudentId < 100
GROUP BY t.FirstName, t.LastName


--●Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT s.ID AS Student_ID, MAX(Grade) AS Highest_grade, AVG(Grade) AS Average_Grade from Grade
    JOIN  Student AS s ON StudentId = s.ID
GROUP BY s.ID
ORDER BY s.ID


--●Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT teacherID AS Teacher_ID, COUNT(Grade) AS Count_of_grades FROM Grade
   JOIN Teacher ON TeacherID = Teacher.ID
GROUP BY TeacherID
HAVING COUNT(Grade) > 200
ORDER BY COUNT(Grade) 


--●Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT StudentID, COUNT(Grade) AS Total_num_of_grades, MAX(Grade) AS Highest_Grade, AVG(Grade) AS Average_Grade FROM Grade
    JOIN Student ON Student.ID = StudentID
GROUP BY StudentId
HAVING MAX(Grade) = AVG(Grade)


--●List Student First Name and Last Name next to the other details from previous query
SELECT StudentID, s.FirstName, s.LastName, COUNT(Grade) AS Total_num_of_grades, MAX(Grade) AS Highest_Grade, AVG(Grade) AS Average_Grade FROM Grade
    JOIN Student AS s ON s.ID = StudentID
GROUP BY StudentID, s.FirstName, s.LastName
HAVING MAX(Grade) = AVG(Grade)


--●Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

GO;
CREATE VIEW vw_StudentGrades AS
(
	SELECT StudentID,  COUNT(Grade) AS Number_Of_Grades FROM Grade
	GROUP BY StudentID
)
GO;

SELECT * FROM vw_StudentGrades


--●Change the view to show Student First and Last Names instead of StudentID
GO;
ALTER VIEW vw_StudentGrades AS
(
	SELECT TOP 1000 s.FirstName, s.LastName, COUNT(Grade) AS Number_Of_Grades FROM Grade
	    JOIN Student AS s ON s.Id = StudentID
	GROUP BY s.FirstName, s.LastName
	ORDER BY s.FirstName
)
GO;
SELECT * FROM vw_StudentGrades

--●List all rows from view ordered by biggest Grade Count
GO;
ALTER VIEW vw_StudentGrades AS
(
	SELECT TOP 1000 s.FirstName, s.LastName, COUNT(Grade) AS Number_Of_Grades FROM Grade
	    JOIN Student AS s ON s.Id = StudentID
	GROUP BY s.FirstName, s.LastName
	ORDER BY COUNT(Grade) DESC
)
GO;
SELECT * FROM vw_StudentGrades