object NotasFiscaisEntradas03: TNotasFiscaisEntradas03
  Left = 280
  Top = 251
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Adiciona Produtos - Nota de Entrada'
  ClientHeight = 126
  ClientWidth = 945
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
    Top = 80
    Width = 935
    Height = 41
    TabOrder = 0
    object BT_Incluir: TBitBtn
      Left = 430
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Adicionar'
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
    object BT_Sair: TBitBtn
      Left = 850
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
    object Programa_Anterior: TEdit
      Left = 7
      Top = 11
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Nro_Fornecedor: TEdit
      Left = 16
      Top = 11
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Adiciona_ARow: TEdit
      Left = 25
      Top = 11
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 4
    Top = 4
    Width = 935
    Height = 72
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 921
      Height = 59
      Caption = '  Dados do Produto  '
      TabOrder = 0
      object Label3: TLabel
        Left = 5
        Top = 17
        Width = 59
        Height = 13
        Caption = 'C'#243'd.Produto'
      end
      object Label1: TLabel
        Left = 137
        Top = 17
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 679
        Top = 17
        Width = 62
        Height = 13
        Caption = 'Vlr.Total (R$)'
      end
      object Label4: TLabel
        Left = 442
        Top = 17
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object Label5: TLabel
        Left = 71
        Top = 17
        Width = 52
        Height = 13
        Caption = 'Refer'#234'ncia'
      end
      object Label6: TLabel
        Left = 396
        Top = 17
        Width = 40
        Height = 13
        Caption = 'Unidade'
      end
      object Label7: TLabel
        Left = 797
        Top = 17
        Width = 30
        Height = 13
        Caption = 'IPI (%)'
      end
      object Label8: TLabel
        Left = 332
        Top = 17
        Width = 19
        Height = 13
        Caption = 'C.F.'
      end
      object Label9: TLabel
        Left = 364
        Top = 17
        Width = 20
        Height = 13
        Caption = 'S.T.'
      end
      object Label10: TLabel
        Left = 594
        Top = 17
        Width = 74
        Height = 13
        Caption = 'Vlr.Unit'#225'rio (R$)'
      end
      object Label11: TLabel
        Left = 860
        Top = 17
        Width = 51
        Height = 13
        Caption = 'Vlr.IPI (R$)'
      end
      object Label12: TLabel
        Left = 747
        Top = 17
        Width = 40
        Height = 13
        Caption = 'ICMS(%)'
      end
      object Label13: TLabel
        Left = 508
        Top = 17
        Width = 70
        Height = 13
        AutoSize = False
        Caption = 'Qtde Unidade'
      end
      object Adiciona_Codigo_Produto: TEdit
        Left = 5
        Top = 32
        Width = 64
        Height = 19
        Ctl3D = False
        MaxLength = 50
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Adiciona_Codigo_ProdutoKeyPress
      end
      object Adiciona_Descricao: TEdit
        Left = 137
        Top = 32
        Width = 193
        Height = 19
        Ctl3D = False
        MaxLength = 50
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Adiciona_DescricaoKeyPress
      end
      object Adiciona_Vlr_Total: TEdit
        Left = 672
        Top = 32
        Width = 73
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 9
        Text = '0,00'
        OnExit = Adiciona_Vlr_TotalExit
        OnKeyPress = Adiciona_Vlr_TotalKeyPress
      end
      object Adiciona_Quantidade: TEdit
        Left = 442
        Top = 32
        Width = 64
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 6
        Text = '0'
        OnExit = Adiciona_QuantidadeExit
        OnKeyPress = Adiciona_QuantidadeKeyPress
      end
      object Adiciona_Referencia: TEdit
        Left = 71
        Top = 32
        Width = 64
        Height = 19
        Ctl3D = False
        MaxLength = 50
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Adiciona_ReferenciaKeyPress
      end
      object Adiciona_Unidade: TEdit
        Left = 396
        Top = 32
        Width = 44
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = Adiciona_UnidadeKeyPress
      end
      object Adiciona_IPI: TEdit
        Left = 790
        Top = 32
        Width = 40
        Height = 19
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 11
        Text = '0'
        OnExit = Adiciona_IPIExit
        OnKeyPress = Adiciona_IPIKeyPress
      end
      object Adiciona_CF: TEdit
        Left = 332
        Top = 32
        Width = 30
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = Adiciona_CFKeyPress
      end
      object Adiciona_ST: TEdit
        Left = 364
        Top = 32
        Width = 30
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Adiciona_STKeyPress
      end
      object Adiciona_Vlr_Unitario: TEdit
        Left = 590
        Top = 32
        Width = 80
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 8
        Text = '0,00'
        OnExit = Adiciona_Vlr_UnitarioExit
        OnKeyPress = Adiciona_Vlr_UnitarioKeyPress
      end
      object Adiciona_Vlr_IPI: TEdit
        Left = 833
        Top = 32
        Width = 80
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 12
        Text = '0,00'
        OnExit = Adiciona_Vlr_IPIExit
        OnKeyPress = Adiciona_Vlr_IPIKeyPress
      end
      object Adiciona_ICMS: TEdit
        Left = 747
        Top = 32
        Width = 41
        Height = 19
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 10
        Text = '0'
        OnExit = Adiciona_ICMSExit
        OnKeyPress = Adiciona_ICMSKeyPress
      end
      object Adiciona_Quantidade_Unidade: TEdit
        Left = 508
        Top = 32
        Width = 79
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 7
        Text = '0'
        OnExit = Adiciona_QuantidadeExit
        OnKeyPress = Adiciona_QuantidadeKeyPress
      end
    end
  end
end
