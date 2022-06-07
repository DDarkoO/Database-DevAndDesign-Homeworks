USE SEDCACADEMYDB

--HOMEWORK REQUIREMENTS
--●Declare scalar variable for storing FirstName values
  --•Assign value ‘Antonio’ to the FirstName variable
  --•Find all Students having FirstName same as the variable
--●Declare table variable that will contain StudentId, StudentName and DateOfBirth
  --•Fill the table variable with all Female students
--●Declare temp table that will contain LastName and EnrolledDate columns
  --•Fill the temp table with all Male students having First Name starting with ‘A’
  --•Retrieve the students from the table which last name is with 7 characters
--●Find all teachers whose FirstName length is less than 5 and
  --•the first 3 characters of their FirstName and LastName are the same


  --●Declare scalar variable for storing FirstName values
	--•Assign value ‘Antonio’ to the FirstName variable
	--•Find all Students having FirstName same as the variable

DECLARE @FirstName NVARCHAR (30)
SET @FirstName = 'Antonio'
SELECT * FROM Student
WHERE Student.FirstName = @FirstName


  --●Declare table variable that will contain StudentId, StudentName and DateOfBirth
    --•Fill the table variable with all Female students

DECLARE @StudentInfo TABLE (Student_ID int, Student_Name nvarchar(40), DateOfBirth datetime2)
INSERT INTO @StudentInfo
SELECT 
	ID, 
	CONCAT(FirstName,' ',LastName) AS Result,
	DateOfBirth 
FROM
	Student

SELECT * FROM @StudentInfo


--●Declare temp table that will contain LastName and EnrolledDate columns
  --•Fill the temp table with all Male students having First Name starting with ‘A’
  --•Retrieve the students from the table which last name is with 7 characters

CREATE TABLE #StudentInfo2 (LastName nvarchar(20), EnrolledDate datetime2)
INSERT INTO #StudentInfo2 
	SELECT
		s.LastName,
		s.EnrolledDate
	FROM 
		Student AS s
	WHERE 
		s.Gender = 'M' AND s.FirstName LIKE 'A%'

SELECT * FROM #StudentInfo2
SELECT * FROM #StudentInfo2
WHERE LEN(LastName) = 7
--DROP TABLE #StudentInfo2


--●Find all teachers whose FirstName length is less than 5 and
  --•the first 3 characters of their FirstName and LastName are the same

CREATE TABLE #TeacherInfo(TeacherId int, First_Name nvarchar(30), Last_Name nvarchar(30))

SELECT t.ID, t.FirstName, t.LastName FROM TEACHER AS t
		WHERE LEN(FirstName) < 5 
			  AND
			  LEFT(FirstName, 3) = LEFT(LastName, 3)
INSERT INTO #TeacherInfo

SELECT * FROM #TeacherInfo




-- KAKO DA VRATAM SOODVETNO POPULIRANA TABELA SO FUNKCIJA?

GO;
CREATE FUNCTION fn_TeacherInfo()
RETURNS @TeacherInfo TABLE (Teacher_ID int, FirstName nvarchar(20), LastName nvarchar (20))
   AS
BEGIN   
   INSERT INTO @TeacherInfo
	   SELECT t.ID, t.FirstName, t.LastName FROM TEACHER AS t
			WHERE LEN(FirstName) < 5 
				  AND
				  LEFT(FirstName, 3) = LEFT(LastName, 3)
   RETURN;
END;
GO;
SELECT * FROM @TeacherInfo

GO;

ALTER FUNCTION fn_TeacherInfo()
RETURNS @TeacherInfo TABLE (Teacher_ID int, FirstName nvarchar(20), LastName nvarchar (20))
   AS
BEGIN  
   INSERT INTO @TeacherInfo
	   SELECT t.ID, t.FirstName, t.LastName FROM TEACHER AS t
			WHERE LEN(FirstName) < 5 
				  AND
				  LEFT(FirstName, 3) = LEFT(LastName, 3)
   RETURN;
END;
GO;
SELECT * FROM @TeacherInfo