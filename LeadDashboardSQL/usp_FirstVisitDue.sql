-- usp_FirstVisitDue.sql
-- 

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_FirstVisitDue') is not null
    drop proc usp_FirstVisitDue
go


CREATE PROCEDURE  usp_FirstVisitDue
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
select child_id, dateopened, conf_date, datediff(d, conf_date, '6/6/2010') as DaysOpen, conf_lvl, 
  case 
    when conf_lvl between 0 and 9 then 1
    when conf_lvl between 10 and 19 then 2 
    when conf_lvl between 20 and 44 then 3
    when conf_lvl  between 45 and 69 then 4
    when conf_lvl  >69 then 5
  end as conf_lvl_sort,
  case 
    when conf_lvl between 0 and 9 then 21
    when conf_lvl between 10 and 19 then 14 
    when conf_lvl between 20 and 44 then 7
    when conf_lvl  between 45 and 69 then 2
    when conf_lvl  >69 then 1
  end as VisitReqDays,
  case 
    when conf_lvl between 0 and 9 then 'Less than 10'
    when conf_lvl between 10 and 19 then '10 - 19' 
    when conf_lvl between 20 and 44 then '20 - 44'
    when conf_lvl  between 45 and 69 then '45 - 69'
    when conf_lvl  >69 then '70 or more'
  end as conf_lvl_group,
case_stat, workerid
from uv_OpenCases 
where dateopened > '1/1/2010' and child_id not in(select child_id from CompletedHomeVisits)
)

select DateOpened, DateAdd(d, VisitReqDays, dateopened) as FirstVisitDue, conf_lvl_sort
from  OpenCasesWithNoNurseVisit

END

go

grant exec on usp_FirstVisitDue to Webrdr

go

exec usp_FirstVisitDue

