<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="CasesOpen.aspx.vb" Inherits="CasesOpen_CasesOpen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Chart ID="Chart1" runat="server" 
        DataSourceID="CasesOpenByYearsqlDataSource" Width="750px">
    <Series>
        <asp:Series Name="Series1" XValueMember="Year" YValueMembers="total">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </ChartAreas>
        <Titles>
            <asp:Title Font="Microsoft Sans Serif, 12pt" Name="Title1" 
                Text="Total Open Cases By Year">
            </asp:Title>
        </Titles>
</asp:Chart>
    <asp:SqlDataSource ID="CasesOpenByYearsqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_Chart_CaseOpened_ByYear" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
</asp:Content>

