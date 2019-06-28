-- uv_ChildLastSampleDateByMonth.sql
use LeadDashboard
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if exists(select table_name from information_schema.views
  where table_name = 'uv_ChildLastSampleDateByMonth') 
  drop view uv_ChildLastSampleDateByMonth
go
create view uv_ChildLastSampleDateByMonth
AS

with
LastTestDate
as
(
SELECT CHILD_ID, datepart(m, [SAMP_DATE]) AS [month], 
  datepart(yyyy, [SAMP_DATE]) AS [year],
   Max(datepart(dd, [SAMP_DATE])) AS [day]
   FROM LAB
   GROUP BY CHILD_ID, datepart(mm, [SAMP_DATE]), datepart(yyyy, [SAMP_DATE])
)

select child_id, convert(datetime,convert(varchar(2),month)+ '/' +
   convert(varchar(2),day) + '/' + convert(varchar(4),year),101)
as dt
from LastTestDate

go

select * from uv_ChildLastSampleDateByMonth
order by child_Id