object Boletos01: TBoletos01
  Left = 277
  Top = 104
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Duplicatas - AVULSOS'
  ClientHeight = 515
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888
    88888888888877700000008888888888888888888877700CCCCAAA0088888888
    8888888887770CCCCCCAAAAA08888888888888887770CCCCCCCAAAAAA0887777
    777777777709CCCCCCCAAAAAAA087777777777777099999CCCCAAAAAA6607000
    00000000009999999CCAAAA6666070FFDDDFFF666099999999AA6666666070FF
    DDDFFF66609999999BB666666660700F0D0F0F0600999999BBBE6666666070FF
    DDDFFF666099999BBBEEE666666070FFDDDFFF666F099BBBBBEEEE66660870FF
    DDDFFF666FF0BBBBBBEEEEE66088700F0D0F0F060F0F0BBBBEEEEEEE088870FF
    DDDFFF666FFFC00BBEEEEE00888870FFDDDFFF666FFFCCC0000000F0888870FF
    DDDFFFFFFFFFCCCFFF999FF08888700F0D0F0F0F0F0F0C0F0F090F00888870FF
    DDDFFFFFFFFFCCCFFF999FF0888870FFDDDFFFFFFFFFCCCFFF999FF0888870FF
    DDDFFFFFFFFFCCCFFF999FF08888700F0F0F0F0F0F0F0C0F0F090F00888870FF
    FFFFFFFFFFFFFFFFFF999FF0888870FFFFFFFFFFFFFFFFFFFF999FF0888870FF
    FFFFFFFFFFFFFFFFFF999FF08888700F0F0F0F0F0F0F0F0F0F0F0F00888870FF
    FFFFFFFFFFFFFFFFFFFFFFF0888870FFFFFFFFFFFFFFFFFFFFFFFFF0888870FF
    FFFFFFFFFFFFFFFFFFFFFFF0888880FFFFFFFFFFFFFFFFFFFFFFFFF088888000
    0000000000000000000000008888000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 4
    Top = 5
    Width = 508
    Height = 169
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 4
      Width = 491
      Height = 156
      Caption = '  Selecione o Cliente  '
      TabOrder = 0
      object GroupBox3: TGroupBox
        Left = 8
        Top = 11
        Width = 475
        Height = 61
        TabOrder = 0
        object Label1: TLabel
          Left = 7
          Top = 11
          Width = 95
          Height = 13
          Caption = 'Dados para Procura'
        end
        object Label2: TLabel
          Left = 284
          Top = 11
          Width = 37
          Height = 13
          Caption = 'Op'#231#245'es'
        end
        object Dados_Procura: TEdit
          Left = 7
          Top = 26
          Width = 267
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Dados_ProcuraKeyPress
        end
        object Opcoes_Procura: TComboBox
          Left = 284
          Top = 26
          Width = 90
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 1
          Text = 'Nro. da Nota'
          OnKeyPress = Opcoes_ProcuraKeyPress
          Items.Strings = (
            'Nro. da Nota'
            'C'#243'digo')
        end
        object BT_Procurar: TBitBtn
          Left = 386
          Top = 23
          Width = 75
          Height = 25
          Caption = '&Procurar'
          TabOrder = 2
          OnClick = BT_ProcurarClick
          Glyph.Data = {
            36050000424D360500000000000036040000280000000E000000100000000100
            08000000000000010000CA0E0000C30E00000001000000000000000000003300
            00006600000099000000CC000000FF0000000033000033330000663300009933
            0000CC330000FF33000000660000336600006666000099660000CC660000FF66
            000000990000339900006699000099990000CC990000FF99000000CC000033CC
            000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
            0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
            330000333300333333006633330099333300CC333300FF333300006633003366
            33006666330099663300CC663300FF6633000099330033993300669933009999
            3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
            330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
            66006600660099006600CC006600FF0066000033660033336600663366009933
            6600CC336600FF33660000666600336666006666660099666600CC666600FF66
            660000996600339966006699660099996600CC996600FF99660000CC660033CC
            660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
            6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
            990000339900333399006633990099339900CC339900FF339900006699003366
            99006666990099669900CC669900FF6699000099990033999900669999009999
            9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
            990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
            CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
            CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
            CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
            CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
            CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
            FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
            FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
            FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
            FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000ACACACACACAC
            ACACACAC0000ACAC0000ACACACACACACACACAC02230500AC0000ACAC00000000
            00000223050500000000ACAC56ACACACAC02230505ACAC000000ACAC56D7D7D7
            02230505ACD7AC000000ACAC56000056AC0505ACD7D7AC000000AC56AC23AC00
            5656ACD7D7D7AC00000056D723AC23AC00ACD7D7D7D7AC0000005623D723AC23
            00ACD7D7D7D7AC00000056D723D723AC00ACD7D7D7D7AC000000AC56D723D700
            ACD7D7D7D7D7AC000000ACAC565600ACD7D7D7D7D7D7AC000000ACAC56D7D7D7
            D7D7D7D700000000FFFFACAC56D7D7D7D7D7D7D7ACD756AC0000ACAC56D7D7D7
            D7D7D7D7AC56ACAC0000ACAC565656565656565656ACACAC0000}
        end
      end
      object Dados_Cliente: TGroupBox
        Left = 8
        Top = 75
        Width = 475
        Height = 73
        Caption = '  Dados do Cliente  '
        TabOrder = 1
        object LBL_Endereco_1: TLabel
          Left = 8
          Top = 19
          Width = 460
          Height = 13
          AutoSize = False
        end
        object LBL_Endereco_2: TLabel
          Left = 8
          Top = 35
          Width = 460
          Height = 13
          AutoSize = False
        end
        object LBL_Endereco_3: TLabel
          Left = 8
          Top = 51
          Width = 460
          Height = 13
          AutoSize = False
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 4
    Top = 177
    Width = 508
    Height = 286
    TabOrder = 1
    object Duplicata_1: TGroupBox
      Left = 8
      Top = 3
      Width = 491
      Height = 67
      Caption = '   '
      TabOrder = 0
      object Label12: TLabel
        Left = 60
        Top = 21
        Width = 48
        Height = 13
        Caption = 'Dt.Vencto'
      end
      object Label4: TLabel
        Left = 127
        Top = 21
        Width = 53
        Height = 13
        Caption = 'Dt.Emiss'#227'o'
      end
      object Label5: TLabel
        Left = 194
        Top = 21
        Width = 49
        Height = 13
        Caption = 'Nro.Docto'
      end
      object Label6: TLabel
        Left = 437
        Top = 21
        Width = 47
        Height = 13
        Caption = 'Valor - R$'
      end
      object Label7: TLabel
        Left = 265
        Top = 21
        Width = 168
        Height = 13
        Caption = 'OBS.: Uso da Institui'#231#227'o Financeira'
      end
      object Label17: TLabel
        Left = 3
        Top = 21
        Width = 43
        Height = 13
        Caption = 'Nro.Nota'
      end
      object Duplicata_Vencto_1: TMaskEdit
        Left = 60
        Top = 36
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 2
        Text = '  /  /    '
        OnKeyPress = Duplicata_Vencto_1KeyPress
      end
      object Duplicata_Emissao_1: TMaskEdit
        Left = 127
        Top = 36
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 3
        Text = '  /  /    '
        OnKeyPress = Duplicata_Emissao_1KeyPress
      end
      object Duplicata_Docto_1: TEdit
        Left = 194
        Top = 36
        Width = 69
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Duplicata_Docto_1KeyPress
      end
      object Duplicata_Valor_1: TEdit
        Left = 437
        Top = 36
        Width = 50
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = Duplicata_Valor_1KeyPress
      end
      object Duplicata_Referente_1: TEdit
        Left = 265
        Top = 36
        Width = 170
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = Duplicata_Referente_1KeyPress
      end
      object Duplicata_Emite_1: TCheckBox
        Left = 15
        Top = -2
        Width = 78
        Height = 17
        Caption = '1a. Parcela'
        TabOrder = 0
        OnClick = Duplicata_Emite_1Click
        OnKeyPress = Duplicata_Emite_1KeyPress
      end
      object Duplicata_Nro_1: TEdit
        Left = 3
        Top = 36
        Width = 56
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Duplicata_Nro_1KeyPress
      end
    end
    object Duplicata_2: TGroupBox
      Left = 8
      Top = 73
      Width = 491
      Height = 67
      Caption = '   '
      TabOrder = 1
      object Label8: TLabel
        Left = 61
        Top = 21
        Width = 48
        Height = 13
        Caption = 'Dt.Vencto'
      end
      object Label9: TLabel
        Left = 128
        Top = 21
        Width = 53
        Height = 13
        Caption = 'Dt.Emiss'#227'o'
      end
      object Label10: TLabel
        Left = 194
        Top = 21
        Width = 49
        Height = 13
        Caption = 'Nro.Docto'
      end
      object Label11: TLabel
        Left = 437
        Top = 21
        Width = 47
        Height = 13
        Caption = 'Valor - R$'
      end
      object Label18: TLabel
        Left = 265
        Top = 21
        Width = 168
        Height = 13
        Caption = 'OBS.: Uso da Institui'#231#227'o Financeira'
      end
      object Label19: TLabel
        Left = 3
        Top = 21
        Width = 43
        Height = 13
        Caption = 'Nro.Nota'
      end
      object Duplicata_Vencto_2: TMaskEdit
        Left = 61
        Top = 36
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 2
        Text = '  /  /    '
        OnKeyPress = Duplicata_Vencto_2KeyPress
      end
      object Duplicata_Emissao_2: TMaskEdit
        Left = 128
        Top = 36
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 3
        Text = '  /  /    '
        OnKeyPress = Duplicata_Emissao_2KeyPress
      end
      object Duplicata_Docto_2: TEdit
        Left = 194
        Top = 36
        Width = 69
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Duplicata_Docto_2KeyPress
      end
      object Duplicata_Valor_2: TEdit
        Left = 437
        Top = 36
        Width = 50
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = Duplicata_Valor_2KeyPress
      end
      object Duplicata_Referente_2: TEdit
        Left = 265
        Top = 36
        Width = 170
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = Duplicata_Referente_2KeyPress
      end
      object Duplicata_Emite_2: TCheckBox
        Left = 15
        Top = -2
        Width = 78
        Height = 17
        Caption = '2a. Parcela'
        TabOrder = 0
        OnClick = Duplicata_Emite_2Click
        OnKeyPress = Duplicata_Emite_2KeyPress
      end
      object Duplicata_Nro_2: TEdit
        Left = 3
        Top = 36
        Width = 56
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Duplicata_Nro_2KeyPress
      end
    end
    object Duplicata_3: TGroupBox
      Left = 8
      Top = 143
      Width = 491
      Height = 67
      Caption = '   '
      TabOrder = 2
      object Label21: TLabel
        Left = 61
        Top = 21
        Width = 48
        Height = 13
        Caption = 'Dt.Vencto'
      end
      object Label22: TLabel
        Left = 127
        Top = 21
        Width = 53
        Height = 13
        Caption = 'Dt.Emiss'#227'o'
      end
      object Label23: TLabel
        Left = 194
        Top = 21
        Width = 49
        Height = 13
        Caption = 'Nro.Docto'
      end
      object Label24: TLabel
        Left = 437
        Top = 21
        Width = 47
        Height = 13
        Caption = 'Valor - R$'
      end
      object Label25: TLabel
        Left = 265
        Top = 21
        Width = 168
        Height = 13
        Caption = 'OBS.: Uso da Institui'#231#227'o Financeira'
      end
      object Label20: TLabel
        Left = 3
        Top = 21
        Width = 43
        Height = 13
        Caption = 'Nro.Nota'
      end
      object Duplicata_Vencto_3: TMaskEdit
        Left = 61
        Top = 36
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 2
        Text = '  /  /    '
        OnKeyPress = Duplicata_Vencto_3KeyPress
      end
      object Duplicata_Emissao_3: TMaskEdit
        Left = 127
        Top = 36
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 3
        Text = '  /  /    '
        OnKeyPress = Duplicata_Emissao_3KeyPress
      end
      object Duplicata_Docto_3: TEdit
        Left = 194
        Top = 36
        Width = 69
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Duplicata_Docto_3KeyPress
      end
      object Duplicata_Valor_3: TEdit
        Left = 437
        Top = 36
        Width = 50
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = Duplicata_Valor_3KeyPress
      end
      object Duplicata_Referente_3: TEdit
        Left = 265
        Top = 36
        Width = 170
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = Duplicata_Referente_3KeyPress
      end
      object Duplicata_Emite_3: TCheckBox
        Left = 15
        Top = -2
        Width = 78
        Height = 17
        Caption = '3a. Parcela'
        TabOrder = 0
        OnClick = Duplicata_Emite_3Click
        OnKeyPress = Duplicata_Emite_3KeyPress
      end
      object Duplicata_Nro_3: TEdit
        Left = 3
        Top = 36
        Width = 56
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Duplicata_Nro_3KeyPress
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 213
      Width = 491
      Height = 67
      Caption = '   '
      TabOrder = 3
      object Label3: TLabel
        Left = 61
        Top = 20
        Width = 48
        Height = 13
        Caption = 'Dt.Vencto'
      end
      object Label13: TLabel
        Left = 127
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Dt.Emiss'#227'o'
      end
      object Label14: TLabel
        Left = 194
        Top = 20
        Width = 49
        Height = 13
        Caption = 'Nro.Docto'
      end
      object Label15: TLabel
        Left = 437
        Top = 20
        Width = 47
        Height = 13
        Caption = 'Valor - R$'
      end
      object Label16: TLabel
        Left = 265
        Top = 20
        Width = 168
        Height = 13
        Caption = 'OBS.: Uso da Institui'#231#227'o Financeira'
      end
      object Label26: TLabel
        Left = 3
        Top = 20
        Width = 43
        Height = 13
        Caption = 'Nro.Nota'
      end
      object Duplicata_Vencto_4: TMaskEdit
        Left = 61
        Top = 35
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 2
        Text = '  /  /    '
        OnKeyPress = Duplicata_Vencto_4KeyPress
      end
      object Duplicata_Emissao_4: TMaskEdit
        Left = 127
        Top = 35
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 3
        Text = '  /  /    '
        OnKeyPress = Duplicata_Emissao_4KeyPress
      end
      object Duplicata_Docto_4: TEdit
        Left = 194
        Top = 35
        Width = 69
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Duplicata_Docto_4KeyPress
      end
      object Duplicata_Valor_4: TEdit
        Left = 437
        Top = 35
        Width = 50
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = Duplicata_Valor_4KeyPress
      end
      object Duplicata_Referente_4: TEdit
        Left = 265
        Top = 35
        Width = 170
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = Duplicata_Referente_4KeyPress
      end
      object Duplicata_Emite_4: TCheckBox
        Left = 15
        Top = -3
        Width = 78
        Height = 17
        Caption = '4a. Parcela'
        TabOrder = 0
        OnClick = Duplicata_Emite_4Click
        OnKeyPress = Duplicata_Emite_4KeyPress
      end
      object Duplicata_Nro_4: TEdit
        Left = 3
        Top = 35
        Width = 56
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Duplicata_Nro_4KeyPress
      end
    end
  end
  object Panel4: TPanel
    Left = 4
    Top = 467
    Width = 508
    Height = 41
    TabOrder = 2
    object LBL_Codigo: TLabel
      Left = 40
      Top = 3
      Width = 153
      Height = 13
      AutoSize = False
      Visible = False
    end
    object LBL_Inscricao: TLabel
      Left = 40
      Top = 19
      Width = 153
      Height = 13
      AutoSize = False
      Visible = False
    end
    object BT_Sair: TBitBtn
      Left = 425
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BT_SairClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object BT_Imprimir: TBitBtn
      Left = 197
      Top = 8
      Width = 114
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 0
      OnClick = BT_ImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object Imprimir: TImpMat
    Linhas = 36
    Colunas = 187
    TipoImp = tiBobina
    ControleServico = False
    ArqDestino = 'LPT1'
    ImprimeLinhasFinais = True
    ImprimeEspDireita = False
    Acentuacao = acNenhum
    Left = 10
    Top = 470
  end
end
