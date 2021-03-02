CREATE DATABASE COVID_Backend2
GO

USE COVID_Backend2
GO

CREATE TABLE [dbo].[Age_Category](
	[Age_Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Age_Category_Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Age_Category] PRIMARY KEY CLUSTERED
(
	[Age_Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ContactWithCovid](
	[Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[Contact_Known] [nvarchar](255) NULL,
 CONSTRAINT [PK_ContactWithCovid] PRIMARY KEY CLUSTERED
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Country](
	[Country_ID] [int] IDENTITY(1,1) NOT NULL,
	[Country_Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED
(
	[Country_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Gender](
	[Gender_ID] [int] IDENTITY(1,1) NOT NULL,
	[Gender_Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED
(
	[Gender_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Patient](
	[Patient_ID] [int] IDENTITY(1,1) NOT NULL,
	[Healthcare_Number] [nvarchar](255) NULL,
	[Patient_Lname] [nvarchar](255) NULL,
	[Patient_Fname] [nvarchar](255) NULL,
	[DOB] [datetime] NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED
(
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Severity](
	[Severity_ID] [int] IDENTITY(1,1) NOT NULL,
	[Severity_Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Severity] PRIMARY KEY CLUSTERED
(
	[Severity_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Symptoms](
	[Symptom_ID] [int] IDENTITY(1,1) NOT NULL,
	[Symptom_Name] [nvarchar](255) NULL,
	[Symptom_Description] [nvarchar](255) NULL,
	[Symptom_WHO_Tier] [nvarchar](255) NULL,
 CONSTRAINT [PK_Symptoms] PRIMARY KEY CLUSTERED
(
	[Symptom_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Visit](
	[Visit_ID] [int] IDENTITY(1,1) NOT NULL,
	[Visit_Patient_ID] [int] NULL,
	[Visit_Date] [datetime] NULL,
	[Visit_Age_Category_ID] [int] NULL,
	[Visit_Gender_ID] [int] NULL,
	[Visit_Country_ID] [int] NULL,
	[Visit_Contact_ID] [int] NULL,
	[Visit_Severity_ID] [int] NULL,
 CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED
(
	[Visit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Age_Category_ID] FOREIGN KEY([Visit_Age_Category_ID])
REFERENCES [dbo].[Age_Category] ([Age_Category_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Age_Category_ID]
GO

ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Contact_ID] FOREIGN KEY([Visit_Contact_ID])
REFERENCES [dbo].[ContactWithCovid] ([Contact_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Contact_ID]
GO

ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Country_ID] FOREIGN KEY([Visit_Country_ID])
REFERENCES [dbo].[Country] ([Country_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Country_ID]
GO

ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Gender_ID] FOREIGN KEY([Visit_Gender_ID])
REFERENCES [dbo].[Gender] ([Gender_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Gender_ID]
GO

ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Patient_ID] FOREIGN KEY([Visit_Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Patient_ID]
GO

ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Severity_ID] FOREIGN KEY([Visit_Severity_ID])
REFERENCES [dbo].[Severity] ([Severity_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Severity_ID]
GO

ALTER TABLE [dbo].[Visit]
ADD CONSTRAINT [DF_Visit_vtTimestamp]
DEFAULT (getdate()) FOR [Visit_Date]
GO

CREATE TABLE [dbo].[Visit_Symptoms](
	[Visit_Symptom_Visit_ID] [int] NOT NULL,
	[Visit_Symptom_Symptom_ID] [int] NOT NULL,
 CONSTRAINT [PK_Visit_Symptoms] PRIMARY KEY CLUSTERED
(
	[Visit_Symptom_Visit_ID] ASC,
	[Visit_Symptom_Symptom_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Visit_Symptoms]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Symptom_Symptom_ID] FOREIGN KEY([Visit_Symptom_Symptom_ID])
REFERENCES [dbo].[Symptoms] ([Symptom_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Visit_Symptoms] CHECK CONSTRAINT [FK_Visit_Symptom_Symptom_ID]
GO

ALTER TABLE [dbo].[Visit_Symptoms]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Symptom_Visit_ID] FOREIGN KEY([Visit_Symptom_Visit_ID])
REFERENCES [dbo].[Visit] ([Visit_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Visit_Symptoms] CHECK CONSTRAINT [FK_Visit_Symptom_Visit_ID]
GO
