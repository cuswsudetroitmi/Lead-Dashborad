USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp_Chart_CaseClosed_ByMonth]    Script Date: 06/25/2010 17:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp_Chart_CasesOpened_ByMonth]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     TOP (2147483647) WITH TIES COUNT(CHILD_ID) AS total, DATEPART(month, DATEOPENED) AS month, DATEPART(year, DATEOPENED) AS Year
FROM         dbo.CASE_RCD
GROUP BY DATEPART(month, DATEOPENED), DATEPART(year, DATEOPENED)
HAVING      (DATEPART(month, DATEOPENED) IS NOT NULL)
ORDER BY Year

END
