object Informacao01: TInformacao01
  Left = 193
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'SAC - INFORMA'#199#194'O'
  ClientHeight = 509
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
    Top = 463
    Width = 753
    Height = 41
    TabOrder = 1
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
      Left = 670
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
    object Informacao_Cliente_Existe: TEdit
      Left = 271
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Cliente_Codigo: TEdit
      Left = 279
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Cliente_Codigo_Tipo: TEdit
      Left = 287
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object Panel2: TPanel
      Left = 7
      Top = 8
      Width = 262
      Height = 25
      BevelOuter = bvLowered
      TabOrder = 5
      object Label2: TLabel
        Left = 8
        Top = 6
        Width = 148
        Height = 13
        Caption = 'D'#250'vida / Informa'#231#227'o do Cliente'
      end
      object Sac_Status: TComboBox
        Left = 161
        Top = 3
        Width = 97
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 0
        Text = 'N'#227'o Resolvida'
        Items.Strings = (
          'N'#227'o Resolvida'
          'Resolvida')
      end
    end
    object DBG_FB_Cliente_Observacao: TDBMemo
      Left = 295
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_cliente_observacoes'
      DataSource = ConexaoBD.DS_FB_Clientes
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
    end
    object DBG_VT_Cliente_Observacao: TDBMemo
      Left = 303
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'vt_cliente_observacoes'
      ParentCtl3D = False
      TabOrder = 7
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 3
    Width = 753
    Height = 455
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 737
      Height = 443
      Caption = '  Dados do Cliente  '
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 184
        Width = 722
        Height = 123
        Caption = '  D'#250'vida / Informa'#231#227'o do Cliente  '
        TabOrder = 1
        object Sac_Pergunta: TMemo
          Left = 7
          Top = 15
          Width = 708
          Height = 100
          Ctl3D = False
          ParentCtl3D = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 312
        Width = 722
        Height = 123
        Caption = '  Resposta / Informa'#231#227'o Fornecida  '
        TabOrder = 2
        object Sac_Resposta: TMemo
          Left = 7
          Top = 15
          Width = 708
          Height = 100
          Ctl3D = False
          ParentCtl3D = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 18
        Width = 722
        Height = 160
        Caption = '  Nome / Endere'#231'o  '
        TabOrder = 0
        object Label13: TLabel
          Left = 8
          Top = 69
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label14: TLabel
          Left = 307
          Top = 69
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label15: TLabel
          Left = 411
          Top = 69
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label16: TLabel
          Left = 565
          Top = 69
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label19: TLabel
          Left = 349
          Top = 31
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label17: TLabel
          Left = 398
          Top = 31
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label20: TLabel
          Left = 461
          Top = 31
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label3: TLabel
          Left = 69
          Top = 31
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label1: TLabel
          Left = 8
          Top = 31
          Width = 41
          Height = 13
          Caption = 'Empresa'
        end
        object Label28: TLabel
          Left = 8
          Top = 110
          Width = 37
          Height = 13
          Caption = 'Contato'
        end
        object Label35: TLabel
          Left = 138
          Top = 128
          Width = 50
          Height = 13
          Caption = 'Telefones:'
        end
        object Label29: TLabel
          Left = 190
          Top = 110
          Width = 24
          Height = 13
          Caption = 'DDD'
        end
        object Label34: TLabel
          Left = 221
          Top = 110
          Width = 30
          Height = 13
          Caption = 'Ramal'
        end
        object Label30: TLabel
          Left = 265
          Top = 110
          Width = 46
          Height = 13
          Caption = 'Comercial'
        end
        object Label31: TLabel
          Left = 340
          Top = 110
          Width = 55
          Height = 13
          Caption = 'Residencial'
        end
        object Label32: TLabel
          Left = 415
          Top = 110
          Width = 32
          Height = 13
          Caption = 'Celular'
        end
        object Label33: TLabel
          Left = 489
          Top = 110
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label44: TLabel
          Left = 577
          Top = 110
          Width = 29
          Height = 13
          Caption = 'E-Mail'
        end
        object Cliente_Endereco: TEdit
          Left = 8
          Top = 84
          Width = 295
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
        end
        object Cliente_Complemento: TEdit
          Left = 307
          Top = 84
          Width = 100
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 1
        end
        object Cliente_Bairro: TEdit
          Left = 411
          Top = 84
          Width = 150
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 2
        end
        object Cliente_Cidade: TEdit
          Left = 565
          Top = 84
          Width = 150
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 3
        end
        object Cliente_Estado: TComboBox
          Left = 349
          Top = 46
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
          Left = 398
          Top = 46
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
          Left = 461
          Top = 46
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
        object Cliente_Nome: TEdit
          Left = 69
          Top = 46
          Width = 274
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 7
        end
        object Cliente_Empresa: TEdit
          Left = 8
          Top = 46
          Width = 57
          Height = 19
          Ctl3D = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 80
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
        end
        object Cliente_Contato: TEdit
          Left = 8
          Top = 125
          Width = 125
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 9
        end
        object Cliente_DDD: TEdit
          Left = 190
          Top = 125
          Width = 25
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 3
          ParentCtl3D = False
          TabOrder = 10
        end
        object Cliente_Fone_Ramal: TEdit
          Left = 221
          Top = 125
          Width = 39
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 5
          ParentCtl3D = False
          TabOrder = 11
        end
        object Cliente_Fone_Comercial: TEdit
          Left = 265
          Top = 125
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 12
        end
        object Cliente_Fone_Residencial: TEdit
          Left = 340
          Top = 125
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 13
        end
        object Cliente_Fone_Celular: TEdit
          Left = 415
          Top = 125
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 14
        end
        object Cliente_Fone_Fax: TEdit
          Left = 489
          Top = 125
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 15
        end
        object Cliente_Email: TEdit
          Left = 577
          Top = 125
          Width = 137
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 16
        end
        object BT_Procurar: TBitBtn
          Left = 566
          Top = 12
          Width = 150
          Height = 24
          Caption = 'Procurar por Cliente        '
          TabOrder = 17
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
        object BT_Alterar: TBitBtn
          Left = 565
          Top = 41
          Width = 150
          Height = 24
          Caption = 'Alterar Dados Cadastrais'
          TabOrder = 18
          WordWrap = True
          OnClick = BT_AlterarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
        end
      end
    end
  end
end
