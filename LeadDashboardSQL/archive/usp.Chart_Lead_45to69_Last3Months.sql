USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp.Chart_Lead_45to69]    Script Date: 06/28/2010 10:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp.Chart_Lead_45to69_Last3Months]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     (CASE WHEN [TotalCount] IS NULL THEN 0 ELSE [totalCount] END) AS Total, dbo.tbl_Last_3_MONTHS.Month, dbo.tbl_Last_3_MONTHS.Year
FROM         dbo.tbl_Last_3_MONTHS LEFT OUTER JOIN
                      dbo.z_PHP_Chart_Lead_45to69 ON dbo.tbl_Last_3_MONTHS.Month = dbo.z_PHP_Chart_Lead_45to69.SampleMonth AND 
                      dbo.tbl_Last_3_MONTHS.Year = dbo.z_PHP_Chart_Lead_45to69.SampleYear


END


