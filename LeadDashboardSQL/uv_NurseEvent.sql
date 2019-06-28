-- uv_NurseEvent.sql
use LeadDashboard
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if exists(select table_name from information_schema.views
  where table_name = 'uv_NurseEvent') 
  drop view uv_NurseEvent
go
create view uv_NurseEvent
AS

select ADDR_OR_CHILD_ID as CHILD_ID, Class, COMP_DATE, 
EVENTCODE, EVENT_CMT, RES_CODE
from EVENT
where Class='C'

go

select * from uv_NurseEvent