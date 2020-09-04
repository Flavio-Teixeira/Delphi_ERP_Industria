object VHistoricoClientes02: TVHistoricoClientes02
  Left = 232
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Hist'#243'rico de Clientes - CONSULTA (NOTA FISCAL / OR'#199'AMENTO)'
  ClientHeight = 543
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 4
    Top = 495
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
    object Movto_Pos_Total: TEdit
      Left = 68
      Top = 8
      Width = 20
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      Text = '0'
      Visible = False
    end
    object Movto_Pos_Atual: TEdit
      Left = 88
      Top = 8
      Width = 20
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
      Text = '0'
      Visible = False
    end
    object BT_Anterior: TButton
      Left = 329
      Top = 8
      Width = 40
      Height = 25
      Caption = '<<<'
      TabOrder = 8
      OnClick = BT_AnteriorClick
    end
    object BT_Proximo: TButton
      Left = 384
      Top = 8
      Width = 40
      Height = 25
      Caption = '>>>'
      TabOrder = 9
      OnClick = BT_ProximoClick
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 3
    Width = 753
    Height = 487
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 737
      Height = 475
      Caption = '  Dados do Cliente  '
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 73
        Width = 722
        Height = 394
        Caption = '  Rela'#231#227'o de Produtos  '
        TabOrder = 1
        object Panel2: TPanel
          Left = 8
          Top = 317
          Width = 708
          Height = 69
          BevelOuter = bvLowered
          TabOrder = 1
          object GroupBox7: TGroupBox
            Left = 6
            Top = 2
            Width = 695
            Height = 61
            Caption = '  Dados para Emis'#227'o de Pedido  '
            TabOrder = 0
            object Label47: TLabel
              Left = 223
              Top = 19
              Width = 78
              Height = 13
              Caption = 'Cond. Pgto (DD)'
            end
            object Label49: TLabel
              Left = 6
              Top = 19
              Width = 72
              Height = 13
              Caption = 'Transportadora'
            end
            object Label18: TLabel
              Left = 471
              Top = 19
              Width = 53
              Height = 13
              Caption = 'Dt.Emiss'#227'o'
            end
            object Label54: TLabel
              Left = 541
              Top = 19
              Width = 53
              Height = 13
              Caption = 'Nro.Pedido'
            end
            object Label55: TLabel
              Left = 599
              Top = 19
              Width = 85
              Height = 13
              Caption = 'Ordem de Compra'
            end
            object Label6: TLabel
              Left = 386
              Top = 20
              Width = 42
              Height = 13
              Caption = 'Vlr. Total'
            end
            object Label1: TLabel
              Left = 312
              Top = 19
              Width = 31
              Height = 13
              Caption = 'Vlr. IPI'
            end
            object Cliente_Condicao_Pgto_1: TEdit
              Left = 223
              Top = 34
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 0
            end
            object Cliente_Condicao_Pgto_2: TEdit
              Left = 243
              Top = 34
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 1
            end
            object Cliente_Condicao_Pgto_3: TEdit
              Left = 263
              Top = 34
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 2
            end
            object Cliente_Transportadora: TComboBox
              Left = 6
              Top = 33
              Width = 213
              Height = 21
              BevelInner = bvNone
              BevelKind = bkSoft
              Ctl3D = False
              Enabled = False
              ItemHeight = 13
              ParentCtl3D = False
              TabOrder = 3
            end
            object Data_Emissao: TMaskEdit
              Left = 471
              Top = 34
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 4
              Text = '  /  /    '
            end
            object Nro_Ped: TEdit
              Left = 541
              Top = 34
              Width = 53
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 5
            end
            object Ordem_Compra: TEdit
              Left = 599
              Top = 34
              Width = 90
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 6
            end
            object Cliente_Condicao_Pgto_4: TEdit
              Left = 283
              Top = 34
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 7
            end
            object Valor_Total: TEdit
              Left = 387
              Top = 35
              Width = 70
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 8
            end
            object Valor_IPI: TEdit
              Left = 313
              Top = 34
              Width = 70
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 80
              ParentCtl3D = False
              TabOrder = 9
            end
          end
        end
        object SGD_Produtos: TStringGrid
          Left = 8
          Top = 17
          Width = 708
          Height = 294
          ColCount = 6
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
        Height = 56
        Caption = '  Nome / Endere'#231'o  '
        TabOrder = 0
        object Label3: TLabel
          Left = 314
          Top = 13
          Width = 28
          Height = 13
          Caption = 'Nome'
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
        object Cliente_Nome: TEdit
          Left = 314
          Top = 28
          Width = 399
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
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
          TabOrder = 1
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
          TabOrder = 2
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
          TabOrder = 3
        end
      end
    end
  end
end
