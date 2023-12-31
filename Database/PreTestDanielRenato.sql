USE [master]
GO
/****** Object:  Database [PreTestDanielRenato]    Script Date: 04/08/2023 21:12:36 ******/
CREATE DATABASE [PreTestDanielRenato] ON  PRIMARY 
( NAME = N'PreTestDanielRenato', FILENAME = N'D:\SQL SERVER 2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\PreTestDanielRenato.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreTestDanielRenato_log', FILENAME = N'D:\SQL SERVER 2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\PreTestDanielRenato_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreTestDanielRenato].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreTestDanielRenato] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreTestDanielRenato] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreTestDanielRenato] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreTestDanielRenato] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreTestDanielRenato] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreTestDanielRenato] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PreTestDanielRenato] SET  MULTI_USER 
GO
ALTER DATABASE [PreTestDanielRenato] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreTestDanielRenato] SET DB_CHAINING OFF 
GO
USE [PreTestDanielRenato]
GO
/****** Object:  Table [dbo].[Table_Company]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [uniqueidentifier] NULL,
	[Name] [varchar](225) NULL,
	[Address] [varchar](225) NULL,
	[Email] [varchar](50) NULL,
	[Telephone] [varchar](14) NULL,
	[Flag] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Document]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Document](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [uniqueidentifier] NULL,
	[IDCompany] [int] NULL,
	[IDCategory] [int] NULL,
	[Name] [varchar](225) NULL,
	[Description] [text] NULL,
	[Flag] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Table_Document] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Document_Category]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Document_Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [uniqueidentifier] NULL,
	[Name] [varchar](225) NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_DocumentCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Position]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Position](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [uniqueidentifier] NULL,
	[Name] [varchar](225) NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_User]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [uniqueidentifier] NULL,
	[IDCompany] [int] NULL,
	[IDPosition] [int] NULL,
	[Name] [varchar](225) NULL,
	[Address] [text] NULL,
	[Email] [varchar](50) NULL,
	[Telephone] [varchar](14) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](225) NULL,
	[Role] [varchar](50) NULL,
	[Flag] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_table_user] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_AllTable]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AllTable]
AS
SELECT dbo.Table_Company.ID, dbo.Table_Company.UID, dbo.Table_Company.Name, dbo.Table_Company.Address, dbo.Table_Company.Email, dbo.Table_Company.Telephone, dbo.Table_Company.Flag, dbo.Table_Company.CreatedBy, dbo.Table_Company.CreatedAt, 
             dbo.Table_Document.ID AS Expr1, dbo.Table_Document.UID AS Expr2, dbo.Table_Document.IDCompany, dbo.Table_Document.IDCategory, dbo.Table_Document.Name AS Expr3, dbo.Table_Document.Description, dbo.Table_Document.Flag AS Expr4, 
             dbo.Table_Document.CreatedBy AS Expr5, dbo.Table_Document.CreatedAt AS Expr6, dbo.Table_Document_Category.ID AS Expr7, dbo.Table_Document_Category.UID AS Expr8, dbo.Table_Document_Category.Name AS Expr9, dbo.Table_Document_Category.CreatedBy AS Expr10, 
             dbo.Table_Document_Category.CreatedAt AS Expr11, dbo.Table_Position.ID AS Expr12, dbo.Table_Position.UID AS Expr13, dbo.Table_Position.Name AS Expr14, dbo.Table_Position.CreatedBy AS Expr15, dbo.Table_Position.CreatedAt AS Expr16, dbo.Table_User.ID AS Expr17, 
             dbo.Table_User.UID AS Expr18, dbo.Table_User.IDCompany AS Expr19, dbo.Table_User.IDPosition, dbo.Table_User.Name AS Expr20, dbo.Table_User.Address AS Expr21, dbo.Table_User.Email AS Expr22, dbo.Table_User.Telephone AS Expr23, dbo.Table_User.Username, 
             dbo.Table_User.Password, dbo.Table_User.Role, dbo.Table_User.Flag AS Expr24, dbo.Table_User.CreatedBy AS Expr25, dbo.Table_User.CreatedAt AS Expr26
FROM   dbo.Table_Company INNER JOIN
             dbo.Table_Document ON dbo.Table_Company.ID = dbo.Table_Document.IDCompany INNER JOIN
             dbo.Table_Document_Category ON dbo.Table_Document.IDCategory = dbo.Table_Document_Category.ID INNER JOIN
             dbo.Table_Position ON dbo.Table_Company.ID = dbo.Table_Position.ID INNER JOIN
             dbo.Table_User ON dbo.Table_Company.ID = dbo.Table_User.IDCompany AND dbo.Table_Position.ID = dbo.Table_User.IDPosition
GO
SET IDENTITY_INSERT [dbo].[Table_Company] ON 

INSERT [dbo].[Table_Company] ([ID], [UID], [Name], [Address], [Email], [Telephone], [Flag], [CreatedBy], [CreatedAt]) VALUES (1, N'0ca6df07-bb35-45d6-a0ea-bc82d20166f5', N'Company A', N'Jl. Contoh 123', N'companyA@example.com', N'081234567890', 1, 201, CAST(N'2023-08-03T09:55:11.677' AS DateTime))
INSERT [dbo].[Table_Company] ([ID], [UID], [Name], [Address], [Email], [Telephone], [Flag], [CreatedBy], [CreatedAt]) VALUES (2, N'df7a18eb-ae4c-4af8-a51e-49f0783b6e9b', N'Company B', N'Jl. Contoh 456', N'companyB@example.com', N'082345678901', 2, 202, CAST(N'2023-08-03T09:55:11.677' AS DateTime))
INSERT [dbo].[Table_Company] ([ID], [UID], [Name], [Address], [Email], [Telephone], [Flag], [CreatedBy], [CreatedAt]) VALUES (3, N'9e918170-44be-49a2-acdf-bbcf8d790cbf', N'Company C', N'Jl. Contoh 789', N'companyC@example.com', N'083456789012', 3, 203, CAST(N'2023-08-03T09:55:11.677' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Table_Document] ON 

INSERT [dbo].[Table_Document] ([ID], [UID], [IDCompany], [IDCategory], [Name], [Description], [Flag], [CreatedBy], [CreatedAt]) VALUES (1, N'a0d6bc65-7c23-4ca7-8318-435106d6e57c', 1, 1, N'Document A', N'This is Document A', 1, 401, CAST(N'2023-08-03T10:00:24.597' AS DateTime))
INSERT [dbo].[Table_Document] ([ID], [UID], [IDCompany], [IDCategory], [Name], [Description], [Flag], [CreatedBy], [CreatedAt]) VALUES (2, N'e3e7d0e5-c2dc-4d08-bdb1-70be348e853d', 2, 2, N'Document B', N'This is Document B', 2, 402, CAST(N'2023-08-03T10:00:24.597' AS DateTime))
INSERT [dbo].[Table_Document] ([ID], [UID], [IDCompany], [IDCategory], [Name], [Description], [Flag], [CreatedBy], [CreatedAt]) VALUES (3, N'4c68db6a-c879-4a89-843b-090713e85c08', 3, 3, N'Document C', N'This is Document C', 3, 403, CAST(N'2023-08-03T10:00:24.597' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_Document] OFF
GO
SET IDENTITY_INSERT [dbo].[Table_Document_Category] ON 

INSERT [dbo].[Table_Document_Category] ([ID], [UID], [Name], [CreatedBy], [CreatedAt]) VALUES (1, N'8ff9bf4b-a285-4d26-b508-af58170b171e', N'Category A', 301, CAST(N'2023-08-03T09:57:17.943' AS DateTime))
INSERT [dbo].[Table_Document_Category] ([ID], [UID], [Name], [CreatedBy], [CreatedAt]) VALUES (2, N'83274d44-378a-4c6e-8927-ecd162d5862f', N'Category B', 302, CAST(N'2023-08-03T09:57:17.943' AS DateTime))
INSERT [dbo].[Table_Document_Category] ([ID], [UID], [Name], [CreatedBy], [CreatedAt]) VALUES (3, N'370dbbf9-48a4-4a6f-b52c-11d31d8c362a', N'Category C', 303, CAST(N'2023-08-03T09:57:17.943' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_Document_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Table_Position] ON 

INSERT [dbo].[Table_Position] ([ID], [UID], [Name], [CreatedBy], [CreatedAt]) VALUES (1, N'e8c2433c-80c0-4d93-b71b-c45f8d33dad1', N'Manager', 101, CAST(N'2023-08-03T09:53:01.293' AS DateTime))
INSERT [dbo].[Table_Position] ([ID], [UID], [Name], [CreatedBy], [CreatedAt]) VALUES (2, N'f2ce68c3-23de-4d8e-ae15-7f9a25d68346', N'Staff', 102, CAST(N'2023-08-03T09:53:01.293' AS DateTime))
INSERT [dbo].[Table_Position] ([ID], [UID], [Name], [CreatedBy], [CreatedAt]) VALUES (3, N'3bbb7bea-6aec-4fab-9238-a4397849bccf', N'Supervisor', 103, CAST(N'2023-08-03T09:53:01.293' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_Position] OFF
GO
SET IDENTITY_INSERT [dbo].[Table_User] ON 

INSERT [dbo].[Table_User] ([ID], [UID], [IDCompany], [IDPosition], [Name], [Address], [Email], [Telephone], [Username], [Password], [Role], [Flag], [CreatedBy], [CreatedAt]) VALUES (1, N'7bb0a9c9-7e6e-4a34-a47f-2d51e4ca5157', 1, 1, N'Super Admin', N'Address of User A', N'superadmin@gmail.com', N'08123456789', N'superadmin', N'AC497CFABA23C4184CB03B97E8C51E0A', N'Admin', 1, 501, CAST(N'2023-08-03T10:05:20.217' AS DateTime))
INSERT [dbo].[Table_User] ([ID], [UID], [IDCompany], [IDPosition], [Name], [Address], [Email], [Telephone], [Username], [Password], [Role], [Flag], [CreatedBy], [CreatedAt]) VALUES (2, N'778ed0c5-074c-4bda-a09a-e74ff222ae76', 2, 2, N'Admin', N'Address of User B', N'admin@gmail.com', N'08234567890', N'admin', N'0192023A7BBD73250516F069DF18B500', N'Admin', 2, 502, CAST(N'2023-08-03T10:05:20.217' AS DateTime))
INSERT [dbo].[Table_User] ([ID], [UID], [IDCompany], [IDPosition], [Name], [Address], [Email], [Telephone], [Username], [Password], [Role], [Flag], [CreatedBy], [CreatedAt]) VALUES (3, N'f8c993b7-0d80-4269-ba79-911229548fb7', 3, 3, N'Client', N'Address of User C', N'client@gmail.com', N'08345678901', N'client', N'3677B23BAA08F74C28ABA07F0CB6554E', N'Client', 3, 503, CAST(N'2023-08-03T10:05:20.217' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_User] OFF
GO
ALTER TABLE [dbo].[Table_Document]  WITH CHECK ADD  CONSTRAINT [FK_Table_Document_Table_Company] FOREIGN KEY([IDCompany])
REFERENCES [dbo].[Table_Company] ([ID])
GO
ALTER TABLE [dbo].[Table_Document] CHECK CONSTRAINT [FK_Table_Document_Table_Company]
GO
ALTER TABLE [dbo].[Table_Document]  WITH CHECK ADD  CONSTRAINT [FK_Table_Document_Table_Document_Category] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Table_Document_Category] ([ID])
GO
ALTER TABLE [dbo].[Table_Document] CHECK CONSTRAINT [FK_Table_Document_Table_Document_Category]
GO
ALTER TABLE [dbo].[Table_User]  WITH CHECK ADD  CONSTRAINT [FK_Table_User_Table_Company] FOREIGN KEY([IDCompany])
REFERENCES [dbo].[Table_Company] ([ID])
GO
ALTER TABLE [dbo].[Table_User] CHECK CONSTRAINT [FK_Table_User_Table_Company]
GO
ALTER TABLE [dbo].[Table_User]  WITH CHECK ADD  CONSTRAINT [FK_Table_User_Table_Position] FOREIGN KEY([IDPosition])
REFERENCES [dbo].[Table_Position] ([ID])
GO
ALTER TABLE [dbo].[Table_User] CHECK CONSTRAINT [FK_Table_User_Table_Position]
GO
/****** Object:  StoredProcedure [dbo].[sp_createCompany]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_createCompany]
	-- Add the parameters for the stored procedure here
	@name varchar(225),
	@address text,
	@email varchar(50),
	@telephone varchar(50),
	@flag int,
	@iduser int,
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Table_Company]
           ([UID]
           ,[Name]
           ,[Address]
		   ,[Email]
           ,[Telephone]
		   ,[Flag]
		   ,[CreatedBy]
           ,[CreatedAt])

		    VALUES
           (NEWID()
           ,@name
           ,@address
		   ,@email
           ,@telephone
		   ,@flag
		   ,@iduser
		   ,GETDATE())

		   IF(@@ROWCOUNT > 0)
		   BEGIN 
			SET @retVal = 200
			END

			ELSE
			BEGIN 
				SET @retVal = 500
			END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_createDocument]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_createDocument]
	-- Add the parameters for the stored procedure here
	@Idcompany int,
	@Idcategory int,
	@name varchar(225),
	@description text,
	@flag int,
	@iduser int,
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Table_Document]
           ([UID]
           ,[IDCompany]
           ,[IDCategory]
           ,[Name]
           ,[Description]
           ,[Flag]
           ,[CreatedBy]
           ,[CreatedAt])

		    VALUES
           (NEWID()
           ,@Idcompany
		   ,@Idcategory
           ,@name
           ,@description
		   ,@flag
		   ,@iduser
		   ,GETDATE())

		   IF(@@ROWCOUNT > 0)
		   BEGIN 
			SET @retVal = 200
			END

			ELSE
			BEGIN 
				SET @retVal = 500
			END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_createDocumentCategory]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_createDocumentCategory] 
	-- Add the parameters for the stored procedure here
	@name varchar(50),
	@iduser int,
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Table_Document_Category]
           ([UID]
           ,[Name]
           ,[CreatedBy]
           ,[CreatedAt])

		    VALUES
           (NEWID()
           ,@name
		   ,@Iduser
		   ,GETDATE())

		   IF(@@ROWCOUNT > 0)
		   BEGIN 
			SET @retVal = 200
			END

			ELSE
			BEGIN 
				SET @retVal = 500
			END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_createPosition]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_createPosition] 
	-- Add the parameters for the stored procedure here
	@name varchar(50),
	@iduser int,
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Table_Position]
           ([UID]
           ,[Name]
           ,[CreatedBy]
           ,[CreatedAt])

		    VALUES
           (NEWID()
           ,@name
		   ,@Iduser
		   ,GETDATE())

		   IF(@@ROWCOUNT > 0)
		   BEGIN 
			SET @retVal = 200
			END

			ELSE
			BEGIN 
				SET @retVal = 500
			END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_createUser]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_createUser] 
	-- Add the parameters for the stored procedure here
	@Idcompany int,
	@Idposition int,
	@name varchar(50),
	@address text,
	@email varchar(50),
	@telephone varchar(50),
	@username varchar(50),
	@password varchar(50),
	@role varchar(50),
	@flag int,
	@iduser int,
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Table_User]
           ([UID]
           ,[IDCompany]
           ,[IDPosition]
           ,[Name]
           ,[Address]
           ,[Email]
           ,[Telephone]
           ,[Username]
           ,[Password]
           ,[Role]
           ,[Flag]
           ,[CreatedBy]
           ,[CreatedAt])

		    VALUES
           (NEWID()
           ,@Idcompany
		   ,@Idposition
           ,@name
           ,@address
           ,@email
           ,@telephone
           ,@username
           ,CONVERT(VARCHAR(32),HashBytes('MD5',@password),2)
           ,@role
		   ,@flag
		   ,@iduser
		   ,GETDATE())

		   IF(@@ROWCOUNT > 0)
		   BEGIN 
			SET @retVal = 200
			END

			ELSE
			BEGIN 
				SET @retVal = 500
			END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteCompany]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_deleteCompany]
	-- Add the parameters for the stored procedure here

	@id int,

	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[Table_User]
	WHERE IDCompany = @id

	 -- Insert statements for procedure here
	DELETE FROM [dbo].[Table_Document]
	WHERE IDCompany = @id
	
    -- Insert statements for procedure here
	DELETE 
	FROM [dbo].[Table_Company] 
	WHERE ID = @id
	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retVal = 200
	END
	ELSE
	BEGIN 
	SET @retVal = 500
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteDocument]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_deleteDocument]
	-- Add the parameters for the stored procedure here
	@id int,

	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		DELETE 
	FROM [dbo].[Table_Document] 
	WHERE ID = @id
	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retVal = 200
	END
	ELSE
	BEGIN 
	SET @retVal = 500
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteDocumentCategory]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_deleteDocumentCategory] 
	-- Add the parameters for the stored procedure here
	@id int,

	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[Table_Document]
	WHERE IDCategory = @id

	DELETE 
	FROM [dbo].[Table_Document_Category] 
	WHERE ID = @id
	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retVal = 200
	END
	ELSE
	BEGIN 
	SET @retVal = 500
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePosition]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_deletePosition] 
	-- Add the parameters for the stored procedure here
	@id int,

	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


	DELETE FROM [dbo].[Table_User]
	WHERE IDPosition = @id


	DELETE 
	FROM [dbo].[Table_Position] 
	WHERE ID = @id
	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retVal = 200
	END
	ELSE
	BEGIN 
	SET @retVal = 500
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteUser]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_deleteUser] 
	-- Add the parameters for the stored procedure here
	@id int,
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		DELETE 
	FROM [dbo].[Table_User] 
	WHERE ID = @id
	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retVal = 200
	END
	ELSE
	BEGIN 
	SET @retVal = 500
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_loginUser]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_loginUser]
	-- Add the parameters for the stored procedure here
	@email varchar(50),
	@password varchar(50), 
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ID], [Username], [Email], [Role], [CreatedAt]
	from Table_User
	WHERE [Email] = @email and [Password] = CONVERT(VARCHAR(32),HashBytes('MD5',@password),2)

	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retval = 200
	END
	ELSE
	BEGIN
	SET @retVal = 500
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_updateCompany]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_updateCompany]
	-- Add the parameters for the stored procedure here

	@id int,
	@name varchar(225),
	@address text,
	@email varchar(50),
	@telephone varchar(50),
	@flag int,
	@iduser int,
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		DELETE 
	FROM [dbo].[Table_Document] 
	WHERE ID = @id
	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retVal = 200
	END
	ELSE
	BEGIN 
	SET @retVal = 500
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_updateDocument]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_updateDocument]
	-- Add the parameters for the stored procedure here
	@id int,
	@Idcompany int,
	@Idcategory int,
	@name varchar(225),
	@description text,
	@flag int,
	@iduser int,
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		UPDATE [dbo].[Table_Document] SET
           
           [Name] = @name
           ,[Description] = @description
		    ,[Flag] = @flag
			,[CreatedBy] = @iduser
        

		    WHERE ID = @id

		   IF(@@ROWCOUNT > 0)
		   BEGIN 
			SET @retVal = 200
			END

			ELSE
			BEGIN 
				SET @retVal = 500
			END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_updateDocumentCategory]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_updateDocumentCategory] 
	-- Add the parameters for the stored procedure here
	@id int,
	@name varchar(50),
	@iduser int,
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Table_Document_Category] SET
           
           [Name] = @name
           ,[CreatedBy] = @iduser

		    WHERE ID = @id

		   IF(@@ROWCOUNT > 0)
		   BEGIN 
			SET @retVal = 200
			END

			ELSE
			BEGIN 
				SET @retVal = 500
			END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_updatePosition]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_updatePosition] 
	-- Add the parameters for the stored procedure here
	@id int,
	@name varchar(50),
	@iduser int,
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Table_Position] SET
           
           [Name] = @name
           ,[CreatedBy] = @iduser

		    WHERE ID = @id

		   IF(@@ROWCOUNT > 0)
		   BEGIN 
			SET @retVal = 200
			END

			ELSE
			BEGIN 
				SET @retVal = 500
			END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_updateUser]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_updateUser] 
	-- Add the parameters for the stored procedure here
	@id int,
	@Idcompany int,
	@Idposition int,
	@name varchar(50),
	@address text,
	@email varchar(50),
	@telephone varchar(50),
	@username varchar(50),
	@password varchar(50),
	@role varchar(50),
	@flag int,
	@iduser int,
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Table_User] SET
	  
			[IDCompany] = @Idcompany
			,[IDPosition] = @Idposition
           ,[Name] = @name
           ,[Address] = @address
           ,[Email] = @email
           ,[Telephone] = @telephone
           ,[Username] = @username
           ,[Password] = CONVERT(VARCHAR(32),HashBytes('MD5',@password),2)
		   ,[Flag] = @flag
		   ,[CreatedBy] = @iduser


		   WHERE ID = @id

		   IF(@@ROWCOUNT > 0)
		   BEGIN 
			SET @retVal = 200
			END

			ELSE
			BEGIN 
				SET @retVal = 500
			END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_viewCompany]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_viewCompany]
	-- Add the parameters for the stored procedure here

	

	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	
    -- Insert statements for procedure here
	SELECT *
	FROM [dbo].[Table_User]

	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retVal = 200
	END
	ELSE
	BEGIN 
	SET @retVal = 500
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_viewDocument]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_viewDocument]
	-- Add the parameters for the stored procedure here
	

	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT *
	FROM [dbo].[Table_Document]

	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retVal = 200
	END
	ELSE
	BEGIN 
	SET @retVal = 500
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_viewDocumentCategory]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_viewDocumentCategory] 
	-- Add the parameters for the stored procedure here
	@id int,

	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [dbo].[Table_Document_Category]
	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retVal = 200
	END
	ELSE
	BEGIN 
	SET @retVal = 500
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_viewPosition]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_viewPosition] 
	-- Add the parameters for the stored procedure here
	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [dbo].[Table_User]

	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retVal = 200
	END
	ELSE
	BEGIN 
	SET @retVal = 500
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_viewUser]    Script Date: 04/08/2023 21:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_viewUser] 

	@retVal int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [dbo].[Table_User]

	IF(@@ROWCOUNT > 0)
	BEGIN 
	SET @retVal = 200
	END
	ELSE
	BEGIN 
	SET @retVal = 500
	END
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[9] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Table_Company"
            Begin Extent = 
               Top = 6
               Left = 287
               Bottom = 194
               Right = 500
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Table_Document"
            Begin Extent = 
               Top = 35
               Left = 866
               Bottom = 426
               Right = 1079
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Table_Document_Category"
            Begin Extent = 
               Top = 157
               Left = 1165
               Bottom = 345
               Right = 1347
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Table_Position"
            Begin Extent = 
               Top = 168
               Left = 31
               Bottom = 359
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Table_User"
            Begin Extent = 
               Top = 177
               Left = 548
               Bottom = 365
               Right = 761
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AllTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AllTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AllTable'
GO
USE [master]
GO
ALTER DATABASE [PreTestDanielRenato] SET  READ_WRITE 
GO
