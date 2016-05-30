#RequireAdmin
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_outfile=installQQmusic.exe
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
;------------------------------------------------------------------------------------------------;脚本开始
Opt("TrayIconDebug", 1) ;0=无信息, 1=调试信息
Opt("WinTextMatchMode", 1) ;1=完全匹配, 2=快速匹配
Opt("WinSearchChildren", 1) ;0=不搜索, 1=搜索子窗口
Opt("WinDetectHiddenText", 1) ;0=不检测, 1=检测
;------------------------------------------------------------------------------------------------;设置脚本参数

;Func wait()
;	Sleep(15)
;EndFunc
;-------------------------------------------------------------------------------------------------;定义等待函数

If FileExists("d:\") Then
	$winqqmusic_1= 'QQ音乐 2011 安装'
	$winqqmusictxt_1='欢迎使用“QQ音乐 2011”安装向导'
	$winqqmusictxt_2='许可证协议'
	$winqqmusictxt_3='选择安装位置'
	$winqqmusictxt_4='附加任务'
	$winqqmusictxt_5='正在完成“QQ音乐 2011”安装向导'
	;------------------------------------------------------------------------------------------------;窗口元素变量
	TrayTip("提示：", "自动安装将在3秒后开始，期间请不要操作鼠标或键盘。", 3,1) 
	Sleep(3000)
	;------------------------------------------------------------------------------------------------;托盘图标提示
	$Exe = 'auit3QQMusic.exe'
	If ProcessExists($Exe) Then ProcessClose($Exe) 
	If Run($Exe) = 0 Then ShellExecute($Exe) 
	Sleep(2000)
		Do
			WinActivate ($winqqmusic_1)
			wait()
				If WinExists($winqqmusic_1,$winqqmusictxt_1) Then
							ControlClick($winqqmusic_1, $winqqmusictxt_1, 1);下一步
				ElseIf WinExists($winqqmusic_1,$winqqmusictxt_2) Then
							ControlClick($winqqmusic_1, $winqqmusictxt_2, 1);---------------------------------------------------------;我接受
				ElseIf WinExists($winqqmusic_1,$winqqmusictxt_3) Then
							SendKeepActive($winqqmusic_1, $winqqmusictxt_3);---------------------------------------------------------;点击按钮控件，下一步
							Send("{END}")
							Send("+{HOME}")
							ClipPut("d:\Program Files\Tencent\QQMusic")
							Send("^v")
							ControlClick($winqqmusic_1, $winqqmusictxt_3, 1)
				ElseIf WinExists($winqqmusic_1, $winqqmusictxt_4) Then
							ControlCommand ($winqqmusic_1, $winqqmusictxt_4,1202,"UnCheck","");----------------------------------------;测试 有可能是button
							ControlCommand ($winqqmusic_1, $winqqmusictxt_4,1203,"UnCheck","")
							ControlCommand ($winqqmusic_1, $winqqmusictxt_4,1206,"UnCheck","")
							ControlClick($winqqmusic_1, $winqqmusictxt_4, 1);-------------------------------------------------------------;安装
				ElseIf WinExists($winqqmusic_1,"正在安装") Then
				ElseIf WinExists($winqqmusic_1, $winqqmusictxt_5) Then
							ControlCommand ($winqqmusic_1, $winqqmusictxt_5,1203,"UnCheck","");----------------------------------------;测试 有可能是button
							ControlCommand ($winqqmusic_1, $winqqmusictxt_5,1204,"UnCheck","")
							ControlCommand ($winqqmusic_1, $winqqmusictxt_5,1205,"UnCheck","")
							ControlCommand ($winqqmusic_1, $winqqmusictxt_5,1206,"UnCheck","")
							ControlClick($winqqmusic_1, $winqqmusictxt_5, 1);---------------------------------------------------------;点击完成
				Else
						Sleep(1000)
				EndIf
						
		Until Not ProcessExists($Exe)
Else
	MsgBox(4096, "提示 ","D盘符不存在,请运行分区工具进行系统分区,再重新运行本程序。")
	Exit
	
EndIf