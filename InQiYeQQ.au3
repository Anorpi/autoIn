#RequireAdmin


;------------------------------------------------------------------------------------------------;�ű���ʼ
Opt("TrayIconDebug", 1) ;0=����Ϣ, 1=������Ϣ
Opt("WinTextMatchMode", 1) ;1=��ȫƥ��, 2=����ƥ��
;---------------------------------------------------------------------------------------------------
$freespace = DriveSpaceFree("D:\")
If $freespace < 3072  Then;----------------------------------------------------------------------;��D�̿ռ� ���� 3G������ʾ�˳�ȥ ���·�����
	MsgBox(4096, "��ʾ ", "D�̿ռ䲻��,�����з������߽���ϵͳ����,���������б�����")
	Exit
EndIf				


	$installprogram = @ScriptDir & "\" & "HRTX1.90.2235.exe"
	If Not FileExists($installprogram) Then
		MsgBox(16, "��ʾ:", "��ȷ���Ƿ����:" & $installprogram)
		Exit
	Else

		BlockInput(1);------------------------------------------------------;��������

		;------------------------------------------------------------------------------------------------;����Ԫ�ر���
		TrayTip("��ʾ��", "��ҵQQ�Զ���װ������ʼ��", 3, 1)
		Sleep(3000)
		;------------------------------------------------------------------------------------------------;����ͼ����ʾ
		$winqq_1 = '��ҵQQ ��װ��'
		$winqqtxt_1 = '�Զ��尲װ'
		$winqqtxt_2 = '��һ��(&N)'
		$winqqtxt_3 = '��ѡ��װ·��'
		$winqqtxt_4 = "��װ���"
		$Exe = "HRTX1.90.2235.exe"

		If ProcessExists($Exe) Then ProcessClose($Exe)
		If Run($Exe) = 0 Then ShellExecute($Exe)
		Sleep(2000)


		Do
			WinActivate($winqq_1)

			If WinExists($winqq_1, $winqqtxt_1) Then
				Sleep(1000)
				ControlClick($winqq_1, $winqqtxt_1, 2101);�Զ��尲װ
			ElseIf WinExists($winqq_1, $winqqtxt_2) Then
				Sleep(1000)
				ControlClick($winqq_1, $winqqtxt_2, 1015);��һ��
			ElseIf WinExists($winqq_1, $winqqtxt_3) Then
				Sleep(1000)
				ControlClick($winqq_1, $winqqtxt_3, 1016);��װ
			ElseIf WinExists($winqq_1, $winqqtxt_4) Then
				Sleep(1000)
				ControlCommand($winqq_1, $winqqtxt_4, 1045, "UnCheck", "");----------------------------------------;ȡ������  ���� �п�����button
				Sleep(1000)
				ControlCommand($winqq_1, $winqqtxt_4, 1046, "UnCheck", "")
				Sleep(1000)
				ControlClick($winqq_1, $winqqtxt_4, 1017);��װ
			EndIf

		Until Not ProcessExists($Exe)
	EndIf
