Attribute VB_Name = "Module1"
'This module is to make the fish form transparent in the shape
'of the fish
Option Explicit
Public Declare Function GetPixel Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long) As Long
Public Declare Function SetWindowRgn Lib "user32" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Public Declare Function CreateRectRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Public Declare Function CombineRgn Lib "gdi32" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function ReleaseCapture Lib "user32" () As Long
Public Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Public Const RGN_OR = 2
Public Const WM_NCLBUTTONDOWN = &HA1
Public Const HTCAPTION = 2

Public Function MakeRegion(picSkin As PictureBox) As Long
Dim X As Long, Y As Long, StartLineX As Long
Dim FullRegion As Long, LineRegion As Long
Dim TransparentColor As Long
Dim InFirstRegion As Boolean
Dim InLine As Boolean
Dim hDC As Long
Dim PicWidth As Long
Dim PicHeight As Long
hDC = picSkin.hDC
PicWidth = picSkin.ScaleWidth
PicHeight = picSkin.ScaleHeight
InFirstRegion = True: InLine = False
X = Y = StartLineX = 0
TransparentColor = GetPixel(hDC, 0, 0)
For Y = 0 To PicHeight - 1
For X = 0 To PicWidth - 1
If GetPixel(hDC, X, Y) = TransparentColor Or X = PicWidth Then
If InLine Then
InLine = False
LineRegion = CreateRectRgn(StartLineX, Y, X, Y + 1)
If InFirstRegion Then
FullRegion = LineRegion
InFirstRegion = False
Else
CombineRgn FullRegion, FullRegion, LineRegion, RGN_OR
DeleteObject LineRegion
End If
End If
Else
If Not InLine Then
InLine = True
StartLineX = X
End If
End If
Next
Next
MakeRegion = FullRegion
End Function

