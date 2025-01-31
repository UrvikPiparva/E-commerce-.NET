USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Order_SelectAllByPK]    Script Date: 10/16/2024 1:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Order_SelectAllByPK]
@OrderID INT
AS
SELECT 
[dbo].[SEC_User].[FirstName],
[dbo].[SEC_User].[EmailAddress],
[dbo].[Order].[OrderID],
[dbo].[Order].[OrderStatus],
[dbo].[Order].[Created],
[dbo].[Order].[Modified],
[dbo].[Address].[Address],
[dbo].[MST_Product].[DisplayImage],
[dbo].[MST_Product].[ProductName],
[dbo].[MST_Product].[Price]*[dbo].[Cart].[Quantity] AS Price,
[dbo].[Category].[CategoryName]
FROM [dbo].[SEC_User]
INNER JOIN [dbo].[Address]
ON [dbo].[SEC_User].[UserID] = [dbo].[Address].[UserID]
INNER JOIN [dbo].[Order]
ON [dbo].[SEC_User].[UserID] = [dbo].[Order].[UserID]
INNER JOIN [dbo].[MST_Product]
ON [dbo].[Order].[ProductID] = [dbo].[MST_Product].[ProductID]
INNER JOIN [dbo].[Category]
ON [dbo].[MST_Product].[CategoryID] = [dbo].[Category].[CategoryID]
INNER JOIN [dbo].[Cart]
ON [dbo].[Order].[ProductID] = [dbo].[Cart].[ProductID]
WHERE [dbo].[Order].[OrderID] = @OrderID

GO
