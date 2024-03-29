USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp_Chart_CaseClosed_ByMonth]    Script Date: 06/28/2010 10:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp_Open_Cases_By_Worker]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     COUNT(CHILD_ID) AS Total, WORKERID
FROM         dbo.CASE_RCD
WHERE     (CASE_STAT = 'O')
GROUP BY WORKERID
END
