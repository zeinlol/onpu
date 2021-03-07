object JobOptionsForm: TJobOptionsForm
  Left = 187
  Top = 95
  BorderStyle = bsDialog
  Caption = 'Редактирование параметров заявки'
  ClientHeight = 352
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 8
    Width = 389
    Height = 305
  end
  object PageControl1: TPageControl
    Left = 6
    Top = 12
    Width = 385
    Height = 300
    ActivePage = TabSheet1
    TabOrder = 0
    TabWidth = 130
    object TabSheet1: TTabSheet
      Caption = 'Основные'
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 361
        Height = 89
        Caption = ' Источник/приемник заявки '
        TabOrder = 0
        object Label1: TLabel
          Left = 76
          Top = 24
          Width = 36
          Height = 13
          Caption = 'Клиент'
        end
        object Label2: TLabel
          Left = 76
          Top = 56
          Width = 37
          Height = 13
          Caption = 'Сервер'
        end
        object Image1: TImage
          Left = 16
          Top = 24
          Width = 32
          Height = 32
          AutoSize = True
          Picture.Data = {
            055449636F6E0000010001002020000101000800A80800001600000028000000
            2000000040000000010008000000000000040000000000000000000000000000
            0000000000000000000080000080000000808000800000008000800080800000
            C0C0C000C0DCC000F0CAA60004040400080808000C0C0C001111110016161600
            1C1C1C002222220029292900555555004D4D4D004242420039393900807CFF00
            5050FF009300D600FFECCC00C6D6EF00D6E7E70090A9AD000000330000006600
            000099000000CC00003300000033330000336600003399000033CC000033FF00
            006600000066330000666600006699000066CC000066FF000099000000993300
            00996600009999000099CC000099FF0000CC000000CC330000CC660000CC9900
            00CCCC0000CCFF0000FF660000FF990000FFCC00330000003300330033006600
            330099003300CC003300FF00333300003333330033336600333399003333CC00
            3333FF00336600003366330033666600336699003366CC003366FF0033990000
            3399330033996600339999003399CC003399FF0033CC000033CC330033CC6600
            33CC990033CCCC0033CCFF0033FF330033FF660033FF990033FFCC0033FFFF00
            660000006600330066006600660099006600CC006600FF006633000066333300
            66336600663399006633CC006633FF0066660000666633006666660066669900
            6666CC00669900006699330066996600669999006699CC006699FF0066CC0000
            66CC330066CC990066CCCC0066CCFF0066FF000066FF330066FF990066FFCC00
            CC00FF00FF00CC009999000099339900990099009900CC009900000099333300
            990066009933CC009900FF00996600009966330099336600996699009966CC00
            9933FF009999330099996600999999009999CC009999FF0099CC000099CC3300
            66CC660099CC990099CCCC0099CCFF0099FF000099FF330099CC660099FF9900
            99FFCC0099FFFF00CC00000099003300CC006600CC009900CC00CC0099330000
            CC333300CC336600CC339900CC33CC00CC33FF00CC660000CC66330099666600
            CC669900CC66CC009966FF00CC990000CC993300CC996600CC999900CC99CC00
            CC99FF00CCCC0000CCCC3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000
            CCFF330099FF6600CCFF9900CCFFCC00CCFFFF00CC003300FF006600FF009900
            CC330000FF333300FF336600FF339900FF33CC00FF33FF00FF660000FF663300
            CC666600FF669900FF66CC00CC66FF00FF990000FF993300FF996600FF999900
            FF99CC00FF99FF00FFCC0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00
            FFFF3300CCFF6600FFFF9900FFFFCC006666FF0066FF660066FFFF00FF666600
            FF66FF00FFFF66002100A5005F5F5F00777777008686860096969600CBCBCB00
            B2B2B200D7D7D700DDDDDD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00
            A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
            FFFFFF000000000000000000000000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
            0F00000000000000232323230F0000921B07070707071C1C1C1C1C1C1C929292
            6D0F00000F0F0F0F329A32230F0F0F921BBC4F48BCBCBCBC07071CF5F51B9292
            6D6D0F006D6D6D6D32FB9A230FEAEA92F5BC7C4FBCBCBCBCBC07070F0F0F9292
            6D6D6D0F92929292323232230F929292F5BCBCBCBCBCBCBCBCBCBC1C1C1C9292
            6D6D6D0F00000000000092EA0F000092F5F5F5F51B1B1B1BF31B1B1B1B1B1B1B
            6D6D6D0F00000000000092EA0F00006D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D92
            6D6D6D0F000000000000926D0F0000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F6D
            926D6D0F000000000000926D0F0000921B1B1B1BBCBCBC070707071C1C1C1C0F
            6D926D0F000F0F0F0F0F0F0F0F0F0F92F51B1B1B1B1B1BF4F31B1BF31B1B1C92
            0F6D9210921B07070707071C1C929292F51B656C6C6C6C6C6C6C6C6C6C1B1C92
            EC0F6D0092F5BC4F48070707071C9292F5F3650690069006066C066C6C1B1C92
            EC0F000092F5BC7C4FBCBC0707070792F5F365900690069006066C066C1B0792
            EC0F000092F5BCBCBCBCBCBCBCBC1C92F51B6506909090069006066C6CF30792
            EC0F000092F5F5F5F5F5F5F3F3F31B92F6F3659090B99090069006066C1B0792
            EC0F00006D6D6D6D6D6D6D6D6D6D6D92F51B6590B9FEB9909006066C6C1B0792
            EC0F0000000F0F0F0F0F0F0F0F0F0F92F51B659090B99090069006066CF30792
            EC0F0000921B1B1B1BBCBCBC07070792F51B6506909090069006066C6C1B0792
            EC0F000092F51B1B1B1B1B1B1B1B1B92F51B65656565656565656565651B0792
            EC0F000092F51B65A2A2A2A2A2A2A292F5F31BF31BF31BF31BF31BF31BF30792
            EC0F000092F51B65A7A7A7A7A7A7A792F5F5F5F5F5F5F5F5F5F5F5F5F5F5BC92
            EC0F000092F51B65A7A7A7A7A7A7A7A792070707070707070707070707070707
            EC10000092F51B65A7ACACACA7A7A7A7A7929292929292929292929292929292
            9200000092F51B65ACCDD5CDACA7A7A7A7A21B0792EC0F000000000000000000
            0000000092F51B65ACD5F5D5ACA7A7A7A7A21B0792EC0F000000000000000000
            0000000092F5F365ACCDD5CDACA7A7A7A7A21B0792EC0F000000000000000000
            0000000092F51B65A7ACACACA7A7A7A7A7A21B0792EC0F000000000000000000
            0000000092F51B65656565656565656565651B0792EC0F000000000000000000
            0000000092F5F3F3F31BF31BF31BF31BF31BF30792EC0F000000000000000000
            0000000092F5F5F5F5F5F5F5F5F5F5F5F5F5F5BC92EC0F000000000000000000
            000000000092070707070707070707070707070707EC10000000000000000000
            0000000000009292929292929292929292929292929200000000000000000000
            00000000FFF00007F0600003000000010000000000000000FC600000FC600000
            FC700000FC600000800000000000000100000003000000030000000300000003
            0000000380000003000000030000000300000003000000030000000300000007
            00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF80001FFF
            C0003FFF}
        end
        object cbClient: TComboBox
          Left = 128
          Top = 21
          Width = 201
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
        end
        object cbServer: TComboBox
          Left = 128
          Top = 53
          Width = 201
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 105
        Width = 361
        Height = 161
        Caption = ' Параметры заявки '
        TabOrder = 1
        object Label3: TLabel
          Left = 76
          Top = 32
          Width = 37
          Height = 13
          Caption = 'Запрос'
        end
        object Label4: TLabel
          Left = 53
          Top = 64
          Width = 60
          Height = 13
          Caption = 'Подготовка'
        end
        object Label5: TLabel
          Left = 58
          Top = 96
          Width = 55
          Height = 13
          Caption = 'Обработка'
        end
        object Label6: TLabel
          Left = 47
          Top = 130
          Width = 66
          Height = 13
          Caption = 'Время цикла'
          WordWrap = True
        end
        object Label7: TLabel
          Left = 204
          Top = 64
          Width = 14
          Height = 13
          Caption = 'мс'
        end
        object Label9: TLabel
          Left = 204
          Top = 128
          Width = 14
          Height = 13
          Caption = 'мс'
        end
        object Label10: TLabel
          Left = 204
          Top = 32
          Width = 23
          Height = 13
          Caption = 'байт'
        end
        object Label11: TLabel
          Left = 324
          Top = 64
          Width = 23
          Height = 13
          Caption = 'байт'
        end
        object Label17: TLabel
          Left = 204
          Top = 96
          Width = 14
          Height = 13
          Caption = 'мс'
        end
        object Image2: TImage
          Left = 16
          Top = 24
          Width = 32
          Height = 32
          AutoSize = True
          Center = True
          Picture.Data = {
            055449636F6E0000010001002020100000000000E80200001600000028000000
            2000000040000000010004000000000080020000000000000000000000000000
            0000000000000000000080000080000000808000800000008000800080800000
            80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
            FFFFFF0000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000B8B8B8B8B8000
            000000000000000008B8B8B8B8B8B8B8000000000000008E0B80000000000B8B
            8B000000000008E80008B8B8BBBBB000B8B0000000008E8E007B8B8BBBBBBBBB
            008000000008E8E80607B8B8BBBBBBBBBB005000000E8E8E07607B8BBBBBBBBB
            009090000008E800E07607B8BBBB0000D9D05000000E80EEEE07607BB0009D9D
            9D90900000080EEEEEE0760009D9D9D9D9D050000060EEEEEEEE07609D9D9D9D
            9D909000000EEEEEEEEEE070D9D9D9D9D9D05000000EEEEEEEEEEE009D9D9D9D
            9D909000000EEEEEEEEEEEE0D9D9D9D9D9D05000000EEEEEEEEEEEE09D9D9D9D
            9D909000000EEEEEEEEEEEE0D9D9D9D9D9D050000000EEEEEEEEEEE09D9D9D9D
            9D90900000000EEEEEEEEEE0D9D9D9D9D9D05000000000EEEEEEEEE09D9D9D9D
            0000900000000000EEEEEEE0D9D900005959000000000000000EEEE090009595
            959590000000000000000000095959595959500000000000000000000D959595
            95959000000000000000000000D95959595900000000000000000000000D9595
            9590000000000000000000000000D95959000000000000000000000000000D95
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FFFFFFFFFFFFFFFFFFE007FFFF0000FFFC00003FF800001FF000000F
            E0000007C0000003C0000003C0000003C0000003C0000003C0000003C0000003
            C0000003C0000003C0000003C0000003E0000003F0000003F8000003FC000003
            FF000003FFE00003FFFF0003FFFF8007FFFFC00FFFFFE01FFFFFF03FFFFFF8FF
            FFFFFFFF}
        end
        object chbAnswer: TCheckBox
          Left = 248
          Top = 32
          Width = 57
          Height = 17
          Caption = 'Ответ'
          TabOrder = 0
          OnClick = chbAnswerClick
        end
        object edQuery: TEdit
          Left = 128
          Top = 32
          Width = 73
          Height = 21
          TabOrder = 1
          Text = '0'
        end
        object edAnswer: TEdit
          Left = 248
          Top = 64
          Width = 73
          Height = 21
          TabOrder = 2
          Text = '0'
        end
        object edPrepearing: TEdit
          Left = 128
          Top = 64
          Width = 73
          Height = 21
          TabOrder = 3
          Text = '0'
          OnChange = edPrepearingChange
        end
        object edProcessing: TEdit
          Left = 128
          Top = 96
          Width = 73
          Height = 21
          TabOrder = 4
          Text = '0'
          OnChange = edProcessingChange
        end
        object edCycleTime: TEdit
          Left = 128
          Top = 128
          Width = 73
          Height = 21
          TabOrder = 5
          Text = '0'
          OnChange = edCycleTimeChange
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Дополнительно'
      ImageIndex = 1
      object GroupBox3: TGroupBox
        Left = 8
        Top = 8
        Width = 361
        Height = 257
        Caption = ' Дополнительные параметры '
        TabOrder = 0
        object Label12: TLabel
          Left = 180
          Top = 24
          Width = 54
          Height = 13
          Caption = 'Приоритет'
        end
        object Label13: TLabel
          Left = 47
          Top = 64
          Width = 187
          Height = 13
          Caption = 'Допустимое время передачи заявки'
        end
        object Label14: TLabel
          Left = 13
          Top = 93
          Width = 221
          Height = 44
          AutoSize = False
          Caption = 
            'Процент заявок, время передачи которых превышает допустимое врем' +
            'я, не должен быть больше'
          WordWrap = True
        end
        object Label15: TLabel
          Left = 332
          Top = 104
          Width = 8
          Height = 13
          Caption = '%'
        end
        object Label16: TLabel
          Left = 331
          Top = 64
          Width = 14
          Height = 13
          Caption = 'мс'
        end
        object Image3: TImage
          Left = 16
          Top = 24
          Width = 32
          Height = 32
          AutoSize = True
          Center = True
          Picture.Data = {
            055449636F6E0000010001002020100001000400E80200001600000028000000
            2000000040000000010004000000000080020000000000000000000000000000
            0000000000000000000080000080000000808000800000008000800080800000
            C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
            FFFFFF0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000FFFFFFFFFFFFFFFFFFFFFF0000000000FFFFFFFFFFFFFFFFFFFFFF0
            000000000FFF0000FF0000000000FFF0000000000FFFFFFFFFFFFFFFFFFFFFF0
            000000000FFF0000FF0000000000FFF0000000000FFFFFFFFFFFFFFFFFFFFFF0
            000000000FFF0000FF0000000000FFF0000000000FFFFFFFFFFFFFFFFFFFFFF0
            000000000FFF0000FF0000000000FFF0000000000FFFFFFFFFFFFFFFFFFFFFF0
            000000000FFFFFFFFFFFFFFFFFFFFFF0000000000FFFFFFFFFFFFFFFFFFFFFF0
            000000000FFFFFFFFFFFFFF7000FFFF0000000000FFFF800FFFF70007770FFF0
            000000440FFFF0770F70077707770FF0000044440FFFF0777087707770777000
            000044440FFFFF077707770777077777770044440FFFFFF07770777077707777
            777744440FFFFFFF077707770777777777774444000000000077707770777777
            7777444400000000000777077777777777774444000000000000777077777777
            7777444400000000000007777777777777004444000000000000007777777777
            7000444400000000000000000000000000004444000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF
            000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
            000000FF000000FF000000FC000000F000000030000000000000000000000000
            00000000FFC00000FFE00000FFF00000FFF80030FFFC0070FFFFFFFFFFFFFFFF
            FFFFFFFF}
        end
        object Label18: TLabel
          Left = 15
          Top = 144
          Width = 159
          Height = 26
          Caption = 'Распределение времени обра- ботки заявки в моноканале'
          WordWrap = True
        end
        object sePriority: TSpinEdit
          Left = 248
          Top = 24
          Width = 73
          Height = 22
          MaxValue = 100
          MinValue = 1
          TabOrder = 0
          Value = 1
          OnChange = sePriorityChange
        end
        object sePossPercent: TSpinEdit
          Left = 248
          Top = 98
          Width = 73
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = sePossPercentChange
        end
        object edPossTime: TEdit
          Left = 248
          Top = 61
          Width = 73
          Height = 21
          TabOrder = 2
          Text = '0'
        end
        object cbDistr: TComboBox
          Left = 184
          Top = 148
          Width = 137
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          Items.Strings = (
            'Постоянное'
            'Экспоненциальное')
        end
        object edProcessing2: TEdit
          Left = 232
          Top = 224
          Width = 121
          Height = 21
          TabOrder = 4
          Visible = False
        end
      end
    end
  end
  object bbOK: TBitBtn
    Left = 200
    Top = 321
    Width = 89
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = bbOKClick
  end
  object bbCancel: TBitBtn
    Left = 296
    Top = 321
    Width = 89
    Height = 25
    Caption = 'О&тмена'
    ModalResult = 2
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 272
    Width = 0
    Height = 0
    TabOrder = 3
    Kind = bkCancel
  end
end
