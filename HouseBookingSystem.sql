USE [master]
GO
/****** Object:  Database [HouseBooking]    Script Date: 11/12/2022 5:20:36 AM ******/
CREATE DATABASE [HouseBooking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HouseBooking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HouseBooking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HouseBooking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HouseBooking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HouseBooking] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HouseBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HouseBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HouseBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HouseBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HouseBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HouseBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [HouseBooking] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HouseBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HouseBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HouseBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HouseBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HouseBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HouseBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HouseBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HouseBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HouseBooking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HouseBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HouseBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HouseBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HouseBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HouseBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HouseBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HouseBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HouseBooking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HouseBooking] SET  MULTI_USER 
GO
ALTER DATABASE [HouseBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HouseBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HouseBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HouseBooking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HouseBooking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HouseBooking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HouseBooking] SET QUERY_STORE = OFF
GO
USE [HouseBooking]
GO
/****** Object:  Table [dbo].[Additional_service]    Script Date: 11/12/2022 5:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Additional_service](
	[add_service_id] [int] IDENTITY(0,1) NOT NULL,
	[add_serviceName] [nvarchar](max) NULL,
	[add_serviceDesc] [nvarchar](max) NULL,
	[add_service_status] [int] NULL,
	[add_service_price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[add_service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 11/12/2022 5:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bill_id] [int] IDENTITY(0,1) NOT NULL,
	[date] [date] NULL,
	[total] [float] NULL,
	[status] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill_detail]    Script Date: 11/12/2022 5:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_detail](
	[billdetail_id] [int] IDENTITY(0,1) NOT NULL,
	[bill_id] [int] NOT NULL,
	[house_id] [int] NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[billdetail_id] ASC,
	[house_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/12/2022 5:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[cid] [int] IDENTITY(0,1) NOT NULL,
	[userid] [int] NULL,
	[houseid] [int] NULL,
	[comment] [nchar](1000) NULL,
	[date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 11/12/2022 5:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[house_id] [int] IDENTITY(0,1) NOT NULL,
	[post_date] [date] NULL,
	[house_name] [nvarchar](max) NULL,
	[review] [nvarchar](max) NULL,
	[house_price] [float] NULL,
	[status] [int] NULL,
	[address] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[loca_id] [int] NOT NULL,
	[menu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[house_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House_additional_service]    Script Date: 11/12/2022 5:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House_additional_service](
	[house_add_service_id] [int] IDENTITY(0,1) NOT NULL,
	[add_service_id] [int] NOT NULL,
	[house_id] [int] NOT NULL,
	
 CONSTRAINT [PK_House_additional_service] PRIMARY KEY CLUSTERED 
(
	[house_add_service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House_img]    Script Date: 11/12/2022 5:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House_img](
	[img_id] [int] IDENTITY(0,1) NOT NULL,
	[img_link] [nvarchar](max) NULL,
	[house_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 11/12/2022 5:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[loca_id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[loca_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 11/12/2022 5:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[menu_id] [int] IDENTITY(0,1) NOT NULL,
	[name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/12/2022 5:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(0,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/12/2022 5:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(0,1) NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[avatar] [nvarchar](max) NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](10) NULL,
	[status] [int] NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Additional_service] ON 

INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc], [add_service_status], [add_service_price]) VALUES (0, N'Nước đóng chai', N'Aquafina',1,2000)
INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc], [add_service_status], [add_service_price]) VALUES (1, N'Máy pha cà phê, trà', N'Cà phê, trà',1,2000)
INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc], [add_service_status], [add_service_price]) VALUES (2, N'Bữa sáng', N'Đồ ăn sáng',1,5000)
INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc], [add_service_status], [add_service_price]) VALUES (3, N'Bữa trưa', N'Đồ ăn trưa',1,10000)
INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc], [add_service_status], [add_service_price]) VALUES (4, N'Bữa tối', N'Đồ ăn tối',1,8000)
INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc], [add_service_status], [add_service_price]) VALUES (5, N'Nước ngọt', N'Sting, cocacola,...',1,2000)
INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc], [add_service_status], [add_service_price]) VALUES (6, N'Loa nghe nhạc', N'JBL',1,2000)
INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc], [add_service_status], [add_service_price]) VALUES (7, N'Hồ bơi người lớn', N'Hồ bơi tập trung',1,3000)
INSERT [dbo].[Additional_service] ([add_service_id], [add_serviceName], [add_serviceDesc], [add_service_status], [add_service_price]) VALUES (8, N'Hồ bơi trẻ em', N'Hồ bơi trẻ em',1,1000)
SET IDENTITY_INSERT [dbo].[Additional_service] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([bill_id], [date], [total], [status], [user_id]) VALUES (0, CAST(N'2022-11-11' AS Date), 5000, 1, 2)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill_detail] ON 

INSERT [dbo].[Bill_detail] ([billdetail_id], [bill_id], [house_id], [start_date], [end_date], [note]) VALUES (0, 0, 0, CAST(N'2022-11-15' AS Date), CAST(N'2022-11-20' AS Date), N'Nhận phòng trước 2 giờ')
SET IDENTITY_INSERT [dbo].[Bill_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (0, CAST(N'2022-09-29' AS Date), N'Khách sạn Palace Sài Gòn', N'Rất tốt', 1300000, 1, N'56-66 Nguyễn Huệ, Quận 1, Quận 1, Hồ Chí Minh', N'Hãy để chuyến đi của quý khách có một khởi đầu tuyệt vời khi ở lại khách sạn này, nơi có Wi-Fi miễn phí trong tất cả các phòng. Nằm ở vị trí chiến lược tại Quận 1, cho phép quý khách lui tới và gần với các điểm thu hút và tham quan địa phương.', 0, 3)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (1, CAST(N'2022-10-29' AS Date), N'Bland Landmark Luxury Residence', N'Tuyệt vời', 1100000, 1, N'Bình Thạnh, Hồ Chí Minh', N'Đỗ xe và Wi-Fi luôn miễn phí, vì vậy quý khách có thể giữ liên lạc, đến và đi tùy ý. Nằm ở vị trí trung tâm tại Bình Th?nh của Hồ Chí Minh, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị.', 0, 3)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (2, CAST(N'2022-10-28' AS Date), N'Diamond Luxury Ben Thanh', N'Tuyệt vời', 840000, 1, N'Quận 1, Hồ Chí Minh', N'Nằm ở vị trí chiến lược tại Quận 1, cho phép quý khách lui tới và gần với các điểm thu hút và tham quan địa phương. Đừng rời đi trước khi ghé thăm Bảo tàng Chứng tích chiến tranh nổi tiếng.', 0, 3)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (3, CAST(N'2022-10-28' AS Date), N'Saigon Apartments', N'Tuyệt vời', 1400000, 1, N'Quận 3, Hồ Chí Minh', N'Nằm ở vị trí trung tâm tại Quận 3 của Hồ Chí Minh, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị. ', 0, 2)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (4, CAST(N'2022-11-02' AS Date), N'Caroline Beach Vung Tau', N'Tuyệt vời', 581000, 1, N'53 Phan Van Tri, Thang Tam, Vung Tau', N'Nằm ở vị trí chiến lược tại Thắng Tam, cho phép quý khách lui tới và gần với các điểm thu hút và tham quan địa phương. Hãy nhớ dành một chút thời gian để thăm thú Hải đăng Vũng Tàu cũng như Front Beach gần đó.', 2, 3)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (5, CAST(N'2022-11-03' AS Date), N'Homestay VT', N'Tốt', 450000, 1, N'Phường 2, Vũng Tàu', N'Nằm ở vị trí trung tâm tại Phu?ng 2 của Vũng Tàu, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị.', 2, 1)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (6, CAST(N'2022-11-04' AS Date), N'COCOHOME - MELODY APARTMENT Vung Tau', N'Tuyệt vời', 1400000, 1, N'Thang Tam, Vung Tau', N'Chỗ nghỉ 3 sao này được trang bị các tiện nghi ngay trong khuôn viên để nâng cao chất lượng và niềm vui cho kỳ nghỉ của quý khách.', 2, 2)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (7, CAST(N'2022-11-05' AS Date), N'Khách sạn Vias Vũng Tàu (Vias Hotel Vung Tau)', N'Tuyệt vời', 2700000, 1, N'179 Thuy Van, Ward 8, Phường 8, Vũng Tàu, Việt Nam, 790000', N'Chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị. Đừng rời đi trước khi ghé thăm Hải đăng Vũng Tàu nổi tiếng.', 2, 3)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (8, CAST(N'2022-11-04' AS Date), N'HANZ Thien Nien Ky Hotel Dalat', N'Rất tốt', 308000, 1, N'Thác Cam Ly, Đà Lạt', N'Nằm ở vị trí trung tâm tại Thác Cam Ly của Đà Lạt, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị. Đừng rời đi trước khi ghé thăm Crazy House nổi tiếng.', 1, 3)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (9, CAST(N'2022-11-02' AS Date), N'Homestay Nam Thiên', N'Trên cả tuyệt vời', 184000, 1, N'Trung tâm Đà Lạt, Đà Lạt', N'Nằm ở vị trí trung tâm tại Trung tâm Đà Lạt của Đà Lạt, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị. Đừng rời đi trước khi ghé thăm Crazy House nổi tiếng.', 1, 1)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (10, CAST(N'2022-10-28' AS Date), N'Harmony Homestay', N'Trên cả tuyệt vời', 385000, 1, N'Hải Châu, Đà Nẵng', N'Nằm ở vị trí trung tâm tại Hai Châu của Đà Nẵng, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị. Đừng rời đi trước khi ghé thăm The Marble Mountains nổi tiếng.', 3, 1)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (11, CAST(N'2022-10-28' AS Date), N'Draco Hotel & Suites', N'Tuyệt vời', 1039000, 1, N'46 An Thượng 2, Phước Mỹ, Đà Nẵng', N'Nằm ở vị trí trung tâm tại Phuoc My của Đà Nẵng, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị. ', 3, 3)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (12, CAST(N'2022-11-12' AS Date), N'Khách sạn Centre (Centre Hotel)', N'Tuyệt vời', 500000, 1, N'18-20 Phạm Phú Thứ, Hải Châu, Đà Nẵng', N'Chỗ nghỉ 3 sao này có nhà hàng giúp cho kỳ nghỉ của quý khách thêm thư thái và đáng nhớ.', 3, 3)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (13, CAST(N'2022-11-12' AS Date), N'Muong Thanh Luxury Khanh Hoa', N'Trên cả tuyệt vời', 1056000, 1, N'Khu 01, Khu Dân cư cồn Tân Lập, Phường Xương Huân, Xương Huân, Nha Trang, Việt Nam, 650000', N'Nằm ở vị trí trung tâm tại Xương Huân của Nha Trang, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị. Hãy nhớ dành một chút thời gian để thăm thú Vinpearl Land Nha Trang cũng như Biển Nha Trang gần đó.', 6, 2)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (14, CAST(N'2022-11-11' AS Date), N'Handy Panorama Nha Trang Ocean View', N'Tuyệt vời', 1070000, 1, N'Lộc Thọ, Nha Trang', N'Nằm ở vị trí chiến lược tại Lộc Thọ, cho phép quý khách lui tới và gần với các điểm thu hút và tham quan địa phương.', 6, 3)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (15, CAST(N'2022-11-11' AS Date), N'Căn hộ "Le Basile - Seaview"Apartment Nha Trang', N'Trên cả tuyệt vời', 716000, 1, N'Vĩnh Phước, Nha Trang', N'Nằm ở vị trí trung tâm tại Vinh Phu?c của Nha Trang, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị. Đừng rời đi trước khi ghé thăm Vinpearl Land Nha Trang nổi tiếng.', 6, 2)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (16, CAST(N'2022-11-12' AS Date), N'Royal HPM Hotel', N'Tuyệt vời', 413000, 1, N'34/8 Nguyen Thien Thuat street, Tân Lập, Nha Trang', N'Nằm ở vị trí chiến lược tại Tân Lap, cho phép quý khách lui tới và gần với các điểm thu hút và tham quan địa phương. Hãy nhớ dành một chút thời gian để thăm thú Vinpearl Land Nha Trang cũng như Biển Nha Trang gần đó.', 6, 3)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (17, CAST(N'2022-11-09' AS Date), N'Wise Stay Panorama Nha Trang', N'Tuyệt vời', 830000, 1, N'Lộc Thọ, Nha Trang', N'Nằm ở vị trí chiến lược tại Lộc Thọ, cho phép quý khách lui tới và gần với các điểm thu hút và tham quan địa phương. Hãy nhớ dành một chút thời gian để thăm thú Vinpearl Land Nha Trang cũng như Biển Nha Trang gần đó.', 6, 2)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (18, CAST(N'2022-11-08' AS Date), N'Ri House Hoi An Homestay', N'Tuyệt vời', 231000, 1, N'Cẩm Thanh, Hội An', N'Nằm ở vị trí trung tâm tại Cẩm Thanh của Hội An, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị.', 10, 1)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (19, CAST(N'2022-11-08' AS Date), N'Khách sạn Mường Thanh Holiday Hội An (Muong Thanh Holiday Hoi An Hotel)', N'Tuyệt vời', 938000, 1, N'Lô 9, Khu đô thị mới Phước Trạch - Phước Hải, Đường Âu Cơ, Cửa Đại, Hội An', N'Nằm ở vị trí trung tâm tại Cửa Ðại của Hội An, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị. Đừng rời đi trước khi ghé thăm Phố cổ Hội An nổi tiếng.', 10, 3)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (20, CAST(N'2022-11-08' AS Date), N'Volar Hội An (Volar Hoi An)', N'Trên cả tuyệt vời', 546000, 1, N'Cẩm Châu, Hội An', N'Nằm ở vị trí trung tâm tại Cẩm Châu của Hội An, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị. Hãy nhớ dành một chút thời gian để thăm thú Phố cổ Hội An cũng như Biển Hội An gần đó.', 10, 5)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (21, CAST(N'2022-11-04' AS Date), N'Onion Homestay', N'Trên cả tuyệt vời', 411000, 1, N'Sơn Phong, Hội An', N'Nằm ở vị trí chiến lược tại Sơn Phong, cho phép quý khách lui tới và gần với các điểm thu hút và tham quan địa phương. Đừng rời đi trước khi ghé thăm Phố cổ Hội An nổi tiếng.', 10, 1)
INSERT [dbo].[House] ([house_id], [post_date], [house_name], [review], [house_price], [status], [address], [description], [loca_id], [menu_id]) VALUES (22, CAST(N'2022-11-07' AS Date), N'The Hill Resort', N'Trên cả tuyệt vời', 545000, 1, N'Dương Đông, Phú Quốc Island', N'Nằm ở vị trí trung tâm tại Dương Đông của Phú Quốc Island, chỗ nghỉ này đặt quý khách ở gần các điểm thu hút và tùy chọn ăn uống thú vị. Đừng rời đi trước khi ghé thăm Sao Beach nổi tiếng.', 9, 6)
SET IDENTITY_INSERT [dbo].[House] OFF
GO
SET IDENTITY_INSERT [dbo].[House_additional_service] ON 

INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (1, 0, 0)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (2, 1, 0)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (3, 2, 0)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (4, 6, 0)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (5, 3, 1)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (6, 4, 1)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (7, 6, 1)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (8, 7, 1)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (9, 8, 1)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (10, 0, 2)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (11, 5, 2)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (12, 6, 2)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (13, 0, 3)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (14, 1, 3)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (15, 2, 3)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (16, 3, 3)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (17, 4, 3)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (18, 5, 4)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (19, 6, 4)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (20, 7, 4)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (21, 8, 4)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (22, 1, 5)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (23, 5, 5)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (24, 6, 5)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (25, 7, 5)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (26, 8, 5)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (27, 6, 6)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (28, 7, 6)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (29, 8, 6)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (30, 7, 7)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (31, 8, 7)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (32, 0, 8)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (33, 2, 8)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (34, 5, 8)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (35, 0, 9)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (36, 1, 9)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (37, 2, 9)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (38, 3, 9)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (39, 0, 10)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (40, 1, 10)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id])VALUES (41, 2, 11)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (42, 7, 11)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (43, 2, 12)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (44, 3, 12)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (45, 4, 12)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (46, 0, 13)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (47, 5, 13)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (48, 7, 14)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (49, 8, 14)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (50, 2, 15)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (51, 3, 15)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (52, 4, 15)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (53, 5, 15)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (54, 0, 16)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (55, 5, 16)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (56, 6, 17)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (57, 7, 17)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (58, 8, 17)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (59, 0, 18)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (60, 1, 18)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (61, 2, 18)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (62, 7, 19)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (63, 8, 19)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (64, 7, 20)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (65, 8, 20)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (66, 7, 21)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (67, 8, 21)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (68, 7, 22)
INSERT [dbo].[House_additional_service] ([house_add_service_id], [add_service_id], [house_id]) VALUES (69, 8, 22)
SET IDENTITY_INSERT [dbo].[House_additional_service] OFF
GO
SET IDENTITY_INSERT [dbo].[House_img] ON 

INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (0, N'PalaceSaiGon1.png', 0)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (1, N'PalaceSaiGon2.png', 0)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (2, N'PalaceSaiGon3.png', 0)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (3, N'Landmark1.png', 1)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (4, N'Landmark2.png', 1)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (5, N'Landmark3.png', 1)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (6, N'Landmark4.png', 1)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (11, N'Diamond1.png', 2)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (12, N'Diamond2.png', 2)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (13, N'Diamond3.png', 2)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (14, N'SaiGon1.png', 3)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (15, N'Saigon2.png', 3)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (16, N'Caroline1.png', 4)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (17, N'Caroline2.png', 4)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (18, N'Caroline3.png', 4)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (19, N'ht1.png', 5)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (20, N'ht2.png', 5)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (21, N'cocohome1.png', 6)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (22, N'cocohome2.png', 6)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (23, N'cocohome3.png', 6)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (24, N'vias1.png', 7)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (25, N'vias2.png', 7)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (26, N'vias3.png', 7)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (27, N'hanz1.png', 8)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (28, N'hanz2.png', 8)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (29, N'hanz3.png', 8)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (30, N'namthien1.png', 9)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (31, N'namthien2.png', 9)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (32, N'namthien3.png', 9)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (33, N'harmony1.png', 10)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (34, N'harmony2.png', 10)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (35, N'harmony3.png', 10)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (36, N'draco1.png', 11)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (37, N'draco2.png', 11)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (38, N'draco3.png', 11)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (39, N'draco4.png', 11)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (40, N'centre1.png', 12)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (41, N'centre2.png', 12)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (42, N'centre3.png', 12)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (43, N'muongthanh1.png', 13)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (44, N'muongthanh2.png', 13)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (45, N'muongthanh3.png', 13)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (46, N'handy1.png', 14)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (47, N'handy2.png', 14)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (48, N'handy3.png', 14)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (49, N'basile1.png', 15)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (50, N'basile2.png', 15)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (51, N'basile3.png', 15)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (52, N'royal1.png', 16)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (53, N'royal2.png', 16)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (54, N'royal3.png', 16)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (55, N'royal4.png', 16)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (56, N'wisestay1.png', 17)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (57, N'wisestay2.png', 17)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (58, N'wisestay3.png', 17)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (59, N'ri1.png', 18)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (60, N'ri2.png', 18)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (61, N'ri3.png', 18)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (62, N'muongthanhhoian1.png', 19)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (63, N'muongthanhhoian2.png', 19)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (64, N'muongthanhhoian3.png', 19)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (65, N'volar1.png', 20)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (66, N'volar2.png', 20)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (67, N'onion1.png', 21)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (68, N'onion2.png', 21)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (69, N'onion3.png', 21)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (70, N'hill1.png', 22)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (71, N'hill2.png', 22)
INSERT [dbo].[House_img] ([img_id], [img_link], [house_id]) VALUES (72, N'hill3.png', 22)
SET IDENTITY_INSERT [dbo].[House_img] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([loca_id], [name]) VALUES (0, N'Ho Chi Minh')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (1, N'Da Lat')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (2, N'Vung Tau')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (3, N'Da Nang')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (4, N'Ha Noi')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (5, N'Phan Thiet')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (6, N'Nha Trang')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (7, N'Can Tho')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (8, N'Hue')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (9, N'Phu Quoc')
INSERT [dbo].[Location] ([loca_id], [name]) VALUES (10, N'Hoi An')
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([menu_id], [name]) VALUES (0, N'Villa')
INSERT [dbo].[Menu] ([menu_id], [name]) VALUES (1, N'Homestay')
INSERT [dbo].[Menu] ([menu_id], [name]) VALUES (2, N'Apartment')
INSERT [dbo].[Menu] ([menu_id], [name]) VALUES (3, N'Hotel')
INSERT [dbo].[Menu] ([menu_id], [name]) VALUES (4, N'Motel')
INSERT [dbo].[Menu] ([menu_id], [name]) VALUES (5, N'House for rent')
INSERT [dbo].[Menu] ([menu_id], [name]) VALUES (6, N'Resort')
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [name]) VALUES (0, N'admin')
INSERT [dbo].[Role] ([role_id], [name]) VALUES (1, N'customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [fullname], [avatar], [username], [password], [email], [phone], [status], [role_id]) VALUES (0, N'Dương Tuấn Kiệt', N'', N'kiet', N'1', N'kiet@gmail.com', N'0339526281', 1, 0)
INSERT [dbo].[Users] ([user_id], [fullname], [avatar], [username], [password], [email], [phone], [status], [role_id]) VALUES (1, N'Đỗ Hữu Đức', N'duc.jpg', N'duc', N'123', N'duc@gmail.com', N'676767', 1, 1)
INSERT [dbo].[Users] ([user_id], [fullname], [avatar], [username], [password], [email], [phone], [status], [role_id]) VALUES (2, N'Phạm Hoàng Trung', NULL, N'trung', N'1', N'trung@gmail.com', N'04635353', 1, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Users]
GO
ALTER TABLE [dbo].[Bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Detail] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([bill_id])
GO
ALTER TABLE [dbo].[Bill_detail] CHECK CONSTRAINT [FK_Bill_Detail]
GO
ALTER TABLE [dbo].[Bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Detail_House] FOREIGN KEY([house_id])
REFERENCES [dbo].[House] ([house_id])
GO
ALTER TABLE [dbo].[Bill_detail] CHECK CONSTRAINT [FK_Bill_Detail_House]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_House] FOREIGN KEY([houseid])
REFERENCES [dbo].[House] ([house_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_House]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Users]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_house_menu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[Menu] ([menu_id])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_house_menu]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_Location] FOREIGN KEY([loca_id])
REFERENCES [dbo].[Location] ([loca_id])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_Location]
GO
ALTER TABLE [dbo].[House_additional_service]  WITH CHECK ADD  CONSTRAINT [FK_House_additional_service_Additional_service1] FOREIGN KEY([add_service_id])
REFERENCES [dbo].[Additional_service] ([add_service_id])
GO
ALTER TABLE [dbo].[House_additional_service] CHECK CONSTRAINT [FK_House_additional_service_Additional_service1]
GO
ALTER TABLE [dbo].[House_additional_service]  WITH CHECK ADD  CONSTRAINT [FK_House_additional_service_House1] FOREIGN KEY([house_id])
REFERENCES [dbo].[House] ([house_id])
GO
ALTER TABLE [dbo].[House_additional_service] CHECK CONSTRAINT [FK_House_additional_service_House1]
GO
ALTER TABLE [dbo].[House_img]  WITH CHECK ADD  CONSTRAINT [FK_House_Img] FOREIGN KEY([house_id])
REFERENCES [dbo].[House] ([house_id])
GO
ALTER TABLE [dbo].[House_img] CHECK CONSTRAINT [FK_House_Img]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [HouseBooking] SET  READ_WRITE 
GO
