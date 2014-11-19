/*
    作品说明：Windows窗口排列工具
    适用系统：Win XP/7
    作者：逍遥猪葛亮
    E-mail： TroyC.public@gmail.com
    依赖：Tariq Porter的GDI+ 标准函数库 Rajat的SmartGUI
    编辑注释：建议使用Vim编辑并:set foldmethod=marker
    开发日志：
        01.06 使任务栏不在底部亦能正常使用
        01.05 小修改，更改热键为Ctrl+Win+鼠标左键
        01.02 小修改
        12.29 修复一个严重的Bug
        12.24 修复一个Bug
        12.23 代码规范化
        12.18 调整
        12.17 调整
        12.07 继续调试网格绘制，成功。但发现Bug。
        12.06 在Autohotkey Forum寻找解决方案，得知有人已经写好直接调用GDI函数的函数（好别扭……），下载源码研究。（AHK多数开源）并试写网格绘制，失败。
        12.05 继续研究DllCall与GDI，失败。
        12.04 无电脑用，暂停。
        12.03 开始写GDI，失败。
        12.02 意识到API函数可直接被其他语言运用，于是重新查看Autohotkey帮助文档，发现DllCall函数。决定用AHK编写，构建框架、算法。开始写第一步，完成。
        12.01 学习API的编写，知道有GDI。
        11.30 到主校区图书馆找书，无意中见到API一词，于是找到《Windows API开发详解》。
        11.29 首先想到用Autohotkey编写，但是发现没有绘图函数，GUI界面不好编写。后来想到用VC++编写。
        11.27 在机房学习时发现窗口太多，屏幕不够用，不得不反复调整各窗口的大小及位置，表示相当抓狂。萌发窗口整理的想法。  
*/

