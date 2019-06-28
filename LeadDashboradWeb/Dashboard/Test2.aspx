<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Test2.aspx.vb" Inherits="Dashboard_Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:SqlDataSource ID="AvgCaseWorkLoadByWorkerSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_LeadLevelByMonth" SelectCommandType="StoredProcedure"/>

    <asp:Chart ID="Chart1" runat="server"  Height="400" Width="800"
        DataSourceID="AvgCaseWorkLoadByWorkerSqlDataSource" >
        <Series>
            

            <asp:Series ChartArea="ChartArea1" Name="Less Than 10" XValueMember="LSDym" 
                YValueMembers="Level_LT10" Legend="Legend1" IsValueShownAsLabel="True" 
               >
            </asp:Series>
           <asp:Series ChartArea="ChartArea1" Name="10 to 19" XValueMember="LSDym" 
                YValueMembers="Level_10_to_19" Legend="Legend1" IsValueShownAsLabel="True"
                >
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" Name="Level_20_to_44" XValueMember="LSDym" 
                YValueMembers="Level_20_to_44" Legend="Legend1" IsValueShownAsLabel="True"
                 >
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" Name="Level_45_to_69" XValueMember="LSDym" 
                YValueMembers="Level_45_to_69" Legend="Legend1" 
                IsValueShownAsLabel="True" >
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" Name="Level_70_or_more" XValueMember="LSDym" 
                YValueMembers="Level_70_or_more" Legend="Legend1" IsValueShownAsLabel="True"
                  >
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1" >
                   <AxisY>
                  
          
                       <MajorGrid Enabled="False" />
                       <MajorTickMark Enabled="False" />
                  
          
                       <%--<ScaleBreakStyle Enabled="True" Spacing="2" StartFromZero="Auto" 
                           MaxNumberOfBreaks="1" />--%>
                   </AxisY>
                   <AxisX IsLabelAutoFit="False">
                       <MajorTickMark Enabled="False" />
                    <LabelStyle Angle="-60" Interval="1" IntervalOffset="Auto" 
                           IntervalOffsetType="Auto" IntervalType="Auto" />
                    <MajorGrid LineColor="LightGray" Enabled="False" />
                  
                      
                  
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Name="Legend1" Alignment="Center" Docking="Bottom">
            </asp:Legend>
        </Legends>
    </asp:Chart>

</asp:Content>

