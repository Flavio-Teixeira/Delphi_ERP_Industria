object AdicionaEstrutura00: TAdicionaEstrutura00
  Left = 242
  Top = 254
  BorderStyle = bsDialog
  Caption = 'Adicionar a Estrutura do Produto'
  ClientHeight = 144
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 5
    Top = 5
    Width = 572
    Height = 88
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 5
      Top = 1
      Width = 561
      Height = 80
      Caption = '   Adi'#231#227'o de Estrutura   '
      TabOrder = 0
      object Label3: TLabel
        Left = 5
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label1: TLabel
        Left = 79
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label10: TLabel
        Left = 343
        Top = 15
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object Label2: TLabel
        Left = 455
        Top = 15
        Width = 93
        Height = 13
        Caption = 'Unidade de Medida'
      end
      object Label4: TLabel
        Left = 5
        Top = 57
        Width = 109
        Height = 13
        Caption = 'Sequ'#234'ncia de Exibi'#231#227'o'
      end
      object Label5: TLabel
        Left = 164
        Top = 57
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label6: TLabel
        Left = 230
        Top = 57
        Width = 61
        Height = 13
        Caption = 'Possui Custo'
      end
      object Label7: TLabel
        Left = 352
        Top = 57
        Width = 99
        Height = 13
        Caption = 'Vlr. Unit'#225'rio do Custo'
      end
      object fb_produto_estrutura_item_codigo: TEdit
        Left = 5
        Top = 30
        Width = 71
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        MaxLength = 50
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = fb_produto_estrutura_item_codigoKeyPress
      end
      object fb_produto_estrutura_descricao: TEdit
        Left = 79
        Top = 30
        Width = 261
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 255
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = fb_produto_estrutura_descricaoKeyPress
      end
      object fb_produto_estrutura_qtde: TEdit
        Left = 343
        Top = 30
        Width = 109
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = fb_produto_estrutura_qtdeKeyPress
      end
      object fb_produto_estrutura_medida: TEdit
        Left = 455
        Top = 30
        Width = 100
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = fb_produto_estrutura_medidaKeyPress
      end
      object fb_produto_estrutura_sequencia: TEdit
        Left = 117
        Top = 54
        Width = 28
        Height = 19
        Ctl3D = False
        MaxLength = 11
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = fb_produto_estrutura_sequenciaKeyPress
      end
      object fb_produto_estrutura_tipo: TEdit
        Left = 188
        Top = 54
        Width = 28
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = fb_produto_estrutura_tipoKeyPress
      end
      object fb_produto_estrutura_vlr_custo_unitario: TEdit
        Left = 455
        Top = 54
        Width = 100
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 7
        OnKeyPress = fb_produto_estrutura_vlr_custo_unitarioKeyPress
      end
      object fb_produto_estrutura_custo: TComboBox
        Left = 294
        Top = 54
        Width = 46
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 6
        Text = '---'
        OnKeyPress = fb_produto_estrutura_custoKeyPress
        Items.Strings = (
          '---'
          'SIM')
      end
    end
  end
  object Panel2: TPanel
    Left = 5
    Top = 96
    Width = 572
    Height = 41
    TabOrder = 1
    object BT_Incluir: TBitBtn
      Left = 165
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
    object BT_Alterar: TBitBtn
      Left = 246
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = BT_AlterarClick
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
    object BT_Excluir: TBitBtn
      Left = 326
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 2
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
    object BT_Sair: TBitBtn
      Left = 491
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
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
    object fb_produto_estrutura_numero: TEdit
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object fb_produto_estrutura_codigo: TEdit
      Left = 13
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
  end
end
