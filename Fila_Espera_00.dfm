object FilaEspera00: TFilaEspera00
  Left = 226
  Top = 121
  BorderStyle = bsDialog
  Caption = '(PCP) Fila de Espera'
  ClientHeight = 475
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 4
    Top = 6
    Width = 675
    Height = 210
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 33
      Width = 509
      Height = 13
      Caption = 
        'Fila de Pedidos:           (Ser'#227'o exibidos apenas os pedidos que' +
        ' possuam a estrutura de produtos cadastrada)'
    end
    object Label2: TLabel
      Left = 530
      Top = 33
      Width = 37
      Height = 13
      Caption = 'Op'#231#245'es'
    end
    object Label5: TLabel
      Left = 328
      Top = 7
      Width = 89
      Height = 13
      Caption = 'Ao Clicar na Linha:'
    end
    object DBGrid_Pedidos: TDBGrid
      Left = 8
      Top = 53
      Width = 655
      Height = 146
      Ctl3D = False
      DataSource = ConexaoBD.DS_Pedidos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid_PedidosCellClick
      OnDrawColumnCell = DBGrid_PedidosDrawColumnCell
      Columns = <
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'pedido_numero'
          Title.Caption = 'Nro.OS'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pedido_data'
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pedido_empresa'
          Title.Caption = 'Empresa'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pedido_cliente_nome'
          Title.Caption = 'Cliente'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 201
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pedido_status_producao'
          Title.Caption = 'Status'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 146
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pedido_data_entrega'
          Title.Caption = 'DT.Entrega'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object Opcoes_Procura: TComboBox
      Left = 570
      Top = 30
      Width = 93
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      ItemHeight = 13
      ItemIndex = 1
      ParentCtl3D = False
      TabOrder = 1
      Text = 'Aguardando'
      OnChange = Opcoes_ProcuraChange
      Items.Strings = (
        'Todos'
        'Aguardando'
        'Em Produ'#231#227'o'
        'Finalizados')
    end
    object Opcao_Enviar_Producao: TRadioButton
      Left = 429
      Top = 6
      Width = 134
      Height = 17
      Caption = 'Enviar para a Produ'#231#227'o'
      TabOrder = 2
    end
    object Opcao_Abrir_OS: TRadioButton
      Left = 597
      Top = 6
      Width = 70
      Height = 17
      Caption = 'Abrir a OS'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
  end
  object Panel1: TPanel
    Left = 4
    Top = 221
    Width = 675
    Height = 204
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 7
      Width = 83
      Height = 13
      Caption = 'Fila de Produ'#231#227'o:'
    end
    object Label4: TLabel
      Left = 530
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Op'#231#245'es'
    end
    object DBGrid_Producao: TDBGrid
      Left = 8
      Top = 27
      Width = 655
      Height = 164
      Ctl3D = False
      DataSource = ConexaoBD.DS_Producao
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnCellClick = DBGrid_ProducaoCellClick
      OnDrawColumnCell = DBGrid_ProducaoDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'producao_numero'
          Title.Caption = 'Produ'#231#227'o'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producao_numero_os'
          Title.Caption = 'Nro. OS'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producao_data_os'
          Title.Caption = 'Data OS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producao_codigo_produto'
          Title.Caption = 'C'#243'd.M'#225'quina'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producao_descricao_produto'
          Title.Caption = 'Desc.M'#225'quina'
          Width = 139
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producao_data_inicio'
          Title.Caption = 'DT.In'#237'cio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producao_status'
          Title.Caption = 'Status'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producao_data_final'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'producao_porcentagem'
          Title.Caption = 'Conclu'#237'do'
          Width = 62
          Visible = True
        end>
    end
    object Opcao_Producao: TComboBox
      Left = 570
      Top = 4
      Width = 93
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      ItemHeight = 13
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 1
      Text = 'Todos'
      OnChange = Opcao_ProducaoChange
      Items.Strings = (
        'Todos'
        'Aguardando'
        'Produzindo'
        'Parado'
        'Finalizado')
    end
  end
  object Panel3: TPanel
    Left = 4
    Top = 430
    Width = 675
    Height = 41
    TabOrder = 2
    object BT_Sair: TBitBtn
      Left = 589
      Top = 7
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
    object DBG_Cliente_Observacao: TDBMemo
      Left = 4
      Top = 3
      Width = 8
      Height = 21
      Ctl3D = False
      DataField = 'pedido_cliente_observacao'
      DataSource = ConexaoBD.DS_Pedidos
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
    end
    object DBG_Observacao_Nota: TDBMemo
      Left = 12
      Top = 3
      Width = 8
      Height = 21
      Ctl3D = False
      DataField = 'pedido_nota_observacao'
      DataSource = ConexaoBD.DS_Pedidos
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object DBG_Observacao_Fabrica: TDBMemo
      Left = 20
      Top = 3
      Width = 8
      Height = 21
      Ctl3D = False
      DataField = 'pedido_observacao_fabrica'
      DataSource = ConexaoBD.DS_Pedidos
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object DBG_Observacao_Faturamento: TDBMemo
      Left = 28
      Top = 3
      Width = 8
      Height = 21
      Ctl3D = False
      DataField = 'pedido_observacao_fatura'
      DataSource = ConexaoBD.DS_Pedidos
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
  end
end
