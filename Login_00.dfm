object Login00: TLogin00
  Left = 292
  Top = 184
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ibrasmak - LOGIN'
  ClientHeight = 171
  ClientWidth = 324
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
  object Panel1: TPanel
    Left = 8
    Top = 120
    Width = 305
    Height = 41
    TabOrder = 1
    object btn_OK: TBitBtn
      Left = 115
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = btn_OKClick
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
    object btn_Cancel: TBitBtn
      Left = 224
      Top = 8
      Width = 73
      Height = 25
      Caption = 'Sair'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnClick = btn_CancelClick
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
    object Senha_Codigo: TEdit
      Left = 8
      Top = 8
      Width = 9
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Text = 'Senha_Codigo'
      Visible = False
    end
    object Senha_Usuario: TEdit
      Left = 16
      Top = 8
      Width = 9
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = 'Senha_Usuario'
      Visible = False
    end
    object Senha_Tipo: TEdit
      Left = 24
      Top = 8
      Width = 9
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Text = 'Senha_Tipo'
      Visible = False
    end
    object Sistema_Data_Dia: TEdit
      Left = 36
      Top = 8
      Width = 9
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
    object Sistema_Dolar_Dia: TEdit
      Left = 44
      Top = 8
      Width = 9
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
    end
  end
  object Dados_Funcionarios: TGroupBox
    Left = 8
    Top = 6
    Width = 305
    Height = 105
    Caption = 'Dados do Funcion'#225'rio'
    TabOrder = 0
    object Label1: TLabel
      Left = 34
      Top = 27
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usu'#225'rio'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 39
      Top = 51
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Senha'
      WordWrap = True
    end
    object Login_Mensagem: TLabel
      Left = 7
      Top = 72
      Width = 290
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object Usuario: TEdit
      Left = 78
      Top = 24
      Width = 193
      Height = 19
      Ctl3D = False
      MaxLength = 20
      ParentCtl3D = False
      TabOrder = 0
      OnChange = UsuarioChange
      OnKeyPress = UsuarioKeyPress
    end
    object Codigo: TEdit
      Left = 78
      Top = 48
      Width = 193
      Height = 19
      Ctl3D = False
      MaxLength = 20
      ParentCtl3D = False
      PasswordChar = '*'
      TabOrder = 1
      OnChange = CodigoChange
      OnKeyPress = CodigoKeyPress
    end
  end
end
