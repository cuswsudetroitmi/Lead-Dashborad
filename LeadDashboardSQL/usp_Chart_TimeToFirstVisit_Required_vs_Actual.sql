-- usp_Chart_TimeToFirstVisit_Required_vs_Actual.sql
-- 

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_Chart_TimeToFirstVisit_Required_vs_Actual') is not null
    drop proc usp_Chart_TimeToFirstVisit_Required_vs_Actual
go


CREATE PROCEDURE  usp_Chart_TimeToFirstVisit_Required_vs_Actual
AS
BEGIN
	SET NOCOUNT ON;
with qryHomeVisit as
(

SELECT EVENT.ADDR_OR_CHILD_ID as CHILD_ID, EVENT.Class, EVENT.RES_CODE, 
  min(EVENT.COMP_DATE) AS minCOMP_DATE
FROM EVENT
WHERE (((EVENT.EVENTCODE) In ('HVNUR','FHVNU','HVOTH')))
GROUP BY EVENT.ADDR_OR_CHILD_ID, EVENT.Class, EVENT.RES_CODE
HAVING (((EVENT.Class)='C')) ),


 qryDaysBeforeFirstVisitsCompleted as
(
SELECT Child_ID,CASE_RCD.DATEOPENED, qryHomeVisit.FirstOfCOMP_DATE, 
  DateDiff(d,[DateOpened],minCOMP_DATE) AS DaysBeforeFirstVisit, 
  qryHomeVisit.RES_CODE, CASE_RCD.CONF_LVL, workerID
FROM qryHomeVisit INNER JOIN CASE_RCD ON qryHomeVisit.CHILD_ID = CASE_RCD.CHILD_ID
WHERE (((qryHomeVisit.RES_CODE)='C') and CASE_RCD.DATEOPENED>='1/1/2009')
),


detailByCase as
(SELECT workerid, CHILD_ID, DaysBeforeFirstVisit,
   intVisitWithinDays, intLeadLevel,
  CONF_LVL, minCOMP_DATE, 
 DATEOPENED
FROM qryDaysBeforeFirstVisitsCompleted INNER JOIN tblRequiredTimeToVisit 
 ON qryDaysBeforeFirstVisitsCompleted.CONF_LVL = tblRequiredTimeToVisit.intLeadLevel
where DaysBeforeFirstVisit>=0
),

reqvsActual as
(
select min(intVisitWithinDays) as ReqTime,
  avg(DaysBeforeFirstVisit) as AvgActualTime, 
  min(intLeadLevel) as min1,  
  max(intleadLevel) as LeadLevel
from detailByCase
group by intVisitWithinDays
--order by reqtime desc
),

LeadLevels as
(
select min(intVisitWithinDays) as daysTovisit,
right(str(min(intLeadlevel)),2) + '-' + right(str(max(intLeadlevel)),2) as LeadRange
  from tblRequiredTimeToVisit
group by intVisitWithinDays
--order by daysToVisit desc
)

select reqTime, avgActualTime, LeadRange from 
reqvsActual join LeadLevels
on reqTime=daysToVisit
order by reqTime desc


END

go

grant exec on usp_Chart_TimeToFirstVisit_Required_vs_Actual to Webrdr

go

exec usp_Chart_TimeToFirstVisit_Required_vs_Actual

