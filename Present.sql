/* Registration */
CREATE TABLE [dbo].[tbl_Registration](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[phoneNo] [varchar](15) NOT NULL,
	[role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_Registration] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/*------------------------------------------*/
/*------------------------------------------*/
/*------------------------------------------*/
/* Service */
 CREATE TABLE dbo.tbl_Service(
	serviceID int NOT NULL primary key IDENTITY(1,1),
	serviceName nvarchar(100) NOT NULL,
	servicePrice float NOT NULL,
	serviceDes nvarchar(500) NULL,
	isDelete bit NOT NULL)


SELECT serviceID,serviceName,servicePrice,serviceDes FROM tbl_Service WHERE isDelete='false';
INSERT INTO tbl_Service(serviceID,serviceName,servicePrice,serviceDes,isDelete) values (?,?,?,?,'false');
UPDATE tbl_Service set serviceName=?,servicePrice=?,serviceDes=? where serviceID=?

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