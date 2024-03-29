-- usp_Chart_CaseClosed_ByMonth.sql
-- modified 7/8/10 rw, remove Top clause - not required in stored procedure
-- ??? How is this closed cases???

USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp_Chart_CaseDuration_ByYears]    Script Date: 06/25/2010 17:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

if object_id('usp_Chart_CaseClosed_ByMonth') is not null
    drop proc usp_Chart_CaseClosed_ByMonth
go


CREATE PROCEDURE [dbo].[usp_Chart_CaseClosed_ByMonth]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT COUNT(CHILD_ID) AS total, DATEPART(month, CONF_DATE) AS month,
   DATEPART(year, CONF_DATE) AS Year
FROM CASE_RCD
GROUP BY DATEPART(month, CONF_DATE), DATEPART(year, CONF_DATE)
HAVING (DATEPART(month, CONF_DATE) IS NOT NULL)
ORDER BY Year

END

go

grant exec on usp_Chart_CaseClosed_ByMonth to Webrdr

go

exec usp_Chart_CaseClosed_ByMonth

