object CriaPDF02: TCriaPDF02
  Left = 274
  Top = 153
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cria Arquivo PDF'
  ClientHeight = 512
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
    Top = 465
    Width = 1001
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 640
      Top = 14
      Width = 36
      Height = 13
      Caption = 'P'#225'gina:'
    end
    object LBL_Ini: TLabel
      Left = 688
      Top = 14
      Width = 6
      Height = 13
      Caption = '1'
    end
    object Label3: TLabel
      Left = 712
      Top = 14
      Width = 12
      Height = 13
      Caption = 'de'
    end
    object LBL_Fim: TLabel
      Left = 741
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
    object Nro_Requisicao: TEdit
      Left = 94
      Top = 11
      Width = 9
      Height = 21
      TabOrder = 4
      Text = 'Opcao_Anterior'
      Visible = False
    end
    object BT_Retorna: TButton
      Left = 772
      Top = 8
      Width = 28
      Height = 25
      Caption = '<<'
      TabOrder = 5
      OnClick = BT_RetornaClick
    end
    object BT_Avanca: TButton
      Left = 810
      Top = 8
      Width = 28
      Height = 25
      Caption = '>>'
      TabOrder = 6
      OnClick = BT_AvancaClick
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 8
    Width = 1001
    Height = 452
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 986
      Height = 436
      Caption = 'Visualisa'#231#227'o'
      TabOrder = 0
      object Pdf: TPdf
        Left = 3
        Top = 14
        Width = 980
        Height = 418
        TabOrder = 0
        ControlData = {0000050049650000342B00000000000000}
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
          Height = 793
          object PRRect135: TPRRect
            Left = 38
            Top = 191
            Width = 511
            Height = 23
            LineStyle = psSolid
          end
          object PRRect1: TPRRect
            Left = 749
            Top = 62
            Width = 96
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel15: TPRLabel
            Left = 752
            Top = 65
            Width = 90
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'DATA'
            Alignment = taCenter
          end
          object PRRect2: TPRRect
            Left = 844
            Top = 62
            Width = 114
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel16: TPRLabel
            Left = 847
            Top = 65
            Width = 108
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'REQUISI'#199#195'O N'#186
            Alignment = taCenter
          end
          object PRRect4: TPRRect
            Left = 749
            Top = 81
            Width = 96
            Height = 20
            LineStyle = psSolid
          end
          object PRRect5: TPRRect
            Left = 548
            Top = 138
            Width = 410
            Height = 20
            LineStyle = psSolid
          end
          object PRRect6: TPRRect
            Left = 38
            Top = 100
            Width = 511
            Height = 20
            LineStyle = psSolid
          end
          object PRRect7: TPRRect
            Left = 38
            Top = 119
            Width = 511
            Height = 20
            LineStyle = psSolid
          end
          object PRRect8: TPRRect
            Left = 38
            Top = 138
            Width = 511
            Height = 20
            LineStyle = psSolid
          end
          object PRRect11: TPRRect
            Left = 548
            Top = 119
            Width = 410
            Height = 20
            LineStyle = psSolid
          end
          object PRRect12: TPRRect
            Left = 548
            Top = 100
            Width = 410
            Height = 20
            LineStyle = psSolid
          end
          object PRRect13: TPRRect
            Left = 38
            Top = 157
            Width = 920
            Height = 35
            LineStyle = psSolid
          end
          object PRLabel17: TPRLabel
            Left = 44
            Top = 166
            Width = 30
            Height = 15
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Obs:'
          end
          object PRL_Entrega: TPRLabel
            Left = 654
            Top = 122
            Width = 300
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Pagamento: TPRLabel
            Left = 628
            Top = 103
            Width = 326
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Fax: TPRLabel
            Left = 579
            Top = 141
            Width = 374
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Fone_1: TPRLabel
            Left = 85
            Top = 141
            Width = 444
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Contato: TPRLabel
            Left = 141
            Top = 122
            Width = 404
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Nome: TPRLabel
            Left = 101
            Top = 103
            Width = 444
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_OBS1: TPRLabel
            Left = 78
            Top = 159
            Width = 876
            Height = 30
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRRect14: TPRRect
            Left = 95
            Top = 250
            Width = 58
            Height = 23
            LineStyle = psSolid
          end
          object PRRect15: TPRRect
            Left = 200
            Top = 250
            Width = 607
            Height = 23
            LineStyle = psSolid
          end
          object PRRect16: TPRRect
            Left = 806
            Top = 250
            Width = 77
            Height = 23
            LineStyle = psSolid
          end
          object PRRect17: TPRRect
            Left = 882
            Top = 250
            Width = 76
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel1: TPRLabel
            Left = 100
            Top = 254
            Width = 48
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Qtde.'
            Alignment = taCenter
          end
          object PRLabel2: TPRLabel
            Left = 208
            Top = 256
            Width = 596
            Height = 12
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Descri'#231#227'o'
            Alignment = taCenter
          end
          object PRLabel3: TPRLabel
            Left = 809
            Top = 254
            Width = 71
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = 'Equipamento'
            Alignment = taCenter
          end
          object PRLabel4: TPRLabel
            Left = 885
            Top = 254
            Width = 71
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Nro.OS'
            Alignment = taCenter
          end
          object PRL_Data_Requisicao: TPRLabel
            Left = 754
            Top = 84
            Width = 87
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRLabel5: TPRLabel
            Left = 42
            Top = 103
            Width = 55
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Empresa:'
          end
          object PRLabel6: TPRLabel
            Left = 42
            Top = 122
            Width = 100
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Para o Vendedor:'
          end
          object PRLabel7: TPRLabel
            Left = 42
            Top = 141
            Width = 55
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Fone:'
          end
          object PRLabel8: TPRLabel
            Left = 552
            Top = 141
            Width = 55
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Fax:'
          end
          object PRLabel18: TPRLabel
            Left = 552
            Top = 103
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Pagamento:'
          end
          object PRLabel19: TPRLabel
            Left = 552
            Top = 122
            Width = 101
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Prazo de Entrega:'
          end
          object PRL_VlrTotal: TPRLabel
            Left = 811
            Top = 687
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Alignment = taRightJustify
          end
          object PRRect18: TPRRect
            Left = 38
            Top = 250
            Width = 58
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel22: TPRLabel
            Left = 43
            Top = 254
            Width = 48
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Item'
            Alignment = taCenter
          end
          object PRRect19: TPRRect
            Left = 38
            Top = 272
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect20: TPRRect
            Left = 95
            Top = 272
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect21: TPRRect
            Left = 200
            Top = 272
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect23: TPRRect
            Left = 806
            Top = 272
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect24: TPRRect
            Left = 882
            Top = 272
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect25: TPRRect
            Left = 38
            Top = 291
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect26: TPRRect
            Left = 95
            Top = 291
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect27: TPRRect
            Left = 200
            Top = 291
            Width = 607
            Height = 19
            LineStyle = psSolid
          end
          object PRRect28: TPRRect
            Left = 806
            Top = 291
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect29: TPRRect
            Left = 882
            Top = 291
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Item_01: TPRLabel
            Left = 42
            Top = 275
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_01: TPRLabel
            Left = 99
            Top = 275
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Desc_01: TPRLabel
            Left = 208
            Top = 275
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Valor_01: TPRLabel
            Left = 811
            Top = 275
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_01: TPRLabel
            Left = 886
            Top = 275
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect30: TPRRect
            Left = 38
            Top = 309
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect31: TPRRect
            Left = 95
            Top = 309
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect32: TPRRect
            Left = 200
            Top = 309
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect33: TPRRect
            Left = 806
            Top = 309
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect34: TPRRect
            Left = 882
            Top = 309
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect35: TPRRect
            Left = 38
            Top = 328
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect36: TPRRect
            Left = 95
            Top = 328
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect37: TPRRect
            Left = 200
            Top = 328
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect38: TPRRect
            Left = 806
            Top = 328
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect39: TPRRect
            Left = 882
            Top = 328
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect40: TPRRect
            Left = 38
            Top = 347
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect41: TPRRect
            Left = 95
            Top = 347
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect42: TPRRect
            Left = 200
            Top = 347
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect43: TPRRect
            Left = 806
            Top = 347
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect44: TPRRect
            Left = 882
            Top = 347
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect45: TPRRect
            Left = 38
            Top = 366
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect46: TPRRect
            Left = 95
            Top = 366
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect47: TPRRect
            Left = 200
            Top = 366
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect48: TPRRect
            Left = 806
            Top = 366
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect49: TPRRect
            Left = 882
            Top = 366
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect50: TPRRect
            Left = 38
            Top = 385
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect51: TPRRect
            Left = 95
            Top = 385
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect52: TPRRect
            Left = 200
            Top = 385
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect53: TPRRect
            Left = 806
            Top = 385
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect54: TPRRect
            Left = 882
            Top = 385
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect55: TPRRect
            Left = 38
            Top = 404
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect56: TPRRect
            Left = 95
            Top = 404
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect57: TPRRect
            Left = 200
            Top = 404
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect58: TPRRect
            Left = 806
            Top = 404
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect59: TPRRect
            Left = 882
            Top = 404
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect60: TPRRect
            Left = 38
            Top = 423
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect61: TPRRect
            Left = 95
            Top = 423
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect62: TPRRect
            Left = 200
            Top = 423
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect63: TPRRect
            Left = 806
            Top = 423
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect64: TPRRect
            Left = 882
            Top = 423
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect65: TPRRect
            Left = 38
            Top = 442
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect66: TPRRect
            Left = 95
            Top = 442
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect67: TPRRect
            Left = 200
            Top = 442
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect68: TPRRect
            Left = 806
            Top = 442
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect69: TPRRect
            Left = 882
            Top = 442
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect70: TPRRect
            Left = 38
            Top = 461
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect71: TPRRect
            Left = 95
            Top = 461
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect72: TPRRect
            Left = 200
            Top = 461
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect73: TPRRect
            Left = 806
            Top = 461
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect74: TPRRect
            Left = 882
            Top = 461
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect75: TPRRect
            Left = 38
            Top = 480
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect76: TPRRect
            Left = 95
            Top = 480
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect77: TPRRect
            Left = 200
            Top = 480
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect78: TPRRect
            Left = 806
            Top = 480
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect79: TPRRect
            Left = 882
            Top = 480
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect80: TPRRect
            Left = 38
            Top = 499
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect81: TPRRect
            Left = 95
            Top = 499
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect82: TPRRect
            Left = 200
            Top = 499
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect83: TPRRect
            Left = 806
            Top = 499
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect84: TPRRect
            Left = 882
            Top = 499
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect85: TPRRect
            Left = 38
            Top = 518
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect86: TPRRect
            Left = 95
            Top = 518
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect87: TPRRect
            Left = 200
            Top = 518
            Width = 607
            Height = 20
            LineStyle = psSolid
          end
          object PRRect88: TPRRect
            Left = 806
            Top = 518
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect89: TPRRect
            Left = 882
            Top = 518
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect90: TPRRect
            Left = 38
            Top = 537
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect91: TPRRect
            Left = 95
            Top = 537
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect92: TPRRect
            Left = 200
            Top = 537
            Width = 607
            Height = 19
            LineStyle = psSolid
          end
          object PRRect93: TPRRect
            Left = 806
            Top = 537
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect94: TPRRect
            Left = 882
            Top = 537
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect95: TPRRect
            Left = 38
            Top = 555
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect96: TPRRect
            Left = 95
            Top = 555
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect97: TPRRect
            Left = 200
            Top = 555
            Width = 607
            Height = 19
            LineStyle = psSolid
          end
          object PRRect98: TPRRect
            Left = 806
            Top = 555
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect99: TPRRect
            Left = 882
            Top = 555
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect100: TPRRect
            Left = 38
            Top = 573
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect101: TPRRect
            Left = 95
            Top = 573
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect102: TPRRect
            Left = 200
            Top = 573
            Width = 607
            Height = 19
            LineStyle = psSolid
          end
          object PRRect103: TPRRect
            Left = 806
            Top = 573
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect104: TPRRect
            Left = 882
            Top = 573
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect105: TPRRect
            Left = 38
            Top = 591
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect106: TPRRect
            Left = 95
            Top = 591
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect107: TPRRect
            Left = 200
            Top = 591
            Width = 607
            Height = 19
            LineStyle = psSolid
          end
          object PRRect108: TPRRect
            Left = 806
            Top = 591
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect109: TPRRect
            Left = 882
            Top = 591
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect110: TPRRect
            Left = 38
            Top = 609
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect111: TPRRect
            Left = 95
            Top = 609
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect112: TPRRect
            Left = 200
            Top = 609
            Width = 607
            Height = 19
            LineStyle = psSolid
          end
          object PRRect113: TPRRect
            Left = 806
            Top = 609
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect114: TPRRect
            Left = 882
            Top = 609
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect115: TPRRect
            Left = 38
            Top = 627
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect116: TPRRect
            Left = 95
            Top = 627
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect117: TPRRect
            Left = 200
            Top = 627
            Width = 607
            Height = 19
            LineStyle = psSolid
          end
          object PRRect118: TPRRect
            Left = 806
            Top = 627
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect119: TPRRect
            Left = 882
            Top = 627
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect120: TPRRect
            Left = 38
            Top = 645
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect121: TPRRect
            Left = 95
            Top = 645
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect122: TPRRect
            Left = 200
            Top = 645
            Width = 607
            Height = 19
            LineStyle = psSolid
          end
          object PRRect123: TPRRect
            Left = 806
            Top = 645
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect124: TPRRect
            Left = 882
            Top = 645
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect125: TPRRect
            Left = 38
            Top = 663
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect126: TPRRect
            Left = 95
            Top = 663
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect127: TPRRect
            Left = 200
            Top = 663
            Width = 607
            Height = 19
            LineStyle = psSolid
          end
          object PRRect128: TPRRect
            Left = 806
            Top = 663
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect129: TPRRect
            Left = 882
            Top = 663
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Item_02: TPRLabel
            Left = 42
            Top = 293
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_03: TPRLabel
            Left = 42
            Top = 312
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_04: TPRLabel
            Left = 42
            Top = 331
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_05: TPRLabel
            Left = 42
            Top = 350
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_06: TPRLabel
            Left = 42
            Top = 369
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_07: TPRLabel
            Left = 42
            Top = 388
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_08: TPRLabel
            Left = 42
            Top = 407
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_09: TPRLabel
            Left = 42
            Top = 426
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_10: TPRLabel
            Left = 42
            Top = 445
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_11: TPRLabel
            Left = 42
            Top = 464
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_12: TPRLabel
            Left = 42
            Top = 483
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_14: TPRLabel
            Left = 42
            Top = 521
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_15: TPRLabel
            Left = 42
            Top = 539
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_16: TPRLabel
            Left = 42
            Top = 557
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_17: TPRLabel
            Left = 42
            Top = 575
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_18: TPRLabel
            Left = 42
            Top = 593
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_19: TPRLabel
            Left = 42
            Top = 611
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_20: TPRLabel
            Left = 42
            Top = 629
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_21: TPRLabel
            Left = 42
            Top = 647
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_22: TPRLabel
            Left = 42
            Top = 665
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_13: TPRLabel
            Left = 42
            Top = 502
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_02: TPRLabel
            Left = 99
            Top = 293
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_03: TPRLabel
            Left = 99
            Top = 312
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_04: TPRLabel
            Left = 99
            Top = 331
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_05: TPRLabel
            Left = 99
            Top = 350
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_06: TPRLabel
            Left = 99
            Top = 369
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_07: TPRLabel
            Left = 99
            Top = 388
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_08: TPRLabel
            Left = 99
            Top = 407
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_09: TPRLabel
            Left = 99
            Top = 426
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_10: TPRLabel
            Left = 99
            Top = 445
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_11: TPRLabel
            Left = 99
            Top = 464
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_12: TPRLabel
            Left = 99
            Top = 483
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_13: TPRLabel
            Left = 99
            Top = 502
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_14: TPRLabel
            Left = 99
            Top = 521
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_15: TPRLabel
            Left = 99
            Top = 539
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_16: TPRLabel
            Left = 99
            Top = 557
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_17: TPRLabel
            Left = 99
            Top = 575
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_18: TPRLabel
            Left = 99
            Top = 593
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_19: TPRLabel
            Left = 99
            Top = 611
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_20: TPRLabel
            Left = 99
            Top = 629
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_21: TPRLabel
            Left = 99
            Top = 647
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_22: TPRLabel
            Left = 99
            Top = 665
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Desc_02: TPRLabel
            Left = 208
            Top = 293
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_03: TPRLabel
            Left = 208
            Top = 312
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_04: TPRLabel
            Left = 208
            Top = 331
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_05: TPRLabel
            Left = 208
            Top = 350
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_06: TPRLabel
            Left = 208
            Top = 369
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_07: TPRLabel
            Left = 208
            Top = 388
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_08: TPRLabel
            Left = 208
            Top = 407
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_09: TPRLabel
            Left = 208
            Top = 426
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_10: TPRLabel
            Left = 208
            Top = 445
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_11: TPRLabel
            Left = 208
            Top = 464
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_12: TPRLabel
            Left = 208
            Top = 483
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_13: TPRLabel
            Left = 208
            Top = 502
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_14: TPRLabel
            Left = 208
            Top = 521
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_15: TPRLabel
            Left = 208
            Top = 539
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_16: TPRLabel
            Left = 208
            Top = 557
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_17: TPRLabel
            Left = 208
            Top = 575
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_18: TPRLabel
            Left = 208
            Top = 593
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_19: TPRLabel
            Left = 208
            Top = 611
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_20: TPRLabel
            Left = 208
            Top = 629
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_21: TPRLabel
            Left = 208
            Top = 647
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_22: TPRLabel
            Left = 208
            Top = 665
            Width = 596
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Valor_02: TPRLabel
            Left = 811
            Top = 293
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_03: TPRLabel
            Left = 811
            Top = 312
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_04: TPRLabel
            Left = 811
            Top = 331
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_05: TPRLabel
            Left = 811
            Top = 350
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_06: TPRLabel
            Left = 811
            Top = 369
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_07: TPRLabel
            Left = 811
            Top = 388
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_08: TPRLabel
            Left = 811
            Top = 407
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_09: TPRLabel
            Left = 811
            Top = 426
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_10: TPRLabel
            Left = 811
            Top = 445
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_11: TPRLabel
            Left = 811
            Top = 464
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_12: TPRLabel
            Left = 811
            Top = 483
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_13: TPRLabel
            Left = 811
            Top = 502
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_14: TPRLabel
            Left = 811
            Top = 521
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_15: TPRLabel
            Left = 811
            Top = 539
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_16: TPRLabel
            Left = 811
            Top = 557
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_17: TPRLabel
            Left = 811
            Top = 575
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_18: TPRLabel
            Left = 811
            Top = 593
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_19: TPRLabel
            Left = 811
            Top = 611
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_20: TPRLabel
            Left = 811
            Top = 629
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_21: TPRLabel
            Left = 811
            Top = 647
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Valor_22: TPRLabel
            Left = 811
            Top = 665
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_02: TPRLabel
            Left = 886
            Top = 293
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_03: TPRLabel
            Left = 886
            Top = 312
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_04: TPRLabel
            Left = 886
            Top = 331
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_05: TPRLabel
            Left = 886
            Top = 350
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_06: TPRLabel
            Left = 886
            Top = 369
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_07: TPRLabel
            Left = 886
            Top = 388
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_08: TPRLabel
            Left = 886
            Top = 407
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_09: TPRLabel
            Left = 886
            Top = 426
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_10: TPRLabel
            Left = 886
            Top = 445
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_11: TPRLabel
            Left = 886
            Top = 464
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_12: TPRLabel
            Left = 886
            Top = 483
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_13: TPRLabel
            Left = 886
            Top = 502
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_14: TPRLabel
            Left = 886
            Top = 521
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_15: TPRLabel
            Left = 886
            Top = 539
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_16: TPRLabel
            Left = 886
            Top = 557
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_17: TPRLabel
            Left = 886
            Top = 575
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_18: TPRLabel
            Left = 886
            Top = 593
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_19: TPRLabel
            Left = 886
            Top = 611
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_22: TPRLabel
            Left = 886
            Top = 665
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_20: TPRLabel
            Left = 886
            Top = 629
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_IPI_21: TPRLabel
            Left = 886
            Top = 647
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRLabel24: TPRLabel
            Left = 301
            Top = 70
            Width = 385
            Height = 22
            FontName = fnArial
            FontSize = 20.000000000000000000
            FontBold = True
            Caption = 'AT. Departamento de Compras'
            Alignment = taCenter
          end
          object PRL_VlrIPI: TPRLabel
            Left = 886
            Top = 687
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Alignment = taRightJustify
          end
          object PRRect132: TPRRect
            Left = 40
            Top = 716
            Width = 920
            Height = 2
            LineStyle = psSolid
          end
          object PRL_Paginacao: TPRLabel
            Left = 751
            Top = 46
            Width = 204
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'P'#193'GINA 1 DE 1'
            Alignment = taCenter
          end
          object PRRect3: TPRRect
            Left = 844
            Top = 81
            Width = 114
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Requisicao_Nro: TPRLabel
            Left = 847
            Top = 84
            Width = 108
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect9: TPRRect
            Left = 548
            Top = 191
            Width = 77
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel20: TPRLabel
            Left = 551
            Top = 195
            Width = 71
            Height = 14
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = 'Equipamento'
            Alignment = taCenter
          end
          object PRRect10: TPRRect
            Left = 756
            Top = 191
            Width = 76
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel21: TPRLabel
            Left = 759
            Top = 195
            Width = 71
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Nro.OS'
            Alignment = taCenter
          end
          object PRRect133: TPRRect
            Left = 624
            Top = 191
            Width = 133
            Height = 23
            LineStyle = psSolid
          end
          object PRRect134: TPRRect
            Left = 831
            Top = 191
            Width = 127
            Height = 23
            LineStyle = psSolid
          end
          object PRL_Equipamento: TPRLabel
            Left = 628
            Top = 195
            Width = 126
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_OS: TPRLabel
            Left = 836
            Top = 195
            Width = 118
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRLabel23: TPRLabel
            Left = 42
            Top = 196
            Width = 99
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Centro de Custo:'
          end
          object PRL_Centro: TPRLabel
            Left = 142
            Top = 196
            Width = 402
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object Empresa_01: TPRLabel
            Left = 37
            Top = 7
            Width = 388
            Height = 58
            FontName = fnArial
            FontSize = 50.000000000000000000
            FontBold = True
            Caption = 'IBRASMAK'
          end
          object Empresa_02: TPRLabel
            Left = 461
            Top = 19
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
          end
          object Endereco_01: TPRLabel
            Left = 38
            Top = 721
            Width = 385
            Height = 12
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = 'IBRASMAK IND. BRASILEIRA DE M'#193'QUINAS LTDA'
          end
          object Endereco_02: TPRLabel
            Left = 38
            Top = 734
            Width = 385
            Height = 12
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 
              'CNPJ: 47.139.456/0001-09                      IE: 581.034.396.11' +
              '9'
          end
          object Endereco_03: TPRLabel
            Left = 38
            Top = 747
            Width = 471
            Height = 12
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 
              'ESTRADA DE SAPOPEMBA, 159 KM 45 - CEP 09432-300 -  RIBEIR'#195'O PIRE' +
              'S - SP'
          end
          object Endereco_04: TPRLabel
            Left = 38
            Top = 761
            Width = 385
            Height = 12
            FontName = fnArial
            FontSize = 11.000000000000000000
            Caption = 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700'
          end
          object Endereco_05: TPRLabel
            Left = 38
            Top = 773
            Width = 385
            Height = 12
            FontName = fnArial
            FontSize = 11.000000000000000000
            FontBold = True
            Caption = 'e-mail: compras@ibrasmak.com.br'
            Alignment = taCenter
          end
          object PRRect22: TPRRect
            Left = 152
            Top = 250
            Width = 49
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel9: TPRLabel
            Left = 156
            Top = 254
            Width = 39
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Unid.'
            Alignment = taCenter
          end
          object PRRect130: TPRRect
            Left = 152
            Top = 272
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_01: TPRLabel
            Left = 156
            Top = 275
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect131: TPRRect
            Left = 152
            Top = 291
            Width = 49
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Unid_02: TPRLabel
            Left = 156
            Top = 294
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect136: TPRRect
            Left = 152
            Top = 309
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_03: TPRLabel
            Left = 156
            Top = 312
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect137: TPRRect
            Left = 152
            Top = 328
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_04: TPRLabel
            Left = 156
            Top = 331
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect138: TPRRect
            Left = 152
            Top = 347
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_05: TPRLabel
            Left = 156
            Top = 350
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect139: TPRRect
            Left = 152
            Top = 366
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_06: TPRLabel
            Left = 156
            Top = 369
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect140: TPRRect
            Left = 152
            Top = 385
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_07: TPRLabel
            Left = 156
            Top = 388
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect141: TPRRect
            Left = 152
            Top = 404
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_08: TPRLabel
            Left = 156
            Top = 407
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect142: TPRRect
            Left = 152
            Top = 423
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_09: TPRLabel
            Left = 156
            Top = 426
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect143: TPRRect
            Left = 152
            Top = 442
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_10: TPRLabel
            Left = 156
            Top = 445
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect144: TPRRect
            Left = 152
            Top = 461
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_11: TPRLabel
            Left = 156
            Top = 464
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect145: TPRRect
            Left = 152
            Top = 480
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_12: TPRLabel
            Left = 156
            Top = 483
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect146: TPRRect
            Left = 152
            Top = 499
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_13: TPRLabel
            Left = 156
            Top = 502
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect147: TPRRect
            Left = 152
            Top = 518
            Width = 49
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_14: TPRLabel
            Left = 156
            Top = 521
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect148: TPRRect
            Left = 152
            Top = 537
            Width = 49
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Unid_15: TPRLabel
            Left = 156
            Top = 539
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect149: TPRRect
            Left = 152
            Top = 555
            Width = 49
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Unid_16: TPRLabel
            Left = 156
            Top = 558
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect150: TPRRect
            Left = 152
            Top = 573
            Width = 49
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Unid_17: TPRLabel
            Left = 156
            Top = 576
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect151: TPRRect
            Left = 152
            Top = 591
            Width = 49
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Unid_18: TPRLabel
            Left = 156
            Top = 594
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect152: TPRRect
            Left = 152
            Top = 609
            Width = 49
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Unid_19: TPRLabel
            Left = 156
            Top = 612
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect153: TPRRect
            Left = 152
            Top = 627
            Width = 49
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Unid_20: TPRLabel
            Left = 156
            Top = 630
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect154: TPRRect
            Left = 152
            Top = 645
            Width = 49
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Unid_21: TPRLabel
            Left = 156
            Top = 648
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect155: TPRRect
            Left = 152
            Top = 663
            Width = 49
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Unid_22: TPRLabel
            Left = 156
            Top = 666
            Width = 40
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect156: TPRRect
            Left = 38
            Top = 213
            Width = 511
            Height = 23
            LineStyle = psSolid
          end
          object PRRect157: TPRRect
            Left = 548
            Top = 213
            Width = 410
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel10: TPRLabel
            Left = 42
            Top = 218
            Width = 79
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Requisitante:'
          end
          object PRLabel11: TPRLabel
            Left = 554
            Top = 218
            Width = 71
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'Solicitante:'
          end
          object PRL_Requisitante: TPRLabel
            Left = 123
            Top = 218
            Width = 417
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Solicitante: TPRLabel
            Left = 624
            Top = 218
            Width = 329
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 46
    Top = 472
  end
  object PReport1: TPReport
    FileName = 'default.pdf'
    CreationDate = 38548.663816180550000000
    UseOutlines = False
    ViewerPreference = []
    Left = 14
    Top = 472
  end
end
