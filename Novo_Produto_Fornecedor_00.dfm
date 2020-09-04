object NovoProdutoFornecedor00: TNovoProdutoFornecedor00
  Left = 306
  Top = 421
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Adicionar Novo Produto ao Fornecedor'
  ClientHeight = 219
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
    Top = 173
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
    Height = 163
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 692
      Height = 151
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
        Top = 82
        Width = 21
        Height = 13
        Caption = 'Lote'
      end
      object Label6: TLabel
        Left = 84
        Top = 82
        Width = 81
        Height = 13
        Caption = 'C'#243'digo de Barras'
      end
      object Label7: TLabel
        Left = 212
        Top = 82
        Width = 40
        Height = 13
        Caption = 'Unidade'
      end
      object Label8: TLabel
        Left = 260
        Top = 82
        Width = 69
        Height = 13
        Caption = 'Unid.Pesagem'
      end
      object Label9: TLabel
        Left = 338
        Top = 82
        Width = 24
        Height = 13
        Caption = 'Peso'
      end
      object Label10: TLabel
        Left = 430
        Top = 82
        Width = 69
        Height = 13
        Caption = 'Estoque Inicial'
      end
      object Label11: TLabel
        Left = 508
        Top = 82
        Width = 66
        Height = 13
        Caption = 'Estoque Atual'
      end
      object Label12: TLabel
        Left = 605
        Top = 81
        Width = 77
        Height = 13
        Caption = #218'ltima Altera'#231#227'o'
      end
      object Label13: TLabel
        Left = 8
        Top = 124
        Width = 92
        Height = 13
        Caption = 'Classifica'#231#227'o Fiscal'
      end
      object Label14: TLabel
        Left = 121
        Top = 124
        Width = 109
        Height = 13
        Caption = 'Classifica'#231#227'o Tribut'#225'ria'
      end
      object Label27: TLabel
        Left = 437
        Top = 124
        Width = 91
        Height = 13
        Caption = 'Aparece no Pedido'
      end
      object Label16: TLabel
        Left = 587
        Top = 124
        Width = 45
        Height = 13
        Caption = 'Pre'#231'o R$'
      end
      object Label15: TLabel
        Left = 260
        Top = 124
        Width = 30
        Height = 13
        Caption = 'IPI (%)'
      end
      object Label17: TLabel
        Left = 342
        Top = 124
        Width = 43
        Height = 13
        Caption = 'ICMS (%)'
      end
      object Label18: TLabel
        Left = 8
        Top = 66
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
        Left = 186
        Top = 66
        Width = 300
        Height = 13
        Caption = '(A Refer'#234'ncia '#233' o C'#243'digo do Produto Utilizado pelo Fornecedor)'
      end
      object Label21: TLabel
        Left = 10
        Top = 48
        Width = 380
        Height = 13
        Caption = 
          'Ex.: Letra C + Nro.Fornecedor + Posi'#231#227'o do Produto, Ex.: C9090-0' +
          '1 ou C909001'
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
        OnKeyPress = Produto_CodigoKeyPress
      end
      object Produto_Descricao: TEdit
        Left = 133
        Top = 28
        Width = 250
        Height = 19
        Ctl3D = False
        MaxLength = 100
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
        Top = 97
        Width = 71
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 11
        ParentCtl3D = False
        TabOrder = 6
        Text = '0'
        OnKeyPress = Produto_LoteKeyPress
      end
      object Produto_Codigo_Barras: TEdit
        Left = 84
        Top = 97
        Width = 88
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 7
        Text = '0'
        OnKeyPress = Produto_Codigo_BarrasKeyPress
      end
      object Produto_Unidade: TEdit
        Left = 212
        Top = 97
        Width = 42
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 8
        OnKeyPress = Produto_UnidadeKeyPress
      end
      object Produto_Unidade_Pesagem: TEdit
        Left = 260
        Top = 97
        Width = 72
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 9
        OnKeyPress = Produto_Unidade_PesagemKeyPress
      end
      object Produto_Peso: TEdit
        Left = 338
        Top = 97
        Width = 53
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 10
        Text = '0'
        OnKeyPress = Produto_PesoKeyPress
      end
      object Produto_Estoque_Inicial: TEdit
        Left = 430
        Top = 97
        Width = 73
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 11
        Text = '0'
        OnKeyPress = Produto_Estoque_InicialKeyPress
      end
      object Produto_Estoque_Atual: TEdit
        Left = 508
        Top = 97
        Width = 73
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 12
        Text = '0'
        OnKeyPress = Produto_Estoque_AtualKeyPress
      end
      object Produto_Data_Alteracao: TMaskEdit
        Left = 618
        Top = 96
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 13
        Text = '  /  /    '
        OnKeyPress = Produto_Data_AlteracaoKeyPress
      end
      object Produto_Classif_Fiscal: TEdit
        Left = 103
        Top = 121
        Width = 15
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        MaxLength = 1
        ParentCtl3D = False
        TabOrder = 14
        Text = 'C'
        OnKeyPress = Produto_Classif_FiscalKeyPress
      end
      object Produto_Classif_Tributaria: TEdit
        Left = 233
        Top = 121
        Width = 25
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 15
        Text = '0'
        OnKeyPress = Produto_Classif_TributariaKeyPress
      end
      object Produto_Pedido_Padrao: TComboBox
        Left = 531
        Top = 121
        Width = 50
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        Enabled = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 18
        Text = 'N'#227'o'
        OnKeyPress = Produto_DescontoKeyPress
        Items.Strings = (
          'N'#227'o'
          'Sim')
      end
      object Produto_Preco: TEdit
        Left = 636
        Top = 121
        Width = 46
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 19
        Text = '0,00'
        OnKeyPress = Produto_Preco_DuplyKeyPress
      end
      object Produto_IPI: TEdit
        Left = 294
        Top = 121
        Width = 45
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 16
        Text = '0'
        OnKeyPress = Produto_IPIKeyPress
      end
      object Produto_ICMS: TEdit
        Left = 389
        Top = 121
        Width = 45
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 17
        Text = '0'
        OnKeyPress = Produto_ICMSKeyPress
      end
      object Produto_Referencia: TEdit
        Left = 64
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
        Enabled = False
        MaxLength = 11
        ParentCtl3D = False
        TabOrder = 5
        Text = '0'
        OnKeyPress = Produto_FornecedorKeyPress
      end
    end
  end
end
