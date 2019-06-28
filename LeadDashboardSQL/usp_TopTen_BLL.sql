-- usp_TopTen_BLL.sql
-- 

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_TopTen_BLL') is not null
    drop proc usp_TopTen_BLL
go


CREATE PROCEDURE  usp_TopTen_BLL
AS
BEGIN
	SET NOCOUNT ON;

With
ChildLastSampleDate
as
(
SELECT CHILD_ID, Max(Samp_date) AS MaxOfSamp_date
FROM LAB
GROUP BY CHILD_ID
),

LabResults
as
(
SELECT LAB.CHILD_ID, SAMP_DATE, PBB_REST, SAMP_TYPE, 
  DatePart("m",[samp_date]) AS SampleMonth, DatePart("yyyy",[samp_date]) AS SampleYear, 
  CASE_RCD.CASE_STAT, CASE_RCD.WORKERID
FROM CASE_RCD INNER JOIN LAB ON CASE_RCD.CHILD_ID = LAB.CHILD_ID
WHERE CASE_STAT='O'
),


Top10PBB 
as 
(
SELECT TOP 10 PBB_REST, convert(varchar(12),SAMP_DATE,101) as SAMP_DATE
FROM ChildLastSampleDate INNER JOIN LabResults
 ON (ChildLastSampleDate.CHILD_ID=LabResults.CHILD_ID) AND (ChildLastSampleDate.MaxOfSamp_date=LabResults.SAMP_DATE)
ORDER BY   PBB_REST desc
)

select * from Top10PBB 
order by SAMP_DATE


END

go

grant exec on usp_TopTen_BLL to Webrdr

go

exec usp_TopTen_BLL

