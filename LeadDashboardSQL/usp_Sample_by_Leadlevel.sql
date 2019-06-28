-- usp_Sample_by_Leadlevel.sql
-- 

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_Sample_by_Leadlevel') is not null
    drop proc usp_Sample_by_Leadlevel
go


CREATE PROCEDURE  usp_Sample_by_Leadlevel
AS
BEGIN
	SET NOCOUNT ON;

select '10-14' as Level ,sum(case when pbb_rest >= 10 and pbb_rest <= 14 then 1 else 0 end) as Sample
from lab
where samp_date >= '1/1/2009'
union
select '15-19' as Level ,sum(case when pbb_rest >= 15 and pbb_rest <= 19 then 1 else 0 end) as Sample
from lab
where samp_date >= '1/1/2009'

union
select '20-44' as Level ,sum(case when pbb_rest>=20 and pbb_rest<=44 then 1 else 0 end) as Sample 
from lab
where samp_date >= '1/1/2009'
union 
select '45-69' as Level, sum(case when pbb_rest>=45 and pbb_rest<= 69 then 1 else 0 end) as Sample 
from lab
where samp_date >= '1/1/2009'
union
select '70 or more' as Level, sum(case when pbb_rest>=70 then 1 else 0 end) as Sample 
from lab
where samp_date >= '1/1/2009'

END

go

grant exec on usp_Sample_by_Leadlevel to Webrdr

go

exec usp_Sample_by_Leadlevel

