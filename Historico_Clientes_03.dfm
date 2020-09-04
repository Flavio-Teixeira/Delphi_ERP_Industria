object HistoricoClientes03: THistoricoClientes03
  Left = 281
  Top = 160
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Historico de Compras Por Produto'
  ClientHeight = 463
  ClientWidth = 576
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
    Width = 560
    Height = 64
    Caption = '   Dados do Produto   '
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 219
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label8: TLabel
      Left = 5
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Refer'#234'ncia'
    end
    object editCodigo: TEdit
      Left = 112
      Top = 32
      Width = 104
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object editDescricao: TEdit
      Left = 219
      Top = 32
      Width = 335
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object editReferencia: TEdit
      Left = 5
      Top = 32
      Width = 104
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 176
    Width = 560
    Height = 232
    Caption = '   Clientes   '
    TabOrder = 1
    object SGD_Saidas: TStringGrid
      Left = 8
      Top = 16
      Width = 544
      Height = 208
      ColCount = 12
      Ctl3D = False
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentCtl3D = False
      TabOrder = 0
      OnDblClick = SGD_SaidasDblClick
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 416
    Width = 560
    Height = 40
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 480
      Top = 8
      Width = 72
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      OnClick = BitBtn1Click
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
  object GroupBox4: TGroupBox
    Left = 8
    Top = 80
    Width = 560
    Height = 88
    Caption = '   Dados do Filtro   '
    TabOrder = 3
    object Label3: TLabel
      Left = 24
      Top = 20
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label4: TLabel
      Left = 24
      Top = 40
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label5: TLabel
      Left = 160
      Top = 20
      Width = 16
      Height = 13
      Caption = 'At'#233
    end
    object Label6: TLabel
      Left = 80
      Top = 40
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label7: TLabel
      Left = 312
      Top = 40
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object edtDataInicial: TMaskEdit
      Left = 80
      Top = 16
      Width = 66
      Height = 21
      AutoSize = False
      Ctl3D = False
      Enabled = False
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 0
      Text = '  /  /    '
    end
    object edtDataFinal: TMaskEdit
      Left = 188
      Top = 16
      Width = 66
      Height = 21
      AutoSize = False
      Ctl3D = False
      Enabled = False
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 1
      Text = '  /  /    '
    end
    object edtEstado: TEdit
      Left = 24
      Top = 56
      Width = 49
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object edtCidade: TEdit
      Left = 80
      Top = 56
      Width = 224
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object edtBairro: TEdit
      Left = 312
      Top = 56
      Width = 224
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 4
    end
  end
end
