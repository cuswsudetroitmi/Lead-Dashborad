USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp.Chart_Lead_Age6orMore_byMonth]    Script Date: 06/25/2010 17:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp.Chart_Lead10to14_Age6orMore_byMonth]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     TOP (2147483647) WITH TIES COUNT(dbo.PHP_LabResults.CHILD_ID) AS Total, dbo.PHP_LabResults.SampleMonth AS Month, 
                      dbo.PHP_LabResults.SampleYear AS Year
FROM         dbo.PHP_qryChildrenAge6orMore INNER JOIN
                      dbo.PHP_qryChildLastSampleDateByMonth INNER JOIN
                      dbo.PHP_LabResults ON dbo.PHP_qryChildLastSampleDateByMonth.year = dbo.PHP_LabResults.SampleYear AND 
                      dbo.PHP_qryChildLastSampleDateByMonth.month = dbo.PHP_LabResults.SampleMonth AND 
                      dbo.PHP_qryChildLastSampleDateByMonth.CHILD_ID = dbo.PHP_LabResults.CHILD_ID ON 
                      dbo.PHP_qryChildrenAge6orMore.CHILD_ID = dbo.PHP_LabResults.CHILD_ID
WHERE     (dbo.PHP_LabResults.PBB_REST BETWEEN 10 AND 14)
GROUP BY dbo.PHP_LabResults.SampleMonth, dbo.PHP_LabResults.SampleYear
ORDER BY Year

END


