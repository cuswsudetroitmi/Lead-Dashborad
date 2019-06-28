-- usp_Shell.sql
-- 

USE LeadDashboard
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

if object_id('usp_Shell') is not null
    drop proc usp_Shell
go


CREATE PROCEDURE  usp_Shell
AS
BEGIN
	SET NOCOUNT ON;


END

go

grant exec on usp_shell to Webrdr

go

exec usp_Shell

