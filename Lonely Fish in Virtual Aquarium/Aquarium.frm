VERSION 5.00
Object = "{22D6F304-B0F6-11D0-94AB-0080C74C7E95}#1.0#0"; "MSDXM.OCX"
Begin VB.Form Aquarium 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   9000
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   11325
   ControlBox      =   0   'False
   Icon            =   "AQUARIUM.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "AQUARIUM.frx":000C
   ScaleHeight     =   9000
   ScaleWidth      =   11325
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   3240
      Top             =   120
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   2880
      Top             =   120
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Please Turn your speakers on!"
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   3600
      TabIndex        =   1
      Top             =   1680
      Visible         =   0   'False
      Width           =   2535
   End
   Begin MediaPlayerCtl.MediaPlayer wm 
      Height          =   495
      Left            =   2160
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   3255
      AudioStream     =   -1
      AutoSize        =   0   'False
      AutoStart       =   -1  'True
      AnimationAtStart=   -1  'True
      AllowScan       =   -1  'True
      AllowChangeDisplaySize=   -1  'True
      AutoRewind      =   0   'False
      Balance         =   90
      BaseURL         =   ""
      BufferingTime   =   5
      CaptioningID    =   ""
      ClickToPlay     =   -1  'True
      CursorType      =   0
      CurrentPosition =   -1
      CurrentMarker   =   0
      DefaultFrame    =   ""
      DisplayBackColor=   0
      DisplayForeColor=   16777215
      DisplayMode     =   0
      DisplaySize     =   4
      Enabled         =   -1  'True
      EnableContextMenu=   -1  'True
      EnablePositionControls=   -1  'True
      EnableFullScreenControls=   0   'False
      EnableTracker   =   -1  'True
      Filename        =   ""
      InvokeURLs      =   -1  'True
      Language        =   -1
      Mute            =   0   'False
      PlayCount       =   1
      PreviewMode     =   0   'False
      Rate            =   1
      SAMILang        =   ""
      SAMIStyle       =   ""
      SAMIFileName    =   ""
      SelectionStart  =   -1
      SelectionEnd    =   -1
      SendOpenStateChangeEvents=   -1  'True
      SendWarningEvents=   -1  'True
      SendErrorEvents =   -1  'True
      SendKeyboardEvents=   0   'False
      SendMouseClickEvents=   0   'False
      SendMouseMoveEvents=   0   'False
      SendPlayStateChangeEvents=   -1  'True
      ShowCaptioning  =   0   'False
      ShowControls    =   -1  'True
      ShowAudioControls=   -1  'True
      ShowDisplay     =   0   'False
      ShowGotoBar     =   0   'False
      ShowPositionControls=   -1  'True
      ShowStatusBar   =   0   'False
      ShowTracker     =   -1  'True
      TransparentAtStart=   0   'False
      VideoBorderWidth=   0
      VideoBorderColor=   0
      VideoBorder3D   =   0   'False
      Volume          =   0
      WindowlessVideo =   0   'False
   End
End
Attribute VB_Name = "Aquarium"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Lonely Fish by Kailash Nadh , 15 yrs , India
'kailashbn@satyam.net.in   , http://kbn.rom.cd
'If you like this, please , please Vot for me!

'You can make whatever changes in this & do whatever
'you want! Rent, sell or do anything!!

Private Sub Form_Click()
End
End Sub

Private Sub Form_Load()
fish.Show
'Load the Windows Media Player & assign bubble sound to it
Me.wm.FileName = App.Path & "\snd.wav"
wm.PlayCount = 50
End Sub

Private Sub Timer1_Timer()
'Make the fish move from left to right, & if reached on the
'right end of the screen, disable this timer and enable timer2

fish.Move fish.Left + Me.ScaleWidth / 500, fish.Top + Me.ScaleHeight / 1000
If fish.Top < 0 Then fish.Left = -100: fish.Top = 6000
If fish.Left > 11500 Then
Timer1.Enabled = False
Timer2.Enabled = True
fish.picMainSkin.Picture = fish.p2.Picture
fish.Top = 1600
Call fish.chngp
End If
End Sub

Private Sub Timer2_Timer()
'Make the fish move from right to left, & if reached on the
'left end of the screen, disable this timer and enable timer1
If fish.Top < 0 Then fish.Left = -100: fish.Top = 4580
fish.Move fish.Left - Me.ScaleWidth / 500, fish.Top - Me.ScaleHeight / 1000
If fish.Left < 0 Then
Timer1.Enabled = True
Timer2.Enabled = False
fish.picMainSkin.Picture = fish.p1.Picture
Call fish.chngp
End If
End Sub
