-- qryRenormalize.sql
-- Splits STELLAR data received from DHWP as one table into original STELLAR tables.
-- Before running, change file name where indicated below (--==>)
-- with the file to be re-normalized 
-- deletes records presently in the STELLAR tables prior to adding the new data

use LeadDashboard
go

truncate table tblDeNormalized
go

insert into tblDeNormalized
--===> set file name below to the file to be re-normalized
select * from CUS_07_01

truncate table ADDR
go

INSERT INTO ADDR (ADDR_ID, ADDR_CITY, ADDR_ZIP, ASSEMADDR)
SELECT ADDR_ID, ADDR_CITY, ADDR_ZIP, ASSEMADDR
FROM tblDeNormalized
GROUP BY ADDR_ID, ADDR_CITY, ADDR_ZIP, ASSEMADDR
go

truncate CA_LINK
go

INSERT INTO CA_LINK ( CHILD_ID, ADDR_ID )
SELECT CHILD_ID, ADDR_ID
FROM tblDeNormalized
GROUP BY CHILD_ID, ADDR_ID
go

truncate CASE_RCD
go

INSERT INTO CASE_RCD ( CHILD_ID, DATEOPENED, CLOSE_CMT, CONF_DATE, CONF_LVL, CASE_STAT, WORKERID )
SELECT CHILD_ID, DATEOPENED, CLOSE_CMT, CONF_DATE, CONF_LVL, CASE_STAT, WORKERID
FROM tblDeNormalized
GROUP BY CHILD_ID, DATEOPENED, CLOSE_CMT, CONF_DATE, CONF_LVL, CASE_STAT, WORKERID
go

truncate CHILD
go

INSERT INTO CHILD ( CHILD_ID, NAME_LAST, NAME_FIRST, DOB_CHILD, SEX, PHONE )
SELECT CHILD_ID, NAME_LAST, NAME_FIRST, DOB_CHILD, SEX, PHONE
FROM tblDeNormalized
GROUP BY CHILD_ID, NAME_LAST, NAME_FIRST, DOB_CHILD, SEX, PHONE
go

truncate Event
go

INSERT INTO EVENT ( EVENTCODE, EVENT_CMT, ADDR_OR_CHILD_ID, COMP_DATE, Class, RES_CODE )
SELECT EVENT_CODE, EVENT_CMT, CHILD_ID, COMP_DATE, "C" AS CLass, RES_CODE_A AS Expr1
FROM tblDeNormalized
GROUP BY EVENT_CODE, EVENT_CMT, CHILD_ID, COMP_DATE, "C", RES_CODE_A
go

INSERT INTO EVENT ( EVENTCODE, EVENT_CMT, COMP_DATE, ADDR_OR_CHILD_ID, Class, RES_CODE )
SELECT ECODE_ADDR, ECMT_ADDR, CDATE_ADDR, ADDR_ID, "I" AS CLass, ECODE_ADDR
FROM tblDeNormalized
GROUP BY ECODE_ADDR, ECMT_ADDR, CDATE_ADDR, ADDR_ID, "I", ECODE_ADDR 
go

truncate Invest
go

INSERT INTO Invest ( ADDR_ID, INSPEC_ID, INS_REF_DT, INSP_COMP, ADDR_CL_DT, ADDR_CL_RSN )
SELECT INSPEC_ID, INS_REF_DT, INSP_COMP, ADDR_CL_DT, ADR_CL_RSN
FROM tblDeNormalized
GROUP BY INSPEC_ID, INS_REF_DT, INSP_COMP, ADDR_CL_DT, ADR_CL_RSN
go

truncate lab
go

INSERT INTO LAB ( CHILD_ID, SAMP_DATE, PBB_REST, SAMP_TYPE )
SELECT CHILD_ID, SAMP_DATE, PBB_REST, SAMP_TYPE
FROM tblDeNormalized
GROUP BY CHILD_ID, SAMP_DATE, PBB_REST, SAMP_TYPE
--HAVING (((SAMP_DATE)>='1/1/2009'))
go









