object Boletos00: TBoletos00
  Left = 291
  Top = 366
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Duplicatas Autom'#225'tica'
  ClientHeight = 207
  ClientWidth = 424
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
  object Panel3: TPanel
    Left = 4
    Top = 161
    Width = 414
    Height = 40
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 329
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
      Left = 144
      Top = 8
      Width = 126
      Height = 25
      Caption = 'Imprimir Duplicata'
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
  object Panel1: TPanel
    Left = 4
    Top = 4
    Width = 414
    Height = 153
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 398
      Height = 141
      Caption = '  Duplicatas para '#224's Notas Fiscais  '
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 137
        Height = 13
        Caption = 'Emitir da Nota Fiscal de Nro.:'
      end
      object Label2: TLabel
        Left = 211
        Top = 24
        Width = 121
        Height = 13
        Caption = 'at'#233' a Nota Fiscal de Nro.:'
      end
      object Label3: TLabel
        Left = 158
        Top = 42
        Width = 33
        Height = 13
        Caption = '(In'#237'cio)'
      end
      object Label4: TLabel
        Left = 352
        Top = 42
        Width = 28
        Height = 13
        Caption = '(Final)'
      end
      object Label5: TLabel
        Left = 8
        Top = 96
        Width = 232
        Height = 13
        Caption = 'Observa'#231#227'o - Para Uso da Institui'#231#227'o Financeira:'
      end
      object Label6: TLabel
        Left = 8
        Top = 68
        Width = 53
        Height = 13
        Caption = 'Empresa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Nota_Inicial: TEdit
        Left = 153
        Top = 21
        Width = 44
        Height = 19
        Ctl3D = False
        MaxLength = 6
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Nota_InicialKeyPress
      end
      object Nota_Final: TEdit
        Left = 344
        Top = 21
        Width = 44
        Height = 19
        Ctl3D = False
        MaxLength = 6
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Nota_FinalKeyPress
      end
      object Nota_OBS: TEdit
        Left = 8
        Top = 112
        Width = 383
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Nota_OBSKeyPress
      end
      object Opc_Ibrasmak: TRadioButton
        Left = 65
        Top = 68
        Width = 65
        Height = 17
        Caption = 'Ibrasmak'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object Opc_Monibras: TRadioButton
        Left = 137
        Top = 68
        Width = 65
        Height = 17
        Caption = 'Monibras'
        TabOrder = 4
      end
    end
  end
  object Imprimir: TImpMat
    Linhas = 28
    Colunas = 187
    TipoImp = tiBobina
    ControleServico = False
    ArqDestino = 'LPT1'
    ImprimeLinhasFinais = True
    ImprimeEspDireita = False
    Acentuacao = acANSI
    Left = 10
    Top = 167
  end
end
