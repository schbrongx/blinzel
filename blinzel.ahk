; written for AHK v1.1.30.03
; by Th. Pesendorfer aka schbrongx
; (C) 2022
#SingleInstance, Force
#Persistent

if (A_IsCompiled == "") {
  Menu, Tray, Icon, %A_ScriptDir%\eyes.ico, 1, 1
}

Menu, Tray, NoStandard
Menu, Tray, Add, Exit, Exit
Menu, Tray, Tip, blinzel by schbrongx

Gui, MyGui:New, +LastFound +AlwaysOnTop +ToolWindow -Caption, Blinzel
Gui, MyGui:Color, 00FF00
WinSet, TransColor, 00FF00

FileInstall, eyes_blinking.gif, %A_Temp%\eyes_blinking.gif, 0
pic := A_Temp . "\eyes_blinking.gif"
html := "<html>`n<body style='background-color:#00FF00;'>`n<center>`n<img src=""" pic """ >`n</center>`n</body>`n</html>"
Gui, MyGui:Add, ActiveX, x0 y0 w498 h217 vWB, shell explorer
wb.Navigate("about:blank")
wb.document.write(html)

SetTimer, BlinzelTimer, 60000
Return
BlinzelTimer:
  Gui, MyGui: Show, x0 y0 AutoSize Center NA
  Sleep 1000
  Gui, MyGui:Hide
Return

Exit() {
  FileDelete, %A_Temp%\eyes_blinking.gif
  ExitApp
}
