-- usp_Chart_FirstVisitCompletedOnTime.sql
-- Visits since Jan 2010

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_Chart_FirstVisitCompletedOnTime') is not null
    drop proc usp_Chart_FirstVisitCompletedOnTime
go


CREATE PROCEDURE  usp_Chart_FirstVisitCompletedOnTime
AS
BEGIN
	SET NOCOUNT ON;


with qryHomeVisit as
(

SELECT ADDR_OR_CHILD_ID, Class, RES_CODE, min(COMP_DATE) AS FirstOfCOMP_DATE
FROM EVENT
WHERE (((EVENTCODE) In ('HVNUR','FHVNU','HVOTH')))
GROUP BY ADDR_OR_CHILD_ID, Class, RES_CODE
HAVING (((Class)='C')) 

),


 qryDaysBeforeFirstVisitsCompleted as
(
SELECT Child_ID,CASE_RCD.DATEOPENED, qryHomeVisit.FirstOfCOMP_DATE, 
  DateDiff("d",[DateOpened],[FirstOfCOMP_DATE]) AS DaysBeforeFirstVisit, 
  qryHomeVisit.RES_CODE, CASE_RCD.CONF_LVL, workerID
FROM qryHomeVisit INNER JOIN CASE_RCD ON qryHomeVisit.ADDR_OR_CHILD_ID = CASE_RCD.CHILD_ID
WHERE (((qryHomeVisit.RES_CODE)='c'))
),


detailByCase as
(
SELECT workerid, CHILD_ID,qryDaysBeforeFirstVisitsCompleted.DaysBeforeFirstVisit, 
  tblRequiredTimeToVisit.intVisitWithinDays, qryDaysBeforeFirstVisitsCompleted.CONF_LVL, 
  qryDaysBeforeFirstVisitsCompleted.FirstOfCOMP_DATE, 
  qryDaysBeforeFirstVisitsCompleted.DATEOPENED,
   DatePart(m,[dateopened]) AS [month], DatePart(yyyy,[dateopened]) AS [year]
FROM qryDaysBeforeFirstVisitsCompleted INNER JOIN tblRequiredTimeToVisit 
  ON qryDaysBeforeFirstVisitsCompleted.CONF_LVL = tblRequiredTimeToVisit.intLeadLevel
WHERE (((qryDaysBeforeFirstVisitsCompleted.DaysBeforeFirstVisit)<=[intVisitWithinDays]) AND 
 ((DatePart(m,[dateopened]))=1) AND ((DatePart(yyyy,[dateopened]))=2010))
 )


select workerid, count(workerid) as total from detailByCase
group by workerid

END

go

grant exec on usp_Chart_FirstVisitCompletedOnTime to Webrdr

go

exec usp_Chart_FirstVisitCompletedOnTime

