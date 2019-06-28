<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Test_NoNurseVisit.aspx.vb" Inherits="Dashboard_Test_NoNurseVisit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:SqlDataSource 
    ID="casesWithNoNurseVisitSqlDataSource"      
    ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
    runat="server"
    SelectCommand="usp_CasesWithNoNurseVisit_DaysOpenFreq"
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="DataDate" Type="DateTime" DefaultValue="6/7/2010" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:Chart ID="Chart1" runat="server" 
    DataSourceID="casesWithNoNurseVisitSqlDataSource">
    <Series>
        <asp:Series Name="Series1" XValueMember="DaysOpenCat" 
            YValueMembers="DaysOpenCount">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1">
            
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>


</asp:Content>

