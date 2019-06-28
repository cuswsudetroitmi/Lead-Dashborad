-- uv_ActiveCaseCount.sql
-- select count of active cases from case_rcd table
use LeadDashboard
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if exists(select table_name from information_schema.views
  where table_name = 'uv_ActiveCaseCount') 
  drop view uv_ActiveCaseCount
go
create view uv_ActiveCaseCount
AS

select count(*) as ActiveCaseCount
from dbo.CASE_RCD
where CASE_STAT='O'

go

select * from uv_ActiveCaseCount

