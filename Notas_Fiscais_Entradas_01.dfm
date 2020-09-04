object NotasFiscaisEntradas01: TNotasFiscaisEntradas01
  Left = 284
  Top = 185
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Registro de Notas Fiscais de Entradas - INCLUS'#195'O'
  ClientHeight = 543
  ClientWidth = 763
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 4
    Top = 495
    Width = 753
    Height = 41
    TabOrder = 0
    object BT_Incluir: TBitBtn
      Left = 339
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Incluir'
      TabOrder = 0
      OnClick = BT_IncluirClick
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
      Left = 669
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
    object Nota_Desconto_ICMS: TCheckBox
      Left = 11
      Top = 12
      Width = 238
      Height = 17
      Caption = 'Considerar esta Nota para desconto do ICMS'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object Programa_Anterior: TEdit
      Left = 252
      Top = 10
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
      OnKeyPress = Nota_EspecieKeyPress
    end
    object Nro_Ordem: TEdit
      Left = 261
      Top = 10
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
  end
  object PageControl1: TPageControl
    Left = 4
    Top = 1
    Width = 754
    Height = 377
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Itens Principais'
      object GroupBox1: TGroupBox
        Left = 2
        Top = -1
        Width = 741
        Height = 58
        Caption = '  Dados do Fornecedor   '
        TabOrder = 0
        object Label21: TLabel
          Left = 8
          Top = 14
          Width = 20
          Height = 13
          Caption = 'Nro.'
        end
        object Label3: TLabel
          Left = 63
          Top = 14
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label30: TLabel
          Left = 404
          Top = 11
          Width = 30
          Height = 13
          Caption = 'Status'
        end
        object Label35: TLabel
          Left = 191
          Top = 11
          Width = 46
          Height = 13
          Caption = 'Utiliza'#231#227'o'
        end
        object Fornecedor_Numero: TEdit
          Left = 8
          Top = 29
          Width = 51
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 11
          ParentCtl3D = False
          TabOrder = 0
        end
        object Fornecedor_Nome: TEdit
          Left = 63
          Top = 29
          Width = 516
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 1
        end
        object BT_Procurar: TBitBtn
          Left = 584
          Top = 26
          Width = 150
          Height = 24
          Caption = 'Procurar por Fornecedor'
          TabOrder = 2
          WordWrap = True
          OnClick = BT_ProcurarClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888800000888880000080F000888880F00080F000888880F
            0008000000080000000800F000000F00000800F000800F00000800F000800F00
            00088000000000000088880F00080F0008888800000800000888888000888000
            88888880F08880F0888888800088800088888888888888888888}
        end
        object Nota_Status: TEdit
          Left = 438
          Top = 8
          Width = 141
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 3
          Text = 'Entrada Manual'
        end
        object Nota_Utilizacao: TComboBox
          Left = 241
          Top = 8
          Width = 100
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 4
          Text = 'Industrializa'#231#227'o'
          Items.Strings = (
            'Industrializa'#231#227'o'
            'Consumo'
            'Revenda')
        end
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 58
        Width = 741
        Height = 57
        Caption = '   Dados da Nota   '
        TabOrder = 1
        object Label29: TLabel
          Left = 6
          Top = 15
          Width = 61
          Height = 13
          Caption = 'Nro. da Nota'
        end
        object Label9: TLabel
          Left = 76
          Top = 15
          Width = 39
          Height = 13
          Caption = 'Emiss'#227'o'
        end
        object Label1: TLabel
          Left = 144
          Top = 15
          Width = 37
          Height = 13
          Caption = 'Entrada'
        end
        object Label2: TLabel
          Left = 212
          Top = 15
          Width = 63
          Height = 13
          Caption = 'Recebimento'
        end
        object Label34: TLabel
          Left = 280
          Top = 15
          Width = 40
          Height = 13
          Caption = 'CFOP(1)'
        end
        object Label4: TLabel
          Left = 373
          Top = 15
          Width = 108
          Height = 13
          Caption = 'Natureza da Opera'#231#227'o'
        end
        object Label47: TLabel
          Left = 491
          Top = 15
          Width = 78
          Height = 13
          Caption = 'Cond. Pgto (DD)'
        end
        object Label28: TLabel
          Left = 573
          Top = 15
          Width = 157
          Height = 13
          Caption = 'Descri'#231#227'o para o Contas a Pagar'
        end
        object Label31: TLabel
          Left = 326
          Top = 15
          Width = 40
          Height = 13
          Caption = 'CFOP(2)'
        end
        object Nota_Numero: TEdit
          Left = 6
          Top = 30
          Width = 67
          Height = 19
          Ctl3D = False
          MaxLength = 11
          ParentCtl3D = False
          TabOrder = 0
          Text = '0'
          OnKeyPress = Nota_NumeroKeyPress
        end
        object Nota_Emissao: TMaskEdit
          Left = 76
          Top = 30
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 1
          Text = '  /  /    '
          OnKeyPress = Nota_EmissaoKeyPress
        end
        object Nota_Entrada: TMaskEdit
          Left = 144
          Top = 30
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 2
          Text = '  /  /    '
          OnKeyPress = Nota_EntradaKeyPress
        end
        object Nota_Recebimento: TMaskEdit
          Left = 212
          Top = 30
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 3
          Text = '  /  /    '
          OnKeyPress = Nota_RecebimentoKeyPress
        end
        object Nota_CFOP: TEdit
          Left = 280
          Top = 30
          Width = 44
          Height = 19
          Ctl3D = False
          MaxLength = 5
          ParentCtl3D = False
          TabOrder = 4
          OnKeyPress = Nota_CFOPKeyPress
        end
        object Nota_Natureza: TEdit
          Left = 373
          Top = 30
          Width = 113
          Height = 19
          Ctl3D = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 6
          OnKeyPress = Nota_NaturezaKeyPress
        end
        object Nota_Condicao_Pgto_1: TEdit
          Left = 489
          Top = 30
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 7
          Text = '0'
          OnExit = Nota_Condicao_Pgto_1Exit
          OnKeyPress = Nota_Condicao_Pgto_1KeyPress
        end
        object Nota_Descricao_Contas_Pagar: TEdit
          Left = 573
          Top = 30
          Width = 162
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 8
          OnKeyPress = Nota_NaturezaKeyPress
        end
        object Nota_CFOP_2: TEdit
          Left = 326
          Top = 30
          Width = 44
          Height = 19
          Ctl3D = False
          MaxLength = 5
          ParentCtl3D = False
          TabOrder = 5
          OnKeyPress = Nota_CFOP_2KeyPress
        end
      end
      object GroupBox3: TGroupBox
        Left = 2
        Top = 115
        Width = 741
        Height = 232
        Caption = '   Dados do Produto   '
        TabOrder = 2
        object Label32: TLabel
          Left = 8
          Top = 198
          Width = 296
          Height = 13
          Caption = 'Obs.: CFOP(1) - Este CFOP deve ser utilizado para os produtos'
        end
        object Label33: TLabel
          Left = 9
          Top = 214
          Width = 293
          Height = 13
          Caption = '         CFOP(2) - Este CFOP deve ser utilizado para os servi'#231'os'
        end
        object SGD_Produtos: TStringGrid
          Left = 7
          Top = 14
          Width = 726
          Height = 182
          ColCount = 13
          Ctl3D = False
          DefaultRowHeight = 19
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnDblClick = SGD_ProdutosDblClick
          ColWidths = (
            64
            40
            28
            24
            20
            22
            21
            23
            15
            20
            18
            64
            64)
        end
        object BT_Adicionar: TBitBtn
          Left = 313
          Top = 201
          Width = 127
          Height = 25
          Caption = 'Adicionar Produtos'
          TabOrder = 1
          OnClick = BT_AdicionarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Itens do Servi'#231'o'
      ImageIndex = 1
      object GroupBox4: TGroupBox
        Left = 5
        Top = 3
        Width = 738
        Height = 342
        Caption = '   Dados do Servi'#231'o   '
        TabOrder = 0
        object Label5: TLabel
          Left = 9
          Top = 320
          Width = 75
          Height = 13
          Caption = 'Al'#237'quota do ISS'
        end
        object Label6: TLabel
          Left = 289
          Top = 320
          Width = 59
          Height = 13
          Caption = 'Valor do ISS'
        end
        object Label7: TLabel
          Left = 542
          Top = 320
          Width = 88
          Height = 13
          Caption = 'Valor dos Servi'#231'os'
        end
        object SGD_Servicos: TStringGrid
          Left = 7
          Top = 15
          Width = 726
          Height = 263
          ColCount = 3
          Ctl3D = False
          DefaultRowHeight = 19
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnDblClick = SGD_ServicosDblClick
          ColWidths = (
            64
            64
            64)
        end
        object Panel8: TPanel
          Left = 7
          Top = 284
          Width = 726
          Height = 29
          BevelOuter = bvLowered
          TabOrder = 1
          object BT_Adicionar_Servicos: TBitBtn
            Left = 299
            Top = 2
            Width = 127
            Height = 25
            Caption = 'Adicionar Servi'#231'os'
            TabOrder = 0
            OnClick = BT_Adicionar_ServicosClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
          end
        end
        object Nota_Aliquota_ISS: TEdit
          Left = 88
          Top = 317
          Width = 100
          Height = 19
          Ctl3D = False
          MaxLength = 13
          ParentCtl3D = False
          TabOrder = 2
          Text = '0,00'
          OnExit = Nota_Aliquota_ISSExit
          OnKeyPress = Nota_Aliquota_ISSKeyPress
        end
        object Nota_Valor_ISS: TEdit
          Left = 352
          Top = 317
          Width = 100
          Height = 19
          Ctl3D = False
          MaxLength = 13
          ParentCtl3D = False
          TabOrder = 3
          Text = '0,00'
          OnExit = Nota_Valor_ISSExit
          OnKeyPress = Nota_Valor_ISSKeyPress
        end
        object Nota_Valor_Servicos: TEdit
          Left = 633
          Top = 317
          Width = 100
          Height = 19
          Ctl3D = False
          MaxLength = 13
          ParentCtl3D = False
          TabOrder = 4
          Text = '0,00'
          OnExit = Nota_Valor_ServicosExit
          OnKeyPress = Nota_Valor_ServicosKeyPress
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Vencimento das Duplicatas'
      ImageIndex = 2
      object GroupBox6: TGroupBox
        Left = 4
        Top = 1
        Width = 738
        Height = 343
        Caption = '   Vencimentos das Duplicatas   '
        TabOrder = 0
        object SGD_Vencimentos: TStringGrid
          Left = 8
          Top = 14
          Width = 722
          Height = 283
          ColCount = 3
          Ctl3D = False
          DefaultRowHeight = 19
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnDblClick = SGD_VencimentosDblClick
          ColWidths = (
            64
            64
            64)
        end
        object BT_Adicionar_Venctos: TBitBtn
          Left = 291
          Top = 307
          Width = 155
          Height = 25
          Caption = 'Adicionar Vencimentos'
          TabOrder = 1
          OnClick = BT_Adicionar_VenctosClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
        end
        object Opcao_Sem_Duplicata: TCheckBox
          Left = 8
          Top = 312
          Width = 169
          Height = 17
          Caption = 'Esta nota n'#227'o possui dulicatas'
          TabOrder = 2
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 4
    Top = 380
    Width = 753
    Height = 111
    TabOrder = 2
    object GroupBox5: TGroupBox
      Left = 6
      Top = 2
      Width = 742
      Height = 103
      Caption = '   Dados da Nota   '
      TabOrder = 0
      object Label8: TLabel
        Left = 6
        Top = 19
        Width = 80
        Height = 13
        Caption = 'Base C'#225'lc. ICMS'
      end
      object Label10: TLabel
        Left = 155
        Top = 19
        Width = 68
        Height = 13
        Caption = 'Valor do ICMS'
      end
      object Label11: TLabel
        Left = 291
        Top = 19
        Width = 110
        Height = 13
        Caption = 'Base C'#225'lc.ICMS Subst.'
      end
      object Label12: TLabel
        Left = 467
        Top = 19
        Width = 74
        Height = 13
        Caption = 'Vlr.ICMS Subst.'
      end
      object Label13: TLabel
        Left = 606
        Top = 19
        Width = 67
        Height = 13
        Caption = 'Vlr.Total Prod.'
      end
      object Label14: TLabel
        Left = 35
        Top = 40
        Width = 51
        Height = 13
        Caption = 'Valor Frete'
      end
      object Label15: TLabel
        Left = 162
        Top = 40
        Width = 61
        Height = 13
        Caption = 'Valor Seguro'
      end
      object Label16: TLabel
        Left = 290
        Top = 40
        Width = 111
        Height = 13
        Caption = 'Outras Despesas Aces.'
      end
      object Label17: TLabel
        Left = 500
        Top = 40
        Width = 40
        Height = 13
        Caption = 'Valor IPI'
      end
      object Label18: TLabel
        Left = 608
        Top = 40
        Width = 65
        Height = 13
        Caption = 'Vlr.Total Nota'
      end
      object Label19: TLabel
        Left = 6
        Top = 61
        Width = 102
        Height = 13
        Caption = 'CNPJ Transportadora'
      end
      object Label20: TLabel
        Left = 237
        Top = 61
        Width = 103
        Height = 13
        Caption = 'Nome Transportadora'
      end
      object Label53: TLabel
        Left = 614
        Top = 61
        Width = 49
        Height = 13
        Caption = 'Pgto Frete'
      end
      object Label22: TLabel
        Left = 7
        Top = 83
        Width = 23
        Height = 13
        Caption = 'Qtde'
      end
      object Label23: TLabel
        Left = 74
        Top = 83
        Width = 38
        Height = 13
        Caption = 'Esp'#233'cie'
      end
      object Label24: TLabel
        Left = 203
        Top = 83
        Width = 30
        Height = 13
        Caption = 'Marca'
      end
      object Label25: TLabel
        Left = 323
        Top = 83
        Width = 52
        Height = 13
        Caption = 'Peso Bruto'
      end
      object Label26: TLabel
        Left = 437
        Top = 83
        Width = 63
        Height = 13
        Caption = 'Peso L'#237'quido'
      end
      object Label27: TLabel
        Left = 565
        Top = 83
        Width = 22
        Height = 13
        Caption = 'Obs.'
      end
      object Nota_Base_ICMS: TEdit
        Left = 90
        Top = 16
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 0
        Text = '0,00'
        OnExit = Nota_Base_ICMSExit
        OnKeyPress = Nota_Base_ICMSKeyPress
      end
      object Nota_Valor_ICMS: TEdit
        Left = 226
        Top = 16
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 1
        Text = '0,00'
        OnExit = Nota_Valor_ICMSExit
        OnKeyPress = Nota_Valor_ICMSKeyPress
      end
      object Nota_Base_ICMS_Sub: TEdit
        Left = 404
        Top = 16
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 2
        Text = '0,00'
        OnExit = Nota_Base_ICMS_SubExit
        OnKeyPress = Nota_Base_ICMS_SubKeyPress
      end
      object Nota_Valor_ICMS_Sub: TEdit
        Left = 544
        Top = 16
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 3
        Text = '0,00'
        OnExit = Nota_Valor_ICMS_SubExit
        OnKeyPress = Nota_Valor_ICMS_SubKeyPress
      end
      object Nota_Valor_Produto: TEdit
        Left = 676
        Top = 16
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 4
        Text = '0,00'
        OnExit = Nota_Valor_ProdutoExit
        OnKeyPress = Nota_Valor_ProdutoKeyPress
      end
      object Nota_Valor_Frete: TEdit
        Left = 90
        Top = 37
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 5
        Text = '0,00'
        OnExit = Nota_Valor_FreteExit
        OnKeyPress = Nota_Valor_FreteKeyPress
      end
      object Nota_Valor_Seguro: TEdit
        Left = 226
        Top = 37
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 6
        Text = '0,00'
        OnExit = Nota_Valor_SeguroExit
        OnKeyPress = Nota_Valor_SeguroKeyPress
      end
      object Nota_Outras_Despesas: TEdit
        Left = 404
        Top = 37
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 7
        Text = '0,00'
        OnExit = Nota_Outras_DespesasExit
        OnKeyPress = Nota_Outras_DespesasKeyPress
      end
      object Nota_Valor_IPI: TEdit
        Left = 544
        Top = 37
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 8
        Text = '0,00'
        OnExit = Nota_Valor_IPIExit
        OnKeyPress = Nota_Valor_IPIKeyPress
      end
      object Nota_Valor_Nota: TEdit
        Left = 676
        Top = 37
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 9
        Text = '0,00'
        OnExit = Nota_Valor_NotaExit
        OnKeyPress = Nota_Valor_NotaKeyPress
      end
      object Transportadora_CNPJ: TMaskEdit
        Left = 112
        Top = 58
        Width = 110
        Height = 19
        Ctl3D = False
        EditMask = '!99\.999\.999\/9999\-99;1;_'
        MaxLength = 18
        ParentCtl3D = False
        TabOrder = 10
        Text = '  .   .   /    -  '
        OnKeyPress = Transportadora_CNPJKeyPress
      end
      object Transportadora_Nome: TEdit
        Left = 343
        Top = 58
        Width = 260
        Height = 19
        Ctl3D = False
        MaxLength = 255
        ParentCtl3D = False
        TabOrder = 11
        OnKeyPress = Transportadora_NomeKeyPress
      end
      object Nota_Pgto_Frete: TComboBox
        Left = 666
        Top = 58
        Width = 69
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 12
        Text = 'Ibrasmak'
        OnKeyPress = Nota_Pgto_FreteKeyPress
        Items.Strings = (
          'Ibrasmak'
          'Fornecedor')
      end
      object Nota_Qtde: TEdit
        Left = 35
        Top = 80
        Width = 32
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 13
        Text = '0'
        OnExit = Nota_QtdeExit
        OnKeyPress = Nota_QtdeKeyPress
      end
      object Nota_Especie: TEdit
        Left = 116
        Top = 80
        Width = 80
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 14
        OnKeyPress = Nota_EspecieKeyPress
      end
      object Nota_Marca: TEdit
        Left = 236
        Top = 80
        Width = 80
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 15
        OnKeyPress = Nota_MarcaKeyPress
      end
      object Nota_Peso_Bruto: TEdit
        Left = 380
        Top = 80
        Width = 50
        Height = 19
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 16
        Text = '0,00'
        OnExit = Nota_Peso_BrutoExit
        OnKeyPress = Nota_Peso_BrutoKeyPress
      end
      object Nota_Peso_Liquido: TEdit
        Left = 504
        Top = 80
        Width = 50
        Height = 19
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 17
        Text = '0,00'
        OnExit = Nota_Peso_LiquidoExit
        OnKeyPress = Nota_Peso_LiquidoKeyPress
      end
      object Nota_Obs: TEdit
        Left = 589
        Top = 80
        Width = 146
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 18
        OnKeyPress = Nota_ObsKeyPress
      end
    end
  end
end
