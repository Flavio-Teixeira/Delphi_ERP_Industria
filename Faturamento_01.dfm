object Faturamento01: TFaturamento01
  Left = 291
  Top = 180
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pedido - Fila de Faturamento'
  ClientHeight = 542
  ClientWidth = 763
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
    Top = 497
    Width = 753
    Height = 41
    TabOrder = 0
    object BT_Sair: TBitBtn
      Left = 670
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair'
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
    object Cliente_Codigo: TEdit
      Left = 52
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
    end
    object Cliente_Codigo_Tipo: TEdit
      Left = 12
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object DBG_FB_Cliente_Observacao: TDBMemo
      Left = 20
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_cliente_observacoes'
      DataSource = ConexaoBD.DS_FB_Clientes
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Informacao_Cliente_Existe: TEdit
      Left = 4
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object Nro_Transportadora: TEdit
      Left = 28
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
    object Nro_Pgto_Frete: TEdit
      Left = 36
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
    end
    object BT_Excluir: TBitBtn
      Left = 339
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 7
      OnClick = BT_ExcluirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
    end
    object Codigo_Transportadora: TEdit
      Left = 60
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 8
      Visible = False
    end
    object ETP_Numero_Nota: TEdit
      Left = 44
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 9
      Visible = False
    end
    object ETP_Data_Emissao_Nota: TEdit
      Left = 36
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 10
      Visible = False
    end
    object ETP_Resultado: TEdit
      Left = 28
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 11
      Visible = False
    end
    object Pedido_Data: TEdit
      Left = 68
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 12
      Visible = False
    end
    object Nro_Natureza_Operacao: TEdit
      Left = 44
      Top = 1
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 13
      Visible = False
    end
    object Envia_Faturamento: TEdit
      Left = 60
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 14
      Visible = False
    end
    object Status_Pedido: TEdit
      Left = 68
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 15
      Visible = False
    end
    object Nro_Pedido_Faturado: TEdit
      Left = 76
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 16
      Visible = False
    end
    object Sequencia_Pedidos: TEdit
      Left = 84
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 17
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 3
    Width = 753
    Height = 490
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 737
      Height = 478
      Caption = '  Dados do Cliente  '
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 77
        Width = 722
        Height = 393
        Caption = '  Rela'#231#227'o de Produtos  '
        TabOrder = 1
        object Panel2: TPanel
          Left = 8
          Top = 235
          Width = 708
          Height = 151
          BevelOuter = bvLowered
          TabOrder = 1
          object Label4: TLabel
            Left = 526
            Top = 6
            Width = 96
            Height = 13
            Caption = 'Previs'#227'o de Entrega'
          end
          object GroupBox7: TGroupBox
            Left = 6
            Top = 2
            Width = 506
            Height = 143
            Caption = '  Dados para Emis'#227'o de Pedido  '
            TabOrder = 0
            object Label46: TLabel
              Left = 10
              Top = 31
              Width = 63
              Height = 13
              Caption = 'Desconto (%)'
            end
            object Label47: TLabel
              Left = 135
              Top = 13
              Width = 78
              Height = 13
              Caption = 'Cond. Pgto (DD)'
            end
            object Label49: TLabel
              Left = 232
              Top = 15
              Width = 72
              Height = 13
              Caption = 'Transportadora'
            end
            object Label50: TLabel
              Left = 8
              Top = 61
              Width = 91
              Height = 13
              Caption = 'Tipo de Solicita'#231#227'o'
            end
            object Label9: TLabel
              Left = 8
              Top = 79
              Width = 181
              Height = 13
              Caption = 'Obs. Nota Fiscal ou Ordem de Servi'#231'o'
            end
            object Label18: TLabel
              Left = 262
              Top = 77
              Width = 57
              Height = 13
              Caption = 'Obs. Cliente'
            end
            object Label21: TLabel
              Left = 230
              Top = 61
              Width = 158
              Height = 13
              Caption = 'Nro. Ordem de Compra do Cliente'
            end
            object Cliente_Desconto: TEdit
              Left = 77
              Top = 28
              Width = 45
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 7
              ParentCtl3D = False
              TabOrder = 0
              OnExit = Cliente_DescontoExit
              OnKeyPress = Cliente_DescontoKeyPress
            end
            object Cliente_Condicao_Pgto_1: TEdit
              Left = 135
              Top = 28
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 1
              OnKeyPress = Cliente_Condicao_Pgto_1KeyPress
            end
            object Cliente_Condicao_Pgto_2: TEdit
              Left = 158
              Top = 28
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 2
              OnKeyPress = Cliente_Condicao_Pgto_2KeyPress
            end
            object Cliente_Condicao_Pgto_3: TEdit
              Left = 182
              Top = 28
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 3
              OnKeyPress = Cliente_Condicao_Pgto_3KeyPress
            end
            object Cliente_Tipo_Transporte: TComboBox
              Left = 8
              Top = 79
              Width = 8
              Height = 19
              BevelInner = bvNone
              BevelKind = bkSoft
              Style = csOwnerDrawFixed
              Ctl3D = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 5
              Text = 'Rodovi'#225'rio'
              Visible = False
              OnKeyPress = Cliente_Tipo_TransporteKeyPress
              Items.Strings = (
                'Rodovi'#225'rio'
                'A'#233'reo'
                'Mar'#237'timo'
                'Ferrovi'#225'rio')
            end
            object Cliente_Transportadora: TComboBox
              Left = 232
              Top = 29
              Width = 266
              Height = 19
              BevelInner = bvNone
              BevelKind = bkSoft
              Style = csOwnerDrawFixed
              Ctl3D = False
              Enabled = False
              ItemHeight = 13
              ParentCtl3D = False
              TabOrder = 9
              OnKeyPress = Cliente_TransportadoraKeyPress
            end
            object Cliente_Tipo_Faturamento: TComboBox
              Left = 103
              Top = 58
              Width = 121
              Height = 19
              BevelInner = bvNone
              BevelKind = bkSoft
              Style = csOwnerDrawFixed
              Ctl3D = False
              Enabled = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 8
              Text = 'Nota Fiscal'
              OnKeyPress = Cliente_Tipo_FaturamentoKeyPress
              Items.Strings = (
                'Nota Fiscal'
                'Or'#231'amento')
            end
            object Cliente_Emite_Lote: TComboBox
              Left = 42
              Top = 79
              Width = 8
              Height = 19
              BevelInner = bvNone
              BevelKind = bkSoft
              Style = csOwnerDrawFixed
              Ctl3D = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 10
              Text = 'N'#227'o'
              Visible = False
              OnKeyPress = Cliente_Emite_LoteKeyPress
              Items.Strings = (
                'N'#227'o'
                'Sim')
            end
            object Observacao_Nota: TMemo
              Left = 8
              Top = 93
              Width = 250
              Height = 44
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 12
              WantReturns = False
            end
            object Cliente_Pgto_Frete: TComboBox
              Left = 19
              Top = 79
              Width = 8
              Height = 19
              BevelInner = bvNone
              BevelKind = bkSoft
              Style = csOwnerDrawFixed
              Ctl3D = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 6
              Text = 'Cliente'
              Visible = False
              OnKeyPress = Cliente_Pgto_FreteKeyPress
              Items.Strings = (
                'Cliente'
                'Ibrasmak')
            end
            object Natureza_Operacao: TComboBox
              Left = 29
              Top = 79
              Width = 8
              Height = 19
              BevelInner = bvNone
              BevelKind = bkSoft
              Style = csOwnerDrawFixed
              Ctl3D = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 7
              Text = 'Vendas'
              Visible = False
              OnKeyPress = Natureza_OperacaoKeyPress
              Items.Strings = (
                'Vendas'
                'Remessa'
                'Outras Sa'#237'das'
                'Consigna'#231#227'o'
                'Devolu'#231#227'o')
            end
            object Cliente_Observacao: TMemo
              Left = 262
              Top = 92
              Width = 236
              Height = 44
              Ctl3D = False
              ParentCtl3D = False
              ScrollBars = ssVertical
              TabOrder = 13
            end
            object Cliente_Condicao_Pgto_4: TEdit
              Left = 206
              Top = 28
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 4
              OnKeyPress = Cliente_Condicao_Pgto_3KeyPress
            end
            object Cliente_Ordem_Compra: TEdit
              Left = 393
              Top = 58
              Width = 107
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 20
              ParentCtl3D = False
              TabOrder = 11
              OnExit = Cliente_DescontoExit
              OnKeyPress = Cliente_DescontoKeyPress
            end
          end
          object Data_Entrega: TMaskEdit
            Left = 625
            Top = 3
            Width = 65
            Height = 19
            Ctl3D = False
            Enabled = False
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 1
            Text = '  /  /    '
            OnExit = Data_EntregaExit
            OnKeyPress = Data_EntregaKeyPress
          end
          object GroupBox3: TGroupBox
            Left = 517
            Top = 22
            Width = 185
            Height = 123
            Caption = '  Totais  '
            TabOrder = 2
            object Label5: TLabel
              Left = 5
              Top = 14
              Width = 87
              Height = 13
              Caption = 'Vlr. Desconto (R$)'
            end
            object Label6: TLabel
              Left = 27
              Top = 100
              Width = 65
              Height = 13
              Caption = 'Vlr. Total (R$)'
            end
            object Label7: TLabel
              Left = 18
              Top = 34
              Width = 74
              Height = 13
              Caption = 'Vlr. Pedido (R$)'
            end
            object Label8: TLabel
              Left = 2
              Top = 45
              Width = 180
              Height = 13
              Caption = '------------------------------------------------------------'
            end
            object Label10: TLabel
              Left = 27
              Top = 57
              Width = 65
              Height = 13
              Caption = 'Vlr. Frete (R$)'
            end
            object Label11: TLabel
              Left = 2
              Top = 68
              Width = 180
              Height = 13
              Caption = '------------------------------------------------------------'
            end
            object Label14: TLabel
              Left = 38
              Top = 80
              Width = 54
              Height = 13
              Caption = 'Vlr. IPI (R$)'
            end
            object Valor_Desconto: TEdit
              Left = 96
              Top = 11
              Width = 82
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 0
            end
            object Valor_Total: TEdit
              Left = 96
              Top = 97
              Width = 82
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 4
            end
            object Valor_Pedido: TEdit
              Left = 96
              Top = 31
              Width = 82
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 1
            end
            object Valor_Frete: TEdit
              Left = 96
              Top = 54
              Width = 82
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 2
              OnExit = Valor_FreteExit
              OnKeyPress = Valor_FreteKeyPress
            end
            object Valor_IPI: TEdit
              Left = 96
              Top = 77
              Width = 82
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 3
            end
          end
        end
        object SGD_Produtos: TStringGrid
          Left = 8
          Top = 14
          Width = 708
          Height = 217
          ColCount = 8
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
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 15
        Width = 722
        Height = 62
        Caption = '  Nome / Endere'#231'o  '
        TabOrder = 0
        object Label13: TLabel
          Left = 8
          Top = 45
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
          Visible = False
        end
        object Label15: TLabel
          Left = 357
          Top = 45
          Width = 27
          Height = 13
          Caption = 'Bairro'
          Visible = False
        end
        object Label16: TLabel
          Left = 460
          Top = 45
          Width = 33
          Height = 13
          Caption = 'Cidade'
          Visible = False
        end
        object Label19: TLabel
          Left = 349
          Top = 11
          Width = 33
          Height = 13
          Caption = 'Estado'
          Visible = False
        end
        object Label17: TLabel
          Left = 398
          Top = 11
          Width = 21
          Height = 13
          Caption = 'CEP'
          Visible = False
        end
        object Label20: TLabel
          Left = 461
          Top = 11
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
          Visible = False
        end
        object Label3: TLabel
          Left = 83
          Top = 11
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label28: TLabel
          Left = 8
          Top = 80
          Width = 37
          Height = 13
          Caption = 'Contato'
          Visible = False
        end
        object Label35: TLabel
          Left = 138
          Top = 98
          Width = 50
          Height = 13
          Caption = 'Telefones:'
          Visible = False
        end
        object Label30: TLabel
          Left = 191
          Top = 80
          Width = 46
          Height = 13
          Caption = 'Comercial'
          Visible = False
        end
        object Label32: TLabel
          Left = 265
          Top = 80
          Width = 32
          Height = 13
          Caption = 'Celular'
          Visible = False
        end
        object Label33: TLabel
          Left = 339
          Top = 80
          Width = 17
          Height = 13
          Caption = 'Fax'
          Visible = False
        end
        object Label12: TLabel
          Left = 8
          Top = 11
          Width = 68
          Height = 13
          Caption = 'Nro. Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 422
          Top = 80
          Width = 29
          Height = 13
          Caption = 'E-Mail'
          Visible = False
        end
        object Label1: TLabel
          Left = 576
          Top = 80
          Width = 18
          Height = 13
          Caption = 'Site'
          Visible = False
        end
        object Cliente_Suframa: TLabel
          Left = 208
          Top = 11
          Width = 3
          Height = 13
        end
        object Cliente_Endereco: TEdit
          Left = 8
          Top = 60
          Width = 345
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 4
          Visible = False
        end
        object Cliente_Bairro: TEdit
          Left = 357
          Top = 60
          Width = 100
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 5
          Visible = False
        end
        object Cliente_Cidade: TEdit
          Left = 460
          Top = 60
          Width = 100
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 6
          Visible = False
        end
        object Cliente_Estado: TComboBox
          Left = 349
          Top = 26
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
          Visible = False
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
          Top = 26
          Width = 57
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 2
          Text = '     -   '
          Visible = False
        end
        object Cliente_Pais: TComboBox
          Left = 461
          Top = 26
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
          Visible = False
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
          Left = 83
          Top = 26
          Width = 633
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
        end
        object Cliente_Contato: TEdit
          Left = 8
          Top = 95
          Width = 125
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 7
          Visible = False
        end
        object Cliente_Fone_Comercial: TEdit
          Left = 191
          Top = 95
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 8
          Visible = False
        end
        object Cliente_Fone_Celular: TEdit
          Left = 265
          Top = 95
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 9
          Visible = False
        end
        object Cliente_Fone_Fax: TEdit
          Left = 339
          Top = 95
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 10
          Visible = False
        end
        object BT_Alterar: TBitBtn
          Left = 565
          Top = 60
          Width = 150
          Height = 24
          Caption = 'Alterar Dados Cadastrais'
          TabOrder = 11
          Visible = False
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
        object Nro_Pedido: TEdit
          Left = 8
          Top = 26
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 80
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 12
        end
        object Cliente_Email: TEdit
          Left = 422
          Top = 95
          Width = 150
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 13
          Visible = False
        end
        object Cliente_Site: TEdit
          Left = 576
          Top = 95
          Width = 141
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 14
          Visible = False
        end
      end
    end
  end
end
