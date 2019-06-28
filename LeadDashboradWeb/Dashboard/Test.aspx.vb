Imports System.Web.UI.DataVisualization.Charting
Imports System.Drawing

Partial Class Dashboard_Test
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub


    Protected Sub chartAvgCaseWorkLoadByWorker_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles chartLeadlevelbyMonth.DataBound
        'determine the average (mean)
        'Dim dblAveCaseload As Double = chartLeadlevelbyMonth.DataManipulator.Statistics.Mean("Caseload")

        ''display stripline
        'chartLeadlevelbyMonth.ChartAreas("ChartArea1").AxisY.StripLines(0).IntervalOffset = dblAveCaseload
        'chartLeadlevelbyMonth.ChartAreas("ChartArea1").AxisY.StripLines(0).Text = "Average: " + dblAveCaseload.ToString

    End Sub
End Class
