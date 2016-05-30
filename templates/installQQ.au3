#RequireAdmin


;------------------------------------------------------------------------------------------------;脚本开始
Opt("TrayIconDebug", 1) ;0=无信息, 1=调试信息
Opt("WinTextMatchMode", 1) ;1=完全匹配, 2=快速匹配
;---------------------------------------------------------------------------------------------------
$freespace = DriveSpaceFree("D:\")
If $freespace > 3072 Then ;----------------------------------------------------------------------;若D盘空间 不足 3G，则提示退出去 重新分区。

	$installprogram = @ScriptDir & "\" & "autoitQQ.exe"
	If Not FileExists($installprogram) Then
		MsgBox(16, "提示:", "QQ安装包不存在，请确认安装包是否在当前目录:" & @ScriptDir & "下")
		Exit
	Else

		;BlockInput(1);------------------------------------------------------;锁定键盘

		;------------------------------------------------------------------------------------------------;窗口元素变量
		TrayTip("提示：", "腾讯QQ自动安装即将开始。", 3, 1)
		Sleep(3000)
		;------------------------------------------------------------------------------------------------;托盘图标提示
		$winqq_1 = '腾讯QQ2011 安装向导'
		$winqqtxt_1 = '我已阅读并同意软件许可协议和青少年上网安全指引'
		$winqqtxt_2 = '请选择自定义安装选项与快捷方式选项'
		$winqqtxt_3 = '请选择安装路径'
		$winqqtxt_4 = "正在"
		$winqqtxt_5 = '安装完成'
		$lujing = "D:\Program Files\Tencent\QQ"
		$Exe = "autoitQQ.exe"

		If ProcessExists($Exe) Then ProcessClose($Exe)
		If Run($Exe) = 0 Then ShellExecute($Exe)
		Sleep(2000)


		Do
			WinActivate($winqq_1)

			If WinExists($winqq_1, $winqqtxt_1) Then
				ControlCommand($winqq_1, $winqqtxt_1, 1020, "Check", "")
				Sleep(100)
				ControlClick($winqq_1, $winqqtxt_1, 1015);下一步

			ElseIf WinExists($winqq_1, $winqqtxt_2) Then
				ControlCommand($winqq_1, $winqqtxt_2, 1007, "UnCheck", "");----------------------------------------;测试 有可能是button
				Sleep(100)
				ControlCommand($winqq_1, $winqqtxt_2, 1017, "UnCheck", "")
				Sleep(100)
				ControlCommand($winqq_1, $winqqtxt_2, 3016, "UnCheck", "")
				Sleep(100)
				ControlCommand($winqq_1, $winqqtxt_2, 3018, "UnCheck", "")
				Sleep(100)
				ControlCommand($winqq_1, $winqqtxt_2, 1035, "Check", "")
				Sleep(100)
				ControlCommand($winqq_1, $winqqtxt_2, 1036, "UnCheck", "")
				Sleep(100)
				$winqqtxt2_1007 = ControlCommand($winqq_1, $winqqtxt_2, 1007, "IsChecked", "")
				$winqqtxt2_1017 = ControlCommand($winqq_1, $winqqtxt_2, 1017, "IsChecked", "")
				$winqqtxt2_3016 = ControlCommand($winqq_1, $winqqtxt_2, 3016, "IsChecked", "")
				$winqqtxt2_3018 = ControlCommand($winqq_1, $winqqtxt_2, 3018, "IsChecked", "")
				$winqqtxt2_1035 = ControlCommand($winqq_1, $winqqtxt_2, 1035, "IsChecked", "")
				$winqqtxt2_1036 = ControlCommand($winqq_1, $winqqtxt_2, 1036, "IsChecked", "")
				$winqqtxtreult1 = $winqqtxt2_1007 + $winqqtxt2_1017 + $winqqtxt2_3016 + $winqqtxt2_3018 + $winqqtxt2_1035 + $winqqtxt2_1036
				;If ControlCommand($winqq_1, $winqqtxt_2, 1007, "IsChecked", "") And  ControlCommand($winqq_1, $winqqtxt_2, 1017, "IsChecked", "") And ControlCommand($winqq_1, $winqqtxt_2, 3016, "IsChecked", "") And ControlCommand($winqq_1, $winqqtxt_2, 3018, "IsChecked", "") And ControlCommand($winqq_1, $winqqtxt_2, 1036, "IsChecked", "") ==0	Then;---------------------------------------------------------------
				If $winqqtxtreult1 = 1 And $winqqtxt2_1035 = 1 Then;--------------------桌面快捷方式被选中。

					ControlClick($winqq_1, $winqqtxt_2, 1015);
				Else
					;
				EndIf
			ElseIf WinExists($winqq_1, $winqqtxt_3) Then
				ControlSetText($winqq_1, $winqqtxt_3, 1040, $lujing);-----------------------------------------------d盘
				Sleep(100)
				ControlCommand($winqq_1, $winqqtxt_3, 1002, "Check", "")
				Sleep(100)
				$winqqtxt3_1040 = ControlGetText($winqq_1, $winqqtxt_3, 1040)
				$winqqtxt3_1002 = ControlCommand($winqq_1, $winqqtxt_3, 1002, "IsChecked", "")
				$reslt1 = ($winqqtxt3_1040 == $lujing)
				$reslt2 = ($reslt1 + $winqqtxt3_1002)
				If $reslt2 = 2 Then
					ControlClick($winqq_1, $winqqtxt_3, 1016)
				Else
					;
				EndIf
			ElseIf WinExists($winqq_1, $winqqtxt_4) Then
				WinActivate($winqq_1, $winqqtxt_4)
			ElseIf WinExists($winqq_1, $winqqtxt_5) Then
				ControlCommand($winqq_1, $winqqtxt_5, 1045, "UnCheck", "");----------------------------------------;测试 有可能是button
				Sleep(100)
				ControlCommand($winqq_1, $winqqtxt_5, 1047, "UnCheck", "")
				Sleep(100)
				ControlCommand($winqq_1, $winqqtxt_5, 1038, "UnCheck", "")
				Sleep(100)
				ControlCommand($winqq_1, $winqqtxt_5, 1046, "UnCheck", "")

				$winqqtxt5_1045 = ControlCommand($winqq_1, $winqqtxt_5, 1045, "IsChecked", "")
				$winqqtxt5_1047 = ControlCommand($winqq_1, $winqqtxt_5, 1047, "IsChecked", "")
				$winqqtxt5_1038 = ControlCommand($winqq_1, $winqqtxt_5, 1038, "IsChecked", "")
				$winqqtxt5_1046 = ControlCommand($winqq_1, $winqqtxt_5, 1046, "IsChecked", "")
				$winqqtxtreult3 = $winqqtxt5_1045 + $winqqtxt5_1047 + $winqqtxt5_1038 + $winqqtxt5_1046
				If $winqqtxtreult3 = 0 Then
					$ceshi = ControlClick($winqq_1, $winqqtxt_5, 1017);---------------------------------------------------------;点击完成
					If $ceshi = 1 Then
						ProcessClose($Exe)
					Else
						;
					EndIf
				EndIf
			Else
				Sleep(500)
			EndIf

		Until Not ProcessExists($Exe)
	EndIf
Else
	MsgBox(4096, "提示 ", "D盘空间不足,请运行分区工具进行系统分区,再重新运行本程序。")
	Exit
EndIf


;加MD5检测模块
;   #include <Crypt.au3>
;  $sFile = FileOpenDialog("打开文件","","所有文件 (*.*;)")
; $md5txt=(StringTrimLeft(_Crypt_HashFile($sFile,0x00008003),2))
;MsgBox(4096,"11",$md5txt)#CE
