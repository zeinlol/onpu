object FormJobs: TFormJobs
  Left = 121
  Top = 125
  BorderStyle = bsDialog
  Caption = 'Просмотр и редактирование заявок'
  ClientHeight = 367
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtnApply: TBitBtn
    Left = 448
    Top = 332
    Width = 89
    Height = 25
    Caption = '&ОК'
    Default = True
    TabOrder = 0
    OnClick = BitBtnApplyClick
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 633
    Height = 313
    Caption = ' Заявки в модели '
    TabOrder = 1
    object StringGridJobs: TStringGrid
      Left = 8
      Top = 24
      Width = 521
      Height = 281
      ColCount = 12
      DefaultColWidth = 73
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      GridLineWidth = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goRowSelect]
      TabOrder = 0
      OnClick = StringGridJobsClick
      OnDblClick = StringGridJobsDblClick
      ColWidths = (
        102
        81
        54
        55
        73
        65
        74
        2
        2
        2
        2
        3)
    end
    object BitBtnDelete: TBitBtn
      Left = 536
      Top = 118
      Width = 89
      Height = 25
      Caption = '&Удалить  '
      TabOrder = 1
      OnClick = BitBtnDeleteClick
      NumGlyphs = 2
    end
    object BitBtnReplace: TBitBtn
      Left = 536
      Top = 87
      Width = 89
      Height = 25
      Caption = '&Изменить'
      TabOrder = 2
      OnClick = BitBtnReplaceClick
      NumGlyphs = 2
    end
    object BitBtnAdd: TBitBtn
      Left = 536
      Top = 56
      Width = 89
      Height = 25
      Caption = '&Копировать'
      TabOrder = 3
      OnClick = BitBtnAddClick
      NumGlyphs = 2
    end
    object Button1: TButton
      Left = 536
      Top = 24
      Width = 89
      Height = 25
      Caption = '&Добавить'
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 336
    Width = 0
    Height = 0
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 544
    Top = 332
    Width = 89
    Height = 25
    Caption = 'О&тмена'
    ModalResult = 2
    TabOrder = 3
  end
end
