object Fixo02: TFixo02
  Left = 664
  Top = 301
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'T'#237'tulos Fixos - ALTERA'#199#195'O / EXCLUS'#195'O'
  ClientHeight = 277
  ClientWidth = 393
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
    Top = 231
    Width = 384
    Height = 41
    TabOrder = 1
    object BT_Alterar: TBitBtn
      Left = 114
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Alterar'
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
      Left = 301
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
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
      Left = 195
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
    object Fixo_Dia_ANT: TEdit
      Left = 6
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
      OnKeyPress = Fixo_DiaKeyPress
    end
    object Fixo_Descricao_ANT: TEdit
      Left = 15
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 255
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
      OnKeyPress = Fixo_DescricaoKeyPress
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 4
    Width = 384
    Height = 223
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 7
      Top = 4
      Width = 369
      Height = 121
      Caption = '  Dados do T'#237'tulo  '
      TabOrder = 0
      object Label37: TLabel
        Left = 316
        Top = 31
        Width = 47
        Height = 13
        Caption = 'Valor (R$)'
      end
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 42
        Height = 13
        Caption = 'Conta: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Fixo_Conta: TLabel
        Left = 52
        Top = 16
        Width = 310
        Height = 13
        AutoSize = False
      end
      object Label2: TLabel
        Left = 46
        Top = 31
        Width = 16
        Height = 13
        Caption = 'Dia'
      end
      object Label3: TLabel
        Left = 68
        Top = 31
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label4: TLabel
        Left = 5
        Top = 31
        Width = 20
        Height = 13
        Caption = 'Nro.'
      end
      object Fixo_Valor: TEdit
        Left = 294
        Top = 46
        Width = 71
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = Fixo_ValorKeyPress
      end
      object Fixo_Dia: TEdit
        Left = 46
        Top = 46
        Width = 20
        Height = 19
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Fixo_DiaKeyPress
      end
      object Fixo_Descricao: TEdit
        Left = 68
        Top = 46
        Width = 224
        Height = 19
        Ctl3D = False
        MaxLength = 255
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Fixo_DescricaoKeyPress
      end
      object Fixo_Nro: TEdit
        Left = 5
        Top = 46
        Width = 39
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Fixo_NroKeyPress
      end
      object Opcao_Indeterminada: TRadioButton
        Left = 21
        Top = 75
        Width = 244
        Height = 17
        Caption = 'Indeterminado (Gera lan'#231'amentos para 5 anos)'
        Checked = True
        TabOrder = 4
        TabStop = True
        OnClick = Opcao_IndeterminadaClick
      end
      object Opcao_Determinada: TRadioButton
        Left = 21
        Top = 97
        Width = 277
        Height = 17
        Caption = 'Determinado (Gera lan'#231'amentos at'#233' a data informada)'
        TabOrder = 5
        OnClick = Opcao_DeterminadaClick
      end
      object Data_Determinada: TMaskEdit
        Left = 300
        Top = 96
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 6
        Text = '  /  /    '
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 128
      Width = 368
      Height = 86
      Caption = '   Fornecedor   '
      TabOrder = 1
      object Label5: TLabel
        Left = 4
        Top = 16
        Width = 20
        Height = 13
        Caption = 'Nro.'
      end
      object Label6: TLabel
        Left = 50
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Fixo_Fornecedor_Numero: TEdit
        Left = 4
        Top = 31
        Width = 42
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 11
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Fixo_DiaKeyPress
      end
      object Fixo_Fornecedor_Nome: TEdit
        Left = 50
        Top = 31
        Width = 311
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Fixo_DescricaoKeyPress
      end
      object BT_Procurar: TBitBtn
        Left = 164
        Top = 54
        Width = 197
        Height = 24
        Caption = '&Procurar Fornecedor para V'#237'nculo'
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
      object BT_Remover: TBitBtn
        Left = 6
        Top = 54
        Width = 116
        Height = 25
        Caption = '&Remover V'#237'nculo'
        TabOrder = 3
        OnClick = BT_RemoverClick
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
end
