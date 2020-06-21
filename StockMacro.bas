Attribute VB_Name = "Module1"
Sub StockVolume()

Dim Current As Worksheet

For Each Current In Worksheets

Dim ws As Worksheet
Dim Ticker As String
Dim Volume As LongLong
Dim Total_Stock_Volume As LongLong
Dim Percent_Change As Double
Dim Yearly_Change As Double
Dim Summary_Table_Row As Integer
Dim Year_Open As Double
Dim Year_Close As Double

On Error Resume Next


Summary_Table_Row = 2
Total_Stock_Volume = 0
Percent_Change = 0
Yearly_Change = 0
Year_Open = 0
Year_Close = 0

Dim WorkSheetName As Integer
WorkSheetName = ws.Name


ws = Worksheet
For Each ws In Worksheets

LastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row

ws.Cells(1, 9).Value = "Ticker"
ws.Cells(1, 10).Value = "Yearly Change"
ws.Cells(1, 11).Value = "Percent Change"
ws.Cells(1, 12).Value = "Total Stock Volume"

    For i = 2 To LastRow
        If ws.Cells(i + 1, 1) <> ws.Cells(i, 1).Value Then
            Ticker = ws.Cells(i, 1).Value
        
            Total_Stock_Volume = Total_Stock_Volume + ws.Cells(i, 7).Value
        
            Year_Open = ws.Cells(i, 3).Value
            Year_Close = ws.Cells(i, 6).Value
        
            Percent_Change = (Year_Close - Year_Open) / Year_Close
            Yearly_Change = Year_Close - Year_Open
        
        
            Summary_Table_Row = Summary_Table_Row + 1
        
            'Total_Stock_Volume = 0
            Volume = 0
            'Year_Open = 0
            'Year_Close = 0
    
            Range("I" & Summary_Table_Row).Value = Ticker
        
            Range("L" & Summary_Table_Row).Value = Total_Stock_Volume
        
            Range("J" & Summary_Table_Row).Value = Yearly_Change
        
            Range("K" & Summary_Table_Row).Value = Percent_Change
        

            Else
                Total_Stock_Volume = Total_Stock_Volume + ws.Cells(i, 7).Value
    
    
        End If
    If (Yearly_Change) > 0 Then
        ws.Range("J" & Summary_Table_Row).Interior.ColorIndex = 4
    
    ElseIf (Yearly_Change) < 0 Then
        ws.Range("J" & Summary_Table_Row).Interior.ColorIndex = 3
        
    End If
    
    Next i
Columns("K").NumberFormat = "0.00%"

    



    Next ws
Next

End Sub
