VERSION 5.00
Begin VB.Form fish 
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000007&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   2325
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3150
   LinkTopic       =   "Form1"
   ScaleHeight     =   2325
   ScaleWidth      =   3150
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox picMainSkin 
      AutoRedraw      =   -1  'True
      Height          =   735
      Left            =   0
      ScaleHeight     =   675
      ScaleWidth      =   1515
      TabIndex        =   0
      Top             =   0
      Width           =   1575
   End
   Begin VB.Image p2 
      Height          =   630
      Left            =   1440
      Picture         =   "fish.frx":0000
      Top             =   840
      Width           =   1410
   End
   Begin VB.Image p1 
      Height          =   630
      Left            =   0
      Picture         =   "fish.frx":2EDA
      Top             =   840
      Width           =   1410
   End
End
Attribute VB_Name = "fish"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'The Fish form which appears just in the Shape
'of the Fish

Private Sub Form_Load()
'Load Fish pic 1 (left to right) & make the form transparent)
picMainSkin.Picture = p1.Picture
chngp
End Sub

'make the form transparent
Function chngp()
Dim WindowRegion As Long
picMainSkin.ScaleMode = vbPixels
picMainSkin.AutoRedraw = True
picMainSkin.AutoSize = True
picMainSkin.BorderStyle = vbBSNone
Me.BorderStyle = vbBSNone
Me.Width = picMainSkin.Width
Me.Height = picMainSkin.Height
WindowRegion = MakeRegion(picMainSkin)
SetWindowRgn Me.hWnd, WindowRegion, True
Call StayOnTop(Me) ' make topmost
End Function

