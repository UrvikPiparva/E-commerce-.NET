USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Category_SelectAll]    Script Date: 10/16/2024 1:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_SelectAll]
AS

SELECT	[dbo].[Category].[CategoryID], 
		[dbo].[Category].[CategoryName], 
		[dbo].[Category].[Discription], 
		[dbo].[Category].[Created],
		[dbo].[Category].[Modified]

FROM [dbo].[Category]

ORDER BY [dbo].[Category].[CategoryName]

GO
