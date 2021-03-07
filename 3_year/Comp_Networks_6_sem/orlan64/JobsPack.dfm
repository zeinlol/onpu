object FormPack: TFormPack
  Left = 146
  Top = 129
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072' '#1085#1072#1075#1088#1091#1079#1082#1080
  ClientHeight = 397
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 9
    Top = 12
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = #1050#1083#1080#1077#1085#1090
  end
  object Label19: TLabel
    Left = 8
    Top = 36
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = #1057#1077#1088#1074#1077#1088
  end
  object Label14: TLabel
    Left = 250
    Top = 14
    Width = 98
    Height = 13
    Alignment = taRightJustify
    Caption = #1056#1072#1079#1084#1077#1088' '#1079#1072#1087#1088#1086#1089#1072' '#1086#1090
  end
  object Label8: TLabel
    Left = 488
    Top = 16
    Width = 23
    Height = 13
    Caption = #1073#1072#1081#1090
  end
  object Label21: TLabel
    Left = 488
    Top = 37
    Width = 23
    Height = 13
    Caption = #1073#1072#1081#1090
    Visible = False
  end
  object Label15: TLabel
    Left = 194
    Top = 57
    Width = 153
    Height = 13
    Alignment = taRightJustify
    Caption = #1042#1088#1077#1084#1103' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1080' '#1079#1072#1087#1088#1086#1089#1072' '#1086#1090
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 488
    Top = 58
    Width = 14
    Height = 13
    Caption = #1084#1089
  end
  object Label18: TLabel
    Left = 488
    Top = 79
    Width = 14
    Height = 13
    Caption = #1084#1089
  end
  object Label16: TLabel
    Left = 198
    Top = 78
    Width = 148
    Height = 13
    Alignment = taRightJustify
    Caption = #1042#1088#1077#1084#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1080' '#1079#1072#1087#1088#1086#1089#1072' '#1086#1090
  end
  object Label7: TLabel
    Left = 226
    Top = 98
    Width = 119
    Height = 13
    Alignment = taRightJustify
    Caption = #1042#1088#1077#1084#1103' '#1094#1080#1082#1083#1072' '#1079#1072#1103#1074#1082#1080' '#1086#1090
  end
  object Label20: TLabel
    Left = 488
    Top = 100
    Width = 14
    Height = 13
    Caption = #1084#1089
  end
  object LabelSizeTo: TLabel
    Left = 416
    Top = 14
    Width = 12
    Height = 13
    Caption = #1076#1086
  end
  object LabelAnsSizeTo: TLabel
    Left = 416
    Top = 36
    Width = 12
    Height = 13
    Caption = #1076#1086
  end
  object LabelAnsSizeFrom: TLabel
    Left = 336
    Top = 37
    Width = 11
    Height = 13
    Caption = #1086#1090
  end
  object LabelTimeWSTo: TLabel
    Left = 416
    Top = 58
    Width = 12
    Height = 13
    Caption = #1076#1086
  end
  object LabelTimeSERVTo: TLabel
    Left = 416
    Top = 80
    Width = 12
    Height = 13
    Caption = #1076#1086
  end
  object LabelTimeCycleTo: TLabel
    Left = 416
    Top = 102
    Width = 12
    Height = 13
    Caption = #1076#1086
  end
  object Label4: TLabel
    Left = 8
    Top = 360
    Width = 93
    Height = 26
    Alignment = taRightJustify
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1096#1072#1075#1086#1074' '#1074' '#1076#1080#1072#1087#1072#1079#1086#1085#1077
    WordWrap = True
  end
  object Label5: TLabel
    Left = 7
    Top = 101
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #1063#1080#1089#1083#1086' '#1079#1072#1103#1074#1086#1082' '#1086#1090
  end
  object Label6: TLabel
    Left = 144
    Top = 101
    Width = 12
    Height = 13
    Caption = #1076#1086
  end
  object ComboBoxWS: TComboBox
    Left = 52
    Top = 8
    Width = 185
    Height = 21
    Hint = #1057#1090#1072#1085#1094#1080#1103' - '#1080#1089#1090#1086#1095#1085#1080#1082' '#1079#1072#1103#1074#1082#1080
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object ComboBoxSERV: TComboBox
    Left = 52
    Top = 32
    Width = 185
    Height = 21
    Hint = #1057#1090#1072#1085#1094#1080#1103', '#1082#1086#1090#1086#1088#1072#1103' '#1073#1091#1076#1077#1090' '#1086#1073#1088#1072#1073#1072#1090#1099#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object BitBtnAdd: TBitBtn
    Left = 520
    Top = 8
    Width = 90
    Height = 30
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1083#1072#1089#1089' '#1079#1072#1103#1074#1082#1080' '#1074' '#1082#1086#1085#1077#1094' '#1089#1087#1080#1089#1082#1072
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 15
    OnClick = BitBtnAddClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333330000000000000000888888888888888807777770AAA0
      777087777778F778777807777770AAA0777087777778F778777800000000AAA0
      000088888888F778888833300000AAA0000033388888F77888883300AAAAAAAA
      AAA03388F777777777783300AAAAAAAAAAA03388F777777777783300AAAAAAAA
      AAA03388FFFFF77FFFF833000000AAA0000033888888F778888833070440AAA0
      703333878888F778783333070F40AAA0703333878F88F778783333070FF0AAA0
      703333878FF8FFF8783333070000000070333387888888887833330777777777
      7033338777777777783333000000000000333388888888888833}
    NumGlyphs = 2
  end
  object BitBtnReplace: TBitBtn
    Left = 520
    Top = 47
    Width = 90
    Height = 30
    Hint = #1047#1072#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1081' '#1082#1083#1072#1089#1089' '#1079#1072#1103#1074#1082#1080
    Caption = #1047#1072#1084#1077#1085#1080#1090#1100
    TabOrder = 16
    OnClick = BitBtnReplaceClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333330000000000000000888888888888888807777770CC00
      777087777778778877780777770CCC0077708777778777887778000000CCCC00
      0000888888777788888833300CCCCC00033333388777778883333300CCCCCC00
      00333388777777888833330EECCCCC007033338FF777778878333307EECCCC00
      70333387FF777788783333070EECCC00703333878FF77788783333070FEECC00
      703333878FFF7788783333070FFEEC00703333878FFFF788783333070FFFEEE0
      703333878FFFFFF8783333070000000070333387888888887833330777777777
      7033338777777777783333000000000000333388888888888833}
    NumGlyphs = 2
  end
  object BitBtnDelete: TBitBtn
    Left = 520
    Top = 86
    Width = 90
    Height = 30
    Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1081' '#1082#1083#1072#1089#1089' '#1079#1072#1103#1074#1082#1080
    Caption = #1059#1076#1072#1083#1080#1090#1100'  '
    TabOrder = 17
    OnClick = BitBtnDeleteClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333300000000000000008888888888888888077777777777
      7770877777777777777807777777777777708777777777777778000000000000
      0000888888888888888833300000000000003338888888888888330099999999
      99903388F7777777777833009999999999903388F77777777778330099999999
      99903388FFFFFFFFFFF833000000000000003388888888888888330704444440
      7033338788888888783333070F444440703333878F888888783333070FF44440
      703333878FF88888783333070000000070333387888888887833330777777777
      7033338777777777783333000000000000333388888888888833}
    NumGlyphs = 2
  end
  object StringGridJobs: TStringGrid
    Left = 8
    Top = 156
    Width = 605
    Height = 197
    ColCount = 14
    DefaultColWidth = 73
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 21
    OnClick = StringGridJobsClick
  end
  object Panel1: TPanel
    Left = 10
    Top = 128
    Width = 129
    Height = 29
    Caption = #1050#1083#1080#1077#1085#1090
    TabOrder = 23
  end
  object Panel2: TPanel
    Left = 140
    Top = 128
    Width = 69
    Height = 29
    Caption = #1057#1077#1088#1074#1077#1088
    TabOrder = 24
  end
  object Panel3: TPanel
    Left = 210
    Top = 128
    Width = 59
    Height = 29
    TabOrder = 25
    object Label1: TLabel
      Left = 8
      Top = 1
      Width = 42
      Height = 26
      Alignment = taCenter
      Caption = #1056#1072#1079#1084#1077#1088' '#1079#1072#1087#1088'. '#1076#1086
      Transparent = True
      WordWrap = True
    end
  end
  object Panel4: TPanel
    Left = 270
    Top = 128
    Width = 59
    Height = 29
    TabOrder = 26
    object Label2: TLabel
      Left = 4
      Top = 1
      Width = 49
      Height = 26
      Alignment = taCenter
      Caption = #1056#1072#1079#1084#1077#1088' '#1086#1090#1074#1077#1090#1072' '#1076#1086
      Transparent = True
      WordWrap = True
    end
  end
  object Panel5: TPanel
    Left = 330
    Top = 128
    Width = 69
    Height = 29
    TabOrder = 27
    object Label11: TLabel
      Left = 6
      Top = 1
      Width = 58
      Height = 33
      Alignment = taCenter
      Caption = #1042#1088#1077#1084#1103' '#1087#1086#1076#1075#1086#1090'. '#1076#1086
      Transparent = True
      WordWrap = True
    end
  end
  object Panel6: TPanel
    Left = 400
    Top = 128
    Width = 69
    Height = 29
    TabOrder = 28
    object Label13: TLabel
      Left = 8
      Top = 1
      Width = 48
      Height = 26
      Alignment = taCenter
      Caption = #1042#1088#1077#1084#1103' '#1086#1073#1088#1072#1073'. '#1076#1086
      Transparent = True
      WordWrap = True
    end
  end
  object Panel7: TPanel
    Left = 470
    Top = 128
    Width = 69
    Height = 29
    TabOrder = 29
    object Label22: TLabel
      Left = 8
      Top = 1
      Width = 45
      Height = 26
      Alignment = taCenter
      Caption = #1042#1088#1077#1084#1103' '#1094#1080#1082#1083#1072' '#1076#1086
      Transparent = True
      WordWrap = True
    end
  end
  object BitBtnApply: TBitBtn
    Left = 204
    Top = 364
    Width = 100
    Height = 25
    Hint = 
      #1053#1072#1095#1072#1090#1100' '#1072#1085#1072#1083#1080#1090#1080#1095#1077#1089#1082#1086#1077' '#1084#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1076#1080#1072#1087#1072#1079#1086#1085#1072' '#1079#1072#1075#1088 +
      #1091#1079#1082#1080
    Caption = #1047#1072#1087#1091#1089#1082
    Default = True
    ModalResult = 1
    TabOrder = 19
    OnClick = BitBtnApplyClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtnCancel: TBitBtn
    Left = 316
    Top = 364
    Width = 100
    Height = 25
    Hint = #1042#1077#1088#1085#1091#1090#1100#1089#1103' '#1085#1072#1079#1072#1076
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 20
    Kind = bkNo
  end
  object EditSizeTo: TEdit
    Left = 436
    Top = 9
    Width = 49
    Height = 21
    Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1082#1086#1085#1094#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 5
    Text = '1400'
  end
  object EditAnsSizeTo: TEdit
    Left = 436
    Top = 31
    Width = 49
    Height = 21
    Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1082#1086#1085#1094#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 8
    Text = '1400'
    Visible = False
  end
  object CheckNeedAns: TCheckBox
    Left = 248
    Top = 35
    Width = 85
    Height = 17
    Hint = #1058#1088#1077#1073#1091#1077#1090#1089#1103' '#1083#1080' '#1087#1077#1088#1077#1076#1072#1095#1072' '#1086#1090#1074#1077#1090#1072' '#1086#1090' '#1089#1077#1088#1074#1077#1088#1072' '#1082#1083#1080#1077#1085#1090#1091
    Alignment = taLeftJustify
    BiDiMode = bdLeftToRight
    Caption = #1053#1091#1078#1077#1085' '#1086#1090#1074#1077#1090
    Checked = True
    ParentBiDiMode = False
    State = cbChecked
    TabOrder = 6
    OnClick = CheckNeedAnsClick
  end
  object EditTimeWSTo: TEdit
    Left = 436
    Top = 52
    Width = 49
    Height = 21
    Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1082#1086#1085#1094#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 10
    Text = '3'
  end
  object EditTimeSERVTo: TEdit
    Left = 436
    Top = 74
    Width = 49
    Height = 21
    Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1082#1086#1085#1094#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 12
    Text = '3'
  end
  object EditTimeCycleTo: TEdit
    Left = 436
    Top = 95
    Width = 49
    Height = 21
    Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1082#1086#1085#1094#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 14
    Text = '3'
  end
  object EditSizeFrom: TEdit
    Left = 356
    Top = 9
    Width = 53
    Height = 21
    Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1085#1072#1095#1072#1083#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 4
    Text = '100'
  end
  object EditAnsSizeFrom: TEdit
    Left = 356
    Top = 31
    Width = 53
    Height = 21
    Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1085#1072#1095#1072#1083#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 7
    Text = '100'
    Visible = False
  end
  object EditTimeWSFrom: TEdit
    Left = 356
    Top = 52
    Width = 53
    Height = 21
    Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1085#1072#1095#1072#1083#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 9
    Text = '1'
  end
  object EditTimeSERVFrom: TEdit
    Left = 356
    Top = 74
    Width = 53
    Height = 21
    Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1085#1072#1095#1072#1083#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 11
    Text = '1'
  end
  object EditTimeCycleFrom: TEdit
    Left = 356
    Top = 95
    Width = 53
    Height = 21
    Hint = #1047#1085#1072#1095#1077#1085#1080#1077' '#1074' '#1085#1072#1095#1072#1083#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 13
    Text = '1'
  end
  object ComboBoxStepsNumber: TComboBox
    Left = 112
    Top = 364
    Width = 65
    Height = 21
    Hint = 
      #1053#1072' '#1089#1082#1086#1083#1100#1082#1086' '#1096#1072#1075#1086#1074' '#1088#1072#1079#1073#1080#1090#1100' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085' '#1079#1072#1075#1088#1091#1079#1082#1080'. '#1054#1090' '#1101#1090#1086#1075#1086' '#1079 +
      #1072#1074#1080#1089#1080#1090' '#1090#1086#1095#1085#1086#1089#1090#1100' '#1080' '#1074#1088#1077#1084#1103' '#1088#1072#1089#1095#1077#1090#1072'.'
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 18
    Items.Strings = (
      '2'
      '3'
      '5'
      '10'
      '20')
  end
  object EditJobsNumberFrom: TEdit
    Left = 100
    Top = 95
    Width = 37
    Height = 21
    Hint = #1063#1080#1089#1083#1086' '#1079#1072#1103#1074#1086#1082' '#1076#1072#1085#1085#1086#1075#1086' '#1082#1083#1072#1089#1089#1072' '#1074' '#1085#1072#1095#1072#1083#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 2
    Text = '1'
  end
  object EditJobsNumberTo: TEdit
    Left = 164
    Top = 95
    Width = 37
    Height = 21
    Hint = #1063#1080#1089#1083#1086' '#1079#1072#1103#1074#1086#1082' '#1076#1072#1085#1085#1086#1075#1086' '#1082#1083#1072#1089#1089#1072' '#1074' '#1082#1086#1085#1094#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
    TabOrder = 3
    Text = '4'
  end
  object Panel8: TPanel
    Left = 540
    Top = 128
    Width = 53
    Height = 29
    TabOrder = 30
    object Label9: TLabel
      Left = 4
      Top = 1
      Width = 42
      Height = 26
      Alignment = taCenter
      Caption = #1063#1080#1089#1083#1086' '#1079#1072#1103#1074'. '#1076#1086
      Transparent = True
      WordWrap = True
    end
  end
  object StringGridAllSteps: TStringGrid
    Left = 24
    Top = 212
    Width = 585
    Height = 105
    ColCount = 7
    DefaultColWidth = 73
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 22
    Visible = False
    OnClick = StringGridJobsClick
  end
end
