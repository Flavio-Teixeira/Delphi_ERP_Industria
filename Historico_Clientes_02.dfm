object HistoricoClientes02: THistoricoClientes02
  Left = 232
  Top = 61
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Hist'#243'rico de Clientes - CONSULTA (NOTA FISCAL / PAPELETA)'
  ClientHeight = 638
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 4
    Top = 592
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
    object Tipo_Fatura: TEdit
      Left = 12
      Top = 8
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
    end
    object DBM_NF_Observacao: TDBMemo
      Left = 20
      Top = 8
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_nota_fiscal_observacao'
      DataSource = ConexaoBD.DS_FB_Nota_Fiscal
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object DBM_NF_Observacao_Log: TDBMemo
      Left = 28
      Top = 8
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_nota_fiscal_observacao_log'
      DataSource = ConexaoBD.DS_FB_Nota_Fiscal
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object DBM_Ped_Observacao: TDBMemo
      Left = 36
      Top = 8
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_papeleta_observacao'
      DataSource = ConexaoBD.DS_FB_Papeletas
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object DBM_Ped_Observacao_Log: TDBMemo
      Left = 44
      Top = 8
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_papeleta_observacao_log'
      DataSource = ConexaoBD.DS_FB_Papeletas
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 3
    Width = 753
    Height = 584
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 737
      Height = 572
      Caption = '  Dados do Cliente  '
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 144
        Width = 722
        Height = 420
        Caption = '  Rela'#231#227'o de Produtos  '
        TabOrder = 1
        object Panel2: TPanel
          Left = 8
          Top = 104
          Width = 708
          Height = 308
          BevelOuter = bvLowered
          TabOrder = 1
          object GroupBox7: TGroupBox
            Left = 6
            Top = 2
            Width = 695
            Height = 299
            Caption = '  Dados para Emis'#227'o de Pedido  '
            TabOrder = 0
            object Label46: TLabel
              Left = 473
              Top = 56
              Width = 42
              Height = 13
              Caption = 'Desc.(%)'
            end
            object Label47: TLabel
              Left = 530
              Top = 56
              Width = 78
              Height = 13
              Caption = 'Cond. Pgto (DD)'
            end
            object Label48: TLabel
              Left = 282
              Top = 19
              Width = 51
              Height = 13
              Caption = 'Transporte'
            end
            object Label49: TLabel
              Left = 368
              Top = 19
              Width = 72
              Height = 13
              Caption = 'Transportadora'
            end
            object Label50: TLabel
              Left = 130
              Top = 18
              Width = 83
              Height = 13
              Caption = 'Tipo Faturamento'
            end
            object Label52: TLabel
              Left = 638
              Top = 18
              Width = 50
              Height = 13
              Caption = 'Emite Lote'
            end
            object Label53: TLabel
              Left = 7
              Top = 56
              Width = 64
              Height = 13
              Caption = 'Pgto do Frete'
            end
            object Label10: TLabel
              Left = 7
              Top = 18
              Width = 108
              Height = 13
              Caption = 'Natureza de Opera'#231#227'o'
            end
            object Label18: TLabel
              Left = 622
              Top = 56
              Width = 53
              Height = 13
              Caption = 'Dt.Emiss'#227'o'
            end
            object Label41: TLabel
              Left = 84
              Top = 56
              Width = 70
              Height = 13
              Caption = 'Representante'
            end
            object Label40: TLabel
              Left = 314
              Top = 56
              Width = 31
              Height = 13
              Caption = 'Banco'
            end
            object Label36: TLabel
              Left = 89
              Top = 94
              Width = 45
              Height = 13
              Caption = 'Nro.Parc.'
            end
            object Label37: TLabel
              Left = 142
              Top = 94
              Width = 29
              Height = 13
              Caption = 'Forma'
            end
            object Label23: TLabel
              Left = 195
              Top = 94
              Width = 48
              Height = 13
              Caption = 'Dt.Vencto'
            end
            object Label24: TLabel
              Left = 263
              Top = 94
              Width = 42
              Height = 13
              Caption = 'Dt.Pagto'
            end
            object Label26: TLabel
              Left = 331
              Top = 94
              Width = 51
              Height = 13
              Caption = 'Vlr.Parcela'
            end
            object Label27: TLabel
              Left = 399
              Top = 94
              Width = 40
              Height = 13
              Caption = 'Vlr.Juros'
            end
            object Label25: TLabel
              Left = 467
              Top = 94
              Width = 40
              Height = 13
              Caption = 'Vlr.Pago'
            end
            object Label38: TLabel
              Left = 536
              Top = 94
              Width = 64
              Height = 13
              Caption = 'Cod.Banc'#225'rio'
            end
            object Label39: TLabel
              Left = 21
              Top = 112
              Width = 63
              Height = 13
              Caption = '1o. Parcela - '
            end
            object Label42: TLabel
              Left = 21
              Top = 132
              Width = 63
              Height = 13
              Caption = '2o. Parcela - '
            end
            object Label43: TLabel
              Left = 21
              Top = 152
              Width = 63
              Height = 13
              Caption = '3o. Parcela - '
            end
            object Label45: TLabel
              Left = 154
              Top = 197
              Width = 35
              Height = 13
              Caption = 'Volume'
            end
            object Label54: TLabel
              Left = 194
              Top = 197
              Width = 53
              Height = 13
              Caption = 'Nro.Pedido'
            end
            object Label55: TLabel
              Left = 252
              Top = 197
              Width = 85
              Height = 13
              Caption = 'Ordem de Compra'
            end
            object Label2: TLabel
              Left = 383
              Top = 197
              Width = 31
              Height = 13
              Caption = 'Vlr. IPI'
            end
            object Label6: TLabel
              Left = 457
              Top = 197
              Width = 42
              Height = 13
              Caption = 'Vlr. Total'
            end
            object Label4: TLabel
              Left = 21
              Top = 172
              Width = 63
              Height = 13
              Caption = '4o. Parcela - '
            end
            object Label9: TLabel
              Left = 5
              Top = 235
              Width = 181
              Height = 13
              Caption = 'Obs. Nota Fiscal ou Ordem de Servi'#231'o'
            end
            object Cliente_Desconto: TEdit
              Left = 473
              Top = 71
              Width = 45
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 7
              ParentCtl3D = False
              TabOrder = 0
            end
            object Cliente_Condicao_Pgto_1: TEdit
              Left = 530
              Top = 71
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 1
            end
            object Cliente_Condicao_Pgto_2: TEdit
              Left = 549
              Top = 71
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 2
            end
            object Cliente_Condicao_Pgto_3: TEdit
              Left = 568
              Top = 71
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 3
            end
            object Cliente_Tipo_Transporte: TComboBox
              Left = 282
              Top = 33
              Width = 77
              Height = 21
              BevelInner = bvNone
              BevelKind = bkSoft
              Ctl3D = False
              Enabled = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 6
              Text = 'Rodovi'#225'rio'
              Items.Strings = (
                'Rodovi'#225'rio'
                'A'#233'reo'
                'Mar'#237'timo'
                'Ferrovi'#225'rio')
            end
            object Cliente_Transportadora: TComboBox
              Left = 368
              Top = 33
              Width = 213
              Height = 21
              BevelInner = bvNone
              BevelKind = bkSoft
              Ctl3D = False
              Enabled = False
              ItemHeight = 13
              ParentCtl3D = False
              TabOrder = 9
            end
            object Cliente_Tipo_Faturamento: TComboBox
              Left = 130
              Top = 33
              Width = 90
              Height = 21
              BevelInner = bvNone
              BevelKind = bkSoft
              Ctl3D = False
              Enabled = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 4
              Text = 'Nota Fiscal'
              Items.Strings = (
                'Nota Fiscal'
                'Papeleta')
            end
            object Cliente_Emite_Lote: TComboBox
              Left = 638
              Top = 33
              Width = 50
              Height = 21
              BevelInner = bvNone
              BevelKind = bkSoft
              Ctl3D = False
              Enabled = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 5
              Text = 'N'#227'o'
              Items.Strings = (
                'N'#227'o'
                'Sim')
            end
            object Cliente_Pgto_Frete: TComboBox
              Left = 7
              Top = 71
              Width = 69
              Height = 21
              BevelInner = bvNone
              BevelKind = bkSoft
              Ctl3D = False
              Enabled = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 7
              Text = 'Cliente'
              Items.Strings = (
                'Cliente'
                'Ibrasmak')
            end
            object Natureza_Operacao: TComboBox
              Left = 7
              Top = 33
              Width = 111
              Height = 21
              BevelInner = bvNone
              BevelKind = bkSoft
              Ctl3D = False
              Enabled = False
              ItemHeight = 13
              ItemIndex = 0
              ParentCtl3D = False
              TabOrder = 8
              Text = 'Vendas'
              Items.Strings = (
                'Vendas'
                'Remessa'
                'Outras Sa'#237'das'
                'Consigna'#231#227'o')
            end
            object Data_Emissao: TMaskEdit
              Left = 622
              Top = 71
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 10
              Text = '  /  /    '
            end
            object Representante: TComboBox
              Left = 84
              Top = 71
              Width = 223
              Height = 21
              BevelInner = bvNone
              BevelKind = bkSoft
              Ctl3D = False
              Enabled = False
              ItemHeight = 13
              ParentCtl3D = False
              TabOrder = 11
            end
            object Banco: TComboBox
              Left = 314
              Top = 71
              Width = 150
              Height = 21
              BevelInner = bvNone
              BevelKind = bkSoft
              Ctl3D = False
              Enabled = False
              ItemHeight = 13
              ParentCtl3D = False
              TabOrder = 12
            end
            object Nro_Parcela1: TEdit
              Left = 89
              Top = 109
              Width = 50
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 13
            end
            object Forma1: TEdit
              Left = 142
              Top = 109
              Width = 50
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 14
            end
            object DT_Vencimento1: TMaskEdit
              Left = 195
              Top = 109
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 15
              Text = '  /  /    '
            end
            object Dt_Pagamento1: TMaskEdit
              Left = 263
              Top = 109
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 16
              Text = '  /  /    '
            end
            object Vlr_Parcela1: TEdit
              Left = 331
              Top = 109
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 17
            end
            object Vlr_Juros1: TEdit
              Left = 399
              Top = 109
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 18
            end
            object Vlr_Pago1: TEdit
              Left = 467
              Top = 109
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 19
            end
            object Cod_Bancario1: TEdit
              Left = 536
              Top = 109
              Width = 150
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 20
            end
            object Nro_Parcela2: TEdit
              Left = 89
              Top = 129
              Width = 50
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 21
            end
            object Forma2: TEdit
              Left = 142
              Top = 129
              Width = 50
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 22
            end
            object DT_Vencimento2: TMaskEdit
              Left = 195
              Top = 129
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 23
              Text = '  /  /    '
            end
            object Dt_Pagamento2: TMaskEdit
              Left = 263
              Top = 129
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 24
              Text = '  /  /    '
            end
            object Vlr_Parcela2: TEdit
              Left = 331
              Top = 129
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 25
            end
            object Vlr_Juros2: TEdit
              Left = 399
              Top = 129
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 26
            end
            object Vlr_Pago2: TEdit
              Left = 467
              Top = 129
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 27
            end
            object Cod_Bancario2: TEdit
              Left = 536
              Top = 129
              Width = 150
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 28
            end
            object Nro_Parcela3: TEdit
              Left = 89
              Top = 149
              Width = 50
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 29
            end
            object Forma3: TEdit
              Left = 142
              Top = 149
              Width = 50
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 30
            end
            object DT_Vencimento3: TMaskEdit
              Left = 195
              Top = 149
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 31
              Text = '  /  /    '
            end
            object Dt_Pagamento3: TMaskEdit
              Left = 263
              Top = 149
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 32
              Text = '  /  /    '
            end
            object Vlr_Parcela3: TEdit
              Left = 331
              Top = 149
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 33
            end
            object Vlr_Juros3: TEdit
              Left = 399
              Top = 149
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 34
            end
            object Vlr_Pago3: TEdit
              Left = 467
              Top = 149
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 35
            end
            object Cod_Bancario3: TEdit
              Left = 536
              Top = 149
              Width = 150
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 36
            end
            object Volume: TEdit
              Left = 154
              Top = 212
              Width = 35
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 37
            end
            object Nro_Ped: TEdit
              Left = 194
              Top = 212
              Width = 53
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 38
            end
            object Ordem_Compra: TEdit
              Left = 252
              Top = 212
              Width = 90
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 39
            end
            object Cliente_Condicao_Pgto_4: TEdit
              Left = 588
              Top = 71
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 40
            end
            object Valor_IPI: TEdit
              Left = 383
              Top = 212
              Width = 70
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 41
            end
            object Valor_Total: TEdit
              Left = 458
              Top = 212
              Width = 82
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 42
            end
            object Nro_Parcela4: TEdit
              Left = 89
              Top = 169
              Width = 50
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 43
            end
            object Forma4: TEdit
              Left = 142
              Top = 169
              Width = 50
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 44
            end
            object DT_Vencimento4: TMaskEdit
              Left = 195
              Top = 169
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 45
              Text = '  /  /    '
            end
            object Dt_Pagamento4: TMaskEdit
              Left = 263
              Top = 169
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 46
              Text = '  /  /    '
            end
            object Vlr_Parcela4: TEdit
              Left = 331
              Top = 169
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 47
            end
            object Vlr_Juros4: TEdit
              Left = 399
              Top = 169
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 48
            end
            object Vlr_Pago4: TEdit
              Left = 467
              Top = 169
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 49
            end
            object Cod_Bancario4: TEdit
              Left = 536
              Top = 169
              Width = 150
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 50
            end
            object Observacao_Nota: TMemo
              Left = 5
              Top = 249
              Width = 685
              Height = 45
              Ctl3D = False
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 330
              ParentCtl3D = False
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 51
              WantReturns = False
            end
          end
        end
        object SGD_Produtos: TStringGrid
          Left = 8
          Top = 17
          Width = 708
          Height = 82
          ColCount = 7
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
        Height = 128
        Caption = '  Nome / Endere'#231'o  '
        TabOrder = 0
        object Label13: TLabel
          Left = 8
          Top = 49
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label14: TLabel
          Left = 345
          Top = 49
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label15: TLabel
          Left = 470
          Top = 49
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label16: TLabel
          Left = 595
          Top = 49
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label19: TLabel
          Left = 507
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label17: TLabel
          Left = 554
          Top = 13
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label20: TLabel
          Left = 615
          Top = 13
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label3: TLabel
          Left = 314
          Top = 13
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label1: TLabel
          Left = 69
          Top = 13
          Width = 41
          Height = 13
          Caption = 'Empresa'
        end
        object Label28: TLabel
          Left = 8
          Top = 86
          Width = 37
          Height = 13
          Caption = 'Contato'
        end
        object Label35: TLabel
          Left = 138
          Top = 104
          Width = 50
          Height = 13
          Caption = 'Telefones:'
        end
        object Label29: TLabel
          Left = 190
          Top = 86
          Width = 24
          Height = 13
          Caption = 'DDD'
        end
        object Label34: TLabel
          Left = 221
          Top = 86
          Width = 30
          Height = 13
          Caption = 'Ramal'
        end
        object Label30: TLabel
          Left = 265
          Top = 86
          Width = 46
          Height = 13
          Caption = 'Comercial'
        end
        object Label31: TLabel
          Left = 340
          Top = 86
          Width = 55
          Height = 13
          Caption = 'Residencial'
        end
        object Label32: TLabel
          Left = 415
          Top = 86
          Width = 32
          Height = 13
          Caption = 'Celular'
        end
        object Label33: TLabel
          Left = 489
          Top = 86
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label44: TLabel
          Left = 577
          Top = 86
          Width = 29
          Height = 13
          Caption = 'E-Mail'
        end
        object Label12: TLabel
          Left = 8
          Top = 13
          Width = 56
          Height = 13
          Caption = 'Nro. Nota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 130
          Top = 13
          Width = 21
          Height = 13
          Caption = 'Tipo'
        end
        object Label11: TLabel
          Left = 191
          Top = 13
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Cliente_Endereco: TEdit
          Left = 8
          Top = 64
          Width = 332
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 5
        end
        object Cliente_Complemento: TEdit
          Left = 345
          Top = 64
          Width = 120
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 6
        end
        object Cliente_Bairro: TEdit
          Left = 470
          Top = 64
          Width = 120
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 7
        end
        object Cliente_Cidade: TEdit
          Left = 595
          Top = 64
          Width = 120
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 8
        end
        object Cliente_Estado: TComboBox
          Left = 507
          Top = 28
          Width = 43
          Height = 21
          BevelInner = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 2
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
          Left = 554
          Top = 28
          Width = 57
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 3
          Text = '     -   '
        end
        object Cliente_Pais: TComboBox
          Left = 615
          Top = 28
          Width = 100
          Height = 21
          BevelInner = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 4
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
          Left = 314
          Top = 28
          Width = 189
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 1
        end
        object Cliente_Empresa: TEdit
          Left = 69
          Top = 28
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
          TabOrder = 0
        end
        object Cliente_Contato: TEdit
          Left = 8
          Top = 101
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
          Top = 101
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
          Top = 101
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
          Top = 101
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
          Top = 101
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
          Top = 101
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
          Top = 101
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
          Top = 101
          Width = 137
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 16
        end
        object Nro_Pedido: TEdit
          Left = 8
          Top = 28
          Width = 57
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
          TabOrder = 17
        end
        object Cliente_tipo_codigo: TComboBox
          Left = 130
          Top = 28
          Width = 57
          Height = 21
          BevelInner = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 18
          Text = 'CNPJ'
          Items.Strings = (
            'CNPJ'
            'CPF'
            'RG'
            'E-Mail')
        end
        object Cliente_Codigo: TEdit
          Left = 191
          Top = 28
          Width = 119
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 19
        end
      end
    end
  end
end
