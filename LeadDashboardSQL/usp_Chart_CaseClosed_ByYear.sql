-- usp_Chart_CaseClosed_ByYear.sql
-- modified 7/9/10 rw, remove extraneous code, pull data from view uv_ClosedCases, give columns meanful names

USE [LeadDashboard]
GO
/****** Object:  StoredProcedure [dbo].[usp_Chart_CaseClosed_ByMonth]    Script Date: 06/25/2010 17:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

if object_id('usp_Chart_CaseClosed_ByYear') is not null
    drop proc usp_Chart_CaseClosed_ByYear
go


CREATE PROCEDURE [dbo].[usp_Chart_CaseClosed_ByYear]
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT COUNT(*) AS ClosedCases, DATEPART(year, CONF_DATE) AS Year
FROM uv_ClosedCases
GROUP BY DATEPART(year, CONF_DATE)
ORDER BY Year

END

go

grant exec on usp_Chart_CaseClosed_ByYear to Webrdr

go

exec usp_Chart_CaseClosed_ByYear
