USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp.Chart_Lead_45to69]    Script Date: 06/28/2010 10:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp.Chart_Lead_45to69_GroupBy]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     TOP (2147483647) WITH TIES COUNT(dbo.PHP_LabResults.CHILD_ID) AS TotalCases, dbo.PHP_LabResults.SampleMonth AS Month, 
                      dbo.PHP_LabResults.SampleYear AS Year
FROM         dbo.PHP_qryChildLastSampleDateByMonth INNER JOIN
                      dbo.PHP_LabResults ON dbo.PHP_qryChildLastSampleDateByMonth.year = dbo.PHP_LabResults.SampleYear AND 
                      dbo.PHP_qryChildLastSampleDateByMonth.month = dbo.PHP_LabResults.SampleMonth AND 
                      dbo.PHP_qryChildLastSampleDateByMonth.CHILD_ID = dbo.PHP_LabResults.CHILD_ID
WHERE     (dbo.PHP_LabResults.PBB_REST BETWEEN 45 AND 69)
GROUP BY dbo.PHP_LabResults.SampleMonth, dbo.PHP_LabResults.SampleYear
ORDER BY Year


END


