<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
       All data presented is for Jan 1, 2009 and forward
    </p>
    <b>LEAD DASHBOARD<br />

    </b>

    <br />
    <asp:SqlDataSource ID="TopTenBLLCasesSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_TopTen_BLL" SelectCommandType="StoredProcedure"/>

    <asp:SqlDataSource ID="openAndClosedSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_OpenAndClosedCases_Count" SelectCommandType="StoredProcedure"/>

<%--    <asp:SqlDataSource ID="AvgCaseWorkLoadSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_Average_Case_WorkLoad" SelectCommandType="StoredProcedure"/>--%>

    <asp:SqlDataSource ID="CaseLoadByWorkerSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_CaseLoad_ByWorker" SelectCommandType="StoredProcedure"/>

    <asp:SqlDataSource ID="Sample_by_LeadlevelSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_Sample_By_LeadLevel" SelectCommandType="StoredProcedure"/>

    <asp:SqlDataSource ID="CaseDurationByWorkerSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_Chart_CaseDuration_ByWorker" SelectCommandType="StoredProcedure"/>

        <asp:SqlDataSource ID="FirstVisitCompletedOnTimeSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_Chart_FirstVisitCompletedOnTime" SelectCommandType="StoredProcedure"/>

        <asp:SqlDataSource ID="TimeToFirstVisitRequiredvsActualSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_Chart_TimeToFirstVisit_Required_vs_Actual" SelectCommandType="StoredProcedure"/>

        <asp:SqlDataSource ID="LeadLevelByMonthSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
        SelectCommand="usp_LeadLevelByMonth" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>


    <asp:Chart ID="chartDaysBeforeFirstVisitActualVsRequired" runat="server" 
        DataSourceID="TimeToFirstVisitRequiredvsActualSqlDataSource" 
        Height="250px" Width="250px" BorderlineColor="Gainsboro" 
        BorderlineDashStyle="Solid" Palette="None">
        <Series>
            <asp:Series Name="Actual" XValueMember="LeadRange" 
                YValueMembers="avgActualTime">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" Name="Required" XValueMember="LeadRange" 
                YValueMembers="reqTime">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY IsLabelAutoFit="False">
                    <LabelStyle Font="Microsoft Sans Serif, 7pt" />
                    <MajorGrid LineColor="LightGray" />      
                </AxisY>
                <AxisX IsLabelAutoFit="False" TextOrientation="Horizontal" 
                    Title=" - Lead Levels -" TitleFont="Microsoft Sans Serif, 7pt" 
                    TitleForeColor="DimGray">
                    <MajorGrid LineColor="LightGray" />      
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Docking="Bottom" LegendStyle="Row" Name="Legend1" 
                Alignment="Center">
            </asp:Legend>
        </Legends>
        <Titles>
            <asp:Title Name="Title1" Text="Days Before First Visit Completed">
            </asp:Title>
        </Titles>
        <BorderSkin BackColor="Transparent" />
    </asp:Chart>

    <asp:Chart ID="chartOpenAndClosed" runat="server" DataSourceID="openAndClosedSqlDataSource" 
        SuppressExceptions="True" Height="250px" Palette="None" 
    PaletteCustomColors="192, 192, 255; Gainsboro"
    Width="250px" AlternateText="Total Open and Closed Cases" 
        BorderlineColor="Gainsboro" BorderlineDashStyle="Solid" >
        <Series>
            <asp:Series Name="Series1" ChartType="Pie" IsValueShownAsLabel="True" 
                XValueMember="Label" YValueMembers="TotalCount" 
                CustomProperties="PieLineColor=ActiveBorder, PieDrawingStyle=SoftEdge, CollectedThresholdUsePercent=False" 
                Legend="Legend1" ChartArea="ChartArea1" Font="Microsoft Sans Serif, 9pt" 
                LabelToolTip="#VALX : #PERCENT{P0}" Url="~/CasesOpen/CasesOpen.aspx" >
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Alignment="Center" DockedToChartArea="ChartArea1" Docking="Bottom" 
                IsDockedInsideChartArea="False" Name="Legend1">
            </asp:Legend>
        </Legends>
        <Titles>
            <asp:Title Name="Title1" Text="Total Open and Closed Cases">
            </asp:Title>
        </Titles>
      
    </asp:Chart>

 <asp:Chart ID="chartAvgCaseWorkLoadByWorker" 
    runat="server" 
    DataSourceID="CaseLoadByWorkerSqlDataSource" 
    AlternateText=" Caseload By Worker"
    Height="250px" 
    Width="250px" BorderlineColor="Gainsboro" BorderlineDashStyle="Solid">
        <Series>
            <asp:Series Name="Caseload" 
                YValueMembers="CaseLoad" 
                YValuesPerPoint="6" 
                YValueType="Int32" 
                XValueType="String" 
                XValueMember="workerID"  >
            </asp:Series>
            
           </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX IntervalAutoMode="FixedCount" IsLabelAutoFit="false" Title="Worker ID" 
                    TitleFont="Microsoft Sans Serif, 7pt">
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

    <asp:Chart ID="chartLeadResultsByRange" runat="server" 
        DataSourceID="Sample_by_LeadlevelSqlDataSource" Height="250px" 
        Width="250px" BorderlineColor="Gainsboro" BorderlineDashStyle="Solid">
        <Series>
            <asp:Series Name="Series1" XValueMember="Level" YValueMembers="Sample" 
                Font="Microsoft Sans Serif, 7pt">
                <SmartLabelStyle Enabled="False" />
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
<%--                <AxisX Title="- Lead Levels -" TitleFont="Microsoft Sans Serif, 7pt" IsLabelAutoFit="false">
                    <ScaleBreakStyle Enabled="True" MaxNumberOfBreaks="1" />
                </AxisX>--%>

                      <AxisX IntervalAutoMode="FixedCount" IsLabelAutoFit="false" Title="- Lead Levels - " 
                    TitleFont="Microsoft Sans Serif, 7pt">
                    <LabelStyle IsStaggered="false" />
                    <MajorGrid LineColor="LightGray" />
                </AxisX>
                <AxisY><MajorGrid LineColor="LightGray" />      </AxisY>
            </asp:ChartArea>
        </ChartAreas>
        <Titles>
            <asp:Title Name="Title1" Text="Lab Results">
            </asp:Title>
        </Titles>
