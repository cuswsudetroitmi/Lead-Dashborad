USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp_Chart_CaseClosed_ByMonth]    Script Date: 06/25/2010 17:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp_LabResults]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     dbo.LAB.CHILD_ID, dbo.LAB.SAMP_DATE, dbo.LAB.PBB_REST, dbo.LAB.SAMP_TYPE, DATEPART(month, dbo.LAB.SAMP_DATE) AS SampleMonth, DATEPART(year, 
                      dbo.LAB.SAMP_DATE) AS SampleYear, dbo.CASE_RCD.CASE_STAT, dbo.CASE_RCD.WORKERID
FROM         dbo.CASE_RCD INNER JOIN
                      dbo.LAB ON dbo.CASE_RCD.CHILD_ID = dbo.LAB.CHILD_ID
WHERE     (dbo.CASE_RCD.CASE_STAT = 'O')

END
