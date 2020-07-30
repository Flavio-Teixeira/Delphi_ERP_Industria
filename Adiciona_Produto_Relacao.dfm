object AdicionaProdutoRelacao: TAdicionaProdutoRelacao
  Left = 391
  Top = 211
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Adiciona Produto na Rela'#231#227'o da OS'
  ClientHeight = 307
  ClientWidth = 692
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 4
    Top = 59
    Width = 683
    Height = 163
    TabOrder = 0
    object DBGrid_FB_Produtos: TDBGrid
      Left = 8
      Top = 8
      Width = 667
      Height = 146
      Ctl3D = False
      DataSource = ConexaoBD.DS_FB_Produtos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid_FB_ProdutosCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'fb_produto_referencia'
          Title.Caption = 'Refer'#234'ncia'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'fb_produto_codigo'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_produto_descricao'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 390
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_produto_preco'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'fb_produto_ipi'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'fb_produto_unidade'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'fb_produto_classif_fiscal'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'fb_produto_classif_tributaria'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'fb_produto_desenho'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'fb_produto_os'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'fb_produto_equipamento'
          Title.Caption = 'Equipamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fb_produto_material'
          Visible = False
        end>
    end
  end
  object Panel3: TPanel
    Left = 4
    Top = 262
    Width = 684
    Height = 41
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 301
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
    object Cliente_Tipo_Tabela: TEdit
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
    end
    object Programa_Anterior: TEdit
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
    object Nro_Fornecedor: TEdit
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
    object DBG_Produto_Descricao_Detalhada: TDBMemo
      Left = 28
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_produto_descricao_detalhada'
      DataSource = ConexaoBD.DS_FB_Produtos
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 4
    Top = 3
    Width = 683
    Height = 52
    TabOrder = 2
    object Label1: TLabel
      Left = 6
      Top = 8
      Width = 95
      Height = 13
      Caption = 'Dados para Procura'
    end
    object Label2: TLabel
      Left = 312
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Op'#231#245'es'
    end
    object Label4: TLabel
      Left = 451
      Top = 8
      Width = 21
      Height = 13
      Caption = 'Tipo'
      Visible = False
    end
    object Dados_Procura: TEdit
      Left = 6
      Top = 23
      Width = 299
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = Dados_ProcuraKeyPress
    end
    object BT_Procurar: TBitBtn
      Left = 599
      Top = 20
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
    object Opcoes_Procura: TComboBox
      Left = 312
      Top = 23
      Width = 136
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      ItemHeight = 13
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 2
      Text = 'C'#243'digo'
      OnKeyPress = Opcoes_ProcuraKeyPress
      Items.Strings = (
        'C'#243'digo'
        'Refer'#234'ncia'
        'Descri'#231#227'o'
        'Desenho'
        'OS'
        'Equipamento'
        'Material')
    end
    object Produto_Tipo: TComboBox
      Left = 451
      Top = 23
      Width = 143
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
  end
  object Panel4: TPanel
    Left = 4
    Top = 226
    Width = 684
    Height = 31
    TabOrder = 3
    object Panel5: TPanel
      Left = 4
      Top = 4
      Width = 675
      Height = 23
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 6
        Top = 5
        Width = 185
        Height = 13
        Caption = 'Quantidade de Produtos Selecionados:'
      end
      object Total_Produtos: TLabel
        Left = 195
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
