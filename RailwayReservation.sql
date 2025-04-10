USE [master]
GO
/****** Object:  Database [RailwayReservation]    Script Date: 10/04/2025 14:06:15 ******/
CREATE DATABASE [RailwayReservation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RailwayReservation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RailwayReservation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RailwayReservation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RailwayReservation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RailwayReservation] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RailwayReservation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RailwayReservation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RailwayReservation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RailwayReservation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RailwayReservation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RailwayReservation] SET ARITHABORT OFF 
GO
ALTER DATABASE [RailwayReservation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RailwayReservation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RailwayReservation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RailwayReservation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RailwayReservation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RailwayReservation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RailwayReservation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RailwayReservation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RailwayReservation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RailwayReservation] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RailwayReservation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RailwayReservation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RailwayReservation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RailwayReservation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RailwayReservation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RailwayReservation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RailwayReservation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RailwayReservation] SET RECOVERY FULL 
GO
ALTER DATABASE [RailwayReservation] SET  MULTI_USER 
GO
ALTER DATABASE [RailwayReservation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RailwayReservation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RailwayReservation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RailwayReservation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RailwayReservation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RailwayReservation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RailwayReservation', N'ON'
GO
ALTER DATABASE [RailwayReservation] SET QUERY_STORE = ON
GO
ALTER DATABASE [RailwayReservation] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RailwayReservation]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/04/2025 14:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cancellations]    Script Date: 10/04/2025 14:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancellations](
	[cancellation_id] [int] NOT NULL,
	[reservation_id] [int] NULL,
	[cancellation_date] [datetime] NULL,
	[cancellation_charges] [decimal](10, 2) NULL,
	[refund_amount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[cancellation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coaches]    Script Date: 10/04/2025 14:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coaches](
	[coach_id] [int] NOT NULL,
	[train_id] [int] NULL,
	[coach_type] [varchar](50) NULL,
	[seat_capacity] [int] NULL,
	[fare_multiplier] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[coach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 10/04/2025 14:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[reservation_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[schedule_id] [int] NULL,
	[seat_id] [int] NULL,
	[pnr_number] [varchar](20) NULL,
	[number_of_passengers] [int] NULL,
	[total_fare] [decimal](10, 2) NULL,
	[status] [varchar](50) NULL,
	[booked_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 10/04/2025 14:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[seat_id] [int] NOT NULL,
	[coach_id] [int] NULL,
	[seat_number] [varchar](10) NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[seat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stations]    Script Date: 10/04/2025 14:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stations](
	[station_id] [int] NOT NULL,
	[station_name] [varchar](100) NULL,
	[location] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[station_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Train_Schedules]    Script Date: 10/04/2025 14:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Train_Schedules](
	[schedule_id] [int] NOT NULL,
	[train_id] [int] NULL,
	[station_id] [int] NULL,
	[arrival_time] [datetime] NULL,
	[departure_time] [datetime] NULL,
	[stop_number] [int] NULL,
	[journey_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trains]    Script Date: 10/04/2025 14:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trains](
	[train_id] [int] NOT NULL,
	[train_name] [varchar](100) NULL,
	[train_type] [varchar](50) NULL,
	[start_station_id] [int] NULL,
	[end_station_id] [int] NULL,
	[base_fare] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[train_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/04/2025 14:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] NOT NULL,
	[name] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](15) NULL,
	[password_hash] [varchar](255) NULL,
	[gender] [varchar](10) NULL,
	[age] [int] NULL,
	[address] [varchar](255) NULL,
	[role] [varchar](50) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cancellations] ([cancellation_id], [reservation_id], [cancellation_date], [cancellation_charges], [refund_amount]) VALUES (1, 1, CAST(N'2025-04-07T00:21:33.743' AS DateTime), CAST(50.00 AS Decimal(10, 2)), CAST(450.00 AS Decimal(10, 2)))
INSERT [dbo].[Cancellations] ([cancellation_id], [reservation_id], [cancellation_date], [cancellation_charges], [refund_amount]) VALUES (2, 2, CAST(N'2025-04-07T01:02:37.830' AS DateTime), CAST(75.00 AS Decimal(10, 2)), CAST(675.00 AS Decimal(10, 2)))
INSERT [dbo].[Cancellations] ([cancellation_id], [reservation_id], [cancellation_date], [cancellation_charges], [refund_amount]) VALUES (3, 3, CAST(N'2025-04-07T01:02:37.830' AS DateTime), CAST(100.00 AS Decimal(10, 2)), CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Cancellations] ([cancellation_id], [reservation_id], [cancellation_date], [cancellation_charges], [refund_amount]) VALUES (4, 4, CAST(N'2025-04-07T01:02:37.830' AS DateTime), CAST(90.00 AS Decimal(10, 2)), CAST(810.00 AS Decimal(10, 2)))
INSERT [dbo].[Cancellations] ([cancellation_id], [reservation_id], [cancellation_date], [cancellation_charges], [refund_amount]) VALUES (5, 11, CAST(N'2025-04-07T01:12:14.007' AS DateTime), CAST(70.00 AS Decimal(10, 2)), CAST(630.00 AS Decimal(10, 2)))
INSERT [dbo].[Cancellations] ([cancellation_id], [reservation_id], [cancellation_date], [cancellation_charges], [refund_amount]) VALUES (6, 12, CAST(N'2025-04-07T01:12:14.010' AS DateTime), CAST(95.00 AS Decimal(10, 2)), CAST(855.00 AS Decimal(10, 2)))
INSERT [dbo].[Cancellations] ([cancellation_id], [reservation_id], [cancellation_date], [cancellation_charges], [refund_amount]) VALUES (7, 7, CAST(N'2025-04-07T01:02:37.833' AS DateTime), CAST(75.00 AS Decimal(10, 2)), CAST(675.00 AS Decimal(10, 2)))
INSERT [dbo].[Cancellations] ([cancellation_id], [reservation_id], [cancellation_date], [cancellation_charges], [refund_amount]) VALUES (8, 8, CAST(N'2025-04-07T01:02:37.833' AS DateTime), CAST(100.00 AS Decimal(10, 2)), CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Cancellations] ([cancellation_id], [reservation_id], [cancellation_date], [cancellation_charges], [refund_amount]) VALUES (9, 9, CAST(N'2025-04-07T01:02:37.833' AS DateTime), CAST(90.00 AS Decimal(10, 2)), CAST(810.00 AS Decimal(10, 2)))
INSERT [dbo].[Cancellations] ([cancellation_id], [reservation_id], [cancellation_date], [cancellation_charges], [refund_amount]) VALUES (10, 10, CAST(N'2025-04-07T01:02:37.833' AS DateTime), CAST(60.00 AS Decimal(10, 2)), CAST(540.00 AS Decimal(10, 2)))
INSERT [dbo].[Cancellations] ([cancellation_id], [reservation_id], [cancellation_date], [cancellation_charges], [refund_amount]) VALUES (11, 1, CAST(N'2025-04-10T13:10:44.380' AS DateTime), CAST(50.00 AS Decimal(10, 2)), CAST(450.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (1, 101, N'Sleeper', 60, CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (2, 101, N'AC', 40, CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (3, 102, N'Sleeper', 60, CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (4, 102, N'AC', 40, CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (5, 103, N'Sleeper', 65, CAST(1.10 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (6, 104, N'AC', 45, CAST(2.20 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (7, 105, N'Sleeper', 70, CAST(1.30 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (8, 106, N'AC', 50, CAST(2.50 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (9, 107, N'Sleeper', 72, CAST(1.20 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (10, 108, N'AC', 55, CAST(2.60 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (11, 111, N'Sleeper', 68, CAST(1.20 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (12, 112, N'AC', 42, CAST(2.30 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (13, 113, N'Sleeper', 60, CAST(1.10 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (14, 114, N'AC', 44, CAST(2.40 AS Decimal(5, 2)))
INSERT [dbo].[Coaches] ([coach_id], [train_id], [coach_type], [seat_capacity], [fare_multiplier]) VALUES (15, 115, N'AC', 50, CAST(2.70 AS Decimal(5, 2)))
GO
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (1, 1, 1001, 1, N'PNR123456', 1, CAST(500.00 AS Decimal(10, 2)), N'Canceled', CAST(N'2025-04-07T00:21:33.743' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (2, 2, 1003, 3, N'PNR234567', 1, CAST(750.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:02:37.793' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (3, 3, 1005, 5, N'PNR345678', 1, CAST(1200.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:02:37.800' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (4, 4, 1007, 6, N'PNR456789', 1, CAST(900.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:02:37.803' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (5, 5, 1009, 7, N'PNR567890', 1, CAST(600.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:02:37.817' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (6, 6, 1002, 2, N'PNR678901', 1, CAST(500.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:02:37.820' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (7, 7, 1004, 4, N'PNR789012', 1, CAST(750.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:02:37.827' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (8, 8, 1006, 5, N'PNR890123', 1, CAST(1200.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:02:37.830' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (9, 9, 1008, 6, N'PNR901234', 1, CAST(900.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:02:37.830' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (10, 10, 1010, 7, N'PNR012345', 1, CAST(600.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:02:37.830' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (11, 11, 1017, 14, N'PNR112233', 1, CAST(700.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:10:39.290' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (12, 12, 1013, 12, N'PNR223344', 1, CAST(950.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:10:39.320' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (13, 13, 1011, 11, N'PNR334455', 1, CAST(1000.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-07T01:10:39.330' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (14, 14, 1012, 2, N'PNR000014', 1, CAST(500.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-10T12:49:22.070' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (15, 15, 1013, 3, N'PNR000015', 2, CAST(1500.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-10T12:49:22.077' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (16, 16, 1014, 11, N'PNR000016', 1, CAST(750.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-10T12:49:22.077' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (17, 17, 1015, 12, N'PNR000017', 1, CAST(850.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-10T12:49:22.077' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (18, 18, 1016, 13, N'PNR000018', 1, CAST(700.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-10T12:49:22.080' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (19, 19, 1017, 14, N'PNR000019', 1, CAST(650.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-10T12:49:22.080' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (20, 20, 1018, 15, N'PNR000020', 1, CAST(600.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-10T12:49:22.080' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (21, 11, 1019, 1, N'PNR000021', 1, CAST(1300.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-10T12:49:22.083' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (22, 12, 1020, 2, N'PNR000022', 1, CAST(1200.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-10T12:49:22.087' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (23, 13, 1002, 3, N'PNR000023', 1, CAST(500.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-10T12:49:22.087' AS DateTime))
INSERT [dbo].[Reservations] ([reservation_id], [user_id], [schedule_id], [seat_id], [pnr_number], [number_of_passengers], [total_fare], [status], [booked_at]) VALUES (24, 1, 1001, 2, N'PNR203161', 1, CAST(500.00 AS Decimal(10, 2)), N'Confirmed', CAST(N'2025-04-10T13:03:39.203' AS DateTime))
GO
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (1, 1, N'S1-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (2, 1, N'S1-02', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (3, 2, N'AC1-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (4, 3, N'S2-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (5, 4, N'AC2-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (6, 5, N'S3-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (7, 6, N'AC3-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (8, 7, N'S4-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (9, 8, N'AC4-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (10, 9, N'S5-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (11, 11, N'S6-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (12, 12, N'AC5-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (13, 13, N'S7-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (14, 14, N'AC6-01', N'Available')
INSERT [dbo].[Seats] ([seat_id], [coach_id], [seat_number], [status]) VALUES (15, 15, N'AC7-01', N'Available')
GO
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (1, N'Pune Junction', N'Pune')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (2, N'Mumbai CST', N'Mumbai')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (3, N'Nagpur', N'Nagpur')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (4, N'Delhi Junction', N'Delhi')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (5, N'Hyderabad Deccan', N'Hyderabad')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (6, N'Bangalore City', N'Bangalore')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (7, N'Chennai Central', N'Chennai')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (8, N'Lucknow Charbagh', N'Lucknow')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (9, N'Howrah', N'Kolkata')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (10, N'Ahmedabad Junction', N'Ahmedabad')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (11, N'Patna Junction', N'Patna')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (12, N'Bhopal Junction', N'Bhopal')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (13, N'Jaipur Junction', N'Jaipur')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (14, N'Surat', N'Surat')
INSERT [dbo].[Stations] ([station_id], [station_name], [location]) VALUES (15, N'Coimbatore Junction', N'Coimbatore')
GO
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1001, 101, 1, CAST(N'2025-04-10T06:00:00.000' AS DateTime), CAST(N'2025-04-10T06:10:00.000' AS DateTime), 1, CAST(N'2025-04-10' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1002, 101, 2, CAST(N'2025-04-10T10:00:00.000' AS DateTime), CAST(N'2025-04-10T10:10:00.000' AS DateTime), 2, CAST(N'2025-04-10' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1003, 102, 2, CAST(N'2025-04-11T07:00:00.000' AS DateTime), CAST(N'2025-04-11T07:10:00.000' AS DateTime), 1, CAST(N'2025-04-11' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1004, 102, 3, CAST(N'2025-04-11T13:00:00.000' AS DateTime), CAST(N'2025-04-11T13:10:00.000' AS DateTime), 2, CAST(N'2025-04-11' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1005, 103, 4, CAST(N'2025-04-12T08:00:00.000' AS DateTime), CAST(N'2025-04-12T08:10:00.000' AS DateTime), 1, CAST(N'2025-04-12' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1006, 103, 9, CAST(N'2025-04-12T20:00:00.000' AS DateTime), CAST(N'2025-04-12T20:10:00.000' AS DateTime), 2, CAST(N'2025-04-12' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1007, 104, 6, CAST(N'2025-04-13T06:30:00.000' AS DateTime), CAST(N'2025-04-13T06:45:00.000' AS DateTime), 1, CAST(N'2025-04-13' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1008, 104, 7, CAST(N'2025-04-13T12:00:00.000' AS DateTime), CAST(N'2025-04-13T12:10:00.000' AS DateTime), 2, CAST(N'2025-04-13' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1009, 105, 1, CAST(N'2025-04-14T05:00:00.000' AS DateTime), CAST(N'2025-04-14T05:10:00.000' AS DateTime), 1, CAST(N'2025-04-14' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1010, 105, 5, CAST(N'2025-04-14T09:00:00.000' AS DateTime), CAST(N'2025-04-14T09:10:00.000' AS DateTime), 2, CAST(N'2025-04-14' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1011, 111, 11, CAST(N'2025-04-15T06:00:00.000' AS DateTime), CAST(N'2025-04-15T06:10:00.000' AS DateTime), 1, CAST(N'2025-04-15' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1012, 111, 4, CAST(N'2025-04-15T20:00:00.000' AS DateTime), CAST(N'2025-04-15T20:10:00.000' AS DateTime), 2, CAST(N'2025-04-15' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1013, 112, 12, CAST(N'2025-04-16T07:00:00.000' AS DateTime), CAST(N'2025-04-16T07:10:00.000' AS DateTime), 1, CAST(N'2025-04-16' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1014, 112, 4, CAST(N'2025-04-16T15:00:00.000' AS DateTime), CAST(N'2025-04-16T15:10:00.000' AS DateTime), 2, CAST(N'2025-04-16' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1015, 113, 13, CAST(N'2025-04-17T09:00:00.000' AS DateTime), CAST(N'2025-04-17T09:10:00.000' AS DateTime), 1, CAST(N'2025-04-17' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1016, 113, 2, CAST(N'2025-04-17T19:00:00.000' AS DateTime), CAST(N'2025-04-17T19:10:00.000' AS DateTime), 2, CAST(N'2025-04-17' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1017, 114, 14, CAST(N'2025-04-18T10:00:00.000' AS DateTime), CAST(N'2025-04-18T10:10:00.000' AS DateTime), 1, CAST(N'2025-04-18' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1018, 114, 10, CAST(N'2025-04-18T20:00:00.000' AS DateTime), CAST(N'2025-04-18T20:10:00.000' AS DateTime), 2, CAST(N'2025-04-18' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1019, 115, 15, CAST(N'2025-04-19T08:00:00.000' AS DateTime), CAST(N'2025-04-19T08:10:00.000' AS DateTime), 1, CAST(N'2025-04-19' AS Date))
INSERT [dbo].[Train_Schedules] ([schedule_id], [train_id], [station_id], [arrival_time], [departure_time], [stop_number], [journey_date]) VALUES (1020, 115, 7, CAST(N'2025-04-19T22:00:00.000' AS DateTime), CAST(N'2025-04-19T22:10:00.000' AS DateTime), 2, CAST(N'2025-04-19' AS Date))
GO
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (101, N'Deccan Express', N'Superfast', 1, 2, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (102, N'Vidarbha Express', N'Express', 2, 3, CAST(750.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (103, N'Rajdhani Express', N'Superfast', 4, 9, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (104, N'Shatabdi Express', N'Superfast', 6, 7, CAST(900.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (105, N'Intercity Express', N'Express', 1, 5, CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (106, N'Duronto Express', N'Superfast', 5, 9, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (107, N'Gitanjali Express', N'Express', 2, 9, CAST(950.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (108, N'Karnataka Express', N'Superfast', 6, 4, CAST(1300.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (109, N'Udyan Express', N'Express', 6, 2, CAST(850.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (110, N'Ahmedabad Mail', N'Mail', 10, 3, CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (111, N'Patna Express', N'Express', 11, 4, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (112, N'Bhopal Shatabdi', N'Superfast', 12, 4, CAST(950.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (113, N'Jaipur Express', N'Express', 13, 2, CAST(850.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (114, N'Surat Mail', N'Mail', 14, 10, CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[Trains] ([train_id], [train_name], [train_type], [start_station_id], [end_station_id], [base_fare]) VALUES (115, N'Coimbatore Express', N'Superfast', 15, 7, CAST(1300.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (1, N'Harish Bonde', N'harish@example.com', N'9999999999', N'hashedpass123', N'Male', 22, N'Pune, MH', N'Passenger', CAST(N'2025-04-07T00:21:33.743' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (2, N'Asha Ramesh', N'asha@example.com', N'8888888888', N'pass456', N'Female', 30, N'Delhi', N'Passenger', CAST(N'2025-04-07T01:02:37.790' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (3, N'Nikhil Patil', N'nikhil@example.com', N'7777777777', N'pass789', N'Male', 27, N'Mumbai', N'Passenger', CAST(N'2025-04-07T01:02:37.790' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (4, N'Sneha Joshi', N'sneha@example.com', N'6666666666', N'pass321', N'Female', 25, N'Nagpur', N'Passenger', CAST(N'2025-04-07T01:02:37.790' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (5, N'Raj Mehta', N'raj@example.com', N'5555555555', N'pass654', N'Male', 28, N'Ahmedabad', N'Passenger', CAST(N'2025-04-07T01:02:37.790' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (6, N'Divya Kapoor', N'divya@example.com', N'4444444444', N'pass987', N'Female', 23, N'Hyderabad', N'Passenger', CAST(N'2025-04-07T01:02:37.790' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (7, N'Amit Sharma', N'amit@example.com', N'3333333333', N'pass111', N'Male', 26, N'Lucknow', N'Passenger', CAST(N'2025-04-07T01:02:37.790' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (8, N'Meena Iyer', N'meena@example.com', N'2222222222', N'pass222', N'Female', 29, N'Chennai', N'Passenger', CAST(N'2025-04-07T01:02:37.790' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (9, N'Kunal Rao', N'kunal@example.com', N'1111111111', N'pass333', N'Male', 24, N'Bangalore', N'Passenger', CAST(N'2025-04-07T01:02:37.790' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (10, N'Priya Jain', N'priya@example.com', N'1010101010', N'pass444', N'Female', 21, N'Kolkata', N'Passenger', CAST(N'2025-04-07T01:02:37.790' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (11, N'Riya Sharma', N'riya@example.com', N'9090909090', N'pass999', N'Female', 22, N'Surat', N'Passenger', CAST(N'2025-04-07T01:10:15.490' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (12, N'Siddharth Yadav', N'sid@example.com', N'8989898989', N'pass888', N'Male', 31, N'Bhopal', N'Passenger', CAST(N'2025-04-07T01:10:18.960' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (13, N'Anjali Verma', N'anjali@example.com', N'8787878787', N'pass777', N'Female', 26, N'Patna', N'Passenger', CAST(N'2025-04-07T01:10:21.903' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (14, N'Mehul Kapadia', N'mehul@example.com', N'9898989898', N'pass666', N'Male', 28, N'Ahmedabad', N'Passenger', CAST(N'2025-04-10T12:26:49.600' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (15, N'Kavya Menon', N'kavya@example.com', N'9797979797', N'pass555', N'Female', 24, N'Kochi', N'Passenger', CAST(N'2025-04-10T12:26:49.600' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (16, N'Ayaan Sheikh', N'ayaan@example.com', N'9696969696', N'pass444', N'Male', 29, N'Lucknow', N'Passenger', CAST(N'2025-04-10T12:26:49.600' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (17, N'Tanya Jain', N'tanya@example.com', N'9595959595', N'pass333', N'Female', 21, N'Indore', N'Passenger', CAST(N'2025-04-10T12:26:49.600' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (18, N'Dev Mehta', N'dev@example.com', N'9494949494', N'pass222', N'Male', 27, N'Vadodara', N'Passenger', CAST(N'2025-04-10T12:26:49.600' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (19, N'Rachana Ghosh', N'rachana@example.com', N'9393939393', N'pass111', N'Female', 23, N'Kolkata', N'Passenger', CAST(N'2025-04-10T12:26:49.600' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (20, N'Varun Tyagi', N'varun@example.com', N'9292929292', N'pass000', N'Male', 26, N'Noida', N'Passenger', CAST(N'2025-04-10T12:26:49.600' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (21, N'New User', N'newuser@example.com', N'9000000000', N'test123', N'Male', 25, N'Delhi', N'Passenger', CAST(N'2025-04-10T12:31:44.570' AS DateTime))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone], [password_hash], [gender], [age], [address], [role], [created_at]) VALUES (22, N'Aarti Desai', N'aarti@example.com', N'9191919191', N'test123', N'Female', 23, N'Jaipur', N'Passenger', CAST(N'2025-04-10T12:35:21.280' AS DateTime))
GO
ALTER TABLE [dbo].[Cancellations]  WITH CHECK ADD FOREIGN KEY([reservation_id])
REFERENCES [dbo].[Reservations] ([reservation_id])
GO
ALTER TABLE [dbo].[Coaches]  WITH CHECK ADD FOREIGN KEY([train_id])
REFERENCES [dbo].[Trains] ([train_id])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([schedule_id])
REFERENCES [dbo].[Train_Schedules] ([schedule_id])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([seat_id])
REFERENCES [dbo].[Seats] ([seat_id])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD FOREIGN KEY([coach_id])
REFERENCES [dbo].[Coaches] ([coach_id])
GO
ALTER TABLE [dbo].[Train_Schedules]  WITH CHECK ADD FOREIGN KEY([station_id])
REFERENCES [dbo].[Stations] ([station_id])
GO
ALTER TABLE [dbo].[Train_Schedules]  WITH CHECK ADD FOREIGN KEY([train_id])
REFERENCES [dbo].[Trains] ([train_id])
GO
ALTER TABLE [dbo].[Trains]  WITH CHECK ADD FOREIGN KEY([end_station_id])
REFERENCES [dbo].[Stations] ([station_id])
GO
ALTER TABLE [dbo].[Trains]  WITH CHECK ADD FOREIGN KEY([start_station_id])
REFERENCES [dbo].[Stations] ([station_id])
GO
USE [master]
GO
ALTER DATABASE [RailwayReservation] SET  READ_WRITE 
GO
