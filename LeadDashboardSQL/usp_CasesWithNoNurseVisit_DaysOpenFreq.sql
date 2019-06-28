-- usp_CasesWithNoNurseVisit_DaysOpenFreq.sql
-- 

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_CasesWithNoNurseVisit_DaysOpenFreq') is not null
    drop proc usp_CasesWithNoNurseVisit_DaysOpenFreq
go


CREATE PROCEDURE  usp_CasesWithNoNurseVisit_DaysOpenFreq
@DataDate datetime
AS
BEGIN
	SET NOCOUNT ON;

with CompletedHomeVisits
as
(
SELECT CHILD_ID
FROM uv_NurseEvent
WHERE EVENTCODE In ('HVNUR','FHVNU','HVOTH') and RES_CODE='C'
GROUP BY CHILD_ID
),

OpenCasesWithNoNurseVisit
as
(
select child_id, dateopened, conf_date, datediff(d, conf_date, @DataDate) as DaysOpen, conf_lvl, 
  case 
    when conf_lvl between 0 and 9 then '1'
    when conf_lvl between 10 and 19 then '2' 
    when conf_lvl between 20 and 44 then '3'
    when conf_lvl  between 45 and 69 then '4'
    when conf_lvl  >69 then '5'
  end as conf_lvl_sort,
  case 
    when conf_lvl between 0 and 9 then 'Less than 10'
    when conf_lvl between 10 and 19 then '10 - 19' 
    when conf_lvl between 20 and 44 then '20 - 44'
    when conf_lvl  between 45 and 69 then '45 - 69'
    when conf_lvl  >69 then '70 or more'
  end as conf_lvl_group,
case_stat, workerid
from uv_OpenCases 
where dateopened > '1/1/2010' and --datediff(d, conf_date, @DataDate) >=0 and
   child_id not in(select child_id from CompletedHomeVisits)
),

DaysOpenCategories
as
(
select 
  case 
    when DaysOpen <=7 then 'Less than 7'
    when DaysOpen between 8 and 14 then '8 to 14'
    when DaysOpen between 15 and 21 then '15 to 21'
    when DaysOpen between 22 and 30 then '21 to 30'
    when DaysOpen between 31 and 60 then '31 to 60'
    when DaysOpen between 61 and 90 then '61 to 90'
    when DaysOpen > 90 then '90+ days' 
  end as DaysOpenCat,
  case 
    when DaysOpen <=7 then 1
    when DaysOpen between 8 and 14 then 2
    when DaysOpen between 15 and 21 then 3
    when DaysOpen between 22 and 30 then 4
    when DaysOpen between 31 and 60 then 5
    when DaysOpen between 61 and 90 then 6
    when DaysOpen > 90 then 7 
  end as DaysOpenIndex
from  OpenCasesWithNoNurseVisit
)

select DaysOpenCat, count(*) as DaysOpenCount, DaysOpenIndex
from DaysOpenCategories
group by DaysOpenCat, DaysOpenIndex
order by DaysOpenIndex

END

go

grant exec on usp_CasesWithNoNurseVisit_DaysOpenFreq to Webrdr

go

exec usp_CasesWithNoNurseVisit_DaysOpenFreq '6/1/2010'

