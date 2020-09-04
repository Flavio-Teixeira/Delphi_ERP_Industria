object AdicionaQtdeProduto02: TAdicionaQtdeProduto02
  Left = 422
  Top = 233
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Adicionar a Quantidade no Produto Selecionado'
  ClientHeight = 293
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
  object Panel3: TPanel
    Left = 4
    Top = 247
    Width = 754
    Height = 41
    TabOrder = 1
    object Label15: TLabel
      Left = 6
      Top = 7
      Width = 320
      Height = 26
      Caption = 
        'OBS.: Na Descri'#231#227'o Detalhada para separar um assunto de outro ut' +
        'ilize o s'#237'mbolo "||". Caso queira pular 3 linhas utilize o s'#237'mbo' +
        'lo "#".'
      WordWrap = True
    end
    object BT_Adicionar: TBitBtn
      Left = 336
      Top = 8
      Width = 82
      Height = 25
      Caption = '&Adicionar'
      TabOrder = 0
      OnClick = BT_AdicionarClick
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
      Left = 673
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
    object Adiciona_ACol: TEdit
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Adiciona_ARow: TEdit
      Left = 12
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Programa_Anterior: TEdit
      Left = 20
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 100
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object Adiciona_Nro_Ctrl_Estoque: TEdit
      Left = 36
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
    object Adiciona_Nro_Nota_Estoque: TEdit
      Left = 44
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
    end
    object Adiciona_Tabela_Estoque: TEdit
      Left = 52
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
      Visible = False
    end
    object Adiciona_Lote_Estoque: TEdit
      Left = 60
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
      Visible = False
    end
    object Adiciona_Tipo_Faturamento: TEdit
      Left = 68
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
      Visible = False
    end
    object Adiciona_Quantidade_ANT: TEdit
      Left = 76
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
      Visible = False
    end
    object Adiciona_Valor_IPI: TEdit
      Left = 92
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 11
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 4
    Top = 4
    Width = 754
    Height = 237
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 739
      Height = 225
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
        Left = 209
        Top = 17
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 684
        Top = 17
        Width = 47
        Height = 13
        Caption = 'Valor (R$)'
      end
      object Label4: TLabel
        Left = 443
        Top = 17
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object Label5: TLabel
        Left = 107
        Top = 17
        Width = 52
        Height = 13
        Caption = 'Refer'#234'ncia'
      end
      object Label6: TLabel
        Left = 570
        Top = 17
        Width = 40
        Height = 13
        Caption = 'Unidade'
      end
      object Label7: TLabel
        Left = 616
        Top = 17
        Width = 13
        Height = 13
        Caption = 'IPI'
      end
      object Label8: TLabel
        Left = 501
        Top = 17
        Width = 38
        Height = 13
        Caption = 'CL.Fisc.'
      end
      object Label9: TLabel
        Left = 543
        Top = 17
        Width = 20
        Height = 13
        Caption = 'S.T.'
      end
      object Label10: TLabel
        Left = 163
        Top = 57
        Width = 43
        Height = 13
        Caption = 'Desenho'
      end
      object Label11: TLabel
        Left = 267
        Top = 57
        Width = 15
        Height = 13
        Caption = 'OS'
      end
      object Label12: TLabel
        Left = 371
        Top = 57
        Width = 62
        Height = 13
        Caption = 'Equipamento'
      end
      object Label13: TLabel
        Left = 475
        Top = 57
        Width = 37
        Height = 13
        Caption = 'Material'
      end
      object Label14: TLabel
        Left = 579
        Top = 57
        Width = 82
        Height = 13
        Caption = 'Prazo de Entrega'
      end
      object Adiciona_Codigo_Produto: TEdit
        Left = 5
        Top = 32
        Width = 100
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Adiciona_Codigo_ProdutoKeyPress
      end
      object Adiciona_Descricao: TEdit
        Left = 209
        Top = 32
        Width = 232
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Adiciona_DescricaoKeyPress
      end
      object Adiciona_Valor_Unitario: TEdit
        Left = 653
        Top = 32
        Width = 80
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 8
        OnExit = Adiciona_Valor_UnitarioExit
        OnKeyPress = Adiciona_Valor_UnitarioKeyPress
      end
      object Adiciona_Quantidade: TEdit
        Left = 443
        Top = 32
        Width = 56
        Height = 19
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 3
        OnExit = Adiciona_QuantidadeExit
        OnKeyPress = Adiciona_QuantidadeKeyPress
      end
      object Adiciona_Referencia: TEdit
        Left = 107
        Top = 32
        Width = 100
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Adiciona_ReferenciaKeyPress
      end
      object Adiciona_Unidade: TEdit
        Left = 570
        Top = 32
        Width = 44
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = Adiciona_UnidadeKeyPress
      end
      object Adiciona_IPI: TEdit
        Left = 616
        Top = 32
        Width = 35
        Height = 19
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 7
        OnExit = Adiciona_IPIExit
        OnKeyPress = Adiciona_IPIKeyPress
      end
      object Adiciona_CF: TEdit
        Left = 501
        Top = 32
        Width = 40
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 1
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Adiciona_CFKeyPress
      end
      object Adiciona_ST: TEdit
        Left = 543
        Top = 32
        Width = 25
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = Adiciona_STKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 5
        Top = 95
        Width = 729
        Height = 124
        Caption = '   Descri'#231#227'o Detalhada   '
        TabOrder = 14
        object Adiciona_Descricao_Detalhada: TMemo
          Left = 8
          Top = 15
          Width = 714
          Height = 100
          Ctl3D = False
          ParentCtl3D = False
          ScrollBars = ssVertical
          TabOrder = 0
          WantReturns = False
        end
      end
      object Adiciona_Desenho: TEdit
        Left = 163
        Top = 72
        Width = 100
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 9
        OnKeyPress = Adiciona_ReferenciaKeyPress
      end
      object Adiciona_OS: TEdit
        Left = 267
        Top = 72
        Width = 100
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 10
        OnKeyPress = Adiciona_ReferenciaKeyPress
      end
      object Adiciona_Equipamento: TEdit
        Left = 371
        Top = 72
        Width = 100
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 11
        OnKeyPress = Adiciona_ReferenciaKeyPress
      end
      object Adiciona_Material: TEdit
        Left = 475
        Top = 72
        Width = 100
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 12
        OnKeyPress = Adiciona_ReferenciaKeyPress
      end
      object Adiciona_Prazo_Entrega: TMaskEdit
        Left = 579
        Top = 72
        Width = 86
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 13
        Text = '  /  /    '
      end
    end
  end
end
