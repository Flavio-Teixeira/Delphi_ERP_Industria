object EstoqueExclusao00: TEstoqueExclusao00
  Left = 226
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Exclus'#227'o do Movimento de Estoque'
  ClientHeight = 356
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 8
    Top = 310
    Width = 284
    Height = 41
    TabOrder = 0
    object BT_Sair: TBitBtn
      Left = 202
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
    object BT_Excluir: TBitBtn
      Left = 81
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
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
  object Panel1: TPanel
    Left = 8
    Top = 7
    Width = 284
    Height = 298
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 8
      Top = 4
      Width = 268
      Height = 43
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 17
        Width = 114
        Height = 13
        Caption = 'N'#250'mero do Lan'#231'amento'
      end
      object Movto_Lancto: TEdit
        Left = 126
        Top = 14
        Width = 51
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 11
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Movto_LanctoKeyPress
      end
      object BT_Buscar: TBitBtn
        Left = 182
        Top = 11
        Width = 80
        Height = 25
        Caption = 'Procurar'
        TabOrder = 1
        OnClick = BT_BuscarClick
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
    object GroupBox1: TGroupBox
      Left = 8
      Top = 49
      Width = 268
      Height = 240
      Caption = '   Dados do Lan'#231'amento   '
      TabOrder = 1
      object Label1: TLabel
        Left = 36
        Top = 63
        Width = 82
        Height = 13
        Caption = 'Nro. Lan'#231'amento'
      end
      object Label3: TLabel
        Left = 19
        Top = 85
        Width = 99
        Height = 13
        Caption = 'Nro. Nota / Papeleta'
      end
      object Label4: TLabel
        Left = 61
        Top = 107
        Width = 57
        Height = 13
        Caption = 'Saldo Inicial'
      end
      object Label5: TLabel
        Left = 95
        Top = 129
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label6: TLabel
        Left = 66
        Top = 151
        Width = 52
        Height = 13
        Caption = 'Movimento'
      end
      object Label7: TLabel
        Left = 63
        Top = 173
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object Label8: TLabel
        Left = 71
        Top = 195
        Width = 47
        Height = 13
        Caption = 'Valor (R$)'
      end
      object Label9: TLabel
        Left = 5
        Top = 217
        Width = 113
        Height = 13
        Caption = 'Depto/Funcion'#225'rio/Obs'
      end
      object Label10: TLabel
        Left = 60
        Top = 19
        Width = 59
        Height = 13
        Caption = 'Cod.Produto'
      end
      object Label11: TLabel
        Left = 31
        Top = 41
        Width = 88
        Height = 13
        Caption = 'Descri'#231#227'o Produto'
      end
      object Movto_Nro_Lancto: TEdit
        Left = 122
        Top = 60
        Width = 140
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        OnKeyPress = Movto_Nro_LanctoKeyPress
      end
      object Movto_Nota: TEdit
        Left = 122
        Top = 82
        Width = 140
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        OnKeyPress = Movto_NotaKeyPress
      end
      object Movto_Saldo: TEdit
        Left = 122
        Top = 104
        Width = 140
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
        OnKeyPress = Movto_SaldoKeyPress
      end
      object Movto_Data: TEdit
        Left = 122
        Top = 126
        Width = 140
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
        OnKeyPress = Movto_DataKeyPress
      end
      object Movto_Movimento: TEdit
        Left = 122
        Top = 148
        Width = 140
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
        OnKeyPress = Movto_MovimentoKeyPress
      end
      object Movto_Qtde: TEdit
        Left = 122
        Top = 170
        Width = 140
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
        OnKeyPress = Movto_QtdeKeyPress
      end
      object Movto_Valor: TEdit
        Left = 122
        Top = 192
        Width = 140
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 8
        OnKeyPress = Movto_ValorKeyPress
      end
      object Movto_Obs: TEdit
        Left = 122
        Top = 214
        Width = 140
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
        OnKeyPress = Movto_ObsKeyPress
      end
      object Movto_Descricao: TEdit
        Left = 122
        Top = 38
        Width = 140
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = Movto_NotaKeyPress
      end
      object Movto_Codigo: TEdit
        Left = 122
        Top = 16
        Width = 140
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        OnKeyPress = Movto_Nro_LanctoKeyPress
      end
    end
  end
end
