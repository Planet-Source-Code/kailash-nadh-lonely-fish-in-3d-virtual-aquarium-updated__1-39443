Attribute VB_Name = "Module2"
'This module is to make the Fish Form on the topmost.
'Or else, the aquarium form will hide the fish

#If Win32 Then
Public Const HWND_TOPMOST& = -1
#Else
Public Const HWND_TOPMOST& = -1
#End If 'WIN32

#If Win32 Then
 Const SWP_NOMOVE& = &H2
 Const SWP_NOSIZE& = &H1
#Else
 Const SWP_NOMOVE& = &H2
 Const SWP_NOSIZE& = &H1
#End If 'WIN32

#If Win32 Then
 Declare Function SetWindowPos& Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
#Else
 Declare Sub SetWindowPos Lib "user" (ByVal hWnd As Integer, ByVal hWndInsertAfter As Integer, ByVal X As Integer, ByVal Y As Integer, ByVal cx As Integer, ByVal cy As Integer, ByVal wFlags As Integer)
#End If 'WIN32

Function StayOnTop(Form As Form)
Dim lFlags As Long
Dim lStay As Long

lFlags = SWP_NOSIZE Or SWP_NOMOVE
lStay = SetWindowPos(Form.hWnd, HWND_TOPMOST, 0, 0, 0, 0, lFlags)
End Function


