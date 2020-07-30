object TabulacaoPDF: TTabulacaoPDF
  Left = 204
  Top = 13
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cria Arquivo PDF'
  ClientHeight = 694
  ClientWidth = 1013
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
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Menu_Principal: TPanel
    Left = 8
    Top = 648
    Width = 1001
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 616
      Top = 14
      Width = 36
      Height = 13
      Caption = 'P'#225'gina:'
    end
    object LBL_Ini: TLabel
      Left = 664
      Top = 14
      Width = 6
      Height = 13
      Caption = '1'
    end
    object Label3: TLabel
      Left = 688
      Top = 14
      Width = 12
      Height = 13
      Caption = 'de'
    end
    object LBL_Fim: TLabel
      Left = 717
      Top = 14
      Width = 6
      Height = 13
      Caption = '1'
    end
    object BT_Sair: TBitBtn
      Left = 918
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 0
      OnClick = BT_SairClick
      OnKeyPress = BT_SairKeyPress
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
    object BT_Ok: TBitBtn
      Left = 474
      Top = 8
      Width = 53
      Height = 25
      Caption = '&Ok'
      TabOrder = 1
      OnClick = BT_OkClick
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
    object Opcao_Anterior: TEdit
      Left = 71
      Top = 11
      Width = 9
      Height = 21
      TabOrder = 2
      Text = 'Opcao_Anterior'
      Visible = False
    end
    object Cliente_Email: TEdit
      Left = 82
      Top = 11
      Width = 9
      Height = 21
      TabOrder = 3
      Text = 'Opcao_Anterior'
      Visible = False
    end
    object Nro_Ordem: TEdit
      Left = 94
      Top = 11
      Width = 9
      Height = 21
      TabOrder = 4
      Text = 'Opcao_Anterior'
      Visible = False
    end
    object BT_Avanca: TButton
      Left = 784
      Top = 8
      Width = 28
      Height = 25
      Caption = '>>'
      TabOrder = 5
      OnClick = BT_AvancaClick
    end
    object BT_Retorna: TButton
      Left = 748
      Top = 8
      Width = 28
      Height = 25
      Caption = '<<'
      TabOrder = 6
      OnClick = BT_RetornaClick
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 4
    Width = 1001
    Height = 637
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 986
      Height = 621
      Caption = 'Visualisa'#231#227'o'
      TabOrder = 0
      object Pdf: TPdf
        Left = 3
        Top = 12
        Width = 980
        Height = 605
        TabOrder = 0
        ControlData = {0000050049650000873E00000000000000}
      end
      object PRPage: TPRPage
        Left = 8
        Top = 16
        Width = 973
        Height = 794
        MarginTop = 32
        MarginLeft = 32
        MarginRight = 32
        MarginBottom = 32
        Visible = False
        object PRLayoutPanel1: TPRLayoutPanel
          Left = 0
          Top = 0
          Width = 973
          Height = 794
          object PRLabel52: TPRLabel
            Left = 110
            Top = 435
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRLabel43: TPRLabel
            Left = 148
            Top = 530
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRLabel41: TPRLabel
            Left = 12
            Top = 73
            Width = 85
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Requisi'#231#227'o:'
            Alignment = taRightJustify
          end
          object Requisicao: TPRLabel
            Left = 107
            Top = 73
            Width = 846
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'xxxxxxxxxxxxxxx'
          end
          object Empresa_01: TPRLabel
            Left = 37
            Top = 7
            Width = 388
            Height = 41
            FontName = fnArial
            FontSize = 40.000000000000000000
            FontBold = True
            Caption = 'IBRASMAK'
          end
          object Empresa_02: TPRLabel
            Left = 37
            Top = 50
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
          end
          object PRLabel1: TPRLabel
            Left = 12
            Top = 92
            Width = 85
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Equipamento:'
            Alignment = taRightJustify
          end
          object PRLabel5: TPRLabel
            Left = 12
            Top = 110
            Width = 85
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'OS:'
            Alignment = taRightJustify
          end
          object PRLabel6: TPRLabel
            Left = 12
            Top = 128
            Width = 85
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Se'#231#227'o:'
            Alignment = taRightJustify
          end
          object Equipamento: TPRLabel
            Left = 107
            Top = 92
            Width = 846
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'xxxxxxxxxxxxxxx'
          end
          object OS: TPRLabel
            Left = 107
            Top = 110
            Width = 846
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'xxxxxxxxxxxxxxx'
          end
          object Secao: TPRLabel
            Left = 107
            Top = 128
            Width = 846
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'xxxxxxxxxxxxxxx'
          end
          object PRRect5: TPRRect
            Left = 18
            Top = 181
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel13: TPRLabel
            Left = 22
            Top = 184
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = 'Fornecedor'
            Alignment = taRightJustify
          end
          object PRRect6: TPRRect
            Left = 18
            Top = 200
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel14: TPRLabel
            Left = 21
            Top = 203
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = 'Contato'
            Alignment = taRightJustify
          end
          object PRRect7: TPRRect
            Left = 18
            Top = 219
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel11: TPRLabel
            Left = 21
            Top = 222
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = 'Fone'
            Alignment = taRightJustify
          end
          object Data: TPRLabel
            Left = 19
            Top = 162
            Width = 942
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Ribeir'#227'o Pires, 99 de XXXXXXXXX de 2009'
          end
          object PRRect1: TPRRect
            Left = 90
            Top = 181
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_1: TPRLabel
            Left = 94
            Top = 184
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect2: TPRRect
            Left = 212
            Top = 181
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_2: TPRLabel
            Left = 216
            Top = 184
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect3: TPRRect
            Left = 334
            Top = 181
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_3: TPRLabel
            Left = 338
            Top = 184
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect4: TPRRect
            Left = 456
            Top = 181
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_4: TPRLabel
            Left = 460
            Top = 184
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect8: TPRRect
            Left = 578
            Top = 181
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_5: TPRLabel
            Left = 582
            Top = 184
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect9: TPRRect
            Left = 700
            Top = 181
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_6: TPRLabel
            Left = 704
            Top = 184
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect10: TPRRect
            Left = 822
            Top = 181
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_7: TPRLabel
            Left = 826
            Top = 184
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect11: TPRRect
            Left = 90
            Top = 200
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect12: TPRRect
            Left = 334
            Top = 200
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect13: TPRRect
            Left = 212
            Top = 200
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect14: TPRRect
            Left = 456
            Top = 200
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect15: TPRRect
            Left = 578
            Top = 200
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect16: TPRRect
            Left = 700
            Top = 200
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect17: TPRRect
            Left = 822
            Top = 200
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Contato_7: TPRLabel
            Left = 826
            Top = 203
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Contato_6: TPRLabel
            Left = 704
            Top = 203
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Contato_5: TPRLabel
            Left = 582
            Top = 203
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Contato_4: TPRLabel
            Left = 460
            Top = 203
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Contato_3: TPRLabel
            Left = 338
            Top = 203
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Contato_2: TPRLabel
            Left = 216
            Top = 203
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Contato_1: TPRLabel
            Left = 94
            Top = 203
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect18: TPRRect
            Left = 90
            Top = 219
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect19: TPRRect
            Left = 334
            Top = 219
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect20: TPRRect
            Left = 212
            Top = 219
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect21: TPRRect
            Left = 456
            Top = 219
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect22: TPRRect
            Left = 578
            Top = 219
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect23: TPRRect
            Left = 700
            Top = 219
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect24: TPRRect
            Left = 822
            Top = 219
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fone_7: TPRLabel
            Left = 826
            Top = 222
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fone_6: TPRLabel
            Left = 704
            Top = 222
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fone_5: TPRLabel
            Left = 582
            Top = 222
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fone_4: TPRLabel
            Left = 460
            Top = 222
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fone_3: TPRLabel
            Left = 338
            Top = 222
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fone_2: TPRLabel
            Left = 216
            Top = 222
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fone_1: TPRLabel
            Left = 94
            Top = 222
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect25: TPRRect
            Left = 55
            Top = 241
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object Item_1: TPRLabel
            Left = 58
            Top = 244
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object PRRect26: TPRRect
            Left = 89
            Top = 241
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_1_1: TPRLabel
            Left = 93
            Top = 244
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect27: TPRRect
            Left = 211
            Top = 241
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_2_1: TPRLabel
            Left = 215
            Top = 244
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect28: TPRRect
            Left = 333
            Top = 241
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_3_1: TPRLabel
            Left = 337
            Top = 244
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect29: TPRRect
            Left = 455
            Top = 241
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_1: TPRLabel
            Left = 459
            Top = 244
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect30: TPRRect
            Left = 577
            Top = 241
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_1: TPRLabel
            Left = 581
            Top = 244
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect31: TPRRect
            Left = 699
            Top = 241
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_1: TPRLabel
            Left = 703
            Top = 244
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect32: TPRRect
            Left = 821
            Top = 241
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_1: TPRLabel
            Left = 825
            Top = 244
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect33: TPRRect
            Left = 55
            Top = 260
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object Item_2: TPRLabel
            Left = 58
            Top = 263
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object PRRect34: TPRRect
            Left = 89
            Top = 260
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_1_2: TPRLabel
            Left = 93
            Top = 263
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect35: TPRRect
            Left = 211
            Top = 260
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_2_2: TPRLabel
            Left = 215
            Top = 263
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect36: TPRRect
            Left = 333
            Top = 260
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_3_2: TPRLabel
            Left = 337
            Top = 263
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect37: TPRRect
            Left = 455
            Top = 260
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_2: TPRLabel
            Left = 459
            Top = 263
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect38: TPRRect
            Left = 577
            Top = 260
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_2: TPRLabel
            Left = 581
            Top = 263
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect39: TPRRect
            Left = 699
            Top = 260
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_2: TPRLabel
            Left = 703
            Top = 263
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect40: TPRRect
            Left = 821
            Top = 260
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_2: TPRLabel
            Left = 825
            Top = 263
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect41: TPRRect
            Left = 55
            Top = 279
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object Item_3: TPRLabel
            Left = 58
            Top = 282
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object PRRect42: TPRRect
            Left = 89
            Top = 279
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_1_3: TPRLabel
            Left = 93
            Top = 282
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect43: TPRRect
            Left = 211
            Top = 279
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_2_3: TPRLabel
            Left = 215
            Top = 282
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect44: TPRRect
            Left = 333
            Top = 279
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_3_3: TPRLabel
            Left = 337
            Top = 282
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect45: TPRRect
            Left = 455
            Top = 279
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_3: TPRLabel
            Left = 459
            Top = 282
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect46: TPRRect
            Left = 577
            Top = 279
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_3: TPRLabel
            Left = 581
            Top = 282
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect47: TPRRect
            Left = 699
            Top = 279
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_3: TPRLabel
            Left = 703
            Top = 282
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect48: TPRRect
            Left = 821
            Top = 279
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_3: TPRLabel
            Left = 825
            Top = 282
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect49: TPRRect
            Left = 55
            Top = 298
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object Item_4: TPRLabel
            Left = 58
            Top = 301
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object PRRect50: TPRRect
            Left = 89
            Top = 298
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_1_4: TPRLabel
            Left = 93
            Top = 301
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect51: TPRRect
            Left = 211
            Top = 298
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_2_4: TPRLabel
            Left = 215
            Top = 301
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect52: TPRRect
            Left = 333
            Top = 298
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_3_4: TPRLabel
            Left = 337
            Top = 301
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect53: TPRRect
            Left = 455
            Top = 298
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_4: TPRLabel
            Left = 459
            Top = 301
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect54: TPRRect
            Left = 577
            Top = 298
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_4: TPRLabel
            Left = 581
            Top = 301
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect55: TPRRect
            Left = 699
            Top = 298
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_4: TPRLabel
            Left = 703
            Top = 301
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect56: TPRRect
            Left = 821
            Top = 298
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_4: TPRLabel
            Left = 825
            Top = 301
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect57: TPRRect
            Left = 55
            Top = 317
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object Item_5: TPRLabel
            Left = 58
            Top = 320
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object PRRect58: TPRRect
            Left = 89
            Top = 317
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_1_5: TPRLabel
            Left = 93
            Top = 320
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect59: TPRRect
            Left = 211
            Top = 317
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_2_5: TPRLabel
            Left = 215
            Top = 320
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect60: TPRRect
            Left = 333
            Top = 317
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_3_5: TPRLabel
            Left = 337
            Top = 320
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect61: TPRRect
            Left = 455
            Top = 317
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_5: TPRLabel
            Left = 459
            Top = 320
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect62: TPRRect
            Left = 577
            Top = 317
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_5: TPRLabel
            Left = 581
            Top = 320
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect63: TPRRect
            Left = 699
            Top = 317
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_5: TPRLabel
            Left = 703
            Top = 320
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect64: TPRRect
            Left = 821
            Top = 317
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_5: TPRLabel
            Left = 825
            Top = 320
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect65: TPRRect
            Left = 55
            Top = 412
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect66: TPRRect
            Left = 55
            Top = 393
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect67: TPRRect
            Left = 55
            Top = 374
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect68: TPRRect
            Left = 55
            Top = 355
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect69: TPRRect
            Left = 55
            Top = 336
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object Item_6: TPRLabel
            Left = 58
            Top = 339
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_7: TPRLabel
            Left = 58
            Top = 358
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_8: TPRLabel
            Left = 58
            Top = 377
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_9: TPRLabel
            Left = 58
            Top = 396
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_10: TPRLabel
            Left = 58
            Top = 415
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object PRRect70: TPRRect
            Left = 89
            Top = 412
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect71: TPRRect
            Left = 89
            Top = 393
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect72: TPRRect
            Left = 89
            Top = 374
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect73: TPRRect
            Left = 89
            Top = 355
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect74: TPRRect
            Left = 89
            Top = 336
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_1_6: TPRLabel
            Left = 93
            Top = 339
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_7: TPRLabel
            Left = 93
            Top = 358
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_8: TPRLabel
            Left = 93
            Top = 377
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_9: TPRLabel
            Left = 93
            Top = 396
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_10: TPRLabel
            Left = 93
            Top = 415
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect75: TPRRect
            Left = 211
            Top = 412
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect76: TPRRect
            Left = 211
            Top = 393
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect77: TPRRect
            Left = 211
            Top = 374
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect78: TPRRect
            Left = 211
            Top = 355
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect79: TPRRect
            Left = 211
            Top = 336
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_2_6: TPRLabel
            Left = 215
            Top = 339
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_7: TPRLabel
            Left = 215
            Top = 358
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_8: TPRLabel
            Left = 215
            Top = 377
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_9: TPRLabel
            Left = 215
            Top = 396
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_10: TPRLabel
            Left = 215
            Top = 415
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect80: TPRRect
            Left = 333
            Top = 412
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect81: TPRRect
            Left = 333
            Top = 393
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect82: TPRRect
            Left = 333
            Top = 374
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect83: TPRRect
            Left = 333
            Top = 355
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect84: TPRRect
            Left = 333
            Top = 336
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_3_6: TPRLabel
            Left = 337
            Top = 339
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_7: TPRLabel
            Left = 337
            Top = 358
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_8: TPRLabel
            Left = 337
            Top = 377
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_9: TPRLabel
            Left = 337
            Top = 396
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_10: TPRLabel
            Left = 337
            Top = 415
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect85: TPRRect
            Left = 455
            Top = 412
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_10: TPRLabel
            Left = 459
            Top = 415
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect86: TPRRect
            Left = 455
            Top = 393
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_9: TPRLabel
            Left = 459
            Top = 396
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect87: TPRRect
            Left = 455
            Top = 374
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_8: TPRLabel
            Left = 459
            Top = 377
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect88: TPRRect
            Left = 455
            Top = 355
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_7: TPRLabel
            Left = 459
            Top = 358
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect89: TPRRect
            Left = 455
            Top = 336
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_6: TPRLabel
            Left = 459
            Top = 339
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect90: TPRRect
            Left = 577
            Top = 412
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_10: TPRLabel
            Left = 581
            Top = 415
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect91: TPRRect
            Left = 577
            Top = 393
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_9: TPRLabel
            Left = 581
            Top = 396
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect92: TPRRect
            Left = 577
            Top = 374
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_8: TPRLabel
            Left = 581
            Top = 377
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect93: TPRRect
            Left = 577
            Top = 355
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_7: TPRLabel
            Left = 581
            Top = 358
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect94: TPRRect
            Left = 577
            Top = 336
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_6: TPRLabel
            Left = 581
            Top = 339
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect95: TPRRect
            Left = 699
            Top = 412
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_10: TPRLabel
            Left = 703
            Top = 415
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect96: TPRRect
            Left = 699
            Top = 393
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_9: TPRLabel
            Left = 703
            Top = 396
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect97: TPRRect
            Left = 699
            Top = 374
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_8: TPRLabel
            Left = 703
            Top = 377
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect98: TPRRect
            Left = 699
            Top = 355
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_7: TPRLabel
            Left = 703
            Top = 358
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect99: TPRRect
            Left = 699
            Top = 336
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_6: TPRLabel
            Left = 703
            Top = 339
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect100: TPRRect
            Left = 821
            Top = 412
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_10: TPRLabel
            Left = 825
            Top = 415
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect101: TPRRect
            Left = 821
            Top = 393
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_9: TPRLabel
            Left = 825
            Top = 396
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect102: TPRRect
            Left = 821
            Top = 374
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_8: TPRLabel
            Left = 825
            Top = 377
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect103: TPRRect
            Left = 821
            Top = 355
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_7: TPRLabel
            Left = 825
            Top = 358
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect104: TPRRect
            Left = 821
            Top = 336
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_6: TPRLabel
            Left = 825
            Top = 339
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect105: TPRRect
            Left = 55
            Top = 507
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect106: TPRRect
            Left = 55
            Top = 488
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect107: TPRRect
            Left = 55
            Top = 469
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect108: TPRRect
            Left = 55
            Top = 450
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect109: TPRRect
            Left = 55
            Top = 431
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object Item_11: TPRLabel
            Left = 58
            Top = 434
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_12: TPRLabel
            Left = 58
            Top = 453
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_13: TPRLabel
            Left = 58
            Top = 472
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_14: TPRLabel
            Left = 58
            Top = 491
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_15: TPRLabel
            Left = 58
            Top = 510
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object PRRect110: TPRRect
            Left = 89
            Top = 507
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect111: TPRRect
            Left = 89
            Top = 488
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect112: TPRRect
            Left = 89
            Top = 469
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect113: TPRRect
            Left = 89
            Top = 450
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect114: TPRRect
            Left = 89
            Top = 431
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_1_11: TPRLabel
            Left = 93
            Top = 434
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_12: TPRLabel
            Left = 93
            Top = 453
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_13: TPRLabel
            Left = 93
            Top = 472
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_14: TPRLabel
            Left = 93
            Top = 491
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_15: TPRLabel
            Left = 93
            Top = 510
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect115: TPRRect
            Left = 211
            Top = 507
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect116: TPRRect
            Left = 211
            Top = 488
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect117: TPRRect
            Left = 211
            Top = 469
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect118: TPRRect
            Left = 211
            Top = 450
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect119: TPRRect
            Left = 211
            Top = 431
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_2_11: TPRLabel
            Left = 215
            Top = 434
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_12: TPRLabel
            Left = 215
            Top = 453
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_13: TPRLabel
            Left = 215
            Top = 472
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_14: TPRLabel
            Left = 215
            Top = 491
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_15: TPRLabel
            Left = 215
            Top = 510
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect120: TPRRect
            Left = 333
            Top = 507
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect121: TPRRect
            Left = 333
            Top = 488
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect122: TPRRect
            Left = 333
            Top = 469
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect123: TPRRect
            Left = 333
            Top = 450
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect124: TPRRect
            Left = 333
            Top = 431
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_3_11: TPRLabel
            Left = 337
            Top = 434
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_12: TPRLabel
            Left = 337
            Top = 453
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_13: TPRLabel
            Left = 337
            Top = 472
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_14: TPRLabel
            Left = 337
            Top = 491
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_15: TPRLabel
            Left = 337
            Top = 510
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect125: TPRRect
            Left = 455
            Top = 507
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_15: TPRLabel
            Left = 459
            Top = 510
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect126: TPRRect
            Left = 455
            Top = 488
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_14: TPRLabel
            Left = 459
            Top = 491
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect127: TPRRect
            Left = 455
            Top = 469
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_13: TPRLabel
            Left = 459
            Top = 472
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect128: TPRRect
            Left = 455
            Top = 450
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_12: TPRLabel
            Left = 459
            Top = 453
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect129: TPRRect
            Left = 455
            Top = 431
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_11: TPRLabel
            Left = 459
            Top = 434
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect130: TPRRect
            Left = 577
            Top = 507
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_15: TPRLabel
            Left = 581
            Top = 510
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect131: TPRRect
            Left = 577
            Top = 488
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_14: TPRLabel
            Left = 581
            Top = 491
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect132: TPRRect
            Left = 577
            Top = 469
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_13: TPRLabel
            Left = 581
            Top = 472
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect133: TPRRect
            Left = 577
            Top = 450
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_12: TPRLabel
            Left = 581
            Top = 453
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect134: TPRRect
            Left = 577
            Top = 431
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_11: TPRLabel
            Left = 581
            Top = 434
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect135: TPRRect
            Left = 699
            Top = 507
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_15: TPRLabel
            Left = 703
            Top = 510
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect136: TPRRect
            Left = 699
            Top = 488
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_14: TPRLabel
            Left = 703
            Top = 491
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect137: TPRRect
            Left = 699
            Top = 469
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_13: TPRLabel
            Left = 703
            Top = 472
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect138: TPRRect
            Left = 699
            Top = 450
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_12: TPRLabel
            Left = 703
            Top = 453
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect139: TPRRect
            Left = 699
            Top = 431
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_11: TPRLabel
            Left = 703
            Top = 434
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect140: TPRRect
            Left = 821
            Top = 507
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_15: TPRLabel
            Left = 825
            Top = 510
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect141: TPRRect
            Left = 821
            Top = 488
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_14: TPRLabel
            Left = 825
            Top = 491
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect142: TPRRect
            Left = 821
            Top = 469
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_13: TPRLabel
            Left = 825
            Top = 472
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect143: TPRRect
            Left = 821
            Top = 450
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_12: TPRLabel
            Left = 825
            Top = 453
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect144: TPRRect
            Left = 821
            Top = 431
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_11: TPRLabel
            Left = 825
            Top = 434
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect145: TPRRect
            Left = 55
            Top = 602
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect146: TPRRect
            Left = 55
            Top = 583
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect147: TPRRect
            Left = 55
            Top = 564
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect148: TPRRect
            Left = 55
            Top = 545
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect149: TPRRect
            Left = 55
            Top = 526
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object Item_16: TPRLabel
            Left = 58
            Top = 529
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_17: TPRLabel
            Left = 58
            Top = 548
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_18: TPRLabel
            Left = 58
            Top = 567
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_19: TPRLabel
            Left = 58
            Top = 586
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_20: TPRLabel
            Left = 58
            Top = 605
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object PRRect150: TPRRect
            Left = 89
            Top = 602
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect151: TPRRect
            Left = 89
            Top = 583
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect152: TPRRect
            Left = 89
            Top = 564
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect153: TPRRect
            Left = 89
            Top = 545
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect154: TPRRect
            Left = 89
            Top = 526
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_1_16: TPRLabel
            Left = 93
            Top = 529
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_17: TPRLabel
            Left = 93
            Top = 548
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_18: TPRLabel
            Left = 93
            Top = 567
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_19: TPRLabel
            Left = 93
            Top = 586
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_20: TPRLabel
            Left = 93
            Top = 605
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect155: TPRRect
            Left = 211
            Top = 602
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect156: TPRRect
            Left = 211
            Top = 583
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect157: TPRRect
            Left = 211
            Top = 564
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect158: TPRRect
            Left = 211
            Top = 545
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect159: TPRRect
            Left = 211
            Top = 526
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_2_16: TPRLabel
            Left = 215
            Top = 529
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_17: TPRLabel
            Left = 215
            Top = 548
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_18: TPRLabel
            Left = 215
            Top = 567
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_19: TPRLabel
            Left = 215
            Top = 586
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_20: TPRLabel
            Left = 215
            Top = 605
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect160: TPRRect
            Left = 333
            Top = 602
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect161: TPRRect
            Left = 333
            Top = 583
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect162: TPRRect
            Left = 333
            Top = 564
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect163: TPRRect
            Left = 333
            Top = 545
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect164: TPRRect
            Left = 333
            Top = 526
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_3_16: TPRLabel
            Left = 337
            Top = 529
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_17: TPRLabel
            Left = 337
            Top = 548
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_18: TPRLabel
            Left = 337
            Top = 567
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_19: TPRLabel
            Left = 337
            Top = 586
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_20: TPRLabel
            Left = 337
            Top = 605
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect165: TPRRect
            Left = 455
            Top = 602
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_20: TPRLabel
            Left = 459
            Top = 605
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect166: TPRRect
            Left = 455
            Top = 583
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_19: TPRLabel
            Left = 459
            Top = 586
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect167: TPRRect
            Left = 455
            Top = 564
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_18: TPRLabel
            Left = 459
            Top = 567
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect168: TPRRect
            Left = 455
            Top = 545
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_17: TPRLabel
            Left = 459
            Top = 548
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect169: TPRRect
            Left = 455
            Top = 526
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_16: TPRLabel
            Left = 459
            Top = 529
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect170: TPRRect
            Left = 577
            Top = 602
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_20: TPRLabel
            Left = 581
            Top = 605
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect171: TPRRect
            Left = 577
            Top = 583
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_19: TPRLabel
            Left = 581
            Top = 586
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect172: TPRRect
            Left = 577
            Top = 564
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_18: TPRLabel
            Left = 581
            Top = 567
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect173: TPRRect
            Left = 577
            Top = 545
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_17: TPRLabel
            Left = 581
            Top = 548
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect174: TPRRect
            Left = 577
            Top = 526
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_16: TPRLabel
            Left = 581
            Top = 529
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect175: TPRRect
            Left = 699
            Top = 602
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_20: TPRLabel
            Left = 703
            Top = 605
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect176: TPRRect
            Left = 699
            Top = 583
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_19: TPRLabel
            Left = 703
            Top = 586
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect177: TPRRect
            Left = 699
            Top = 564
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_18: TPRLabel
            Left = 703
            Top = 567
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect178: TPRRect
            Left = 699
            Top = 545
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_17: TPRLabel
            Left = 703
            Top = 548
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect179: TPRRect
            Left = 699
            Top = 526
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_16: TPRLabel
            Left = 703
            Top = 529
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect180: TPRRect
            Left = 821
            Top = 602
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_20: TPRLabel
            Left = 825
            Top = 605
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect181: TPRRect
            Left = 821
            Top = 583
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_19: TPRLabel
            Left = 825
            Top = 586
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect182: TPRRect
            Left = 821
            Top = 564
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_18: TPRLabel
            Left = 825
            Top = 567
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect183: TPRRect
            Left = 821
            Top = 545
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_17: TPRLabel
            Left = 825
            Top = 548
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect184: TPRRect
            Left = 821
            Top = 526
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_16: TPRLabel
            Left = 825
            Top = 529
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect185: TPRRect
            Left = 16
            Top = 700
            Width = 74
            Height = 60
            LineStyle = psSolid
          end
          object PRRect186: TPRRect
            Left = 16
            Top = 681
            Width = 74
            Height = 20
            LineStyle = psSolid
          end
          object PRRect187: TPRRect
            Left = 55
            Top = 659
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect188: TPRRect
            Left = 55
            Top = 640
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect189: TPRRect
            Left = 55
            Top = 621
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object Item_21: TPRLabel
            Left = 58
            Top = 624
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_22: TPRLabel
            Left = 58
            Top = 643
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object Item_23: TPRLabel
            Left = 58
            Top = 662
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = '99'
            Alignment = taCenter
          end
          object PRLabel199: TPRLabel
            Left = 22
            Top = 684
            Width = 64
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = 'Pagamento'
            Alignment = taRightJustify
          end
          object PRLabel200: TPRLabel
            Left = 24
            Top = 721
            Width = 62
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = 'Entrega'
            Alignment = taRightJustify
          end
          object PRRect190: TPRRect
            Left = 89
            Top = 700
            Width = 123
            Height = 60
            LineStyle = psSolid
          end
          object PRRect191: TPRRect
            Left = 89
            Top = 681
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect192: TPRRect
            Left = 89
            Top = 659
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect193: TPRRect
            Left = 89
            Top = 640
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect194: TPRRect
            Left = 89
            Top = 621
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_1_21: TPRLabel
            Left = 93
            Top = 624
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_22: TPRLabel
            Left = 93
            Top = 643
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_1_23: TPRLabel
            Left = 93
            Top = 662
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Pgto_1: TPRLabel
            Left = 93
            Top = 684
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect195: TPRRect
            Left = 211
            Top = 700
            Width = 123
            Height = 60
            LineStyle = psSolid
          end
          object PRRect196: TPRRect
            Left = 211
            Top = 681
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect197: TPRRect
            Left = 211
            Top = 659
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect198: TPRRect
            Left = 211
            Top = 640
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect199: TPRRect
            Left = 211
            Top = 621
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_2_21: TPRLabel
            Left = 215
            Top = 624
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_22: TPRLabel
            Left = 215
            Top = 643
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_2_23: TPRLabel
            Left = 215
            Top = 662
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Pgto_2: TPRLabel
            Left = 215
            Top = 684
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect200: TPRRect
            Left = 333
            Top = 700
            Width = 123
            Height = 60
            LineStyle = psSolid
          end
          object PRRect201: TPRRect
            Left = 333
            Top = 681
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect202: TPRRect
            Left = 333
            Top = 659
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect203: TPRRect
            Left = 333
            Top = 640
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object PRRect204: TPRRect
            Left = 333
            Top = 621
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_3_21: TPRLabel
            Left = 337
            Top = 624
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_22: TPRLabel
            Left = 337
            Top = 643
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Fornecedor_Item_3_23: TPRLabel
            Left = 337
            Top = 662
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Pgto_3: TPRLabel
            Left = 337
            Top = 684
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect205: TPRRect
            Left = 455
            Top = 700
            Width = 123
            Height = 60
            LineStyle = psSolid
          end
          object PRRect206: TPRRect
            Left = 455
            Top = 681
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Pgto_4: TPRLabel
            Left = 459
            Top = 684
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect207: TPRRect
            Left = 455
            Top = 659
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_23: TPRLabel
            Left = 459
            Top = 662
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect208: TPRRect
            Left = 455
            Top = 640
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_22: TPRLabel
            Left = 459
            Top = 643
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect209: TPRRect
            Left = 455
            Top = 621
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_4_21: TPRLabel
            Left = 459
            Top = 624
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect210: TPRRect
            Left = 577
            Top = 700
            Width = 123
            Height = 60
            LineStyle = psSolid
          end
          object PRRect211: TPRRect
            Left = 577
            Top = 681
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Pgto_5: TPRLabel
            Left = 581
            Top = 684
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect212: TPRRect
            Left = 577
            Top = 659
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_23: TPRLabel
            Left = 581
            Top = 662
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect213: TPRRect
            Left = 577
            Top = 640
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_22: TPRLabel
            Left = 581
            Top = 643
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect214: TPRRect
            Left = 577
            Top = 621
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_5_21: TPRLabel
            Left = 581
            Top = 624
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect215: TPRRect
            Left = 699
            Top = 700
            Width = 123
            Height = 60
            LineStyle = psSolid
          end
          object PRRect216: TPRRect
            Left = 699
            Top = 681
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Pgto_6: TPRLabel
            Left = 703
            Top = 684
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect217: TPRRect
            Left = 699
            Top = 659
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_23: TPRLabel
            Left = 703
            Top = 662
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect218: TPRRect
            Left = 699
            Top = 640
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_22: TPRLabel
            Left = 703
            Top = 643
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect219: TPRRect
            Left = 699
            Top = 621
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_6_21: TPRLabel
            Left = 703
            Top = 624
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect220: TPRRect
            Left = 821
            Top = 700
            Width = 123
            Height = 60
            LineStyle = psSolid
          end
          object PRRect221: TPRRect
            Left = 821
            Top = 681
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Pgto_7: TPRLabel
            Left = 825
            Top = 684
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect222: TPRRect
            Left = 821
            Top = 659
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_23: TPRLabel
            Left = 825
            Top = 662
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect223: TPRRect
            Left = 821
            Top = 640
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_22: TPRLabel
            Left = 825
            Top = 643
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object PRRect224: TPRRect
            Left = 821
            Top = 621
            Width = 123
            Height = 20
            LineStyle = psSolid
          end
          object Fornecedor_Item_7_21: TPRLabel
            Left = 825
            Top = 624
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'XXXXXXXXXXXXXXX'
            Alignment = taRightJustify
          end
          object Titulo: TPRLabel
            Left = 476
            Top = 34
            Width = 341
            Height = 27
            FontName = fnArial
            FontSize = 20.000000000000000000
            FontBold = True
            Caption = 'Tabula'#231'ao de Cota'#231#245'es'
            Alignment = taCenter
          end
          object PRRect225: TPRRect
            Left = 16
            Top = 762
            Width = 74
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel237: TPRLabel
            Left = 24
            Top = 765
            Width = 62
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = 'Observa'#231#227'o'
            Alignment = taRightJustify
          end
          object PRRect226: TPRRect
            Left = 89
            Top = 762
            Width = 856
            Height = 20
            LineStyle = psSolid
          end
          object Observacao_1: TPRLabel
            Left = 93
            Top = 765
            Width = 844
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
          end
          object Entrega_1: TPRText
            Left = 93
            Top = 703
            Width = 115
            Height = 54
            FontName = fnArial
            FontSize = 11.000000000000000000
            Leading = 14.000000000000000000
            WordWrap = True
          end
          object Entrega_2: TPRText
            Left = 215
            Top = 703
            Width = 115
            Height = 54
            FontName = fnArial
            FontSize = 11.000000000000000000
            Leading = 14.000000000000000000
            WordWrap = True
          end
          object Entrega_3: TPRText
            Left = 338
            Top = 703
            Width = 115
            Height = 54
            FontName = fnArial
            FontSize = 11.000000000000000000
            Leading = 14.000000000000000000
            WordWrap = True
          end
          object Entrega_4: TPRText
            Left = 459
            Top = 703
            Width = 115
            Height = 54
            FontName = fnArial
            FontSize = 11.000000000000000000
            Leading = 14.000000000000000000
            WordWrap = True
          end
          object Entrega_5: TPRText
            Left = 581
            Top = 703
            Width = 115
            Height = 54
            FontName = fnArial
            FontSize = 11.000000000000000000
            Leading = 14.000000000000000000
            WordWrap = True
          end
          object Entrega_6: TPRText
            Left = 703
            Top = 703
            Width = 115
            Height = 54
            FontName = fnArial
            FontSize = 11.000000000000000000
            Leading = 14.000000000000000000
            WordWrap = True
          end
          object Entrega_7: TPRText
            Left = 825
            Top = 703
            Width = 115
            Height = 54
            FontName = fnArial
            FontSize = 11.000000000000000000
            Leading = 14.000000000000000000
            WordWrap = True
          end
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 46
    Top = 655
  end
  object PReport1: TPReport
    FileName = 'default.pdf'
    CreationDate = 38548.663816180550000000
    UseOutlines = False
    ViewerPreference = []
    Left = 14
    Top = 655
  end
end
