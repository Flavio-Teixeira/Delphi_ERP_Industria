object CriaOCPDF: TCriaOCPDF
  Left = 244
  Top = 46
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
      Visible = False
    end
    object Cliente_Email: TEdit
      Left = 82
      Top = 11
      Width = 9
      Height = 21
      TabOrder = 3
      Visible = False
    end
    object Nro_Ordem: TEdit
      Left = 94
      Top = 11
      Width = 9
      Height = 21
      TabOrder = 4
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
    object Valor_Total: TEdit
      Left = 106
      Top = 11
      Width = 9
      Height = 21
      TabOrder = 7
      Text = '0'
      Visible = False
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
        Top = 0
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
          object PRRect1: TPRRect
            Left = 741
            Top = 44
            Width = 96
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel15: TPRLabel
            Left = 744
            Top = 47
            Width = 90
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'DATA'
            Alignment = taCenter
          end
          object PRRect2: TPRRect
            Left = 836
            Top = 44
            Width = 114
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel16: TPRLabel
            Left = 839
            Top = 47
            Width = 108
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'O.C.    N'#186
            Alignment = taCenter
          end
          object PRRect3: TPRRect
            Left = 836
            Top = 63
            Width = 114
            Height = 20
            LineStyle = psSolid
          end
          object PRRect4: TPRRect
            Left = 741
            Top = 63
            Width = 96
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Ordem_Nro: TPRLabel
            Left = 839
            Top = 66
            Width = 108
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Entrega: TPRLabel
            Left = 739
            Top = 122
            Width = 140
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Pagamento: TPRLabel
            Left = 739
            Top = 140
            Width = 140
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Fax: TPRLabel
            Left = 598
            Top = 235
            Width = 362
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Fone_1: TPRLabel
            Left = 598
            Top = 217
            Width = 362
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Contato: TPRLabel
            Left = 126
            Top = 217
            Width = 395
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Nome: TPRLabel
            Left = 126
            Top = 179
            Width = 643
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRRect14: TPRRect
            Left = 39
            Top = 338
            Width = 58
            Height = 39
            LineStyle = psSolid
          end
          object PRRect15: TPRRect
            Left = 134
            Top = 338
            Width = 531
            Height = 39
            LineStyle = psSolid
          end
          object PRRect16: TPRRect
            Left = 736
            Top = 357
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect17: TPRRect
            Left = 802
            Top = 357
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel1: TPRLabel
            Left = 44
            Top = 351
            Width = 48
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Qtde.'
            Alignment = taCenter
          end
          object PRLabel2: TPRLabel
            Left = 139
            Top = 351
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Descri'#231#227'o dos Materiais'
            Alignment = taCenter
          end
          object PRLabel3: TPRLabel
            Left = 739
            Top = 360
            Width = 64
            Height = 14
            FontName = fnArial
            FontSize = 10.000000000000000000
            Caption = 'Unit'#225'rio(R$)'
            Alignment = taCenter
          end
          object PRLabel4: TPRLabel
            Left = 807
            Top = 360
            Width = 55
            Height = 14
            FontName = fnArial
            FontSize = 10.000000000000000000
            Caption = 'Total (R$)'
            Alignment = taCenter
          end
          object PRL_Data_Cotacao: TPRLabel
            Left = 746
            Top = 66
            Width = 87
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRLabel5: TPRLabel
            Left = 16
            Top = 179
            Width = 96
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'FORNECEDOR:'
            Alignment = taRightJustify
          end
          object PRLabel6: TPRLabel
            Left = 32
            Top = 235
            Width = 80
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'VENDEDOR:'
            Alignment = taRightJustify
          end
          object PRLabel7: TPRLabel
            Left = 544
            Top = 217
            Width = 50
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'FONE:'
            Alignment = taRightJustify
          end
          object PRLabel8: TPRLabel
            Left = 544
            Top = 235
            Width = 50
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'FAX:'
            Alignment = taRightJustify
          end
          object PRLabel18: TPRLabel
            Left = 549
            Top = 140
            Width = 181
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'CONDI'#199#213'ES DE PAGAMENTO:'
            Alignment = taRightJustify
          end
          object PRLabel19: TPRLabel
            Left = 549
            Top = 122
            Width = 181
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'PRAZO DE ENTREGA:'
            Alignment = taRightJustify
          end
          object PRRect22: TPRRect
            Left = 736
            Top = 659
            Width = 130
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel9: TPRLabel
            Left = 739
            Top = 664
            Width = 38
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'SOMA'
          end
          object PRL_VlrTotal: TPRLabel
            Left = 806
            Top = 664
            Width = 55
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect18: TPRRect
            Left = 11
            Top = 338
            Width = 29
            Height = 39
            LineStyle = psSolid
          end
          object PRLabel22: TPRLabel
            Left = 14
            Top = 351
            Width = 23
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Item'
            Alignment = taCenter
          end
          object PRRect19: TPRRect
            Left = 11
            Top = 376
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect20: TPRRect
            Left = 39
            Top = 376
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect21: TPRRect
            Left = 134
            Top = 376
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect23: TPRRect
            Left = 736
            Top = 376
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect24: TPRRect
            Left = 802
            Top = 376
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect25: TPRRect
            Left = 11
            Top = 395
            Width = 29
            Height = 19
            LineStyle = psSolid
          end
          object PRRect26: TPRRect
            Left = 39
            Top = 395
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect27: TPRRect
            Left = 134
            Top = 395
            Width = 531
            Height = 19
            LineStyle = psSolid
          end
          object PRRect28: TPRRect
            Left = 736
            Top = 395
            Width = 67
            Height = 19
            LineStyle = psSolid
          end
          object PRRect29: TPRRect
            Left = 802
            Top = 395
            Width = 64
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Item_01: TPRLabel
            Left = 15
            Top = 379
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_01: TPRLabel
            Left = 43
            Top = 379
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Desc_01: TPRLabel
            Left = 140
            Top = 379
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Unit_01: TPRLabel
            Left = 741
            Top = 379
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_01: TPRLabel
            Left = 807
            Top = 379
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRLabel23: TPRLabel
            Left = 27
            Top = 665
            Width = 103
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Atenciosamente,'
          end
          object PRL_Funcionario: TPRLabel
            Left = 26
            Top = 683
            Width = 378
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRLabel25: TPRLabel
            Left = 153
            Top = 683
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = '- Depto. de Compras'
          end
          object PRRect30: TPRRect
            Left = 11
            Top = 413
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect31: TPRRect
            Left = 39
            Top = 413
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect32: TPRRect
            Left = 134
            Top = 413
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect33: TPRRect
            Left = 736
            Top = 413
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect34: TPRRect
            Left = 802
            Top = 413
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect35: TPRRect
            Left = 11
            Top = 432
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect36: TPRRect
            Left = 39
            Top = 432
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect37: TPRRect
            Left = 134
            Top = 432
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect38: TPRRect
            Left = 736
            Top = 432
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect39: TPRRect
            Left = 802
            Top = 432
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect40: TPRRect
            Left = 11
            Top = 451
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect41: TPRRect
            Left = 39
            Top = 451
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect42: TPRRect
            Left = 134
            Top = 451
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect43: TPRRect
            Left = 736
            Top = 451
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect44: TPRRect
            Left = 802
            Top = 451
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect45: TPRRect
            Left = 11
            Top = 470
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect46: TPRRect
            Left = 39
            Top = 470
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect47: TPRRect
            Left = 134
            Top = 470
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect48: TPRRect
            Left = 736
            Top = 470
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect49: TPRRect
            Left = 802
            Top = 470
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect50: TPRRect
            Left = 11
            Top = 489
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect51: TPRRect
            Left = 39
            Top = 489
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect52: TPRRect
            Left = 134
            Top = 489
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect53: TPRRect
            Left = 736
            Top = 489
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect54: TPRRect
            Left = 802
            Top = 489
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect55: TPRRect
            Left = 11
            Top = 508
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect56: TPRRect
            Left = 39
            Top = 508
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect57: TPRRect
            Left = 134
            Top = 508
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect58: TPRRect
            Left = 736
            Top = 508
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect59: TPRRect
            Left = 802
            Top = 508
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect60: TPRRect
            Left = 11
            Top = 527
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect61: TPRRect
            Left = 39
            Top = 527
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect62: TPRRect
            Left = 134
            Top = 527
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect63: TPRRect
            Left = 736
            Top = 527
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect64: TPRRect
            Left = 802
            Top = 527
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect65: TPRRect
            Left = 11
            Top = 546
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect66: TPRRect
            Left = 39
            Top = 546
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect67: TPRRect
            Left = 134
            Top = 546
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect68: TPRRect
            Left = 736
            Top = 546
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect69: TPRRect
            Left = 802
            Top = 546
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect70: TPRRect
            Left = 11
            Top = 565
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect71: TPRRect
            Left = 39
            Top = 565
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect72: TPRRect
            Left = 134
            Top = 565
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect73: TPRRect
            Left = 736
            Top = 565
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect74: TPRRect
            Left = 802
            Top = 565
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect75: TPRRect
            Left = 11
            Top = 584
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect76: TPRRect
            Left = 39
            Top = 584
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect77: TPRRect
            Left = 134
            Top = 584
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect78: TPRRect
            Left = 736
            Top = 584
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect79: TPRRect
            Left = 802
            Top = 584
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect80: TPRRect
            Left = 11
            Top = 603
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect81: TPRRect
            Left = 39
            Top = 603
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect82: TPRRect
            Left = 134
            Top = 603
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect83: TPRRect
            Left = 736
            Top = 603
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect84: TPRRect
            Left = 802
            Top = 603
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect85: TPRRect
            Left = 11
            Top = 622
            Width = 29
            Height = 20
            LineStyle = psSolid
          end
          object PRRect86: TPRRect
            Left = 39
            Top = 622
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect87: TPRRect
            Left = 134
            Top = 622
            Width = 531
            Height = 20
            LineStyle = psSolid
          end
          object PRRect88: TPRRect
            Left = 736
            Top = 622
            Width = 67
            Height = 20
            LineStyle = psSolid
          end
          object PRRect89: TPRRect
            Left = 802
            Top = 622
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect90: TPRRect
            Left = 11
            Top = 641
            Width = 29
            Height = 19
            LineStyle = psSolid
          end
          object PRRect91: TPRRect
            Left = 39
            Top = 641
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect92: TPRRect
            Left = 134
            Top = 641
            Width = 531
            Height = 19
            LineStyle = psSolid
          end
          object PRRect93: TPRRect
            Left = 736
            Top = 641
            Width = 67
            Height = 19
            LineStyle = psSolid
          end
          object PRRect94: TPRRect
            Left = 802
            Top = 641
            Width = 64
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Item_02: TPRLabel
            Left = 15
            Top = 397
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_03: TPRLabel
            Left = 15
            Top = 416
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_04: TPRLabel
            Left = 15
            Top = 435
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_05: TPRLabel
            Left = 15
            Top = 454
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_06: TPRLabel
            Left = 15
            Top = 473
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_07: TPRLabel
            Left = 15
            Top = 492
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_08: TPRLabel
            Left = 15
            Top = 511
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_09: TPRLabel
            Left = 15
            Top = 530
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_10: TPRLabel
            Left = 15
            Top = 549
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_11: TPRLabel
            Left = 15
            Top = 568
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_12: TPRLabel
            Left = 15
            Top = 587
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_14: TPRLabel
            Left = 15
            Top = 625
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_15: TPRLabel
            Left = 15
            Top = 643
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_13: TPRLabel
            Left = 15
            Top = 606
            Width = 22
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_02: TPRLabel
            Left = 43
            Top = 397
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_03: TPRLabel
            Left = 43
            Top = 416
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_04: TPRLabel
            Left = 43
            Top = 435
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_05: TPRLabel
            Left = 43
            Top = 454
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_06: TPRLabel
            Left = 43
            Top = 473
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_07: TPRLabel
            Left = 43
            Top = 492
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_08: TPRLabel
            Left = 43
            Top = 511
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_09: TPRLabel
            Left = 43
            Top = 530
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_10: TPRLabel
            Left = 43
            Top = 549
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_11: TPRLabel
            Left = 43
            Top = 568
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_12: TPRLabel
            Left = 43
            Top = 587
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_13: TPRLabel
            Left = 43
            Top = 606
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_14: TPRLabel
            Left = 43
            Top = 625
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_15: TPRLabel
            Left = 43
            Top = 643
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Desc_02: TPRLabel
            Left = 140
            Top = 397
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_03: TPRLabel
            Left = 140
            Top = 416
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_04: TPRLabel
            Left = 140
            Top = 435
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_05: TPRLabel
            Left = 140
            Top = 454
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_06: TPRLabel
            Left = 140
            Top = 473
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_07: TPRLabel
            Left = 140
            Top = 492
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_08: TPRLabel
            Left = 140
            Top = 511
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_09: TPRLabel
            Left = 140
            Top = 530
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_10: TPRLabel
            Left = 140
            Top = 549
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_11: TPRLabel
            Left = 140
            Top = 568
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_12: TPRLabel
            Left = 140
            Top = 587
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_13: TPRLabel
            Left = 140
            Top = 606
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_14: TPRLabel
            Left = 140
            Top = 625
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_15: TPRLabel
            Left = 140
            Top = 643
            Width = 520
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Unit_02: TPRLabel
            Left = 741
            Top = 397
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_03: TPRLabel
            Left = 741
            Top = 416
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_04: TPRLabel
            Left = 741
            Top = 435
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_05: TPRLabel
            Left = 741
            Top = 454
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_06: TPRLabel
            Left = 741
            Top = 473
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_07: TPRLabel
            Left = 741
            Top = 492
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_08: TPRLabel
            Left = 741
            Top = 511
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_09: TPRLabel
            Left = 741
            Top = 530
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_10: TPRLabel
            Left = 741
            Top = 549
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_11: TPRLabel
            Left = 741
            Top = 568
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_12: TPRLabel
            Left = 741
            Top = 587
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_13: TPRLabel
            Left = 741
            Top = 606
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_14: TPRLabel
            Left = 741
            Top = 625
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_15: TPRLabel
            Left = 741
            Top = 643
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_02: TPRLabel
            Left = 807
            Top = 397
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_03: TPRLabel
            Left = 807
            Top = 416
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_04: TPRLabel
            Left = 807
            Top = 435
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_05: TPRLabel
            Left = 807
            Top = 454
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_06: TPRLabel
            Left = 807
            Top = 473
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_07: TPRLabel
            Left = 807
            Top = 492
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_08: TPRLabel
            Left = 807
            Top = 511
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_09: TPRLabel
            Left = 807
            Top = 530
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_10: TPRLabel
            Left = 807
            Top = 549
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_11: TPRLabel
            Left = 807
            Top = 568
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_12: TPRLabel
            Left = 807
            Top = 587
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_13: TPRLabel
            Left = 807
            Top = 606
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_14: TPRLabel
            Left = 807
            Top = 625
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_15: TPRLabel
            Left = 807
            Top = 643
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRLabel24: TPRLabel
            Left = 448
            Top = 45
            Width = 262
            Height = 31
            FontName = fnArial
            FontSize = 25.000000000000000000
            FontBold = True
            Caption = 'ORDEM DE COMPRA'
            Alignment = taCenter
          end
          object PRRect130: TPRRect
            Left = 865
            Top = 659
            Width = 98
            Height = 23
            LineStyle = psSolid
          end
          object PRL_VlrIPI: TPRLabel
            Left = 902
            Top = 664
            Width = 57
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRLabel28: TPRLabel
            Left = 671
            Top = 715
            Width = 291
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Autoriza'#231#227'o _________________________________'
          end
          object PRLabel30: TPRLabel
            Left = 10
            Top = 698
            Width = 559
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 
              '1 - O n'#250'mero desta Ordem de Compra dever'#225' ser indicado na Nota F' +
              'iscal'
          end
          object PRLabel31: TPRLabel
            Left = 10
            Top = 712
            Width = 639
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 
              '2 - N'#227'o ser'#227'o aceitas modifica'#231#245'es nas especifica'#231#245'es dos materi' +
              'ais, condi'#231#245'es, prazo e pre'#231'os indicados nesta O.C.'
          end
          object PRLabel32: TPRLabel
            Left = 10
            Top = 726
            Width = 643
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 
              '3 - O n'#227'o cumprimento do prazo de entrega poder'#225' implicar no can' +
              'celamento desta Ordem de Compra.'
          end
          object PRRect131: TPRRect
            Left = 96
            Top = 338
            Width = 39
            Height = 39
            LineStyle = psSolid
          end
          object PRLabel33: TPRLabel
            Left = 101
            Top = 351
            Width = 29
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Unid.'
            Alignment = taCenter
          end
          object PRRect132: TPRRect
            Left = 96
            Top = 376
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect133: TPRRect
            Left = 96
            Top = 395
            Width = 39
            Height = 19
            LineStyle = psSolid
          end
          object PRRect134: TPRRect
            Left = 96
            Top = 413
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect135: TPRRect
            Left = 96
            Top = 451
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect136: TPRRect
            Left = 96
            Top = 470
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect137: TPRRect
            Left = 96
            Top = 489
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect138: TPRRect
            Left = 96
            Top = 508
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect139: TPRRect
            Left = 96
            Top = 527
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect140: TPRRect
            Left = 96
            Top = 546
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect141: TPRRect
            Left = 96
            Top = 565
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect142: TPRRect
            Left = 96
            Top = 584
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect143: TPRRect
            Left = 96
            Top = 603
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect144: TPRRect
            Left = 96
            Top = 622
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRRect145: TPRRect
            Left = 96
            Top = 641
            Width = 39
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Unid_15: TPRLabel
            Left = 100
            Top = 643
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_14: TPRLabel
            Left = 100
            Top = 625
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_13: TPRLabel
            Left = 100
            Top = 606
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_12: TPRLabel
            Left = 100
            Top = 587
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_11: TPRLabel
            Left = 100
            Top = 568
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_10: TPRLabel
            Left = 100
            Top = 549
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_09: TPRLabel
            Left = 100
            Top = 530
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_08: TPRLabel
            Left = 100
            Top = 511
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_07: TPRLabel
            Left = 100
            Top = 492
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_06: TPRLabel
            Left = 100
            Top = 473
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_05: TPRLabel
            Left = 100
            Top = 454
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRLabel52: TPRLabel
            Left = 110
            Top = 435
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect153: TPRRect
            Left = 96
            Top = 432
            Width = 39
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Unid_03: TPRLabel
            Left = 100
            Top = 416
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_02: TPRLabel
            Left = 100
            Top = 397
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_01: TPRLabel
            Left = 100
            Top = 379
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Unid_04: TPRLabel
            Left = 101
            Top = 435
            Width = 30
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect164: TPRRect
            Left = 736
            Top = 338
            Width = 130
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel35: TPRLabel
            Left = 739
            Top = 341
            Width = 124
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Pre'#231'o'
            Alignment = taCenter
          end
          object PRRect177: TPRRect
            Left = 865
            Top = 338
            Width = 98
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel36: TPRLabel
            Left = 870
            Top = 341
            Width = 87
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'IPI'
            Alignment = taCenter
          end
          object PRRect178: TPRRect
            Left = 899
            Top = 357
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect179: TPRRect
            Left = 899
            Top = 376
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect180: TPRRect
            Left = 899
            Top = 395
            Width = 64
            Height = 19
            LineStyle = psSolid
          end
          object PRRect181: TPRRect
            Left = 899
            Top = 413
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect182: TPRRect
            Left = 899
            Top = 432
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect183: TPRRect
            Left = 899
            Top = 451
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect184: TPRRect
            Left = 899
            Top = 470
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect185: TPRRect
            Left = 899
            Top = 489
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect186: TPRRect
            Left = 899
            Top = 508
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect187: TPRRect
            Left = 899
            Top = 527
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect188: TPRRect
            Left = 899
            Top = 546
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect189: TPRRect
            Left = 899
            Top = 565
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect190: TPRRect
            Left = 899
            Top = 584
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect191: TPRRect
            Left = 899
            Top = 603
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect192: TPRRect
            Left = 899
            Top = 622
            Width = 64
            Height = 20
            LineStyle = psSolid
          end
          object PRRect193: TPRRect
            Left = 899
            Top = 641
            Width = 64
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Imp_15: TPRLabel
            Left = 904
            Top = 643
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_14: TPRLabel
            Left = 904
            Top = 625
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_13: TPRLabel
            Left = 904
            Top = 606
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_12: TPRLabel
            Left = 904
            Top = 587
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_11: TPRLabel
            Left = 904
            Top = 568
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_10: TPRLabel
            Left = 904
            Top = 549
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_09: TPRLabel
            Left = 904
            Top = 530
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_08: TPRLabel
            Left = 904
            Top = 511
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_07: TPRLabel
            Left = 904
            Top = 492
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_06: TPRLabel
            Left = 904
            Top = 473
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_05: TPRLabel
            Left = 904
            Top = 454
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_04: TPRLabel
            Left = 904
            Top = 435
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_03: TPRLabel
            Left = 904
            Top = 416
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_02: TPRLabel
            Left = 904
            Top = 397
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Imp_01: TPRLabel
            Left = 904
            Top = 379
            Width = 56
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRLabel64: TPRLabel
            Left = 904
            Top = 360
            Width = 55
            Height = 14
            FontName = fnArial
            FontSize = 10.000000000000000000
            Caption = 'Imposto(R$)'
            Alignment = taCenter
          end
          object PRRect201: TPRRect
            Left = 865
            Top = 357
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect202: TPRRect
            Left = 865
            Top = 376
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect203: TPRRect
            Left = 865
            Top = 395
            Width = 35
            Height = 19
            LineStyle = psSolid
          end
          object PRRect204: TPRRect
            Left = 865
            Top = 413
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect205: TPRRect
            Left = 865
            Top = 432
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect206: TPRRect
            Left = 865
            Top = 451
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect207: TPRRect
            Left = 865
            Top = 470
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect208: TPRRect
            Left = 865
            Top = 489
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect209: TPRRect
            Left = 865
            Top = 508
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect210: TPRRect
            Left = 865
            Top = 527
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect211: TPRRect
            Left = 865
            Top = 546
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect212: TPRRect
            Left = 865
            Top = 565
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect213: TPRRect
            Left = 865
            Top = 584
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect214: TPRRect
            Left = 865
            Top = 603
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect215: TPRRect
            Left = 865
            Top = 622
            Width = 35
            Height = 20
            LineStyle = psSolid
          end
          object PRRect216: TPRRect
            Left = 865
            Top = 641
            Width = 35
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Aliq_15: TPRLabel
            Left = 869
            Top = 643
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_14: TPRLabel
            Left = 869
            Top = 625
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_13: TPRLabel
            Left = 869
            Top = 606
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_12: TPRLabel
            Left = 869
            Top = 587
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_11: TPRLabel
            Left = 869
            Top = 568
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_10: TPRLabel
            Left = 869
            Top = 549
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_09: TPRLabel
            Left = 869
            Top = 530
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_08: TPRLabel
            Left = 869
            Top = 511
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_07: TPRLabel
            Left = 869
            Top = 492
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_06: TPRLabel
            Left = 869
            Top = 473
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_05: TPRLabel
            Left = 869
            Top = 454
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_04: TPRLabel
            Left = 869
            Top = 435
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_03: TPRLabel
            Left = 869
            Top = 416
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_02: TPRLabel
            Left = 869
            Top = 397
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Aliq_01: TPRLabel
            Left = 869
            Top = 379
            Width = 28
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRLabel87: TPRLabel
            Left = 869
            Top = 360
            Width = 27
            Height = 14
            FontName = fnArial
            FontSize = 10.000000000000000000
            Caption = 'Aliq.'
            Alignment = taCenter
          end
          object PRRect224: TPRRect
            Left = 736
            Top = 681
            Width = 130
            Height = 23
            LineStyle = psSolid
          end
          object PRRect225: TPRRect
            Left = 865
            Top = 681
            Width = 98
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel17: TPRLabel
            Left = 7
            Top = 88
            Width = 66
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'EMPRESA:'
          end
          object PRLabel41: TPRLabel
            Left = 509
            Top = 88
            Width = 221
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'LOCAL DE ENTREGA E COBRAN'#199'A:'
            Alignment = taRightJustify
          end
          object PRLabel42: TPRLabel
            Left = 739
            Top = 88
            Width = 140
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'O MESMO'
          end
          object PRLabel20: TPRLabel
            Left = 549
            Top = 106
            Width = 181
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'FRETE:'
            Alignment = taRightJustify
          end
          object PRL_Frete: TPRLabel
            Left = 739
            Top = 106
            Width = 222
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRLabel44: TPRLabel
            Left = 549
            Top = 159
            Width = 181
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'DESCONTO:'
            Alignment = taRightJustify
          end
          object PRL_Desconto: TPRLabel
            Left = 739
            Top = 159
            Width = 140
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRLabel21: TPRLabel
            Left = 32
            Top = 217
            Width = 80
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'CONTATO:'
            Alignment = taRightJustify
          end
          object PRL_Vendedor: TPRLabel
            Left = 126
            Top = 235
            Width = 395
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Endereco: TPRLabel
            Left = 109
            Top = 197
            Width = 583
            Height = 14
            FontName = fnArial
            FontSize = 10.000000000000000000
          end
          object PRLabel10: TPRLabel
            Left = 736
            Top = 179
            Width = 74
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'CNPJ:'
            Alignment = taRightJustify
          end
          object PRL_CNPJ: TPRLabel
            Left = 822
            Top = 179
            Width = 140
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRLabel12: TPRLabel
            Left = 656
            Top = 197
            Width = 153
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'INSC. ESTADUAL:'
            Alignment = taRightJustify
          end
          object PRL_IE: TPRLabel
            Left = 822
            Top = 197
            Width = 140
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRLabel11: TPRLabel
            Left = 168
            Top = 669
            Width = 556
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 
              'HOR'#193'RIO DE ENTREGA:       De Segunda '#224' Quinta das 07h30 '#224's 12h00' +
              ' e das 13h00 '#224's 17h00'
            Alignment = taRightJustify
          end
          object PRLabel13: TPRLabel
            Left = 424
            Top = 685
            Width = 300
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'De Sexta das 07h30 '#224's 12h00 e das 13h00 '#224's 16h00'
            Alignment = taRightJustify
          end
          object PRLabel45: TPRLabel
            Left = 529
            Top = 251
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'CELULAR:'
            Alignment = taRightJustify
          end
          object PRL_Celular: TPRLabel
            Left = 598
            Top = 249
            Width = 362
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Paginacao: TPRLabel
            Left = 743
            Top = 27
            Width = 204
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'P'#193'GINA 1 DE 1'
            Alignment = taCenter
          end
          object Endereco_01: TPRLabel
            Left = 74
            Top = 89
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'IBRASMAK IND. BRASILEIRA DE M'#193'QUINAS LTDA'
          end
          object Endereco_02: TPRLabel
            Left = 74
            Top = 105
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 
              'CNPJ: 47.139.456/0001-09                      IE: 581.034.396.11' +
              '9'
          end
          object Endereco_03: TPRLabel
            Left = 74
            Top = 121
            Width = 471
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 
              'ESTRADA DE SAPOPEMBA, 159 KM 45 - CEP 09432-300 -  RIBEIR'#195'O PIRE' +
              'S - SP'
          end
          object Endereco_04: TPRLabel
            Left = 74
            Top = 137
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700'
          end
          object Endereco_05: TPRLabel
            Left = 74
            Top = 153
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'e-mail: compras@ibrasmak.com.br'
          end
          object PRLabel29: TPRLabel
            Left = 10
            Top = 739
            Width = 863
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 
              '4 - C'#243'digo de Defesa do Consumidor Lei 8078, nos reserva o direi' +
              'to de n'#227'o aceitarmos mercadorias fora das especifica'#231#245'es deste p' +
              'edido. Sujeito a Devolu'#231#227'o.'
          end
          object Empresa_01: TPRLabel
            Left = 37
            Top = 15
            Width = 388
            Height = 58
            FontName = fnArial
            FontSize = 50.000000000000000000
            FontBold = True
            Caption = 'IBRASMAK'
          end
          object Empresa_02: TPRLabel
            Left = 37
            Top = 75
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
          end
          object PRLabel26: TPRLabel
            Left = 741
            Top = 685
            Width = 118
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'TOTAL DA O.C.'
          end
          object PRL_VlrTotalOC: TPRLabel
            Left = 872
            Top = 686
            Width = 87
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRLabel14: TPRLabel
            Left = 13
            Top = 262
            Width = 90
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'OBSERVA'#199#195'O:'
            Alignment = taRightJustify
          end
          object PRL_Observacao: TPRText
            Left = 12
            Top = 278
            Width = 949
            Height = 57
            FontName = fnArial
            FontSize = 12.000000000000000000
            Leading = 14.000000000000000000
            WordWrap = True
          end
          object PRRect5: TPRRect
            Left = 664
            Top = 338
            Width = 73
            Height = 39
            LineStyle = psSolid
          end
          object PRLabel27: TPRLabel
            Left = 667
            Top = 342
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Prazo'
            Alignment = taCenter
          end
          object PRLabel34: TPRLabel
            Left = 667
            Top = 359
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Entrega'
            Alignment = taCenter
          end
          object PRRect6: TPRRect
            Left = 664
            Top = 376
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect7: TPRRect
            Left = 664
            Top = 395
            Width = 73
            Height = 19
            LineStyle = psSolid
          end
          object PRRect8: TPRRect
            Left = 664
            Top = 413
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect9: TPRRect
            Left = 664
            Top = 432
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect10: TPRRect
            Left = 664
            Top = 451
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect11: TPRRect
            Left = 664
            Top = 470
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect12: TPRRect
            Left = 664
            Top = 489
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect13: TPRRect
            Left = 664
            Top = 508
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect95: TPRRect
            Left = 664
            Top = 527
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect96: TPRRect
            Left = 664
            Top = 546
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect97: TPRRect
            Left = 664
            Top = 565
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect98: TPRRect
            Left = 664
            Top = 584
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect99: TPRRect
            Left = 664
            Top = 603
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect100: TPRRect
            Left = 664
            Top = 622
            Width = 73
            Height = 20
            LineStyle = psSolid
          end
          object PRRect101: TPRRect
            Left = 664
            Top = 641
            Width = 73
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Prazo_Entrega_01: TPRLabel
            Left = 668
            Top = 379
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_02: TPRLabel
            Left = 668
            Top = 398
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_03: TPRLabel
            Left = 668
            Top = 416
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_04: TPRLabel
            Left = 668
            Top = 435
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_05: TPRLabel
            Left = 668
            Top = 454
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_06: TPRLabel
            Left = 668
            Top = 473
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_07: TPRLabel
            Left = 668
            Top = 492
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_08: TPRLabel
            Left = 668
            Top = 511
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_09: TPRLabel
            Left = 668
            Top = 530
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_10: TPRLabel
            Left = 668
            Top = 549
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_11: TPRLabel
            Left = 668
            Top = 568
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_12: TPRLabel
            Left = 668
            Top = 587
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_13: TPRLabel
            Left = 668
            Top = 606
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_14: TPRLabel
            Left = 668
            Top = 625
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_15: TPRLabel
            Left = 668
            Top = 644
            Width = 65
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRLabel37: TPRLabel
            Left = 441
            Top = 9
            Width = 90
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'UTILIZA'#199#195'O:'
            Alignment = taRightJustify
          end
          object PRL_Utilizacao: TPRLabel
            Left = 540
            Top = 9
            Width = 222
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRLabel38: TPRLabel
            Left = 10
            Top = 757
            Width = 951
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 
              'ATEN'#199#195'O: '#201' obrigat'#243'rio o envio do arquivo XML referente a Nota F' +
              'iscal desta Ordem de Compra para o e-mail: nfe@ibrasmak.com.br'
          end
          object PRLabel39: TPRLabel
            Left = 76
            Top = 770
            Width = 759
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 
              'A falta do arquivo XML implicar'#225' no n'#227'o recebimento da mercadori' +
              'a em nossa portaria.  ||   N'#227'o efetuamos pagamentos '#224's Segundas-' +
              'Feiras.'
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
