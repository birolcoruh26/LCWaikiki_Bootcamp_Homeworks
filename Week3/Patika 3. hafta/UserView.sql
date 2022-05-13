USE [PatikaCommerceDb]
GO

/****** Object:  View [dbo].[UserView]    Script Date: 4.05.2022 21:01:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[UserView]
WITH SCHEMABINDING AS
SELECT CONCAT(p.FirstName,' ' , p.LastName) as 'FullName',
p.Email,p.Password,
RIGHT(REPLICATE('0', 10) + CONVERT(VARCHAR(7), p.UserId), 7) as 'BarcodeNumber'
FROM [dbo].[User] p
GO

