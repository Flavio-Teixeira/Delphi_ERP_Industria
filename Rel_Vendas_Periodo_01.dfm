object RelVendasPeriodo01: TRelVendasPeriodo01
  Left = 192
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Vendas por Per'#237'odo'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 5
    Top = 495
    Width = 753
    Height = 41
    TabOrder = 0
    object BT_Sair: TBitBtn
      Left = 669
      Top = 8
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
    Left = 5
    Top = 47
    Width = 753
    Height = 196
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 5
      Top = 1
      Width = 741
      Height = 154
      Caption = '   Notas Fiscais   '
      TabOrder = 0
      object DBGrid_Nota: TDBGrid
        Left = 8
        Top = 16
        Width = 726
        Height = 129
        Ctl3D = False
        DataSource = ConexaoBD.DS_Venda_Periodo_Nota
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid_NotaCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'fb_nota_fiscal_numero'
            Title.Alignment = taCenter
            Title.Caption = 'Nro.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fb_nota_fiscal_data_emissao'
            Title.Alignment = taCenter
            Title.Caption = 'Emiss'#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_nota_fiscal_nome'
            Title.Caption = 'Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_nota_fiscal_valor_total'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor R$'
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
            FieldName = 'fb_nota_fiscal_forma_pagamento'
            Title.Alignment = taCenter
            Title.Caption = 'Forma Pagto.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fb_nota_fiscal_dup_dt_vcto_1'
            Title.Alignment = taCenter
            Title.Caption = 'DT.Vcto 1'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fb_nota_fiscal_dup_dt_vcto_2'
            Title.Alignment = taCenter
            Title.Caption = 'DT. Vcto 2'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fb_nota_fiscal_dup_dt_vcto_3'
            Title.Alignment = taCenter
            Title.Caption = 'DT.Vcto 3'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_nota_fiscal_dup_dt_vcto_4'
            Title.Caption = 'DT.Vcto 4'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end>
      end
    end
    object GroupBox3: TGroupBox
      Left = 5
      Top = 155
      Width = 742
      Height = 35
      TabOrder = 1
      object Label1: TLabel
        Left = 292
        Top = 14
        Width = 42
        Height = 13
        Caption = 'Total - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 336
        Top = 14
        Width = 87
        Height = 13
        Caption = 'Qtde de Notas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 528
        Top = 14
        Width = 115
        Height = 13
        Caption = 'Valor das Notas: R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Total_Qtde_Notas: TLabel
        Left = 434
        Top = 14
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Total_Valor_Notas: TLabel
        Left = 654
        Top = 14
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
  end
  object Panel3: TPanel
    Left = 5
    Top = 247
    Width = 753
    Height = 196
    TabOrder = 2
    object GroupBox4: TGroupBox
      Left = 5
      Top = 1
      Width = 741
      Height = 153
      Caption = '   Or'#231'amentos   '
      TabOrder = 0
      object DBGrid_Papeleta: TDBGrid
        Left = 8
        Top = 16
        Width = 726
        Height = 130
        Ctl3D = False
        DataSource = ConexaoBD.DS_Venda_Periodo_Papeleta
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid_PapeletaCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'fb_papeleta_numero'
            Title.Alignment = taCenter
            Title.Caption = 'Nro.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fb_papeleta_data_emissao'
            Title.Alignment = taCenter
            Title.Caption = 'Emiss'#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_papeleta_nome'
            Title.Caption = 'Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_papeleta_valor_total'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor R$'
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
            FieldName = 'fb_papeleta_forma_pagamento'
            Title.Alignment = taCenter
            Title.Caption = 'Forma Pagto.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fb_papeleta_dup_dt_vcto_1'
            Title.Alignment = taCenter
            Title.Caption = 'DT.Vcto 1'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fb_papeleta_dup_dt_vcto_2'
            Title.Alignment = taCenter
            Title.Caption = 'DT. Vcto 2'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'fb_papeleta_dup_dt_vcto_3'
            Title.Alignment = taCenter
            Title.Caption = 'DT.Vcto 3'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fb_papeleta_dup_dt_vcto_4'
            Title.Caption = 'DT.Vcto 4'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end>
      end
    end
    object GroupBox5: TGroupBox
      Left = 5
      Top = 154
      Width = 742
      Height = 35
      TabOrder = 1
      object Label4: TLabel
        Left = 255
        Top = 14
        Width = 42
        Height = 13
        Caption = 'Total - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 299
        Top = 14
        Width = 121
        Height = 13
        Caption = 'Qtde de Or'#231'amentos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Total_Qtde_Papeletas: TLabel
        Left = 433
        Top = 14
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label7: TLabel
        Left = 491
        Top = 14
        Width = 149
        Height = 13
        Caption = 'Valor das Or'#231'amentos: R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Total_Valor_Papeletas: TLabel
        Left = 654
        Top = 14
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
  end
  object Panel4: TPanel
    Left = 5
    Top = 3
    Width = 753
    Height = 41
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 4
      Top = 1
      Width = 744
      Height = 35
      Caption = '   Vendas por Per'#237'odo   '
      TabOrder = 0
      object Periodo_Relatorio: TLabel
        Left = 6
        Top = 15
        Width = 732
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Panel5: TPanel
    Left = 5
    Top = 448
    Width = 753
    Height = 41
    TabOrder = 4
    object GroupBox6: TGroupBox
      Left = 5
      Top = 6
      Width = 742
      Height = 35
      TabOrder = 0
      object Label6: TLabel
        Left = 309
        Top = 14
        Width = 76
        Height = 13
        Caption = 'Total Geral - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 387
        Top = 14
        Width = 32
        Height = 13
        Caption = 'Qtde:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Total_Qtde_Geral: TLabel
        Left = 433
        Top = 14
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label10: TLabel
        Left = 551
        Top = 14
        Width = 88
        Height = 13
        Caption = 'Valor Geral: R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Total_Valor_Geral: TLabel
        Left = 654
        Top = 14
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
  end
end
