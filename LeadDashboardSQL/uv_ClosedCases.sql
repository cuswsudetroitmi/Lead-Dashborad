-- uv_ClosedCases.sql
-- create list of closed cases
use LeadDashboard
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if exists(select table_name from information_schema.views
  where table_name = 'uv_ClosedCases') 
  drop view uv_ClosedCases
go
create view uv_ClosedCases
AS

with
ChildEvents
as
(
select ADDR_OR_CHILD_ID as CHILD_ID, max(COMP_DATE) as comp_date--, EVENTCODE, EVENT_CMT
from dbo.EVENT
where Class='C' and EVENTCODE in('A1','A4','A5','A6','A7','C10','ADMIN','C20','CCMGT','D10','DISL')
group by ADDR_OR_CHILD_ID
)

select CASE_RCD.CHILD_ID, convert(varchar(12),dateopened, 101) as dateopened, 
  convert(varchar(12),conf_date,101) as conf_date, convert(varchar(12),comp_date,101) as comp_date,
CASE_STAT, close_cmt, datediff(dd, dateopened,comp_date) as daysopen, workerid
from dbo.CASE_RCD left outer join ChildEvents
on CASE_RCD.CHILD_ID = ChildEvents.child_id
where (CASE_STAT = 'Z' or CASE_STAT = 'C' or close_cmt is not null)
--and dateopened > '1/1/2009'


go

select * from uv_ClosedCases
--where comp_date is null

