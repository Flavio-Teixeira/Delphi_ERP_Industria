object RelComissoesPagarPapeletas00: TRelComissoesPagarPapeletas00
  Left = 277
  Top = 156
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'C'#225'lculo das Comiss'#245'es a Pagar - PAPELETAS'
  ClientHeight = 234
  ClientWidth = 425
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 409
    Height = 169
    TabOrder = 0
    object Label41: TLabel
      Left = 51
      Top = 119
      Width = 70
      Height = 13
      Caption = 'Representante'
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 393
      Height = 58
      Caption = '   Data de Pagamento   '
      TabOrder = 0
      object Label1: TLabel
        Left = 68
        Top = 29
        Width = 12
        Height = 13
        Caption = 'ou'
      end
      object Label7: TLabel
        Left = 186
        Top = 12
        Width = 20
        Height = 13
        Caption = 'M'#234's'
      end
      object Label2: TLabel
        Left = 156
        Top = 29
        Width = 12
        Height = 13
        Caption = 'de'
      end
      object Label3: TLabel
        Left = 316
        Top = 29
        Width = 12
        Height = 13
        Caption = 'de'
      end
      object Label4: TLabel
        Left = 348
        Top = 12
        Width = 19
        Height = 13
        Caption = 'Ano'
      end
      object Calculo_Dia_05: TRadioButton
        Left = 8
        Top = 29
        Width = 57
        Height = 17
        Caption = 'Dia 05'
        TabOrder = 0
        OnClick = Calculo_Dia_05Click
        OnKeyPress = Calculo_Dia_05KeyPress
      end
      object Calculo_Dia_20: TRadioButton
        Left = 91
        Top = 29
        Width = 57
        Height = 17
        Caption = 'Dia 20'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = Calculo_Dia_20Click
        OnKeyPress = Calculo_Dia_20KeyPress
      end
      object Calculo_Mes: TComboBox
        Left = 186
        Top = 27
        Width = 113
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 2
        Text = '01 - Janeiro'
        OnChange = Calculo_MesChange
        OnKeyPress = Calculo_MesKeyPress
        Items.Strings = (
          '01 - Janeiro'
          '02 - Fevereiro'
          '03 - Mar'#231'o'
          '04 - Abril'
          '05 - Maio'
          '06 - Junho'
          '07 - Julho'
          '08 - Agosto'
          '09 - Setembro'
          '10 - Outubro'
          '11 - Novembro'
          '12 - Dezembro')
      end
      object Calculo_Ano: TEdit
        Left = 348
        Top = 27
        Width = 32
        Height = 19
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        TabOrder = 3
        OnChange = Calculo_AnoChange
        OnKeyPress = Calculo_AnoKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 64
      Width = 393
      Height = 45
      TabOrder = 1
      object Label5: TLabel
        Left = 79
        Top = 19
        Width = 56
        Height = 13
        Caption = 'Per'#237'odo de '
      end
      object Label6: TLabel
        Left = 220
        Top = 19
        Width = 16
        Height = 13
        Caption = 'At'#233
      end
      object Calculo_Periodo_Inicial: TMaskEdit
        Left = 144
        Top = 16
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        Text = '  /  /    '
        OnKeyPress = Calculo_Periodo_InicialKeyPress
      end
      object Calculo_Periodo_Final: TMaskEdit
        Left = 248
        Top = 16
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = Calculo_Periodo_FinalKeyPress
      end
    end
    object Calculo_Representante: TComboBox
      Left = 51
      Top = 134
      Width = 308
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 2
      OnKeyPress = Calculo_RepresentanteKeyPress
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 184
    Width = 409
    Height = 41
    TabOrder = 1
    object BT_Imprimir: TBitBtn
      Left = 167
      Top = 8
      Width = 74
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BT_ImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BT_Sair: TBitBtn
      Left = 325
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
  end
end
