#RequireAdmin


;------------------------------------------------------------------------------------------------;�ű���ʼ
Opt("TrayIconDebug", 1) ;0=����Ϣ, 1=������Ϣ
Opt("WinTextMatchMode", 1) ;1=��ȫƥ��, 2=����ƥ��
;---------------------------------------------------------------------------------------------------
$freespace = DriveSpaceFree("D:\")
If $freespace > 3072 Then ;----------------------------------------------------------------------;��D�̿ռ� ���� 3G������ʾ�˳�ȥ ���·�����

	$installprogram = @ScriptDir & "\" & "autoitQQ.exe"
	If Not FileExists($installprogram) Then
		MsgBox(16, "��ʾ:", "QQ��װ�������ڣ���ȷ�ϰ�װ���Ƿ��ڵ�ǰĿ¼:" & @ScriptDir & "��")
		Exit
	Else

		;BlockInput(1);------------------------------------------------------;��������

		;------------------------------------------------------------------------------------------------;����Ԫ�ر���
		TrayTip("��ʾ��", "��ѶQQ�Զ���װ������ʼ��", 3, 1)
		Sleep(3000)
		;------------------------------------------------------------------------------------------------;����ͼ����ʾ
		$winqq_1 = '��ѶQQ2011 ��װ��'
		$winqqtxt_1 = '�����Ķ���ͬ��������Э���������������ȫָ��'
		$winqqtxt_2 = '��ѡ���Զ��尲װѡ�����ݷ�ʽѡ��'
		$winqqtxt_3 = '��ѡ��װ·��'
		$winqqtxt_4 = "����"
		$winqqtxt_5 = '��װ���'
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
				ControlClick($winqq_1, $winqqtxt_1, 1015);��һ��

			ElseIf WinExists($winqq_1, $winqqtxt_2) Then
				ControlCommand($winqq_1, $winqqtxt_2, 1007, "UnCheck", "");----------------------------------------;���� �п�����button
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
				If $winqqtxtreult1 = 1 And $winqqtxt2_1035 = 1 Then;--------------------�����ݷ�ʽ��ѡ�С�

					ControlClick($winqq_1, $winqqtxt_2, 1015);
				Else
					;
				EndIf
			ElseIf WinExists($winqq_1, $winqqtxt_3) Then
				ControlSetText($winqq_1, $winqqtxt_3, 1040, $lujing);-----------------------------------------------d��
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
				ControlCommand($winqq_1, $winqqtxt_5, 1045, "UnCheck", "");----------------------------------------;���� �п�����button
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
					$ceshi = ControlClick($winqq_1, $winqqtxt_5, 1017);---------------------------------------------------------;������
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
	MsgBox(4096, "��ʾ ", "D�̿ռ䲻��,�����з������߽���ϵͳ����,���������б�����")
	Exit
EndIf


;��MD5���ģ��
;   #include <Crypt.au3>
;  $sFile = FileOpenDialog("���ļ�","","�����ļ� (*.*;)")
; $md5txt=(StringTrimLeft(_Crypt_HashFile($sFile,0x00008003),2))
;MsgBox(4096,"11",$md5txt)#CE
