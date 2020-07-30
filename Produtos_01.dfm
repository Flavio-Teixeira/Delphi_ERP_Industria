object Produtos01: TProdutos01
  Left = 366
  Top = 198
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos - INCLUS'#195'O'
  ClientHeight = 401
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
    Top = 353
    Width = 708
    Height = 41
    TabOrder = 1
    object BT_Incluir: TBitBtn
      Left = 317
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
      Left = 625
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
    object Produto_Tipo_Cadastro: TEdit
      Left = 8
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 4
    Width = 707
    Height = 341
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 692
      Height = 197
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
        Top = 84
        Width = 21
        Height = 13
        Caption = 'Lote'
      end
      object Label6: TLabel
        Left = 97
        Top = 84
        Width = 81
        Height = 13
        Caption = 'C'#243'digo de Barras'
      end
      object Label7: TLabel
        Left = 203
        Top = 84
        Width = 40
        Height = 13
        Caption = 'Unidade'
      end
      object Label8: TLabel
        Left = 263
        Top = 84
        Width = 69
        Height = 13
        Caption = 'Unid.Pesagem'
      end
      object Label9: TLabel
        Left = 353
        Top = 84
        Width = 24
        Height = 13
        Caption = 'Peso'
      end
      object Label10: TLabel
        Left = 192
        Top = 122
        Width = 69
        Height = 13
        Caption = 'Estoque Inicial'
      end
      object Label11: TLabel
        Left = 283
        Top = 122
        Width = 66
        Height = 13
        Caption = 'Estoque Atual'
      end
      object Label12: TLabel
        Left = 605
        Top = 84
        Width = 77
        Height = 13
        Caption = #218'ltima Altera'#231#227'o'
      end
      object Label13: TLabel
        Left = 8
        Top = 172
        Width = 92
        Height = 13
        Caption = 'Classifica'#231#227'o Fiscal'
      end
      object Label14: TLabel
        Left = 218
        Top = 172
        Width = 109
        Height = 13
        Caption = 'Classifica'#231#227'o Tribut'#225'ria'
      end
      object Label27: TLabel
        Left = 437
        Top = 172
        Width = 91
        Height = 13
        Caption = 'Aparece no Pedido'
        Visible = False
      end
      object Label16: TLabel
        Left = 587
        Top = 172
        Width = 45
        Height = 13
        Caption = 'Pre'#231'o R$'
      end
      object Label15: TLabel
        Left = 387
        Top = 125
        Width = 30
        Height = 13
        Caption = 'IPI (%)'
      end
      object Label17: TLabel
        Left = 374
        Top = 148
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
        Left = 133
        Top = 48
        Width = 43
        Height = 13
        Caption = 'Desenho'
      end
      object Label21: TLabel
        Left = 233
        Top = 48
        Width = 15
        Height = 13
        Caption = 'OS'
      end
      object Label22: TLabel
        Left = 333
        Top = 48
        Width = 62
        Height = 13
        Caption = 'Equipamento'
      end
      object Label23: TLabel
        Left = 433
        Top = 48
        Width = 37
        Height = 13
        Caption = 'Material'
      end
      object Label24: TLabel
        Left = 423
        Top = 84
        Width = 57
        Height = 13
        Caption = 'Localiza'#231#227'o'
      end
      object Label25: TLabel
        Left = 8
        Top = 122
        Width = 65
        Height = 13
        Caption = 'Estoque Ideal'
      end
      object Label26: TLabel
        Left = 99
        Top = 122
        Width = 77
        Height = 13
        Caption = 'Estoque M'#237'nimo'
      end
      object Label28: TLabel
        Left = 127
        Top = 172
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
        MaxLength = 50
        ParentCtl3D = False
        TabOrder = 0
        OnExit = Produto_CodigoExit
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
        Top = 99
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
        Top = 99
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
        Top = 99
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
        Top = 99
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
        Top = 99
        Width = 53
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 14
        OnKeyPress = Produto_PesoKeyPress
      end
      object Produto_Estoque_Inicial: TEdit
        Left = 192
        Top = 137
        Width = 73
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 19
        OnKeyPress = Produto_Estoque_InicialKeyPress
      end
      object Produto_Estoque_Atual: TEdit
        Left = 283
        Top = 137
        Width = 73
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 20
        OnKeyPress = Produto_Estoque_AtualKeyPress
      end
      object Produto_Data_Alteracao: TMaskEdit
        Left = 618
        Top = 99
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 16
        Text = '  /  /    '
        OnKeyPress = Produto_Data_AlteracaoKeyPress
      end
      object Produto_Classif_Fiscal: TEdit
        Left = 103
        Top = 169
        Width = 15
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 1
        ParentCtl3D = False
        TabOrder = 21
        OnKeyPress = Produto_Classif_FiscalKeyPress
      end
      object Produto_Classif_Tributaria: TEdit
        Left = 330
        Top = 169
        Width = 25
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 23
        OnKeyPress = Produto_Classif_TributariaKeyPress
      end
      object Produto_Pedido_Padrao: TComboBox
        Left = 531
        Top = 169
        Width = 50
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 26
        Text = 'N'#227'o'
        Visible = False
        OnKeyPress = Produto_DescontoKeyPress
        Items.Strings = (
          'N'#227'o'
          'Sim')
      end
      object Produto_Preco: TEdit
        Left = 636
        Top = 169
        Width = 46
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 27
        OnKeyPress = Produto_Preco_DuplyKeyPress
      end
      object Produto_IPI: TEdit
        Left = 421
        Top = 122
        Width = 45
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 24
        OnKeyPress = Produto_IPIKeyPress
      end
      object Produto_ICMS: TEdit
        Left = 421
        Top = 145
        Width = 45
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 25
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
        Left = 629
        Top = 58
        Width = 52
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 11
        ParentCtl3D = False
        TabOrder = 9
        Text = '0'
        OnKeyPress = Produto_FornecedorKeyPress
      end
      object produto_desenho: TEdit
        Left = 133
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
        Left = 233
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
        Left = 333
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
        Left = 433
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
        Left = 422
        Top = 99
        Width = 179
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 15
        OnKeyPress = produto_localizacaoKeyPress
      end
      object Produto_Estoque_Ideal: TEdit
        Left = 8
        Top = 137
        Width = 73
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 17
        OnKeyPress = Produto_Estoque_InicialKeyPress
      end
      object Produto_Estoque_Minimo: TEdit
        Left = 99
        Top = 137
        Width = 73
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 18
        OnKeyPress = Produto_Estoque_AtualKeyPress
      end
      object Produto_Revenda: TCheckBox
        Left = 535
        Top = 140
        Width = 140
        Height = 13
        Caption = 'Este produto '#233' Revenda'
        TabOrder = 28
        WordWrap = True
      end
      object Produto_NCM: TEdit
        Left = 155
        Top = 169
        Width = 54
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 22
        OnKeyPress = Produto_NCMKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 205
      Width = 692
      Height = 124
      Caption = '   Descri'#231#227'o Detalhada   '
      TabOrder = 1
      object Produto_Descricao_Detalhada: TMemo
        Left = 8
        Top = 15
        Width = 676
        Height = 100
        Ctl3D = False
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 0
        WantReturns = False
      end
    end
  end
end
