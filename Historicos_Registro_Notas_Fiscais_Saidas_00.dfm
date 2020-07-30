object HistoricosRegistroNotasFiscaisSaidas00: THistoricosRegistroNotasFiscaisSaidas00
  Left = 302
  Top = 180
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Registro de Notas Fiscais'
  ClientHeight = 543
  ClientWidth = 762
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
    Left = 4
    Top = 46
    Width = 754
    Height = 446
    TabOrder = 0
    object Panel2: TPanel
      Left = 4
      Top = 4
      Width = 745
      Height = 437
      BevelOuter = bvLowered
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 6
        Top = 2
        Width = 733
        Height = 431
        Caption = '  Notas de Sa'#237'das  '
        TabOrder = 0
        object DBG_Notas_Saidas: TDBGrid
          Left = 8
          Top = 15
          Width = 718
          Height = 381
          Ctl3D = False
          DataSource = ConexaoBD.DS_FB_Nota_Fiscal
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBG_Notas_SaidasCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'fb_nota_fiscal_numero'
              Title.Alignment = taCenter
              Title.Caption = 'Nro. Nota'
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
              FieldName = 'fb_nota_fiscal_data_emissao'
              Title.Alignment = taCenter
              Title.Caption = 'Emiss'#227'o'
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
              FieldName = 'fb_nota_fiscal_nome'
              Title.Alignment = taCenter
              Title.Caption = 'Cliente'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 420
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fb_nota_fiscal_valor_total'
              Title.Alignment = taRightJustify
              Title.Caption = 'Vlr.Total'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end>
        end
        object Panel5: TPanel
          Left = 8
          Top = 400
          Width = 718
          Height = 24
          BevelOuter = bvLowered
          TabOrder = 1
          object Label1: TLabel
            Left = 6
            Top = 5
            Width = 73
            Height = 13
            Caption = 'Total de Notas:'
          end
          object Total_Pedidos_Ibrasmak: TLabel
            Left = 86
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
    Top = 497
    Width = 754
    Height = 41
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 671
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
    object DBG_Cliente_Observacao_Nota: TDBMemo
      Left = 22
      Top = 6
      Width = 10
      Height = 19
      Ctl3D = False
      DataField = 'fb_nota_fiscal_observacao'
      DataSource = ConexaoBD.DS_FB_Nota_Fiscal
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
    end
    object DBG_Cliente_Observacao: TDBMemo
      Left = 6
      Top = 6
      Width = 10
      Height = 19
      Ctl3D = False
      DataField = 'fb_nota_fiscal_observacao_log'
      DataSource = ConexaoBD.DS_FB_Nota_Fiscal
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
  end
  object Panel4: TPanel
    Left = 4
    Top = 6
    Width = 754
    Height = 36
    TabOrder = 2
    object Label2: TLabel
      Left = 150
      Top = 11
      Width = 64
      Height = 13
      Caption = 'Nro. da Nota '
    end
    object Label3: TLabel
      Left = 357
      Top = 12
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label4: TLabel
      Left = 501
      Top = 12
      Width = 16
      Height = 13
      Caption = 'At'#233
    end
    object Label5: TLabel
      Left = 310
      Top = 11
      Width = 14
      Height = 13
      Caption = 'Ou'
    end
    object Numero_Nota: TEdit
      Left = 218
      Top = 8
      Width = 67
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = Numero_NotaKeyPress
    end
    object BT_Procurar: TBitBtn
      Left = 669
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Procurar'
      TabOrder = 1
      OnClick = BT_ProcurarClick
      Glyph.Data = {
        36050000424D360500000000000036040000280000000E000000100000000100
        08000000000000010000CA0E0000C30E00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000ACACACACACAC
        ACACACAC0000ACAC0000ACACACACACACACACAC02230500AC0000ACAC00000000
        00000223050500000000ACAC56ACACACAC02230505ACAC000000ACAC56D7D7D7
        02230505ACD7AC000000ACAC56000056AC0505ACD7D7AC000000AC56AC23AC00
        5656ACD7D7D7AC00000056D723AC23AC00ACD7D7D7D7AC0000005623D723AC23
        00ACD7D7D7D7AC00000056D723D723AC00ACD7D7D7D7AC000000AC56D723D700
        ACD7D7D7D7D7AC000000ACAC565600ACD7D7D7D7D7D7AC000000ACAC56D7D7D7
        D7D7D7D700000000FFFFACAC56D7D7D7D7D7D7D7ACD756AC0000ACAC56D7D7D7
        D7D7D7D7AC56ACAC0000ACAC565656565656565656ACACAC0000}
    end
    object Data_Inicial: TMaskEdit
      Left = 417
      Top = 8
      Width = 63
      Height = 19
      Ctl3D = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 2
      Text = '  /  /    '
      OnKeyPress = Data_InicialKeyPress
    end
    object Data_Final: TMaskEdit
      Left = 537
      Top = 8
      Width = 63
      Height = 19
      Ctl3D = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 3
      Text = '  /  /    '
      OnKeyPress = Data_FinalKeyPress
    end
  end
end
