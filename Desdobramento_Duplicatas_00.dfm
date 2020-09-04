object DesdobramentoDuplicatas00: TDesdobramentoDuplicatas00
  Left = 277
  Top = 155
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Desdobramento de Duplicatas'
  ClientHeight = 384
  ClientWidth = 385
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 4
    Top = 4
    Width = 376
    Height = 41
    TabOrder = 0
    object Label13: TLabel
      Left = 10
      Top = 14
      Width = 91
      Height = 13
      Caption = 'Nro. da Nota Fiscal'
    end
    object Numero_Nota: TEdit
      Left = 112
      Top = 11
      Width = 57
      Height = 19
      Ctl3D = False
      MaxLength = 7
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = Numero_NotaKeyPress
    end
    object BT_Procurar: TBitBtn
      Left = 283
      Top = 8
      Width = 84
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
  end
  object Desdobramento_Principal: TPanel
    Left = 4
    Top = 51
    Width = 376
    Height = 282
    Enabled = False
    TabOrder = 1
    object Label47: TLabel
      Left = 8
      Top = 20
      Width = 110
      Height = 13
      Caption = 'Condi'#231#227'o de Pgto (DD)'
    end
    object Label10: TLabel
      Left = 8
      Top = 49
      Width = 46
      Height = 13
      Caption = 'Sub-Total'
    end
    object Label11: TLabel
      Left = 136
      Top = 49
      Width = 46
      Height = 13
      Caption = 'Desconto'
    end
    object Label14: TLabel
      Left = 270
      Top = 49
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object Label16: TLabel
      Left = 208
      Top = 2
      Width = 53
      Height = 13
      Caption = 'Dt.Emiss'#227'o'
    end
    object Condicao_Pgto_1: TEdit
      Left = 122
      Top = 17
      Width = 18
      Height = 19
      Ctl3D = False
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = Condicao_Pgto_1KeyPress
    end
    object Condicao_Pgto_2: TEdit
      Left = 142
      Top = 17
      Width = 18
      Height = 19
      Ctl3D = False
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 1
      OnKeyPress = Condicao_Pgto_2KeyPress
    end
    object Condicao_Pgto_3: TEdit
      Left = 162
      Top = 17
      Width = 18
      Height = 19
      Ctl3D = False
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 2
      OnKeyPress = Condicao_Pgto_3KeyPress
    end
    object Desdobramento_1: TGroupBox
      Left = 8
      Top = 78
      Width = 359
      Height = 42
      Caption = '  1o. Desdobramento  '
      Enabled = False
      TabOrder = 9
      object Label12: TLabel
        Left = 130
        Top = 18
        Width = 48
        Height = 13
        Caption = 'Dt.Vencto'
      end
      object Label15: TLabel
        Left = 8
        Top = 18
        Width = 45
        Height = 13
        Caption = 'Duplicata'
      end
      object Label1: TLabel
        Left = 256
        Top = 18
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Vencto_1: TMaskEdit
        Left = 181
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = Vencto_1KeyPress
      end
      object Duplicata_1: TEdit
        Left = 56
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 0
      end
      object Valor_1: TEdit
        Left = 283
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Valor_1KeyPress
      end
    end
    object BT_Confirmar: TBitBtn
      Left = 281
      Top = 10
      Width = 84
      Height = 25
      Caption = '&Confirmar'
      TabOrder = 5
      OnClick = BT_ConfirmarClick
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
    object Desdobramento_2: TGroupBox
      Left = 8
      Top = 128
      Width = 359
      Height = 42
      Caption = '  2o. Desdobramento  '
      Enabled = False
      TabOrder = 10
      object Label3: TLabel
        Left = 130
        Top = 18
        Width = 48
        Height = 13
        Caption = 'Dt.Vencto'
      end
      object Label5: TLabel
        Left = 8
        Top = 18
        Width = 45
        Height = 13
        Caption = 'Duplicata'
      end
      object Label6: TLabel
        Left = 256
        Top = 18
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Vencto_2: TMaskEdit
        Left = 181
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = Vencto_2KeyPress
      end
      object Duplicata_2: TEdit
        Left = 56
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 0
      end
      object Valor_2: TEdit
        Left = 283
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Valor_2KeyPress
      end
    end
    object Desdobramento_3: TGroupBox
      Left = 8
      Top = 178
      Width = 359
      Height = 42
      Caption = '  3o. Desdobramento  '
      Enabled = False
      TabOrder = 11
      object Label7: TLabel
        Left = 130
        Top = 18
        Width = 48
        Height = 13
        Caption = 'Dt.Vencto'
      end
      object Label8: TLabel
        Left = 8
        Top = 18
        Width = 45
        Height = 13
        Caption = 'Duplicata'
      end
      object Label9: TLabel
        Left = 256
        Top = 18
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Vencto_3: TMaskEdit
        Left = 181
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = Vencto_3KeyPress
      end
      object Duplicata_3: TEdit
        Left = 56
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 0
      end
      object Valor_3: TEdit
        Left = 283
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Valor_3KeyPress
      end
    end
    object SubTotal: TEdit
      Left = 58
      Top = 46
      Width = 65
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 6
    end
    object Desconto: TEdit
      Left = 186
      Top = 46
      Width = 65
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 7
    end
    object Total: TEdit
      Left = 298
      Top = 46
      Width = 65
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 8
    end
    object Data_Emissao: TMaskEdit
      Left = 208
      Top = 17
      Width = 65
      Height = 19
      Ctl3D = False
      Enabled = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 4
      Text = '  /  /    '
      OnKeyPress = Vencto_1KeyPress
    end
    object Desdobramento_4: TGroupBox
      Left = 8
      Top = 230
      Width = 359
      Height = 42
      Caption = '  4o. Desdobramento  '
      Enabled = False
      TabOrder = 12
      object Label17: TLabel
        Left = 130
        Top = 18
        Width = 48
        Height = 13
        Caption = 'Dt.Vencto'
      end
      object Label18: TLabel
        Left = 8
        Top = 18
        Width = 45
        Height = 13
        Caption = 'Duplicata'
      end
      object Label19: TLabel
        Left = 256
        Top = 18
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Vencto_4: TMaskEdit
        Left = 181
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = Vencto_3KeyPress
      end
      object Duplicata_4: TEdit
        Left = 56
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 0
      end
      object Valor_4: TEdit
        Left = 283
        Top = 15
        Width = 65
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Valor_3KeyPress
      end
    end
    object Condicao_Pgto_4: TEdit
      Left = 182
      Top = 17
      Width = 18
      Height = 19
      Ctl3D = False
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 3
      OnKeyPress = Condicao_Pgto_4KeyPress
    end
  end
  object Panel3: TPanel
    Left = 4
    Top = 338
    Width = 376
    Height = 41
    TabOrder = 2
    object BT_Alterar: TBitBtn
      Left = 150
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Alterar'
      Enabled = False
      TabOrder = 0
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
    object BT_Sair: TBitBtn
      Left = 293
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
    object Forma_1: TEdit
      Left = 8
      Top = 7
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object Forma_2: TEdit
      Left = 16
      Top = 7
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object Forma_3: TEdit
      Left = 24
      Top = 7
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object Forma_4: TEdit
      Left = 32
      Top = 7
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 80
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
  end
end
