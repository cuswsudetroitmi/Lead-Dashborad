-- usp_CaseLoad_ByWorker.sql


USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_CaseLoad_ByWorker') is not null
    drop proc usp_CaseLoad_ByWorker
go


CREATE PROCEDURE  usp_CaseLoad_ByWorker
AS
BEGIN
	SET NOCOUNT ON;

select str(workerid) as workerID,  count(*) as CaseLoad
 from
CASE_RCD 
where
DATEOPENED > '1/1/2009' and CASE_STAT='O' 
group by workerid


END

go

grant exec on usp_CaseLoad_ByWorker to Webrdr

go

exec usp_CaseLoad_ByWorker

