object Pedidos02: TPedidos02
  Left = 310
  Top = 122
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'SAC - PEDIDOS - ALTERA'#199#195'O/EXCLUS'#195'O'
  ClientHeight = 601
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 4
    Top = 541
    Width = 753
    Height = 56
    TabOrder = 0
    object BT_Alterar_Pedidos: TBitBtn
      Left = 327
      Top = 15
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 0
      OnClick = BT_Alterar_PedidosClick
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
      Top = 15
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
      Left = 407
      Top = 15
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
    object BT_Imprimir: TBitBtn
      Left = 216
      Top = 15
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 14
      OnClick = BT_ImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object BT_Faturamento: TBitBtn
      Left = 503
      Top = 15
      Width = 154
      Height = 25
      Caption = 'Enviar para Faturamento'
      TabOrder = 15
      OnClick = BT_FaturamentoClick
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777777700000007777777774F77777700000007777
        7777444F77777000000077777774444F777770000000700000444F44F7777000
        000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
        74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
        8777F07777774000000070FFFF00007777777000000070F88707077777777000
        000070FFFF007777777770000000700000077777777770000000777777777777
        777770000000}
    end
    object Envia_Faturamento: TEdit
      Left = 60
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 16
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
      TabOrder = 17
      Visible = False
    end
    object OPC_Fabrica: TRadioButton
      Left = 40
      Top = 1
      Width = 170
      Height = 17
      Caption = 'Imprimir OS para F'#225'brica'
      Checked = True
      TabOrder = 18
      TabStop = True
    end
    object OPC_Faturamento: TRadioButton
      Left = 40
      Top = 18
      Width = 170
      Height = 17
      Caption = 'Imprimir OS para Faturamento'
      TabOrder = 19
    end
    object OPC_Nao_Imprimir: TRadioButton
      Left = 40
      Top = 35
      Width = 170
      Height = 17
      Caption = 'N'#227'o Imprimir'
      TabOrder = 20
    end
    object DBG_NF_FB_Pedido_Produto_Descricao_Detalhada: TDBMemo
      Left = 20
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'pedido_produto_descricao_detalhada'
      DataSource = ConexaoBD.DS_NF_FB_Pedidos_Produtos
      ParentCtl3D = False
      TabOrder = 21
      Visible = False
    end
    object Nro_Pedido_Unico: TEdit
      Left = 12
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 22
      Text = '0'
      Visible = False
    end
    object Registro_OS_Geral: TEdit
      Left = 4
      Top = 21
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 23
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 3
    Width = 753
    Height = 533
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 737
      Height = 521
      Caption = '  Dados do Cliente  '
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 109
        Width = 722
        Height = 404
        Caption = '  Rela'#231#227'o de Produtos  '
        TabOrder = 1
        object Panel2: TPanel
          Left = 8
          Top = 203
          Width = 708
          Height = 151
          BevelOuter = bvLowered
          TabOrder = 2
          object Label4: TLabel
            Left = 526
            Top = 6
            Width = 96
            Height = 13
            Caption = 'Previs'#227'o de Entrega'
          end
          object Data_Entrega: TMaskEdit
            Left = 625
            Top = 3
            Width = 65
            Height = 19
            Ctl3D = False
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 0
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
            TabOrder = 1
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
          object Nota_Dados_Complementares: TPageControl
            Left = 2
            Top = 2
            Width = 513
            Height = 146
            ActivePage = TabSheet1
            TabOrder = 2
            object TabSheet1: TTabSheet
              Caption = 'Dados Complementares'
              object GroupBox7: TGroupBox
                Left = 0
                Top = 0
                Width = 506
                Height = 118
                Caption = '  Dados para Emis'#227'o da OS  '
                TabOrder = 0
                object Label49: TLabel
                  Left = 4
                  Top = 13
                  Width = 72
                  Height = 13
                  Caption = 'Transportadora'
                end
                object Label50: TLabel
                  Left = 6
                  Top = 94
                  Width = 91
                  Height = 13
                  Caption = 'Tipo de Solicita'#231#227'o'
                end
                object Label9: TLabel
                  Left = 228
                  Top = 94
                  Width = 158
                  Height = 13
                  Caption = 'Nro. Ordem de Compra do Cliente'
                end
                object Label39: TLabel
                  Left = 308
                  Top = 13
                  Width = 112
                  Height = 13
                  Caption = 'Tens'#227'o de Alimenta'#231#227'o'
                end
                object Label37: TLabel
                  Left = 393
                  Top = 47
                  Width = 24
                  Height = 13
                  Caption = 'Peso'
                end
                object Label38: TLabel
                  Left = 447
                  Top = 47
                  Width = 35
                  Height = 13
                  Caption = 'Volume'
                end
                object Label21: TLabel
                  Left = 321
                  Top = 47
                  Width = 63
                  Height = 13
                  Caption = 'Desconto (%)'
                end
                object Cliente_Tipo_Transporte: TComboBox
                  Left = 8
                  Top = 95
                  Width = 8
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentCtl3D = False
                  TabOrder = 8
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
                  Left = 4
                  Top = 27
                  Width = 282
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ParentCtl3D = False
                  TabOrder = 0
                  OnKeyPress = Cliente_TransportadoraKeyPress
                end
                object Cliente_Tipo_Faturamento: TComboBox
                  Left = 101
                  Top = 91
                  Width = 121
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentCtl3D = False
                  TabOrder = 5
                  Text = 'Nota Fiscal'
                  OnKeyPress = Cliente_Tipo_FaturamentoKeyPress
                  Items.Strings = (
                    'Nota Fiscal'
                    'Or'#231'amento')
                end
                object Cliente_Emite_Lote: TComboBox
                  Left = 42
                  Top = 95
                  Width = 8
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
                  Visible = False
                  OnKeyPress = Cliente_Emite_LoteKeyPress
                  Items.Strings = (
                    'N'#227'o'
                    'Sim')
                end
                object Cliente_Pgto_Frete: TComboBox
                  Left = 19
                  Top = 95
                  Width = 8
                  Height = 19
                  BevelInner = bvNone
                  BevelKind = bkSoft
                  Style = csOwnerDrawFixed
                  Ctl3D = False
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentCtl3D = False
                  TabOrder = 9
                  Text = 'Cliente'
                  Visible = False
                  OnKeyPress = Cliente_Pgto_FreteKeyPress
                  Items.Strings = (
                    'Cliente'
                    'Ibrasmak')
                end
                object Natureza_Operacao: TComboBox
                  Left = 29
                  Top = 95
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
                  Left = 391
                  Top = 91
                  Width = 107
                  Height = 19
                  Ctl3D = False
                  MaxLength = 20
                  ParentCtl3D = False
                  TabOrder = 6
                end
                object Transportadora_Nao_Cadastrada: TEdit
                  Left = 152
                  Top = 53
                  Width = 16
                  Height = 19
                  Ctl3D = False
                  MaxLength = 100
                  ParentCtl3D = False
                  TabOrder = 7
                  Visible = False
                end
                object Cliente_Alimentacao: TEdit
                  Left = 308
                  Top = 27
                  Width = 191
                  Height = 19
                  Ctl3D = False
                  MaxLength = 100
                  ParentCtl3D = False
                  TabOrder = 1
                  OnKeyPress = Cliente_AlimentacaoKeyPress
                end
                object Cliente_Peso: TEdit
                  Left = 393
                  Top = 61
                  Width = 51
                  Height = 19
                  Ctl3D = False
                  MaxLength = 50
                  ParentCtl3D = False
                  TabOrder = 3
                  OnKeyPress = Cliente_PesoKeyPress
                end
                object Cliente_Volume: TEdit
                  Left = 447
                  Top = 61
                  Width = 51
                  Height = 19
                  Ctl3D = False
                  MaxLength = 50
                  ParentCtl3D = False
                  TabOrder = 4
                  OnKeyPress = Cliente_VolumeKeyPress
                end
                object BT_Adicionar_Transportadora: TBitBtn
                  Left = 5
                  Top = 54
                  Width = 140
                  Height = 25
                  Caption = 'Incluir Transportadora'
                  TabOrder = 12
                  OnClick = BT_Adicionar_TransportadoraClick
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
                object Porcentagem_Desconto: TEdit
                  Left = 328
                  Top = 61
                  Width = 51
                  Height = 19
                  Ctl3D = False
                  MaxLength = 50
                  ParentCtl3D = False
                  TabOrder = 2
                  OnExit = Porcentagem_DescontoExit
                  OnKeyPress = Cliente_PesoKeyPress
                end
                object Button1: TButton
                  Left = 288
                  Top = 25
                  Width = 17
                  Height = 25
                  Hint = 'Localizar Transportadora'
                  Caption = '^'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 13
                  OnClick = Button1Click
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
              object Label24: TLabel
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
                TabOrder = 0
                OnKeyPress = Financiamento_BNDSKeyPress
              end
              object Financiamento_Leasing: TCheckBox
                Left = 224
                Top = 2
                Width = 62
                Height = 17
                Caption = 'Leasing'
                TabOrder = 2
                OnKeyPress = Financiamento_LeasingKeyPress
              end
              object Financiamento_Ibrasmak: TCheckBox
                Left = 296
                Top = 2
                Width = 67
                Height = 17
                Caption = 'Ibrasmak'
                TabOrder = 3
                OnKeyPress = Financiamento_IbrasmakKeyPress
              end
              object Financiamento_Proger: TCheckBox
                Left = 159
                Top = 2
                Width = 55
                Height = 17
                Caption = 'Proger'
                TabOrder = 1
                OnKeyPress = Financiamento_ProgerKeyPress
              end
              object Pagamento_Vista: TRadioButton
                Left = 151
                Top = 20
                Width = 58
                Height = 17
                Caption = #192' Vista'
                Checked = True
                TabOrder = 4
                TabStop = True
                OnClick = Pagamento_VistaClick
                OnKeyPress = Pagamento_VistaKeyPress
              end
              object Pagamento_Parcelado: TRadioButton
                Left = 213
                Top = 20
                Width = 73
                Height = 17
                Caption = 'Parcelado'
                TabOrder = 5
                OnClick = Pagamento_ParceladoClick
                OnKeyPress = Pagamento_ParceladoKeyPress
              end
              object Pagamento_Combinar: TRadioButton
                Left = 293
                Top = 20
                Width = 78
                Height = 17
                Caption = #192' Combinar'
                TabOrder = 6
                OnClick = Pagamento_CombinarClick
                OnKeyPress = Pagamento_CombinarKeyPress
              end
              object Forma_Parcelamento: TGroupBox
                Left = 0
                Top = 35
                Width = 309
                Height = 82
                Caption = '   Forma de Parcelamento  '
                TabOrder = 7
                object Label25: TLabel
                  Left = 6
                  Top = 14
                  Width = 41
                  Height = 13
                  Caption = 'Parcelas'
                end
                object Label26: TLabel
                  Left = 6
                  Top = 38
                  Width = 154
                  Height = 13
                  Caption = 'Dia de Vencimento das Parcelas'
                end
                object Label40: TLabel
                  Left = 199
                  Top = 8
                  Width = 96
                  Height = 26
                  Caption = 'Considerar parcelas a partir do:'
                  WordWrap = True
                end
                object Label27: TLabel
                  Left = 5
                  Top = 62
                  Width = 156
                  Height = 13
                  Caption = 'Intervalo de dias p/ Vencimentos'
                  Visible = False
                end
                object Parcela_Nro: TEdit
                  Left = 52
                  Top = 13
                  Width = 26
                  Height = 19
                  Ctl3D = False
                  Enabled = False
                  MaxLength = 3
                  ParentCtl3D = False
                  TabOrder = 0
                  Text = '0'
                  OnKeyPress = Parcela_NroKeyPress
                end
                object Parcela_Vencto: TEdit
                  Left = 164
                  Top = 35
                  Width = 26
                  Height = 19
                  Ctl3D = False
                  MaxLength = 2
                  ParentCtl3D = False
                  TabOrder = 1
                  Text = '0'
                  OnKeyPress = Parcela_VenctoKeyPress
                end
                object Parcela_Dias_Vencto: TEdit
                  Left = 164
                  Top = 59
                  Width = 26
                  Height = 19
                  Ctl3D = False
                  MaxLength = 3
                  ParentCtl3D = False
                  TabOrder = 2
                  Text = '0'
                  Visible = False
                  OnKeyPress = Parcela_Dias_VenctoKeyPress
                end
                object Parcela_Mes_Subsequente: TCheckBox
                  Left = 196
                  Top = 63
                  Width = 108
                  Height = 17
                  Caption = 'M'#234's Subsequente'
                  TabOrder = 3
                  Visible = False
                  OnKeyPress = Parcela_Mes_SubsequenteKeyPress
                end
                object Parcela_Pedido: TRadioButton
                  Left = 199
                  Top = 34
                  Width = 58
                  Height = 17
                  Caption = 'Pedido'
                  Checked = True
                  TabOrder = 4
                  TabStop = True
                  OnKeyPress = Parcela_PedidoKeyPress
                end
                object Parcela_Faturamento: TRadioButton
                  Left = 199
                  Top = 48
                  Width = 82
                  Height = 17
                  Caption = 'Faturamento'
                  TabOrder = 5
                  OnKeyPress = Parcela_FaturamentoKeyPress
                end
                object Parcela_Descricao: TEdit
                  Left = 84
                  Top = 13
                  Width = 106
                  Height = 19
                  Ctl3D = False
                  MaxLength = 255
                  ParentCtl3D = False
                  TabOrder = 6
                  OnExit = Parcela_DescricaoExit
                end
              end
              object Valor_Ato: TGroupBox
                Left = 311
                Top = 35
                Width = 194
                Height = 82
                Caption = '   Valor do Ato   '
                TabOrder = 8
                object Label29: TLabel
                  Left = 4
                  Top = 17
                  Width = 114
                  Height = 13
                  Caption = 'Porcentagem do Ato (%)'
                end
                object Label31: TLabel
                  Left = 10
                  Top = 39
                  Width = 108
                  Height = 13
                  Caption = 'ou     Valor do Ato (R$)'
                end
                object Label34: TLabel
                  Left = 14
                  Top = 62
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
                  MaxLength = 7
                  ParentCtl3D = False
                  TabOrder = 0
                  Text = '0'
                  OnExit = Parcela_Porcentagem_AtoExit
                  OnKeyPress = Parcela_Porcentagem_AtoKeyPress
                end
                object Parcela_Vlr_Ato: TEdit
                  Left = 122
                  Top = 36
                  Width = 68
                  Height = 19
                  Ctl3D = False
                  MaxLength = 13
                  ParentCtl3D = False
                  TabOrder = 1
                  Text = '0'
                  OnKeyPress = Parcela_Vlr_AtoKeyPress
                end
                object Parcela_Prazo_Inicio: TEdit
                  Left = 122
                  Top = 59
                  Width = 26
                  Height = 19
                  Ctl3D = False
                  MaxLength = 3
                  ParentCtl3D = False
                  TabOrder = 2
                  Text = '0'
                  OnKeyPress = Parcela_Prazo_InicioKeyPress
                end
              end
            end
            object TabSheet3: TTabSheet
              Caption = 'Obs. Nota / Cliente'
              ImageIndex = 2
              object Label18: TLabel
                Left = 6
                Top = 61
                Width = 184
                Height = 13
                Caption = 'Observa'#231#227'o Nota Fiscal ou Or'#231'amento'
              end
              object Label22: TLabel
                Left = 260
                Top = 4
                Width = 93
                Height = 13
                Caption = 'Observa'#231#227'o Cliente'
              end
              object Label41: TLabel
                Left = 6
                Top = 5
                Width = 144
                Height = 13
                Caption = 'Observa'#231#227'o para Faturamento'
              end
              object Observacao_Nota: TMemo
                Left = 6
                Top = 76
                Width = 250
                Height = 38
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 130
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
                Height = 94
                Ctl3D = False
                ParentCtl3D = False
                ScrollBars = ssVertical
                TabOrder = 2
              end
              object Observacao_Faturamento: TMemo
                Left = 6
                Top = 20
                Width = 250
                Height = 38
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
              object Label36: TLabel
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
                Height = 94
                Ctl3D = False
                ParentCtl3D = False
                ScrollBars = ssVertical
                TabOrder = 0
              end
            end
          end
        end
        object SGD_Produtos: TStringGrid
          Left = 8
          Top = 14
          Width = 708
          Height = 152
          ColCount = 16
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
        object Panel4: TPanel
          Left = 8
          Top = 171
          Width = 708
          Height = 29
          BevelOuter = bvLowered
          TabOrder = 1
          object Label43: TLabel
            Left = 308
            Top = 8
            Width = 395
            Height = 13
            Caption = 
              'OBS.: Para remover o produto, coloque "Zero" na quantidade e cli' +
              'que em "Alterar".'
          end
          object BT_Adicionar: TBitBtn
            Left = 122
            Top = 2
            Width = 129
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
        end
        object GroupBox8: TGroupBox
          Left = 153
          Top = 354
          Width = 166
          Height = 41
          Caption = '  Solicitado por   '
          TabOrder = 3
          object Cliente_Solicitado: TEdit
            Left = 7
            Top = 15
            Width = 150
            Height = 19
            Ctl3D = False
            MaxLength = 100
            ParentCtl3D = False
            TabOrder = 0
          end
        end
        object GroupBox5: TGroupBox
          Left = 9
          Top = 354
          Width = 136
          Height = 41
          Caption = '  Empresa   '
          TabOrder = 4
          object Pedido_Empresa: TComboBox
            Left = 7
            Top = 13
            Width = 122
            Height = 19
            BevelInner = bvNone
            BevelKind = bkSoft
            Style = csOwnerDrawFixed
            Ctl3D = False
            ItemHeight = 13
            ItemIndex = 0
            ParentCtl3D = False
            TabOrder = 0
            Text = 'Ibrasmak'
            Items.Strings = (
              'Ibrasmak'
              'Monibras')
          end
        end
        object GroupBox6: TGroupBox
          Left = 325
          Top = 354
          Width = 388
          Height = 41
          Caption = '   C'#225'lculo da Comiss'#227'o   '
          TabOrder = 5
          object Label45: TLabel
            Left = 5
            Top = 17
            Width = 70
            Height = 13
            Caption = 'Representante'
          end
          object Label46: TLabel
            Left = 271
            Top = 18
            Width = 62
            Height = 13
            Caption = 'Comiss'#227'o (%)'
          end
          object Cliente_Vendedor: TComboBox
            Left = 79
            Top = 14
            Width = 189
            Height = 19
            BevelInner = bvNone
            BevelKind = bkSoft
            Style = csOwnerDrawFixed
            Ctl3D = False
            ItemHeight = 13
            ParentCtl3D = False
            TabOrder = 0
            OnChange = Cliente_VendedorChange
            OnKeyPress = Cliente_VendedorKeyPress
          end
          object Cliente_Comissao: TEdit
            Left = 336
            Top = 15
            Width = 45
            Height = 19
            Ctl3D = False
            MaxLength = 7
            ParentCtl3D = False
            TabOrder = 1
            OnKeyPress = Cliente_ComissaoKeyPress
          end
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 15
        Width = 722
        Height = 90
        Caption = '  Pedido  '
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
          Left = 265
          Top = 11
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label28: TLabel
          Left = 8
          Top = 45
          Width = 37
          Height = 13
          Caption = 'Contato'
        end
        object Label35: TLabel
          Left = 407
          Top = 63
          Width = 45
          Height = 13
          Caption = 'Telefone:'
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
        object Label2: TLabel
          Left = 81
          Top = 12
          Width = 58
          Height = 13
          Caption = 'DT.Inclus'#227'o'
        end
        object Label42: TLabel
          Left = 150
          Top = 12
          Width = 27
          Height = 13
          Caption = 'CNPJ'
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
          Left = 265
          Top = 26
          Width = 296
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
        end
        object BT_Procurar: TBitBtn
          Left = 565
          Top = 23
          Width = 150
          Height = 24
          Caption = 'Procurar por Cliente        '
          TabOrder = 11
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
        object Cliente_Contato: TEdit
          Left = 8
          Top = 60
          Width = 393
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 7
        end
        object Cliente_Fone_Comercial: TEdit
          Left = 460
          Top = 60
          Width = 101
          Height = 19
          Ctl3D = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 8
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
          TabOrder = 12
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 80
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
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
          TabOrder = 14
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
          TabOrder = 15
          Visible = False
        end
        object Pedido_Data_Inclusao: TMaskEdit
          Left = 81
          Top = 26
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 16
          Text = '  /  /    '
          OnExit = Data_EntregaExit
          OnKeyPress = Data_EntregaKeyPress
        end
        object Cliente_Codigo: TEdit
          Left = 150
          Top = 26
          Width = 110
          Height = 19
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          TabOrder = 17
        end
        object BT_Produtos: TBitBtn
          Left = 566
          Top = 58
          Width = 149
          Height = 25
          Caption = 'Incluir/Alterar Produtos'
          TabOrder = 18
          OnClick = BT_ProdutosClick
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
    end
  end
end
