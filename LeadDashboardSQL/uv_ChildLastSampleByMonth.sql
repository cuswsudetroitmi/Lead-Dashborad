-- uv_ChildLastSampleByMonth.sql
use LeadDashboard
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if exists(select table_name from information_schema.views
  where table_name = 'uv_ChildLastSampleByMonth') 
  drop view uv_ChildLastSampleByMonth
go
create view uv_ChildLastSampleByMonth
AS

with
LastTestDateMDY
as
(
SELECT CHILD_ID, datepart(m, [SAMP_DATE]) AS [month], 
  datepart(yyyy, [SAMP_DATE]) AS [year],
   Max(datepart(dd, [SAMP_DATE])) AS [day]
   FROM LAB
   GROUP BY CHILD_ID, datepart(mm, [SAMP_DATE]), datepart(yyyy, [SAMP_DATE])
),

LastTestDate
as
(
select child_id, convert(datetime,convert(varchar(2),month)+ '/' +
   convert(varchar(2),day) + '/' + convert(varchar(4),year),101) as LastTestDate, 
  [month] as LSDmonth,
   [year] as LSDyear, 
  convert(varchar(4),[year]) 
   + '/' + substring('00',1,2-len([month])) + convert(varchar(2),[month]) as LSDym 
from LastTestDateMDY
)

Select LastTestDate.child_id, LastTestDate, pbb_rest, LSDmonth, LSDyear, LSDym
from LastTestDate inner join Lab
  on LastTestDate.Child_ID = Lab.Child_ID
  and LastTestDate.LastTestDate = Lab.Samp_date

go

select * from uv_ChildLastSampleByMonth
order by 
LSDym