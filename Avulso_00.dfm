object Avulso00: TAvulso00
  Left = 279
  Top = 108
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'T'#237'tulos Avulsos'
  ClientHeight = 611
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
  object Panel1: TPanel
    Left = 4
    Top = 4
    Width = 754
    Height = 396
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 739
      Height = 383
      Caption = '   Contas a Pagar   '
      TabOrder = 0
      object Panel4: TPanel
        Left = 8
        Top = 17
        Width = 723
        Height = 101
        TabOrder = 0
        object Label41: TLabel
          Left = 252
          Top = 14
          Width = 28
          Height = 13
          Caption = 'Conta'
        end
        object Label3: TLabel
          Left = 139
          Top = 14
          Width = 38
          Height = 13
          Caption = 'ou Data'
        end
        object Label1: TLabel
          Left = 524
          Top = 14
          Width = 30
          Height = 13
          Caption = 'Status'
        end
        object Label11: TLabel
          Left = 9
          Top = 14
          Width = 53
          Height = 13
          Caption = 'Nro.Lan'#231'to'
        end
        object Avulso_Conta: TComboBox
          Left = 283
          Top = 11
          Width = 234
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 2
          OnChange = Avulso_ContaChange
          OnKeyPress = Avulso_ContaKeyPress
        end
        object Avulso_Data_Inicial: TMaskEdit
          Left = 182
          Top = 11
          Width = 65
          Height = 19
          Ctl3D = False
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 1
          Text = '  /  /    '
          OnKeyPress = Avulso_Data_InicialKeyPress
        end
        object BT_Procurar: TBitBtn
          Left = 640
          Top = 9
          Width = 75
          Height = 24
          Caption = 'Procurar'
          TabOrder = 4
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
        object Avulso_Status: TComboBox
          Left = 556
          Top = 11
          Width = 81
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 3
          Text = '--- Todos ---'
          OnKeyPress = Avulso_StatusKeyPress
          Items.Strings = (
            '--- Todos ---'
            'Em Aberto'
            'Pago'
            'Pago Parcial'
            'Cancelado'
            'Devolu'#231#227'o')
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 33
          Width = 708
          Height = 60
          Caption = '   Fornecedor   '
          TabOrder = 5
          object Label6: TLabel
            Left = 4
            Top = 16
            Width = 20
            Height = 13
            Caption = 'Nro.'
          end
          object Label7: TLabel
            Left = 50
            Top = 16
            Width = 28
            Height = 13
            Caption = 'Nome'
          end
          object Avulso_Fornecedor_Numero: TEdit
            Left = 4
            Top = 31
            Width = 42
            Height = 19
            Ctl3D = False
            Enabled = False
            MaxLength = 11
            ParentCtl3D = False
            TabOrder = 0
          end
          object Avulso_Fornecedor_Nome: TEdit
            Left = 50
            Top = 31
            Width = 511
            Height = 19
            Ctl3D = False
            Enabled = False
            MaxLength = 100
            ParentCtl3D = False
            TabOrder = 1
          end
          object BT_Fornecedor: TBitBtn
            Left = 565
            Top = 28
            Width = 136
            Height = 24
            Caption = '&Procurar Fornecedor'
            TabOrder = 2
            WordWrap = True
            OnClick = BT_FornecedorClick
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
        object Avulso_Lancamento: TEdit
          Left = 69
          Top = 11
          Width = 62
          Height = 19
          Ctl3D = False
          MaxLength = 11
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Avulso_LancamentoKeyPress
        end
      end
      object Panel2: TPanel
        Left = 8
        Top = 122
        Width = 723
        Height = 163
        TabOrder = 1
        object DBGrid_Conta: TDBGrid
          Left = 8
          Top = 8
          Width = 707
          Height = 146
          Ctl3D = False
          DataSource = ConexaoBD.DS_FB_Conta_Pagar
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentCtl3D = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid_ContaCellClick
          OnDrawColumnCell = DBGrid_ContaDrawColumnCell
          OnDblClick = DBGrid_ContaDblClick
          OnMouseDown = DBGrid_ContaMouseDown
          OnMouseMove = DBGrid_ContaMouseMove
          OnMouseUp = DBGrid_ContaMouseUp
          Columns = <
            item
              Expanded = False
              FieldName = 'fb_conta_pagar_nro'
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
              FieldName = 'fb_conta_pagar_conta'
              Title.Alignment = taCenter
              Title.Caption = 'Conta'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'fb_conta_pagar_data'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fb_conta_pagar_descricao'
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fb_conta_pagar_valor_ser_pago'
              Title.Alignment = taRightJustify
              Title.Caption = 'Pagar (R$)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fb_conta_pagar_valor_juros'
              Title.Alignment = taRightJustify
              Title.Caption = 'Juros (R$)'
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
              FieldName = 'fb_conta_pagar_valor_desconto'
              Title.Alignment = taRightJustify
              Title.Caption = 'Desc.(R$)'
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
              FieldName = 'fb_conta_pagar_valor'
              Title.Alignment = taRightJustify
              Title.Caption = 'Pago (R$)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fb_conta_pagar_saldo'
              Title.Caption = 'Saldo (R$)'
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
              FieldName = 'fb_conta_pagar_status'
              Title.Alignment = taCenter
              Title.Caption = 'Status'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fb_conta_pagar_observacao'
              Title.Caption = 'Observa'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 200
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'fb_conta_pagar_data_pagto'
              Title.Alignment = taCenter
              Title.Caption = 'DT.Pagto'
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
              FieldName = 'fb_conta_pagar_fornecedor_numero'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'fb_conta_pagar_fornecedor_nome'
              Title.Caption = 'Fornecedor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fb_conta_pagar_data_emissao'
              Title.Caption = 'DT.Emiss'#227'o'
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
      object Panel3: TPanel
        Left = 8
        Top = 333
        Width = 723
        Height = 41
        TabOrder = 2
        object BT_Incluir: TBitBtn
          Left = 324
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Incluir'
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
      end
      object Panel6: TPanel
        Left = 8
        Top = 288
        Width = 723
        Height = 41
        TabOrder = 3
        object Label2: TLabel
          Left = 460
          Top = 14
          Width = 34
          Height = 13
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Avulso_Total_Pagar: TLabel
          Left = 500
          Top = 14
          Width = 38
          Height = 13
          Caption = 'R$ 0,00'
        end
        object Label4: TLabel
          Left = 6
          Top = 3
          Width = 178
          Height = 13
          Caption = 'Qtde de T'#237'tulos Selecionados: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtde_Titulos_Selecionados: TLabel
          Left = 186
          Top = 3
          Width = 6
          Height = 13
          Caption = '0'
        end
        object Label5: TLabel
          Left = 6
          Top = 19
          Width = 396
          Height = 13
          Caption = 
            'Para selecionar v'#225'rios T'#237'tulos, segure a tecla CTRL e clique nos' +
            ' T'#237'tulos Desejados.'
        end
        object Link_Baixar_Titulos: TLabel
          Left = 223
          Top = 3
          Width = 182
          Height = 13
          Cursor = crHandPoint
          Caption = '< Baixar T'#237'tulos Selecionados >'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          OnClick = Link_Baixar_TitulosClick
        end
      end
    end
  end
  object Panel7: TPanel
    Left = 4
    Top = 564
    Width = 754
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
  end
  object Panel8: TPanel
    Left = 4
    Top = 404
    Width = 753
    Height = 155
    TabOrder = 2
    object GroupBox2: TGroupBox
      Left = 6
      Top = 2
      Width = 740
      Height = 147
      Caption = '   Saldos / Valores Pagos   '
      TabOrder = 0
      object SGD_Saldos: TStringGrid
        Left = 7
        Top = 14
        Width = 726
        Height = 127
        ColCount = 4
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
        ColWidths = (
          64
          64
          64
          64)
      end
    end
  end
end
