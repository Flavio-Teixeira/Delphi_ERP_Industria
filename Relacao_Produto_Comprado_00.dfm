object RelacaoProdutoComprado00: TRelacaoProdutoComprado00
  Left = 340
  Top = 188
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Rela'#231#227'o de Produtos Comprados'
  ClientHeight = 453
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
  object GroupBox1: TGroupBox
    Left = 4
    Top = 2
    Width = 753
    Height = 61
    Caption = '   Op'#231#227'o de Busca   '
    TabOrder = 0
    object Label3: TLabel
      Left = 7
      Top = 17
      Width = 105
      Height = 13
      Caption = 'Lista de Fornecedores'
    end
    object Label1: TLabel
      Left = 427
      Top = 35
      Width = 65
      Height = 13
      Caption = 'Per'#237'odo    de:'
    end
    object Label4: TLabel
      Left = 576
      Top = 35
      Width = 16
      Height = 13
      Caption = 'At'#233
    end
    object Lista_Fornecedores: TComboBox
      Left = 7
      Top = 32
      Width = 412
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = Lista_FornecedoresKeyPress
    end
    object Data_Inicial: TMaskEdit
      Left = 505
      Top = 32
      Width = 63
      Height = 19
      Ctl3D = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 1
      Text = '  /  /    '
      OnKeyPress = Data_InicialKeyPress
    end
    object Data_Final: TMaskEdit
      Left = 600
      Top = 32
      Width = 63
      Height = 19
      Ctl3D = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 2
      Text = '  /  /    '
      OnKeyPress = Data_FinalKeyPress
    end
    object BT_Procurar: TBitBtn
      Left = 671
      Top = 29
      Width = 75
      Height = 24
      Caption = 'Procurar'
      TabOrder = 3
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
  end
  object Panel2: TPanel
    Left = 4
    Top = 406
    Width = 753
    Height = 41
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 670
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
    object BT_Imprimir: TBitBtn
      Left = 339
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 1
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
    object Programa_Anterior: TEdit
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Nro_Fornecedor: TEdit
      Left = 12
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 66
    Width = 753
    Height = 334
    Caption = '   Resultado   '
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 15
      Width = 69
      Height = 13
      Caption = 'Fornecedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Fornecedor_Nome: TLabel
      Left = 82
      Top = 15
      Width = 3
      Height = 13
    end
    object DBGrid_Notas: TDBGrid
      Left = 8
      Top = 37
      Width = 736
      Height = 290
      Ctl3D = False
      DataSource = ConexaoBD.DS_RelacaoProdutoComprado
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid_NotasCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_fornecedor_nome'
          Title.Caption = 'Fornecedor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_numero'
          Title.Caption = 'Posi'#231#227'o da Nota'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_numero_nota'
          Title.Alignment = taCenter
          Title.Caption = 'Nro.Nota'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'fb_nota_entrada_data_emissao'
          Title.Alignment = taCenter
          Title.Caption = 'DT.Emiss'#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_produto_codigo'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_produto_referencia'
          Title.Caption = 'Refer'#234'ncia'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_produto_descricao'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 315
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_produto_unid'
          Title.Caption = 'Unidade'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_produto_qtde'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtde'
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
          FieldName = 'fb_nota_entrada_produto_vlr_unit'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vlr.Unit'#225'rio (R$)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_produto_vlr_total'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vlr.Total (R$)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_produto_icms'
          Title.Alignment = taRightJustify
          Title.Caption = 'ICMS'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_produto_ipi'
          Title.Alignment = taRightJustify
          Title.Caption = 'IPI'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_nota_entrada_produto_vlr_ipi'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vlr. IPI (R$)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end>
    end
  end
end
