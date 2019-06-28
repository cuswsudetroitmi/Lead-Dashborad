-- usp_Chart_CaseOpened_ByYear.sql
-- 

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_Chart_CaseOpened_ByYear') is not null
    drop proc usp_Chart_CaseOpened_ByYear
go


CREATE PROCEDURE  usp_Chart_CaseOpened_ByYear
AS
BEGIN
	SET NOCOUNT ON;


SELECT   COUNT(CHILD_ID) AS total, DATEPART(year, DATEOPENED) AS Year
FROM         dbo.CASE_RCD
GROUP BY DATEPART(year, DATEOPENED)
HAVING      (DATEPART(year, DATEOPENED) IS NOT NULL)
ORDER BY Year

END

go

grant exec on usp_Chart_CaseOpened_ByYear to webrdr

go

exec usp_Chart_CaseOpened_ByYear

