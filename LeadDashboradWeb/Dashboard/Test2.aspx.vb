Imports System.Web.UI.DataVisualization.Charting
Imports System.Drawing

Partial Class Dashboard_Test
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub


    'Protected Sub chartAvgCaseWorkLoadByWorker_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles chartAvgCaseWorkLoadByWorker.DataBound
    '    'determine the average (mean)
    '    Dim dblAveCaseload As Double = chartAvgCaseWorkLoadByWorker.DataManipulator.Statistics.Mean("Caseload")

    '    'display stripline
    '    chartAvgCaseWorkLoadByWorker.ChartAreas("ChartArea1").AxisY.StripLines(0).IntervalOffset = dblAveCaseload
    '    chartAvgCaseWorkLoadByWorker.ChartAreas("ChartArea1").AxisY.StripLines(0).Text = "Average: " + dblAveCaseload.ToString

    'End Sub

    Protected Sub Chart1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chart1.Load

    End Sub
End Class
