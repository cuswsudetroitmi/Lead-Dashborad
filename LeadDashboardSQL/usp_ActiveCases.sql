-- usp_ActiveCases.sql
-- how should active cases by defined?
-- below code is partial only
-- see uv_ActiveCases.sql

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_ActiveCases') is not null
    drop proc usp_ActiveCases
go


CREATE PROCEDURE  usp_ActiveCases
AS
BEGIN
	SET NOCOUNT ON;

with
DateOfLastNurseEventByChild_OpenCases
as
(
SELECT ADDR_OR_CHILD_ID as CHILD_ID, Class, 
  convert(varchar(12),Max(COMP_DATE),101) AS MaxOfCOMP_DATE, 
  WORKERID, CASE_STAT,
    DatePart(yyyy,[COMP_DATE]) AS [Year], DatePart(m,[comp_date]) AS [month]
FROM CASE_RCD INNER JOIN EVENT ON CASE_RCD.CHILD_ID = EVENT.ADDR_OR_CHILD_ID
GROUP BY ADDR_OR_CHILD_ID, Class, WORKERID, CASE_STAT, 
  DatePart(yyyy,[COMP_DATE]), DatePart(m,[comp_date])
HAVING (((Class)='C') AND ((CASE_RCD.CASE_STAT)='O'))
--ORDER BY EVENT.ADDR_OR_CHILD_ID
)

select * from DateOfLastNurseEventByChild_OpenCases

END

go

grant exec on usp_ActiveCases to Webrdr

go

exec usp_ActiveCases

