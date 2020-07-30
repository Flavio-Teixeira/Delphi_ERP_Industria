object Funcionarios01: TFuncionarios01
  Left = 328
  Top = 158
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Funcion'#225'rios - INCLUS'#195'O'
  ClientHeight = 542
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
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 4
    Top = 498
    Width = 754
    Height = 40
    Ctl3D = True
    ParentCtl3D = False
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
    object Pag2: TEdit
      Left = 40
      Top = 8
      Width = 9
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Fechar: TEdit
      Left = 56
      Top = 8
      Width = 9
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
      OnChange = FecharChange
    end
  end
  object PageControl1: TPageControl
    Left = 4
    Top = 4
    Width = 754
    Height = 489
    ActivePage = TabSheet1
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Funcion'#225'rios p'#225'g.1'
      object GroupBox1: TGroupBox
        Left = 4
        Top = 0
        Width = 739
        Height = 457
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label4: TLabel
          Left = 8
          Top = 54
          Width = 54
          Height = 13
          Caption = 'C.P.F./ CIC'
        end
        object Label7: TLabel
          Left = 192
          Top = 54
          Width = 16
          Height = 13
          Caption = 'RG'
        end
        object ED_Funcionario_Nome: TEdit
          Left = 8
          Top = 32
          Width = 355
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 0
        end
        object ED_Funcionario_Rg: TEdit
          Left = 193
          Top = 70
          Width = 170
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 2
        end
        object GroupBox2: TGroupBox
          Left = 376
          Top = 202
          Width = 355
          Height = 179
          Caption = '  Dados da Contrata'#231#227'o  '
          TabOrder = 8
          object Label8: TLabel
            Left = 16
            Top = 16
            Width = 45
            Height = 13
            Caption = 'Admiss'#227'o'
          end
          object Label9: TLabel
            Left = 280
            Top = 16
            Width = 44
            Height = 13
            Caption = 'Rescis'#227'o'
          end
          object Label10: TLabel
            Left = 16
            Top = 56
            Width = 28
            Height = 13
            Caption = 'Cargo'
          end
          object Label11: TLabel
            Left = 184
            Top = 56
            Width = 67
            Height = 13
            Caption = 'Departamento'
          end
          object Label12: TLabel
            Left = 16
            Top = 136
            Width = 32
            Height = 13
            Caption = 'Sal'#225'rio'
          end
          object Label14: TLabel
            Left = 16
            Top = 96
            Width = 34
            Height = 13
            Caption = 'Hor'#225'rio'
          end
          object Label15: TLabel
            Left = 88
            Top = 115
            Width = 15
            Height = 13
            Caption = 'at'#233
          end
          object Label16: TLabel
            Left = 184
            Top = 96
            Width = 92
            Height = 13
            Caption = 'Tempo de Intervalo'
          end
          object ED_Funcionario_Data_Admissao: TMaskEdit
            Left = 16
            Top = 32
            Width = 63
            Height = 19
            Ctl3D = False
            EditMask = '!99/99/9999;1; '
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 0
            Text = '  /  /    '
          end
          object ED_Funcionario_Data_Rescisao: TMaskEdit
            Left = 280
            Top = 32
            Width = 63
            Height = 19
            Ctl3D = False
            EditMask = '!99/99/9999;1; '
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 1
            Text = '  /  /    '
          end
          object ED_Funcionario_Cargo: TEdit
            Left = 16
            Top = 72
            Width = 160
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 2
          end
          object ED_Funcionario_Funcao: TEdit
            Left = 184
            Top = 72
            Width = 160
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 3
          end
          object ED_Funcionario_Salario: TEdit
            Left = 16
            Top = 152
            Width = 99
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 7
            OnKeyPress = ED_Funcionario_SalarioKeyPress
          end
          object ED_Funcionario_Horario_F: TMaskEdit
            Left = 114
            Top = 112
            Width = 61
            Height = 19
            Ctl3D = False
            EditMask = '!99:99;1; '
            MaxLength = 5
            ParentCtl3D = False
            TabOrder = 5
            Text = '  :  '
          end
          object ED_Funcionario_Horario_I: TMaskEdit
            Left = 16
            Top = 112
            Width = 61
            Height = 19
            Ctl3D = False
            EditMask = '!99:99;1; '
            MaxLength = 5
            ParentCtl3D = False
            TabOrder = 4
            Text = '  :  '
          end
          object ED_Funcionario_Intervalo: TEdit
            Left = 184
            Top = 112
            Width = 160
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 6
          end
          object ED_Funcionario_Salario_Periodo: TRadioGroup
            Left = 122
            Top = 136
            Width = 223
            Height = 36
            Caption = 'Valor pago por'
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              'M'#234's'
              'Dia'
              'Hora')
            TabOrder = 8
          end
        end
        object GroupBox3: TGroupBox
          Left = 193
          Top = 102
          Width = 170
          Height = 102
          Caption = '  T'#237'tulo de Eleitor  '
          TabOrder = 4
          object Label6: TLabel
            Left = 16
            Top = 56
            Width = 65
            Height = 13
            Caption = 'Zona Eleitoral'
          end
          object Label5: TLabel
            Left = 16
            Top = 16
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
          end
          object ED_Funcionario_Te_Zona_Eleitoral: TEdit
            Left = 16
            Top = 72
            Width = 145
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 1
          end
          object ED_Funcionario_Te_n: TEdit
            Left = 16
            Top = 32
            Width = 145
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 0
          end
        end
        object GroupBox4: TGroupBox
          Left = 8
          Top = 102
          Width = 170
          Height = 102
          Caption = '  C.T.P.S.  '
          TabOrder = 3
          object Label2: TLabel
            Left = 16
            Top = 16
            Width = 70
            Height = 13
            Caption = 'N'#186' da C.T.P.S.'
          end
          object Label3: TLabel
            Left = 17
            Top = 56
            Width = 24
            Height = 13
            Caption = 'S'#233'rie'
          end
          object ED_Funcionario_Ctps_n: TEdit
            Left = 16
            Top = 32
            Width = 145
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 0
          end
          object ED_Funcionario_Ctps_Serie: TEdit
            Left = 16
            Top = 72
            Width = 145
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 1
          end
        end
        object GroupBox5: TGroupBox
          Left = 376
          Top = 56
          Width = 355
          Height = 141
          Caption = '  Caracter'#237'sticas  '
          TabOrder = 7
          object Label17: TLabel
            Left = 16
            Top = 17
            Width = 33
            Height = 13
            Caption = 'Cabelo'
          end
          object Label18: TLabel
            Left = 184
            Top = 17
            Width = 27
            Height = 13
            Caption = 'Olhos'
          end
          object Label19: TLabel
            Left = 16
            Top = 57
            Width = 27
            Height = 13
            Caption = 'Altura'
          end
          object Label20: TLabel
            Left = 184
            Top = 57
            Width = 24
            Height = 13
            Caption = 'Peso'
          end
          object Label21: TLabel
            Left = 16
            Top = 97
            Width = 28
            Height = 13
            Caption = 'Sinais'
          end
          object ED_Funcionario_Cabelo: TEdit
            Left = 16
            Top = 33
            Width = 160
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 0
          end
          object ED_Funcionario_Olhos: TEdit
            Left = 184
            Top = 33
            Width = 160
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 1
          end
          object ED_Funcionario_Altura: TEdit
            Left = 16
            Top = 73
            Width = 160
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 2
          end
          object ED_Funcionario_Peso: TEdit
            Left = 184
            Top = 73
            Width = 160
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 3
          end
          object ED_Funcionario_Sinais: TEdit
            Left = 16
            Top = 113
            Width = 160
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 4
          end
        end
        object GroupBox17: TGroupBox
          Left = 8
          Top = 211
          Width = 355
          Height = 62
          Caption = '  Contato  '
          TabOrder = 5
          object Label70: TLabel
            Left = 184
            Top = 16
            Width = 17
            Height = 13
            Caption = 'Fax'
          end
          object Label69: TLabel
            Left = 16
            Top = 16
            Width = 24
            Height = 13
            Caption = 'Fone'
          end
          object ED_Funcionario_Fax: TEdit
            Left = 184
            Top = 32
            Width = 161
            Height = 19
            Ctl3D = False
            MaxLength = 50
            ParentCtl3D = False
            TabOrder = 1
          end
          object ED_Funcionario_Fone: TEdit
            Left = 16
            Top = 32
            Width = 153
            Height = 19
            Ctl3D = False
            MaxLength = 50
            ParentCtl3D = False
            TabOrder = 0
          end
        end
        object ED_Funcionario_Cpf: TMaskEdit
          Left = 8
          Top = 70
          Width = 170
          Height = 19
          Ctl3D = False
          EditMask = '999.999.999-99;1; '
          MaxLength = 14
          ParentCtl3D = False
          TabOrder = 1
          Text = '   .   .   -  '
        end
        object GroupBox7: TGroupBox
          Left = 8
          Top = 282
          Width = 355
          Height = 99
          Caption = '  Endere'#231'o  '
          TabOrder = 6
          object Label27: TLabel
            Left = 16
            Top = 16
            Width = 150
            Height = 13
            Caption = 'Logradouro (Rua, Avenida, Etc)'
          end
          object Label28: TLabel
            Left = 16
            Top = 56
            Width = 27
            Height = 13
            Caption = 'Bairro'
          end
          object Label29: TLabel
            Left = 128
            Top = 56
            Width = 33
            Height = 13
            Caption = 'Cidade'
          end
          object Label30: TLabel
            Left = 238
            Top = 56
            Width = 33
            Height = 13
            Caption = 'Estado'
          end
          object Label31: TLabel
            Left = 288
            Top = 56
            Width = 21
            Height = 13
            Caption = 'CEP'
          end
          object ED_Funcionario_Endereco: TEdit
            Left = 16
            Top = 32
            Width = 329
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 0
          end
          object ED_Funcionario_Bairro: TEdit
            Left = 16
            Top = 72
            Width = 104
            Height = 19
            Ctl3D = False
            MaxLength = 80
            ParentCtl3D = False
            TabOrder = 1
          end
          object ED_Funcionario_Cidade: TEdit
            Left = 128
            Top = 72
            Width = 104
            Height = 19
            Ctl3D = False
            MaxLength = 80
            ParentCtl3D = False
            TabOrder = 2
          end
          object CB_Funcionario_Estado: TComboBox
            Left = 238
            Top = 72
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
          object ED_Funcionario_Cep: TMaskEdit
            Left = 288
            Top = 72
            Width = 57
            Height = 19
            Ctl3D = False
            EditMask = '99999\-999;1; '
            MaxLength = 9
            ParentCtl3D = False
            TabOrder = 4
            Text = '     -   '
          end
        end
        object GroupBox6: TGroupBox
          Left = 8
          Top = 385
          Width = 724
          Height = 64
          Caption = '  Situa'#231#227'o Perante o Fundo de Garantia do Tempo de Servi'#231'o  '
          TabOrder = 9
          object Label24: TLabel
            Left = 288
            Top = 16
            Width = 94
            Height = 13
            Caption = 'Data de Retrata'#231#227'o'
          end
          object Label25: TLabel
            Left = 192
            Top = 16
            Width = 73
            Height = 13
            Caption = 'Data da Op'#231#227'o'
          end
          object Label26: TLabel
            Left = 400
            Top = 16
            Width = 85
            Height = 13
            Caption = 'Banco deposit'#225'rio'
          end
          object ED_Funcionario_Fgts_Data_Retratacao: TMaskEdit
            Left = 288
            Top = 32
            Width = 63
            Height = 19
            Ctl3D = False
            EditMask = '!99/99/9999;1; '
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 2
            Text = '  /  /    '
          end
          object ED_Funcionario_Fgts_Data_Opcao: TMaskEdit
            Left = 192
            Top = 32
            Width = 65
            Height = 19
            Ctl3D = False
            EditMask = '!99/99/9999;1; '
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 1
            Text = '  /  /    '
          end
          object ED_Funcionario_Fgts_Banco: TEdit
            Left = 400
            Top = 32
            Width = 313
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 3
          end
          object ED_Funcionario_Fgts_Optante: TRadioGroup
            Left = 22
            Top = 15
            Width = 147
            Height = 37
            Caption = #201' optante?'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 0
            OnClick = ED_Funcionario_Fgts_OptanteClick
          end
        end
        object GroupBox11: TGroupBox
          Left = 376
          Top = 10
          Width = 355
          Height = 42
          Caption = '  Empresa que pertence'
          TabOrder = 10
          object CB_Funcionario_Empresa: TComboBox
            Left = 16
            Top = 16
            Width = 160
            Height = 21
            BevelInner = bvNone
            BevelKind = bkSoft
            Ctl3D = False
            ItemHeight = 13
            ItemIndex = 0
            ParentCtl3D = False
            TabOrder = 0
            Text = 'Ibrasmak'
            Items.Strings = (
              'Ibrasmak'
              'Monibras'
              'Aut'#244'nomo'
              'Terceirizado')
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Funcion'#225'rios p'#225'g.2'
      ImageIndex = 1
      object GroupBox8: TGroupBox
        Left = 4
        Top = 0
        Width = 739
        Height = 457
        TabOrder = 0
        object Label34: TLabel
          Left = 192
          Top = 56
          Width = 21
          Height = 13
          Caption = 'M'#227'e'
        end
        object Label33: TLabel
          Left = 8
          Top = 56
          Width = 15
          Height = 13
          Caption = 'Pai'
        end
        object Label32: TLabel
          Left = 8
          Top = 16
          Width = 68
          Height = 13
          Caption = 'Nacionalidade'
        end
        object Label35: TLabel
          Left = 8
          Top = 96
          Width = 100
          Height = 13
          Caption = 'Local de Nascimento'
        end
        object Label36: TLabel
          Left = 8
          Top = 136
          Width = 55
          Height = 13
          Caption = 'Estado Civil'
        end
        object Label37: TLabel
          Left = 192
          Top = 136
          Width = 85
          Height = 13
          Caption = 'Nome do Conjuge'
        end
        object Label38: TLabel
          Left = 8
          Top = 176
          Width = 84
          Height = 13
          Caption = 'Grau de instru'#231#227'o'
        end
        object Label39: TLabel
          Left = 8
          Top = 216
          Width = 53
          Height = 13
          Caption = 'Resid'#234'ncia'
          Visible = False
        end
        object Label40: TLabel
          Left = 8
          Top = 256
          Width = 120
          Height = 13
          Caption = 'Cart. Nac. Habilita'#231#227'o n.'#186
        end
        object Label41: TLabel
          Left = 8
          Top = 296
          Width = 68
          Height = 13
          Caption = 'Cert. Militar n.'#186
        end
        object Label42: TLabel
          Left = 8
          Top = 336
          Width = 24
          Height = 13
          Caption = 'S'#233'rie'
        end
        object Label43: TLabel
          Left = 192
          Top = 336
          Width = 45
          Height = 13
          Caption = 'Categoria'
        end
        object Label54: TLabel
          Left = 298
          Top = 96
          Width = 39
          Height = 13
          Caption = 'Nascido'
        end
        object Label47: TLabel
          Left = 8
          Top = 376
          Width = 60
          Height = 13
          Caption = 'Beneficiarios'
        end
        object ED_Funcionario_Nome_Mae: TEdit
          Left = 192
          Top = 72
          Width = 169
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 2
        end
        object ED_Funcionario_Nome_Pai: TEdit
          Left = 8
          Top = 72
          Width = 169
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 1
        end
        object ED_Funcionario_Nacionalidade: TEdit
          Left = 8
          Top = 32
          Width = 353
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 0
        end
        object ED_Funcionario_Data_Nascimento: TMaskEdit
          Left = 298
          Top = 112
          Width = 63
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1; '
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 4
          Text = '  /  /    '
        end
        object ED_Funcionario_Estado_Civil: TEdit
          Left = 8
          Top = 152
          Width = 169
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 5
        end
        object ED_Funcionario_Nome_Conjuge: TEdit
          Left = 192
          Top = 152
          Width = 169
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 6
        end
        object ED_Funcionario_Grau_Instrucao: TEdit
          Left = 8
          Top = 192
          Width = 353
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 7
        end
        object ED_Funcionario_Residencia: TEdit
          Left = 8
          Top = 232
          Width = 353
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 8
          Visible = False
        end
        object ED_Funcionario_Carteira_Habilitacao_n: TEdit
          Left = 8
          Top = 272
          Width = 353
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 9
        end
        object ED_Funcionario_Certidao_Militar_n: TEdit
          Left = 8
          Top = 312
          Width = 353
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 10
        end
        object ED_Funcionario_Certidao_Militar_Serie: TEdit
          Left = 8
          Top = 352
          Width = 169
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 11
        end
        object ED_Funcionario_Certidao_Militar_Categoria: TEdit
          Left = 192
          Top = 352
          Width = 169
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 12
        end
        object GroupBox9: TGroupBox
          Left = 376
          Top = 16
          Width = 353
          Height = 153
          Caption = '  Estrangeiro  '
          TabOrder = 14
          object Label44: TLabel
            Left = 16
            Top = 24
            Width = 104
            Height = 13
            Caption = 'Carteira modelo 19 n.'#186
          end
          object Label45: TLabel
            Left = 184
            Top = 24
            Width = 85
            Height = 13
            Caption = 'N.'#186' Registro Geral'
          end
          object Label50: TLabel
            Left = 16
            Top = 64
            Width = 86
            Height = 13
            Caption = 'Chegada ao Brasil'
          end
          object Label52: TLabel
            Left = 280
            Top = 64
            Width = 54
            Height = 13
            Caption = 'Decreto n.'#186
          end
          object ED_Funcionario_Estrangeiro_Carteira_19_n: TEdit
            Left = 16
            Top = 40
            Width = 161
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 0
          end
          object ED_Funcionario_Estrangeiro_rg: TEdit
            Left = 184
            Top = 40
            Width = 161
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 1
          end
          object ED_Funcionario_Estrangeiro_Data_Chegada: TMaskEdit
            Left = 16
            Top = 80
            Width = 63
            Height = 19
            Ctl3D = False
            EditMask = '!99/99/9999;1; '
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 2
            Text = '  /  /    '
          end
          object ED_Funcionario_Estrangeiro_Decreto_n: TEdit
            Left = 280
            Top = 80
            Width = 65
            Height = 19
            Ctl3D = False
            Enabled = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 4
          end
          object ED_Funcionario_Estrangeiro_Casado_Brasileiros: TRadioGroup
            Left = 16
            Top = 104
            Width = 161
            Height = 38
            Caption = 'Casado(a) c/ brasileira(o)?'
            Columns = 2
            ItemIndex = 1
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 5
          end
          object ED_Funcionario_Estrangeiro_Filhos_b: TRadioGroup
            Left = 184
            Top = 104
            Width = 161
            Height = 38
            Caption = 'Tem filhos brasileiros? Quantos?'
            Columns = 3
            Ctl3D = True
            ItemIndex = 1
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ParentCtl3D = False
            TabOrder = 6
            OnClick = ED_Funcionario_Estrangeiro_Filhos_bClick
          end
          object ED_Funcionario_Estrangeiro_Naturalizado: TRadioGroup
            Left = 182
            Top = 64
            Width = 91
            Height = 36
            Caption = 'Naturalizado'
            Columns = 2
            ItemIndex = 1
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 3
            OnClick = ED_Funcionario_Estrangeiro_NaturalizadoClick
          end
          object ED_Funcionario_Estrangeiro_Quantos_Filhos: TEdit
            Left = 301
            Top = 118
            Width = 37
            Height = 19
            Ctl3D = False
            Enabled = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 7
            OnKeyPress = ED_Funcionario_Estrangeiro_Quantos_FilhosKeyPress
          end
        end
        object ED_Funcionario_Local_Nascimento: TEdit
          Left = 8
          Top = 112
          Width = 281
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 3
        end
        object GroupBox10: TGroupBox
          Left = 376
          Top = 176
          Width = 353
          Height = 273
          Caption = '  PIS  '
          TabOrder = 15
          object Label62: TLabel
            Left = 16
            Top = 24
            Width = 97
            Height = 13
            Caption = 'Data Cadastramento'
          end
          object Label56: TLabel
            Left = 16
            Top = 64
            Width = 35
            Height = 13
            Caption = 'Sob n.'#186
          end
          object Label57: TLabel
            Left = 184
            Top = 64
            Width = 72
            Height = 13
            Caption = 'Dep. no Banco'
          end
          object Label58: TLabel
            Left = 16
            Top = 104
            Width = 46
            Height = 13
            Caption = 'Endere'#231'o'
          end
          object Label59: TLabel
            Left = 16
            Top = 144
            Width = 82
            Height = 13
            Caption = 'C'#243'digo do Banco'
          end
          object Label60: TLabel
            Left = 184
            Top = 144
            Width = 90
            Height = 13
            Caption = 'C'#243'digo da Ag'#234'ncia'
          end
          object Label61: TLabel
            Left = 16
            Top = 184
            Width = 103
            Height = 13
            Caption = 'Endere'#231'o da Ag'#234'ncia'
          end
          object Label63: TLabel
            Left = 16
            Top = 224
            Width = 25
            Height = 13
            Caption = 'Obs.:'
          end
          object ED_Funcionario_Pis_Data_Cadastramento: TMaskEdit
            Left = 16
            Top = 40
            Width = 63
            Height = 19
            Ctl3D = False
            EditMask = '!99/99/9999;1; '
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 0
            Text = '  /  /    '
          end
          object ED_Funcionario_Pis_Sob_n: TEdit
            Left = 16
            Top = 80
            Width = 161
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 1
          end
          object ED_Funcionario_Pis_Dep_Banco: TEdit
            Left = 184
            Top = 80
            Width = 161
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 2
          end
          object ED_Funcionario_Pis_Endereco: TEdit
            Left = 16
            Top = 120
            Width = 329
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 3
          end
          object ED_Funcionario_Pis_Cod_Banco: TEdit
            Left = 16
            Top = 160
            Width = 161
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 4
          end
          object ED_Funcionario_Pis_Cod_Agencia: TEdit
            Left = 184
            Top = 160
            Width = 161
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 5
          end
          object ED_Funcionario_Pis_Endereco_Agencia: TEdit
            Left = 16
            Top = 200
            Width = 329
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 6
          end
          object ED_Funcionario_Pis_Obs: TEdit
            Left = 16
            Top = 240
            Width = 329
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 7
          end
        end
        object ED_Funcionario_Beneficiarios: TMemo
          Left = 8
          Top = 392
          Width = 353
          Height = 56
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 13
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Funcion'#225'rios p'#225'g.3'
      ImageIndex = 2
      object GroupBox12: TGroupBox
        Left = 4
        Top = 0
        Width = 739
        Height = 457
        TabOrder = 0
        object GroupBox13: TGroupBox
          Left = 8
          Top = 16
          Width = 369
          Height = 193
          Caption = '  Informa'#231#245'es do Banco  '
          TabOrder = 0
          object Label13: TLabel
            Left = 8
            Top = 24
            Width = 77
            Height = 13
            Caption = 'Nome do Banco'
          end
          object Label22: TLabel
            Left = 8
            Top = 64
            Width = 39
            Height = 13
            Caption = 'Ag'#234'ncia'
          end
          object Label23: TLabel
            Left = 8
            Top = 105
            Width = 131
            Height = 13
            Caption = 'Conta Corrente / Poupan'#231'a'
          end
          object Label46: TLabel
            Left = 8
            Top = 147
            Width = 29
            Height = 13
            Caption = 'Titular'
          end
          object Funcionario_Banco_Nome: TEdit
            Left = 8
            Top = 40
            Width = 353
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 0
          end
          object Funcionario_Banco_Agencia: TEdit
            Left = 8
            Top = 80
            Width = 353
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 1
          end
          object Funcionario_Banco_Conta: TEdit
            Left = 8
            Top = 121
            Width = 353
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 2
          end
          object Funcionario_Banco_Titular: TEdit
            Left = 8
            Top = 163
            Width = 353
            Height = 19
            Ctl3D = False
            MaxLength = 255
            ParentCtl3D = False
            TabOrder = 3
          end
        end
      end
    end
  end
end
