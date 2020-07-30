object CriaPDF: TCriaPDF
  Left = 229
  Top = 36
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
    Top = 649
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
    object Nro_Cotacao: TEdit
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
        Top = 14
        Width = 980
        Height = 603
        TabOrder = 0
        ControlData = {0000050049650000523E00000000000000}
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
          object Endereco_01: TPRLabel
            Left = 482
            Top = 11
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'IBRASMAK IND. BRASILEIRA DE M'#193'QUINAS LTDA'
          end
          object Endereco_02: TPRLabel
            Left = 482
            Top = 27
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 
              'CNPJ: 47.139.456/0001-09                      IE: 581.034.396.11' +
              '9'
          end
          object Endereco_03: TPRLabel
            Left = 482
            Top = 43
            Width = 471
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 
              'ESTRADA DE SAPOPEMBA, 159 KM 45 - CEP 09432-300 -  RIBEIR'#195'O PIRE' +
              'S - SP'
          end
          object Endereco_04: TPRLabel
            Left = 482
            Top = 59
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700'
          end
          object Endereco_05: TPRLabel
            Left = 482
            Top = 75
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
            Caption = 'e-mail: compras@ibrasmak.com.br'
            Alignment = taCenter
          end
          object PRRect1: TPRRect
            Left = 749
            Top = 111
            Width = 96
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel15: TPRLabel
            Left = 752
            Top = 114
            Width = 90
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'DATA'
            Alignment = taCenter
          end
          object PRRect2: TPRRect
            Left = 844
            Top = 111
            Width = 114
            Height = 20
            LineStyle = psSolid
          end
          object PRLabel16: TPRLabel
            Left = 847
            Top = 114
            Width = 108
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'SOLICITA'#199#195'O N'#186
            Alignment = taCenter
          end
          object PRRect3: TPRRect
            Left = 844
            Top = 130
            Width = 114
            Height = 20
            LineStyle = psSolid
          end
          object PRRect4: TPRRect
            Left = 749
            Top = 130
            Width = 96
            Height = 20
            LineStyle = psSolid
          end
          object PRL_Cotacao_Nro: TPRLabel
            Left = 847
            Top = 133
            Width = 108
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRRect5: TPRRect
            Left = 38
            Top = 206
            Width = 511
            Height = 20
            LineStyle = psSolid
          end
          object PRRect6: TPRRect
            Left = 38
            Top = 149
            Width = 511
            Height = 20
            LineStyle = psSolid
          end
          object PRRect7: TPRRect
            Left = 38
            Top = 168
            Width = 511
            Height = 20
            LineStyle = psSolid
          end
          object PRRect8: TPRRect
            Left = 38
            Top = 187
            Width = 511
            Height = 20
            LineStyle = psSolid
          end
          object PRRect9: TPRRect
            Left = 548
            Top = 206
            Width = 410
            Height = 20
            LineStyle = psSolid
          end
          object PRRect10: TPRRect
            Left = 548
            Top = 187
            Width = 410
            Height = 20
            LineStyle = psSolid
          end
          object PRRect11: TPRRect
            Left = 548
            Top = 168
            Width = 410
            Height = 20
            LineStyle = psSolid
          end
          object PRRect12: TPRRect
            Left = 548
            Top = 149
            Width = 410
            Height = 20
            LineStyle = psSolid
          end
          object PRRect13: TPRRect
            Left = 38
            Top = 225
            Width = 920
            Height = 39
            LineStyle = psSolid
          end
          object PRLabel17: TPRLabel
            Left = 44
            Top = 237
            Width = 30
            Height = 15
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Obs:'
          end
          object PRL_Validade: TPRLabel
            Left = 628
            Top = 209
            Width = 326
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Frete: TPRLabel
            Left = 628
            Top = 190
            Width = 326
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Entrega: TPRLabel
            Left = 654
            Top = 171
            Width = 300
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Pagamento: TPRLabel
            Left = 628
            Top = 152
            Width = 326
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Fax: TPRLabel
            Left = 101
            Top = 209
            Width = 444
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Fone_1: TPRLabel
            Left = 101
            Top = 190
            Width = 444
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Contato: TPRLabel
            Left = 141
            Top = 171
            Width = 404
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_Nome: TPRLabel
            Left = 101
            Top = 152
            Width = 444
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_OBS2: TPRLabel
            Left = 78
            Top = 246
            Width = 876
            Height = 15
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRL_OBS1: TPRLabel
            Left = 78
            Top = 228
            Width = 876
            Height = 15
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRRect14: TPRRect
            Left = 95
            Top = 282
            Width = 58
            Height = 23
            LineStyle = psSolid
          end
          object PRRect15: TPRRect
            Left = 152
            Top = 282
            Width = 498
            Height = 23
            LineStyle = psSolid
          end
          object PRRect16: TPRRect
            Left = 806
            Top = 282
            Width = 77
            Height = 23
            LineStyle = psSolid
          end
          object PRRect17: TPRRect
            Left = 882
            Top = 282
            Width = 76
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel1: TPRLabel
            Left = 100
            Top = 286
            Width = 48
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Qtde.'
            Alignment = taCenter
          end
          object PRLabel2: TPRLabel
            Left = 158
            Top = 286
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Descri'#231#227'o'
            Alignment = taCenter
          end
          object PRLabel3: TPRLabel
            Left = 809
            Top = 286
            Width = 71
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Unit'#225'rio (R$)'
            Alignment = taCenter
          end
          object PRLabel4: TPRLabel
            Left = 885
            Top = 286
            Width = 71
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Total (R$)'
            Alignment = taCenter
          end
          object PRL_Data_Cotacao: TPRLabel
            Left = 754
            Top = 133
            Width = 87
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRLabel5: TPRLabel
            Left = 42
            Top = 152
            Width = 55
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Empresa:'
          end
          object PRLabel6: TPRLabel
            Left = 42
            Top = 171
            Width = 100
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Para o Vendedor:'
          end
          object PRLabel7: TPRLabel
            Left = 42
            Top = 190
            Width = 55
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Fone:'
          end
          object PRLabel8: TPRLabel
            Left = 42
            Top = 209
            Width = 55
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Fax:'
          end
          object PRLabel18: TPRLabel
            Left = 552
            Top = 152
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Pagamento:'
          end
          object PRLabel19: TPRLabel
            Left = 552
            Top = 171
            Width = 101
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Prazo de Entrega:'
          end
          object PRLabel20: TPRLabel
            Left = 552
            Top = 190
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Frete:'
          end
          object PRLabel21: TPRLabel
            Left = 552
            Top = 209
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Validade:'
          end
          object PRRect22: TPRRect
            Left = 806
            Top = 713
            Width = 152
            Height = 57
            LineStyle = psSolid
          end
          object PRLabel9: TPRLabel
            Left = 814
            Top = 746
            Width = 52
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Total (R$)'
          end
          object PRL_VlrTotal: TPRLabel
            Left = 876
            Top = 746
            Width = 77
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect18: TPRRect
            Left = 38
            Top = 282
            Width = 58
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel22: TPRLabel
            Left = 43
            Top = 286
            Width = 48
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Item'
            Alignment = taCenter
          end
          object PRRect19: TPRRect
            Left = 38
            Top = 304
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect20: TPRRect
            Left = 95
            Top = 304
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect21: TPRRect
            Left = 152
            Top = 304
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect23: TPRRect
            Left = 806
            Top = 304
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect24: TPRRect
            Left = 882
            Top = 304
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect25: TPRRect
            Left = 38
            Top = 323
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect26: TPRRect
            Left = 95
            Top = 323
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect27: TPRRect
            Left = 152
            Top = 323
            Width = 498
            Height = 19
            LineStyle = psSolid
          end
          object PRRect28: TPRRect
            Left = 806
            Top = 323
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect29: TPRRect
            Left = 882
            Top = 323
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Item_01: TPRLabel
            Left = 42
            Top = 307
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_01: TPRLabel
            Left = 99
            Top = 307
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Desc_01: TPRLabel
            Left = 157
            Top = 307
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Unit_01: TPRLabel
            Left = 811
            Top = 307
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_01: TPRLabel
            Left = 886
            Top = 307
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRLabel23: TPRLabel
            Left = 40
            Top = 718
            Width = 103
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Atenciosamente,'
          end
          object PRL_Funcionario: TPRLabel
            Left = 39
            Top = 737
            Width = 458
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
          end
          object PRLabel25: TPRLabel
            Left = 40
            Top = 756
            Width = 113
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Depto. de Compras'
          end
          object PRRect30: TPRRect
            Left = 38
            Top = 341
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect31: TPRRect
            Left = 95
            Top = 341
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect32: TPRRect
            Left = 152
            Top = 341
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect33: TPRRect
            Left = 806
            Top = 341
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect34: TPRRect
            Left = 882
            Top = 341
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect35: TPRRect
            Left = 38
            Top = 360
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect36: TPRRect
            Left = 95
            Top = 360
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect37: TPRRect
            Left = 152
            Top = 360
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect38: TPRRect
            Left = 806
            Top = 360
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect39: TPRRect
            Left = 882
            Top = 360
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect40: TPRRect
            Left = 38
            Top = 379
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect41: TPRRect
            Left = 95
            Top = 379
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect42: TPRRect
            Left = 152
            Top = 379
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect43: TPRRect
            Left = 806
            Top = 379
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect44: TPRRect
            Left = 882
            Top = 379
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect45: TPRRect
            Left = 38
            Top = 398
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect46: TPRRect
            Left = 95
            Top = 398
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect47: TPRRect
            Left = 152
            Top = 398
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect48: TPRRect
            Left = 806
            Top = 398
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect49: TPRRect
            Left = 882
            Top = 398
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect50: TPRRect
            Left = 38
            Top = 417
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect51: TPRRect
            Left = 95
            Top = 417
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect52: TPRRect
            Left = 152
            Top = 417
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect53: TPRRect
            Left = 806
            Top = 417
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect54: TPRRect
            Left = 882
            Top = 417
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect55: TPRRect
            Left = 38
            Top = 436
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect56: TPRRect
            Left = 95
            Top = 436
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect57: TPRRect
            Left = 152
            Top = 436
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect58: TPRRect
            Left = 806
            Top = 436
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect59: TPRRect
            Left = 882
            Top = 436
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect60: TPRRect
            Left = 38
            Top = 455
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect61: TPRRect
            Left = 95
            Top = 455
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect62: TPRRect
            Left = 152
            Top = 455
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect63: TPRRect
            Left = 806
            Top = 455
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect64: TPRRect
            Left = 882
            Top = 455
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect65: TPRRect
            Left = 38
            Top = 474
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect66: TPRRect
            Left = 95
            Top = 474
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect67: TPRRect
            Left = 152
            Top = 474
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect68: TPRRect
            Left = 806
            Top = 474
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect69: TPRRect
            Left = 882
            Top = 474
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect70: TPRRect
            Left = 38
            Top = 493
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect71: TPRRect
            Left = 95
            Top = 493
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect72: TPRRect
            Left = 152
            Top = 493
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect73: TPRRect
            Left = 806
            Top = 493
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect74: TPRRect
            Left = 882
            Top = 493
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect75: TPRRect
            Left = 38
            Top = 512
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect76: TPRRect
            Left = 95
            Top = 512
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect77: TPRRect
            Left = 152
            Top = 512
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect78: TPRRect
            Left = 806
            Top = 512
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect79: TPRRect
            Left = 882
            Top = 512
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect80: TPRRect
            Left = 38
            Top = 531
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect81: TPRRect
            Left = 95
            Top = 531
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect82: TPRRect
            Left = 152
            Top = 531
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect83: TPRRect
            Left = 806
            Top = 531
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect84: TPRRect
            Left = 882
            Top = 531
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect85: TPRRect
            Left = 38
            Top = 550
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect86: TPRRect
            Left = 95
            Top = 550
            Width = 58
            Height = 20
            LineStyle = psSolid
          end
          object PRRect87: TPRRect
            Left = 152
            Top = 550
            Width = 498
            Height = 20
            LineStyle = psSolid
          end
          object PRRect88: TPRRect
            Left = 806
            Top = 550
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRRect89: TPRRect
            Left = 882
            Top = 550
            Width = 76
            Height = 20
            LineStyle = psSolid
          end
          object PRRect90: TPRRect
            Left = 38
            Top = 569
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect91: TPRRect
            Left = 95
            Top = 569
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect92: TPRRect
            Left = 152
            Top = 569
            Width = 498
            Height = 19
            LineStyle = psSolid
          end
          object PRRect93: TPRRect
            Left = 806
            Top = 569
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect94: TPRRect
            Left = 882
            Top = 569
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect95: TPRRect
            Left = 38
            Top = 587
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect96: TPRRect
            Left = 95
            Top = 587
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect97: TPRRect
            Left = 152
            Top = 587
            Width = 498
            Height = 19
            LineStyle = psSolid
          end
          object PRRect98: TPRRect
            Left = 806
            Top = 587
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect99: TPRRect
            Left = 882
            Top = 587
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect100: TPRRect
            Left = 38
            Top = 605
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect101: TPRRect
            Left = 95
            Top = 605
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect102: TPRRect
            Left = 152
            Top = 605
            Width = 498
            Height = 19
            LineStyle = psSolid
          end
          object PRRect103: TPRRect
            Left = 806
            Top = 605
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect104: TPRRect
            Left = 882
            Top = 605
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect105: TPRRect
            Left = 38
            Top = 623
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect106: TPRRect
            Left = 95
            Top = 623
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect107: TPRRect
            Left = 152
            Top = 623
            Width = 498
            Height = 19
            LineStyle = psSolid
          end
          object PRRect108: TPRRect
            Left = 806
            Top = 623
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect109: TPRRect
            Left = 882
            Top = 623
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect110: TPRRect
            Left = 38
            Top = 641
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect111: TPRRect
            Left = 95
            Top = 641
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect112: TPRRect
            Left = 152
            Top = 641
            Width = 498
            Height = 19
            LineStyle = psSolid
          end
          object PRRect113: TPRRect
            Left = 806
            Top = 641
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect114: TPRRect
            Left = 882
            Top = 641
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect115: TPRRect
            Left = 38
            Top = 659
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect116: TPRRect
            Left = 95
            Top = 659
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect117: TPRRect
            Left = 152
            Top = 659
            Width = 498
            Height = 19
            LineStyle = psSolid
          end
          object PRRect118: TPRRect
            Left = 806
            Top = 659
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect119: TPRRect
            Left = 882
            Top = 659
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect120: TPRRect
            Left = 38
            Top = 677
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect121: TPRRect
            Left = 95
            Top = 677
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect122: TPRRect
            Left = 152
            Top = 677
            Width = 498
            Height = 19
            LineStyle = psSolid
          end
          object PRRect123: TPRRect
            Left = 806
            Top = 677
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect124: TPRRect
            Left = 882
            Top = 677
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRRect125: TPRRect
            Left = 38
            Top = 695
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect126: TPRRect
            Left = 95
            Top = 695
            Width = 58
            Height = 19
            LineStyle = psSolid
          end
          object PRRect127: TPRRect
            Left = 152
            Top = 695
            Width = 498
            Height = 19
            LineStyle = psSolid
          end
          object PRRect128: TPRRect
            Left = 806
            Top = 695
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRRect129: TPRRect
            Left = 882
            Top = 695
            Width = 76
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Item_02: TPRLabel
            Left = 42
            Top = 325
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_03: TPRLabel
            Left = 42
            Top = 344
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_04: TPRLabel
            Left = 42
            Top = 363
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_05: TPRLabel
            Left = 42
            Top = 382
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_06: TPRLabel
            Left = 42
            Top = 401
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_07: TPRLabel
            Left = 42
            Top = 420
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_08: TPRLabel
            Left = 42
            Top = 439
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_09: TPRLabel
            Left = 42
            Top = 458
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_10: TPRLabel
            Left = 42
            Top = 477
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_11: TPRLabel
            Left = 42
            Top = 496
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_12: TPRLabel
            Left = 42
            Top = 515
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_14: TPRLabel
            Left = 42
            Top = 553
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_15: TPRLabel
            Left = 42
            Top = 571
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_16: TPRLabel
            Left = 42
            Top = 589
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_17: TPRLabel
            Left = 42
            Top = 607
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_18: TPRLabel
            Left = 42
            Top = 625
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_19: TPRLabel
            Left = 42
            Top = 643
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_20: TPRLabel
            Left = 42
            Top = 661
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_21: TPRLabel
            Left = 42
            Top = 679
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_22: TPRLabel
            Left = 42
            Top = 697
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Item_13: TPRLabel
            Left = 42
            Top = 534
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_02: TPRLabel
            Left = 99
            Top = 325
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_03: TPRLabel
            Left = 99
            Top = 344
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_04: TPRLabel
            Left = 99
            Top = 363
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_05: TPRLabel
            Left = 99
            Top = 382
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_06: TPRLabel
            Left = 99
            Top = 401
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_07: TPRLabel
            Left = 99
            Top = 420
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_08: TPRLabel
            Left = 99
            Top = 439
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_09: TPRLabel
            Left = 99
            Top = 458
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_10: TPRLabel
            Left = 99
            Top = 477
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_11: TPRLabel
            Left = 99
            Top = 496
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_12: TPRLabel
            Left = 99
            Top = 515
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_13: TPRLabel
            Left = 99
            Top = 534
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_14: TPRLabel
            Left = 99
            Top = 553
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_15: TPRLabel
            Left = 99
            Top = 571
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_16: TPRLabel
            Left = 99
            Top = 589
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_17: TPRLabel
            Left = 99
            Top = 607
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_18: TPRLabel
            Left = 99
            Top = 625
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_19: TPRLabel
            Left = 99
            Top = 643
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_20: TPRLabel
            Left = 99
            Top = 661
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_21: TPRLabel
            Left = 99
            Top = 679
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Qtde_22: TPRLabel
            Left = 99
            Top = 697
            Width = 49
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Desc_02: TPRLabel
            Left = 157
            Top = 325
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_03: TPRLabel
            Left = 157
            Top = 344
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_04: TPRLabel
            Left = 157
            Top = 363
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_05: TPRLabel
            Left = 157
            Top = 382
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_06: TPRLabel
            Left = 157
            Top = 401
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_07: TPRLabel
            Left = 157
            Top = 420
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_08: TPRLabel
            Left = 157
            Top = 439
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_09: TPRLabel
            Left = 157
            Top = 458
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_10: TPRLabel
            Left = 157
            Top = 477
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_11: TPRLabel
            Left = 157
            Top = 496
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_12: TPRLabel
            Left = 157
            Top = 515
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_13: TPRLabel
            Left = 157
            Top = 534
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_14: TPRLabel
            Left = 157
            Top = 553
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_15: TPRLabel
            Left = 157
            Top = 571
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_16: TPRLabel
            Left = 157
            Top = 589
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_17: TPRLabel
            Left = 157
            Top = 607
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_18: TPRLabel
            Left = 157
            Top = 625
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_19: TPRLabel
            Left = 157
            Top = 643
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_20: TPRLabel
            Left = 157
            Top = 661
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_21: TPRLabel
            Left = 157
            Top = 679
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Desc_22: TPRLabel
            Left = 157
            Top = 697
            Width = 487
            Height = 14
            FontName = fnArial
            FontSize = 8.000000000000000000
          end
          object PRL_Unit_02: TPRLabel
            Left = 811
            Top = 325
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_03: TPRLabel
            Left = 811
            Top = 344
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_04: TPRLabel
            Left = 811
            Top = 363
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_05: TPRLabel
            Left = 811
            Top = 382
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_06: TPRLabel
            Left = 811
            Top = 401
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_07: TPRLabel
            Left = 811
            Top = 420
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_08: TPRLabel
            Left = 811
            Top = 439
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_09: TPRLabel
            Left = 811
            Top = 458
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_10: TPRLabel
            Left = 811
            Top = 477
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_11: TPRLabel
            Left = 811
            Top = 496
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_12: TPRLabel
            Left = 811
            Top = 515
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_13: TPRLabel
            Left = 811
            Top = 534
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_14: TPRLabel
            Left = 811
            Top = 553
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_15: TPRLabel
            Left = 811
            Top = 571
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_16: TPRLabel
            Left = 811
            Top = 589
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_17: TPRLabel
            Left = 811
            Top = 607
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_18: TPRLabel
            Left = 811
            Top = 625
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_19: TPRLabel
            Left = 811
            Top = 643
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_20: TPRLabel
            Left = 811
            Top = 661
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_21: TPRLabel
            Left = 811
            Top = 679
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Unit_22: TPRLabel
            Left = 811
            Top = 697
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_02: TPRLabel
            Left = 886
            Top = 325
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_03: TPRLabel
            Left = 886
            Top = 344
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_04: TPRLabel
            Left = 886
            Top = 363
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_05: TPRLabel
            Left = 886
            Top = 382
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_06: TPRLabel
            Left = 886
            Top = 401
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_07: TPRLabel
            Left = 886
            Top = 420
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_08: TPRLabel
            Left = 886
            Top = 439
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_09: TPRLabel
            Left = 886
            Top = 458
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_10: TPRLabel
            Left = 886
            Top = 477
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_11: TPRLabel
            Left = 886
            Top = 496
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_12: TPRLabel
            Left = 886
            Top = 515
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_13: TPRLabel
            Left = 886
            Top = 534
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_14: TPRLabel
            Left = 886
            Top = 553
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_15: TPRLabel
            Left = 886
            Top = 571
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_16: TPRLabel
            Left = 886
            Top = 589
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_17: TPRLabel
            Left = 886
            Top = 607
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_18: TPRLabel
            Left = 886
            Top = 625
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_19: TPRLabel
            Left = 886
            Top = 643
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_22: TPRLabel
            Left = 886
            Top = 697
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_20: TPRLabel
            Left = 886
            Top = 661
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Total_21: TPRLabel
            Left = 886
            Top = 679
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRLabel24: TPRLabel
            Left = 165
            Top = 111
            Width = 385
            Height = 31
            FontName = fnArial
            FontSize = 25.000000000000000000
            FontBold = True
            Caption = 'SOLICITA'#199#195'O DE COTA'#199#195'O'
            Alignment = taCenter
          end
          object PRRect130: TPRRect
            Left = 649
            Top = 713
            Width = 158
            Height = 57
            LineStyle = psSolid
          end
          object PRLabel27: TPRLabel
            Left = 663
            Top = 735
            Width = 52
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'IPI (R$)'
          end
          object PRL_VlrIPI: TPRLabel
            Left = 722
            Top = 735
            Width = 77
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRL_Paginacao: TPRLabel
            Left = 751
            Top = 95
            Width = 204
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'P'#193'GINA 1 DE 1'
            Alignment = taCenter
          end
          object Empresa_01: TPRLabel
            Left = 37
            Top = 23
            Width = 388
            Height = 58
            FontName = fnArial
            FontSize = 50.000000000000000000
            FontBold = True
            Caption = 'IBRASMAK'
          end
          object Empresa_02: TPRLabel
            Left = 37
            Top = 83
            Width = 385
            Height = 19
            FontName = fnArial
            FontSize = 12.000000000000000000
            FontBold = True
          end
          object PRRect131: TPRRect
            Left = 730
            Top = 282
            Width = 77
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel10: TPRLabel
            Left = 733
            Top = 286
            Width = 71
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'IPI (R$)'
            Alignment = taCenter
          end
          object PRRect132: TPRRect
            Left = 730
            Top = 304
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_01: TPRLabel
            Left = 735
            Top = 307
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect133: TPRRect
            Left = 730
            Top = 323
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRL_IPI_02: TPRLabel
            Left = 735
            Top = 325
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect134: TPRRect
            Left = 730
            Top = 341
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_03: TPRLabel
            Left = 735
            Top = 344
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect135: TPRRect
            Left = 730
            Top = 360
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_04: TPRLabel
            Left = 735
            Top = 363
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect136: TPRRect
            Left = 730
            Top = 379
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_05: TPRLabel
            Left = 735
            Top = 382
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect137: TPRRect
            Left = 730
            Top = 398
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_06: TPRLabel
            Left = 735
            Top = 401
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect138: TPRRect
            Left = 730
            Top = 417
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_07: TPRLabel
            Left = 735
            Top = 420
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect139: TPRRect
            Left = 730
            Top = 436
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_08: TPRLabel
            Left = 735
            Top = 439
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect140: TPRRect
            Left = 730
            Top = 455
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_09: TPRLabel
            Left = 735
            Top = 458
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect141: TPRRect
            Left = 730
            Top = 474
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_10: TPRLabel
            Left = 735
            Top = 477
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect142: TPRRect
            Left = 730
            Top = 493
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_11: TPRLabel
            Left = 735
            Top = 496
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect143: TPRRect
            Left = 730
            Top = 512
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_12: TPRLabel
            Left = 735
            Top = 515
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect144: TPRRect
            Left = 730
            Top = 531
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_13: TPRLabel
            Left = 735
            Top = 534
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect145: TPRRect
            Left = 730
            Top = 550
            Width = 77
            Height = 20
            LineStyle = psSolid
          end
          object PRL_IPI_14: TPRLabel
            Left = 735
            Top = 553
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect146: TPRRect
            Left = 730
            Top = 569
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRL_IPI_15: TPRLabel
            Left = 735
            Top = 571
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect147: TPRRect
            Left = 730
            Top = 587
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRL_IPI_16: TPRLabel
            Left = 735
            Top = 589
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect148: TPRRect
            Left = 730
            Top = 605
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRL_IPI_17: TPRLabel
            Left = 735
            Top = 607
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect149: TPRRect
            Left = 730
            Top = 623
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRL_IPI_18: TPRLabel
            Left = 735
            Top = 625
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect150: TPRRect
            Left = 730
            Top = 641
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRL_IPI_19: TPRLabel
            Left = 735
            Top = 643
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect151: TPRRect
            Left = 730
            Top = 659
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRL_IPI_20: TPRLabel
            Left = 735
            Top = 661
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect152: TPRRect
            Left = 730
            Top = 677
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRL_IPI_21: TPRLabel
            Left = 735
            Top = 679
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect153: TPRRect
            Left = 730
            Top = 695
            Width = 77
            Height = 19
            LineStyle = psSolid
          end
          object PRL_IPI_22: TPRLabel
            Left = 735
            Top = 697
            Width = 67
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRLabel11: TPRLabel
            Left = 814
            Top = 722
            Width = 59
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Desc. (R$)'
          end
          object PRL_Desconto: TPRLabel
            Left = 876
            Top = 722
            Width = 77
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taRightJustify
          end
          object PRRect154: TPRRect
            Left = 649
            Top = 282
            Width = 82
            Height = 23
            LineStyle = psSolid
          end
          object PRLabel12: TPRLabel
            Left = 652
            Top = 286
            Width = 76
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Caption = 'Prazo Entrega'
            Alignment = taCenter
          end
          object PRRect155: TPRRect
            Left = 649
            Top = 304
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect156: TPRRect
            Left = 649
            Top = 323
            Width = 82
            Height = 19
            LineStyle = psSolid
          end
          object PRRect157: TPRRect
            Left = 649
            Top = 341
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect158: TPRRect
            Left = 649
            Top = 360
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect159: TPRRect
            Left = 649
            Top = 379
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect160: TPRRect
            Left = 649
            Top = 398
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect161: TPRRect
            Left = 649
            Top = 417
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect162: TPRRect
            Left = 649
            Top = 436
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect163: TPRRect
            Left = 649
            Top = 455
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect164: TPRRect
            Left = 649
            Top = 474
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect165: TPRRect
            Left = 649
            Top = 493
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect166: TPRRect
            Left = 649
            Top = 512
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect167: TPRRect
            Left = 649
            Top = 531
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect168: TPRRect
            Left = 649
            Top = 550
            Width = 82
            Height = 20
            LineStyle = psSolid
          end
          object PRRect169: TPRRect
            Left = 649
            Top = 569
            Width = 82
            Height = 19
            LineStyle = psSolid
          end
          object PRRect170: TPRRect
            Left = 649
            Top = 587
            Width = 82
            Height = 19
            LineStyle = psSolid
          end
          object PRRect171: TPRRect
            Left = 649
            Top = 605
            Width = 82
            Height = 19
            LineStyle = psSolid
          end
          object PRRect172: TPRRect
            Left = 649
            Top = 623
            Width = 82
            Height = 19
            LineStyle = psSolid
          end
          object PRRect173: TPRRect
            Left = 649
            Top = 641
            Width = 82
            Height = 19
            LineStyle = psSolid
          end
          object PRRect174: TPRRect
            Left = 649
            Top = 659
            Width = 82
            Height = 19
            LineStyle = psSolid
          end
          object PRRect175: TPRRect
            Left = 649
            Top = 677
            Width = 82
            Height = 19
            LineStyle = psSolid
          end
          object PRRect176: TPRRect
            Left = 649
            Top = 695
            Width = 82
            Height = 19
            LineStyle = psSolid
          end
          object PRL_Prazo_Entrega_01: TPRLabel
            Left = 654
            Top = 307
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_02: TPRLabel
            Left = 654
            Top = 326
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_03: TPRLabel
            Left = 654
            Top = 344
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_04: TPRLabel
            Left = 654
            Top = 363
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_05: TPRLabel
            Left = 654
            Top = 382
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_06: TPRLabel
            Left = 654
            Top = 401
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_07: TPRLabel
            Left = 654
            Top = 420
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_08: TPRLabel
            Left = 654
            Top = 439
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_09: TPRLabel
            Left = 654
            Top = 458
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_10: TPRLabel
            Left = 654
            Top = 477
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_11: TPRLabel
            Left = 654
            Top = 496
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_12: TPRLabel
            Left = 654
            Top = 515
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_13: TPRLabel
            Left = 654
            Top = 534
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_14: TPRLabel
            Left = 654
            Top = 553
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_15: TPRLabel
            Left = 654
            Top = 572
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_16: TPRLabel
            Left = 654
            Top = 590
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_17: TPRLabel
            Left = 654
            Top = 607
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_18: TPRLabel
            Left = 654
            Top = 626
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_19: TPRLabel
            Left = 654
            Top = 644
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_20: TPRLabel
            Left = 654
            Top = 662
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_21: TPRLabel
            Left = 654
            Top = 679
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
          object PRL_Prazo_Entrega_22: TPRLabel
            Left = 654
            Top = 698
            Width = 72
            Height = 14
            FontName = fnArial
            FontSize = 12.000000000000000000
            Alignment = taCenter
          end
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 46
    Top = 656
  end
  object PReport1: TPReport
    FileName = 'default.pdf'
    CreationDate = 38548.663816180550000000
    UseOutlines = False
    ViewerPreference = []
    Left = 14
    Top = 656
  end
end