;{{{初始化
	#Persistent
	#SingleInstance force
	#include gdip.ahk

	onexit ,exitthisahk

	SetBatchLines ,-1
	CoordMode ,Mouse,Screen

	EscPressed := 0
	Suspended := 0
	IniRead, GridX, Settings.ini , Env, GridX ,8
	IniRead, GridY, Settings.ini , Env, GridY ,6
	IniRead tempnoicon , Settings.ini ,Env ,NoIcon ,0
	
	IfEqual ,tempnoicon,1
		Menu,Tray,noicon
	Else
	{ ;{{{Menu
		Menu ,tray ,NoStandard
		Menu ,tray ,Click ,1
		Menu ,tray ,Tip ,Windows 窗口整理小脚本`nBy 张启宁
		Menu ,SettingsMenu ,add ,隐藏图标,FunSettingNoIcon
		Menu ,SettingsMenu ,add ,设置格子,FunSettingGrid
		Menu ,tray ,add ,设置, :SettingsMenu
		Menu ,tray ,add
		Menu ,tray ,add ,关于, FunAbout
		Menu ,tray ,add ,暂停, FunSuspend
		Menu ,tray ,add ,退出 ,exitthisahk
	} ;}}}Menu
	Hotkey ,^#LButton,Startit,On
Return
;}}}初始化

;{{{ MAIN
	Startit:		
		;{{{开始调整
		Hotkey ,^#LButton,,Off
		MouseGetPos, , , WinID, control
		WinGetTitle, WinTitle,ahk_id %WinID%
		WinGet ,WinMaxFlag,MinMax,ahk_id %WinID%
		IfEqual,WinMaxFlag,1
		{
			WinRestore ,ahk_id %WinID%
		}
		WinGetPos ,WinX,WinY,WinWidth,WinHeight,ahk_id %WinID%
		
		Goto Drawer
		;}}}开始调整
	Return

	Drawer:
		WinMinimize ,ahk_id %WinID%
		;{{{绘制格子
		;{{{获取系统信息
		SysGet ,MonitorSize,MonitorWorkArea
		GridWidth := ( MonitorSizeRight - MonitorSizeLeft ) // GridX
		GridHeight := ( MonitorSizeBottom - MonitorSizeTop ) // GridY
		HalfX := GridWidth //2
		HalfY := GridHeight //2
		;}}}获取系统信息
		
		;{{{绘制格子
		pToken := Gdip_Startup()
		Gui ,+AlwaysOnTop +ToolWindow -SysMenu -Theme +LastFound +E0x80000 +ToolWindow +OwnDialogs
		Gui ,Color , Silver
		Gui ,-Caption 
		Gui ,show , NA
    BackgroundWidth := MonitorSizeRight - MonitorSizeLeft
    BackgroundHeight := MonitorSizeBottom - MonitorSizeTop
    ;msgbox ,Width ranges from %MonitorSizeLeft% to %MonitorSizeRight%`nHeight ranges from %MonitorSizeTop% to %MonitorSizeBottom%
		WinMove ,,,%MonitorSizeLeft%,%MonitorSizeTop%,%BackgroundWidth%,%BackgroundHeight%
		DCID := WinExist()

		hbm := CreateDIBSection(BackgroundWidth,BackgroundHeight)
		hdc := CreateCompatibleDC()
		obm := SelectObject(hdc,hbm)
		G := Gdip_GraphicsFromHDC(hdc)
		Gdip_SetSmoothingMode(G, 4)

		;=======DRAW SOLIDS=========
		pBrush := Gdip_BrushCreateSolid(0x380000ff)
		Gdip_FillRectangle(G, pBrush, 0,0,BackgroundWidth,BackgroundHeight)
		Gdip_DeleteBrush(pBrush)

		;=======DRAW GRIDS==========
		pBrush := Gdip_BrushCreateSolid(0xffffffff)

		t := 0
		loop ,%GridX%{
			t += GridWidth
			Gdip_FillRectangle(G, pBrush, t,0,4,BackgroundHeight)
		}

		t := 0
		loop ,%GridY%{
			t += GridHeight
			Gdip_FillRectangle(G,pBrush,0,t,BackgroundWidth,4)
		}

		Gdip_DeleteBrush(pBrush)

		UpdateLayeredWindow(DCID, hdc, MonitorSizeLeft,MonitorSizeTop, BackgroundWidth, BackgroundHeight)

		SelectObject(hdc,obm)
		DeleteObject(hbm)
		DeleteDC(hdc)
		Gdip_DeleteGraphics(G)
		;}}}绘制格子

		;{{{等待鼠标信息
		Hotkey ,Esc,PressESC,On
		Tooltip ,你正在调整的窗口是%WinTitle%

		Keywait ,LButton,D T3
		ifEqual ,Errorlevel,1
		{
			goto RestoreUI
			return
		}
		MouseGetPos ,MouseX1,MouseY1
		;settimer ,ShowMousePosition ,200
		
		IfEqual ,EscPressed,1
		{
			EscPressed := 0
			goto RestoreUI
			Return
		}

		Keywait ,LButton	
		MouseGetPos ,MouseX2,MouseY2
		;}}}等待鼠标信息

		;{{{计算并调整
		ifGreater ,MouseX1,%MouseX2%
		{
			t = %MouseX1%
			MouseX1 = %MouseX2%
			MouseX2 = %t%
		}
		ifGreater ,MouseY1,%MouseY2%
		{
			t = %MouseY1%
			MouseY1 = %MouseY2%
			MouseY2 = %t%
		}
		PosX := ( MouseX1 // GridWidth ) * GridWidth + MonitorSizeLeft
		PosY := ( MouseY1 // GridHeight ) * GridHeight  + MonitorSizeTop
		NewWinWidth := ( ( MouseX2 - MouseX1 ) // GridWidth + 1 ) * GridWidth
		NewWinHeight := ( ( MouseY2 - MouseY1 ) // GridHeight + 1 ) * GridHeight
		WinRestore ,ahk_id %WinID%
		WinMove ,ahk_id %WinID%,,%PosX%,%PosY%,%NewWinWidth%,%NewWinHeight%
		WinHide ,ahk_id %WinID%
		WinShow ,ahk_id %WinID%
		;}}}计算并调整

		;{{{恢复
		Hotkey ,^#LButton,Startit,On
		Goto RestoreUI
		;}}}恢复
		;}}}绘制格子
	Return

	DrawGrid:
		;{{{动态绘制格子
		MouseGetPos ,MouseX,MouseY
		tooltip
		tooltip ,(%MouseX%`,%MouseY%)
		Settimer ,CleanTooltip,-1000
		;}}}动态绘制格子
	Return

	PressESC:
		;{{{中止调整
		Hotkey ,Esc,,Off
		EscPressed := 1
		Goto RestoreUI
		;}}}中止调整
	Return
	
	RestoreUI:
		;{{{恢复
		Gdip_Shutdown(pToken)
		Gui ,destroy
		WinRestore ,ahk_id %WinID%
		Hotkey ,^#LButton,Startit,On
		;Settimer ,ShowMousePosition,off
		Goto CleanTooltip
		;}}}恢复
	Return
;}}}

;{{{ SETTINGS
	Button确定(O):
		;{{{设置——确定按钮
		Gui,Submit ,NoHide
		IniWrite, %X%, Settings.ini , Env, GridX
		Iniwrite, %Y%, Settings.ini , Env, GridY
		GridX := X
		GridY := Y
		Tooltip ,格子设置为：%Y%行x%X%列
		Gui ,Destroy
		Settimer ,CleanTooltip ,-1000
		;}}}设置——确定按钮
	Return

	Button取消(C):
			;{{{设置——取消按钮
			Gui ,Destroy
			Tooltip ,未设置
			Settimer ,CleanTooltip ,-1000
			;}}}设置——取消按钮
	Return

	FunSettingNoIcon:
		;{{{设置——隐藏图标
		MsgBox ,289,警告,托盘图标将会消失，无法打开托盘菜单
		IfMsgBox ,OK
		{
			IniWrite ,1,Settings.ini,Env,NoIcon
			Menu ,tray ,NoIcon
			Msgbox ,64,提示,托盘图标已消失`n如需手动更改设置，请修改脚本目录下的Settings.ini文件`n删除NoIcon=1一行或改为NoIcon=0，将显示托盘图标
		}
		;}}}设置——隐藏图标
	Return

	FunSuspend:
		;{{{设置——暂停
		IfEqual,Suspended,1 
		{
			Hotkey ,^#LButton,Startit,On
			Menu ,tray,Uncheck,暂停
			Suspended=0
		}else{
			Hotkey ,^#LButton,,Off
			Menu ,tray,Check,暂停
			Suspended=1
		}
		;}}}设置——暂停
	Return

	FunSettingGrid:
		;{{{设置——初始化对话框
		old := GridX
		Gui,+AlwaysOnTop -Resize -SysMenu +ToolWindow
		Gui, Add, Button, x12 y110 w90 h20 ,确定(&O)
		GuiControl, +Default, 确定(&O)
		Gui, Add, Edit, x122 y20 w90 h20 r1 vY Limit2 Number ReadOnly,%GridY%
		Gui, Add, UpDown, vXUD Range1-20 Wrap, %GridY%
		Gui, Add, Edit, x122 y70 w90 h10 r1 vX Limit2 Number ReadOnly,%GridX%
		Gui, Add, UpDown, vYUD Range1-18 Wrap, %GridX%
		Gui, Add, Text, x22 y20 w80 h20 , 格子行数
		Gui, Add, Text, x22 y70 w80 h20 , 格子列数
		Gui, Add, Button, x122 y110 w90 h20 , 取消(&C)
		; Generated using SmartGUI Creator 4.0
		Gui, Show, h147 w234 center , 设置格子
		;}}}设置——初始化对话框
	Return
;}}}

;{{{ OTHERS
	FunAbout:
		;{{{关于
		Msgbox ,64,关于,Windows 窗口排列小脚本`n适用于Win7`/XP`n张启宁编写,5
		;}}}关于
	Return

	CleanTooltip:
		;{{{清除Tooltip
		Settimer ,CleanTooltip ,Off
		tooltip
		;}}}清除Tooltip
	Return

	exitthisahk:
		;{{{结束脚本
		exitapp
		;}}}结束脚本
	return

	;{{{Debug
	ShowMousePosition:
		MouseGetPos ,MouseX,MouseY
		tooltip ,%MouseX%x%MouseY%
	Return
	;}}}Debug
;}}}
