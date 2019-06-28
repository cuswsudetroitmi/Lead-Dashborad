-- ufn_Last3Months.sql
-- return table with last 3 months

use LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects 
  where id = object_id(N'[dbo].ufn_Last3Months')
    and xtype in (N'FN', N'IF', N'TF'))
drop function dbo.ufn_Last3Months

GO


CREATE FUNCTION	dbo.ufn_Last3Months(@SomeDate datetime)
RETURNS @DT TABLE
(FullDate varchar(12),
 Month varchar(2),
 Year char(4))
AS

BEGIN


declare @mnthfirst as datetime
set @mnthfirst= DATEADD(mm, DATEDIFF(mm,0,@SomeDate), 0)

insert into @DT

select convert(varchar(12),dateadd(m,-2,@mnthfirst),101) as FullDate,
  DatePart(m,dateadd(m,-2,@mnthfirst)) as Month,
  DatePart(yyyy,dateadd(m,-2,@mnthfirst)) as Year


union

select convert(varchar(12),dateadd(m,-1,@mnthfirst),101) as FullDate,
  DatePart(m,dateadd(m,-1,@mnthfirst)) as Month,
  DatePart(yyyy,dateadd(m,-1,@mnthfirst)) as Year

union

select convert(varchar(12),@mnthfirst,101) as Fulldate, 
 DatePart(m,@mnthfirst) as Month, DatePart(yyyy,@mnthfirst) as Year


RETURN

END

go

select * from dbo.ufn_Last3Months('5/20/2010')