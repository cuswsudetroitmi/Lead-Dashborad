-- usp_Average_Case_WorkLoad.sql
-- modified 7/8/10 rw, change from alter to create, correct formula
-- change wording: ActiveCases to OpenCases
-- Ave to AveCasesPerWorker

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

if object_id('usp_Average_Case_WorkLoad') is not null
    drop proc usp_Average_Case_WorkLoad
go


CREATE PROCEDURE usp_Average_Case_WorkLoad
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

with
Workers
as
(
select
count(*) as Workers 
from
tbl_Workers 
),

OpenCases
as
(
select
count(*) as OpenCases 
from
CASE_RCD 
where
DATEOPENED > '1/1/2009' and CASE_STAT='O' 
)

select
 convert(decimal(5,1),(cast(OpenCases as float) / cast(Workers as float))) as AveCasesPerWorker
from
Workers cross join OpenCases

END

go

grant exec on [usp_Average_Case_WorkLoad] to webrdr

go

exec usp_Average_Case_WorkLoad