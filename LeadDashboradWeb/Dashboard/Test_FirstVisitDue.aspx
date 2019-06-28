<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Test_FirstVisitDue.aspx.vb" Inherits="Dashboard_Test_FirstVisitDue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:SqlDataSource 
    ID="FirstVisitDueSqlDataSource"      
    ConnectionString="<%$ ConnectionStrings:LeadDashboardConnectionString %>" 
    runat="server"
    SelectCommand="usp_FirstVisitDue"
    SelectCommandType="StoredProcedure">
</asp:SqlDataSource>

    <asp:Chart ID="Chart1" runat="server" DataSourceID="FirstVisitDueSqlDataSource">
        <Series>
            <asp:Series ChartType="Point" Legend="Legend1" Name="Series1" 
                XValueMember="conf_lvl_sort" YValueMembers="FirstVisitDue" ToolTip="#VAL">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
             </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Alignment="Center" Docking="Bottom" Name="Legend1">
                <CellColumns>
                    <asp:LegendCellColumn Name="L2" Text="2: 10 to 19">
                        <Margins Left="15" Right="15" />
                    </asp:LegendCellColumn>
                    <asp:LegendCellColumn Name="L3" Text="3: 20 to 44">
                        <Margins Left="15" Right="15" />
                    </asp:LegendCellColumn>
                    <asp:LegendCellColumn Name="L4" Text="4: 45 to 69">
                        <Margins Left="15" Right="15" />
                    </asp:LegendCellColumn>
                    <asp:LegendCellColumn Name="L5" Text="5: 70 or More">
                        <Margins Left="15" Right="15" />
                    </asp:LegendCellColumn>
                </CellColumns>
            </asp:Legend>
        </Legends>
        <Titles>
            <asp:Title Name="Title1" 
                Text="Lead Level(&#181;g/dL) in Open Cases by Due Date of First Visit">
            </asp:Title>
        </Titles>
    </asp:Chart>




</asp:Content>

