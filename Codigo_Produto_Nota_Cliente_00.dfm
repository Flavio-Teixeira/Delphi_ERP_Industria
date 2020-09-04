object CodigoProdutoNotaCliente00: TCodigoProdutoNotaCliente00
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'C'#243'digo do Produto no Cliente'
  ClientHeight = 177
  ClientWidth = 537
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
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 4
    Width = 522
    Height = 59
    Caption = '  Dados do Produto  '
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 17
      Width = 59
      Height = 13
      Caption = 'C'#243'd.Produto'
    end
    object Label1: TLabel
      Left = 144
      Top = 17
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label2: TLabel
      Left = 467
      Top = 17
      Width = 47
      Height = 13
      Caption = 'Valor (R$)'
    end
    object Label4: TLabel
      Left = 368
      Top = 17
      Width = 55
      Height = 13
      Caption = 'Quantidade'
    end
    object Label5: TLabel
      Left = 76
      Top = 17
      Width = 52
      Height = 13
      Caption = 'Refer'#234'ncia'
    end
    object Adiciona_Codigo_Produto: TEdit
      Left = 8
      Top = 32
      Width = 64
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 0
    end
    object Adiciona_Descricao: TEdit
      Left = 144
      Top = 32
      Width = 220
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 2
    end
    object Adiciona_Valor_Unitario: TEdit
      Left = 436
      Top = 32
      Width = 80
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 4
    end
    object Adiciona_Quantidade: TEdit
      Left = 368
      Top = 32
      Width = 64
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 7
      ParentCtl3D = False
      TabOrder = 3
    end
    object Adiciona_Referencia: TEdit
      Left = 76
      Top = 32
      Width = 64
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 65
    Width = 522
    Height = 59
    Caption = '  Dados do Produto no Cliente  '
    TabOrder = 1
    object Label6: TLabel
      Left = 105
      Top = 17
      Width = 109
      Height = 13
      Caption = 'C'#243'd.Produto no Cliente'
    end
    object Adiciona_Codigo_Cliente: TEdit
      Left = 105
      Top = 32
      Width = 313
      Height = 19
      Ctl3D = False
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = 130
    Width = 521
    Height = 41
    TabOrder = 2
    object BT_Adicionar: TBitBtn
      Left = 220
      Top = 8
      Width = 82
      Height = 25
      Caption = '&Adicionar'
      TabOrder = 0
      OnClick = BT_AdicionarClick
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
      Left = 438
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
    object Adiciona_ACol: TEdit
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Adiciona_ARow: TEdit
      Left = 12
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Programa_Anterior: TEdit
      Left = 20
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
  end
end
