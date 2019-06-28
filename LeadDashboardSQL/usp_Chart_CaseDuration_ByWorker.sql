-- usp_Chart_CaseDuration_ByWorker.sql
-- rw modified 7/9/10 remove unnecessary code

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_Chart_CaseDuration_ByWorker') is not null
    drop proc usp_Chart_CaseDuration_ByWorker
go


CREATE PROCEDURE  usp_Chart_CaseDuration_ByWorker
AS
BEGIN
	SET NOCOUNT ON;

select str(WorkerID) as WorkerID, avg(daysopen) as AvgDaysOpen
from uv_ClosedCases
group by workerid


END

go

grant exec on usp_Chart_CaseDuration_ByWorker to Webrdr

go

exec usp_Chart_CaseDuration_ByWorker

