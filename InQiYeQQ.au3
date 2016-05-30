#RequireAdmin


;------------------------------------------------------------------------------------------------;脚本开始
Opt("TrayIconDebug", 1) ;0=无信息, 1=调试信息
Opt("WinTextMatchMode", 1) ;1=完全匹配, 2=快速匹配
;---------------------------------------------------------------------------------------------------
$freespace = DriveSpaceFree("D:\")
If $freespace < 3072  Then;----------------------------------------------------------------------;若D盘空间 不足 3G，则提示退出去 重新分区。
	MsgBox(4096, "提示 ", "D盘空间不足,请运行分区工具进行系统分区,再重新运行本程序。")
	Exit
EndIf				


	$installprogram = @ScriptDir & "\" & "HRTX1.90.2235.exe"
	If Not FileExists($installprogram) Then
		MsgBox(16, "提示:", "请确认是否存在:" & $installprogram)
		Exit
	Else

		BlockInput(1);------------------------------------------------------;锁定键盘

		;------------------------------------------------------------------------------------------------;窗口元素变量
		TrayTip("提示：", "企业QQ自动安装即将开始。", 3, 1)
		Sleep(3000)
		;------------------------------------------------------------------------------------------------;托盘图标提示
		$winqq_1 = '企业QQ 安装向导'
		$winqqtxt_1 = '自定义安装'
		$winqqtxt_2 = '下一步(&N)'
		$winqqtxt_3 = '请选择安装路径'
		$winqqtxt_4 = "安装完成"
		$Exe = "HRTX1.90.2235.exe"

		If ProcessExists($Exe) Then ProcessClose($Exe)
		If Run($Exe) = 0 Then ShellExecute($Exe)
		Sleep(2000)


		Do
			WinActivate($winqq_1)

			If WinExists($winqq_1, $winqqtxt_1) Then
				Sleep(1000)
				ControlClick($winqq_1, $winqqtxt_1, 2101);自定义安装
			ElseIf WinExists($winqq_1, $winqqtxt_2) Then
				Sleep(1000)
				ControlClick($winqq_1, $winqqtxt_2, 1015);下一步
			ElseIf WinExists($winqq_1, $winqqtxt_3) Then
				Sleep(1000)
				ControlClick($winqq_1, $winqqtxt_3, 1016);安装
			ElseIf WinExists($winqq_1, $winqqtxt_4) Then
				Sleep(1000)
				ControlCommand($winqq_1, $winqqtxt_4, 1045, "UnCheck", "");----------------------------------------;取消运行  测试 有可能是button
				Sleep(1000)
				ControlCommand($winqq_1, $winqqtxt_4, 1046, "UnCheck", "")
				Sleep(1000)
				ControlClick($winqq_1, $winqqtxt_4, 1017);安装
			EndIf

		Until Not ProcessExists($Exe)
	EndIf
