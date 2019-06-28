-- usp_OpenAndClosedCases_Count.sql
--

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_OpenAndClosedCases_Count') is not null
    drop proc usp_OpenAndClosedCases_Count
go


CREATE PROCEDURE  usp_OpenAndClosedCases_Count
AS
BEGIN
	SET NOCOUNT ON;


select 'Open Cases' as Label ,count(*) as TotalCount from uv_OpenCases
where DATEOPENED>='1/1/2009'

union 

select  'Closed Cases' as Label, count(*) as TotalCount from uv_ClosedCases
where DATEOPENED>='1/1/2009'

END

go

grant exec on usp_OpenAndClosedCases_Count to webrdr

go

exec usp_OpenAndClosedCases_Count

