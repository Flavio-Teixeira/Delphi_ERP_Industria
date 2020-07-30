object Produtos02: TProdutos02
  Left = 360
  Top = 70
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos - ALTERA'#199#195'O / EXCLUS'#195'O'
  ClientHeight = 664
  ClientWidth = 716
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
    Top = 617
    Width = 708
    Height = 41
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 625
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
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
    object BT_Alterar: TBitBtn
      Left = 277
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 0
      OnClick = BT_AlterarClick
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
    object BT_Excluir: TBitBtn
      Left = 357
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
      OnClick = BT_ExcluirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
    end
    object Nro_Familia_Produto: TEdit
      Left = 5
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Nro_Tipo_Produto: TEdit
      Left = 13
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object BT_Imprimir: TBitBtn
      Left = 475
      Top = 8
      Width = 124
      Height = 25
      Caption = '&Visualizar Estrutura'
      TabOrder = 5
      OnClick = BT_ImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 4
    Width = 707
    Height = 277
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 692
      Height = 189
      Caption = '  Dados do Produto  '
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 13
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label1: TLabel
        Left = 133
        Top = 13
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label5: TLabel
        Left = 390
        Top = 13
        Width = 34
        Height = 13
        Caption = 'Fam'#237'lia'
      end
      object Label2: TLabel
        Left = 539
        Top = 13
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label4: TLabel
        Left = 8
        Top = 83
        Width = 21
        Height = 13
        Caption = 'Lote'
      end
      object Label6: TLabel
        Left = 97
        Top = 83
        Width = 81
        Height = 13
        Caption = 'C'#243'digo de Barras'
      end
      object Label7: TLabel
        Left = 203
        Top = 83
        Width = 40
        Height = 13
        Caption = 'Unidade'
      end
      object Label8: TLabel
        Left = 263
        Top = 83
        Width = 69
        Height = 13
        Caption = 'Unid.Pesagem'
      end
      object Label9: TLabel
        Left = 353
        Top = 83
        Width = 24
        Height = 13
        Caption = 'Peso'
      end
      object Label10: TLabel
        Left = 187
        Top = 120
        Width = 69
        Height = 13
        Caption = 'Estoque Inicial'
      end
      object Label11: TLabel
        Left = 278
        Top = 120
        Width = 66
        Height = 13
        Caption = 'Estoque Atual'
      end
      object Label12: TLabel
        Left = 605
        Top = 83
        Width = 77
        Height = 13
        Caption = #218'ltima Altera'#231#227'o'
      end
      object Label13: TLabel
        Left = 8
        Top = 164
        Width = 92
        Height = 13
        Caption = 'Classifica'#231#227'o Fiscal'
      end
      object Label14: TLabel
        Left = 214
        Top = 164
        Width = 109
        Height = 13
        Caption = 'Classifica'#231#227'o Tribut'#225'ria'
      end
      object Label27: TLabel
        Left = 437
        Top = 164
        Width = 91
        Height = 13
        Caption = 'Aparece no Pedido'
        Visible = False
      end
      object Label16: TLabel
        Left = 587
        Top = 164
        Width = 45
        Height = 13
        Caption = 'Pre'#231'o R$'
      end
      object Label15: TLabel
        Left = 387
        Top = 123
        Width = 30
        Height = 13
        Caption = 'IPI (%)'
      end
      object Label17: TLabel
        Left = 374
        Top = 145
        Width = 43
        Height = 13
        Caption = 'ICMS (%)'
        Visible = False
      end
      object Label18: TLabel
        Left = 8
        Top = 48
        Width = 52
        Height = 13
        Caption = 'Refer'#234'ncia'
      end
      object Label19: TLabel
        Left = 544
        Top = 60
        Width = 81
        Height = 13
        Caption = 'Cod. Formecedor'
      end
      object Label20: TLabel
        Left = 141
        Top = 48
        Width = 43
        Height = 13
        Caption = 'Desenho'
      end
      object Label21: TLabel
        Left = 241
        Top = 48
        Width = 15
        Height = 13
        Caption = 'OS'
      end
      object Label22: TLabel
        Left = 341
        Top = 48
        Width = 62
        Height = 13
        Caption = 'Equipamento'
      end
      object Label23: TLabel
        Left = 441
        Top = 48
        Width = 37
        Height = 13
        Caption = 'Material'
      end
      object Label35: TLabel
        Left = 422
        Top = 83
        Width = 57
        Height = 13
        Caption = 'Localiza'#231#227'o'
      end
      object Label36: TLabel
        Left = 8
        Top = 120
        Width = 65
        Height = 13
        Caption = 'Estoque Ideal'
      end
      object Label37: TLabel
        Left = 97
        Top = 120
        Width = 77
        Height = 13
        Caption = 'Estoque M'#237'nimo'
      end
      object Label38: TLabel
        Left = 125
        Top = 164
        Width = 24
        Height = 13
        Caption = 'NCM'
      end
      object Produto_Codigo: TEdit
        Left = 8
        Top = 28
        Width = 118
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        MaxLength = 50
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Produto_CodigoKeyPress
      end
      object Produto_Descricao: TEdit
        Left = 133
        Top = 28
        Width = 250
        Height = 19
        Ctl3D = False
        MaxLength = 255
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Produto_DescricaoKeyPress
      end
      object Produto_Familia: TComboBox
        Left = 390
        Top = 28
        Width = 143
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Produto_FamiliaKeyPress
      end
      object Produto_Tipo: TComboBox
        Left = 539
        Top = 28
        Width = 143
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = Produto_TipoKeyPress
      end
      object Produto_Lote: TEdit
        Left = 8
        Top = 98
        Width = 71
        Height = 19
        Ctl3D = False
        MaxLength = 11
        ParentCtl3D = False
        TabOrder = 10
        OnKeyPress = Produto_LoteKeyPress
      end
      object Produto_Codigo_Barras: TEdit
        Left = 97
        Top = 98
        Width = 88
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 11
        OnKeyPress = Produto_Codigo_BarrasKeyPress
      end
      object Produto_Unidade: TEdit
        Left = 203
        Top = 98
        Width = 42
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 12
        OnKeyPress = Produto_UnidadeKeyPress
      end
      object Produto_Unidade_Pesagem: TEdit
        Left = 263
        Top = 98
        Width = 72
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 13
        OnKeyPress = Produto_Unidade_PesagemKeyPress
      end
      object Produto_Peso: TEdit
        Left = 353
        Top = 98
        Width = 53
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 14
        OnKeyPress = Produto_PesoKeyPress
      end
      object Produto_Estoque_Inicial: TEdit
        Left = 187
        Top = 135
        Width = 73
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 15
        OnKeyPress = Produto_Estoque_InicialKeyPress
      end
      object Produto_Estoque_Atual: TEdit
        Left = 278
        Top = 135
        Width = 73
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 16
        OnKeyPress = Produto_Estoque_AtualKeyPress
      end
      object Produto_Data_Alteracao: TMaskEdit
        Left = 618
        Top = 98
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 17
        Text = '  /  /    '
        OnKeyPress = Produto_Data_AlteracaoKeyPress
      end
      object Produto_Classif_Fiscal: TEdit
        Left = 103
        Top = 161
        Width = 15
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 1
        ParentCtl3D = False
        TabOrder = 18
        OnKeyPress = Produto_Classif_FiscalKeyPress
      end
      object Produto_Classif_Tributaria: TEdit
        Left = 326
        Top = 161
        Width = 25
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 20
        OnKeyPress = Produto_Classif_TributariaKeyPress
      end
      object Produto_Pedido_Padrao: TComboBox
        Left = 531
        Top = 161
        Width = 50
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 23
        Text = 'N'#227'o'
        Visible = False
        OnKeyPress = Produto_DescontoKeyPress
        Items.Strings = (
          'N'#227'o'
          'Sim')
      end
      object Produto_Preco: TEdit
        Left = 636
        Top = 161
        Width = 46
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 24
        OnKeyPress = Produto_PrecoKeyPress
      end
      object Produto_IPI: TEdit
        Left = 421
        Top = 120
        Width = 45
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 21
        OnKeyPress = Produto_IPIKeyPress
      end
      object Produto_ICMS: TEdit
        Left = 421
        Top = 142
        Width = 45
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 22
        Visible = False
        OnKeyPress = Produto_ICMSKeyPress
      end
      object Produto_Referencia: TEdit
        Left = 8
        Top = 63
        Width = 118
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 50
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Produto_ReferenciaKeyPress
      end
      object Produto_Fornecedor: TEdit
        Left = 630
        Top = 58
        Width = 52
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 11
        ParentCtl3D = False
        TabOrder = 9
        OnKeyPress = Produto_FornecedorKeyPress
      end
      object produto_desenho: TEdit
        Left = 141
        Top = 63
        Width = 90
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = produto_desenhoKeyPress
      end
      object produto_os: TEdit
        Left = 241
        Top = 63
        Width = 90
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = produto_osKeyPress
      end
      object produto_equipamento: TEdit
        Left = 341
        Top = 63
        Width = 90
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 7
        OnKeyPress = produto_equipamentoKeyPress
      end
      object produto_material: TEdit
        Left = 441
        Top = 63
        Width = 90
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 8
        OnKeyPress = produto_materialKeyPress
      end
      object produto_localizacao: TEdit
        Left = 421
        Top = 98
        Width = 180
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 25
        OnKeyPress = produto_localizacaoKeyPress
      end
      object Produto_Estoque_Ideal: TEdit
        Left = 8
        Top = 135
        Width = 73
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 26
        OnKeyPress = Produto_Estoque_InicialKeyPress
      end
      object Produto_Estoque_Minimo: TEdit
        Left = 97
        Top = 135
        Width = 73
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 27
        OnKeyPress = Produto_Estoque_AtualKeyPress
      end
      object Produto_Revenda: TCheckBox
        Left = 540
        Top = 138
        Width = 140
        Height = 13
        Caption = 'Este produto '#233' Revenda'
        TabOrder = 28
        WordWrap = True
      end
      object Produto_NCM: TEdit
        Left = 153
        Top = 161
        Width = 54
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 19
        OnKeyPress = Produto_NCMKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 196
      Width = 692
      Height = 75
      Caption = '   Descri'#231#227'o Detalhada   '
      TabOrder = 1
      object Produto_Descricao_Detalhada: TMemo
        Left = 8
        Top = 15
        Width = 676
        Height = 50
        Ctl3D = False
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 0
        WantReturns = False
      end
    end
  end
  object Panel2: TPanel
    Left = 5
    Top = 293
    Width = 707
    Height = 316
    TabOrder = 2
    object GroupBox3: TGroupBox
      Left = 8
      Top = 2
      Width = 692
      Height = 307
      Caption = '   Processo Industrial   '
      TabOrder = 0
      object Label24: TLabel
        Left = 5
        Top = 40
        Width = 45
        Height = 13
        Caption = 'Legenda:'
      end
      object Label25: TLabel
        Left = 542
        Top = 19
        Width = 44
        Height = 13
        Caption = 'Visualizar'
      end
      object Label26: TLabel
        Left = 7
        Top = 289
        Width = 248
        Height = 13
        Caption = 'Total de Sequ'#234'ncias de Estrutura para este Produto:'
      end
      object Qtde_Sequencia_Estrutura: TLabel
        Left = 263
        Top = 289
        Width = 8
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 53
        Top = 40
        Width = 63
        Height = 13
        Caption = '  ET - Etapa  '
        Color = 2652459
        ParentColor = False
      end
      object Label29: TLabel
        Left = 126
        Top = 40
        Width = 80
        Height = 13
        Caption = '  PR - Processo  '
        Color = 3780158
        ParentColor = False
      end
      object Label30: TLabel
        Left = 218
        Top = 40
        Width = 101
        Height = 13
        Caption = '  SP - Sub-Processo  '
        Color = 4709198
        ParentColor = False
      end
      object Label31: TLabel
        Left = 332
        Top = 40
        Width = 93
        Height = 13
        Caption = '  IT - Item/Produto  '
        Color = 5372249
        ParentColor = False
      end
      object Label32: TLabel
        Left = 210
        Top = 40
        Width = 4
        Height = 13
        Caption = '||'
      end
      object Label33: TLabel
        Left = 119
        Top = 40
        Width = 4
        Height = 13
        Caption = '||'
      end
      object Label34: TLabel
        Left = 324
        Top = 40
        Width = 4
        Height = 13
        Caption = '||'
      end
      object BT_Produto: TBitBtn
        Left = 5
        Top = 13
        Width = 115
        Height = 25
        Caption = 'Adicionar Etapa'
        TabOrder = 0
        OnClick = BT_ProdutoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object BitBtn1: TBitBtn
        Left = 123
        Top = 13
        Width = 125
        Height = 25
        Caption = 'Adicionar Processo'
        TabOrder = 1
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 251
        Top = 13
        Width = 145
        Height = 25
        Caption = 'Adicionar Sub-Processo'
        TabOrder = 2
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object BitBtn3: TBitBtn
        Left = 399
        Top = 13
        Width = 100
        Height = 25
        Caption = 'Adicionar Item'
        TabOrder = 3
        OnClick = BitBtn3Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object Opcao_Visualizar: TComboBox
        Left = 590
        Top = 16
        Width = 95
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 4
        Text = '--- Todos ---'
        OnChange = Opcao_VisualizarChange
        Items.Strings = (
          '--- Todos ---'
          'Etapa'
          'Processo'
          'Sub-Processo'
          'Item')
      end
      object DBGrid_Custos: TDBGrid
        Left = 6
        Top = 56
        Width = 679
        Height = 230
        Ctl3D = False
        DataSource = ConexaoBD.DS_Produtos_Estruturas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid_CustosCellClick
        OnDrawColumnCell = DBGrid_CustosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'fb_produto_estrutura_numero'
            Title.Caption = 'Nro.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'fb_produto_estrutura_sequencia'
            Title.Caption = 'Sequ'#234'ncia'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_produto_estrutura_tipo'
            Title.Caption = 'Tipo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_produto_estrutura_qtde'
            Title.Caption = 'Qtde.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_produto_estrutura_medida'
            Title.Caption = 'Medida'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_produto_estrutura_item_codigo'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_produto_estrutura_descricao'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 365
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_produto_estrutura_custo'
            Title.Caption = 'Custo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_produto_estrutura_vlr_custo_unitario'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'fb_produto_estrutura_codigo'
            Visible = False
          end>
      end
    end
  end
end
