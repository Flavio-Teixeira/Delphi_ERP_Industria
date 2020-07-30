object FilaEspera01: TFilaEspera01
  Left = 226
  Top = 114
  BorderStyle = bsDialog
  Caption = '(PCP) Fila de Espera - Detalhes'
  ClientHeight = 611
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 4
    Top = 566
    Width = 845
    Height = 41
    TabOrder = 0
    object BT_Sair: TBitBtn
      Left = 762
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
  end
  object Panel1: TPanel
    Left = 4
    Top = 4
    Width = 845
    Height = 47
    TabOrder = 1
    object Label12: TLabel
      Left = 80
      Top = 6
      Width = 46
      Height = 13
      Caption = 'Nro. OS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 6
      Top = 7
      Width = 55
      Height = 13
      Caption = 'Produ'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 154
      Top = 7
      Width = 49
      Height = 13
      Caption = 'Data OS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 232
      Top = 7
      Width = 75
      Height = 13
      Caption = 'C'#243'd.M'#225'quina'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 320
      Top = 7
      Width = 82
      Height = 13
      Caption = 'Desc.M'#225'quina'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 609
      Top = 7
      Width = 53
      Height = 13
      Caption = 'DT.Inicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 763
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 686
      Top = 8
      Width = 67
      Height = 13
      Caption = 'DT.T'#233'rmino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object producao_numero_os: TEdit
      Left = 80
      Top = 21
      Width = 70
      Height = 19
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object producao_numero: TEdit
      Left = 6
      Top = 21
      Width = 70
      Height = 19
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object producao_data_os: TEdit
      Left = 154
      Top = 21
      Width = 75
      Height = 19
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object producao_codigo_produto: TEdit
      Left = 232
      Top = 21
      Width = 84
      Height = 19
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object producao_descricao_produto: TEdit
      Left = 320
      Top = 21
      Width = 285
      Height = 19
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object producao_data_inicio: TEdit
      Left = 609
      Top = 21
      Width = 74
      Height = 19
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object producao_status: TEdit
      Left = 763
      Top = 21
      Width = 77
      Height = 19
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
    end
    object producao_data_final: TEdit
      Left = 686
      Top = 21
      Width = 74
      Height = 19
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 4
    Top = 56
    Width = 845
    Height = 501
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 6
      Top = 3
      Width = 832
      Height = 422
      Caption = '   Estrutura   '
      TabOrder = 0
      object Label24: TLabel
        Left = 6
        Top = 15
        Width = 45
        Height = 13
        Caption = 'Legenda:'
      end
      object Label28: TLabel
        Left = 54
        Top = 15
        Width = 78
        Height = 13
        Caption = '  ET - Etapa  '
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label29: TLabel
        Left = 144
        Top = 15
        Width = 98
        Height = 13
        Caption = '  PR - Processo  '
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label33: TLabel
        Left = 136
        Top = 15
        Width = 4
        Height = 13
        Caption = '||'
      end
      object Label32: TLabel
        Left = 244
        Top = 15
        Width = 4
        Height = 13
        Caption = '||'
      end
      object Label30: TLabel
        Left = 252
        Top = 15
        Width = 123
        Height = 13
        Caption = '  SP - Sub-Processo  '
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label34: TLabel
        Left = 382
        Top = 15
        Width = 4
        Height = 13
        Caption = '||'
      end
      object Label31: TLabel
        Left = 392
        Top = 15
        Width = 115
        Height = 13
        Caption = '  IT - Item/Produto  '
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label26: TLabel
        Left = 7
        Top = 400
        Width = 248
        Height = 13
        Caption = 'Total de Sequ'#234'ncias de Estrutura para este Produto:'
      end
      object Qtde_Sequencia_Estrutura: TLabel
        Left = 263
        Top = 400
        Width = 8
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 680
        Top = 15
        Width = 44
        Height = 13
        Caption = 'Visualizar'
      end
      object Label10: TLabel
        Left = 532
        Top = 15
        Width = 30
        Height = 13
        Caption = 'Status'
      end
      object DBGrid_Custos: TDBGrid
        Left = 6
        Top = 34
        Width = 817
        Height = 362
        Ctl3D = False
        DataSource = ConexaoBD.DS_Producao_Estrutura
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid_CustosCellClick
        OnDrawColumnCell = DBGrid_CustosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'producao_estrutura_numero'
            Title.Caption = 'Nro.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producao_estrutura_sequencia'
            Title.Caption = 'Sequ'#234'ncia'
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
            FieldName = 'producao_estrutura_tipo'
            Title.Caption = 'Tipo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producao_estrutura_qtde'
            Title.Caption = 'Qtde.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producao_estrutura_medida'
            Title.Caption = 'Medida'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producao_estrutura_item_codigo'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producao_estrutura_descricao'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 204
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producao_estrutura_custo'
            Title.Caption = 'Custo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producao_estrutura_vlr_custo_unitario'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'producao_estrutura_codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'producao_estrutura_estoque'
            Title.Caption = 'Estoque'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producao_estrutura_status'
            Title.Caption = 'Status'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producao_estrutura_observacao'
            Title.Caption = 'Observa'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 105
            Visible = True
          end>
      end
      object Opcao_Visualizar: TComboBox
        Left = 728
        Top = 12
        Width = 95
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 1
        Text = '--- Todos ---'
        OnChange = Opcao_VisualizarChange
        Items.Strings = (
          '--- Todos ---'
          'Etapa'
          'Processo'
          'Sub-Processo'
          'Item')
      end
      object Opcao_Status: TComboBox
        Left = 566
        Top = 12
        Width = 87
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 2
        Text = '--- Todos ---'
        OnChange = Opcao_StatusChange
        Items.Strings = (
          '--- Todos ---'
          'Aguardando'
          'Produzindo'
          'Parado'
          'Finalizado')
      end
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 427
      Width = 832
      Height = 66
      Caption = '   Itens Selecionados   '
      TabOrder = 1
      object Label8: TLabel
        Left = 6
        Top = 13
        Width = 653
        Height = 26
        Caption = 
          'Caso deseje selecionar v'#225'rias Linhas da Estrutura para gerar a'#231#245 +
          'es, segure a tecla "CTRL" e clique nas linhas desejadas, ap'#243's a ' +
          'sele'#231#227'o clique na a'#231#227'o desejada.'
        WordWrap = True
      end
      object Label9: TLabel
        Left = 453
        Top = 46
        Width = 257
        Height = 13
        Caption = 'Escolha a A'#231#227'o Desejada para os Itens Selecionados:'
        WordWrap = True
      end
      object Label11: TLabel
        Left = 5
        Top = 46
        Width = 163
        Height = 13
        Caption = 'Adicionar a Observa'#231#227'o nos Itens:'
      end
      object Linhas_Selecionadas: TMemo
        Left = 662
        Top = 12
        Width = 163
        Height = 30
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Acao_Producao: TComboBox
        Left = 713
        Top = 43
        Width = 111
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 1
        Text = 'Aguardando'
        OnChange = Acao_ProducaoChange
        Items.Strings = (
          'Aguardando'
          'Produzindo'
          'Parado'
          'Finalizado'
          'Gerar Requisi'#231#227'o')
      end
      object Acao_Observacao: TEdit
        Left = 171
        Top = 43
        Width = 274
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 255
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
    end
  end
end
