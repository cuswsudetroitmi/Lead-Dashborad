-- usp_MonthByLeadLevel.sql
-- 

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_MonthByLeadLevel') is not null
    drop proc usp_MonthByLeadLevel
go


CREATE PROCEDURE  usp_MonthByLeadLevel
AS
BEGIN
	SET NOCOUNT ON;
select LSDym, 
sum(Level_LT10) as Level_LT10, 
sum(Level_10_to_19) as Level_10_to_19,
sum(Level_20_to_44) as Level_20_to_44,
sum(Level_45_to_69) as Level_45_to_69,
sum(Level_70_or_more) as Level_70_or_more

from
(
select LSDym, count(*) as Level_LT10, 
'' as Level_10_to_19,
'' as Level_20_to_44,
'' as Level_45_to_69,
'' as Level_70_or_more
from uv_ChildLastSampleByMonth
where pbb_rest < 10
and  LastTestDate>'12/31/2009'
group by LSDym

union 

select LSDym, '' as Level_LT10, 
count(*) as Level_10_to_19,
'' as Level_20_to_44,
'' as Level_45_to_69,
'' as Level_70_or_more
from uv_ChildLastSampleByMonth
where pbb_rest between 10 and 19
and  LastTestDate>'12/31/2009'
group by LSDym

union 

select LSDym, '' as Level_LT10, 
'' as Level_10_to_19,
count(*) as Level_20_to_44,
'' as Level_45_to_69,
'' as Level_70_or_more
from uv_ChildLastSampleByMonth
where pbb_rest between 20 and 44
and  LastTestDate>'12/31/2009'
group by LSDym

union 

select LSDym, '' as Level_LT10, 
'' as Level_10_to_19,
'' as Level_20_to_44,
count(*) as Level_45_to_69,
'' as Level_70_or_more
from uv_ChildLastSampleByMonth
where pbb_rest between 45 and 69
and  LastTestDate>'12/31/2009'
group by LSDym

union 

select LSDym, '' as Level_LT10, 
'' as Level_10_to_19,
'' as Level_20_to_44,
'' as Level_45_to_69,
count(*) as Level_70_or_more
from uv_ChildLastSampleByMonth
where pbb_rest >= 70
and  LastTestDate>'12/31/2009'
group by LSDym
) as u

group by LSDym



END

go

grant exec on usp_MonthByLeadLevel to Webrdr

go

exec usp_MonthByLeadLevel

