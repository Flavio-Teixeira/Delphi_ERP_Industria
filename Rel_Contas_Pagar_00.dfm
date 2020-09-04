object RelContasPagar00: TRelContasPagar00
  Left = 192
  Top = 103
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Contas a Pagar'
  ClientHeight = 294
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 409
    Height = 233
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 6
      Width = 393
      Height = 131
      TabOrder = 0
      object Label5: TLabel
        Left = 7
        Top = 51
        Width = 56
        Height = 13
        Caption = 'Per'#237'odo de '
      end
      object Label6: TLabel
        Left = 148
        Top = 51
        Width = 16
        Height = 13
        Caption = 'At'#233
      end
      object Label41: TLabel
        Left = 269
        Top = 51
        Width = 30
        Height = 13
        Caption = 'Status'
      end
      object Label1: TLabel
        Left = 39
        Top = 78
        Width = 28
        Height = 13
        Caption = 'Conta'
      end
      object Label8: TLabel
        Left = 19
        Top = 105
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 12
        Top = 14
        Width = 53
        Height = 13
        Caption = 'Nro.Lan'#231'to'
      end
      object Label3: TLabel
        Left = 140
        Top = 14
        Width = 12
        Height = 13
        Caption = 'ou'
      end
      object Calculo_Periodo_Inicial: TMaskEdit
        Left = 72
        Top = 48
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = Calculo_Periodo_InicialKeyPress
      end
      object Calculo_Periodo_Final: TMaskEdit
        Left = 176
        Top = 48
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 2
        Text = '  /  /    '
        OnKeyPress = Calculo_Periodo_FinalKeyPress
      end
      object Calculo_Status: TComboBox
        Left = 303
        Top = 48
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
        OnKeyPress = Calculo_StatusKeyPress
        Items.Strings = (
          '--- Todos ---'
          'Em Aberto'
          'Pago'
          'Pago Parcial'
          'Cancelado'
          'Devolu'#231#227'o')
      end
      object Avulso_Conta: TComboBox
        Left = 71
        Top = 75
        Width = 313
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Avulso_ContaKeyPress
      end
      object Avulso_Descricao: TEdit
        Left = 71
        Top = 102
        Width = 312
        Height = 19
        Ctl3D = False
        MaxLength = 255
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = Avulso_DescricaoKeyPress
      end
      object Avulso_Lancamento: TEdit
        Left = 72
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
    object GroupBox1: TGroupBox
      Left = 8
      Top = 140
      Width = 393
      Height = 86
      Caption = '   Fornecedor   '
      TabOrder = 1
      object Label11: TLabel
        Left = 4
        Top = 16
        Width = 20
        Height = 13
        Caption = 'Nro.'
      end
      object Label12: TLabel
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
        Width = 335
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 1
      end
      object BT_Procurar: TBitBtn
        Left = 252
        Top = 54
        Width = 133
        Height = 24
        Caption = '&Procurar Fornecedor'
        TabOrder = 2
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
      object BT_Excluir: TBitBtn
        Left = 6
        Top = 54
        Width = 173
        Height = 25
        Caption = '&Limpar Busca por Fornecedor'
        TabOrder = 3
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
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 248
    Width = 409
    Height = 41
    TabOrder = 1
    object BT_Imprimir: TBitBtn
      Left = 167
      Top = 8
      Width = 74
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BT_ImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BT_Sair: TBitBtn
      Left = 325
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
  end
end
