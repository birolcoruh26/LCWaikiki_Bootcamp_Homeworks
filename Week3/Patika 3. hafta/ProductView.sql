USE [PatikaCommerceDb]
GO

/****** Object:  View [dbo].[ProductView]    Script Date: 4.05.2022 21:02:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[ProductView]
as
select p1.Product_Name,c1.Category_Name,s1.SubCategory_Name,p2.Product_Description,p2.Product_Price,p2.Product_Stock 
from Product p1
left join Product_Detail p2
on p1.Product_Id = p2.Product_Id
left join Category c1
on p1.Category_Id = c1.Category_Id
left join SubCategory s1
on p1.SubCategory_Id = s1.SubCategory_Id
GO

