/* Registration */
CREATE TABLE [dbo].[tbl_Registration](
	[username] [nvarchar](50) primary key,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[phoneNo] [nvarchar](15) NOT NULL,
	[role] [nvarchar](10) NOT NULL)

/*------------------------------------------*/
/*------------------------------------------*/
/*------------------------------------------*/

/*------------------------------------------*/
/* Room */
CREATE TABLE [dbo].[tbl_Room](
	[roomID] [nvarchar](15) NOT NULL,
	[roomPrice] [float] NOT NULL,
	[roomDes] [nvarchar](500) NULL,
	[roomImgLink] [nvarchar](100) NULL,
	[isDelete] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
--
SELECT roomID,roomPrice,roomDes,roomImgLink FROM tbl_Room where isDelete='false';
INSERT INTO tbl_Room(roomID,roomPrice,roomDes,roomImgLink,isDelete) values(?,?,?,?,'false');
SELECT roomPrice,roomDes,roomImgLink FROM tbl_Room where roomID='101'
UPDATE tbl_Room SET roomPrice=?,roomDes=?,roomImgLink=? where roomID=?
/*------------------------------------------*//*------------------------------------------*/
/*------------------------------------------*/
/* Product */
CREATE TABLE tbl_Product(
	proID int NOT NULL primary key IDENTITY(1,1),
	proName nvarchar(100) NOT NULL,
	proPrice float NOT NULL,
	proDes nvarchar(500) NULL,
	proType nvarchar(15) NOT NULL,
	proImgLink nvarchar(100) NULL,
	isDelete bit NOT NULL
	,proQuantity int)
	SELECT proID,proName,proPrice,proDes,proType,proImgLink FROM tbl_Product where proName like '%a%'
	UPDATE tbl_Product set isDelete = 'false' where proID=?
	UPDATE tbl_Product set proName=?,proPrice=?,proDes=?,proType=?,proImgLink=? where proID = ?
	INSERT INTO tbl_Product(proID,proName,proPrice,proDes,proType,proImgLink,isDelete) values(?,?,?,?,?,?,'false')
/* ODER ROOM*/
CREATE TABLE [dbo].[tbl_OrderRoom](
	[orderRoomID] [nvarchar](20) NOT NULL,
	[roomID] [nvarchar](15) NOT NULL,
	[roomPrice] [float] NOT NULL,
	[customerUsername] [nvarchar](50) NOT NULL,
	[checkinDay] [date] NOT NULL,
	[checkoutDay] [date] NOT NULL,
	[finishedDay] [date] NULL,
	[total] [float] NOT NULL,
	[status] [nvarchar](15) NOT NULL,
	[createTime] [datetime] NULL,
	[staffUsername] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_OrderRoom] PRIMARY KEY CLUSTERED 
(
	[orderRoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- Phan Trang
 SELECT proID,proName,proPrice,proDes,proType,proImgLink,proQuantity,rowNum FROM (SELECT proID,proName,proPrice,proDes,proType,proImgLink,proQuantity, ROW_NUMBER() OVER(ORDER BY proID) as rowNum FROM tbl_Product where isDelete='false' and proQuantity>0 )AS tbl_COUNT where rowNum>=0 and rowNum<=10 
-- CHeck dang con o phong hay khong


----
Select orderRoomID,roomID From tbl_OrderRoom where ? BETWEEN checkinDay AND checkoutDay and status<>'finished' and customerUsername=?
SELECT * FROM Room
WHERE roomID  NOT IN (SELECT roomID FROM tbl_OrderRoom where GETDATE() BETWEEN checkinDay AND checkoutDay and status<>'finished')
-------


----------------
------ORDER PRODUCT
CREATE TABLE [dbo].[tbl_OrderProduct](
	[orderProductID] [nvarchar](20) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[total] [float] NOT NULL,
	[timeCreate] [datetime] NOT NULL,
	[status] [nvarchar](10) NULL,
 CONSTRAINT [PK_tbl_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[orderProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
---------------------
CREATE TABLE tbl_OrderProductDetail(
  orderProductID nvarchar(20) NOT NULL,
  proID int NOT NULL,
  proPrice float NOT NULL,
  quantity int NOT NULL,
  primary key (orderProductID,proID)
)
SELECT orderRoomID,roomID,customerUsername,checkinDay,checkoutDay,createTime FROM tbl_OrderRoom where status='finished' ORDER BY createTime DESC
SELECT orderRoomID,roomID,checkinDay,checkoutDay,total,staffUsername,status FROM tbl_OrderRoom where customerUsername='sang' ORDER BY createTime DESC

SELECT proID,proPrice,quantity FROM tbl_OrderProductDetail where orderProductID = 'PR-2'

SELECT username,total,timeCreate FROM tbl_OrderProduct where orderProductID= 'PR-2'
SELECT roomID,roomPrice,roomDes,roomImgLink FROM tbl_Room where isDelete='false' AND roomID NOT IN (SELECT roomID FROM tbl_OrderRoom where (( ? BETWEEN checkinDay AND checkoutDay) OR ( ? BETWEEN checkinDay AND checkoutDay) OR (checkinDay BETWEEN ? AND ? ))AND status <> 'finished')

