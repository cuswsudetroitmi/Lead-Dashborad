--qrySampDate.sql


USE [LeadDashboard]
GO



--select * from CUS_07_01

select convert(varchar(12),samp_date,101) as LabSampleDate, count(*) as SampDateCount
from CUS_07_01
group by samp_date
order by samp_date