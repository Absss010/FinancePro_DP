USE [master]
GO
/****** Object:  Database [FinancePro]    Script Date: 17.06.2024 17:55:43 ******/
CREATE DATABASE [FinancePro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinancePro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FinancePro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinancePro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FinancePro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FinancePro] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinancePro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinancePro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinancePro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinancePro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinancePro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinancePro] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinancePro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinancePro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinancePro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinancePro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinancePro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinancePro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinancePro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinancePro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinancePro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinancePro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinancePro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinancePro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinancePro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinancePro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinancePro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinancePro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinancePro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinancePro] SET RECOVERY FULL 
GO
ALTER DATABASE [FinancePro] SET  MULTI_USER 
GO
ALTER DATABASE [FinancePro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinancePro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinancePro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinancePro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinancePro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinancePro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FinancePro', N'ON'
GO
ALTER DATABASE [FinancePro] SET QUERY_STORE = OFF
GO
USE [FinancePro]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 17.06.2024 17:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CardName] [nvarchar](50) NOT NULL,
	[AmountCard] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17.06.2024 17:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inquiry]    Script Date: 17.06.2024 17:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inquiry](
	[InquiryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ManagerID] [int] NULL,
	[Message] [nvarchar](max) NULL,
	[Response] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[DateResponded] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[InquiryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 17.06.2024 17:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Message] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17.06.2024 17:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 17.06.2024 17:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CardID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TypeID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 17.06.2024 17:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17.06.2024 17:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserSurname] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[Salt] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([CardID], [UserID], [CardName], [AmountCard]) VALUES (66, 3, N'qwe', CAST(6580.00 AS Decimal(18, 2)))
INSERT [dbo].[Card] ([CardID], [UserID], [CardName], [AmountCard]) VALUES (67, 3, N'zxc', CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Card] ([CardID], [UserID], [CardName], [AmountCard]) VALUES (72, 4, N'123', CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Card] ([CardID], [UserID], [CardName], [AmountCard]) VALUES (73, 4, N'4565', CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Card] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Продукты')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Зарплата')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Транспорт')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Премия')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Пенсия')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Развлечения')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Перевод между своими счетами')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'Перевод с карты на карту')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (10, N'Аванс')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (11, N'Подарок')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (12, N'Кредит')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Пользователь')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction] ON 

INSERT [dbo].[Transaction] ([TransactionID], [UserID], [CardID], [Amount], [TypeID], [CategoryID], [Date]) VALUES (275, 3, 66, CAST(5900.00 AS Decimal(18, 2)), 2, 2, CAST(N'2024-06-13' AS Date))
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [CardID], [Amount], [TypeID], [CategoryID], [Date]) VALUES (276, 3, 66, CAST(790.00 AS Decimal(18, 2)), 2, 11, CAST(N'2024-06-13' AS Date))
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [CardID], [Amount], [TypeID], [CategoryID], [Date]) VALUES (277, 3, 66, CAST(2500.00 AS Decimal(18, 2)), 2, 10, CAST(N'2024-06-13' AS Date))
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [CardID], [Amount], [TypeID], [CategoryID], [Date]) VALUES (278, 3, 66, CAST(-450.00 AS Decimal(18, 2)), 1, 1, CAST(N'2024-06-13' AS Date))
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [CardID], [Amount], [TypeID], [CategoryID], [Date]) VALUES (279, 3, 66, CAST(-600.00 AS Decimal(18, 2)), 1, 3, CAST(N'2024-06-13' AS Date))
INSERT [dbo].[Transaction] ([TransactionID], [UserID], [CardID], [Amount], [TypeID], [CategoryID], [Date]) VALUES (280, 3, 66, CAST(-1560.00 AS Decimal(18, 2)), 1, 7, CAST(N'2024-06-13' AS Date))
SET IDENTITY_INSERT [dbo].[Transaction] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([TypeID], [TypeName]) VALUES (1, N'Расход')
INSERT [dbo].[Type] ([TypeID], [TypeName]) VALUES (2, N'Доход')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [Salt]) VALUES (1, 1, N'Дитрих', N'Артём', N'Алексеевич', N'qwe', N'0WOby1PJng/oj7uJFDElFf2ba2aBdoB4C6umkiatLac=', N'kPDdV+Y59NjxLpiq+Qx2Ig==')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [Salt]) VALUES (2, 3, N'Дитрих', N'Надежда', N'Игоревна', N'qwe1', N'e1kneHhe52SW+uagnnyARCZWWjJMTlp8qp+G0EAWEzs=', N'Cnayia8596zxcC+fVsvB+A==')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [Salt]) VALUES (3, 2, N'Петров', N'Петр', N'Петрович', N'petr', N'W5FAuS8QYRAToF0ROyx7fA3ZiZ7WmQD3v6TVAdJaogg=', N'CjmoZmOT/9wDl1Hcq30xyw==')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [Salt]) VALUES (4, 2, N'Иванов', N'Иван', N'Иванович', N'ivan', N'FByJd3ZBrC85NxWP6AWvQVqWrANXUzGqrK7tcpYhmhE=', N'mXu2AuuaQQFpN6FXQeFVqg==')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [Salt]) VALUES (5, 2, N'Сидоров', N'Алексей', N'Игоревич', N'alex', N'pburjij6gjpNfxIzMy4l+npUZlM6MUvnaC6dWnmciJg=', N'wO7tpE+1V26naMT6m16XQw==')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Inquiry] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_User]
GO
ALTER TABLE [dbo].[Inquiry]  WITH CHECK ADD  CONSTRAINT [FK__Inquiry__Manager__6EF57B66] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Inquiry] CHECK CONSTRAINT [FK__Inquiry__Manager__6EF57B66]
GO
ALTER TABLE [dbo].[Inquiry]  WITH CHECK ADD  CONSTRAINT [FK__Inquiry__UserID__6E01572D] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Inquiry] CHECK CONSTRAINT [FK__Inquiry__UserID__6E01572D]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Card] FOREIGN KEY([CardID])
REFERENCES [dbo].[Card] ([CardID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Card]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Category]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Type]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [FinancePro] SET  READ_WRITE 
GO
