<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Test.aspx.vb" Inherits="Dashboard_Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:SqlDataSource ID="LeadLevelByMonthSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_LeadLevelByMonth" SelectCommandType="StoredProcedure"/>

<asp:Chart ID="chartLeadlevelbyMonth" 
    runat="server" 
    DataSourceID="LeadLevelByMonthSqlDataSource" 
    AlternateText="Lead level By Month"
    Height="250px" 
    Width="331px">
        <Series>
            <asp:Series Name="Caseload" 
                YValueMembers="Cases" 
                YValuesPerPoint="6" 
                YValueType="Int32" 
                XValueType="String" 
                XValueMember="LSDym" ChartType="StackedColumn"  >
            </asp:Series>
            
           </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX IntervalAutoMode="FixedCount" IsLabelAutoFit="false">
                    <LabelStyle IsStaggered="false" />
                    <MajorGrid LineColor="LightGray" />
                </AxisX>
                <AxisY>    
                    <MajorGrid LineColor="LightGray" />                
                    <StripLines>
                        <asp:StripLine TextAlignment="Far" TextLineAlignment="Far" BorderDashStyle="Solid" BorderColor="Orange" BorderWidth="4" BackColor="Orange" />
                    </StripLines>
                </AxisY>
            </asp:ChartArea>
        </ChartAreas>
        <Titles>
            <asp:Title Name="Title1" Text="Caseload by Worker">
            </asp:Title>
        </Titles>
</asp:Chart>

</asp:Content>

