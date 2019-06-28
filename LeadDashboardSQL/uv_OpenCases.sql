-- uv_OpenCases.sql
use LeadDashboard
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if exists(select table_name from information_schema.views
  where table_name = 'uv_OpenCases') 
  drop view uv_OpenCases
go
create view uv_OpenCases
AS

select CHILD_ID, DATEOPENED, CONF_DATE, CONF_LVL, CASE_STAT,
  WORKERID, CLOSE_CMT
from CASE_RCD
where CASE_STAT = 'O'

go

select * from uv_OpenCases

