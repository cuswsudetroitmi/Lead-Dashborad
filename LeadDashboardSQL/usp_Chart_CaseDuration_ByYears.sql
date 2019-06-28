USE [LeadDashboard]
Go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE usp_Chart_CaseDuration_ByYears
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP (2147483647) WITH TIES COUNT(DATEDIFF(year, DATEOPENED, GETDATE())) AS Total, DATEDIFF(year, DATEOPENED, GETDATE()) AS Years
FROM         dbo.CASE_RCD
GROUP BY DATEDIFF(year, DATEOPENED, GETDATE())
HAVING      (DATEDIFF(year, DATEOPENED, GETDATE()) IS NOT NULL) AND (DATEDIFF(year, DATEOPENED, GETDATE()) >= 0)
ORDER BY Years

END
GO
