object MapaProducao00: TMapaProducao00
  Left = 262
  Top = 157
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Mapa de Produ'#231#227'o'
  ClientHeight = 326
  ClientWidth = 423
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
    Height = 266
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 6
      Width = 393
      Height = 251
      TabOrder = 0
      object Label5: TLabel
        Left = 79
        Top = 11
        Width = 56
        Height = 13
        Caption = 'Per'#237'odo de '
      end
      object Label6: TLabel
        Left = 220
        Top = 11
        Width = 16
        Height = 13
        Caption = 'At'#233
      end
      object Label7: TLabel
        Left = 53
        Top = 223
        Width = 286
        Height = 13
        Caption = 'Para Impress'#227'o Geral N'#227'o Escolha Nenhum dos Itens Acima'
      end
      object Label8: TLabel
        Left = 101
        Top = 29
        Width = 197
        Height = 13
        Caption = '(Datas Referentes a Previs'#227'o de Entrega)'
      end
      object Calculo_Periodo_Inicial: TMaskEdit
        Left = 144
        Top = 8
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        Text = '  /  /    '
        OnKeyPress = Calculo_Periodo_InicialKeyPress
      end
      object Calculo_Periodo_Final: TMaskEdit
        Left = 248
        Top = 8
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = Calculo_Periodo_FinalKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 43
        Width = 386
        Height = 82
        Caption = '   Por Cliente   '
        TabOrder = 2
        object Label21: TLabel
          Left = 4
          Top = 15
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label3: TLabel
          Left = 115
          Top = 15
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Cliente_Codigo: TEdit
          Left = 4
          Top = 30
          Width = 109
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 11
          ParentCtl3D = False
          TabOrder = 0
        end
        object Cliente_Nome: TEdit
          Left = 115
          Top = 30
          Width = 266
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 1
        end
        object BT_Procurar: TBitBtn
          Left = 118
          Top = 53
          Width = 150
          Height = 24
          Caption = 'Procurar por Cliente'
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
      end
      object GroupBox3: TGroupBox
        Left = 4
        Top = 131
        Width = 386
        Height = 82
        Caption = '   Por Produto   '
        TabOrder = 3
        object Label1: TLabel
          Left = 5
          Top = 17
          Width = 59
          Height = 13
          Caption = 'C'#243'd.Produto'
        end
        object Label2: TLabel
          Left = 107
          Top = 17
          Width = 52
          Height = 13
          Caption = 'Refer'#234'ncia'
        end
        object Label4: TLabel
          Left = 209
          Top = 17
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object BT_Procurar_Produto: TBitBtn
          Left = 118
          Top = 54
          Width = 150
          Height = 24
          Caption = 'Procurar por Produto'
          TabOrder = 0
          WordWrap = True
          OnClick = BT_Procurar_ProdutoClick
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
        object Adiciona_Codigo_Produto: TEdit
          Left = 5
          Top = 32
          Width = 100
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 1
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
          TabOrder = 2
        end
        object Adiciona_Descricao: TEdit
          Left = 209
          Top = 32
          Width = 172
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 3
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 279
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
