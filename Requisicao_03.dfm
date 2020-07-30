object Requisicao03: TRequisicao03
  Left = 246
  Top = 128
  BorderStyle = bsSingle
  Caption = 'Nova Requisi'#231#227'o'
  ClientHeight = 590
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 4
    Top = 544
    Width = 753
    Height = 40
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
    object Cliente_Codigo: TEdit
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Requisicao_Grupo: TEdit
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = '0'
      Visible = False
    end
    object Requisicao_Descricao: TEdit
      Left = 12
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Text = '0'
      Visible = False
    end
    object Requisicao_Data: TEdit
      Left = 20
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      Text = '00/00/0000'
      Visible = False
    end
    object Fornecedor_Observacoes: TMemo
      Left = 28
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ScrollBars = ssVertical
      TabOrder = 6
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 3
    Width = 753
    Height = 532
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 737
      Height = 517
      Caption = '  Dados do Fornecedor  '
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 136
        Width = 722
        Height = 369
        Caption = '  Rela'#231#227'o de Produtos  '
        TabOrder = 1
        object Label31: TLabel
          Left = 10
          Top = 343
          Width = 148
          Height = 13
          Caption = 'Observa'#231#227'o para a Tabula'#231#227'o:'
        end
        object Panel2: TPanel
          Left = 8
          Top = 197
          Width = 708
          Height = 135
          BevelOuter = bvLowered
          TabOrder = 2
          object GroupBox7: TGroupBox
            Left = 8
            Top = 9
            Width = 693
            Height = 56
            Caption = '  Dados para a Cota'#231#227'o  '
            TabOrder = 0
            Visible = False
            object Label47: TLabel
              Left = 394
              Top = 16
              Width = 78
              Height = 13
              Caption = 'Cond. Pgto (DD)'
            end
            object Label4: TLabel
              Left = 306
              Top = 16
              Width = 82
              Height = 13
              Caption = 'Prazo de Entrega'
            end
            object Label9: TLabel
              Left = 115
              Top = 16
              Width = 46
              Height = 13
              Caption = 'Vendedor'
            end
            object Label14: TLabel
              Left = 7
              Top = 16
              Width = 55
              Height = 13
              Caption = 'Funcion'#225'rio'
            end
            object Label25: TLabel
              Left = 575
              Top = 16
              Width = 83
              Height = 13
              Caption = '--- Destina-se a ---'
            end
            object Requisicao_Condicao_Pgto_1: TEdit
              Left = 392
              Top = 31
              Width = 18
              Height = 19
              Ctl3D = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 3
              OnExit = Requisicao_Condicao_Pgto_1Exit
              OnKeyPress = Requisicao_Condicao_Pgto_1KeyPress
            end
            object Requisicao_Condicao_Pgto_2: TEdit
              Left = 412
              Top = 31
              Width = 18
              Height = 19
              Ctl3D = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 4
              OnExit = Requisicao_Condicao_Pgto_2Exit
              OnKeyPress = Requisicao_Condicao_Pgto_2KeyPress
            end
            object Requisicao_Condicao_Pgto_3: TEdit
              Left = 432
              Top = 31
              Width = 18
              Height = 19
              Ctl3D = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 5
              OnExit = Requisicao_Condicao_Pgto_3Exit
              OnKeyPress = Requisicao_Condicao_Pgto_3KeyPress
            end
            object Requisicao_Condicao_Pgto_4: TEdit
              Left = 452
              Top = 31
              Width = 18
              Height = 19
              Ctl3D = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 6
              OnExit = Requisicao_Condicao_Pgto_4Exit
              OnKeyPress = Requisicao_Condicao_Pgto_4KeyPress
            end
            object Requisicao_Prazo: TEdit
              Left = 306
              Top = 31
              Width = 83
              Height = 19
              Ctl3D = False
              MaxLength = 50
              ParentCtl3D = False
              TabOrder = 2
              OnExit = Requisicao_PrazoExit
              OnKeyPress = Requisicao_PrazoKeyPress
            end
            object Requisicao_Vendedor: TEdit
              Left = 115
              Top = 31
              Width = 105
              Height = 19
              Ctl3D = False
              MaxLength = 50
              ParentCtl3D = False
              TabOrder = 1
              OnExit = Requisicao_VendedorExit
              OnKeyPress = Requisicao_VendedorKeyPress
            end
            object Requisicao_Funcionario: TEdit
              Left = 7
              Top = 31
              Width = 105
              Height = 19
              Ctl3D = False
              MaxLength = 50
              ParentCtl3D = False
              TabOrder = 0
              OnExit = Requisicao_FuncionarioExit
              OnKeyPress = Requisicao_FuncionarioKeyPress
            end
            object Requisicao_Opcao: TComboBox
              Left = 575
              Top = 31
              Width = 114
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
          object GroupBox3: TGroupBox
            Left = 6
            Top = 58
            Width = 694
            Height = 42
            Caption = '  Totais  '
            TabOrder = 1
            Visible = False
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
          object GroupBox5: TGroupBox
            Left = 6
            Top = 1
            Width = 695
            Height = 128
            Caption = ' Outros Detalhes  '
            TabOrder = 2
            object Label8: TLabel
              Left = 50
              Top = 48
              Width = 30
              Height = 13
              Caption = 'Status'
            end
            object Label12: TLabel
              Left = 5
              Top = 18
              Width = 75
              Height = 13
              Caption = 'Or'#231'amento Nro.'
            end
            object Label11: TLabel
              Left = 463
              Top = 7
              Width = 63
              Height = 13
              Caption = 'Observa'#231#245'es'
            end
            object Label18: TLabel
              Left = 191
              Top = 14
              Width = 96
              Height = 13
              Caption = 'Previs'#227'o de Entrega'
            end
            object Label22: TLabel
              Left = 238
              Top = 58
              Width = 49
              Height = 13
              Caption = 'Solicitante'
            end
            object Label23: TLabel
              Left = 210
              Top = 102
              Width = 76
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label24: TLabel
              Left = 223
              Top = 80
              Width = 64
              Height = 13
              Caption = 'Planejamento'
            end
            object Label26: TLabel
              Left = 38
              Top = 75
              Width = 41
              Height = 13
              Caption = 'Empresa'
            end
            object Label27: TLabel
              Left = 485
              Top = 101
              Width = 38
              Height = 13
              Caption = 'Nro. OS'
            end
            object Label29: TLabel
              Left = 461
              Top = 80
              Width = 62
              Height = 13
              Caption = 'Equipamento'
            end
            object Label36: TLabel
              Left = 228
              Top = 36
              Width = 59
              Height = 13
              Caption = 'Requisitante'
            end
            object Requisicao_Status: TEdit
              Left = 83
              Top = 45
              Width = 100
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 50
              ParentCtl3D = False
              TabOrder = 1
              Text = 'Em Aberto'
              OnExit = Requisicao_StatusExit
              OnKeyPress = Requisicao_StatusKeyPress
            end
            object Requisicao_Orcamento: TEdit
              Left = 83
              Top = 15
              Width = 100
              Height = 19
              Ctl3D = False
              MaxLength = 50
              ParentCtl3D = False
              TabOrder = 0
              OnExit = Requisicao_OrcamentoExit
              OnKeyPress = Requisicao_OrcamentoKeyPress
            end
            object Requisicao_Obs: TMemo
              Left = 463
              Top = 21
              Width = 225
              Height = 52
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 8
              OnExit = Requisicao_ObsExit
              OnKeyPress = Requisicao_ObsKeyPress
            end
            object Requisicao_Previsao_Entrega: TEdit
              Left = 290
              Top = 11
              Width = 162
              Height = 19
              Ctl3D = False
              MaxLength = 255
              ParentCtl3D = False
              TabOrder = 3
              OnExit = Requisicao_Previsao_EntregaExit
              OnKeyPress = Requisicao_Previsao_EntregaKeyPress
            end
            object Requisicao_Solicitante: TEdit
              Left = 290
              Top = 55
              Width = 162
              Height = 19
              Ctl3D = False
              MaxLength = 50
              ParentCtl3D = False
              TabOrder = 5
              OnExit = Requisicao_SolicitanteExit
              OnKeyPress = Requisicao_SolicitanteKeyPress
            end
            object Requisicao_Centro_Custo: TComboBox
              Left = 290
              Top = 100
              Width = 162
              Height = 19
              BevelInner = bvNone
              BevelKind = bkSoft
              Style = csOwnerDrawFixed
              Ctl3D = False
              ItemHeight = 13
              ItemIndex = 0
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 7
              Text = '01 - Ger'#234'ncia Produ'#231#227'o'
              OnExit = Requisicao_Centro_CustoExit
              OnKeyPress = Requisicao_Centro_CustoKeyPress
              Items.Strings = (
                '01 - Ger'#234'ncia Produ'#231#227'o'
                '02 - Almoxarifado'
                '03 - Caldeiraria'
                '04 - Acabamento'
                '05 - Funilaria'
                '06 - Usinagem'
                '07 - Montagem Mec'#226'nica'
                '08 - Pe'#231'as'
                '09 - Solda'
                '10 - Pintura'
                '11 - Estufa'
                '12 - Montagem El'#233'trica'
                '14 - Vendas')
            end
            object Requisicao_Planejamento: TEdit
              Left = 290
              Top = 77
              Width = 162
              Height = 19
              Ctl3D = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 6
              OnExit = Requisicao_PlanejamentoExit
              OnKeyPress = Requisicao_PlanejamentoKeyPress
            end
            object Requisicao_Empresa: TComboBox
              Left = 82
              Top = 72
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
              TabOrder = 2
              Text = 'IBRASMAK'
              OnExit = Requisicao_EmpresaExit
              OnKeyPress = Requisicao_EmpresaKeyPress
              Items.Strings = (
                'IBRASMAK'
                'MONIBRAS'
                'FERRAMENTARIA')
            end
            object Requisicao_OS: TEdit
              Left = 526
              Top = 98
              Width = 162
              Height = 19
              Ctl3D = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 10
              OnExit = Requisicao_OSExit
              OnKeyPress = Requisicao_OSKeyPress
            end
            object Requisicao_Equipamento: TEdit
              Left = 526
              Top = 77
              Width = 162
              Height = 19
              Ctl3D = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 9
              OnExit = Requisicao_EquipamentoExit
              OnKeyPress = Requisicao_EquipamentoKeyPress
            end
            object Requisicao_Requisitante: TEdit
              Left = 290
              Top = 33
              Width = 162
              Height = 19
              Ctl3D = False
              MaxLength = 50
              ParentCtl3D = False
              TabOrder = 4
              OnExit = Requisicao_SolicitanteExit
              OnKeyPress = Requisicao_SolicitanteKeyPress
            end
          end
        end
        object SGD_Produtos: TStringGrid
          Left = 8
          Top = 18
          Width = 708
          Height = 139
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
            64)
        end
        object Panel4: TPanel
          Left = 8
          Top = 163
          Width = 708
          Height = 29
          BevelOuter = bvLowered
          TabOrder = 1
          object BT_Adicionar: TBitBtn
            Left = 290
            Top = 2
            Width = 159
            Height = 25
            Caption = 'Adicionar Outros Produtos'
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
            Left = 536
            Top = 2
            Width = 169
            Height = 25
            Caption = 'Novo Produto para o Fornecedor'
            TabOrder = 1
            OnClick = BT_NovoClick
          end
          object BT_Adicionar_Comprados: TBitBtn
            Left = 33
            Top = 2
            Width = 248
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
        end
        object Requisicao_Observacao_Tabulacao: TEdit
          Left = 162
          Top = 340
          Width = 553
          Height = 19
          Ctl3D = False
          MaxLength = 135
          ParentCtl3D = False
          TabOrder = 3
          OnExit = Requisicao_Observacao_TabulacaoExit
          OnKeyPress = Requisicao_Observacao_TabulacaoKeyPress
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
    end
  end
end
