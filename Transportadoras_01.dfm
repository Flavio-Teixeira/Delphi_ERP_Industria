object Transportadoras01: TTransportadoras01
  Left = 277
  Top = 154
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Transportadoras - INCLUS'#195'O'
  ClientHeight = 370
  ClientWidth = 658
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 4
    Top = 324
    Width = 649
    Height = 41
    TabOrder = 1
    object BT_Incluir: TBitBtn
      Left = 287
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
      Left = 566
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
    Width = 649
    Height = 313
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 633
      Height = 300
      Caption = '  Dados da Transportadora  '
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object Label2: TLabel
        Left = 121
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label14: TLabel
        Left = 121
        Top = 55
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label15: TLabel
        Left = 515
        Top = 20
        Width = 87
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
      end
      object Label17: TLabel
        Left = 514
        Top = 55
        Width = 91
        Height = 13
        Caption = 'Inscri'#231#227'o Municipal'
      end
      object Label18: TLabel
        Left = 12
        Top = 264
        Width = 63
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object Transportadora_Nome: TEdit
        Left = 121
        Top = 35
        Width = 385
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Transportadora_NomeKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 90
        Width = 617
        Height = 91
        Caption = '  Endere'#231'o  '
        TabOrder = 5
        object Label3: TLabel
          Left = 8
          Top = 13
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
          Top = 48
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label5: TLabel
          Left = 443
          Top = 13
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label6: TLabel
          Left = 201
          Top = 48
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label7: TLabel
          Left = 393
          Top = 48
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label8: TLabel
          Left = 508
          Top = 48
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label9: TLabel
          Left = 443
          Top = 48
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Transportadora_Endereco: TEdit
          Left = 8
          Top = 28
          Width = 428
          Height = 19
          Ctl3D = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Transportadora_EnderecoKeyPress
        end
        object Transportadora_Bairro: TEdit
          Left = 9
          Top = 63
          Width = 185
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Transportadora_BairroKeyPress
        end
        object Transportadora_Cidade: TEdit
          Left = 201
          Top = 63
          Width = 185
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 3
          OnKeyPress = Transportadora_CidadeKeyPress
        end
        object Transportadora_Complemento: TEdit
          Left = 443
          Top = 28
          Width = 165
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Transportadora_ComplementoKeyPress
        end
        object Transportadora_Cep: TMaskEdit
          Left = 443
          Top = 63
          Width = 57
          Height = 19
          Ctl3D = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 5
          Text = '     -   '
          OnKeyPress = Transportadora_CepKeyPress
        end
        object Transportadora_Pais: TComboBox
          Left = 508
          Top = 63
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
          OnKeyPress = Transportadora_PaisKeyPress
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
        object Transportadora_Estado: TComboBox
          Left = 393
          Top = 63
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
          OnKeyPress = Transportadora_EstadoKeyPress
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
      object GroupBox3: TGroupBox
        Left = 8
        Top = 182
        Width = 617
        Height = 65
        Caption = '  Dados de Contato  '
        TabOrder = 6
        object Label11: TLabel
          Left = 8
          Top = 13
          Width = 24
          Height = 13
          Caption = 'DDD'
        end
        object Label13: TLabel
          Left = 85
          Top = 13
          Width = 73
          Height = 13
          Caption = 'Fone Comercial'
        end
        object Label16: TLabel
          Left = 40
          Top = 13
          Width = 30
          Height = 13
          Caption = 'Ramal'
        end
        object Label10: TLabel
          Left = 460
          Top = 13
          Width = 29
          Height = 13
          Caption = 'E-Mail'
        end
        object Label12: TLabel
          Left = 298
          Top = 13
          Width = 37
          Height = 13
          Caption = 'Contato'
        end
        object Transportadora_DDD: TEdit
          Left = 8
          Top = 28
          Width = 28
          Height = 19
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Transportadora_DDDKeyPress
        end
        object Transportadora_Comercial: TEdit
          Left = 85
          Top = 28
          Width = 200
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Transportadora_ComercialKeyPress
        end
        object Transportadora_Ramal: TEdit
          Left = 40
          Top = 28
          Width = 41
          Height = 19
          Ctl3D = False
          MaxLength = 5
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Transportadora_RamalKeyPress
        end
        object Transportadora_EMail: TEdit
          Left = 460
          Top = 28
          Width = 150
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 4
          OnKeyPress = Transportadora_EMailKeyPress
        end
        object Transportadora_Contato: TEdit
          Left = 298
          Top = 28
          Width = 150
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 3
          OnKeyPress = Transportadora_ContatoKeyPress
        end
      end
      object Transportadora_CNPJ: TMaskEdit
        Left = 8
        Top = 35
        Width = 108
        Height = 19
        Ctl3D = False
        EditMask = '!99\.999\.999\/9999\-99;1;_'
        MaxLength = 18
        ParentCtl3D = False
        TabOrder = 0
        Text = '  .   .   /    -  '
        OnKeyPress = Transportadora_CNPJKeyPress
      end
      object Transportadora_Razao_Social: TEdit
        Left = 121
        Top = 70
        Width = 385
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Transportadora_Razao_SocialKeyPress
      end
      object Transportadora_Inscricao_Estadual: TEdit
        Left = 515
        Top = 35
        Width = 110
        Height = 19
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = Transportadora_Inscricao_EstadualKeyPress
      end
      object Transportadora_Inscricao_Municipal: TEdit
        Left = 514
        Top = 70
        Width = 110
        Height = 19
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Transportadora_Inscricao_MunicipalKeyPress
      end
      object Transportadora_Observacao: TMemo
        Left = 80
        Top = 248
        Width = 544
        Height = 44
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
      end
    end
  end
end
