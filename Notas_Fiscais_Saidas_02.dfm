object NotasFiscaisSaidas02: TNotasFiscaisSaidas02
  Left = 448
  Top = 137
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Notas Fiscais - SA'#205'DAS - IBRASMAK - PROCESSO DE LIBERA'#199#195'O'
  ClientHeight = 543
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
    Left = 5
    Top = 497
    Width = 753
    Height = 41
    TabOrder = 0
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
    object BT_Imprimir: TBitBtn
      Left = 312
      Top = 8
      Width = 129
      Height = 25
      Caption = 'Imprimir Nota Fiscal'
      TabOrder = 0
      OnClick = BT_ImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object Pedido_Data_Inclusao: TMaskEdit
      Left = 8
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 2
      Text = '  /  /    '
      Visible = False
    end
    object DBG_NF_FB_Faturados_Produto_Descricao_Detalhada: TDBMemo
      Left = 16
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'faturado_produto_descricao_detalhada'
      DataSource = ConexaoBD.DS_NF_FB_Faturados_Produtos
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Empresa: TEdit
      Left = 24
      Top = 6
      Width = 8
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
      TabOrder = 4
      Visible = False
    end
    object Imprimir_Tela: TCheckBox
      Left = 9
      Top = 4
      Width = 163
      Height = 17
      Caption = 'N'#227'o imprimir, aparecer na tela'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = Imprimir_TelaClick
    end
    object DBG_Observacao_Nota: TDBMemo
      Left = 198
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_natureza_operacao_observacao_nota'
      DataSource = ConexaoBD.DS_Natureza_Operacao
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
    end
    object Registra_OS: TCheckBox
      Left = 9
      Top = 21
      Width = 264
      Height = 17
      Caption = 'Apenas registrar o Or'#231'amento ao Inves de Imprimir'
      TabOrder = 7
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
        Top = 136
        Width = 722
        Height = 335
        Caption = '  Rela'#231#227'o de Produtos  '
        TabOrder = 1
        object Panel2: TPanel
          Left = 8
          Top = 114
          Width = 708
          Height = 214
          BevelOuter = bvLowered
          TabOrder = 1
          object Label4: TLabel
            Left = 524
            Top = 5
            Width = 96
            Height = 13
            Caption = 'Previs'#227'o de Entrega'
          end
          object Label24: TLabel
            Left = 6
            Top = 197
            Width = 23
            Height = 13
            Caption = 'Qtde'
          end
          object Label25: TLabel
            Left = 66
            Top = 197
            Width = 38
            Height = 13
            Caption = 'Esp'#233'cie'
          end
          object Label26: TLabel
            Left = 275
            Top = 197
            Width = 30
            Height = 13
            Caption = 'Marca'
          end
          object Label27: TLabel
            Left = 476
            Top = 197
            Width = 52
            Height = 13
            Caption = 'Peso Bruto'
          end
          object Label36: TLabel
            Left = 587
            Top = 197
            Width = 63
            Height = 13
            Caption = 'Peso L'#237'quido'
          end
          object Data_Entrega: TMaskEdit
            Left = 625
            Top = 2
            Width = 65
            Height = 19
            Ctl3D = False
            Enabled = False
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 0
            Text = '  /  /    '
          end
          object GroupBox3: TGroupBox
            Left = 517
            Top = 68
            Width = 185
            Height = 122
            Caption = '  Totais  '
            TabOrder = 9
            object Label5: TLabel
              Left = 5
              Top = 11
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
              Top = 31
              Width = 74
              Height = 13
              Caption = 'Vlr. Pedido (R$)'
            end
            object Label8: TLabel
              Left = 2
              Top = 42
              Width = 180
              Height = 13
              Caption = '------------------------------------------------------------'
            end
            object Label10: TLabel
              Left = 27
              Top = 55
              Width = 65
              Height = 13
              Caption = 'Vlr. Frete (R$)'
            end
            object Label11: TLabel
              Left = 2
              Top = 66
              Width = 180
              Height = 13
              Caption = '------------------------------------------------------------'
            end
            object Label18: TLabel
              Left = 38
              Top = 80
              Width = 54
              Height = 13
              Caption = 'Vlr. IPI (R$)'
            end
            object Valor_Desconto: TEdit
              Left = 96
              Top = 8
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
              Top = 28
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
              Top = 52
              Width = 82
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 2
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
          object Qtde_Volume: TEdit
            Left = 32
            Top = 194
            Width = 26
            Height = 19
            Ctl3D = False
            MaxLength = 3
            ParentCtl3D = False
            TabOrder = 4
            Text = '1'
            OnKeyPress = Qtde_VolumeKeyPress
          end
          object Especie: TEdit
            Left = 107
            Top = 194
            Width = 160
            Height = 19
            Ctl3D = False
            MaxLength = 40
            ParentCtl3D = False
            TabOrder = 5
            Text = 'VOLUME'
            OnKeyPress = EspecieKeyPress
          end
          object Marca: TEdit
            Left = 308
            Top = 194
            Width = 160
            Height = 19
            Ctl3D = False
            MaxLength = 40
            ParentCtl3D = False
            TabOrder = 6
            OnKeyPress = MarcaKeyPress
          end
          object Peso_Bruto: TEdit
            Left = 531
            Top = 194
            Width = 48
            Height = 19
            Ctl3D = False
            MaxLength = 7
            ParentCtl3D = False
            TabOrder = 7
            OnKeyPress = Peso_BrutoKeyPress
          end
          object Peso_Liquido: TEdit
            Left = 653
            Top = 194
            Width = 48
            Height = 19
            Ctl3D = False
            MaxLength = 7
            ParentCtl3D = False
            TabOrder = 8
            OnKeyPress = Peso_LiquidoKeyPress
          end
          object Nota_Consumo: TCheckBox
            Left = 518
            Top = 36
            Width = 171
            Height = 17
            Caption = 'Nota Fiscal para Consumo'
            TabOrder = 2
          end
          object Zera_Base_ICMS: TCheckBox
            Left = 518
            Top = 51
            Width = 171
            Height = 17
            Caption = 'Zerar Base de C'#225'lculo do ICMS'
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
          object Nota_Revenda: TCheckBox
            Left = 640
            Top = 21
            Width = 66
            Height = 17
            Caption = 'Revenda'
            TabOrder = 1
          end
          object Nota_Dados_Complementares: TPageControl
            Left = 2
            Top = 1
            Width = 513
            Height = 188
            ActivePage = TabSheet1
            TabOrder = 10
            object TabSheet1: TTabSheet
              Caption = 'Dados Complementares'
              object GroupBox7: TGroupBox
                Left = 0
                Top = 0
                Width = 506
                Height = 160
                Caption = '  Dados para Emis'#227'o da Nota Fiscal  '
                TabOrder = 0
                object Label49: TLabel
                  Left = 44
                  Top = 72
                  Width = 72
                  Height = 13
                  Caption = 'Transportadora'
                end
                object Label50: TLabel
                  Left = 177
                  Top = 39
                  Width = 91
                  Height = 13
                  Caption = 'Tipo de Solicita'#231#227'o'
                end
                object Label1: TLabel
                  Left = 404
                  Top = 121
                  Width = 88
                  Height = 13
                  Caption = 'Nro. OC do Cliente'
                end
                object Label39: TLabel
                  Left = 4
                  Top = 95
                  Width = 112
                  Height = 13
                  Caption = 'Tens'#227'o de Alimenta'#231#227'o'
                end
                object Label21: TLabel
                  Left = 396
                  Top = 39
                  Width = 63
                  Height = 13
                  Caption = 'Desconto (%)'
                end
                object Label51: TLabel
                  Left = 125
                  Top = 139
                  Width = 51
                  Height = 13
                  Caption = 'Transporte'
                end
                object Label53: TLabel
                  Left = 262
                  Top = 139
                  Width = 64
                  Height = 13
                  Caption = 'Pgto do Frete'
                end
                object Label52: TLabel
                  Left = 4
                  Top = 17
                  Width = 108
                  Height = 13
                  Caption = 'Natureza de Opera'#231#227'o'
                end
                object Label37: TLabel
                  Left = 232
                  Top = 17
                  Width = 95
                  Height = 13
                  Caption = 'Desc.Nat.Opera'#231#227'o'
                  Visible = False
                end
                object Label38: TLabel
                  Left = 4
                  Top = 39
                  Width = 43
                  Height = 13
                  Caption = 'CFOP (1)'
                end
                object Label54: TLabel
                  Left = 89
                  Top = 39
                  Width = 43
                  Height = 13
                  Caption = 'CFOP (2)'
                  Visible = False
                end
                object Label55: TLabel
                  Left = 417
                  Top = 72
                  Width = 46
                  Height = 13
                  Caption = 'Aliq.ICMS'
                end
                object Label56: TLabel
                  Left = 300
                  Top = 95
                  Width = 121
                  Height = 13
                  Caption = 'Base de C'#225'lculo do ICMS'
                end
                object Label57: TLabel
                  Left = 4
                  Top = 139
                  Width = 50
                  Height = 13
                  Caption = 'Emite Lote'
                end
                object Label58: TLabel
                  Left = 34
                  Top = 117
                  Width = 82
                  Height = 13
                  Caption = 'OS Solicitada por'
                end
                object Cliente_Tipo_Transporte: TComboBox
                  Left = 8
                  Top = 15
                  Width = 8
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentCtl3D = False
                  TabOrder = 14
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
                  Left = 119
                  Top = 69
                  Width = 274
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ParentCtl3D = False
                  TabOrder = 6
                  OnKeyPress = Cliente_TransportadoraKeyPress
                end
                object Cliente_Tipo_Faturamento: TComboBox
                  Left = 272
                  Top = 36
                  Width = 121
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentCtl3D = False
                  TabOrder = 4
                  Text = 'Nota Fiscal'
                  OnKeyPress = Cliente_Tipo_FaturamentoKeyPress
                  Items.Strings = (
                    'Nota Fiscal'
                    'Or'#231'amento')
                end
                object Cliente_Emite_Lote: TComboBox
                  Left = 42
                  Top = 15
                  Width = 8
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentCtl3D = False
                  TabOrder = 18
                  Text = 'N'#227'o'
                  Visible = False
                  OnKeyPress = Cliente_Emite_LoteKeyPress
                  Items.Strings = (
                    'N'#227'o'
                    'Sim')
                end
                object Cliente_Pgto_Frete: TComboBox
                  Left = 19
                  Top = 15
                  Width = 8
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentCtl3D = False
                  TabOrder = 16
                  Text = 'Cliente'
                  Visible = False
                  OnKeyPress = Cliente_Pgto_FreteKeyPress
                  Items.Strings = (
                    'Cliente'
                    'Ibrasmak')
                end
                object Natureza_Operacao: TComboBox
                  Left = 29
                  Top = 15
                  Width = 8
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentCtl3D = False
                  TabOrder = 17
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
                object Cliente_Ordem_Compra: TEdit
                  Left = 404
                  Top = 136
                  Width = 98
                  Height = 19
                  Ctl3D = False
                  Enabled = False
                  MaxLength = 20
                  ParentCtl3D = False
                  TabOrder = 15
                  OnKeyPress = Cliente_Ordem_CompraKeyPress
                end
                object Cliente_Alimentacao: TEdit
                  Left = 119
                  Top = 92
                  Width = 153
                  Height = 19
                  Ctl3D = False
                  Enabled = False
                  MaxLength = 100
                  ParentCtl3D = False
                  TabOrder = 8
                  OnKeyPress = Cliente_AlimentacaoKeyPress
                end
                object Cliente_Desconto: TEdit
                  Left = 463
                  Top = 36
                  Width = 39
                  Height = 19
                  Ctl3D = False
                  MaxLength = 7
                  ParentCtl3D = False
                  TabOrder = 5
                  OnExit = Cliente_DescontoExit
                  OnKeyPress = Cliente_DescontoKeyPress
                end
                object ComboBox1: TComboBox
                  Left = 179
                  Top = 136
                  Width = 77
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentCtl3D = False
                  TabOrder = 12
                  Text = 'Rodovi'#225'rio'
                  OnKeyPress = ComboBox1KeyPress
                  Items.Strings = (
                    'Rodovi'#225'rio'
                    'A'#233'reo'
                    'Mar'#237'timo'
                    'Ferrovi'#225'rio')
                end
                object ComboBox2: TComboBox
                  Left = 330
                  Top = 136
                  Width = 69
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentCtl3D = False
                  TabOrder = 13
                  Text = 'Cliente'
                  OnKeyPress = ComboBox2KeyPress
                  Items.Strings = (
                    'Cliente'
                    'Monibras')
                end
                object Opcao_Natureza_Operacao: TComboBox
                  Left = 116
                  Top = 14
                  Width = 387
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ParentCtl3D = False
                  TabOrder = 0
                  OnChange = Opcao_Natureza_OperacaoChange
                  OnKeyPress = Opcao_Natureza_OperacaoKeyPress
                end
                object Cliente_Natureza_Operacao: TEdit
                  Left = 331
                  Top = 14
                  Width = 171
                  Height = 19
                  Ctl3D = False
                  MaxLength = 78
                  ParentCtl3D = False
                  TabOrder = 1
                  Visible = False
                  OnKeyPress = Cliente_Natureza_OperacaoKeyPress
                end
                object Cliente_CFOP: TEdit
                  Left = 50
                  Top = 36
                  Width = 65
                  Height = 19
                  Ctl3D = False
                  MaxLength = 11
                  ParentCtl3D = False
                  TabOrder = 2
                  Text = '5.101'
                  OnKeyPress = Cliente_CFOPKeyPress
                end
                object Cliente_CFOP_2: TEdit
                  Left = 136
                  Top = 36
                  Width = 36
                  Height = 19
                  Ctl3D = False
                  MaxLength = 5
                  ParentCtl3D = False
                  TabOrder = 3
                  Text = '5.101'
                  Visible = False
                  OnKeyPress = Cliente_CFOP_2KeyPress
                end
                object Cliente_Aliquota_ICMS: TEdit
                  Left = 466
                  Top = 69
                  Width = 36
                  Height = 19
                  Ctl3D = False
                  MaxLength = 5
                  ParentCtl3D = False
                  TabOrder = 7
                  Text = '0'
                  OnKeyPress = Cliente_Aliquota_ICMSKeyPress
                end
                object Cliente_Base_Reduzida: TEdit
                  Left = 424
                  Top = 92
                  Width = 78
                  Height = 19
                  Ctl3D = False
                  MaxLength = 12
                  ParentCtl3D = False
                  TabOrder = 9
                  Text = '0'
                  OnKeyPress = Cliente_Base_ReduzidaKeyPress
                end
                object ComboBox4: TComboBox
                  Left = 57
                  Top = 136
                  Width = 50
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentCtl3D = False
                  TabOrder = 11
                  Text = 'N'#227'o'
                  OnKeyPress = ComboBox4KeyPress
                  Items.Strings = (
                    'N'#227'o'
                    'Sim')
                end
                object Cliente_Solicitado: TEdit
                  Left = 119
                  Top = 114
                  Width = 274
                  Height = 19
                  Ctl3D = False
                  Enabled = False
                  MaxLength = 100
                  ParentCtl3D = False
                  TabOrder = 10
                  OnKeyPress = Cliente_SolicitadoKeyPress
                end
              end
            end
            object TabSheet2: TTabSheet
              Caption = 'Condi'#231#245'es de Pagamento'
              ImageIndex = 1
              object Label23: TLabel
                Left = 2
                Top = 3
                Width = 87
                Height = 13
                Caption = 'Financiamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label2: TLabel
                Left = 1
                Top = 20
                Width = 143
                Height = 13
                Caption = 'Condi'#231#227'o de Pagamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Financiamento_BNDS: TCheckBox
                Left = 96
                Top = 2
                Width = 54
                Height = 17
                Caption = 'BNDS'
                Enabled = False
                TabOrder = 0
              end
              object Financiamento_Leasing: TCheckBox
                Left = 224
                Top = 2
                Width = 62
                Height = 17
                Caption = 'Leasing'
                Enabled = False
                TabOrder = 2
              end
              object Financiamento_Monibras: TCheckBox
                Left = 296
                Top = 2
                Width = 67
                Height = 17
                Caption = 'Monibras'
                Enabled = False
                TabOrder = 3
              end
              object Financiamento_Proger: TCheckBox
                Left = 159
                Top = 2
                Width = 55
                Height = 17
                Caption = 'Proger'
                Enabled = False
                TabOrder = 1
              end
              object Pagamento_Vista: TRadioButton
                Left = 151
                Top = 20
                Width = 58
                Height = 17
                Caption = #192' Vista'
                Checked = True
                Enabled = False
                TabOrder = 4
                TabStop = True
              end
              object Pagamento_Parcelado: TRadioButton
                Left = 213
                Top = 20
                Width = 73
                Height = 17
                Caption = 'Parcelado'
                Enabled = False
                TabOrder = 5
              end
              object Pagamento_Combinar: TRadioButton
                Left = 293
                Top = 20
                Width = 78
                Height = 17
                Caption = #192' Combinar'
                Enabled = False
                TabOrder = 6
              end
              object GroupBox5: TGroupBox
                Left = 0
                Top = 35
                Width = 309
                Height = 124
                Caption = '   Forma de Parcelamento  '
                TabOrder = 7
                object Label9: TLabel
                  Left = 6
                  Top = 19
                  Width = 41
                  Height = 13
                  Caption = 'Parcelas'
                end
                object Label22: TLabel
                  Left = 6
                  Top = 55
                  Width = 154
                  Height = 13
                  Caption = 'Dia de Vencimento das Parcelas'
                end
                object Label40: TLabel
                  Left = 5
                  Top = 102
                  Width = 156
                  Height = 13
                  Caption = 'Intervalo de dias p/ Vencimentos'
                  Visible = False
                end
                object Label41: TLabel
                  Left = 199
                  Top = 8
                  Width = 96
                  Height = 26
                  Caption = 'Considerar parcelas a partir do:'
                  WordWrap = True
                end
                object Parcela_Nro: TEdit
                  Left = 52
                  Top = 16
                  Width = 26
                  Height = 19
                  Ctl3D = False
                  Enabled = False
                  MaxLength = 3
                  ParentCtl3D = False
                  TabOrder = 0
                  Text = '0'
                end
                object Parcela_Vencto: TEdit
                  Left = 164
                  Top = 52
                  Width = 26
                  Height = 19
                  Ctl3D = False
                  Enabled = False
                  MaxLength = 2
                  ParentCtl3D = False
                  TabOrder = 1
                  Text = '0'
                end
                object Parcela_Dias_Vencto: TEdit
                  Left = 164
                  Top = 99
                  Width = 26
                  Height = 19
                  Ctl3D = False
                  Enabled = False
                  MaxLength = 3
                  ParentCtl3D = False
                  TabOrder = 2
                  Text = '0'
                  Visible = False
                end
                object Parcela_Mes_Subsequente: TCheckBox
                  Left = 196
                  Top = 102
                  Width = 108
                  Height = 17
                  Caption = 'M'#234's Subsequente'
                  Enabled = False
                  TabOrder = 3
                  Visible = False
                end
                object Parcela_Pedido: TRadioButton
                  Left = 199
                  Top = 37
                  Width = 58
                  Height = 17
                  Caption = 'Pedido'
                  Checked = True
                  Enabled = False
                  TabOrder = 4
                  TabStop = True
                end
                object Parcela_Faturamento: TRadioButton
                  Left = 199
                  Top = 54
                  Width = 82
                  Height = 17
                  Caption = 'Faturamento'
                  Enabled = False
                  TabOrder = 5
                end
                object Parcela_Descricao: TEdit
                  Left = 84
                  Top = 16
                  Width = 106
                  Height = 19
                  Ctl3D = False
                  Enabled = False
                  MaxLength = 255
                  ParentCtl3D = False
                  TabOrder = 6
                end
              end
              object GroupBox6: TGroupBox
                Left = 311
                Top = 35
                Width = 194
                Height = 124
                Caption = '   Valor do Ato   '
                TabOrder = 8
                object Label42: TLabel
                  Left = 4
                  Top = 17
                  Width = 114
                  Height = 13
                  Caption = 'Porcentagem do Ato (%)'
                end
                object Label43: TLabel
                  Left = 10
                  Top = 57
                  Width = 108
                  Height = 13
                  Caption = 'ou     Valor do Ato (R$)'
                end
                object Label45: TLabel
                  Left = 14
                  Top = 102
                  Width = 104
                  Height = 13
                  Caption = 'Prazo p/ in'#237'cio do Ato'
                end
                object Parcela_Porcentagem_Ato: TEdit
                  Left = 122
                  Top = 14
                  Width = 26
                  Height = 19
                  Ctl3D = False
                  Enabled = False
                  MaxLength = 7
                  ParentCtl3D = False
                  TabOrder = 0
                  Text = '0'
                end
                object Parcela_Vlr_Ato: TEdit
                  Left = 122
                  Top = 54
                  Width = 68
                  Height = 19
                  Ctl3D = False
                  Enabled = False
                  MaxLength = 13
                  ParentCtl3D = False
                  TabOrder = 1
                  Text = '0'
                end
                object Parcela_Prazo_Inicio: TEdit
                  Left = 122
                  Top = 99
                  Width = 26
                  Height = 19
                  Ctl3D = False
                  Enabled = False
                  MaxLength = 3
                  ParentCtl3D = False
                  TabOrder = 2
                  Text = '0'
                end
              end
            end
            object TabSheet3: TTabSheet
              Caption = 'Obs. Nota / Cliente'
              ImageIndex = 2
              object Label46: TLabel
                Left = 6
                Top = 78
                Width = 184
                Height = 13
                Caption = 'Observa'#231#227'o Nota Fiscal ou Or'#231'amento'
              end
              object Label47: TLabel
                Left = 260
                Top = 4
                Width = 93
                Height = 13
                Caption = 'Observa'#231#227'o Cliente'
              end
              object Label59: TLabel
                Left = 6
                Top = 5
                Width = 144
                Height = 13
                Caption = 'Observa'#231#227'o para Faturamento'
              end
              object Observacao_Nota: TMemo
                Left = 6
                Top = 93
                Width = 250
                Height = 50
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 210
                ParentCtl3D = False
                ParentFont = False
                ScrollBars = ssVertical
                TabOrder = 1
                WantReturns = False
              end
              object Cliente_Observacao: TMemo
                Left = 260
                Top = 20
                Width = 236
                Height = 133
                Ctl3D = False
                ParentCtl3D = False
                ScrollBars = ssVertical
                TabOrder = 2
              end
              object Observacao_Corpo_Nota: TCheckBox
                Left = 6
                Top = 143
                Width = 216
                Height = 17
                Caption = 'Imprimir a Observa'#231#227'o no Corpo da Nota'
                Checked = True
                State = cbChecked
                TabOrder = 3
              end
              object Observacao_Faturamento: TMemo
                Left = 6
                Top = 20
                Width = 250
                Height = 50
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                ScrollBars = ssVertical
                TabOrder = 0
                WantReturns = False
              end
            end
            object TabSheet4: TTabSheet
              Caption = 'Obs. F'#225'brica'
              ImageIndex = 3
              object Label48: TLabel
                Left = 1
                Top = 4
                Width = 96
                Height = 13
                Caption = 'Observa'#231#227'o F'#225'brica'
              end
              object Observacao_Fabrica: TMemo
                Left = 1
                Top = 20
                Width = 501
                Height = 138
                Ctl3D = False
                Enabled = False
                ParentCtl3D = False
                ScrollBars = ssVertical
                TabOrder = 0
              end
            end
          end
          object Total_NF_IPI: TCheckBox
            Left = 518
            Top = 21
            Width = 102
            Height = 17
            Caption = 'Total da NF + IPI'
            TabOrder = 11
          end
        end
        object SGD_Produtos: TStringGrid
          Left = 8
          Top = 14
          Width = 708
          Height = 98
          ColCount = 11
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
          OnDblClick = SGD_ProdutosDblClick
          OnKeyPress = SGD_ProdutosKeyPress
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 15
        Width = 722
        Height = 122
        Caption = '  Nome / Endere'#231'o  '
        TabOrder = 0
        object Label13: TLabel
          Left = 8
          Top = 48
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label14: TLabel
          Left = 307
          Top = 48
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label15: TLabel
          Left = 411
          Top = 48
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label16: TLabel
          Left = 565
          Top = 48
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label19: TLabel
          Left = 502
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label17: TLabel
          Left = 551
          Top = 13
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label20: TLabel
          Left = 614
          Top = 13
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label3: TLabel
          Left = 93
          Top = 13
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
        object Label29: TLabel
          Left = 190
          Top = 82
          Width = 24
          Height = 13
          Caption = 'DDD'
        end
        object Label34: TLabel
          Left = 221
          Top = 82
          Width = 30
          Height = 13
          Caption = 'Ramal'
        end
        object Label30: TLabel
          Left = 265
          Top = 82
          Width = 46
          Height = 13
          Caption = 'Comercial'
        end
        object Label31: TLabel
          Left = 340
          Top = 82
          Width = 55
          Height = 13
          Caption = 'Residencial'
        end
        object Label32: TLabel
          Left = 415
          Top = 82
          Width = 32
          Height = 13
          Caption = 'Celular'
        end
        object Label33: TLabel
          Left = 489
          Top = 82
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label44: TLabel
          Left = 577
          Top = 82
          Width = 29
          Height = 13
          Caption = 'E-Mail'
        end
        object Label12: TLabel
          Left = 8
          Top = 13
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
        object Cliente_Endereco: TEdit
          Left = 8
          Top = 63
          Width = 295
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 4
        end
        object Cliente_Complemento: TEdit
          Left = 307
          Top = 63
          Width = 100
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 5
        end
        object Cliente_Bairro: TEdit
          Left = 411
          Top = 63
          Width = 150
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 6
        end
        object Cliente_Cidade: TEdit
          Left = 565
          Top = 63
          Width = 150
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 7
        end
        object Cliente_Estado: TComboBox
          Left = 502
          Top = 28
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
        object Cliente_Cep: TMaskEdit
          Left = 551
          Top = 28
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
        object Cliente_Pais: TComboBox
          Left = 614
          Top = 28
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
        object Cliente_Nome: TEdit
          Left = 93
          Top = 28
          Width = 403
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
        end
        object Cliente_Contato: TEdit
          Left = 8
          Top = 97
          Width = 125
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 8
        end
        object Cliente_DDD: TEdit
          Left = 190
          Top = 97
          Width = 25
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 3
          ParentCtl3D = False
          TabOrder = 9
        end
        object Cliente_Fone_Ramal: TEdit
          Left = 221
          Top = 97
          Width = 39
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 5
          ParentCtl3D = False
          TabOrder = 10
        end
        object Cliente_Fone_Comercial: TEdit
          Left = 265
          Top = 97
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 11
        end
        object Cliente_Fone_Residencial: TEdit
          Left = 340
          Top = 97
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 12
        end
        object Cliente_Fone_Celular: TEdit
          Left = 415
          Top = 97
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 13
        end
        object Cliente_Fone_Fax: TEdit
          Left = 489
          Top = 97
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 14
        end
        object Cliente_Email: TEdit
          Left = 577
          Top = 97
          Width = 137
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 15
        end
        object Nro_Pedido: TEdit
          Left = 8
          Top = 28
          Width = 80
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
          TabOrder = 16
        end
      end
      object Nro_Pedido_Vendas: TEdit
        Left = 189
        Top = 467
        Width = 8
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 2
        Visible = False
      end
    end
    object Nro_Natureza_Operacao: TEdit
      Left = 3
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
    end
    object Cliente_Endereco_Cobranca: TEdit
      Left = 11
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Cliente_Complemento_Cobranca: TEdit
      Left = 19
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Cliente_Bairro_Cobranca: TEdit
      Left = 27
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object Cliente_Cidade_Cobranca: TEdit
      Left = 35
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
    object Cliente_Estado_Cobranca: TEdit
      Left = 43
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
    end
    object Cliente_Cep_Cobranca: TEdit
      Left = 51
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 7
      Visible = False
    end
    object Cliente_Pais_Cobranca: TEdit
      Left = 59
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 8
      Visible = False
    end
    object Nro_Tipo_Tabela: TEdit
      Left = 78
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 9
      Visible = False
    end
    object Nro_Transportadora: TEdit
      Left = 86
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 10
      Visible = False
    end
    object Nro_Pgto_Frete: TEdit
      Left = 94
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 11
      Visible = False
    end
    object Cliente_Codigo: TEdit
      Left = 102
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 12
      Visible = False
    end
    object Cliente_Codigo_Tipo: TEdit
      Left = 110
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 13
      Visible = False
    end
    object Cliente_Tipo_Pessoa: TEdit
      Left = 118
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 14
      Visible = False
    end
    object Cliente_Inscricao_Estadual: TEdit
      Left = 126
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 15
      Visible = False
    end
    object Codigo_Transportadora: TEdit
      Left = 134
      Top = 469
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 16
      Visible = False
    end
    object ETP_Resultado: TEdit
      Left = 148
      Top = 470
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 17
      Visible = False
    end
    object ETP_Data_Emissao_Nota: TEdit
      Left = 156
      Top = 470
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 18
      Visible = False
    end
    object ETP_Numero_Nota: TEdit
      Left = 164
      Top = 470
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 19
      Visible = False
    end
    object Cliente_Vendedor: TEdit
      Left = 180
      Top = 470
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 20
      Visible = False
    end
    object Cliente_Banco: TEdit
      Left = 188
      Top = 470
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 21
      Visible = False
    end
    object Nro_Pedido_Faturado: TEdit
      Left = 214
      Top = 471
      Width = 8
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
      TabOrder = 22
      Visible = False
    end
    object Tipo_Nota_Emissao: TEdit
      Left = 222
      Top = 471
      Width = 8
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
      TabOrder = 23
      Visible = False
    end
  end
  object Cliente_Suframa: TEdit
    Left = 211
    Top = 474
    Width = 8
    Height = 19
    Ctl3D = False
    MaxLength = 100
    ParentCtl3D = False
    TabOrder = 2
    Visible = False
  end
  object Imprimir: TImpMat
    Linhas = 66
    Colunas = 142
    TipoImp = tiBobina
    ControleServico = False
    ArqDestino = 'LPT1'
    ImprimeLinhasFinais = True
    ImprimeEspDireita = False
    Acentuacao = acANSI
    Left = 53
    Top = 500
  end
end
