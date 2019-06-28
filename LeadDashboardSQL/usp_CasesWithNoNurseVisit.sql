-- usp_CasesWithNoNurseVisit.sql
-- 

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_CasesWithNoNurseVisit') is not null
    drop proc usp_CasesWithNoNurseVisit
go


CREATE PROCEDURE  usp_CasesWithNoNurseVisit
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
where dateopened > '1/1/2010' and child_id not in(select child_id from CompletedHomeVisits)
)

select *
from  OpenCasesWithNoNurseVisit

END

go

grant exec on usp_CasesWithNoNurseVisit to Webrdr

go

exec usp_CasesWithNoNurseVisit '6/7/2010'

