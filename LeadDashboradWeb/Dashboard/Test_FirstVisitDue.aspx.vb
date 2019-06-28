Imports System.Web.UI.DataVisualization.Charting

Partial Class Dashboard_Test_FirstVisitDue
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim curDateStripLine As New StripLine

        ''curDateStripLine.Interval = 15
        'curDateStripLine.IntervalOffsetType = DateTimeIntervalType.Months
        'curDateStripLine.IntervalOffset = 5

        'curDateStripLine.BackColor = Drawing.Color.Orange
        'curDateStripLine.StripWidth = 1

        'Chart1.ChartAreas(0).AxisY.StripLines.Add(curDateStripLine)



    End Sub

    Protected Sub Chart1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chart1.DataBound


        Dim curDateStripLine As New StripLine

        curDateStripLine.Interval = 0

        curDateStripLine.BackColor = Drawing.Color.Orange

        'curDateStripLine.StripWidthType = DateTimeIntervalType.Days
        curDateStripLine.StripWidth = 3

        Dim MinDataPoint As DataPoint = Chart1.Series(0).Points.FindMinByValue
        Dim MinDate As Date = Date.FromOADate(MinDataPoint.YValues.GetValue(0))

        Dim curDate As Date = Date.Now

        Dim dtSomeDate As Date = #1/30/2010#

        curDateStripLine.IntervalOffsetType = DateTimeIntervalType.Days
        curDateStripLine.IntervalOffset = dtSomeDate.ToOADate


        Chart1.ChartAreas(0).AxisY.StripLines.Add(curDateStripLine)

    End Sub
End Class
