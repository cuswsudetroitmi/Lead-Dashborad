-- usp_Average_Case_WorkLoad_ByWorker.sql
-- is this Average???
-- change name to usp_CaseLoad_ByWorker

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_Average_Case_WorkLoad_ByWorker') is not null
    drop proc usp_Average_Case_WorkLoad_ByWorker
go


CREATE PROCEDURE  usp_Average_Case_WorkLoad_ByWorker
AS
BEGIN
	SET NOCOUNT ON;

select workerid,  count(*) as CaseLoad
 from
CASE_RCD 
where
DATEOPENED > '1/1/2009' and CASE_STAT='O' 
group by workerid


END

go

grant exec on usp_Average_Case_WorkLoad_ByWorker to Webrdr

go

exec usp_Average_Case_WorkLoad_ByWorker

