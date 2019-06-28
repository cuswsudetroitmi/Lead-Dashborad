--qryList_usp_uv.sql

use LeadDashboard
go

SELECT type, name, convert(varchar(12),create_date,101) as create_date, 
  convert(varchar(12),modify_date,101) as modify_date
FROM sys.objects
WHERE --type = 'P' and 
  convert(varchar(12),create_date,101)='06/30/2010'


SELECT type, name, convert(varchar(12),create_date,101) as create_date, 
  convert(varchar(12),modify_date,101) as modify_date
FROM sys.objects
WHERE type = 'P' 
  and convert(varchar(12),create_date,101)<>'06/30/2010'

