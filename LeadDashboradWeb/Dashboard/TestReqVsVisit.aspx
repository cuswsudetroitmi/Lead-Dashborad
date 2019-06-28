<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="TestReqVsVisit.aspx.vb" Inherits="Dashboard_TestReqVsVisit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:SqlDataSource 
    ID="TimeToFirstVisitSqlDataSource"      
    ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
    runat="server"
    SelectCommand="usp_TimeToFirstVisit_Required_vs_Actual"
    SelectCommandType="StoredProcedure"/>



    <asp:Chart 
        ID="Chart1" 
        runat="server" 
        DataSourceID="TimeToFirstVisitSqlDataSource">
        <Series>
            <asp:Series Name="Series1" XValueMember="RecCount" 
                YValueMembers="ReqLessActual">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY Title="Days Above or Below Requirement">
                </AxisY>
                <AxisX Title="Number of Cases">
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
        <Titles>
            <asp:Title Name="Title1" 
                Text="Days to First Nurse Visit vs Protocol Required Time to Visit for All Lead Levels">
            </asp:Title>
        </Titles>
    </asp:Chart>



</asp:Content>

