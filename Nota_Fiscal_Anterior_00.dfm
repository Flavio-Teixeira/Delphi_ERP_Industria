object NotaFiscalAnterior00: TNotaFiscalAnterior00
  Left = 362
  Top = 317
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Manuten'#231#227'o de Nota Fiscal Anterior'
  ClientHeight = 262
  ClientWidth = 425
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 411
    Height = 201
    TabOrder = 0
    object Label7: TLabel
      Left = 8
      Top = 40
      Width = 362
      Height = 13
      Caption = 
        'Informe abaixo alguns dados da "'#218'ltima Nota Fiscal" e da "'#218'ltima' +
        ' Papeleta":'
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 60
      Width = 193
      Height = 133
      Caption = '  Nota Fiscal  '
      TabOrder = 0
      object Label10: TLabel
        Left = 33
        Top = 27
        Width = 67
        Height = 13
        Caption = 'Data da Nota:'
      end
      object Label34: TLabel
        Left = 37
        Top = 53
        Width = 64
        Height = 13
        Caption = 'Nro. da Nota:'
      end
      object Label1: TLabel
        Left = 14
        Top = 78
        Width = 86
        Height = 13
        Caption = 'Nro. da Duplicata:'
      end
      object Label2: TLabel
        Left = 18
        Top = 103
        Width = 82
        Height = 13
        Caption = 'Dia da Mudan'#231'a:'
      end
      object NF_Data_Nota: TMaskEdit
        Left = 110
        Top = 24
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        Text = '  /  /    '
        OnKeyPress = NF_Data_NotaKeyPress
      end
      object NF_Nro_Nota: TEdit
        Left = 110
        Top = 50
        Width = 50
        Height = 19
        Ctl3D = False
        MaxLength = 5
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = NF_Nro_NotaKeyPress
      end
      object NF_Nro_Duplicata: TEdit
        Left = 110
        Top = 75
        Width = 50
        Height = 19
        Ctl3D = False
        MaxLength = 5
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = NF_Nro_DuplicataKeyPress
      end
      object NF_Dia_Mudanca: TEdit
        Left = 110
        Top = 100
        Width = 20
        Height = 19
        Ctl3D = False
        MaxLength = 5
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = NF_Dia_MudancaKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 209
      Top = 60
      Width = 193
      Height = 133
      Caption = '  Papeleta  '
      TabOrder = 1
      object Label3: TLabel
        Left = 33
        Top = 27
        Width = 67
        Height = 13
        Caption = 'Data da Nota:'
      end
      object Label4: TLabel
        Left = 37
        Top = 53
        Width = 64
        Height = 13
        Caption = 'Nro. da Nota:'
      end
      object Label5: TLabel
        Left = 14
        Top = 78
        Width = 86
        Height = 13
        Caption = 'Nro. da Duplicata:'
      end
      object Label6: TLabel
        Left = 18
        Top = 103
        Width = 82
        Height = 13
        Caption = 'Dia da Mudan'#231'a:'
      end
      object Ped_Data_Nota: TMaskEdit
        Left = 110
        Top = 24
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        Text = '  /  /    '
        OnKeyPress = Ped_Data_NotaKeyPress
      end
      object Ped_Nro_Nota: TEdit
        Left = 110
        Top = 50
        Width = 50
        Height = 19
        Ctl3D = False
        MaxLength = 5
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Ped_Nro_NotaKeyPress
      end
      object Ped_Nro_Duplicata: TEdit
        Left = 110
        Top = 75
        Width = 50
        Height = 19
        Ctl3D = False
        MaxLength = 5
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Ped_Nro_DuplicataKeyPress
      end
      object Ped_Dia_Mudanca: TEdit
        Left = 110
        Top = 100
        Width = 20
        Height = 19
        Ctl3D = False
        MaxLength = 5
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = Ped_Dia_MudancaKeyPress
      end
    end
    object OPC_Ibrasmak: TRadioButton
      Left = 129
      Top = 11
      Width = 65
      Height = 17
      Caption = 'Ibrasmak'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = OPC_IbrasmakClick
    end
    object OPC_Monibras: TRadioButton
      Left = 217
      Top = 11
      Width = 65
      Height = 17
      Caption = 'Monibras'
      TabOrder = 3
      OnClick = OPC_MonibrasClick
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = 216
    Width = 411
    Height = 41
    TabOrder = 1
    object BT_Alterar: TBitBtn
      Left = 168
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
      Left = 328
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
