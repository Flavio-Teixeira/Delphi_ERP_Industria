object Representantes01: TRepresentantes01
  Left = 277
  Top = 155
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Representantes - INCLUS'#195'O'
  ClientHeight = 493
  ClientWidth = 595
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 4
    Top = 444
    Width = 585
    Height = 41
    TabOrder = 1
    object BT_Incluir: TBitBtn
      Left = 255
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
      Left = 500
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
  end
  object Panel1: TPanel
    Left = 5
    Top = 4
    Width = 585
    Height = 433
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 569
      Height = 421
      Caption = '  Dados do Representante  '
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 50
        Top = 20
        Width = 102
        Height = 13
        Caption = 'Nome / Raz'#227'o Social'
      end
      object Label12: TLabel
        Left = 358
        Top = 20
        Width = 37
        Height = 13
        Caption = 'Contato'
      end
      object Representante_Codigo: TEdit
        Left = 8
        Top = 35
        Width = 36
        Height = 19
        Ctl3D = False
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Representante_CodigoKeyPress
      end
      object Representante_Nome: TEdit
        Left = 50
        Top = 35
        Width = 300
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Representante_NomeKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 62
        Width = 553
        Height = 104
        Caption = '  Endere'#231'o  '
        TabOrder = 3
        object Label3: TLabel
          Left = 8
          Top = 21
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 9
          Top = 60
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label5: TLabel
          Left = 378
          Top = 21
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label6: TLabel
          Left = 156
          Top = 60
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label7: TLabel
          Left = 328
          Top = 60
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label8: TLabel
          Left = 443
          Top = 60
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label9: TLabel
          Left = 378
          Top = 60
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Representante_Endereco: TEdit
          Left = 8
          Top = 36
          Width = 363
          Height = 19
          Ctl3D = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Representante_EnderecoKeyPress
        end
        object Representante_Bairro: TEdit
          Left = 9
          Top = 75
          Width = 140
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Representante_BairroKeyPress
        end
        object Representante_Cidade: TEdit
          Left = 156
          Top = 75
          Width = 165
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 3
          OnKeyPress = Representante_CidadeKeyPress
        end
        object Representante_Complemento: TEdit
          Left = 378
          Top = 36
          Width = 165
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Representante_ComplementoKeyPress
        end
        object Representante_Cep: TMaskEdit
          Left = 378
          Top = 75
          Width = 57
          Height = 19
          Ctl3D = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 5
          Text = '     -   '
          OnKeyPress = Representante_CepKeyPress
        end
        object Representante_Pais: TComboBox
          Left = 443
          Top = 75
          Width = 100
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 6
          Text = 'Brasil'
          OnKeyPress = Representante_PaisKeyPress
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
        object Representante_Estado: TComboBox
          Left = 328
          Top = 75
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
          OnKeyPress = Representante_EstadoKeyPress
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
      end
      object Representante_Contato: TEdit
        Left = 358
        Top = 35
        Width = 195
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Representante_ContatoKeyPress
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 173
        Width = 553
        Height = 105
        Caption = '  Dados de Contato  '
        TabOrder = 4
        object Label11: TLabel
          Left = 8
          Top = 23
          Width = 24
          Height = 13
          Caption = 'DDD'
        end
        object Label13: TLabel
          Left = 91
          Top = 23
          Width = 46
          Height = 13
          Caption = 'Comercial'
        end
        object Label14: TLabel
          Left = 324
          Top = 23
          Width = 55
          Height = 13
          Caption = 'Residencial'
        end
        object Label15: TLabel
          Left = 324
          Top = 63
          Width = 32
          Height = 13
          Caption = 'Celular'
        end
        object Label16: TLabel
          Left = 43
          Top = 23
          Width = 30
          Height = 13
          Caption = 'Ramal'
        end
        object Label10: TLabel
          Left = 8
          Top = 63
          Width = 29
          Height = 13
          Caption = 'E-Mail'
        end
        object Representante_DDD: TEdit
          Left = 8
          Top = 38
          Width = 28
          Height = 19
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Representante_DDDKeyPress
        end
        object Representante_Fone_Comercial: TEdit
          Left = 91
          Top = 38
          Width = 220
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Representante_Fone_ComercialKeyPress
        end
        object Representante_Fone_Residencial: TEdit
          Left = 324
          Top = 38
          Width = 220
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 3
          OnKeyPress = Representante_Fone_ResidencialKeyPress
        end
        object Representante_Fone_Celular: TEdit
          Left = 324
          Top = 78
          Width = 220
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 5
          OnKeyPress = Representante_Fone_CelularKeyPress
        end
        object Representante_Ramal: TEdit
          Left = 43
          Top = 38
          Width = 41
          Height = 19
          Ctl3D = False
          MaxLength = 5
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Representante_RamalKeyPress
        end
        object Representante_EMail: TEdit
          Left = 8
          Top = 78
          Width = 303
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 4
          OnKeyPress = Representante_EMailKeyPress
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 286
        Width = 553
        Height = 126
        Caption = '  Dados Adicionais  '
        TabOrder = 5
        object Label17: TLabel
          Left = 8
          Top = 59
          Width = 63
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object Label18: TLabel
          Left = 8
          Top = 19
          Width = 75
          Height = 13
          Caption = '1. Porcentagem'
        end
        object Label19: TLabel
          Left = 115
          Top = 19
          Width = 75
          Height = 13
          Caption = '2. Porcentagem'
          Visible = False
        end
        object Representante_Observacao: TMemo
          Left = 8
          Top = 74
          Width = 537
          Height = 45
          Ctl3D = False
          ParentCtl3D = False
          ScrollBars = ssVertical
          TabOrder = 4
        end
        object Representante_2_Porcentagem: TEdit
          Left = 115
          Top = 34
          Width = 85
          Height = 19
          Ctl3D = False
          MaxLength = 6
          ParentCtl3D = False
          TabOrder = 1
          Text = '0'
          Visible = False
          OnKeyPress = Representante_2_PorcentagemKeyPress
        end
        object Representante_1_Porcentagem: TEdit
          Left = 8
          Top = 34
          Width = 85
          Height = 19
          Ctl3D = False
          MaxLength = 6
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Representante_1_PorcentagemKeyPress
        end
        object Representante_ICMS_Grupo: TGroupBox
          Left = 229
          Top = 13
          Width = 146
          Height = 52
          Caption = '  Calcula o ICMS ?  '
          TabOrder = 2
          object Representante_ICMS_Sim: TRadioButton
            Left = 16
            Top = 24
            Width = 44
            Height = 17
            Caption = 'Sim'
            TabOrder = 0
          end
          object Representante_ICMS_Nao: TRadioButton
            Left = 88
            Top = 24
            Width = 46
            Height = 17
            Caption = 'N'#227'o'
            Checked = True
            TabOrder = 1
            TabStop = True
          end
        end
        object Representante_Relatorio_Grupo: TGroupBox
          Left = 399
          Top = 13
          Width = 146
          Height = 52
          Caption = '  Emite os Relat'#243'rios ?  '
          TabOrder = 3
          object Representante_Relatorio_Sim: TRadioButton
            Left = 16
            Top = 24
            Width = 44
            Height = 17
            Caption = 'Sim'
            TabOrder = 0
          end
          object Representante_Relatorio_Nao: TRadioButton
            Left = 88
            Top = 24
            Width = 46
            Height = 17
            Caption = 'N'#227'o'
            Checked = True
            TabOrder = 1
            TabStop = True
          end
        end
      end
    end
  end
end
