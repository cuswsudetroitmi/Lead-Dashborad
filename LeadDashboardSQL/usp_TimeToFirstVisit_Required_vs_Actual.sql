-- usp_TimeToFirstVisit_Required_vs_Actual.sql
-- 

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_TimeToFirstVisit_Required_vs_Actual') is not null
    drop proc usp_TimeToFirstVisit_Required_vs_Actual
go


CREATE PROCEDURE  usp_TimeToFirstVisit_Required_vs_Actual
AS
BEGIN
	SET NOCOUNT ON;

with FirstHomeVisit 
as
(
SELECT CHILD_ID, Class, RES_CODE, 
  min(COMP_DATE) AS minCOMP_DATE
FROM uv_NurseEvent
WHERE EVENTCODE In ('HVNUR','FHVNU','HVOTH') and RES_CODE='C'
GROUP BY CHILD_ID, Class, RES_CODE
),

DaysBeforeFirstVisitCompleted 
as
(
SELECT uv_OpenCases.Child_ID, DATEOPENED, minCOMP_DATE, 
  DateDiff(d,[DateOpened],minCOMP_DATE) AS DaysBeforeFirstVisit, 
  RES_CODE, 
  CONF_LVL, 
  case 
    when conf_lvl between 0 and 9 then 'Less than 10'
    when conf_lvl between 10 and 19 then '10 - 19' 
    when conf_lvl between 20 and 44 then '20 - 44'
    when conf_lvl  between 45 and 69 then '45 - 69'
    when conf_lvl  >69 then '70 or more'
  end as conf_lvl_group,
  workerID
FROM FirstHomeVisit INNER JOIN uv_OpenCases 
 ON FirstHomeVisit.CHILD_ID = uv_OpenCases.CHILD_ID
WHERE uv_OpenCases.DATEOPENED>='1/1/2009'
),

VisitandReqTime 
as
(
SELECT workerid, CHILD_ID, DaysBeforeFirstVisit, intVisitWithinDays, 
 -1*(intVisitWithinDays - DaysBeforeFirstVisit) as ReqLessActual,
  CONF_LVL, conf_lvl_group, minCOMP_DATE, 
 DATEOPENED
FROM DaysBeforeFirstVisitCompleted INNER JOIN tblRequiredTimeToVisit 
 ON DaysBeforeFirstVisitCompleted.CONF_LVL = tblRequiredTimeToVisit.intLeadLevel
where DaysBeforeFirstVisit>=0
)

select  ReqLessActual, count(*) as RecCount
from VisitandReqTime
group by  ReqLessActual

END

go

grant exec on usp_TimeToFirstVisit_Required_vs_Actual to Webrdr

go

exec usp_TimeToFirstVisit_Required_vs_Actual

