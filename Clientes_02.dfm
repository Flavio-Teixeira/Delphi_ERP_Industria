object Clientes02: TClientes02
  Left = 334
  Top = 126
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes - ALTERA'#199#195'O / EXCLUS'#195'O'
  ClientHeight = 543
  ClientWidth = 762
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 4
    Top = 497
    Width = 753
    Height = 41
    TabOrder = 0
    object BT_Sair: TBitBtn
      Left = 670
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
      Left = 301
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
      Left = 381
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
    object Nro_Banco: TEdit
      Left = 12
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Nro_Representante: TEdit
      Left = 20
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object Nro_Transportadora: TEdit
      Left = 28
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
    object Programa_Anterior: TEdit
      Left = 36
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
    end
    object Nro_Cliente_Tipo_Empresa: TEdit
      Left = 44
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 7
      Visible = False
    end
    object Nro_Pgto_Frete: TEdit
      Left = 52
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 8
      Visible = False
    end
    object Item_Acesso: TEdit
      Left = 60
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
      Visible = False
    end
    object Tipo_Acesso: TEdit
      Left = 68
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
      Visible = False
    end
    object btnVisualizar: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 11
      OnClick = btnVisualizarClick
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
    object BT_Anterior: TButton
      Left = 524
      Top = 8
      Width = 40
      Height = 25
      Caption = '<<<'
      TabOrder = 12
      OnClick = BT_AnteriorClick
    end
    object BT_Proximo: TButton
      Left = 569
      Top = 8
      Width = 40
      Height = 25
      Caption = '>>>'
      TabOrder = 13
      OnClick = BT_ProximoClick
    end
    object SGD_Movto_Clientes: TStringGrid
      Left = 476
      Top = 10
      Width = 40
      Height = 19
      ColCount = 3
      Ctl3D = False
      DefaultRowHeight = 19
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 14
      Visible = False
      ColWidths = (
        64
        64
        64)
    end
    object Movto_Pos_Total: TEdit
      Left = 420
      Top = 8
      Width = 20
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 15
      Text = '0'
      Visible = False
    end
    object Movto_Pos_Atual: TEdit
      Left = 440
      Top = 8
      Width = 20
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 16
      Text = '0'
      Visible = False
    end
    object DBG_Cliente_Observacao_Nota: TDBMemo
      Left = 94
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_cliente_observacoes_nota'
      DataSource = ConexaoBD.DS_Clientes
      ParentCtl3D = False
      TabOrder = 17
      Visible = False
    end
    object DBG_Cliente_Observacao: TDBMemo
      Left = 86
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_cliente_observacoes'
      DataSource = ConexaoBD.DS_Clientes
      ParentCtl3D = False
      TabOrder = 18
      Visible = False
    end
    object BT_Nova: TBitBtn
      Left = 99
      Top = 8
      Width = 188
      Height = 25
      Caption = '&Nova Ficha com Mesmos Dados'
      TabOrder = 19
      OnClick = BT_NovaClick
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
  end
  object Panel1: TPanel
    Left = 5
    Top = 4
    Width = 753
    Height = 490
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 737
      Height = 478
      Caption = '  Dados do Cliente  '
      TabOrder = 0
      object Label1: TLabel
        Left = 70
        Top = 15
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 8
        Top = 15
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label3: TLabel
        Left = 285
        Top = 51
        Width = 71
        Height = 13
        Caption = 'Nome Fantasia'
      end
      object Label4: TLabel
        Left = 8
        Top = 51
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label6: TLabel
        Left = 286
        Top = 15
        Width = 74
        Height = 13
        Caption = 'Tipo de Pessoa'
      end
      object Label7: TLabel
        Left = 486
        Top = 15
        Width = 91
        Height = 13
        Caption = 'Inscri'#231#227'o Municipal'
      end
      object Label8: TLabel
        Left = 393
        Top = 15
        Width = 87
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
      end
      object Label36: TLabel
        Left = 8
        Top = 316
        Width = 63
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object Label40: TLabel
        Left = 495
        Top = 345
        Width = 31
        Height = 13
        Caption = 'Banco'
      end
      object Label41: TLabel
        Left = 456
        Top = 370
        Width = 70
        Height = 13
        Caption = 'Representante'
      end
      object Cliente_Mensagem_Mascara: TLabel
        Left = 117
        Top = 15
        Width = 137
        Height = 13
        Caption = 'Cliente_Mensagem_Mascara'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label50: TLabel
        Left = 227
        Top = 316
        Width = 119
        Height = 13
        Caption = 'Observa'#231#245'es Nota Fiscal'
      end
      object Label58: TLabel
        Left = 449
        Top = 321
        Width = 76
        Height = 13
        Caption = 'E-Mail para NFe'
      end
      object Cliente_Codigo_Tipo: TComboBox
        Left = 8
        Top = 30
        Width = 57
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        Enabled = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 0
        Text = 'CNPJ'
        Items.Strings = (
          'CNPJ'
          'CPF'
          'RG'
          'E-Mail')
      end
      object Cliente_Nome: TEdit
        Left = 285
        Top = 66
        Width = 293
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 9
        OnKeyPress = Cliente_NomeKeyPress
      end
      object Cliente_Razao_Social: TEdit
        Left = 8
        Top = 66
        Width = 275
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 8
        OnKeyPress = Cliente_Razao_SocialKeyPress
      end
      object Cliente_Tipo_Pessoa: TComboBox
        Left = 286
        Top = 30
        Width = 105
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 5
        Text = 'Pessoa Jur'#237'dica'
        OnKeyPress = Cliente_Tipo_PessoaKeyPress
        Items.Strings = (
          'Pessoa Jur'#237'dica'
          'Pessoa F'#237'sica')
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 92
        Width = 721
        Height = 55
        Caption = '  Endere'#231'o para Faturamento  '
        TabOrder = 10
        object Label13: TLabel
          Left = 8
          Top = 13
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label15: TLabel
          Left = 243
          Top = 13
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label16: TLabel
          Left = 335
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label19: TLabel
          Left = 427
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label17: TLabel
          Left = 472
          Top = 13
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label20: TLabel
          Left = 531
          Top = 13
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
          Visible = False
        end
        object Label53: TLabel
          Left = 535
          Top = 13
          Width = 24
          Height = 13
          Caption = 'Fone'
        end
        object Label55: TLabel
          Left = 627
          Top = 13
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Cliente_Endereco: TEdit
          Left = 8
          Top = 28
          Width = 232
          Height = 19
          Ctl3D = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Cliente_EnderecoKeyPress
        end
        object Cliente_Bairro: TEdit
          Left = 243
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Cliente_BairroKeyPress
        end
        object Cliente_Cidade: TEdit
          Left = 335
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Cliente_CidadeKeyPress
        end
        object Cliente_Estado: TComboBox
          Left = 427
          Top = 28
          Width = 43
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 3
          Text = 'AC'
          OnKeyPress = Cliente_EstadoKeyPress
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
          Left = 472
          Top = 28
          Width = 57
          Height = 19
          Ctl3D = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 4
          Text = '     -   '
          OnKeyPress = Cliente_CepKeyPress
        end
        object Cliente_Pais: TComboBox
          Left = 531
          Top = 28
          Width = 2
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 5
          Text = 'Brasil'
          Visible = False
          OnKeyPress = Cliente_PaisKeyPress
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
            'Uruguai'
            'Sui'#231'a'
            'Inglaterra'
            'Su'#233'cia'
            'Alemanha'
            'Isl'#226'ndia')
        end
        object Cliente_Fone: TEdit
          Left = 535
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 6
          OnKeyPress = Cliente_Fone_ComercialKeyPress
        end
        object Cliente_Fax: TEdit
          Left = 627
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 7
          OnKeyPress = Cliente_Fone_FaxKeyPress
        end
      end
      object Cliente_Inscricao_Municipal: TEdit
        Left = 486
        Top = 30
        Width = 93
        Height = 19
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 7
        OnKeyPress = Cliente_Inscricao_MunicipalKeyPress
      end
      object Cliente_Inscricao_Estadual: TEdit
        Left = 393
        Top = 30
        Width = 90
        Height = 19
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = Cliente_Inscricao_EstadualKeyPress
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 147
        Width = 721
        Height = 54
        Caption = '  Endere'#231'o para Entrega  '
        TabOrder = 11
        object Label18: TLabel
          Left = 76
          Top = 13
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label22: TLabel
          Left = 268
          Top = 13
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label23: TLabel
          Left = 360
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label24: TLabel
          Left = 452
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label25: TLabel
          Left = 497
          Top = 13
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label27: TLabel
          Left = 3
          Top = 13
          Width = 32
          Height = 13
          Caption = 'Op'#231#227'o'
        end
        object Label34: TLabel
          Left = 556
          Top = 13
          Width = 24
          Height = 13
          Caption = 'Fone'
        end
        object Label35: TLabel
          Left = 637
          Top = 13
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Cliente_Endereco_Entrega: TEdit
          Left = 76
          Top = 28
          Width = 190
          Height = 19
          Ctl3D = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Cliente_Endereco_EntregaKeyPress
        end
        object Cliente_Bairro_Entrega: TEdit
          Left = 268
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Cliente_Bairro_EntregaKeyPress
        end
        object Cliente_Cidade_Entrega: TEdit
          Left = 360
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 3
          OnKeyPress = Cliente_Cidade_EntregaKeyPress
        end
        object Cliente_Estado_Entrega: TComboBox
          Left = 452
          Top = 28
          Width = 43
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 4
          Text = 'AC'
          OnKeyPress = Cliente_Estado_EntregaKeyPress
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
        object Cliente_Cep_Entrega: TMaskEdit
          Left = 497
          Top = 28
          Width = 57
          Height = 19
          Ctl3D = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 5
          Text = '     -   '
          OnKeyPress = Cliente_Cep_EntregaKeyPress
        end
        object Cliente_Opcao_Entrega: TComboBox
          Left = 3
          Top = 28
          Width = 71
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 0
          Text = 'O Mesmo'
          OnChange = Cliente_Opcao_EntregaChange
          OnKeyPress = Cliente_Opcao_EntregaKeyPress
          Items.Strings = (
            'O Mesmo'
            'Outro')
        end
        object Cliente_Fone_Entrega: TEdit
          Left = 556
          Top = 28
          Width = 80
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 6
          OnKeyPress = Cliente_Fone_EntregaKeyPress
        end
        object Cliente_Fax_Entrega: TEdit
          Left = 637
          Top = 28
          Width = 80
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 7
          OnKeyPress = Cliente_Fax_EntregaKeyPress
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 256
        Width = 582
        Height = 57
        Caption = '  Contato  '
        TabOrder = 13
        object Label28: TLabel
          Left = 8
          Top = 15
          Width = 37
          Height = 13
          Caption = 'Contato'
        end
        object Label30: TLabel
          Left = 128
          Top = 15
          Width = 24
          Height = 13
          Caption = 'Fone'
        end
        object Label32: TLabel
          Left = 200
          Top = 15
          Width = 32
          Height = 13
          Caption = 'Celular'
        end
        object Label33: TLabel
          Left = 272
          Top = 15
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label44: TLabel
          Left = 344
          Top = 15
          Width = 29
          Height = 13
          Caption = 'E-Mail'
        end
        object Label29: TLabel
          Left = 461
          Top = 15
          Width = 18
          Height = 13
          Caption = 'Site'
        end
        object Cliente_Contato: TEdit
          Left = 8
          Top = 30
          Width = 100
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Cliente_ContatoKeyPress
        end
        object Cliente_Fone_Comercial: TEdit
          Left = 128
          Top = 30
          Width = 70
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Cliente_Fone_ComercialKeyPress
        end
        object Cliente_Fone_Celular: TEdit
          Left = 200
          Top = 30
          Width = 70
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Cliente_Fone_CelularKeyPress
        end
        object Cliente_Fone_Fax: TEdit
          Left = 272
          Top = 30
          Width = 70
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 3
          OnKeyPress = Cliente_Fone_FaxKeyPress
        end
        object Cliente_Email: TEdit
          Left = 344
          Top = 30
          Width = 115
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 4
          OnKeyPress = Cliente_EmailKeyPress
        end
        object Cliente_Site: TEdit
          Left = 461
          Top = 30
          Width = 115
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 5
          OnKeyPress = Cliente_EmailKeyPress
        end
      end
      object GroupBox5: TGroupBox
        Left = 583
        Top = 7
        Width = 146
        Height = 88
        Caption = '  Datas  '
        TabOrder = 21
        object Label9: TLabel
          Left = 5
          Top = 11
          Width = 40
          Height = 13
          Caption = 'Inclus'#227'o'
        end
        object Label10: TLabel
          Left = 75
          Top = 11
          Width = 57
          Height = 13
          Caption = #218'ltima Visita'
        end
        object Label11: TLabel
          Left = 5
          Top = 47
          Width = 64
          Height = 13
          Caption = #218'lt. Altera'#231#227'o'
        end
        object Label12: TLabel
          Left = 75
          Top = 47
          Width = 55
          Height = 13
          Caption = #218'lt. Compra'
        end
        object Cliente_Data_Inclusao: TMaskEdit
          Left = 5
          Top = 26
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 0
          Text = '  /  /    '
          OnKeyPress = Cliente_Data_InclusaoKeyPress
        end
        object Cliente_Data_Visita: TMaskEdit
          Left = 75
          Top = 26
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 1
          Text = '  /  /    '
          OnKeyPress = Cliente_Data_VisitaKeyPress
        end
        object Cliente_Data_Alteracao: TMaskEdit
          Left = 5
          Top = 62
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 2
          Text = '  /  /    '
          OnKeyPress = Cliente_Data_AlteracaoKeyPress
        end
        object Cliente_Data_Ultima_Compra: TMaskEdit
          Left = 75
          Top = 62
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 3
          Text = '  /  /    '
          OnKeyPress = Cliente_Data_Ultima_CompraKeyPress
        end
      end
      object Cliente_Observacoes: TMemo
        Left = 8
        Top = 330
        Width = 215
        Height = 52
        Ctl3D = False
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 15
      end
      object GroupBox6: TGroupBox
        Left = 592
        Top = 256
        Width = 137
        Height = 57
        Caption = '  Valores  '
        TabOrder = 14
        object Label38: TLabel
          Left = 7
          Top = 14
          Width = 49
          Height = 13
          Caption = 'Bloq.Cr'#233'd.'
        end
        object Label39: TLabel
          Left = 62
          Top = 14
          Width = 67
          Height = 13
          Caption = 'Vlr.'#218'lt.Compra'
        end
        object Cliente_Status_Credito: TComboBox
          Left = 8
          Top = 29
          Width = 46
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 0
          Text = 'N'#227'o'
          OnKeyPress = Cliente_Status_CreditoKeyPress
          Items.Strings = (
            'N'#227'o'
            'Sim')
        end
        object Cliente_Ultimo_Valor: TEdit
          Left = 62
          Top = 29
          Width = 69
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Cliente_Ultimo_ValorKeyPress
        end
      end
      object Cliente_Banco: TComboBox
        Left = 529
        Top = 342
        Width = 200
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 18
        OnKeyPress = Cliente_BancoKeyPress
      end
      object Cliente_Vendedor: TComboBox
        Left = 529
        Top = 367
        Width = 200
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 19
        OnKeyPress = Cliente_VendedorKeyPress
      end
      object Cliente_Codigo_CNPJ: TMaskEdit
        Left = 70
        Top = 30
        Width = 110
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!99\.999\.999\/9999\-99;1;_'
        MaxLength = 18
        ParentCtl3D = False
        TabOrder = 1
        Text = '  .   .   /    -  '
        Visible = False
      end
      object Cliente_Codigo_CPF: TMaskEdit
        Left = 70
        Top = 30
        Width = 85
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!999\.999\.999\-99;1;_'
        MaxLength = 14
        ParentCtl3D = False
        TabOrder = 2
        Text = '   .   .   -  '
        Visible = False
      end
      object Cliente_Codigo_RG: TEdit
        Left = 70
        Top = 30
        Width = 112
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 4
        Visible = False
      end
      object Cliente_Codigo_EMail: TEdit
        Left = 70
        Top = 30
        Width = 214
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 386
        Width = 721
        Height = 83
        Caption = '  Dados para Emis'#227'o de Pedido  '
        TabOrder = 20
        object Label46: TLabel
          Left = 55
          Top = 18
          Width = 63
          Height = 13
          Caption = 'Desconto (%)'
        end
        object Label47: TLabel
          Left = 8
          Top = 39
          Width = 110
          Height = 13
          Caption = 'Condi'#231#227'o de Pgto (DD)'
        end
        object Label48: TLabel
          Left = 212
          Top = 18
          Width = 90
          Height = 13
          Caption = 'Tipo de Transporte'
        end
        object Label49: TLabel
          Left = 230
          Top = 39
          Width = 72
          Height = 13
          Caption = 'Transportadora'
        end
        object Label52: TLabel
          Left = 605
          Top = 18
          Width = 59
          Height = 13
          Caption = 'Emite o Lote'
        end
        object Label45: TLabel
          Left = 581
          Top = 39
          Width = 64
          Height = 13
          Caption = 'Pgto do Frete'
        end
        object Label42: TLabel
          Left = 10
          Top = 60
          Width = 146
          Height = 13
          Caption = 'Material Destina-se a Consumo'
        end
        object Label43: TLabel
          Left = 545
          Top = 59
          Width = 39
          Height = 13
          Caption = 'Suframa'
        end
        object Label56: TLabel
          Left = 457
          Top = 18
          Width = 26
          Height = 13
          Caption = 'ICMS'
        end
        object Label57: TLabel
          Left = 218
          Top = 60
          Width = 84
          Height = 13
          Caption = 'Transp. N'#227'o Cad.'
        end
        object Cliente_Desconto: TEdit
          Left = 124
          Top = 15
          Width = 84
          Height = 19
          Ctl3D = False
          MaxLength = 7
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Cliente_DescontoKeyPress
        end
        object Cliente_Condicao_Pgto_1: TEdit
          Left = 124
          Top = 36
          Width = 18
          Height = 19
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Cliente_Condicao_Pgto_1KeyPress
        end
        object Cliente_Condicao_Pgto_2: TEdit
          Left = 146
          Top = 36
          Width = 18
          Height = 19
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Cliente_Condicao_Pgto_2KeyPress
        end
        object Cliente_Condicao_Pgto_3: TEdit
          Left = 168
          Top = 36
          Width = 18
          Height = 19
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 3
          OnKeyPress = Cliente_Condicao_Pgto_3KeyPress
        end
        object Cliente_Tipo_Transporte: TComboBox
          Left = 305
          Top = 15
          Width = 77
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 6
          Text = 'Rodovi'#225'rio'
          OnKeyPress = Cliente_Tipo_TransporteKeyPress
          Items.Strings = (
            'Rodovi'#225'rio'
            'A'#233'reo'
            'Mar'#237'timo'
            'Ferrovi'#225'rio')
        end
        object Cliente_Transportadora: TComboBox
          Left = 305
          Top = 36
          Width = 225
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 8
          OnKeyPress = Cliente_TransportadoraKeyPress
        end
        object Cliente_Emite_Lote: TComboBox
          Left = 667
          Top = 15
          Width = 50
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 10
          Text = 'N'#227'o'
          OnKeyPress = Cliente_Emite_LoteKeyPress
          Items.Strings = (
            'N'#227'o'
            'Sim')
        end
        object Cliente_Pgto_Frete: TComboBox
          Left = 648
          Top = 36
          Width = 69
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 11
          Text = 'Cliente'
          OnKeyPress = Cliente_Pgto_FreteKeyPress
          Items.Strings = (
            'Cliente'
            'Ibrasmak')
        end
        object Cliente_Condicao_Pgto_4: TEdit
          Left = 190
          Top = 36
          Width = 18
          Height = 19
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 4
          OnKeyPress = Cliente_Condicao_Pgto_3KeyPress
        end
        object Cliente_Consumo: TComboBox
          Left = 158
          Top = 57
          Width = 50
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 5
          Text = 'N'#227'o'
          OnKeyPress = Cliente_Emite_LoteKeyPress
          Items.Strings = (
            'N'#227'o'
            'Sim')
        end
        object Cliente_Suframa: TEdit
          Left = 587
          Top = 56
          Width = 130
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 12
          OnKeyPress = Cliente_SuframaKeyPress
        end
        object Cliente_Icms: TEdit
          Left = 487
          Top = 15
          Width = 43
          Height = 19
          Ctl3D = False
          MaxLength = 7
          ParentCtl3D = False
          TabOrder = 7
          OnKeyPress = Cliente_IcmsKeyPress
        end
        object Transportadora_Nao_Cadastrada: TEdit
          Left = 305
          Top = 56
          Width = 225
          Height = 19
          Ctl3D = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 9
          OnKeyPress = Transportadora_Nao_CadastradaKeyPress
        end
      end
      object GroupBox8: TGroupBox
        Left = 8
        Top = 201
        Width = 721
        Height = 54
        Caption = '  Endere'#231'o para Cobran'#231'a  '
        TabOrder = 12
        object Label5: TLabel
          Left = 76
          Top = 13
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label14: TLabel
          Left = 268
          Top = 13
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label21: TLabel
          Left = 360
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label37: TLabel
          Left = 452
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label51: TLabel
          Left = 497
          Top = 13
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label54: TLabel
          Left = 3
          Top = 13
          Width = 32
          Height = 13
          Caption = 'Op'#231#227'o'
        end
        object Label26: TLabel
          Left = 556
          Top = 13
          Width = 24
          Height = 13
          Caption = 'Fone'
        end
        object Label31: TLabel
          Left = 637
          Top = 13
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Cliente_Endereco_Cobranca: TEdit
          Left = 76
          Top = 28
          Width = 190
          Height = 19
          Ctl3D = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Cliente_Endereco_CobrancaKeyPress
        end
        object Cliente_Bairro_Cobranca: TEdit
          Left = 268
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Cliente_Bairro_CobrancaKeyPress
        end
        object Cliente_Cidade_Cobranca: TEdit
          Left = 360
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 3
          OnKeyPress = Cliente_Cidade_CobrancaKeyPress
        end
        object Cliente_Estado_Cobranca: TComboBox
          Left = 452
          Top = 28
          Width = 43
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 4
          Text = 'AC'
          OnKeyPress = Cliente_Estado_CobrancaKeyPress
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
        object Cliente_Cep_Cobranca: TMaskEdit
          Left = 497
          Top = 28
          Width = 57
          Height = 19
          Ctl3D = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 5
          Text = '     -   '
          OnKeyPress = Cliente_Cep_CobrancaKeyPress
        end
        object Cliente_Opcao_Cobranca: TComboBox
          Left = 3
          Top = 28
          Width = 71
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 0
          Text = 'O Mesmo'
          OnChange = Cliente_Opcao_CobrancaChange
          OnKeyPress = Cliente_Opcao_CobrancaKeyPress
          Items.Strings = (
            'O Mesmo'
            'Outro')
        end
        object Cliente_Fone_Cobranca: TEdit
          Left = 556
          Top = 28
          Width = 80
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 6
          OnKeyPress = Cliente_Fone_CobrancaKeyPress
        end
        object Cliente_Fax_Cobranca: TEdit
          Left = 637
          Top = 28
          Width = 80
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 7
          OnKeyPress = Cliente_Fax_CobrancaKeyPress
        end
      end
      object Cliente_Observacoes_Nota: TMemo
        Left = 227
        Top = 330
        Width = 215
        Height = 52
        Ctl3D = False
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 16
      end
      object Cliente_EMail_NFe: TEdit
        Left = 529
        Top = 318
        Width = 200
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 17
        OnKeyPress = Cliente_EMail_NFeKeyPress
      end
    end
  end
end
