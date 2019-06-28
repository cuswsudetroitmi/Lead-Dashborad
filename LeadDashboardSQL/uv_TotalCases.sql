-- uv_TotalCases.sql
use LeadDashboard
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if exists(select table_name from information_schema.views
  where table_name = 'uv_TotalCases') 
  drop view uv_TotalCases
go
create view uv_TotalCases
AS

select count(*) as TotalLeadCases
from CASE_RCD

go

use LeadDashboard
go
select * from uv_TotalCases