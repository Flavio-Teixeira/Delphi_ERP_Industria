object EtiquetasAvulsas00: TEtiquetasAvulsas00
  Left = 277
  Top = 156
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Etiquetas Avulsas'
  ClientHeight = 253
  ClientWidth = 505
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
  object Panel3: TPanel
    Left = 4
    Top = 208
    Width = 498
    Height = 41
    TabOrder = 2
    object BT_Imprimir: TBitBtn
      Left = 211
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = BT_ImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object BT_Sair: TBitBtn
      Left = 414
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
  object Panel6: TPanel
    Left = 4
    Top = 5
    Width = 498
    Height = 162
    TabOrder = 0
    object Panel7: TPanel
      Left = 4
      Top = 4
      Width = 489
      Height = 153
      BevelOuter = bvLowered
      TabOrder = 0
      object Label4: TLabel
        Left = 62
        Top = 14
        Width = 217
        Height = 13
        Caption = 'Informe o Texto desejado nas 5 linhas Abaixo:'
      end
      object Label1: TLabel
        Left = 13
        Top = 32
        Width = 44
        Height = 13
        Caption = 'Linha 1 - '
      end
      object Label2: TLabel
        Left = 13
        Top = 53
        Width = 44
        Height = 13
        Caption = 'Linha 2 - '
      end
      object Label3: TLabel
        Left = 13
        Top = 74
        Width = 44
        Height = 13
        Caption = 'Linha 3 - '
      end
      object Label5: TLabel
        Left = 13
        Top = 95
        Width = 44
        Height = 13
        Caption = 'Linha 4 - '
      end
      object Label6: TLabel
        Left = 13
        Top = 116
        Width = 44
        Height = 13
        Caption = 'Linha 5 - '
      end
      object Linha_Avulsa_1: TEdit
        Left = 62
        Top = 29
        Width = 404
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 70
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Linha_Avulsa_1KeyPress
      end
      object Linha_Avulsa_2: TEdit
        Left = 62
        Top = 50
        Width = 404
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 70
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Linha_Avulsa_2KeyPress
      end
      object Linha_Avulsa_3: TEdit
        Left = 62
        Top = 71
        Width = 404
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 70
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Linha_Avulsa_3KeyPress
      end
      object Linha_Avulsa_4: TEdit
        Left = 62
        Top = 92
        Width = 404
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 70
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = Linha_Avulsa_4KeyPress
      end
      object Linha_Avulsa_5: TEdit
        Left = 62
        Top = 113
        Width = 404
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 70
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Linha_Avulsa_5KeyPress
      end
    end
  end
  object Panel1: TPanel
    Left = 4
    Top = 170
    Width = 498
    Height = 34
    TabOrder = 1
    object Panel2: TPanel
      Left = 4
      Top = 4
      Width = 489
      Height = 26
      BevelOuter = bvLowered
      TabOrder = 0
      object Label9: TLabel
        Left = 187
        Top = 6
        Width = 85
        Height = 13
        Caption = 'Qtde de Etiquetas'
      end
      object Avulsas_Qtde: TEdit
        Left = 277
        Top = 3
        Width = 25
        Height = 19
        Ctl3D = False
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Avulsas_QtdeKeyPress
      end
    end
  end
  object Imprimir: TImpMat
    Linhas = 6
    Colunas = 70
    TipoImp = tiBobina
    ControleServico = False
    ArqDestino = 'LPT1'
    ImprimeLinhasFinais = True
    ImprimeEspDireita = False
    Acentuacao = acANSI
    Left = 10
    Top = 215
  end
end
