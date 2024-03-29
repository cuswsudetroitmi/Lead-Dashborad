USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp.Chart_Lead_45to69_Last3Months_ByWorker]    Script Date: 06/28/2010 10:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp.Chart_Lead_70orMore_Last3Months_ByWorker]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     TOP (2147483647) WITH TIES(CASE WHEN [CountofChild_ID] IS NULL THEN 0 ELSE [CountofChild_ID] END) AS Total, dbo.[qry_AllWorker_Last3Months _***].Month, 
                      dbo.[qry_AllWorker_Last3Months _***].Year, dbo.[qry_AllWorker_Last3Months _***].workerID
FROM         dbo.[qry_AllWorker_Last3Months _***] LEFT OUTER JOIN
                      dbo.z_PHP_Chart_Lead_70orMore_ByWorker ON dbo.[qry_AllWorker_Last3Months _***].workerID = dbo.z_PHP_Chart_Lead_70orMore_ByWorker.WORKERID AND 
                      dbo.[qry_AllWorker_Last3Months _***].Month = dbo.z_PHP_Chart_Lead_70orMore_ByWorker.Month AND 
                      dbo.[qry_AllWorker_Last3Months _***].Year = dbo.z_PHP_Chart_Lead_70orMore_ByWorker.Year
ORDER BY dbo.[qry_AllWorker_Last3Months _***].workerID
END