</asp:Chart>

    <asp:Chart ID="chartAvgDaysToCloseCaseByWorker" runat="server" 
        DataSourceID="CaseDurationByWorkerSqlDataSource" Height="250px" 
        Width="250px" BorderlineColor="Gainsboro" BorderlineDashStyle="Solid">
        <Series>
            <asp:Series Name="AvgDaysOpen" XValueMember="WorkerID" YValueMembers="AvgDaysOpen">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX IsLabelAutoFit="False" Title="Worker ID" 
                    TitleFont="Microsoft Sans Serif, 7pt">
                    <MajorGrid LineColor="LightGray" />      
                </AxisX>
                <AxisY><MajorGrid LineColor="LightGray" />      </AxisY>
            </asp:ChartArea>
        </ChartAreas>
        <Titles>
            <asp:Title Name="Title1" Text="Case Duration">
            </asp:Title>
            <asp:Title Font="Microsoft Sans Serif, 7pt" Name="subTitle" 
                Text="Days Between Case Open to Case Close">
            </asp:Title>
        </Titles>
    </asp:Chart>

    <asp:Chart ID="chartFirstVisitCompletedOnTime" runat="server" 
        DataSourceID="FirstVisitCompletedOnTimeSqlDataSource" Height="250px" 
        Width="250px" BorderlineColor="Gainsboro" BorderlineDashStyle="Solid">
        <Series>
            <asp:Series Name="TotalCompletedOnTime" XValueMember="workerID" YValueMembers="total">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY MaximumAutoSize="50">
                </AxisY>
                <AxisX IsLabelAutoFit="False" Title="Worker ID" 
                    TitleFont="Microsoft Sans Serif, 7pt">
                    <MajorGrid LineColor="LightGray" />      
                </AxisX>
                <AxisY><MajorGrid LineColor="LightGray" />      </AxisY>
            </asp:ChartArea>
        </ChartAreas>
        <Titles>
            <asp:Title Name="Title1" 
                Text="First Visit Completed on Time">
            </asp:Title>
        </Titles>
    </asp:Chart>


    <asp:Chart ID="chartTopTenBLL" runat="server" 
    DataSourceID="TopTenBLLCasesSqlDataSource" Height="250px" Width="250px" 
        AlternateText="Top 10 BLL Cases" BorderlineColor="Gainsboro" 
        BorderlineDashStyle="Solid">
        <Series>
            <asp:Series ChartType="Bar" Name="Series1" XValueMember="SAMP_DATE" 
                YValueMembers="PBB_REST">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY Title="- Lead Levels -" TitleFont="Microsoft Sans Serif, 7pt">
                    <MajorTickMark Enabled="False" />
                    <MajorGrid LineColor="LightGray" />      
                </AxisY>
                <AxisX IsLabelAutoFit="False">
                    <MajorGrid Interval="Auto" IntervalOffset="Auto" IntervalOffsetType="Auto" 
                        IntervalType="Auto" LineColor="Gainsboro" />
                    <MajorTickMark Enabled="False" />
                    <LabelStyle Font="Microsoft Sans Serif, 7pt" Interval="1" IntervalOffset="Auto" 
                        IntervalOffsetType="Auto" IntervalType="Auto" />
                        <MajorGrid LineColor="LightGray" />      
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
        <Titles>
            <asp:Title Name="Title1" Text="Top 10 Lead Cases">
            </asp:Title>
        </Titles>
</asp:Chart>
<br />
<br />


< <asp:Chart ID="Chart1" runat="server" DataSourceID="LeadLevelByMonthSqlDataSource">
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
                    <%--<MajorGrid Enabled="False" />--%>
                    <MajorGrid Interval="Auto" IntervalOffset="Auto" IntervalOffsetType="Auto" 
                        IntervalType="Auto" LineColor="Gainsboro" />
                </AxisX>
           
            </asp:ChartArea>
            
        </ChartAreas>
        <Titles>
            <asp:Title Name="Title1" Text="Lead Level By Month">
            </asp:Title>
        </Titles>
        <Legends>
            <asp:Legend Alignment="Center" Docking="Bottom" Name="Legend1" Title="Lead Level in &#181;g/dL" >
            </asp:Legend>
        </Legends>
    </asp:Chart>



    <br />
    <br />
    
</asp:Content>

