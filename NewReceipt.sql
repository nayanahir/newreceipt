USE [master]
GO
/****** Object:  Database [Receipt]    Script Date: 1/16/2025 11:41:42 PM ******/
CREATE DATABASE [Receipt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Receipt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Receipt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Receipt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Receipt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Receipt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Receipt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Receipt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Receipt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Receipt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Receipt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Receipt] SET ARITHABORT OFF 
GO
ALTER DATABASE [Receipt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Receipt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Receipt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Receipt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Receipt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Receipt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Receipt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Receipt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Receipt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Receipt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Receipt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Receipt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Receipt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Receipt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Receipt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Receipt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Receipt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Receipt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Receipt] SET  MULTI_USER 
GO
ALTER DATABASE [Receipt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Receipt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Receipt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Receipt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Receipt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Receipt] SET QUERY_STORE = OFF
GO
USE [Receipt]
GO
/****** Object:  Table [dbo].[MstProducts]    Script Date: 1/16/2025 11:41:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[HsnCode] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/16/2025 11:41:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[HscCode] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SerialNumbers]    Script Date: 1/16/2025 11:41:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SerialNumbers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranReceipt]    Script Date: 1/16/2025 11:41:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranReceipt](
	[ReceiptId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[AddressName] [nvarchar](255) NULL,
	[GSTNO] [nvarchar](15) NULL,
	[StateName] [nvarchar](50) NULL,
	[StateCode] [nvarchar](10) NULL,
	[InvoiceNo] [nvarchar](50) NULL,
	[InvoiceDate] [date] NOT NULL,
	[VehicleNumber] [nvarchar](20) NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[UserCode] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranReceiptDetails]    Script Date: 1/16/2025 11:41:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranReceiptDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptId] [int] NOT NULL,
	[ProductCode] [nvarchar](50) NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[HSNNo] [nvarchar](10) NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/16/2025 11:41:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[SecretKey] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MstProducts] ON 

INSERT [dbo].[MstProducts] ([Id], [Name], [HsnCode], [Price]) VALUES (1, N's', N'd', CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[MstProducts] ([Id], [Name], [HsnCode], [Price]) VALUES (2, N'hhh', N'nhn', CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[MstProducts] ([Id], [Name], [HsnCode], [Price]) VALUES (3, N'l', N'kl', CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[MstProducts] ([Id], [Name], [HsnCode], [Price]) VALUES (4, N'k', N'km', CAST(62.00 AS Decimal(18, 2)))
INSERT [dbo].[MstProducts] ([Id], [Name], [HsnCode], [Price]) VALUES (5, N'ssdsf', N'd', CAST(50.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[MstProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [HscCode], [Price]) VALUES (1, N'abc', N'HS1234', CAST(100.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[SerialNumbers] ON 

INSERT [dbo].[SerialNumbers] ([Id], [Number]) VALUES (1, 1)
INSERT [dbo].[SerialNumbers] ([Id], [Number]) VALUES (2, 1)
SET IDENTITY_INSERT [dbo].[SerialNumbers] OFF
GO
SET IDENTITY_INSERT [dbo].[TranReceipt] ON 

INSERT [dbo].[TranReceipt] ([ReceiptId], [CustomerName], [AddressName], [GSTNO], [StateName], [StateCode], [InvoiceNo], [InvoiceDate], [VehicleNumber], [TotalAmount], [UserCode]) VALUES (8, N'nayan', N'ns', N'sn', N'n', N'5', N'INV-1', CAST(N'2025-01-15' AS Date), N'545', CAST(3720.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[TranReceipt] ([ReceiptId], [CustomerName], [AddressName], [GSTNO], [StateName], [StateCode], [InvoiceNo], [InvoiceDate], [VehicleNumber], [TotalAmount], [UserCode]) VALUES (9, N'dev patel', N'nn', N'nn', N'nn', N'2', N'INV-2', CAST(N'2025-01-15' AS Date), N'6546', CAST(840.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[TranReceipt] ([ReceiptId], [CustomerName], [AddressName], [GSTNO], [StateName], [StateCode], [InvoiceNo], [InvoiceDate], [VehicleNumber], [TotalAmount], [UserCode]) VALUES (10, N'ab', N'b', N'b', N'b', N'', N'INV-3', CAST(N'2025-01-15' AS Date), N'bb', CAST(850.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[TranReceipt] OFF
GO
SET IDENTITY_INSERT [dbo].[TranReceiptDetails] ON 

INSERT [dbo].[TranReceiptDetails] ([DetailId], [ReceiptId], [ProductCode], [ProductName], [HSNNo], [Quantity], [Rate], [Amount]) VALUES (1, 8, N'5', N'ssdsf', N'd', CAST(6.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(360.00 AS Decimal(18, 2)))
INSERT [dbo].[TranReceiptDetails] ([DetailId], [ReceiptId], [ProductCode], [ProductName], [HSNNo], [Quantity], [Rate], [Amount]) VALUES (3, 9, N'2', N'hhh', N'nhn', CAST(6.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[TranReceiptDetails] ([DetailId], [ReceiptId], [ProductCode], [ProductName], [HSNNo], [Quantity], [Rate], [Amount]) VALUES (4, 9, N'3', N'l', N'kl', CAST(6.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), CAST(540.00 AS Decimal(18, 2)))
INSERT [dbo].[TranReceiptDetails] ([DetailId], [ReceiptId], [ProductCode], [ProductName], [HSNNo], [Quantity], [Rate], [Amount]) VALUES (5, 8, N'2', N'hhh', N'nhn', CAST(50.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[TranReceiptDetails] ([DetailId], [ReceiptId], [ProductCode], [ProductName], [HSNNo], [Quantity], [Rate], [Amount]) VALUES (6, 10, N'5', N'ssdsf', N'd', CAST(6.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[TranReceiptDetails] ([DetailId], [ReceiptId], [ProductCode], [ProductName], [HSNNo], [Quantity], [Rate], [Amount]) VALUES (7, 10, N'3', N'l', N'kl', CAST(11.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TranReceiptDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [FullName], [Email], [SecretKey]) VALUES (1, N'admin', N'admin123', N'Administrator', N'nayanahir5575@gmail.com', N'')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[TranReceiptDetails]  WITH CHECK ADD FOREIGN KEY([ReceiptId])
REFERENCES [dbo].[TranReceipt] ([ReceiptId])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[DeleteTranReceipt]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTranReceipt]
    @ReceiptId INT
AS
BEGIN
    -- Delete the details first to maintain referential integrity
    DELETE FROM TranReceiptDetails WHERE ReceiptId = @ReceiptId;

    -- Delete the header
    DELETE FROM TranReceipt WHERE ReceiptId = @ReceiptId;
END
GO
/****** Object:  StoredProcedure [dbo].[GenerateInvoiceNumber]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenerateInvoiceNumber]
    @Prefix NVARCHAR(10),  -- Optional prefix for the invoice number (e.g., "INV-")
    @GeneratedInvoiceNumber NVARCHAR(50) OUTPUT
AS
BEGIN
    DECLARE @LastInvoiceNumber NVARCHAR(50);
    DECLARE @NewInvoiceNumber NVARCHAR(50);

    -- Get the last Invoice Number from the TranReceipt table (assuming it's numeric)
    SELECT TOP 1 @LastInvoiceNumber = InvoiceNo
    FROM TranReceipt
    ORDER BY InvoiceNo DESC;

    -- If there is no invoice number yet, set the new invoice number to the prefix + 1
    IF @LastInvoiceNumber IS NULL
    BEGIN
        SET @NewInvoiceNumber = @Prefix + '1';  -- Starting from 1 if no records exist
    END
    ELSE
    BEGIN
        -- Otherwise, increment the last invoice number by 1 (strip the prefix and get the number part)
        DECLARE @NumberPart INT = CAST(SUBSTRING(@LastInvoiceNumber, LEN(@Prefix) + 1, LEN(@LastInvoiceNumber)) AS INT);
        SET @NewInvoiceNumber = @Prefix + CAST(@NumberPart + 1 AS NVARCHAR(50));
    END

    -- Return the new invoice number
    SET @GeneratedInvoiceNumber = @NewInvoiceNumber;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllTranReceipts]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTranReceipts]  
AS  
BEGIN  
    -- Get all headers  
    SELECT ReceiptId,CustomerName,InvoiceNo,InvoiceDate,TotalAmount FROM TranReceipt;  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[GetNewInvoiceNo]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetNewInvoiceNo]
AS
BEGIN
    SELECT ISNULL(MAX(InvoiceNo), 0) + 1 AS NextInvoiceNo FROM TranReceipt;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTranReceiptById]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTranReceiptById]  
    @ReceiptId INT  
AS  
BEGIN  
    -- Get the header for the given ReceiptId  
    SELECT 
        ReceiptId,
        CustomerName,
        AddressName,
        GstNo,
        StateName,
        StateCode,
        InvoiceNo,
        InvoiceDate,
        VehicleNumber,
        TotalAmount
    FROM TranReceipt 
    WHERE ReceiptId = @ReceiptId;

    -- Get the associated details for the given ReceiptId  
    SELECT 
	DetailId,
		ReceiptId,
        ProductCode,
        ProductName,
        HSNNo,
        Quantity,
        Rate,
        Amount
    FROM TranReceiptDetails 
    WHERE ReceiptId = @ReceiptId;
END
GO
/****** Object:  StoredProcedure [dbo].[ManageTranReceiptDetails]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ManageTranReceiptDetails]
    @ReceiptId INT, 
    @DetailId INT, 
    @ProductCode NVARCHAR(50),  
    @ProductName NVARCHAR(100),  
    @HSNNo NVARCHAR(20),  
    @Quantity INT,  
    @Rate DECIMAL(18, 2),  
    @Amount DECIMAL(18, 2),  
    @DelFlag BIT -- Flag to indicate if the detail should be deleted
AS  
BEGIN
    IF @DelFlag = 1
    BEGIN
        -- Delete the detail if DelFlag is 1
        DELETE FROM TranReceiptDetails WHERE DetailId = @DetailId AND ReceiptId = @ReceiptId;
    END
    ELSE
    BEGIN
        IF @DetailId = 0
        BEGIN
            -- Insert new detail if DetailId is 0
            INSERT INTO TranReceiptDetails (ReceiptId, ProductCode, ProductName, HSNNo, Quantity, Rate, Amount)
            VALUES (@ReceiptId, @ProductCode, @ProductName, @HSNNo, @Quantity, @Rate, @Amount);
        END
        ELSE
        BEGIN
            -- Update the existing detail if DetailId > 0
            UPDATE TranReceiptDetails
            SET ProductCode = @ProductCode,
                ProductName = @ProductName,
                HSNNo = @HSNNo,
                Quantity = @Quantity,
                Rate = @Rate,
                Amount = @Amount
            WHERE DetailId = @DetailId AND ReceiptId = @ReceiptId;
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_Delete_MstProduct]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_Delete_MstProduct]
    @Id INT
AS
BEGIN
    -- Delete a product from the MstProducts table based on the Id
    DELETE FROM MstProducts WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_Insert_MstProduct]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Proc_Insert_MstProduct] 
    @Name NVARCHAR(50),
    @HsnCode NVARCHAR(50),
    @Price DECIMAL(18,2)
AS
BEGIN
    -- Insert a new product into the MstProducts table
    INSERT INTO MstProducts (Name, HsnCode, Price)
    VALUES (@Name, @HsnCode, @Price);
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_SelectAll_MstProducts]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_SelectAll_MstProducts]
AS
BEGIN
    -- Select all products from the MstProducts table
    SELECT * FROM MstProducts;
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_SelectById_MstProduct]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_SelectById_MstProduct]
    @Id INT
AS
BEGIN
    -- Select a product based on the Id
    SELECT * FROM MstProducts WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_Update_MstProduct]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Proc_Update_MstProduct]
    @Id INT,
    @Name NVARCHAR(50),
    @HsnCode NVARCHAR(50),
    @Price DECIMAL(18,2)
AS
BEGIN
    -- Update the product details based on the Id
    UPDATE MstProducts
    SET Name = @Name,
        HsnCode = @HsnCode,
        Price = @Price
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SaveTranReceiptDetails]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveTranReceiptDetails]
    @ReceiptId INT, -- The ReceiptId from the header
    @ProductCode NVARCHAR(50),
    @ProductName NVARCHAR(100),
    @HSNNo NVARCHAR(20),
    @Quantity INT,
    @Rate DECIMAL(18, 2),
    @Amount DECIMAL(18, 2)
AS
BEGIN
    -- Insert the details record
    INSERT INTO TranReceiptDetails (ReceiptId, ProductCode, ProductName, HSNNo, Quantity, Rate, Amount)
    VALUES (@ReceiptId, @ProductCode, @ProductName, @HSNNo, @Quantity, @Rate, @Amount);
END
GO
/****** Object:  StoredProcedure [dbo].[SaveTranReceiptHeader]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SaveTranReceiptHeader]
    @CustomerName NVARCHAR(100),
    @AddressName NVARCHAR(200),
    @GSTNO NVARCHAR(20),
    @StateName NVARCHAR(50),
    @StateCode NVARCHAR(10),
    @InvoiceNo NVARCHAR(50),
    @InvoiceDate DATETIME,
    @VehicleNumber NVARCHAR(50),
    @TotalAmount DECIMAL(18, 2),
    @UserCode INT,
    @ReceiptId INT OUTPUT -- Output parameter to return the ReceiptId
AS
BEGIN
    -- Insert into TranReceipt (header)
    INSERT INTO TranReceipt (CustomerName, AddressName, GSTNO, StateName, StateCode, InvoiceNo, InvoiceDate, VehicleNumber, TotalAmount, UserCode)
    VALUES (@CustomerName, @AddressName, @GSTNO, @StateName, @StateCode, @InvoiceNo, @InvoiceDate, @VehicleNumber, @TotalAmount, @UserCode);

    -- Return the newly created ReceiptId
    SET @ReceiptId = SCOPE_IDENTITY(); -- Get the ReceiptId of the newly inserted record
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTranReceiptDetails]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTranReceiptDetails]
    @ReceiptId INT, -- ReceiptId to link the details
    @ProductCode NVARCHAR(50),
    @ProductName NVARCHAR(100),
    @HSNNo NVARCHAR(20),
    @Quantity INT,
    @Rate DECIMAL(18, 2),
    @Amount DECIMAL(18, 2)
AS
BEGIN
    UPDATE TranReceiptDetails
    SET ProductCode = @ProductCode,
        ProductName = @ProductName,
        HSNNo = @HSNNo,
        Quantity = @Quantity,
        Rate = @Rate,
        Amount = @Amount
    WHERE ReceiptId = @ReceiptId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTranReceiptHeader]    Script Date: 1/16/2025 11:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTranReceiptHeader]
    @ReceiptId INT,
    @CustomerName NVARCHAR(100),
    @AddressName NVARCHAR(200),
    @GSTNO NVARCHAR(20),
    @StateName NVARCHAR(50),
    @StateCode NVARCHAR(10),
    @InvoiceNo NVARCHAR(50),
    @InvoiceDate DATETIME,
    @VehicleNumber NVARCHAR(50),
    @TotalAmount DECIMAL(18, 2),
    @UserCode INT
AS
BEGIN
    UPDATE TranReceipt
    SET CustomerName = @CustomerName,
        AddressName = @AddressName,
        GSTNO = @GSTNO,
        StateName = @StateName,
        StateCode = @StateCode,
        InvoiceNo = @InvoiceNo,
        InvoiceDate = @InvoiceDate,
        VehicleNumber = @VehicleNumber,
        TotalAmount = @TotalAmount,
        UserCode = @UserCode
    WHERE ReceiptId = @ReceiptId;
END
GO
USE [master]
GO
ALTER DATABASE [Receipt] SET  READ_WRITE 
GO
