USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp.Chart_Lead_20to44]    Script Date: 06/28/2010 10:08:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp.Chart_Lead_45to69]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     TOP (2147483647) WITH TIES(CASE WHEN [TotalCases] IS NULL THEN 0 ELSE [TotalCases] END) AS TotalCount, dbo.PHP_LabResults.SampleYear, 
                      dbo.PHP_LabResults.SampleMonth
FROM         dbo.PHP_LabResults LEFT OUTER JOIN
                      dbo.z_PHP_Chart_Lead_45to69_GROUPBY ON dbo.PHP_LabResults.SampleYear = dbo.z_PHP_Chart_Lead_45to69_GROUPBY.Year AND 
                      dbo.PHP_LabResults.SampleMonth = dbo.z_PHP_Chart_Lead_45to69_GROUPBY.Month
GROUP BY (CASE WHEN [TotalCases] IS NULL THEN 0 ELSE [TotalCases] END), dbo.PHP_LabResults.SampleYear, dbo.PHP_LabResults.SampleMonth
ORDER BY dbo.PHP_LabResults.SampleYear, dbo.PHP_LabResults.SampleMonth


END


