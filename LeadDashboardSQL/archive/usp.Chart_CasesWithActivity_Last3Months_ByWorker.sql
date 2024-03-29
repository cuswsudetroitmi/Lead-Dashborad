USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp.Chart_Lead10to14_Age6orMore_byMonth]    Script Date: 06/25/2010 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[usp.Chart_CasesWithActivity_Last3Months_ByWorker]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     COUNT(dbo.qryDateOfLastNurseEventByChild_OpenCases.ADDR_OR_CHILD_ID) AS CountOfADDR_OR_CHILD_ID, 
                      dbo.qryDateOfLastNurseEventByChild_OpenCases.WORKERID
FROM         dbo.tbl_Last_3_MONTHS INNER JOIN
                      dbo.qryDateOfLastNurseEventByChild_OpenCases ON dbo.tbl_Last_3_MONTHS.Year = dbo.qryDateOfLastNurseEventByChild_OpenCases.Year AND 
                      dbo.tbl_Last_3_MONTHS.Month = dbo.qryDateOfLastNurseEventByChild_OpenCases.month
GROUP BY dbo.qryDateOfLastNurseEventByChild_OpenCases.WORKERID
END


