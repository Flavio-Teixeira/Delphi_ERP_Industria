object Fornecedor02: TFornecedor02
  Left = 315
  Top = 210
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Fornecedores - ALTERA'#199#195'O / EXCLUS'#195'O'
  ClientHeight = 360
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 5
    Top = 4
    Width = 753
    Height = 305
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 737
      Height = 291
      Caption = '  Dados do Fornecedor  '
      TabOrder = 0
      object Label1: TLabel
        Left = 48
        Top = 15
        Width = 88
        Height = 13
        Caption = 'C'#243'digo CNPJ/CPF'
      end
      object Label3: TLabel
        Left = 375
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
      object Label36: TLabel
        Left = 8
        Top = 215
        Width = 63
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object Label8: TLabel
        Left = 287
        Top = 15
        Width = 87
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
      end
      object Label7: TLabel
        Left = 384
        Top = 15
        Width = 91
        Height = 13
        Caption = 'Inscri'#231#227'o Municipal'
      end
      object Label2: TLabel
        Left = 8
        Top = 15
        Width = 20
        Height = 13
        Caption = 'Nro.'
      end
      object Label5: TLabel
        Left = 170
        Top = 15
        Width = 77
        Height = 13
        Caption = 'Pertence a '#193'rea'
      end
      object Fornecedor_Nome: TEdit
        Left = 375
        Top = 66
        Width = 356
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = Fornecedor_NomeKeyPress
      end
      object Fornecedor_Razao_Social: TEdit
        Left = 8
        Top = 66
        Width = 353
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = Fornecedor_Razao_SocialKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 92
        Width = 721
        Height = 55
        Caption = '  Endere'#231'o para Faturamento  '
        TabOrder = 7
        object Label13: TLabel
          Left = 8
          Top = 13
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label15: TLabel
          Left = 208
          Top = 13
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label16: TLabel
          Left = 310
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label19: TLabel
          Left = 412
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label17: TLabel
          Left = 457
          Top = 13
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label20: TLabel
          Left = 516
          Top = 13
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label53: TLabel
          Left = 594
          Top = 13
          Width = 24
          Height = 13
          Caption = 'Fone'
        end
        object Label55: TLabel
          Left = 656
          Top = 13
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Fornecedor_Endereco: TEdit
          Left = 8
          Top = 28
          Width = 198
          Height = 19
          Ctl3D = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Fornecedor_EnderecoKeyPress
        end
        object Fornecedor_Bairro: TEdit
          Left = 208
          Top = 28
          Width = 100
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Fornecedor_BairroKeyPress
        end
        object Fornecedor_Cidade: TEdit
          Left = 310
          Top = 28
          Width = 100
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Fornecedor_CidadeKeyPress
        end
        object Fornecedor_Estado: TComboBox
          Left = 412
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
          OnKeyPress = Fornecedor_EstadoKeyPress
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
        object Fornecedor_Cep: TMaskEdit
          Left = 457
          Top = 28
          Width = 57
          Height = 19
          Ctl3D = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 4
          Text = '     -   '
          OnKeyPress = Fornecedor_CepKeyPress
        end
        object Fornecedor_Pais: TComboBox
          Left = 516
          Top = 28
          Width = 75
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
          OnKeyPress = Fornecedor_PaisKeyPress
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
        object Fornecedor_Fone: TEdit
          Left = 594
          Top = 28
          Width = 60
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 6
          OnKeyPress = Fornecedor_FoneKeyPress
        end
        object Fornecedor_Fax: TEdit
          Left = 656
          Top = 28
          Width = 60
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 7
          OnKeyPress = Fornecedor_FaxKeyPress
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 151
        Width = 722
        Height = 57
        Caption = '  Contato  '
        TabOrder = 8
        object Label28: TLabel
          Left = 8
          Top = 15
          Width = 37
          Height = 13
          Caption = 'Contato'
        end
        object Label30: TLabel
          Left = 136
          Top = 15
          Width = 24
          Height = 13
          Caption = 'Fone'
        end
        object Label32: TLabel
          Left = 208
          Top = 15
          Width = 32
          Height = 13
          Caption = 'Celular'
        end
        object Label33: TLabel
          Left = 280
          Top = 15
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label44: TLabel
          Left = 352
          Top = 15
          Width = 29
          Height = 13
          Caption = 'E-Mail'
        end
        object Label29: TLabel
          Left = 599
          Top = 15
          Width = 18
          Height = 13
          Caption = 'Site'
        end
        object Label6: TLabel
          Left = 469
          Top = 15
          Width = 58
          Height = 13
          Caption = 'E-Mail (NFe)'
        end
        object Fornecedor_Contato: TEdit
          Left = 8
          Top = 30
          Width = 100
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Fornecedor_ContatoKeyPress
        end
        object Fornecedor_Fone_Comercial: TEdit
          Left = 136
          Top = 30
          Width = 70
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Fornecedor_Fone_ComercialKeyPress
        end
        object Fornecedor_Fone_Celular: TEdit
          Left = 208
          Top = 30
          Width = 70
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Fornecedor_Fone_CelularKeyPress
        end
        object Fornecedor_Fone_Fax: TEdit
          Left = 280
          Top = 30
          Width = 70
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 3
          OnKeyPress = Fornecedor_Fone_FaxKeyPress
        end
        object Fornecedor_Email: TEdit
          Left = 352
          Top = 30
          Width = 115
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 4
          OnKeyPress = Fornecedor_EmailKeyPress
        end
        object Fornecedor_Site: TEdit
          Left = 599
          Top = 30
          Width = 115
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 6
          OnKeyPress = Fornecedor_SiteKeyPress
        end
        object Fornecedor_Email_NFe: TEdit
          Left = 469
          Top = 30
          Width = 115
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 5
          OnKeyPress = Fornecedor_Email_NFeKeyPress
        end
      end
      object GroupBox5: TGroupBox
        Left = 513
        Top = 7
        Width = 218
        Height = 50
        Caption = '  Datas  '
        TabOrder = 10
        object Label9: TLabel
          Left = 5
          Top = 11
          Width = 40
          Height = 13
          Caption = 'Inclus'#227'o'
        end
        object Label11: TLabel
          Left = 75
          Top = 11
          Width = 64
          Height = 13
          Caption = #218'lt. Altera'#231#227'o'
        end
        object Label12: TLabel
          Left = 147
          Top = 11
          Width = 55
          Height = 13
          Caption = #218'lt. Compra'
        end
        object Fornecedor_Data_Inclusao: TMaskEdit
          Left = 5
          Top = 26
          Width = 65
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 0
          Text = '  /  /    '
          OnKeyPress = Fornecedor_Data_InclusaoKeyPress
        end
        object Fornecedor_Data_Alteracao: TMaskEdit
          Left = 75
          Top = 26
          Width = 65
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 1
          Text = '  /  /    '
          OnKeyPress = Fornecedor_Data_AlteracaoKeyPress
        end
        object Fornecedor_Data_Ultima_Compra: TMaskEdit
          Left = 147
          Top = 26
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 2
          Text = '  /  /    '
          OnKeyPress = Fornecedor_Data_Ultima_CompraKeyPress
        end
      end
      object Fornecedor_Observacoes: TMemo
        Left = 8
        Top = 229
        Width = 721
        Height = 52
        Ctl3D = False
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 9
      end
      object Fornecedor_Codigo_CNPJ: TMaskEdit
        Left = 48
        Top = 30
        Width = 110
        Height = 19
        Ctl3D = False
        EditMask = '!99\.999\.999\/9999\-99;1;_'
        MaxLength = 18
        ParentCtl3D = False
        TabOrder = 1
        Text = '  .   .   /    -  '
        OnKeyPress = Fornecedor_Codigo_CNPJKeyPress
      end
      object Fornecedor_Inscricao_Estadual: TEdit
        Left = 287
        Top = 30
        Width = 90
        Height = 19
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = Fornecedor_Inscricao_EstadualKeyPress
      end
      object Fornecedor_Inscricao_Municipal: TEdit
        Left = 384
        Top = 30
        Width = 93
        Height = 19
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Fornecedor_Inscricao_MunicipalKeyPress
      end
      object Fornecedor_Numero: TEdit
        Left = 8
        Top = 30
        Width = 33
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Fornecedor_NumeroKeyPress
      end
      object Fornecedor_Area: TComboBox
        Left = 168
        Top = 30
        Width = 113
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 2
        Text = 'Compras'
        OnKeyPress = Fornecedor_PaisKeyPress
        Items.Strings = (
          'Compras'
          'Contas a Receber')
      end
    end
  end
  object Panel3: TPanel
    Left = 4
    Top = 314
    Width = 753
    Height = 41
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 670
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
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
      Left = 299
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
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
      Left = 379
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 2
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
      Left = 6
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object DBG_Fornecedor_Observacao: TDBMemo
      Left = 14
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_fornecedor_observacoes'
      DataSource = ConexaoBD.DS_Fornecedores
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
  end
end
