object Ordem01: TOrdem01
  Left = 347
  Top = 104
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Nova Ordem de Compra'
  ClientHeight = 657
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
    Top = 608
    Width = 753
    Height = 41
    TabOrder = 0
    object BT_Incluir: TBitBtn
      Left = 339
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Incluir'
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
      Caption = 'Sair'
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
    object Fornecedor_Observacoes: TMemo
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ScrollBars = ssVertical
      TabOrder = 2
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 3
    Width = 753
    Height = 597
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 737
      Height = 585
      Caption = '  Dados do Fornecedor  '
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 136
        Width = 722
        Height = 361
        Caption = '  Rela'#231#227'o de Produtos  '
        TabOrder = 1
        object Label11: TLabel
          Left = 12
          Top = 162
          Width = 102
          Height = 13
          Caption = 'Observa'#231#227'o - Linha 1'
        end
        object Label18: TLabel
          Left = 12
          Top = 183
          Width = 102
          Height = 13
          Caption = 'Observa'#231#227'o - Linha 2'
        end
        object Label22: TLabel
          Left = 12
          Top = 203
          Width = 102
          Height = 13
          Caption = 'Observa'#231#227'o - Linha 3'
        end
        object Label23: TLabel
          Left = 370
          Top = 162
          Width = 102
          Height = 13
          Caption = 'Observa'#231#227'o - Linha 4'
        end
        object Label24: TLabel
          Left = 370
          Top = 183
          Width = 102
          Height = 13
          Caption = 'Observa'#231#227'o - Linha 5'
        end
        object Label25: TLabel
          Left = 382
          Top = 204
          Width = 83
          Height = 13
          Caption = '--- Destina-se a ---'
        end
        object Panel2: TPanel
          Left = 8
          Top = 221
          Width = 708
          Height = 132
          BevelOuter = bvLowered
          TabOrder = 8
          object GroupBox7: TGroupBox
            Left = 6
            Top = 1
            Width = 695
            Height = 80
            Caption = '  Dados para a Ordem de Compra  '
            TabOrder = 0
            object Label47: TLabel
              Left = 417
              Top = 16
              Width = 75
              Height = 13
              Caption = 'Cond.Pgto (DD)'
            end
            object Label4: TLabel
              Left = 330
              Top = 16
              Width = 82
              Height = 13
              Caption = 'Prazo de Entrega'
            end
            object Label9: TLabel
              Left = 126
              Top = 16
              Width = 46
              Height = 13
              Caption = 'Vendedor'
            end
            object Label12: TLabel
              Left = 248
              Top = 16
              Width = 75
              Height = 13
              Caption = 'Or'#231'amento Nro.'
            end
            object Label14: TLabel
              Left = 4
              Top = 16
              Width = 55
              Height = 13
              Caption = 'Funcion'#225'rio'
            end
            object Label8: TLabel
              Left = 495
              Top = 17
              Width = 30
              Height = 13
              Caption = 'Status'
            end
            object Label26: TLabel
              Left = 455
              Top = 59
              Width = 37
              Height = 13
              Caption = 'Entrega'
            end
            object Label27: TLabel
              Left = 264
              Top = 59
              Width = 46
              Height = 13
              Caption = 'Utiliza'#231#227'o'
            end
            object Ordem_Condicao_Pgto_1: TEdit
              Left = 415
              Top = 31
              Width = 78
              Height = 19
              Ctl3D = False
              MaxLength = 100
              ParentCtl3D = False
              TabOrder = 4
              OnKeyPress = Ordem_Condicao_Pgto_1KeyPress
            end
            object Ordem_Prazo: TEdit
              Left = 330
              Top = 31
              Width = 83
              Height = 19
              Ctl3D = False
              MaxLength = 255
              ParentCtl3D = False
              TabOrder = 3
              OnExit = Ordem_PrazoExit
              OnKeyPress = Ordem_PrazoKeyPress
            end
            object Ordem_Vendedor: TEdit
              Left = 126
              Top = 31
              Width = 120
              Height = 19
              Ctl3D = False
              MaxLength = 50
              ParentCtl3D = False
              TabOrder = 1
              OnExit = Ordem_VendedorExit
              OnKeyPress = Ordem_VendedorKeyPress
            end
            object Ordem_Orcamento: TEdit
              Left = 248
              Top = 31
              Width = 80
              Height = 19
              Ctl3D = False
              MaxLength = 50
              ParentCtl3D = False
              TabOrder = 2
              OnExit = Ordem_OrcamentoExit
              OnKeyPress = Ordem_OrcamentoKeyPress
            end
            object Ordem_Funcionario: TEdit
              Left = 4
              Top = 31
              Width = 120
              Height = 19
              Ctl3D = False
              MaxLength = 50
              ParentCtl3D = False
              TabOrder = 0
              OnExit = Ordem_FuncionarioExit
              OnKeyPress = Ordem_FuncionarioKeyPress
            end
            object Ordem_Status: TComboBox
              Left = 495
              Top = 31
              Width = 194
              Height = 19
              BevelInner = bvNone
              BevelKind = bkSoft
              Style = csOwnerDrawFixed
              Ctl3D = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 5
              Text = 'Em Aberto'
              Items.Strings = (
                'Em Aberto'
                'Emitida - Aguardando Entrega'
                'Confer'#234'ncia de Itens'
                'Entregue'
                'Entregue Parcial')
            end
            object Ordem_Entrega: TComboBox
              Left = 495
              Top = 56
              Width = 194
              Height = 19
              BevelInner = bvNone
              BevelKind = bkSoft
              Style = csOwnerDrawFixed
              Ctl3D = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 6
              Text = 'Aguardando'
              Items.Strings = (
                'Aguardando'
                'Retirado'
                'Entregue')
            end
            object tipo_frete_ibrasmak: TRadioButton
              Left = 8
              Top = 56
              Width = 95
              Height = 17
              Caption = 'Ibrasmak retira'
              Checked = True
              TabOrder = 7
              TabStop = True
            end
            object tipo_frete_fornecedor: TRadioButton
              Left = 112
              Top = 56
              Width = 120
              Height = 17
              Caption = 'Fornecedor entrega'
              TabOrder = 8
            end
            object Ordem_Utilizacao: TComboBox
              Left = 313
              Top = 56
              Width = 100
              Height = 19
              BevelInner = bvNone
              BevelKind = bkSoft
              Style = csOwnerDrawFixed
              Ctl3D = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 9
              Text = 'Industrializa'#231#227'o'
              Items.Strings = (
                'Industrializa'#231#227'o'
                'Consumo'
                'Revenda')
            end
          end
          object GroupBox3: TGroupBox
            Left = 6
            Top = 82
            Width = 694
            Height = 42
            Caption = '  Totais  '
            TabOrder = 1
            object Label5: TLabel
              Left = 152
              Top = 17
              Width = 69
              Height = 13
              Caption = 'Desconto (R$)'
            end
            object Label6: TLabel
              Left = 565
              Top = 17
              Width = 47
              Height = 13
              Caption = 'Total (R$)'
            end
            object Label7: TLabel
              Left = 6
              Top = 17
              Width = 56
              Height = 13
              Caption = 'Pedido (R$)'
            end
            object Label10: TLabel
              Left = 307
              Top = 17
              Width = 47
              Height = 13
              Caption = 'Frete (R$)'
            end
            object Label2: TLabel
              Left = 445
              Top = 17
              Width = 36
              Height = 13
              Caption = 'IPI (R$)'
            end
            object Valor_Desconto: TEdit
              Left = 224
              Top = 14
              Width = 70
              Height = 19
              Ctl3D = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 1
              OnExit = Valor_DescontoExit
              OnKeyPress = Valor_DescontoKeyPress
            end
            object Valor_Total: TEdit
              Left = 616
              Top = 14
              Width = 70
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 4
              OnExit = Valor_TotalExit
              OnKeyPress = Valor_TotalKeyPress
            end
            object Valor_Pedido: TEdit
              Left = 66
              Top = 14
              Width = 70
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 0
              OnExit = Valor_PedidoExit
              OnKeyPress = Valor_PedidoKeyPress
            end
            object Valor_Frete: TEdit
              Left = 358
              Top = 14
              Width = 70
              Height = 19
              Ctl3D = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 2
              OnExit = Valor_FreteExit
              OnKeyPress = Valor_FreteKeyPress
            end
            object Valor_IPI: TEdit
              Left = 485
              Top = 14
              Width = 70
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 3
              OnExit = Valor_IPIExit
              OnKeyPress = Valor_IPIKeyPress
            end
          end
        end
        object SGD_Produtos: TStringGrid
          Left = 8
          Top = 18
          Width = 708
          Height = 105
          ColCount = 14
          Ctl3D = False
          DefaultRowHeight = 19
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnDblClick = SGD_ProdutosDblClick
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
            64
            64
            64
            64
            64)
        end
        object Panel4: TPanel
          Left = 8
          Top = 125
          Width = 708
          Height = 29
          BevelOuter = bvLowered
          TabOrder = 1
          object BT_Adicionar: TBitBtn
            Left = 402
            Top = 2
            Width = 119
            Height = 25
            Caption = 'Adicionar Produtos'
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
          object BT_Novo: TButton
            Left = 539
            Top = 2
            Width = 165
            Height = 25
            Caption = 'Novo Produto para o Fornecedor'
            TabOrder = 1
            OnClick = BT_NovoClick
          end
          object BT_Adicionar_Comprados: TBitBtn
            Left = 164
            Top = 2
            Width = 235
            Height = 25
            Caption = 'Adicionar Produtos que j'#225' foram Comprados'
            TabOrder = 2
            OnClick = BT_Adicionar_CompradosClick
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
          object Ordem_Empresa: TComboBox
            Left = 5
            Top = 5
            Width = 119
            Height = 19
            BevelInner = bvNone
            BevelKind = bkSoft
            Style = csOwnerDrawFixed
            Ctl3D = False
            ItemHeight = 13
            ItemIndex = 0
            MaxLength = 80
            ParentCtl3D = False
            TabOrder = 3
            Text = 'IBRASMAK'
            Items.Strings = (
              'IBRASMAK'
              'MONIBRAS'
              'FERRAMENTARIA')
          end
        end
        object Ordem_OBS_1: TEdit
          Left = 118
          Top = 159
          Width = 240
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 2
          OnExit = Ordem_OBS_1Exit
          OnKeyPress = Ordem_OBS_1KeyPress
        end
        object Ordem_OBS_2: TEdit
          Left = 118
          Top = 180
          Width = 240
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 3
          OnExit = Ordem_OBS_2Exit
          OnKeyPress = Ordem_OBS_2KeyPress
        end
        object Ordem_OBS_3: TEdit
          Left = 118
          Top = 200
          Width = 240
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 4
          OnExit = Ordem_OBS_3Exit
          OnKeyPress = Ordem_OBS_3KeyPress
        end
        object Ordem_OBS_4: TEdit
          Left = 476
          Top = 159
          Width = 240
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 5
          OnExit = Ordem_OBS_4Exit
          OnKeyPress = Ordem_OBS_4KeyPress
        end
        object Ordem_OBS_5: TEdit
          Left = 476
          Top = 180
          Width = 240
          Height = 19
          Ctl3D = False
          MaxLength = 255
          ParentCtl3D = False
          TabOrder = 6
          OnExit = Ordem_OBS_5Exit
          OnKeyPress = Ordem_OBS_5KeyPress
        end
        object Ordem_Opcao: TComboBox
          Left = 476
          Top = 201
          Width = 240
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 7
          Text = 'MATERIA PRIMA'
          Items.Strings = (
            'MATERIA PRIMA'
            'CONSUMO'
            'IMOBILIZADO')
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 15
        Width = 722
        Height = 121
        Caption = '  Nome / Endere'#231'o  '
        TabOrder = 0
        object Label13: TLabel
          Left = 8
          Top = 47
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label15: TLabel
          Left = 357
          Top = 47
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label16: TLabel
          Left = 460
          Top = 47
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label19: TLabel
          Left = 349
          Top = 12
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label17: TLabel
          Left = 398
          Top = 12
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label20: TLabel
          Left = 461
          Top = 12
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label3: TLabel
          Left = 63
          Top = 12
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label28: TLabel
          Left = 8
          Top = 82
          Width = 37
          Height = 13
          Caption = 'Contato'
        end
        object Label35: TLabel
          Left = 138
          Top = 100
          Width = 50
          Height = 13
          Caption = 'Telefones:'
        end
        object Label30: TLabel
          Left = 190
          Top = 82
          Width = 46
          Height = 13
          Caption = 'Comercial'
        end
        object Label32: TLabel
          Left = 264
          Top = 82
          Width = 32
          Height = 13
          Caption = 'Celular'
        end
        object Label33: TLabel
          Left = 338
          Top = 82
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label44: TLabel
          Left = 420
          Top = 82
          Width = 29
          Height = 13
          Caption = 'E-Mail'
        end
        object Label1: TLabel
          Left = 574
          Top = 82
          Width = 18
          Height = 13
          Caption = 'Site'
        end
        object Label21: TLabel
          Left = 8
          Top = 12
          Width = 20
          Height = 13
          Caption = 'Nro.'
        end
        object Fornecedor_Endereco: TEdit
          Left = 8
          Top = 62
          Width = 345
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 4
        end
        object Fornecedor_Bairro: TEdit
          Left = 357
          Top = 62
          Width = 100
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 5
        end
        object Fornecedor_Cidade: TEdit
          Left = 460
          Top = 62
          Width = 100
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 6
        end
        object Fornecedor_Estado: TComboBox
          Left = 349
          Top = 27
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
          TabOrder = 1
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
        object Fornecedor_Cep: TMaskEdit
          Left = 398
          Top = 27
          Width = 57
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 2
          Text = '     -   '
        end
        object Fornecedor_Pais: TComboBox
          Left = 461
          Top = 27
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
          TabOrder = 3
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
        object Fornecedor_Nome: TEdit
          Left = 63
          Top = 27
          Width = 281
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
        end
        object BT_Procurar: TBitBtn
          Left = 565
          Top = 12
          Width = 150
          Height = 24
          Caption = 'Procurar por Fornecedor'
          TabOrder = 12
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
        object Fornecedor_Contato: TEdit
          Left = 8
          Top = 97
          Width = 125
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 7
        end
        object Fornecedor_Fone_Comercial: TEdit
          Left = 190
          Top = 97
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 8
        end
        object Fornecedor_Fone_Celular: TEdit
          Left = 264
          Top = 97
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 9
        end
        object Fornecedor_Fone_Fax: TEdit
          Left = 338
          Top = 97
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 10
        end
        object Fornecedor_Email: TEdit
          Left = 420
          Top = 97
          Width = 150
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 11
        end
        object BT_Alterar: TBitBtn
          Left = 565
          Top = 40
          Width = 150
          Height = 24
          Caption = 'Alterar Dados Cadastrais'
          TabOrder = 13
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
        object Fornecedor_Site: TEdit
          Left = 574
          Top = 97
          Width = 141
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 14
        end
        object Fornecedor_Numero: TEdit
          Left = 8
          Top = 27
          Width = 51
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 15
        end
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 498
        Width = 721
        Height = 79
        Caption = 'Observa'#231#227'o'
        TabOrder = 2
        object observacao: TMemo
          Left = 5
          Top = 16
          Width = 710
          Height = 57
          TabOrder = 0
          WantReturns = False
        end
      end
    end
  end
end
