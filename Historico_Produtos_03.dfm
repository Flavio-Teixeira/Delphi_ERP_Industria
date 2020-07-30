object HistoricoProdutos03: THistoricoProdutos03
  Left = 278
  Top = 155
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Hist'#243'rico de Produtos - Filtro'
  ClientHeight = 248
  ClientWidth = 407
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 393
    Height = 56
    Caption = '   Dados do Produto   '
    TabOrder = 0
    object Label1: TLabel
      Left = 85
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 168
      Top = 12
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label8: TLabel
      Left = 3
      Top = 12
      Width = 52
      Height = 13
      Caption = 'Refer'#234'ncia'
    end
    object editCodigo: TEdit
      Left = 85
      Top = 28
      Width = 80
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object editDescricao: TEdit
      Left = 168
      Top = 28
      Width = 219
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object editReferencia: TEdit
      Left = 3
      Top = 28
      Width = 80
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 72
    Width = 393
    Height = 120
    TabOrder = 1
    object Label3: TLabel
      Left = 24
      Top = 20
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label4: TLabel
      Left = 274
      Top = 20
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label5: TLabel
      Left = 152
      Top = 20
      Width = 16
      Height = 13
      Caption = 'At'#233
    end
    object Label6: TLabel
      Left = 24
      Top = 68
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label7: TLabel
      Left = 24
      Top = 92
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object cbEstado: TComboBox
      Left = 322
      Top = 16
      Width = 65
      Height = 21
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = '- Todos -'
      OnKeyPress = cbEstadoKeyPress
      OnSelect = cbEstadoSelect
      Items.Strings = (
        '- Todos -')
    end
    object cbCidade: TComboBox
      Left = 72
      Top = 64
      Width = 315
      Height = 21
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = '- - - - - - - - - - Todas - - - - - - - - - -'
      OnKeyPress = cbCidadeKeyPress
      OnSelect = cbCidadeSelect
      Items.Strings = (
        '- - - - - - - - - - Todas - - - - - - - - - -')
    end
    object cbBairro: TComboBox
      Left = 72
      Top = 88
      Width = 315
      Height = 21
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = '- - - - - - - - - - Todos - - - - - - - - - -'
      OnKeyPress = cbBairroKeyPress
      Items.Strings = (
        '- - - - - - - - - - Todos - - - - - - - - - -')
    end
    object edtDataInicial: TMaskEdit
      Left = 72
      Top = 16
      Width = 66
      Height = 21
      AutoSize = False
      Ctl3D = False
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 0
      Text = '  /  /    '
      OnKeyPress = edtDataInicialKeyPress
    end
    object edtDataFinal: TMaskEdit
      Left = 181
      Top = 16
      Width = 66
      Height = 21
      AutoSize = False
      Ctl3D = False
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 1
      Text = '  /  /    '
      OnKeyPress = edtDataFinalKeyPress
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 200
    Width = 393
    Height = 40
    TabOrder = 2
    object btnFiltrar: TBitBtn
      Left = 160
      Top = 8
      Width = 72
      Height = 24
      Caption = '&Filtrar'
      TabOrder = 0
      OnClick = btnFiltrarClick
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
    object btnSair: TBitBtn
      Left = 312
      Top = 8
      Width = 72
      Height = 24
      Caption = '&Sair'
      TabOrder = 1
      OnClick = btnSairClick
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
    object Tipo_Historico: TEdit
      Left = 8
      Top = 8
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
  end
end
