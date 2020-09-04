object HistoricoClientes01: THistoricoClientes01
  Left = 196
  Top = 94
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Hist'#243'rico de Clientes - CONSULTA'
  ClientHeight = 640
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
  object Panel3: TPanel
    Left = 4
    Top = 595
    Width = 753
    Height = 41
    TabOrder = 0
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
    object Nro_Tipo_Cliente: TEdit
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
    end
    object Nro_Banco: TEdit
      Left = 12
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Nro_Zona: TEdit
      Left = 20
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
      Left = 28
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
      Left = 36
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 5
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
      TabOrder = 6
      Visible = False
    end
    object Nro_Tipo_Tabela: TEdit
      Left = 52
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
      Left = 60
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 8
      Visible = False
    end
    object Nro_Codigo_Cliente: TEdit
      Left = 68
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 9
      Visible = False
    end
    object DBG_Observacao_Papeleta: TDBMemo
      Left = 90
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_papeleta_observacao'
      DataSource = ConexaoBD.DS_FB_Papeletas
      ParentCtl3D = False
      TabOrder = 10
      Visible = False
    end
    object DBG_Observacao_Nota: TDBMemo
      Left = 98
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_nota_fiscal_observacao'
      DataSource = ConexaoBD.DS_FB_Nota_Fiscal
      ParentCtl3D = False
      TabOrder = 11
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 4
    Width = 753
    Height = 455
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 737
      Height = 444
      Caption = '  Dados do Cliente  '
      TabOrder = 0
      object Label1: TLabel
        Left = 68
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
        Left = 299
        Top = 49
        Width = 71
        Height = 13
        Caption = 'Nome Fantasia'
      end
      object Label4: TLabel
        Left = 8
        Top = 49
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label6: TLabel
        Left = 284
        Top = 15
        Width = 74
        Height = 13
        Caption = 'Tipo de Pessoa'
      end
      object Label7: TLabel
        Left = 504
        Top = 15
        Width = 68
        Height = 13
        Caption = 'Insc.Municipal'
      end
      object Label8: TLabel
        Left = 411
        Top = 15
        Width = 87
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
      end
      object Cliente_Mensagem_Mascara: TLabel
        Left = 121
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
      object Label36: TLabel
        Left = 8
        Top = 313
        Width = 63
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object Label50: TLabel
        Left = 232
        Top = 313
        Width = 119
        Height = 13
        Caption = 'Observa'#231#245'es Nota Fiscal'
      end
      object Label40: TLabel
        Left = 495
        Top = 319
        Width = 31
        Height = 13
        Caption = 'Banco'
      end
      object Label41: TLabel
        Left = 456
        Top = 340
        Width = 70
        Height = 13
        Caption = 'Representante'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = 'CNPJ'
        Items.Strings = (
          'CNPJ'
          'CPF'
          'RG'
          'E-Mail')
      end
      object Cliente_Nome: TEdit
        Left = 299
        Top = 64
        Width = 289
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 6
      end
      object Cliente_Razao_Social: TEdit
        Left = 8
        Top = 64
        Width = 280
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 7
      end
      object Cliente_Tipo_Pessoa: TComboBox
        Left = 284
        Top = 30
        Width = 124
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        Text = 'Pessoa Jur'#237'dica'
        Items.Strings = (
          'Pessoa Jur'#237'dica'
          'Pessoa F'#237'sica')
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 90
        Width = 725
        Height = 55
        Caption = '  Endere'#231'o  '
        TabOrder = 10
        object Label13: TLabel
          Left = 8
          Top = 13
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label15: TLabel
          Left = 242
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
          Left = 428
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label17: TLabel
          Left = 474
          Top = 13
          Width = 21
          Height = 13
          Caption = 'CEP'
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
          Width = 231
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
        end
        object Cliente_Bairro: TEdit
          Left = 242
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 1
        end
        object Cliente_Cidade: TEdit
          Left = 335
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 2
        end
        object Cliente_Estado: TComboBox
          Left = 428
          Top = 28
          Width = 43
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          Text = 'AC'
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
          Left = 474
          Top = 28
          Width = 57
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 4
          Text = '     -   '
        end
        object Cliente_Fone: TEdit
          Left = 535
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 5
        end
        object Cliente_Fax: TEdit
          Left = 627
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 6
        end
      end
      object Cliente_Inscricao_Municipal: TEdit
        Left = 504
        Top = 30
        Width = 85
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 8
      end
      object Cliente_Inscricao_Estadual: TEdit
        Left = 411
        Top = 30
        Width = 90
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 9
      end
      object GroupBox5: TGroupBox
        Left = 592
        Top = 7
        Width = 140
        Height = 84
        Caption = '  Datas  '
        TabOrder = 11
        object Label9: TLabel
          Left = 4
          Top = 12
          Width = 40
          Height = 13
          Caption = 'Inclus'#227'o'
        end
        object Label10: TLabel
          Left = 71
          Top = 12
          Width = 57
          Height = 13
          Caption = #218'ltima Visita'
        end
        object Label11: TLabel
          Left = 4
          Top = 45
          Width = 64
          Height = 13
          Caption = #218'lt. Altera'#231#227'o'
        end
        object Label12: TLabel
          Left = 71
          Top = 45
          Width = 55
          Height = 13
          Caption = #218'lt. Compra'
        end
        object Cliente_Data_Inclusao: TMaskEdit
          Left = 4
          Top = 27
          Width = 65
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 0
          Text = '  /  /    '
        end
        object Cliente_Data_Visita: TMaskEdit
          Left = 71
          Top = 27
          Width = 65
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 1
          Text = '  /  /    '
        end
        object Cliente_Data_Alteracao: TMaskEdit
          Left = 4
          Top = 60
          Width = 65
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 2
          Text = '  /  /    '
        end
        object Cliente_Data_Ultima_Compra: TMaskEdit
          Left = 71
          Top = 60
          Width = 65
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 3
          Text = '  /  /    '
        end
      end
      object Cliente_Codigo_CNPJ: TMaskEdit
        Left = 68
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
        Left = 68
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
        Left = 68
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
        Left = 68
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
      object GroupBox3: TGroupBox
        Left = 8
        Top = 147
        Width = 721
        Height = 54
        Caption = '  Endere'#231'o para Entrega  '
        TabOrder = 12
        object Label18: TLabel
          Left = 81
          Top = 13
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label22: TLabel
          Left = 263
          Top = 13
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label23: TLabel
          Left = 355
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label24: TLabel
          Left = 447
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label25: TLabel
          Left = 492
          Top = 13
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label27: TLabel
          Left = 8
          Top = 13
          Width = 32
          Height = 13
          Caption = 'Op'#231#227'o'
        end
        object Label34: TLabel
          Left = 555
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
          Left = 81
          Top = 28
          Width = 180
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 1
        end
        object Cliente_Bairro_Entrega: TEdit
          Left = 263
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 2
        end
        object Cliente_Cidade_Entrega: TEdit
          Left = 355
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 3
        end
        object Cliente_Estado_Entrega: TComboBox
          Left = 447
          Top = 28
          Width = 43
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 4
          Text = 'AC'
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
          Left = 492
          Top = 28
          Width = 57
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 5
          Text = '     -   '
        end
        object Cliente_Opcao_Entrega: TComboBox
          Left = 8
          Top = 28
          Width = 71
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
          Text = 'O Mesmo'
          Items.Strings = (
            'O Mesmo'
            'Outro')
        end
        object Cliente_Fone_Entrega: TEdit
          Left = 555
          Top = 28
          Width = 80
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 6
        end
        object Cliente_Fax_Entrega: TEdit
          Left = 637
          Top = 28
          Width = 80
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 7
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 201
        Width = 721
        Height = 54
        Caption = '  Endere'#231'o para Cobran'#231'a  '
        TabOrder = 13
        object Label5: TLabel
          Left = 81
          Top = 13
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label14: TLabel
          Left = 263
          Top = 13
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label21: TLabel
          Left = 355
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label37: TLabel
          Left = 447
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label20: TLabel
          Left = 492
          Top = 13
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label54: TLabel
          Left = 8
          Top = 13
          Width = 32
          Height = 13
          Caption = 'Op'#231#227'o'
        end
        object Label26: TLabel
          Left = 555
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
          Left = 81
          Top = 28
          Width = 180
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 1
        end
        object Cliente_Bairro_Cobranca: TEdit
          Left = 263
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 2
        end
        object Cliente_Cidade_Cobranca: TEdit
          Left = 355
          Top = 28
          Width = 90
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 3
        end
        object Cliente_Estado_Cobranca: TComboBox
          Left = 447
          Top = 28
          Width = 43
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 4
          Text = 'AC'
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
          Left = 492
          Top = 28
          Width = 57
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 5
          Text = '     -   '
        end
        object Cliente_Opcao_Cobranca: TComboBox
          Left = 8
          Top = 28
          Width = 71
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
          Text = 'O Mesmo'
          Items.Strings = (
            'O Mesmo'
            'Outro')
        end
        object Cliente_Fone_Cobranca: TEdit
          Left = 555
          Top = 28
          Width = 80
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 6
        end
        object Cliente_Fax_Cobranca: TEdit
          Left = 637
          Top = 28
          Width = 80
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 7
        end
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 256
        Width = 582
        Height = 57
        Caption = '  Contato  '
        TabOrder = 14
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
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 0
        end
        object Cliente_Fone_Comercial: TEdit
          Left = 128
          Top = 30
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 1
        end
        object Cliente_Fone_Celular: TEdit
          Left = 200
          Top = 30
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 2
        end
        object Cliente_Fone_Fax: TEdit
          Left = 272
          Top = 30
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 3
        end
        object Cliente_Email: TEdit
          Left = 344
          Top = 30
          Width = 115
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 4
        end
        object Cliente_Site: TEdit
          Left = 461
          Top = 30
          Width = 115
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 5
        end
      end
      object GroupBox9: TGroupBox
        Left = 592
        Top = 256
        Width = 137
        Height = 57
        Caption = '  Valores  '
        TabOrder = 15
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
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 1
        end
      end
      object Cliente_Observacoes: TMemo
        Left = 8
        Top = 327
        Width = 220
        Height = 28
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 16
      end
      object Cliente_Observacoes_Nota: TMemo
        Left = 232
        Top = 327
        Width = 220
        Height = 27
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 17
      end
      object Cliente_Banco: TComboBox
        Left = 529
        Top = 316
        Width = 200
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        Enabled = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 18
      end
      object Cliente_Vendedor: TComboBox
        Left = 529
        Top = 337
        Width = 200
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        Enabled = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 19
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 356
        Width = 722
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
        object Cliente_Desconto: TEdit
          Left = 124
          Top = 15
          Width = 84
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 7
          ParentCtl3D = False
          TabOrder = 0
        end
        object Cliente_Condicao_Pgto_1: TEdit
          Left = 124
          Top = 36
          Width = 18
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 1
        end
        object Cliente_Condicao_Pgto_2: TEdit
          Left = 146
          Top = 36
          Width = 18
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 2
        end
        object Cliente_Condicao_Pgto_3: TEdit
          Left = 168
          Top = 36
          Width = 18
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 3
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
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 6
          Text = 'Rodovi'#225'rio'
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
          Enabled = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 8
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
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 9
          Text = 'N'#227'o'
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
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 10
          Text = 'Cliente'
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
          Enabled = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 4
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
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 5
          Text = 'N'#227'o'
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
          Enabled = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 11
        end
        object Cliente_Icms: TEdit
          Left = 487
          Top = 15
          Width = 43
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 7
          ParentCtl3D = False
          TabOrder = 7
          Text = '0'
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 5
    Top = 463
    Width = 753
    Height = 129
    TabOrder = 2
    object GroupBox8: TGroupBox
      Left = 8
      Top = 4
      Width = 738
      Height = 117
      Caption = '  Rela'#231#227'o de Compras  '
      TabOrder = 0
      object SGD_Compras: TStringGrid
        Left = 8
        Top = 14
        Width = 722
        Height = 98
        ColCount = 10
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
        OnDblClick = SGD_ComprasDblClick
        OnKeyPress = SGD_ComprasKeyPress
        ColWidths = (
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64)
      end
    end
  end
end
