#RequireAdmin
#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_outfile=installQQmusic.exe
#EndRegion ;**** ���������� ACNWrapper_GUI ****
;------------------------------------------------------------------------------------------------;�ű���ʼ
Opt("TrayIconDebug", 1) ;0=����Ϣ, 1=������Ϣ
Opt("WinTextMatchMode", 1) ;1=��ȫƥ��, 2=����ƥ��
Opt("WinSearchChildren", 1) ;0=������, 1=�����Ӵ���
Opt("WinDetectHiddenText", 1) ;0=�����, 1=���
;------------------------------------------------------------------------------------------------;���ýű�����

;Func wait()
;	Sleep(15)
;EndFunc
;-------------------------------------------------------------------------------------------------;����ȴ�����

If FileExists("d:\") Then
	$winqqmusic_1= 'QQ���� 2011 ��װ'
	$winqqmusictxt_1='��ӭʹ�á�QQ���� 2011����װ��'
	$winqqmusictxt_2='���֤Э��'
	$winqqmusictxt_3='ѡ��װλ��'
	$winqqmusictxt_4='��������'
	$winqqmusictxt_5='������ɡ�QQ���� 2011����װ��'
	;------------------------------------------------------------------------------------------------;����Ԫ�ر���
	TrayTip("��ʾ��", "�Զ���װ����3���ʼ���ڼ��벻Ҫ����������̡�", 3,1) 
	Sleep(3000)
	;------------------------------------------------------------------------------------------------;����ͼ����ʾ
	$Exe = 'auit3QQMusic.exe'
	If ProcessExists($Exe) Then ProcessClose($Exe) 
	If Run($Exe) = 0 Then ShellExecute($Exe) 
	Sleep(2000)
		Do
			WinActivate ($winqqmusic_1)
			wait()
				If WinExists($winqqmusic_1,$winqqmusictxt_1) Then
							ControlClick($winqqmusic_1, $winqqmusictxt_1, 1);��һ��
				ElseIf WinExists($winqqmusic_1,$winqqmusictxt_2) Then
							ControlClick($winqqmusic_1, $winqqmusictxt_2, 1);---------------------------------------------------------;�ҽ���
				ElseIf WinExists($winqqmusic_1,$winqqmusictxt_3) Then
							SendKeepActive($winqqmusic_1, $winqqmusictxt_3);---------------------------------------------------------;�����ť�ؼ�����һ��
							Send("{END}")
							Send("+{HOME}")
							ClipPut("d:\Program Files\Tencent\QQMusic")
							Send("^v")
							ControlClick($winqqmusic_1, $winqqmusictxt_3, 1)
				ElseIf WinExists($winqqmusic_1, $winqqmusictxt_4) Then
							ControlCommand ($winqqmusic_1, $winqqmusictxt_4,1202,"UnCheck","");----------------------------------------;���� �п�����button
							ControlCommand ($winqqmusic_1, $winqqmusictxt_4,1203,"UnCheck","")
							ControlCommand ($winqqmusic_1, $winqqmusictxt_4,1206,"UnCheck","")
							ControlClick($winqqmusic_1, $winqqmusictxt_4, 1);-------------------------------------------------------------;��װ
				ElseIf WinExists($winqqmusic_1,"���ڰ�װ") Then
				ElseIf WinExists($winqqmusic_1, $winqqmusictxt_5) Then
							ControlCommand ($winqqmusic_1, $winqqmusictxt_5,1203,"UnCheck","");----------------------------------------;���� �п�����button
							ControlCommand ($winqqmusic_1, $winqqmusictxt_5,1204,"UnCheck","")
							ControlCommand ($winqqmusic_1, $winqqmusictxt_5,1205,"UnCheck","")
							ControlCommand ($winqqmusic_1, $winqqmusictxt_5,1206,"UnCheck","")
							ControlClick($winqqmusic_1, $winqqmusictxt_5, 1);---------------------------------------------------------;������
				Else
						Sleep(1000)
				EndIf
						
		Until Not ProcessExists($Exe)
Else
	MsgBox(4096, "��ʾ ","D�̷�������,�����з������߽���ϵͳ����,���������б�����")
	Exit
	
EndIf