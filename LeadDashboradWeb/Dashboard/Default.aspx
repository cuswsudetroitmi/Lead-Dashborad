<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Dashboard_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_LeadLevelByMonth" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" 
        Width="297px">
        <Series>
        <asp:Series Name="70 or more" ChartType="StackedColumn" XValueMember="LSDym" 
                YValueMembers="Level_70_or_More" Legend="Legend1"   > </asp:Series>
                <asp:Series Name="45 to 69" ChartType="StackedColumn" XValueMember="LSDym" 
                YValueMembers="Level_45_to_69" Legend="Legend1"  > </asp:Series>
                 <asp:Series Name="20 to 44" ChartType="StackedColumn" XValueMember="LSDym" 
                YValueMembers="Level_20_to_44" IsValueShownAsLabel="true" 
                Legend="Legend1" > </asp:Series>
                  <asp:Series Name="10 to 19" ChartType="StackedColumn" XValueMember="LSDym" 
                YValueMembers="Level_10_to_19" IsValueShownAsLabel="true" 
                Legend="Legend1" > </asp:Series>                                
            
            <asp:Series 
                Name="Less than 10" 
                ChartType="StackedColumn"
                 XValueMember="LSDym" 
                YValueMembers="Level_LT10" 
                IsValueShownAsLabel="true"
                 Legend="Legend1" > 
                <SmartLabelStyle CalloutLineAnchorCapStyle="None" />
            </asp:Series>                                   
                        
                   </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1" >
           
                <AxisX>
                    <MajorGrid Enabled="False" />
                </AxisX>
           
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Alignment="Center" Docking="Bottom" Name="Legend1" Title="Lead Level in &#181;g/dL" >
            </asp:Legend>
        </Legends>
    </asp:Chart>

</asp:Content>

