USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp.Chart_Lead10to14_Age6orMore_byMonth]    Script Date: 06/25/2010 17:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp.Chart_Lead_20to44]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     TOP (2147483647) WITH TIES(CASE WHEN [CountOfCHILD_ID] IS NULL THEN 0 ELSE [countOfChild_ID] END) AS TotalCount, 
                      dbo.PHP_LabResults.SampleYear AS Year, dbo.PHP_LabResults.SampleMonth AS Month
FROM         dbo.PHP_LabResults INNER JOIN
                      dbo.z_PHP_Chart_Lead_20to44_GROUPBY ON dbo.PHP_LabResults.SampleMonth = dbo.z_PHP_Chart_Lead_20to44_GROUPBY.Month AND 
                      dbo.PHP_LabResults.SampleYear = dbo.z_PHP_Chart_Lead_20to44_GROUPBY.Year
GROUP BY (CASE WHEN [CountOfCHILD_ID] IS NULL THEN 0 ELSE [countOfChild_ID] END), dbo.PHP_LabResults.SampleYear, dbo.PHP_LabResults.SampleMonth
ORDER BY Year, Month


END


