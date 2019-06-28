'Imports System.Web.UI.DataVisualization.Charting

Partial Class Dashboard
    Inherits System.Web.UI.Page

    'Protected Sub ChartID_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles chartOpenAndClosed.DataBound
    '    For Each point As DataList In chartOpenAndClosed.Series("Series1").Points
    '        point.Url = "http://www.yahoo.com"
    '    Next
    'End Sub
    'Sub chartOpenAndClosed_Click(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ImageMapEventArgs) Handles chartOpenAndClosed.Click
    '    Response.Redirect("~/Default.aspx")

    '    MsgBox("hi")
    'End Sub

    'Sub chartOpenAndClosed_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '   Response.Redirect("~/Default.aspx")

    '    MsgBox("hi")
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        'Me.chartOpenAndClosed.Series(0).PostBackValue = "#AXISLABEL"
        ' Me.chartOpenAndClosed.Series(0).ToolTip = "#AXISLABEL Region: #VAL{C}"
        'Me.chartOpenAndClosed.series("series1").LabelControlBuilder.Label

    End Sub

    Protected Sub chartOpenAndClosed_Click(ByVal sender As Object, ByVal e As ImageMapEventArgs)
        ' Me.DetailSource.SelectParameters("RegionName").DefaultValue = e.PostBackValue
        ' Me.GridView.Caption = [String].Format("{0} Region", e.PostBackValue)
        MsgBox("clicked")
        ' Response.Redirect("~/Default.aspx")
        ' this is not working!!
    End Sub

    'Sub chartOpenAndClosed_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles chartOpenAndClosed.

    '    ' Set a web site link for all series
    '    'chartOpenAndClosed
    '    'Response.Redirect("..\CasesOpen\CasesOpen.aspx")
    '    ' Me..("CasesOpen\CasesOpen.aspx")
    '    chartOpenAndClosed. = "CasesOpen\CasesOpen.aspx"
    '    chartOpenAndClosed.
    '    'MsgBox("Clicked")
    '    'Chart1.Series("Brand2").Url = TextBoxToyota.Text
    '    'Chart1.Series("Brand3").Url = TextBoxMazda.Text
    '    'Chart1.Series("Brand4").Url = TextBoxPontiac.Text


    '    ' Set a web site link for all series legend items
    '    'Chart1.Series("Brand1").LegendUrl = TextBoxFord.Text
    '    'Chart1.Series("Brand2").LegendUrl = TextBoxToyota.Text
    '    'Chart1.Series("Brand3").LegendUrl = TextBoxMazda.Text
    '    'Chart1.Series("Brand4").LegendUrl = TextBoxPontiac.Text

    '    ' Setting attribute to "target='_blank'" will open a link in the new window
    '    'Dim attrib As String = ""
    '    'If CheckBoxNewWindow.Checked Then
    '    '    attrib = "target='_blank'"
    '    'End If

    '    ' Set series and series legend item map area attributes which determine
    '    '   if the web site is opened in existing or new window
    '    'Dim series As Series
    '    'For Each series In Chart1.Series
    '    '    series.MapAreaAttributes = attrib
    '    '    series.LegendMapAreaAttributes = attrib
    '    'Next series

    'End Sub 'UpdateChartButton_Click

    Protected Sub chartAvgCaseWorkLoadByWorker_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles chartAvgCaseWorkLoadByWorker.DataBound
        'determine the average (mean)
        Dim dblAveCaseload As Double = chartAvgCaseWorkLoadByWorker.DataManipulator.Statistics.Mean("Caseload")

        'display stripline
        chartAvgCaseWorkLoadByWorker.ChartAreas("ChartArea1").AxisY.StripLines(0).IntervalOffset = dblAveCaseload
        chartAvgCaseWorkLoadByWorker.ChartAreas("ChartArea1").AxisY.StripLines(0).Text = "Average: " + dblAveCaseload.ToString

    End Sub


End Class
