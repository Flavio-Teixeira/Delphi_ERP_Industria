object NotasFiscaisSaidas00: TNotasFiscaisSaidas00
  Left = 230
  Top = 199
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Notas Fiscais - SA'#205'DAS'
  ClientHeight = 359
  ClientWidth = 1034
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
    Width = 1022
    Height = 298
    TabOrder = 0
    object Panel2: TPanel
      Left = 4
      Top = 4
      Width = 1014
      Height = 290
      BevelOuter = bvLowered
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 6
        Top = 2
        Width = 498
        Height = 282
        Caption = '  Ibrasmak  '
        TabOrder = 0
        object DBG_Pedidos_Ibrasmak: TDBGrid
          Left = 2
          Top = 15
          Width = 493
          Height = 236
          Ctl3D = False
          DataSource = ConexaoBD.DS_NF_FB_Faturados
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBG_Pedidos_IbrasmakCellClick
          OnDrawColumnCell = DBG_Pedidos_IbrasmakDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'faturado_numero'
              Title.Caption = 'Nro.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'faturado_pedido_numero'
              Title.Caption = 'Pedido'
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
              FieldName = 'faturado_cliente_nome'
              Title.Caption = 'Cliente'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 220
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'faturado_cliente_tipo_faturamento'
              Title.Caption = 'Tipo Fat.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'faturado_status'
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
              Alignment = taCenter
              Expanded = False
              FieldName = 'faturado_data_entrega'
              Title.Caption = 'Entrega'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 70
              Visible = True
            end>
        end
        object Panel5: TPanel
          Left = 2
          Top = 255
          Width = 493
          Height = 24
          BevelOuter = bvLowered
          TabOrder = 1
          object Label1: TLabel
            Left = 6
            Top = 5
            Width = 83
            Height = 13
            Caption = 'Total de Pedidos:'
          end
          object Total_Pedidos_Ibrasmak: TLabel
            Left = 97
            Top = 5
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
        end
      end
      object GroupBox2: TGroupBox
        Left = 510
        Top = 2
        Width = 498
        Height = 282
        Caption = '  Monibras  '
        TabOrder = 1
        object DBG_Pedidos_Monibras: TDBGrid
          Left = 2
          Top = 15
          Width = 493
          Height = 236
          Ctl3D = False
          DataSource = ConexaoBD.DS_NF_MB_Faturados
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBG_Pedidos_MonibrasCellClick
          OnDrawColumnCell = DBG_Pedidos_MonibrasDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'faturado_numero'
              Title.Caption = 'Nro.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'faturado_pedido_numero'
              Title.Caption = 'Pedido'
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
              FieldName = 'faturado_cliente_nome'
              Title.Caption = 'Cliente'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 220
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'faturado_cliente_tipo_faturamento'
              Title.Caption = 'Tipo Fat.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'faturado_status'
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
              Alignment = taCenter
              Expanded = False
              FieldName = 'faturado_data_entrega'
              Title.Caption = 'Entrega'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 70
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 2
          Top = 255
          Width = 493
          Height = 24
          BevelOuter = bvLowered
          TabOrder = 1
          object Label2: TLabel
            Left = 6
            Top = 5
            Width = 83
            Height = 13
            Caption = 'Total de Pedidos:'
          end
          object Total_Pedidos_Monibras: TLabel
            Left = 97
            Top = 5
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
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 4
    Top = 310
    Width = 1022
    Height = 41
    TabOrder = 1
    object BT_Atualizar: TBitBtn
      Left = 473
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Atualizar'
      TabOrder = 0
      OnClick = BT_AtualizarClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000014000000120000000100
        040000000000D8000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777888888
        7777777700007487784444448877777700007448844444444487777700007444
        444CCCCC444877770000744444C77777C444877700007444447777777C448777
        00007444444777777C88877700007CCCCCCC7777777777770000777777777777
        7777777700007777777777778888887700007C888777777C4444487700007C44
        87777777C4444877000077C44877777884444877000077C44488888444444877
        0000777C4444444444CC487700007777CC444444CC77C7770000777777CCCCCC
        777777770000777777777777777777770000}
    end
    object BT_Sair: TBitBtn
      Left = 943
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
    object DBG_FB_Cliente_Observacao: TDBMemo
      Left = 39
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'faturado_cliente_observacao'
      DataSource = ConexaoBD.DS_NF_FB_Faturados
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object DBG_FB_Observacao_Logistica: TDBMemo
      Left = 47
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'pedido_observacao'
      DataSource = ConexaoBD.DS_NF_FB_Pedidos
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object DBG_FB_Observacao_Nota: TDBMemo
      Left = 55
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'faturado_nota_observacao'
      DataSource = ConexaoBD.DS_NF_FB_Faturados
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object DBG_Observacao_Fabrica: TDBMemo
      Left = 63
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'faturado_observacao_fabrica'
      DataSource = ConexaoBD.DS_NF_FB_Faturados
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
    object DBG_Observacao_Faturamento: TDBMemo
      Left = 71
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'faturado_observacao_fatura'
      DataSource = ConexaoBD.DS_NF_FB_Faturados
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
    end
    object DBG_MB_Cliente_Observacao: TDBMemo
      Left = 559
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'faturado_cliente_observacao'
      DataSource = ConexaoBD.DS_NF_MB_Faturados
      ParentCtl3D = False
      TabOrder = 7
      Visible = False
    end
    object DBG_MB_Observacao_Nota: TDBMemo
      Left = 575
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'faturado_nota_observacao'
      DataSource = ConexaoBD.DS_NF_MB_Faturados
      ParentCtl3D = False
      TabOrder = 8
      Visible = False
    end
    object DBG_MB_Observacao_Fabrica: TDBMemo
      Left = 583
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'faturado_observacao_fabrica'
      DataSource = ConexaoBD.DS_NF_MB_Faturados
      ParentCtl3D = False
      TabOrder = 9
      Visible = False
    end
    object DBG_MB_Observacao_Faturamento: TDBMemo
      Left = 591
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'faturado_observacao_fatura'
      DataSource = ConexaoBD.DS_NF_MB_Faturados
      ParentCtl3D = False
      TabOrder = 10
      Visible = False
    end
    object Tipo_Emissao_Nota: TEdit
      Left = 606
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 11
      Visible = False
    end
  end
  object Tempo_Refresh: TTimer
    Interval = 360000
    OnTimer = Tempo_RefreshTimer
    Left = 10
    Top = 316
  end
end
