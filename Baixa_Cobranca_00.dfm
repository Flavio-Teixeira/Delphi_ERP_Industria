object BaixaCobranca00: TBaixaCobranca00
  Left = 607
  Top = 158
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Baixa de Cobran'#231'as'
  ClientHeight = 447
  ClientWidth = 321
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 33
    Width = 305
    Height = 363
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 23
      Width = 113
      Height = 13
      Caption = 'N'#250'mero do Documento:'
    end
    object Label11: TLabel
      Left = 189
      Top = 5
      Width = 108
      Height = 13
      Caption = 'Natureza de Opera'#231#227'o'
    end
    object Edit_Numero_Documento: TEdit
      Left = 129
      Top = 20
      Width = 48
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 7
      ParentCtl3D = False
      TabOrder = 0
      OnChange = Edit_Numero_DocumentoChange
      OnKeyPress = Edit_Numero_DocumentoKeyPress
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 41
      Width = 289
      Height = 73
      Caption = 'Cliente'
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 24
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label3: TLabel
        Left = 8
        Top = 48
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Edit_Codigo: TEdit
        Left = 48
        Top = 21
        Width = 233
        Height = 19
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object Edit_Nome: TEdit
        Left = 48
        Top = 45
        Width = 233
        Height = 19
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 121
      Width = 289
      Height = 233
      Caption = 'Dados Para Baixa'
      TabOrder = 2
      object Label4: TLabel
        Left = 33
        Top = 24
        Width = 81
        Height = 13
        Caption = 'C'#243'digo Banc'#225'rio:'
      end
      object Label5: TLabel
        Left = 80
        Top = 48
        Width = 34
        Height = 13
        Caption = 'Banco:'
      end
      object Label6: TLabel
        Left = 14
        Top = 72
        Width = 100
        Height = 13
        Caption = 'Data de Vencimento:'
      end
      object Label7: TLabel
        Left = 16
        Top = 96
        Width = 98
        Height = 13
        Caption = 'Data de Pagamento:'
      end
      object Label8: TLabel
        Left = 39
        Top = 144
        Width = 75
        Height = 13
        Caption = 'Valor dos Juros:'
      end
      object Label9: TLabel
        Left = 15
        Top = 168
        Width = 99
        Height = 13
        Caption = 'Valor do Pagamento:'
      end
      object Label10: TLabel
        Left = 14
        Top = 120
        Width = 100
        Height = 13
        Caption = 'Valor do Documento:'
      end
      object Label12: TLabel
        Left = 52
        Top = 208
        Width = 61
        Height = 13
        Caption = 'Observa'#231#227'o:'
      end
      object Edit_Codigo_Bancario: TEdit
        Left = 116
        Top = 21
        Width = 125
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Edit_Codigo_BancarioKeyPress
      end
      object Edit_Banco: TEdit
        Left = 116
        Top = 45
        Width = 165
        Height = 19
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Edit_BancoKeyPress
      end
      object Edit_DT_Vencimento: TMaskEdit
        Left = 116
        Top = 69
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 2
        Text = '  /  /    '
        OnKeyPress = Edit_DT_VencimentoKeyPress
      end
      object Edit_DT_Pagamento: TMaskEdit
        Left = 116
        Top = 93
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 3
        Text = '  /  /    '
        OnKeyPress = Edit_DT_PagamentoKeyPress
      end
      object Edit_Vlr_Juros: TEdit
        Left = 116
        Top = 141
        Width = 93
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 15
        ParentCtl3D = False
        TabOrder = 5
        OnExit = Edit_Vlr_JurosExit
        OnKeyPress = Edit_Vlr_JurosKeyPress
      end
      object Edit_Vlr_Pagamento: TEdit
        Left = 116
        Top = 165
        Width = 93
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 15
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = Edit_Vlr_PagamentoKeyPress
      end
      object Edit_Vlr: TEdit
        Left = 116
        Top = 117
        Width = 93
        Height = 19
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Edit_VlrKeyPress
      end
      object Nro_Natureza_Operacao: TEdit
        Left = 276
        Top = 169
        Width = 8
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 8
        Visible = False
      end
      object Edit_Obs: TEdit
        Left = 116
        Top = 205
        Width = 165
        Height = 19
        Ctl3D = False
        MaxLength = 255
        ParentCtl3D = False
        TabOrder = 7
        OnKeyPress = Edit_ObsKeyPress
      end
    end
    object Natureza_Operacao: TComboBox
      Left = 186
      Top = 20
      Width = 111
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      Enabled = False
      ItemHeight = 13
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 3
      Text = 'Vendas'
      Items.Strings = (
        'Vendas'
        'Remessa'
        'Outras Sa'#237'das'
        'Consigna'#231#227'o')
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 400
    Width = 305
    Height = 41
    TabOrder = 1
    object BT_Alterar: TBitBtn
      Left = 115
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Dar &Baixa'
      Enabled = False
      TabOrder = 0
      OnClick = BT_AlterarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object BT_Sair: TBitBtn
      Left = 221
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
  object RB_Nota_Fiscal: TRadioButton
    Left = 16
    Top = 8
    Width = 73
    Height = 17
    Caption = 'Nota Fiscal'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object RB_Papeleta: TRadioButton
    Left = 136
    Top = 8
    Width = 114
    Height = 17
    Caption = 'Or'#231'amento'
    TabOrder = 3
  end
end
