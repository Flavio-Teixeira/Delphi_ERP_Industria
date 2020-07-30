object VHistoricoClientes01: TVHistoricoClientes01
  Left = 196
  Top = 94
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Hist'#243'rico de Clientes - CONSULTA'
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 4
    Top = 496
    Width = 753
    Height = 41
    TabOrder = 0
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
    object Nro_Tipo_Cliente: TEdit
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
    end
    object Nro_Banco: TEdit
      Left = 12
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Nro_Zona: TEdit
      Left = 20
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Nro_Representante: TEdit
      Left = 28
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object Nro_Transportadora: TEdit
      Left = 36
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
    object Nro_Cliente_Tipo_Empresa: TEdit
      Left = 44
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
    end
    object Nro_Tipo_Tabela: TEdit
      Left = 52
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 7
      Visible = False
    end
    object Nro_Pgto_Frete: TEdit
      Left = 60
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 8
      Visible = False
    end
    object Nro_Codigo_Cliente: TEdit
      Left = 68
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 9
      Visible = False
    end
    object DBG_Observacao_Papeleta: TDBMemo
      Left = 90
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_papeleta_observacao'
      DataSource = ConexaoBD.DS_FB_Papeletas
      ParentCtl3D = False
      TabOrder = 10
      Visible = False
    end
    object DBG_Observacao_Nota: TDBMemo
      Left = 98
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_nota_fiscal_observacao'
      DataSource = ConexaoBD.DS_FB_Nota_Fiscal
      ParentCtl3D = False
      TabOrder = 11
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 4
    Width = 753
    Height = 71
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 737
      Height = 58
      Caption = '  Dados do Cliente  '
      TabOrder = 0
      object Label1: TLabel
        Left = 74
        Top = 15
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 8
        Top = 15
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label4: TLabel
        Left = 291
        Top = 15
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Cliente_Mensagem_Mascara: TLabel
        Left = 121
        Top = 15
        Width = 137
        Height = 13
        Caption = 'Cliente_Mensagem_Mascara'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Cliente_Codigo_Tipo: TComboBox
        Left = 8
        Top = 30
        Width = 57
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = 'CNPJ'
        Items.Strings = (
          'CNPJ'
          'CPF'
          'RG'
          'E-Mail')
      end
      object Cliente_Razao_Social: TEdit
        Left = 291
        Top = 30
        Width = 438
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 5
      end
      object Cliente_Codigo_CNPJ: TMaskEdit
        Left = 74
        Top = 30
        Width = 110
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!99\.999\.999\/9999\-99;1;_'
        MaxLength = 18
        ParentCtl3D = False
        TabOrder = 1
        Text = '  .   .   /    -  '
        Visible = False
      end
      object Cliente_Codigo_CPF: TMaskEdit
        Left = 74
        Top = 30
        Width = 85
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!999\.999\.999\-99;1;_'
        MaxLength = 14
        ParentCtl3D = False
        TabOrder = 2
        Text = '   .   .   -  '
        Visible = False
      end
      object Cliente_Codigo_RG: TEdit
        Left = 74
        Top = 30
        Width = 112
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 4
        Visible = False
      end
      object Cliente_Codigo_EMail: TEdit
        Left = 74
        Top = 30
        Width = 214
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
      end
    end
  end
  object Panel2: TPanel
    Left = 5
    Top = 80
    Width = 753
    Height = 409
    TabOrder = 2
    object GroupBox8: TGroupBox
      Left = 8
      Top = 4
      Width = 738
      Height = 398
      Caption = '  Rela'#231#227'o de Compras  '
      TabOrder = 0
      object SGD_Compras: TStringGrid
        Left = 8
        Top = 14
        Width = 722
        Height = 375
        ColCount = 10
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
        OnDblClick = SGD_ComprasDblClick
        OnKeyPress = SGD_ComprasKeyPress
        ColWidths = (
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64)
      end
    end
  end
end
