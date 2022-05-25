use [SEDCACADEMYDM]

CREATE TABLE [Students](
	[ID][int] IDENTITY (1,1) NOT NULL,
	[FirstName][nvarchar](20) NOT NULL,
	[LastName][nvarchar](20) NOT NULL,
	[DateOfBirth][date] NOT NULL,
	[EnrolledDate][date] NOT NULL,
	[Gender][nvarchar](6) NOT NULL,
	[NationalIdNumer][bigint] NOT NULL,
	[StudentCardNumber][int] NOT NULL
	CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED([Id] ASC)
)

CREATE TABLE [Teacher](
	[ID][int] IDENTITY (1,1) NOT NULL,
	[FirstName][nvarchar] NOT NULL,
	[LastName][nvarchar] NOT NULL,
	[DateOfBirth][date] NOT NULL,
	[AcademicRank][nvarchar] NOT NULL,
	[HireDate][date] NOT NULL
	CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED([Id] ASC)
)

CREATE TABLE [Grade](
	[ID][int] IDENTITY (1,1) NOT NULL,
	[StudentID][int] NOT NULL,
	[CourseID][int] NOT NULL,
	[TeacherID][int] NOT NULL,
	[Grade][nvarchar] NOT NULL,
	[Comment][nvarchar] NULL,
	[CreatedDate][date] NOT NULL
	CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED([Id] ASC)
)

CREATE TABLE [Course](
	[Id][int] IDENTITY (1,1) NOT NULL,
	[Name][nvarchar](30) NOT NULL,
	[Credit][int] NOT NULL,
	[AcademicYear][int] NOT NULL,
	[Semester][int] NOT NULL
	CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED([Id] ASC)
)

CREATE TABLE [GradeDetails](
	[ID][int] IDENTITY(1,1) NOT NULL,
	[AchievementTypeID][int] NOT NULL,
	[AchievementPoints][int] NOT NULL,
	[AchievementMaxPoints][int] NOT NULL,
	[AchievementDate][Date] NOT NULL
	CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED([Id] ASC)
)

CREATE TABLE [AchievementType](
	[ID][int] IDENTITY (1,1) NOT NULL,
	[Name][nvarchar](20) NOT NULL,
	[Description][nvarchar](50) NULL,
	[ParticipationRate][int] NULL
	CONSTRAINT [PK_AchievementType] PRIMARY KEY CLUSTERED([Id] ASC)
)