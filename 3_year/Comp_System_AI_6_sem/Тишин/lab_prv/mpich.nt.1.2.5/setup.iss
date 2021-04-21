[InstallShield Silent]
Version=v5.00.000
File=Response File
[File Transfer]
OverwriteReadOnly=NoToAll
[DlgOrder]
Dlg0=SdWelcome-0
Count=6
Dlg1=SdLicense-0
Dlg2=SdAskDestPath-0
Dlg3=SdComponentDialog2-0
Dlg4=SdStartCopy-0
Dlg5=SdFinish-0
[SdWelcome-0]
Result=1
[SdLicense-0]
Result=1
[SdAskDestPath-0]
szDir=C:\Program Files\mpich
Result=1
[SdComponentDialog2-0]
Component-type=string
Component-count=4
Component-0=runtime dlls
Component-1=mpd
Component-2=SDK
Component-3=Help
Result=1
[SdStartCopy-0]
Result=1
[Application]
Name=mpich
Version=1.2.5
Company=mpich
Lang=0009
[SdFinish-0]
Result=1
bOpt1=0
bOpt2=0
