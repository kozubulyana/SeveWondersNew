USE [master]
GO
/****** Object:  Database [SevenWonders]    Script Date: 12/6/2018 2:11:40 PM ******/
CREATE DATABASE [SevenWonders]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SevenWonders', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SevenWonders.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SevenWonders_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SevenWonders_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SevenWonders] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SevenWonders].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SevenWonders] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SevenWonders] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SevenWonders] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SevenWonders] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SevenWonders] SET ARITHABORT OFF 
GO
ALTER DATABASE [SevenWonders] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SevenWonders] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SevenWonders] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SevenWonders] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SevenWonders] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SevenWonders] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SevenWonders] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SevenWonders] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SevenWonders] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SevenWonders] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SevenWonders] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SevenWonders] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SevenWonders] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SevenWonders] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SevenWonders] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SevenWonders] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SevenWonders] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SevenWonders] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SevenWonders] SET  MULTI_USER 
GO
ALTER DATABASE [SevenWonders] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SevenWonders] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SevenWonders] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SevenWonders] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SevenWonders] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SevenWonders', N'ON'
GO
ALTER DATABASE [SevenWonders] SET QUERY_STORE = OFF
GO
USE [SevenWonders]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SevenWonders]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 12/6/2018 2:11:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Administrators] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airplanes]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airplanes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](max) NOT NULL,
	[Company] [nvarchar](max) NOT NULL,
	[SeatsAmount] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Airplanes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airports]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CityId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Airports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[ManagerId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CountryId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ManagerId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CityId] [int] NULL,
	[Email] [nvarchar](max) NOT NULL,
	[TotalPayment] [decimal](18, 2) NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentRooms]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentRooms](
	[Room_Id] [int] NOT NULL,
	[Equipment_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.EquipmentRooms] PRIMARY KEY CLUSTERED 
(
	[Equipment_Id] ASC,
	[Room_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipments]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Equipments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtraPrices]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraPrices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[AdditionalPercent] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ExtraPrices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Facilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityHotels]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityHotels](
	[Facility_Id] [int] NOT NULL,
	[Hotel_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.FacilitiesHotels] PRIMARY KEY CLUSTERED 
(
	[Facility_Id] ASC,
	[Hotel_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 12/6/2018 2:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[RatingId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Feedbacks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flights]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flights](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[AirplaneId] [int] NOT NULL,
	[DepartureAirportId] [int] NOT NULL,
	[ArrivalAirportId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Flights] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodTypes]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.FoodTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[RatingId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[FoodTypeId] [int] NOT NULL,
	[FoodPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Hotels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelsPhotos]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelsPhotos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhotoLink] [nvarchar](max) NOT NULL,
	[HotelId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_HotelsPhotos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Managers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Ratings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonAmount] [int] NOT NULL,
	[LeaveDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NOT NULL,
	[RoomItemId] [int] NOT NULL,
	[LeaveScheduleId] [int] NOT NULL,
	[ReturnScheduleId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[WithoutFood] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Reservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomItems]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaxPeople] [int] NOT NULL,
	[WindowView] [nvarchar](50) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[HotelId] [int] NOT NULL,
	[RoomTypeId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RoomTypesHotels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomsPhotos]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomsPhotos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhotoLink] [nvarchar](max) NOT NULL,
	[RoomId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.RoomsPhotoes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.RoomTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 12/6/2018 2:11:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[DepartureTime] [datetime] NOT NULL,
	[ArrivalTime] [datetime] NOT NULL,
	[FlightId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Schedules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tours]    Script Date: 12/6/2018 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tours](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[ReservationId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[TourStateId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Tours] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourStates]    Script Date: 12/6/2018 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourStates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.TourStates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/6/2018 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrators] ON 

INSERT [dbo].[Administrators] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [Email]) VALUES (1, N'Andriy', N'Savriy', N'0987044192', CAST(N'1996-11-08T00:00:00.000' AS DateTime), 0, N'admin@gmail.com')
SET IDENTITY_INSERT [dbo].[Administrators] OFF
SET IDENTITY_INSERT [dbo].[Airplanes] ON 

INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (1, N'Boeing 737', N'LOT Polish Airlines', 50, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (2, N'Boeing 737-800', N'Lufthansa', 90, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (3, N'Embraer ERJ-190', N'LOT Polish Airlines', 120, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (4, N'Boeing737', N'LOT Polish Airlines', 70, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (5, N'Boeing737', N'Wizz Air', 90, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (6, N'Airbus A320', N'British Airways', 65, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (7, N'Airbus A549', N'LOT Polish Airlines', 50, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (8, N'Airbus A319', N'Lufthansa', 2, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (9, N'Airbus A320', N'Ryanair', 75, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (10, N'Boeing 737', N'KLM', 95, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (11, N'Airbus A319', N'Easy Jet', 55, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (12, N'11', N'12', 56, 1)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (13, N'4', N'4', 2, 1)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (14, N'jklhjk;', N'jhlk;', 576, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (15, N'Bombardier Q400', N'Austrian', 31, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (16, N'AirplaneTemp', N'CompanyTemp', 12, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (17, N'1111', N'1111', 11, 0)
INSERT [dbo].[Airplanes] ([Id], [Model], [Company], [SeatsAmount], [IsDeleted]) VALUES (18, N'1111', N'1111', 1, 0)
SET IDENTITY_INSERT [dbo].[Airplanes] OFF
SET IDENTITY_INSERT [dbo].[Airports] ON 

INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (2, N'LWO', N'Lviv Danylo Halytskyi International Airport', 29, 0)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (3, N'KBP', N'Boryspil International Airport', 28, 0)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (4, N'IEV', N'Kyiv (Zhuliany) International Airport', 28, 0)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (8, N'DXB', N'Dubai International Airport', 38, 0)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (9, N'NHD', N'Al Minhad Air Base', 38, 0)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (10, N'DWC', N'Dubai World Central - Al Maktoum International Airport', 38, 0)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (11, N'AUH', N'Abu Dhabi International Airport', 39, 0)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (12, N'AZI', N'Al Bateen Executive Airport', 39, 0)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (14, N'CDG', N'Paris-Charles de Gaulle Airport', 50, 0)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (15, N'LBG', N'Paris - Le Bourget Airport', 50, 1)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (16, N'ORY6', N'Paris-Orly Airport', 50, 1)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (24, N'LVA', N'La Vega Airport', 5, 0)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (25, N'авп', N'2ук', 5, 1)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (26, N'AUH', N'ке', 5, 1)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (27, N'111', N'c222', 98, 0)
INSERT [dbo].[Airports] ([Id], [Code], [Name], [CityId], [IsDeleted]) VALUES (28, N'LRA', N'La Romana Airport', 7, 0)
SET IDENTITY_INSERT [dbo].[Airports] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (5, N'La Vega', 2, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (7, N'La Romana', 2, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (21, N'Giza', 6, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (22, N'Luxor', 6, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (28, N'Kyiv', 9, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (29, N'Lviv', 9, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (30, N'Milan', 10, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (31, N'Florence', 10, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (36, N'Bangkok', 13, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (38, N'Dubai', 14, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (39, N'Madrid', 2, 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (44, N'Città Pinto', 17, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (45, N'Città Victoria', 17, 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (46, N'Varna', 18, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (47, N'Plovdiv', 18, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (48, N'Marseille', 19, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (50, N'Paris', 19, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (51, N'Frankfurt', 20, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (52, N'Munich', 20, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (53, N'Bremen', 20, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (92, N'Madrid', 51, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (96, N'Barcelona', 51, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (97, N'Kharkiv', 9, 0)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (98, N'c22', 55, 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [IsDeleted]) VALUES (99, N'Barcelona1', 51, 1)
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (2, N'Dominica', 27, 0)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (6, N'Egypt', 27, 0)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (9, N'Ukraine', NULL, 0)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (10, N'Italy', NULL, 0)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (13, N'Thailand', NULL, 0)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (14, N'United Arab Emirates', 27, 0)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (17, N'Malta', NULL, 0)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (18, N'Bulgaria', NULL, 0)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (19, N'France', 32, 0)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (20, N'Germany', NULL, 0)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (49, N'про', NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (50, N'Spain1', NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (51, N'Spain', NULL, 0)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (52, N'c1', NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (53, N'c1', NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (54, N'Bulgaria', NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (55, N'c2', NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (56, N'c1', NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [ManagerId], [IsDeleted]) VALUES (57, N'Poland', NULL, 0)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (4, N'Yarinaa', N'Pasichnukk', N'+844489489489489', CAST(N'2016-01-03T00:00:00.000' AS DateTime), 1, NULL, N'yarinaa@gmail.com', CAST(1145.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (6, N'Yaryna', N'Surname', N'98760987', CAST(N'2015-10-05T00:00:00.000' AS DateTime), 1, NULL, N'yarapasya@gmail.com', CAST(2450.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (21, N'Petro', N'Ivanov', N'768', CAST(N'2016-09-06T00:00:00.000' AS DateTime), 0, NULL, N'customer2@gmail.com', CAST(640.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (24, N'Tatiana', N'Zhydeikina', N'0960152650', CAST(N'1996-11-10T00:00:00.000' AS DateTime), 0, NULL, N'zhidejkina@gmail.com', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (34, N'Ulyana', N'Kozub', N'0987044192', CAST(N'1996-08-11T00:00:00.000' AS DateTime), 0, NULL, N'customer@gmail.com', CAST(9586.60 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (40, N'test2', N'test2', N'0989475903', CAST(N'2016-09-01T00:00:00.000' AS DateTime), 0, NULL, N'test3@gmail.com', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (42, N'aab', N'aab', N'0989475903', CAST(N'2016-09-01T00:00:00.000' AS DateTime), 0, NULL, N'aadz@gmail.com', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (43, N'ma', N'ma', N'0697845830', CAST(N'2016-09-02T00:00:00.000' AS DateTime), 0, NULL, N'ma@gmail.com', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (44, N'andriy', N'savriy', N'0989475638', CAST(N'2016-09-01T00:00:00.000' AS DateTime), 0, NULL, N'andriysavriy@gmail.com', CAST(608.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (45, N'asd', N'asd', N'0979475903', CAST(N'2016-09-01T00:00:00.000' AS DateTime), 0, NULL, N'asd@gmail.com', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (46, N'Viacheslav', N'Kozlov', N'8293479238', CAST(N'2016-09-01T00:00:00.000' AS DateTime), 0, NULL, N'slavikkozlov3@gmail.com', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (47, N'zz', N'zz', N'0989475903', CAST(N'2016-09-01T00:00:00.000' AS DateTime), 0, NULL, N'zz@gmail.com', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (48, N'y', N'savriyy', N'0989475908', CAST(N'2016-09-01T00:00:00.000' AS DateTime), 0, NULL, N'andriyy@gmail.com', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (49, N'asd', N'asd', N'0989745683', CAST(N'2015-09-01T00:00:00.000' AS DateTime), 0, NULL, N'asd@gmail.com', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (50, N'Viacheslav2', N'Kozlov1', N'06810045181', CAST(N'2016-09-18T00:00:00.000' AS DateTime), 0, NULL, N'slavek_k@ukr.net2', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (51, N'Test', N'Test', N'0322222222', CAST(N'2016-09-30T00:00:00.000' AS DateTime), 0, NULL, N'yaficona@cartelera.org', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [IsDeleted], [CityId], [Email], [TotalPayment], [Discount]) VALUES (52, N'dsfsdf', N'sdfsdff', N'1327866454', CAST(N'2016-09-09T00:00:00.000' AS DateTime), 0, NULL, N'assd@gmai.com', CAST(0.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[Customers] OFF
INSERT [dbo].[EquipmentRooms] ([Room_Id], [Equipment_Id]) VALUES (2, 1)
INSERT [dbo].[EquipmentRooms] ([Room_Id], [Equipment_Id]) VALUES (11, 1)
INSERT [dbo].[EquipmentRooms] ([Room_Id], [Equipment_Id]) VALUES (12, 1)
INSERT [dbo].[EquipmentRooms] ([Room_Id], [Equipment_Id]) VALUES (2, 2)
INSERT [dbo].[EquipmentRooms] ([Room_Id], [Equipment_Id]) VALUES (2, 3)
INSERT [dbo].[EquipmentRooms] ([Room_Id], [Equipment_Id]) VALUES (2, 4)
INSERT [dbo].[EquipmentRooms] ([Room_Id], [Equipment_Id]) VALUES (2, 5)
INSERT [dbo].[EquipmentRooms] ([Room_Id], [Equipment_Id]) VALUES (2, 7)
INSERT [dbo].[EquipmentRooms] ([Room_Id], [Equipment_Id]) VALUES (1, 11)
INSERT [dbo].[EquipmentRooms] ([Room_Id], [Equipment_Id]) VALUES (1, 12)
INSERT [dbo].[EquipmentRooms] ([Room_Id], [Equipment_Id]) VALUES (1, 13)
SET IDENTITY_INSERT [dbo].[Equipments] ON 

INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (1, N'Private bathroom')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (2, N'Double bed')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (3, N'Single bed')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (4, N'TV')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (5, N'Shower')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (6, N'Free toiletries')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (7, N'Hair dryer')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (8, N'Minibar')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (9, N'Towels')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (10, N'авпв')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (11, N'56757')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (12, N'fdgdfg')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (13, N'gfdgdfg')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (14, N'bcvb')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (15, N'dfgg')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (16, N'dfgg')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (17, N'fdffgfgfg')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (18, N'fsdfdsf')
INSERT [dbo].[Equipments] ([Id], [Name]) VALUES (19, N'11')
SET IDENTITY_INSERT [dbo].[Equipments] OFF
SET IDENTITY_INSERT [dbo].[ExtraPrices] ON 

INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (2, CAST(N'2016-08-30T00:00:00.000' AS DateTime), CAST(N'2016-09-25T00:00:00.000' AS DateTime), -10, 10, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (3, CAST(N'2016-09-03T00:00:00.000' AS DateTime), CAST(N'2016-09-30T00:00:00.000' AS DateTime), -20, 6, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (4, CAST(N'2016-10-01T00:00:00.000' AS DateTime), CAST(N'2016-11-01T00:00:00.000' AS DateTime), -20, 13, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (5, CAST(N'2010-03-01T00:00:00.000' AS DateTime), CAST(N'2016-08-29T13:39:29.210' AS DateTime), -20, 13, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (6, CAST(N'2016-08-30T00:00:00.000' AS DateTime), CAST(N'2016-08-09T00:00:00.000' AS DateTime), -15, 10, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (7, CAST(N'2016-08-31T00:00:00.000' AS DateTime), CAST(N'2016-08-25T00:00:00.000' AS DateTime), -10, 9, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (9, CAST(N'2016-08-15T00:00:00.000' AS DateTime), CAST(N'2016-08-24T00:00:00.000' AS DateTime), 1, 9, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (11, CAST(N'2016-08-16T00:00:00.000' AS DateTime), CAST(N'2016-08-16T00:00:00.000' AS DateTime), 8, 9, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (12, CAST(N'2016-08-02T00:00:00.000' AS DateTime), CAST(N'2016-08-23T00:00:00.000' AS DateTime), 9, 11, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (13, CAST(N'2016-08-01T00:00:00.000' AS DateTime), CAST(N'2016-08-31T00:00:00.000' AS DateTime), -10, 11, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (14, CAST(N'2016-09-01T00:00:00.000' AS DateTime), CAST(N'2016-09-30T00:00:00.000' AS DateTime), -400, 11, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (15, CAST(N'2016-10-04T00:00:00.000' AS DateTime), CAST(N'2016-10-21T00:00:00.000' AS DateTime), 10, 6, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (16, CAST(N'2016-08-18T00:00:00.000' AS DateTime), CAST(N'2016-08-18T00:00:00.000' AS DateTime), -6, 2, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (17, CAST(N'2016-08-18T00:00:00.000' AS DateTime), CAST(N'2016-08-18T00:00:00.000' AS DateTime), -6, 2, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (18, CAST(N'2016-09-26T00:00:00.000' AS DateTime), CAST(N'2016-10-25T00:00:00.000' AS DateTime), -80, 8, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (19, CAST(N'2016-08-01T00:00:00.000' AS DateTime), CAST(N'2016-08-02T00:00:00.000' AS DateTime), 11, 6, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (20, CAST(N'2016-08-03T00:00:00.000' AS DateTime), CAST(N'2016-08-19T00:00:00.000' AS DateTime), -4, 2, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (21, CAST(N'2016-08-01T00:00:00.000' AS DateTime), CAST(N'2016-08-25T00:00:00.000' AS DateTime), -90, 2, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (22, CAST(N'2016-08-01T00:00:00.000' AS DateTime), CAST(N'2016-08-27T00:00:00.000' AS DateTime), -90, 2, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (23, CAST(N'2016-08-02T00:00:00.000' AS DateTime), CAST(N'2016-08-02T00:00:00.000' AS DateTime), -2, 2, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (24, CAST(N'2016-08-02T00:00:00.000' AS DateTime), CAST(N'2016-08-02T00:00:00.000' AS DateTime), -2, 2, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (25, CAST(N'2016-08-02T00:00:00.000' AS DateTime), CAST(N'2016-08-03T00:00:00.000' AS DateTime), -2, 2, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (26, CAST(N'2016-08-16T00:00:00.000' AS DateTime), CAST(N'2016-08-26T00:00:00.000' AS DateTime), -89, 2, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (27, CAST(N'2016-08-01T00:00:00.000' AS DateTime), CAST(N'2016-08-04T00:00:00.000' AS DateTime), 90, 13, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (30, CAST(N'2016-09-26T00:00:00.000' AS DateTime), CAST(N'2016-09-28T00:00:00.000' AS DateTime), -10, 2, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (31, CAST(N'2016-09-01T00:00:00.000' AS DateTime), CAST(N'2017-03-31T00:00:00.000' AS DateTime), -25, 2, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (32, CAST(N'2016-09-29T00:00:00.000' AS DateTime), CAST(N'2016-09-30T00:00:00.000' AS DateTime), 20, 11, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (33, CAST(N'2016-09-25T00:00:00.000' AS DateTime), CAST(N'2016-09-26T00:00:00.000' AS DateTime), 2, 2, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (34, CAST(N'2016-09-25T00:00:00.000' AS DateTime), CAST(N'2016-09-26T00:00:00.000' AS DateTime), 2, 2, 1)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (35, CAST(N'2016-09-24T00:00:00.000' AS DateTime), CAST(N'2016-09-28T00:00:00.000' AS DateTime), -4, 2, 0)
INSERT [dbo].[ExtraPrices] ([Id], [StartDate], [EndDate], [AdditionalPercent], [HotelId], [IsDeleted]) VALUES (36, CAST(N'2016-09-27T00:00:00.000' AS DateTime), CAST(N'2016-09-30T00:00:00.000' AS DateTime), 10, 2, 0)
SET IDENTITY_INSERT [dbo].[ExtraPrices] OFF
SET IDENTITY_INSERT [dbo].[Facilities] ON 

INSERT [dbo].[Facilities] ([Id], [Name]) VALUES (1, N'Gym')
INSERT [dbo].[Facilities] ([Id], [Name]) VALUES (2, N'Swimming pool')
INSERT [dbo].[Facilities] ([Id], [Name]) VALUES (3, N'Sauna')
INSERT [dbo].[Facilities] ([Id], [Name]) VALUES (4, N'Baby room')
INSERT [dbo].[Facilities] ([Id], [Name]) VALUES (5, N'Restaurant')
INSERT [dbo].[Facilities] ([Id], [Name]) VALUES (6, N'Bar')
INSERT [dbo].[Facilities] ([Id], [Name]) VALUES (7, N'Free Wi-Fi')
INSERT [dbo].[Facilities] ([Id], [Name]) VALUES (8, N'Pets allowed')
INSERT [dbo].[Facilities] ([Id], [Name]) VALUES (9, N'11')
INSERT [dbo].[Facilities] ([Id], [Name]) VALUES (10, N'fgdg')
SET IDENTITY_INSERT [dbo].[Facilities] OFF
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (1, 15)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (1, 42)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (2, 13)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (2, 15)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (2, 42)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (3, 10)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (4, 15)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (5, 10)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (5, 13)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (5, 15)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (6, 10)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (6, 13)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (6, 15)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (7, 13)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (7, 15)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (8, 13)
INSERT [dbo].[FacilityHotels] ([Facility_Id], [Hotel_Id]) VALUES (10, 10)
SET IDENTITY_INSERT [dbo].[Feedbacks] ON 

INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (10, CAST(N'2016-08-29T16:44:47.807' AS DateTime), N'No lift, bathroom really small, room cleaning was meant to be every 2 days but didn''t happen for us because they were too late, really loud during the night as the walls and ceiling were not properly sound-proofed. We could hear other guests walking about in their rooms as well as climbing stairs. No plug in bathroom.', 4, 13, 3)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (11, CAST(N'2016-08-29T17:00:59.683' AS DateTime), N'The bed got a little hot (memory foam mattress) and there was only one pillow each.

When we checked in, we found out that we had been upgraded to another flat around the corner. The location was good as it was on a square and had very little traffic noise. The kitchenette was clean and well equipped for two.', 21, 13, 4)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (12, CAST(N'2016-08-29T17:08:55.360' AS DateTime), N'The staff are friendly & I loved their service', 24, 13, 5)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (13, CAST(N'2016-08-29T17:09:02.270' AS DateTime), N'No lift. Steep flights of stairs.

Location. Clean. Сomfortable.', 44, 13, 4)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (14, CAST(N'2016-08-29T17:10:06.507' AS DateTime), N'More comfortable seating in the lounge.

Comfortable beds. Excellent location do Hyde Park. Short walk to tube stations.', 40, 13, 4)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (15, CAST(N'2016-08-29T18:40:42.937' AS DateTime), N'Room hasn''t been cleaned when we were given it
. Location excellent, comfortable, friendly helpful staff.', 46, 13, 3)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (16, CAST(N'2016-09-06T20:11:37.800' AS DateTime), N'Lack of actual parking and staff just pointing at info about where not to park!

Nice clean apartment close to tube.', 21, 13, 3)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (17, CAST(N'2016-09-07T21:17:14.307' AS DateTime), N'Basement apartment lacked natural light..only one window. Bed not accessable from both sides as pushed against wall. More tea, coffee and milk would have nice.

Very tastefully furnished.clean and modern. Lovely terrace garden at rear. Very helpfull staff.', 40, 13, 5)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (18, CAST(N'2016-09-13T20:34:54.627' AS DateTime), N'I think it is a very beautiful hotel. The trip was fantastic!!!', 40, 15, 5)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (19, CAST(N'2016-09-13T20:35:41.833' AS DateTime), N'Couldn''t turn off towel heater in bathroom.

Staff were outstanding.', 4, 15, 4)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (20, CAST(N'2016-09-16T09:31:40.767' AS DateTime), N'Apartment did not reflect the impression given in photos. Studio apartment was small - space for double bed and table. No bedside light. Shower could do with a deep clean in all the nooks and crannies. Apartment was on third floor with no elevator.

In good location near to 2 tube stations. Quiet at night. Shops, pubs and restaurants nearby. Staff were friendly.', 24, 15, 2)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (21, CAST(N'2016-09-16T09:40:59.587' AS DateTime), N'Stairs to my room were narrow. The building could benefit from a lift.

 Very central location. You can walk to anywhwre in the West End', 24, 15, 5)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (22, CAST(N'2016-09-28T10:25:18.333' AS DateTime), N'best hotel', 34, 13, 5)
INSERT [dbo].[Feedbacks] ([Id], [CreationDate], [Text], [CustomerId], [HotelId], [RatingId]) VALUES (23, CAST(N'2016-09-28T11:29:10.623' AS DateTime), N'good hotel', 34, 13, 4)
SET IDENTITY_INSERT [dbo].[Feedbacks] OFF
SET IDENTITY_INSERT [dbo].[Flights] ON 

INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (11, N'3678', CAST(377.00 AS Decimal(18, 2)), 11, 2, 8, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (12, N'8768', CAST(421.00 AS Decimal(18, 2)), 8, 2, 11, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (13, N'3468', CAST(140.00 AS Decimal(18, 2)), 3, 2, 14, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (14, N'5634', CAST(99.00 AS Decimal(18, 2)), 4, 2, 15, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (15, N'7588', CAST(124.00 AS Decimal(18, 2)), 1, 2, 16, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (16, N'2345', CAST(148.00 AS Decimal(18, 2)), 6, 2, 14, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (18, N'7685', CAST(35.00 AS Decimal(18, 2)), 8, 2, 3, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (21, N'2394', CAST(255.00 AS Decimal(18, 2)), 10, 8, 2, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (22, N'5241', CAST(376.00 AS Decimal(18, 2)), 11, 8, 2, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (23, N'2342', CAST(426.00 AS Decimal(18, 2)), 10, 11, 2, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (24, N'5643', CAST(140.00 AS Decimal(18, 2)), 4, 14, 2, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (57, N'2113', CAST(20.00 AS Decimal(18, 2)), 2, 3, 14, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (58, N'1235', CAST(140.00 AS Decimal(18, 2)), 7, 2, 24, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (59, N'2347', CAST(410.00 AS Decimal(18, 2)), 7, 4, 24, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (60, N'9876', CAST(100.00 AS Decimal(18, 2)), 8, 24, 3, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (61, N'8765', CAST(70.00 AS Decimal(18, 2)), 8, 24, 2, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (62, N'9870', CAST(80.00 AS Decimal(18, 2)), 5, 2, 26, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (63, N'ytjkj', CAST(65.00 AS Decimal(18, 2)), 14, 14, 3, 1)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (64, N'6534', CAST(98.00 AS Decimal(18, 2)), 15, 2, 8, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (65, N'4543', CAST(45.00 AS Decimal(18, 2)), 16, 2, 28, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (66, N'6563', CAST(35.00 AS Decimal(18, 2)), 17, 28, 2, 0)
INSERT [dbo].[Flights] ([Id], [Number], [Price], [AirplaneId], [DepartureAirportId], [ArrivalAirportId], [IsDeleted]) VALUES (67, N'3434', CAST(23.00 AS Decimal(18, 2)), 18, 2, 3, 0)
SET IDENTITY_INSERT [dbo].[Flights] OFF
SET IDENTITY_INSERT [dbo].[FoodTypes] ON 

INSERT [dbo].[FoodTypes] ([Id], [Name]) VALUES (1, N'RO')
INSERT [dbo].[FoodTypes] ([Id], [Name]) VALUES (2, N'BB')
INSERT [dbo].[FoodTypes] ([Id], [Name]) VALUES (3, N'HB')
INSERT [dbo].[FoodTypes] ([Id], [Name]) VALUES (4, N'FB')
INSERT [dbo].[FoodTypes] ([Id], [Name]) VALUES (5, N'Al')
SET IDENTITY_INSERT [dbo].[FoodTypes] OFF
SET IDENTITY_INSERT [dbo].[Hotels] ON 

INSERT [dbo].[Hotels] ([Id], [Name], [Description], [Address], [IsDeleted], [RatingId], [CityId], [FoodTypeId], [FoodPrice]) VALUES (2, N'Sayat-Nova Ave.', N'Hotel "Ani Plaza" is at your service with its comfortable rooms. Many rooms are overlooking the city with a great panorama view of Yerevan and Mount Ararat. The sport complex with fully equipped fitness center, sauna and swimming pool is functioning at the hotel. The services of sport complex are at a disposal of the guests.', N'19, Sayat-Nova Ave., La Vega', 1, 4, 5, 1, CAST(35.00 AS Decimal(18, 2)))
INSERT [dbo].[Hotels] ([Id], [Name], [Description], [Address], [IsDeleted], [RatingId], [CityId], [FoodTypeId], [FoodPrice]) VALUES (3, N'B&B Artson - Armavir', N'Take my word: In Echmiadzin (Vagharshapat) theres no other place youll rather be. This family hospitality is extra ordinary, always smily and give you warm feeling of home. Add this to the lovely and comfortable rooms,beautifull organic garden and heavenly food made by sonja and arthurs mother.and all for a very reasonable price Perfect place.', N'Vagharshapat St. Petrozavodsk 55 | Echmiadzin, Armavir 1103, Armenia', 1, 1, 5, 1, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[Hotels] ([Id], [Name], [Description], [Address], [IsDeleted], [RatingId], [CityId], [FoodTypeId], [FoodPrice]) VALUES (6, N'Hotel Villa Colonial', N'Hotel Villa Colonial is located in the heart of Santo Domingo''s historic centre, and offers an outdoor pool, tropical gardens and a charming patio. The air-conditioned rooms include cable TV.  Each functional room at the Hotel Villa Colonial features a fan, a safe and a mini-fridge. The private bathrooms come with a hairdryer and free toiletries.', N'Calle Sanchez 157, Zona Colonial, Colonial Zone, 00000 ', 0, 3, 5, 4, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Hotels] ([Id], [Name], [Description], [Address], [IsDeleted], [RatingId], [CityId], [FoodTypeId], [FoodPrice]) VALUES (8, N'Casa de Campo Resort and Villas', N'Casa de Campo is a very private resort that boasts several restaurants on the property as well as a nice beach, Marina, stables and shooting range. If you get the all inclusive package you will experience all of these and more. We found going there is a place that we can have some quiet time. The staff is really friendly and wants to help you enjoy their paradise.', N'Carretera La Romana-Higuey La Romana', 0, 5, 7, 3, CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[Hotels] ([Id], [Name], [Description], [Address], [IsDeleted], [RatingId], [CityId], [FoodTypeId], [FoodPrice]) VALUES (9, N'Horizon Shahrazad Hotel', N'Hosting a central location in Cairo, this hotel is located by the Nile bank and has an impressive view of the river and Cairo Tower. Free WiFi is available in all areas.Horizon Shahrazad Hotel provides services for your immediate convenience. You can also dine or have a drink at the hotel’s bar and restaurant.Horizon Shahrazad Hotel is near a number of landmarks. The Cairo Opera House, Andalus Park and Egyptian Museum are all within a three kilometre radius of the hotel. Horizon Shahrazad Hotel gives you an ideal position to explore Cairo.Assistance and transfer from the airport to the hotel is available at an added fee. Agouza is a great choice for travellers interested in budget-friendly travelling, tourist attractions and food.', N'182 El Nil Street, Agouza, Cairo, Egypt', 0, 4, 22, 1, CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Hotels] ([Id], [Name], [Description], [Address], [IsDeleted], [RatingId], [CityId], [FoodTypeId], [FoodPrice]) VALUES (10, N'Atlas Deluxe', N'This is a luxury hotel just off the center of Lviv within easy walking distance from everything you may want to see in this old formerly multi-ethnic and multi-cultural hub. The hotel was an apartment building with a famous restaurant in the ground floor, famous in the history of mathematics', N'Lviv, Franka sreet, house 32', 0, 4, 29, 3, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Hotels] ([Id], [Name], [Description], [Address], [IsDeleted], [RatingId], [CityId], [FoodTypeId], [FoodPrice]) VALUES (11, N'Hilton Kyiv', N'Great location! Thanks Ali for the great advices and services! Food is really good in the restaurant. The terrace bar is recommended. Kiev is very good city to visit. Very friendly staff especially the girl in the DJ desk is the best in town.', N'Shevchenka Tarasa bulv. 30, Kiev 01030, Ukraine', 0, 5, 28, 2, CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[Hotels] ([Id], [Name], [Description], [Address], [IsDeleted], [RatingId], [CityId], [FoodTypeId], [FoodPrice]) VALUES (13, N'Millennium Plaza Hotel Dubai', N'Overlooking Burj Khalifa and The Dubai Fountain, this hotel provides large luxury suites within walking distance to the Dubai Mall. It offers free shuttle service to Jumeirah Beach Park, Dubai Mall, and the Metro.', N'Boulevard Street Downtown Burj Khalifa, Downtown Dubai, Dubai, United Arab Emirates', 0, 4, 38, 3, CAST(55.00 AS Decimal(18, 2)))
INSERT [dbo].[Hotels] ([Id], [Name], [Description], [Address], [IsDeleted], [RatingId], [CityId], [FoodTypeId], [FoodPrice]) VALUES (15, N'Weston Suites Hotel', N'Weston Suites Hotel features free Wi-Fi and a gym. Free private parking is available to guests.  The air-conditioned rooms have flat-screen TV with cable channels, a safety box and a desk. The bathrooms come with shower and free toiletries.  Continental breakfast is included in the room rate. Weston Suites’ top-floor restaurant serves international dishes.', N'Avenida 27 de Febrero 194, 10130 Santo Domingo, Dominican Republic', 0, 4, 5, 4, CAST(35.00 AS Decimal(18, 2)))
INSERT [dbo].[Hotels] ([Id], [Name], [Description], [Address], [IsDeleted], [RatingId], [CityId], [FoodTypeId], [FoodPrice]) VALUES (41, N'Hotel Pegasus', N'Concepcion de la Vega is located in the center of the Dominican Republic. The main tourist attractions are Jarabacoa and Constanza for the ecotourism and adventure tourism. La Vega Carnival (Carnaval Vegano) is the most important cultural event in town. La Vega has some historical monuments, it is a fairly large city with few hotels, but most of the hotel offer is located to Jarabacoa and Constanza with many ranchs and small hotels dedicated to ecotourism.', N'Nuñes De Caceres, Concepción de La Vega, Dominican Republic', 1, 5, 5, 3, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[Hotels] ([Id], [Name], [Description], [Address], [IsDeleted], [RatingId], [CityId], [FoodTypeId], [FoodPrice]) VALUES (42, N'111', N'21', N'12', 1, 2, 47, 1, CAST(12.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Hotels] OFF
SET IDENTITY_INSERT [dbo].[HotelsPhotos] ON 

INSERT [dbo].[HotelsPhotos] ([Id], [PhotoLink], [HotelId], [IsDeleted]) VALUES (11, N'../../static/Content/img/Hotels/Hotel10/32965782.jpg', 10, 1)
INSERT [dbo].[HotelsPhotos] ([Id], [PhotoLink], [HotelId], [IsDeleted]) VALUES (12, N'../../static/Content/img/Hotels/Hotel8/131768568.jpg', 8, 0)
INSERT [dbo].[HotelsPhotos] ([Id], [PhotoLink], [HotelId], [IsDeleted]) VALUES (13, N'../../static/Content/img/Hotels/Hotel8/91694068.jpg', 8, 0)
INSERT [dbo].[HotelsPhotos] ([Id], [PhotoLink], [HotelId], [IsDeleted]) VALUES (14, N'../../static/Content/img/Hotels/Hotel11/30607234.jpg', 11, 0)
INSERT [dbo].[HotelsPhotos] ([Id], [PhotoLink], [HotelId], [IsDeleted]) VALUES (15, N'../../static/Content/img/Hotels/Hotel9/43776406.jpg', 9, 0)
INSERT [dbo].[HotelsPhotos] ([Id], [PhotoLink], [HotelId], [IsDeleted]) VALUES (16, N'../../static/Content/img/Hotels/Hotel6/55185879.jpg', 6, 0)
INSERT [dbo].[HotelsPhotos] ([Id], [PhotoLink], [HotelId], [IsDeleted]) VALUES (17, N'../../static/Content/img/Hotels/Hotel15/68624404.jpg', 15, 0)
INSERT [dbo].[HotelsPhotos] ([Id], [PhotoLink], [HotelId], [IsDeleted]) VALUES (18, N'../../static/Content/img/Hotels/Hotel13/31680561.jpg', 13, 0)
INSERT [dbo].[HotelsPhotos] ([Id], [PhotoLink], [HotelId], [IsDeleted]) VALUES (19, N'../../static/Content/img/Hotels/Hotel42/DSC_0975.JPG', 42, 0)
SET IDENTITY_INSERT [dbo].[HotelsPhotos] OFF
SET IDENTITY_INSERT [dbo].[Managers] ON 

INSERT [dbo].[Managers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Email], [IsDeleted]) VALUES (27, N'Ulyana', N'Kozub', N'0987044192', CAST(N'2000-06-21T00:00:00.000' AS DateTime), N'manager@gmail.com', 0)
INSERT [dbo].[Managers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Email], [IsDeleted]) VALUES (32, N'test', N'test', N'0985448', CAST(N'2016-08-30T00:00:00.000' AS DateTime), N'test@gmail.com', 0)
INSERT [dbo].[Managers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Email], [IsDeleted]) VALUES (35, N'Ulyana', N'Kozub', N'0987044192', CAST(N'1996-11-07T00:00:00.000' AS DateTime), N'manage@gmail.com', 0)
INSERT [dbo].[Managers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Email], [IsDeleted]) VALUES (43, N'тест25', N'тест25', N'098947590', CAST(N'2016-09-02T00:00:00.000' AS DateTime), N'TestTest@gmail.com', 0)
INSERT [dbo].[Managers] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Email], [IsDeleted]) VALUES (44, N'testNoCountry', N'testNoCountry', N'0976415903', CAST(N'2016-09-25T21:00:00.000' AS DateTime), N'testNoCountry@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Managers] OFF
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([Id], [Name]) VALUES (1, N'1')
INSERT [dbo].[Ratings] ([Id], [Name]) VALUES (2, N'2')
INSERT [dbo].[Ratings] ([Id], [Name]) VALUES (3, N'3')
INSERT [dbo].[Ratings] ([Id], [Name]) VALUES (4, N'4')
INSERT [dbo].[Ratings] ([Id], [Name]) VALUES (5, N'5')
SET IDENTITY_INSERT [dbo].[Ratings] OFF
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([Id], [PersonAmount], [LeaveDate], [ReturnDate], [RoomItemId], [LeaveScheduleId], [ReturnScheduleId], [IsDeleted], [WithoutFood]) VALUES (1, 1, CAST(N'2018-04-30T00:00:00.000' AS DateTime), CAST(N'2018-05-01T00:00:00.000' AS DateTime), 3, 74, 96, 0, 1)
INSERT [dbo].[Reservations] ([Id], [PersonAmount], [LeaveDate], [ReturnDate], [RoomItemId], [LeaveScheduleId], [ReturnScheduleId], [IsDeleted], [WithoutFood]) VALUES (2, 1, CAST(N'2018-05-27T00:00:00.000' AS DateTime), CAST(N'2018-05-28T00:00:00.000' AS DateTime), 2, 80, 95, 0, 1)
SET IDENTITY_INSERT [dbo].[Reservations] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'customer')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'admin')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'manager')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[RoomItems] ON 

INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (1, 1, 1)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (2, 1, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (3, 2, 1)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (4, 5, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (5, 6, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (6, 2, 1)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (7, 2, 1)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (8, 2, 1)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (9, 2, 1)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (10, 2, 1)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (11, 2, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (12, 1, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (13, 7, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (14, 7, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (15, 9, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (16, 10, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (17, 11, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (18, 12, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (19, 12, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (20, 12, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (21, 12, 0)
INSERT [dbo].[RoomItems] ([Id], [RoomId], [IsDeleted]) VALUES (22, 12, 0)
SET IDENTITY_INSERT [dbo].[RoomItems] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [MaxPeople], [WindowView], [Price], [HotelId], [RoomTypeId], [IsDeleted]) VALUES (1, 2, N'Sea', CAST(40.00 AS Decimal(18, 2)), 6, 1, 1)
INSERT [dbo].[Rooms] ([Id], [MaxPeople], [WindowView], [Price], [HotelId], [RoomTypeId], [IsDeleted]) VALUES (2, 1, N'', CAST(25.01 AS Decimal(18, 2)), 2, 2, 0)
INSERT [dbo].[Rooms] ([Id], [MaxPeople], [WindowView], [Price], [HotelId], [RoomTypeId], [IsDeleted]) VALUES (5, 4, N'Sea', CAST(60.00 AS Decimal(18, 2)), 6, 7, 0)
INSERT [dbo].[Rooms] ([Id], [MaxPeople], [WindowView], [Price], [HotelId], [RoomTypeId], [IsDeleted]) VALUES (6, 2, N'Sea', CAST(42.00 AS Decimal(18, 2)), 15, 3, 0)
INSERT [dbo].[Rooms] ([Id], [MaxPeople], [WindowView], [Price], [HotelId], [RoomTypeId], [IsDeleted]) VALUES (7, 2, NULL, CAST(14.00 AS Decimal(18, 2)), 6, 3, 1)
INSERT [dbo].[Rooms] ([Id], [MaxPeople], [WindowView], [Price], [HotelId], [RoomTypeId], [IsDeleted]) VALUES (8, 3, N'12', CAST(25.00 AS Decimal(18, 2)), 6, 4, 1)
INSERT [dbo].[Rooms] ([Id], [MaxPeople], [WindowView], [Price], [HotelId], [RoomTypeId], [IsDeleted]) VALUES (9, 1, NULL, CAST(20.00 AS Decimal(18, 2)), 6, 1, 1)
INSERT [dbo].[Rooms] ([Id], [MaxPeople], [WindowView], [Price], [HotelId], [RoomTypeId], [IsDeleted]) VALUES (10, 1, NULL, CAST(1.00 AS Decimal(18, 2)), 6, 1, 1)
INSERT [dbo].[Rooms] ([Id], [MaxPeople], [WindowView], [Price], [HotelId], [RoomTypeId], [IsDeleted]) VALUES (11, 2, NULL, CAST(1.00 AS Decimal(18, 2)), 6, 1, 1)
INSERT [dbo].[Rooms] ([Id], [MaxPeople], [WindowView], [Price], [HotelId], [RoomTypeId], [IsDeleted]) VALUES (12, 10, N'view', CAST(400.00 AS Decimal(18, 2)), 6, 10, 1)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[RoomsPhotos] ON 

INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (2, N'../../static/Content/img/Rooms/Room1/55186925.jpg', 1, 1)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (4, N'../../static/Content/img/Rooms/Room2/68624370.jpg', 2, 1)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (5, N'../../static/Content/img/Rooms/Room5/37635689.jpg', 5, 0)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (6, N'../../static/Content/img/Rooms/Room5/55186408.jpg', 5, 0)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (7, N'../../static/Content/img/Rooms/Room5/55186408.jpg', 6, 0)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (8, N'../../static/Content/img/Rooms/Room2/40e25c08-2555-4cfa-a384-57ea2cf91236-original.jpeg', 2, 1)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (9, N'../../static/Content/img/Rooms/Room1/DSC_1042.JPG', 1, 1)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (10, N'../../static/Content/img/Rooms/Room1/DSC_1058.JPG', 1, 1)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (11, N'../../static/Content/img/Rooms/Room10/DSC_1042.JPG', 10, 1)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (12, N'../../static/Content/img/Rooms/Room10/DSC_1044.JPG', 10, 1)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (13, N'../../static/Content/img/Rooms/Room12/DSC_0975.JPG', 12, 0)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (14, N'../../static/Content/img/Rooms/Room1/13591330.jpg', 1, 1)
INSERT [dbo].[RoomsPhotos] ([Id], [PhotoLink], [RoomId], [IsDeleted]) VALUES (15, N'../../static/Content/img/Rooms/Room1/13591330.jpg', 1, 0)
SET IDENTITY_INSERT [dbo].[RoomsPhotos] OFF
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 

INSERT [dbo].[RoomTypes] ([Id], [Name]) VALUES (1, N'Standart')
INSERT [dbo].[RoomTypes] ([Id], [Name]) VALUES (2, N'Single')
INSERT [dbo].[RoomTypes] ([Id], [Name]) VALUES (3, N'Double')
INSERT [dbo].[RoomTypes] ([Id], [Name]) VALUES (4, N'Triple')
INSERT [dbo].[RoomTypes] ([Id], [Name]) VALUES (5, N'Bedroom')
INSERT [dbo].[RoomTypes] ([Id], [Name]) VALUES (6, N'Superior')
INSERT [dbo].[RoomTypes] ([Id], [Name]) VALUES (7, N'Family Room')
INSERT [dbo].[RoomTypes] ([Id], [Name]) VALUES (8, N'Business Room')
INSERT [dbo].[RoomTypes] ([Id], [Name]) VALUES (9, N'Duplex')
INSERT [dbo].[RoomTypes] ([Id], [Name]) VALUES (10, N'King Suites')
INSERT [dbo].[RoomTypes] ([Id], [Name]) VALUES (11, N'President Suites')
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (16, 2, CAST(N'2016-09-16T09:33:00.000' AS DateTime), CAST(N'2016-09-16T16:38:00.000' AS DateTime), 11, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (17, 4, CAST(N'2016-09-16T11:33:00.000' AS DateTime), CAST(N'2016-09-16T16:38:00.000' AS DateTime), 11, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (18, 6, CAST(N'2016-09-15T09:33:00.000' AS DateTime), CAST(N'2016-09-15T16:38:00.000' AS DateTime), 11, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (19, 1, CAST(N'2016-09-21T07:30:00.000' AS DateTime), CAST(N'2016-09-21T15:15:00.000' AS DateTime), 12, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (20, 0, CAST(N'1900-01-01T14:20:00.000' AS DateTime), CAST(N'1900-01-01T17:12:00.000' AS DateTime), 13, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (21, 1, CAST(N'1900-01-01T09:40:00.000' AS DateTime), CAST(N'1900-01-01T12:27:00.000' AS DateTime), 14, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (22, 5, CAST(N'1900-01-01T17:10:00.000' AS DateTime), CAST(N'1900-01-01T20:33:00.000' AS DateTime), 15, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (23, 6, CAST(N'1900-01-01T17:10:00.000' AS DateTime), CAST(N'1900-01-01T20:33:00.000' AS DateTime), 16, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (25, 3, CAST(N'2017-11-21T06:10:00.000' AS DateTime), CAST(N'2017-11-21T08:15:00.000' AS DateTime), 18, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (31, 1, CAST(N'1900-01-01T17:10:00.000' AS DateTime), CAST(N'1900-01-01T23:50:00.000' AS DateTime), 21, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (32, 3, CAST(N'1900-01-01T17:10:00.000' AS DateTime), CAST(N'1900-01-01T23:50:00.000' AS DateTime), 21, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (33, 5, CAST(N'1900-01-01T17:10:00.000' AS DateTime), CAST(N'1900-01-01T23:50:00.000' AS DateTime), 21, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (34, 0, CAST(N'1900-01-01T17:10:00.000' AS DateTime), CAST(N'1900-01-01T23:50:00.000' AS DateTime), 21, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (35, 2, CAST(N'2016-09-02T18:23:00.000' AS DateTime), CAST(N'2016-09-02T23:05:00.000' AS DateTime), 22, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (36, 4, CAST(N'2016-09-02T18:23:00.000' AS DateTime), CAST(N'2016-09-02T23:05:00.000' AS DateTime), 22, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (37, 6, CAST(N'2016-09-02T18:23:00.000' AS DateTime), CAST(N'2016-09-02T23:05:00.000' AS DateTime), 22, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (38, 1, CAST(N'2016-09-21T16:15:00.000' AS DateTime), CAST(N'2016-09-21T22:46:00.000' AS DateTime), 23, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (39, 0, CAST(N'1900-01-01T19:11:00.000' AS DateTime), CAST(N'1900-01-01T23:13:00.000' AS DateTime), 24, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (67, 1, CAST(N'2016-09-15T00:00:00.000' AS DateTime), CAST(N'2016-09-15T00:00:00.000' AS DateTime), 11, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (68, 3, CAST(N'2016-09-15T00:00:00.000' AS DateTime), CAST(N'2016-09-15T00:00:00.000' AS DateTime), 11, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (69, 5, CAST(N'2016-09-16T00:00:00.000' AS DateTime), CAST(N'2016-09-16T00:00:00.000' AS DateTime), 11, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (70, 0, CAST(N'2016-09-16T00:00:00.000' AS DateTime), CAST(N'2016-09-16T00:00:00.000' AS DateTime), 11, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (71, 1, CAST(N'2016-09-16T00:00:00.000' AS DateTime), CAST(N'2016-09-16T00:00:00.000' AS DateTime), 11, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (72, 3, CAST(N'2016-09-16T00:00:00.000' AS DateTime), CAST(N'2016-09-16T00:00:00.000' AS DateTime), 11, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (73, 1, CAST(N'2016-09-16T00:00:00.000' AS DateTime), CAST(N'2016-09-16T00:00:00.000' AS DateTime), 11, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (74, 1, CAST(N'2017-11-25T00:00:00.000' AS DateTime), CAST(N'2017-11-25T00:00:00.000' AS DateTime), 58, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (75, 2, CAST(N'2017-11-25T00:00:00.000' AS DateTime), CAST(N'2017-11-25T00:00:00.000' AS DateTime), 58, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (76, 3, CAST(N'2017-11-25T00:00:00.000' AS DateTime), CAST(N'2017-11-25T00:00:00.000' AS DateTime), 58, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (77, 4, CAST(N'2017-11-25T00:00:00.000' AS DateTime), CAST(N'2017-11-25T00:00:00.000' AS DateTime), 58, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (78, 5, CAST(N'2017-11-25T00:00:00.000' AS DateTime), CAST(N'2017-11-25T00:00:00.000' AS DateTime), 58, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (79, 6, CAST(N'2017-11-25T00:00:00.000' AS DateTime), CAST(N'2017-11-25T00:00:00.000' AS DateTime), 58, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (80, 0, CAST(N'2017-11-25T00:00:00.000' AS DateTime), CAST(N'2017-11-25T00:00:00.000' AS DateTime), 58, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (81, 1, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 59, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (82, 2, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 59, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (83, 3, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 59, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (84, 4, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 59, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (85, 5, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 59, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (86, 6, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 59, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (87, 0, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 59, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (88, 1, CAST(N'2016-09-28T00:00:00.000' AS DateTime), CAST(N'2016-09-28T00:00:00.000' AS DateTime), 60, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (89, 2, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 60, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (90, 3, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 60, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (91, 4, CAST(N'2016-09-28T00:00:00.000' AS DateTime), CAST(N'2016-09-28T00:00:00.000' AS DateTime), 60, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (92, 5, CAST(N'2016-09-28T00:00:00.000' AS DateTime), CAST(N'2016-09-28T00:00:00.000' AS DateTime), 60, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (93, 6, CAST(N'2016-09-28T08:00:00.000' AS DateTime), CAST(N'2016-09-28T00:00:00.000' AS DateTime), 60, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (94, 0, CAST(N'2016-09-28T00:05:00.000' AS DateTime), CAST(N'2016-09-28T00:00:00.000' AS DateTime), 60, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (95, 1, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 61, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (96, 2, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 61, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (97, 3, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 61, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (98, 4, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 61, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (99, 5, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 61, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (100, 6, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 61, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (101, 0, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 61, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (102, 1, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 62, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (103, 2, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 62, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (104, 3, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 62, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (105, 4, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 62, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (106, 5, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 62, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (107, 6, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 62, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (108, 0, CAST(N'2016-09-20T00:00:00.000' AS DateTime), CAST(N'2016-09-20T00:00:00.000' AS DateTime), 62, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (109, 2, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 23, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (110, 3, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 23, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (111, 4, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 23, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (112, 5, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 23, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (113, 6, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 23, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (114, 0, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 23, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (115, 2, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 12, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (116, 3, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 12, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (117, 4, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 12, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (118, 5, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 12, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (119, 6, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 12, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (120, 0, CAST(N'2016-09-21T00:00:00.000' AS DateTime), CAST(N'2016-09-21T00:00:00.000' AS DateTime), 12, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (121, 1, CAST(N'2016-09-27T00:00:00.000' AS DateTime), CAST(N'2016-09-27T00:00:00.000' AS DateTime), 64, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (122, 2, CAST(N'2016-09-27T00:00:00.000' AS DateTime), CAST(N'2016-09-27T00:00:00.000' AS DateTime), 64, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (123, 3, CAST(N'2016-09-27T00:00:00.000' AS DateTime), CAST(N'2016-09-27T00:00:00.000' AS DateTime), 64, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (124, 4, CAST(N'2016-09-27T00:00:00.000' AS DateTime), CAST(N'2016-09-27T00:00:00.000' AS DateTime), 64, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (125, 5, CAST(N'2016-09-27T00:00:00.000' AS DateTime), CAST(N'2016-09-27T00:00:00.000' AS DateTime), 64, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (126, 6, CAST(N'2016-09-27T00:00:00.000' AS DateTime), CAST(N'2016-09-27T00:00:00.000' AS DateTime), 64, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (127, 0, CAST(N'2016-09-27T00:00:00.000' AS DateTime), CAST(N'2016-09-27T00:00:00.000' AS DateTime), 64, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (128, 2, CAST(N'2016-09-28T00:00:00.000' AS DateTime), CAST(N'2016-09-28T00:00:00.000' AS DateTime), 60, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (129, 1, CAST(N'2016-09-28T08:00:00.000' AS DateTime), CAST(N'2016-09-28T00:00:00.000' AS DateTime), 60, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (130, 1, CAST(N'2017-11-21T00:00:00.000' AS DateTime), CAST(N'2017-11-21T00:00:00.000' AS DateTime), 18, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (131, 1, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 65, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (132, 2, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 65, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (133, 3, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 65, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (134, 4, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 65, 1)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (135, 4, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 65, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (136, 5, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 65, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (137, 6, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 65, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (138, 0, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 65, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (139, 1, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 66, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (140, 2, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 66, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (141, 3, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 66, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (142, 4, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 66, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (143, 5, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 66, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (144, 6, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 66, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (145, 0, CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), 66, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (146, 1, CAST(N'2018-05-24T00:00:00.000' AS DateTime), CAST(N'2018-05-24T06:03:00.000' AS DateTime), 57, 0)
INSERT [dbo].[Schedules] ([Id], [DayOfWeek], [DepartureTime], [ArrivalTime], [FlightId], [IsDeleted]) VALUES (147, 2, CAST(N'2018-05-24T03:03:00.000' AS DateTime), CAST(N'2018-05-24T07:01:00.000' AS DateTime), 57, 0)
GO
SET IDENTITY_INSERT [dbo].[Schedules] OFF
SET IDENTITY_INSERT [dbo].[Tours] ON 

INSERT [dbo].[Tours] ([Id], [CreationDate], [TotalPrice], [ReservationId], [CustomerId], [TourStateId], [IsDeleted]) VALUES (1, CAST(N'2018-04-25T13:40:31.673' AS DateTime), CAST(235.00 AS Decimal(18, 2)), 1, 34, 1, 0)
INSERT [dbo].[Tours] ([Id], [CreationDate], [TotalPrice], [ReservationId], [CustomerId], [TourStateId], [IsDeleted]) VALUES (2, CAST(N'2018-05-24T06:47:50.393' AS DateTime), CAST(250.00 AS Decimal(18, 2)), 2, 34, 1, 0)
SET IDENTITY_INSERT [dbo].[Tours] OFF
SET IDENTITY_INSERT [dbo].[TourStates] ON 

INSERT [dbo].[TourStates] ([Id], [Name]) VALUES (1, N'Registered')
INSERT [dbo].[TourStates] ([Id], [Name]) VALUES (2, N'Paid')
INSERT [dbo].[TourStates] ([Id], [Name]) VALUES (4, N'Done')
SET IDENTITY_INSERT [dbo].[TourStates] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (24, N'admin@gmail.com', N'QoV5EU3jX0u9mxmdoInf/w', 2)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (31, N'yarinaa@gmail.com', N'MO8/gRjqoeQ3ORfQ52fckw', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (40, N'yarapasya@gmail.com', N'MO8/gRjqoeQ3ORfQ52fckw', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (41, N'manager@gmail.com', N'QoV5EU3jX0u9mxmdoInf/w', 3)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (58, N'ivanow@gmail.com', N'MO8/gRjqoeQ3ORfQ52fckw', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (59, N'test@gmail.com', N'MO8/gRjqoeQ3ORfQ52fckw', 3)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (75, N'manage@gmail.com', N'QoV5EU3jX0u9mxmdoInf/w', 3)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (84, N'customer@gmail.com', N'QoV5EU3jX0u9mxmdoInf/w', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (89, N'test3@gmail.com', N'QoV5EU3jX0u9mxmdoInf/w', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (91, N'aadz@gmail.com', N'MO8/gRjqoeQ3ORfQ52fckw', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (92, N'ma@gmail.com', N'MO8/gRjqoeQ3ORfQ52fckw', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (93, N'TestTest@gmail.com', N'3x8ZPFejs8gufRUCcqN3XQ', 3)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (94, N'testNoCountry@gmail.com', N'MO8/gRjqoeQ3ORfQ52fckw', 3)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (95, N'andriysavriy@gmail.com', N'WSHC03VgLod7s5Zvr+yivQ', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (96, N'asd@gmail.com', N'QoV5EU3jX0u9mxmdoInf/w', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (97, N'slavikkozlov3@gmail.com', N'JKRT2bVLi/FvvAYGmAgmMQ', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (98, N'zz@gmail.com', N'MO8/gRjqoeQ3ORfQ52fckw', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (99, N'andriyy@gmail.com', N'QoV5EU3jX0u9mxmdoInf/w', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (100, N'asd@gmail.com', N'MO8/gRjqoeQ3ORfQ52fckw', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (101, N'slavek_k@ukr.net2', N'JKRT2bVLi/FvvAYGmAgmMQ', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (102, N'yaficona@cartelera.org', N'Oj8siB1noNJ+qJcMnON/rQ', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [RoleId]) VALUES (103, N'assd@gmai.com', N'sFe8h8AcVjGR5FSf5wCPNg', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Administrators] ADD  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[Airplanes] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Airports] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Cities] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ((0)) FOR [TotalPayment]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[ExtraPrices] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Flights] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Hotels] ADD  DEFAULT ((0)) FOR [FoodPrice]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT ((0)) FOR [WithoutFood]
GO
ALTER TABLE [dbo].[RoomItems] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Schedules] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Tours] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Airports]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Airports_dbo.Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Airports] CHECK CONSTRAINT [FK_dbo.Airports_dbo.Cities_CityId]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Answers_dbo.Managers_ManagerId] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Managers] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_dbo.Answers_dbo.Managers_ManagerId]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Answers_dbo.Questions_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_dbo.Answers_dbo.Questions_QuestionId]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Cities_dbo.Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_dbo.Cities_dbo.Countries_CountryId]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Countries_dbo.Managers_ManagerId] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Managers] ([Id])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_dbo.Countries_dbo.Managers_ManagerId]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Customers_dbo.Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_dbo.Customers_dbo.Cities_CityId]
GO
ALTER TABLE [dbo].[EquipmentRooms]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EquipmentRooms_dbo.Equipments_Equipment_Id] FOREIGN KEY([Equipment_Id])
REFERENCES [dbo].[Equipments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EquipmentRooms] CHECK CONSTRAINT [FK_dbo.EquipmentRooms_dbo.Equipments_Equipment_Id]
GO
ALTER TABLE [dbo].[EquipmentRooms]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EquipmentRooms_dbo.Rooms_Room_Id] FOREIGN KEY([Room_Id])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[EquipmentRooms] CHECK CONSTRAINT [FK_dbo.EquipmentRooms_dbo.Rooms_Room_Id]
GO
ALTER TABLE [dbo].[ExtraPrices]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExtraPrices_dbo.Hotels_HotelId] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotels] ([Id])
GO
ALTER TABLE [dbo].[ExtraPrices] CHECK CONSTRAINT [FK_dbo.ExtraPrices_dbo.Hotels_HotelId]
GO
ALTER TABLE [dbo].[FacilityHotels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FacilitiesHotels_dbo.Facilities_FacilityId] FOREIGN KEY([Facility_Id])
REFERENCES [dbo].[Facilities] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacilityHotels] CHECK CONSTRAINT [FK_dbo.FacilitiesHotels_dbo.Facilities_FacilityId]
GO
ALTER TABLE [dbo].[FacilityHotels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FacilitiesHotels_dbo.Hotels_HotelId] FOREIGN KEY([Hotel_Id])
REFERENCES [dbo].[Hotels] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacilityHotels] CHECK CONSTRAINT [FK_dbo.FacilitiesHotels_dbo.Hotels_HotelId]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Feedbacks_dbo.Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_dbo.Feedbacks_dbo.Customers_CustomerId]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Feedbacks_dbo.Hotels_HotelId] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotels] ([Id])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_dbo.Feedbacks_dbo.Hotels_HotelId]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Feedbacks_dbo.Ratings_RatingId] FOREIGN KEY([RatingId])
REFERENCES [dbo].[Ratings] ([Id])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_dbo.Feedbacks_dbo.Ratings_RatingId]
GO
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Flights_dbo.Airplanes_AirplaneId] FOREIGN KEY([AirplaneId])
REFERENCES [dbo].[Airplanes] ([Id])
GO
ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_dbo.Flights_dbo.Airplanes_AirplaneId]
GO
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Flights_dbo.Airports_ArrivalAirportId] FOREIGN KEY([ArrivalAirportId])
REFERENCES [dbo].[Airports] ([Id])
GO
ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_dbo.Flights_dbo.Airports_ArrivalAirportId]
GO
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Flights_dbo.Airports_DepartureAirportId] FOREIGN KEY([DepartureAirportId])
REFERENCES [dbo].[Airports] ([Id])
GO
ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_dbo.Flights_dbo.Airports_DepartureAirportId]
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Hotels_dbo.Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK_dbo.Hotels_dbo.Cities_CityId]
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Hotels_dbo.FoodTypes_FoodTypeId] FOREIGN KEY([FoodTypeId])
REFERENCES [dbo].[FoodTypes] ([Id])
GO
ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK_dbo.Hotels_dbo.FoodTypes_FoodTypeId]
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Hotels_dbo.Ratings_RatingId] FOREIGN KEY([RatingId])
REFERENCES [dbo].[Ratings] ([Id])
GO
ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK_dbo.Hotels_dbo.Ratings_RatingId]
GO
ALTER TABLE [dbo].[HotelsPhotos]  WITH CHECK ADD  CONSTRAINT [FK_HotelsPhotos_Hotels_HotelId] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotels] ([Id])
GO
ALTER TABLE [dbo].[HotelsPhotos] CHECK CONSTRAINT [FK_HotelsPhotos_Hotels_HotelId]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Questions_dbo.Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_dbo.Questions_dbo.Customers_CustomerId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Reservations_dbo.RoomItems_RoomItemId] FOREIGN KEY([RoomItemId])
REFERENCES [dbo].[RoomItems] ([Id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_dbo.Reservations_dbo.RoomItems_RoomItemId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Reservations_dbo.Schedules_LeaveScheduleId] FOREIGN KEY([LeaveScheduleId])
REFERENCES [dbo].[Schedules] ([Id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_dbo.Reservations_dbo.Schedules_LeaveScheduleId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Reservations_dbo.Schedules_ReturnScheduleId] FOREIGN KEY([ReturnScheduleId])
REFERENCES [dbo].[Schedules] ([Id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_dbo.Reservations_dbo.Schedules_ReturnScheduleId]
GO
ALTER TABLE [dbo].[RoomItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rooms_dbo.RoomTypesHotels_RoomTypeHotelId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[RoomItems] CHECK CONSTRAINT [FK_dbo.Rooms_dbo.RoomTypesHotels_RoomTypeHotelId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rooms_dbo.Hotels_HotelId] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotels] ([Id])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_dbo.Rooms_dbo.Hotels_HotelId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rooms_dbo.RoomTypes_RoomTypeId] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomTypes] ([Id])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_dbo.Rooms_dbo.RoomTypes_RoomTypeId]
GO
ALTER TABLE [dbo].[RoomsPhotos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoomPhotos_dbo.Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[RoomsPhotos] CHECK CONSTRAINT [FK_dbo.RoomPhotos_dbo.Rooms_RoomId]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Schedules_dbo.Flights_FlightId] FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flights] ([Id])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_dbo.Schedules_dbo.Flights_FlightId]
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tours_dbo.Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Tours] CHECK CONSTRAINT [FK_dbo.Tours_dbo.Customers_CustomerId]
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tours_dbo.Reservations_ReservationId] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservations] ([Id])
GO
ALTER TABLE [dbo].[Tours] CHECK CONSTRAINT [FK_dbo.Tours_dbo.Reservations_ReservationId]
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tours_dbo.TourStates_TourStateId] FOREIGN KEY([TourStateId])
REFERENCES [dbo].[TourStates] ([Id])
GO
ALTER TABLE [dbo].[Tours] CHECK CONSTRAINT [FK_dbo.Tours_dbo.TourStates_TourStateId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomItems', @level2type=N'CONSTRAINT',@level2name=N'FK_dbo.Rooms_dbo.RoomTypesHotels_RoomTypeHotelId'
GO
USE [master]
GO
ALTER DATABASE [SevenWonders] SET  READ_WRITE 
GO
