/*
AUTHOR: Sjc1000
PAGE: http://www.autohotkey.com/board/topic/88114-functioneznotify/

USAGE:
    EzNotify(Title,Message,Background Colour,Text Colour,Time to display the message in milliseconds)

EXAMPLE:
    EzNotify("Test","This is just a simple test","Blue","White","4000") 
    EzNotify("Test","This is just a simple test`nTake 2","Black","Red","4000")
    EzNotify("Test","This is just a simple test`nTake 3","Red","White","4000") 
*/

EzNotify(Title,Message,BackColor,TextColor,Timeout=2000)
{
	Gui, EZ: Color, %BackColor%
	Gui, EZ: Font, s12 c%TextCOlor% Bold
	global GTitle , Text
	Gui, EZ: Add, Text, vGTitle, %Title%
	Gui, EZ: Font, s10
	Gui, EZ: Add, Text, vText, %Message%
	GuiControlGet, Pos, EZ: Pos,Text
	GuiControlGet, GPos, EZ: Pos,GTitle
	If GPosW > %PosW%
		PosW := GPosW
	Gui, EZ: Add, Text, % "h4 0x10 w" PosW " y" ( PosY - 10 ) " x" PosX ,
	Gui, EZ: Show,% "x" ( A_ScreenWidth - PosW - 35 ) " y" ( A_ScreenHeight - PosH + 30 ) " NoActivate", EzNotify
	Gui,EZ: -Caption +AlwaysOnTop +HwndEZHWND
	WinSet, Region, % "0-0 0-0 R10-10 w" ( PosW + 30 ) " h" ( PosH + 30 * 2 ), ahk_id %EZHWND%
	WinGetPos, X, Y, W, H, ahk_id %EZHWND%
	k=1
	While, Y >  A_ScreenHeight - H + 10
	{
		Gui,EZ: Show, y%Y% NoActivate
		Y -= k
		k *= 2
		Sleep, 15
	}
	k=1
	Sleep, % TImeOut 
	While Y <  A_ScreenHeight + PosH 
	{
		Gui, EZ: Show, y%Y% NoActivate
		Y += k
		k *= 10
		Sleep ,15
	}
	Gui,EZ: Destroy
}
return

