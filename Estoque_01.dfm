object Estoque01: TEstoque01
  Left = 487
  Top = 210
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Manuten'#231#227'o do Estoque'
  ClientHeight = 393
  ClientWidth = 392
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
  object Label5: TLabel
    Left = 8
    Top = 19
    Width = 38
    Height = 13
    AutoSize = False
    Caption = 'C'#243'digo'
  end
  object Label6: TLabel
    Left = 8
    Top = 39
    Width = 60
    Height = 13
    AutoSize = False
    Caption = 'Descri'#231#227'o'
  end
  object Label3: TLabel
    Left = 202
    Top = 19
    Width = 60
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Desenho'
  end
  object Panel3: TPanel
    Left = 8
    Top = 345
    Width = 377
    Height = 41
    TabOrder = 3
    object BT_Sair: TBitBtn
      Left = 293
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Retornar ao Menu Principal|Retornar ao Menu Principal'
      Caption = '&Sair'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 81
    Width = 377
    Height = 256
    Caption = ' Quantidades do Produto '
    TabOrder = 2
    object Label1: TLabel
      Left = 7
      Top = 74
      Width = 75
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde.'
    end
    object Label2: TLabel
      Left = 186
      Top = 26
      Width = 70
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde. Atual'
    end
    object Label4: TLabel
      Left = 7
      Top = 26
      Width = 75
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde. Inicial'
    end
    object Label7: TLabel
      Left = 7
      Top = 195
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observa'#231#227'o'
    end
    object Label8: TLabel
      Left = 7
      Top = 171
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Funcion'#225'rio'
    end
    object Label40: TLabel
      Left = 15
      Top = 147
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Departamento'
    end
    object Label9: TLabel
      Left = 9
      Top = 98
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor de Venda'
    end
    object Label10: TLabel
      Left = 25
      Top = 122
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Localiza'#231#227'o'
    end
    object Label11: TLabel
      Left = 7
      Top = 50
      Width = 75
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde. Ideal'
    end
    object Label12: TLabel
      Left = 186
      Top = 50
      Width = 70
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde. M'#237'nima'
    end
    object BT_Subtrair: TBitBtn
      Left = 193
      Top = 217
      Width = 80
      Height = 28
      Caption = '&Subtrair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = BT_SubtrairClick
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7000777777777777700077777777777770007777777777777000777777777777
        70007700000000077000770CCCCCCC0770007700000000077000777777777777
        7000777777777777700077777777777770007777777777777000777777777777
        7000}
    end
    object BT_Adicionar: TBitBtn
      Left = 105
      Top = 217
      Width = 80
      Height = 28
      Caption = '&Adicionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = BT_AdicionarClick
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        700077777777777770007777700077777000777770C077777000777770C07777
        7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
        7000777770C07777700077777000777770007777777777777000777777777777
        7000}
    end
    object Qtd: TEdit
      Left = 88
      Top = 72
      Width = 90
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = QtdKeyPress
    end
    object Qtd_Inicial: TEdit
      Left = 88
      Top = 24
      Width = 90
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      OnKeyPress = Qtd_InicialKeyPress
    end
    object Qtd_Atual: TEdit
      Left = 264
      Top = 24
      Width = 90
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object Obs: TEdit
      Left = 88
      Top = 193
      Width = 265
      Height = 19
      Ctl3D = False
      MaxLength = 255
      ParentCtl3D = False
      TabOrder = 5
      OnKeyPress = ObsKeyPress
    end
    object Fun: TEdit
      Left = 88
      Top = 169
      Width = 265
      Height = 19
      Ctl3D = False
      MaxLength = 255
      ParentCtl3D = False
      TabOrder = 4
      OnKeyPress = FunKeyPress
    end
    object Dep: TComboBox
      Left = 88
      Top = 144
      Width = 265
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 3
      OnKeyPress = DepKeyPress
    end
    object Valor_Venda: TEdit
      Left = 88
      Top = 96
      Width = 90
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnKeyPress = QtdKeyPress
    end
    object Localizacao: TEdit
      Left = 88
      Top = 120
      Width = 265
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnKeyPress = LocalizacaoKeyPress
    end
    object Qtd_Ideal: TEdit
      Left = 88
      Top = 48
      Width = 90
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
      OnKeyPress = Qtd_InicialKeyPress
    end
    object Qtd_Minima: TEdit
      Left = 264
      Top = 48
      Width = 90
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 11
    end
  end
  object Codigo: TEdit
    Left = 49
    Top = 16
    Width = 120
    Height = 19
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 0
  end
  object Descricao: TEdit
    Left = 8
    Top = 54
    Width = 376
    Height = 19
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 1
  end
  object Desenho: TEdit
    Left = 264
    Top = 16
    Width = 120
    Height = 19
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 4
  end
end
