-- uv_ActiveCases.sql
-- how should active cases by defined?
-- below code is experimental only
use LeadDashboard
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if exists(select table_name from information_schema.views
  where table_name = 'uv_ActiveCases') 
  drop view uv_ActiveCases
go
create view uv_ActiveCases
AS

with
ChildEvents
as
(
select ADDR_OR_CHILD_ID as CHILD_ID, max(COMP_DATE) as comp_date--, EVENTCODE, EVENT_CMT, 
from dbo.EVENT
where Class='C' and EVENTCODE in('A1','A4','A5','A6','A7','C10','ADMIN','C20','CCMGT','D10','DISL')
group by ADDR_OR_CHILD_ID
)


select CASE_RCD.CHILD_ID, DATEOPENED, 
 comp_date as DateLastActivity
from dbo.CASE_RCD left outer join ChildEvents
on CASE_RCD.CHILD_ID = ChildEvents.child_id
where CASE_STAT = 'O' and comp_date is not null

go

select child_id, convert(varchar(12),DATEOPENED,101) as DATEOPENED,
 convert(varchar(12),DateLastActivity, 101) as DateOfLastActivity
from uv_ActiveCases
order by DateLastActivity asc

