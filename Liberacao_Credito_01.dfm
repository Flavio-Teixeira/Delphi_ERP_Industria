object LiberacaoCredito01: TLiberacaoCredito01
  Left = 276
  Top = 156
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Libera'#231#227'o de Cr'#233'dito - Liberar o Cliente'
  ClientHeight = 306
  ClientWidth = 609
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
    Top = 262
    Width = 602
    Height = 41
    TabOrder = 0
    object BT_Sair: TBitBtn
      Left = 520
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
    object BT_Alterar: TBitBtn
      Left = 264
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
    object Nro_Tipo_Cliente: TEdit
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Nro_Cliente_Tipo_Empresa: TEdit
      Left = 14
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 4
    Width = 601
    Height = 253
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 585
      Height = 241
      Caption = '  Dados do Cliente  '
      TabOrder = 0
      object Label1: TLabel
        Left = 74
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
        Left = 8
        Top = 51
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label4: TLabel
        Left = 299
        Top = 51
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label6: TLabel
        Left = 299
        Top = 15
        Width = 74
        Height = 13
        Caption = 'Tipo de Pessoa'
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
        Left = 8
        Top = 66
        Width = 280
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 6
      end
      object Cliente_Razao_Social: TEdit
        Left = 299
        Top = 66
        Width = 280
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 7
      end
      object Cliente_Tipo_Pessoa: TComboBox
        Left = 299
        Top = 30
        Width = 124
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
        Text = 'Pessoa Jur'#237'dica'
        Items.Strings = (
          'Pessoa Jur'#237'dica'
          'Pessoa F'#237'sica')
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 87
        Width = 569
        Height = 97
        Caption = '  Endere'#231'o  '
        TabOrder = 8
        object Label13: TLabel
          Left = 8
          Top = 17
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label14: TLabel
          Left = 394
          Top = 17
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label15: TLabel
          Left = 8
          Top = 53
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label16: TLabel
          Left = 176
          Top = 53
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label19: TLabel
          Left = 344
          Top = 53
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label17: TLabel
          Left = 394
          Top = 53
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label20: TLabel
          Left = 459
          Top = 53
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Cliente_Endereco: TEdit
          Left = 8
          Top = 32
          Width = 380
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
        end
        object Cliente_Complemento: TEdit
          Left = 394
          Top = 32
          Width = 165
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 1
        end
        object Cliente_Bairro: TEdit
          Left = 8
          Top = 68
          Width = 160
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 2
        end
        object Cliente_Cidade: TEdit
          Left = 176
          Top = 68
          Width = 160
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 3
        end
        object Cliente_Estado: TComboBox
          Left = 344
          Top = 68
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
        object Cliente_Cep: TMaskEdit
          Left = 394
          Top = 68
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
        object Cliente_Pais: TComboBox
          Left = 459
          Top = 68
          Width = 100
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
          Text = 'Brasil'
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
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 187
        Width = 570
        Height = 45
        Caption = '  Libera'#231#227'o de Cr'#233'dito  '
        TabOrder = 9
        object Label38: TLabel
          Left = 7
          Top = 19
          Width = 77
          Height = 13
          Caption = 'Bloqueia Cr'#233'dito'
        end
        object Label37: TLabel
          Left = 172
          Top = 19
          Width = 74
          Height = 13
          Caption = 'Vlr. Cr'#233'dito (R$)'
        end
        object Label39: TLabel
          Left = 368
          Top = 19
          Width = 109
          Height = 13
          Caption = 'Vlr. '#218'ltima Compra (R$)'
        end
        object Cliente_Status_Credito: TComboBox
          Left = 88
          Top = 16
          Width = 46
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
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
        object Cliente_Valor_Credito: TEdit
          Left = 250
          Top = 16
          Width = 83
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Cliente_Valor_CreditoKeyPress
        end
        object Cliente_Ultimo_Valor: TEdit
          Left = 481
          Top = 16
          Width = 83
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Cliente_Ultimo_ValorKeyPress
        end
      end
      object Cliente_Codigo_CNPJ: TMaskEdit
        Left = 74
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
        Left = 74
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
        Left = 74
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
        Left = 74
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
    end
  end
end
