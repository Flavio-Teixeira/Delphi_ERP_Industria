object RegistroPapeletasSaidas01: TRegistroPapeletasSaidas01
  Left = 336
  Top = 176
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Registro de Papeletas - INCLUS'#195'O'
  ClientHeight = 505
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
    Top = 457
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
    object Nro_Natureza_Operacao: TEdit
      Left = 656
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Text = '0'
      Visible = False
    end
    object Cliente_Endereco_Cobranca: TEdit
      Left = 445
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Cliente_Complemento_Cobranca: TEdit
      Left = 453
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object Cliente_Bairro_Cobranca: TEdit
      Left = 461
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
    object Cliente_Cidade_Cobranca: TEdit
      Left = 469
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
    end
    object Cliente_Estado_Cobranca: TEdit
      Left = 477
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 7
      Visible = False
    end
    object Cliente_Pais_Cobranca: TEdit
      Left = 493
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 8
      Visible = False
    end
    object Cliente_Cep_Cobranca: TEdit
      Left = 485
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 9
      Visible = False
    end
    object Nro_Tipo_Tabela: TEdit
      Left = 512
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 10
      Text = '0'
      Visible = False
    end
    object Nro_Transportadora: TEdit
      Left = 520
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 11
      Text = '0'
      Visible = False
    end
    object Nro_Pgto_Frete: TEdit
      Left = 528
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 12
      Text = '0'
      Visible = False
    end
    object Cliente_Codigo_Tipo: TEdit
      Left = 544
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 13
      Visible = False
    end
    object Cliente_Tipo_Pessoa: TEdit
      Left = 552
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 14
      Visible = False
    end
    object Cliente_Inscricao_Estadual: TEdit
      Left = 560
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 15
      Visible = False
    end
    object Codigo_Transportadora: TEdit
      Left = 568
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 16
      Visible = False
    end
    object ETP_Resultado: TEdit
      Left = 582
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 17
      Visible = False
    end
    object ETP_Data_Emissao_Nota: TEdit
      Left = 590
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 18
      Visible = False
    end
    object ETP_Numero_Nota: TEdit
      Left = 598
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 19
      Visible = False
    end
    object Cliente_Vendedor: TEdit
      Left = 614
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 20
      Visible = False
    end
    object Cliente_Banco: TEdit
      Left = 622
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 21
      Visible = False
    end
    object Nro_Pedido_Faturado: TEdit
      Left = 648
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 80
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 22
      Text = '0'
      Visible = False
    end
    object Cliente_Suframa: TEdit
      Left = 630
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 23
      Visible = False
    end
    object Cliente_Estado: TComboBox
      Left = 417
      Top = 21
      Width = 8
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      Enabled = False
      ItemHeight = 13
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 24
      Text = 'AC'
      Visible = False
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RN'
        'RS'
        'RJ'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO'
        '--')
    end
    object Cliente_Cep: TMaskEdit
      Left = 426
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      EditMask = '00000\-999;1;_'
      MaxLength = 9
      ParentCtl3D = False
      TabOrder = 25
      Text = '     -   '
      Visible = False
    end
    object Cliente_Pais: TComboBox
      Left = 435
      Top = 22
      Width = 8
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      Enabled = False
      ItemHeight = 13
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 26
      Text = 'Brasil'
      Visible = False
      Items.Strings = (
        'Brasil'
        'Argentina'
        'Am'#233'rica Central'
        'Bol'#237'via'
        'Canad'#225
        'Chile'
        'Col'#244'mbia'
        'Equador'
        'Estados Unidos'
        'Paraguai'
        'Portugal'
        'Uruguai')
    end
    object Cliente_Endereco: TEdit
      Left = 443
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 27
      Visible = False
    end
    object Cliente_Cidade: TEdit
      Left = 467
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 28
      Visible = False
    end
    object Cliente_Contato: TEdit
      Left = 451
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 29
      Visible = False
    end
    object Cliente_Bairro: TEdit
      Left = 459
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 30
      Visible = False
    end
    object Cliente_Email: TEdit
      Left = 475
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 31
      Visible = False
    end
    object Cliente_Fone_Fax: TEdit
      Left = 483
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 32
      Visible = False
    end
    object Cliente_Fone_Comercial: TEdit
      Left = 499
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 33
      Visible = False
    end
    object Cliente_Fone_Celular: TEdit
      Left = 491
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 34
      Visible = False
    end
    object Cliente_Tipo_Faturamento: TComboBox
      Left = 509
      Top = 22
      Width = 8
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      ItemHeight = 13
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 35
      Text = 'Nota Fiscal'
      Visible = False
      Items.Strings = (
        'Nota Fiscal'
        'Or'#231'amento')
    end
    object Cliente_Site: TEdit
      Left = 518
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 36
      Visible = False
    end
    object Cliente_Complemento: TEdit
      Left = 526
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 37
      Visible = False
    end
    object Cliente_DDD: TEdit
      Left = 534
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 38
      Visible = False
    end
    object Cliente_Fone_Residencial: TEdit
      Left = 542
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 39
      Visible = False
    end
    object BT_Alterar: TBitBtn
      Left = 295
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 40
      Visible = False
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
      Left = 384
      Top = 8
      Width = 74
      Height = 25
      Caption = 'Excluir'
      TabOrder = 41
      Visible = False
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
    object Programa_Anterior: TEdit
      Left = 550
      Top = 22
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 42
      Visible = False
    end
    object Cliente_Fone_Ramal: TEdit
      Left = 566
      Top = 23
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 43
      Visible = False
    end
    object IPI_Zerado: TEdit
      Left = 575
      Top = 23
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 44
      Visible = False
    end
    object Edit_Tipo_Inclusao: TEdit
      Left = 592
      Top = 24
      Width = 8
      Height = 21
      TabOrder = 45
      Text = 'Edit_Tipo_Inclusao'
      Visible = False
    end
    object Imprime_Nota_Tela: TRadioButton
      Left = 11
      Top = 3
      Width = 169
      Height = 17
      Caption = 'N'#227'o imprimir, aparecer na tela'
      Checked = True
      TabOrder = 46
      TabStop = True
    end
    object Imprime_Nota_Apos: TRadioButton
      Left = 11
      Top = 21
      Width = 246
      Height = 17
      Caption = 'Imprimir a Nota Fiscal ap'#243's Inclus'#227'o/Altera'#231#227'o'
      TabOrder = 47
    end
  end
  object Panel1: TPanel
    Left = 4
    Top = 396
    Width = 753
    Height = 54
    TabOrder = 1
    object GroupBox5: TGroupBox
      Left = 6
      Top = 2
      Width = 742
      Height = 47
      Caption = '   Dados da Nota   '
      TabOrder = 0
      object Label13: TLabel
        Left = 150
        Top = 21
        Width = 67
        Height = 13
        Caption = 'Vlr.Total Prod.'
      end
      object Label14: TLabel
        Left = 11
        Top = 21
        Width = 51
        Height = 13
        Caption = 'Valor Frete'
      end
      object Label18: TLabel
        Left = 304
        Top = 21
        Width = 65
        Height = 13
        Caption = 'Vlr.Total Nota'
      end
      object Nota_Valor_Produto: TEdit
        Left = 220
        Top = 18
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 0
        Text = '0,00'
        OnExit = Nota_Valor_ProdutoExit
        OnKeyPress = Nota_Valor_ProdutoKeyPress
      end
      object Valor_Frete: TEdit
        Left = 66
        Top = 18
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 1
        Text = '0,00'
        OnExit = Valor_FreteExit
        OnKeyPress = Valor_FreteKeyPress
      end
      object Valor_Total: TEdit
        Left = 372
        Top = 18
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 2
        Text = '0,00'
        OnExit = Valor_TotalExit
        OnKeyPress = Valor_TotalKeyPress
      end
      object Valor_Desconto: TEdit
        Left = 726
        Top = 63
        Width = 8
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
      end
    end
  end
  object Panel2: TPanel
    Left = 4
    Top = 0
    Width = 753
    Height = 393
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 6
      Top = 1
      Width = 741
      Height = 58
      Caption = '  Dados do Cliente   '
      TabOrder = 0
      object Label21: TLabel
        Left = 8
        Top = 14
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label3: TLabel
        Left = 119
        Top = 14
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Cliente_Codigo: TEdit
        Left = 8
        Top = 29
        Width = 109
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 11
        ParentCtl3D = False
        TabOrder = 0
      end
      object Cliente_Nome: TEdit
        Left = 119
        Top = 29
        Width = 462
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 1
      end
      object BT_Procurar: TBitBtn
        Left = 584
        Top = 32
        Width = 150
        Height = 22
        Caption = 'Procurar por Cliente'
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
      object BT_Procurar_Fornecedores: TBitBtn
        Left = 584
        Top = 8
        Width = 150
        Height = 22
        Caption = 'Procurar por Fornecedor'
        TabOrder = 3
        WordWrap = True
        OnClick = BT_Procurar_FornecedoresClick
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
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 59
      Width = 461
      Height = 158
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
      object Label34: TLabel
        Left = 143
        Top = 15
        Width = 40
        Height = 13
        Caption = 'C.F.O.P.'
      end
      object Label4: TLabel
        Left = 211
        Top = 15
        Width = 108
        Height = 13
        Caption = 'Natureza da Opera'#231#227'o'
      end
      object Label48: TLabel
        Left = 6
        Top = 52
        Width = 51
        Height = 13
        Caption = 'Transporte'
      end
      object Label2: TLabel
        Left = 86
        Top = 52
        Width = 64
        Height = 13
        Caption = 'Pgto do Frete'
      end
      object Label49: TLabel
        Left = 158
        Top = 53
        Width = 72
        Height = 13
        Caption = 'Transportadora'
      end
      object Label52: TLabel
        Left = 338
        Top = 52
        Width = 50
        Height = 13
        Caption = 'Emite Lote'
      end
      object Label30: TLabel
        Left = 6
        Top = 89
        Width = 181
        Height = 13
        Caption = 'Obs. Nota Fiscal ou Ordem de Servi'#231'o'
      end
      object Label31: TLabel
        Left = 230
        Top = 88
        Width = 57
        Height = 13
        Caption = 'Obs. Cliente'
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
      object Cliente_CFOP: TEdit
        Left = 143
        Top = 30
        Width = 65
        Height = 19
        Ctl3D = False
        MaxLength = 11
        ParentCtl3D = False
        TabOrder = 2
        Text = '5.101'
        OnKeyPress = Cliente_CFOPKeyPress
      end
      object Natureza_Operacao: TComboBox
        Left = 210
        Top = 30
        Width = 111
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        OnChange = Natureza_OperacaoChange
        OnKeyPress = Natureza_OperacaoKeyPress
      end
      object Cliente_Tipo_Transporte: TComboBox
        Left = 6
        Top = 67
        Width = 77
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 4
        Text = 'Rodovi'#225'rio'
        OnKeyPress = Cliente_Tipo_TransporteKeyPress
        Items.Strings = (
          'Rodovi'#225'rio'
          'A'#233'reo'
          'Mar'#237'timo'
          'Ferrovi'#225'rio')
      end
      object Cliente_Pgto_Frete: TComboBox
        Left = 86
        Top = 67
        Width = 69
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 5
        Text = 'Cliente'
        OnKeyPress = Cliente_Pgto_FreteKeyPress
        Items.Strings = (
          'Cliente'
          'Ibrasmak')
      end
      object Cliente_Transportadora: TComboBox
        Left = 158
        Top = 67
        Width = 177
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = Cliente_TransportadoraKeyPress
      end
      object Cliente_Emite_Lote: TComboBox
        Left = 338
        Top = 67
        Width = 50
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 7
        Text = 'N'#227'o'
        OnKeyPress = Cliente_Emite_LoteKeyPress
        Items.Strings = (
          'N'#227'o'
          'Sim')
      end
      object Observacao_Nota: TMemo
        Left = 6
        Top = 103
        Width = 220
        Height = 35
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 330
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 8
        WantReturns = False
      end
      object Cliente_Observacao: TMemo
        Left = 230
        Top = 103
        Width = 220
        Height = 35
        Ctl3D = False
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 9
      end
      object Observacao_Corpo_Nota: TCheckBox
        Left = 6
        Top = 138
        Width = 249
        Height = 17
        Caption = 'Imprimir a Observa'#231#227'o no Corpo da Nota'
        TabOrder = 10
      end
    end
    object GroupBox3: TGroupBox
      Left = 6
      Top = 217
      Width = 741
      Height = 170
      Caption = '   Dados do Produto   '
      TabOrder = 2
      object BT_Adicionar: TBitBtn
        Left = 120
        Top = 142
        Width = 200
        Height = 25
        Caption = 'Adicionar Produtos da Ibrasmak'
        TabOrder = 0
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
      object SGD_Produtos: TStringGrid
        Left = 7
        Top = 14
        Width = 727
        Height = 125
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
        TabOrder = 1
        OnDblClick = SGD_ProdutosDblClick
        OnKeyPress = SGD_ProdutosKeyPress
      end
      object BT_Adicionar_Fora: TBitBtn
        Left = 352
        Top = 142
        Width = 270
        Height = 25
        Caption = 'Adicionar Produtos que N'#227'o Existem na Ibrasmak'
        TabOrder = 2
        OnClick = BT_Adicionar_ForaClick
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
    object PageControl1: TPageControl
      Left = 469
      Top = 64
      Width = 277
      Height = 153
      ActivePage = Pagina1
      TabOrder = 3
      object Pagina1: TTabSheet
        Caption = 'Op'#231#245'es Complementares'
        object Label46: TLabel
          Left = 13
          Top = 15
          Width = 63
          Height = 13
          Caption = 'Desconto (%)'
        end
        object Label37: TLabel
          Left = 13
          Top = 65
          Width = 158
          Height = 13
          Caption = 'Nro. Ordem de Compra do Cliente'
        end
        object Cliente_Desconto: TEdit
          Left = 13
          Top = 30
          Width = 64
          Height = 19
          Ctl3D = False
          MaxLength = 7
          ParentCtl3D = False
          TabOrder = 0
          Text = '0'
          OnExit = Cliente_DescontoExit
          OnKeyPress = Cliente_DescontoKeyPress
        end
        object Cliente_Ordem_Compra: TEdit
          Left = 13
          Top = 79
          Width = 156
          Height = 19
          Ctl3D = False
          MaxLength = 20
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Cliente_Ordem_CompraKeyPress
        end
        object DBG_Observacao_Nota: TDBMemo
          Left = 254
          Top = 102
          Width = 8
          Height = 19
          Ctl3D = False
          DataField = 'fb_natureza_operacao_observacao_nota'
          DataSource = ConexaoBD.DS_Natureza_Operacao
          ParentCtl3D = False
          TabOrder = 2
          Visible = False
        end
      end
      object Pagina2: TTabSheet
        Caption = 'Condi'#231#245'es de Pagamento'
        ImageIndex = 1
        object Label5: TLabel
          Left = 140
          Top = 36
          Width = 56
          Height = 13
          Caption = 'Valor 1 - R$'
        end
        object Label6: TLabel
          Left = 140
          Top = 57
          Width = 56
          Height = 13
          Caption = 'Valor 2 - R$'
        end
        object Label7: TLabel
          Left = 140
          Top = 78
          Width = 56
          Height = 13
          Caption = 'Valor 3 - R$'
        end
        object Label19: TLabel
          Left = 140
          Top = 99
          Width = 56
          Height = 13
          Caption = 'Valor 4 - R$'
        end
        object Label20: TLabel
          Left = 17
          Top = 36
          Width = 43
          Height = 13
          Caption = 'Vencto 1'
        end
        object Label27: TLabel
          Left = 17
          Top = 57
          Width = 43
          Height = 13
          Caption = 'Vencto 2'
        end
        object Label33: TLabel
          Left = 17
          Top = 78
          Width = 43
          Height = 13
          Caption = 'Vencto 3'
        end
        object Label35: TLabel
          Left = 17
          Top = 99
          Width = 43
          Height = 13
          Caption = 'Vencto 4'
        end
        object Cliente_Condicao_Pgto_Vlr_1: TEdit
          Left = 200
          Top = 33
          Width = 59
          Height = 19
          Ctl3D = False
          MaxLength = 13
          ParentCtl3D = False
          TabOrder = 1
          Text = '0,00'
          OnExit = Cliente_Condicao_Pgto_Vlr_1Exit
          OnKeyPress = Cliente_Condicao_Pgto_Vlr_1KeyPress
        end
        object Cliente_Condicao_Pgto_1: TMaskEdit
          Left = 63
          Top = 33
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 0
          Text = '  /  /    '
          OnKeyPress = Cliente_Condicao_Pgto_1KeyPress
        end
        object Cliente_Condicao_Pgto_2: TMaskEdit
          Left = 63
          Top = 54
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 2
          Text = '  /  /    '
          OnKeyPress = Cliente_Condicao_Pgto_2KeyPress
        end
        object Cliente_Condicao_Pgto_3: TMaskEdit
          Left = 63
          Top = 75
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 4
          Text = '  /  /    '
          OnKeyPress = Cliente_Condicao_Pgto_3KeyPress
        end
        object Cliente_Condicao_Pgto_4: TMaskEdit
          Left = 63
          Top = 96
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 6
          Text = '  /  /    '
          OnKeyPress = Cliente_Condicao_Pgto_4KeyPress
        end
        object Cliente_Condicao_Pgto_Vlr_2: TEdit
          Left = 200
          Top = 54
          Width = 59
          Height = 19
          Ctl3D = False
          MaxLength = 13
          ParentCtl3D = False
          TabOrder = 3
          Text = '0,00'
          OnExit = Cliente_Condicao_Pgto_Vlr_2Exit
          OnKeyPress = Cliente_Condicao_Pgto_Vlr_2KeyPress
        end
        object Cliente_Condicao_Pgto_Vlr_3: TEdit
          Left = 200
          Top = 75
          Width = 59
          Height = 19
          Ctl3D = False
          MaxLength = 13
          ParentCtl3D = False
          TabOrder = 5
          Text = '0,00'
          OnExit = Cliente_Condicao_Pgto_Vlr_3Exit
          OnKeyPress = Cliente_Condicao_Pgto_Vlr_3KeyPress
        end
        object Cliente_Condicao_Pgto_Vlr_4: TEdit
          Left = 200
          Top = 96
          Width = 59
          Height = 19
          Ctl3D = False
          MaxLength = 13
          ParentCtl3D = False
          TabOrder = 7
          Text = '0,00'
          OnExit = Cliente_Condicao_Pgto_Vlr_4Exit
          OnKeyPress = Cliente_Condicao_Pgto_Vlr_4KeyPress
        end
        object Opcao_Sem_Duplicata: TCheckBox
          Left = 16
          Top = 6
          Width = 169
          Height = 17
          Caption = 'Esta nota n'#227'o possui dulicatas'
          TabOrder = 8
        end
      end
    end
  end
  object Imprimir: TImpMat
    Linhas = 66
    Colunas = 195
    TipoImp = tiBobina
    ControleServico = False
    ArqDestino = 'LPT1'
    ImprimeLinhasFinais = True
    ImprimeEspDireita = False
    Acentuacao = acANSI
    Left = 253
    Top = 460
  end
end
