-- uv_Shell.sql
use LeadDashboard
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if exists(select table_name from information_schema.views
  where table_name = 'uv_Shell') 
  drop view uv_Shell
go
create view uv_Shell
AS



go

select * from uv_Shell