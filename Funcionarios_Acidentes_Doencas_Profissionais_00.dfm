object FuncionariosAcidentesDoencasProfissionais00: TFuncionariosAcidentesDoencasProfissionais00
  Left = 334
  Top = 577
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Funcion'#225'rios - Acidentes / Doen'#231'as Profissionais'
  ClientHeight = 144
  ClientWidth = 575
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 8
    Top = 96
    Width = 560
    Height = 40
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object BT_Incluir: TBitBtn
      Left = 242
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Adicionar'
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
    object BT_Sair: TBitBtn
      Left = 478
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
    object ED_Codigo: TEdit
      Left = 8
      Top = 8
      Width = 9
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object ED_Funcionario: TEdit
      Left = 16
      Top = 8
      Width = 9
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 560
    Height = 80
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 544
      Height = 64
      Caption = 'Altera'#231#227'o de Sal'#225'rio'
      TabOrder = 0
      object Label3: TLabel
        Left = 232
        Top = 16
        Width = 91
        Height = 13
        Caption = 'Acidente / Doen'#231'a'
      end
      object Label8: TLabel
        Left = 16
        Top = 16
        Width = 57
        Height = 13
        Caption = 'Ocorrido em'
      end
      object Label1: TLabel
        Left = 120
        Top = 16
        Width = 35
        Height = 13
        Caption = 'Alta em'
      end
      object ED_Acidente_Doenca_Profissional_Titulo: TEdit
        Left = 232
        Top = 30
        Width = 296
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 2
      end
      object ED_Acidente_Doenca_Profissional_Ocorrido: TMaskEdit
        Left = 16
        Top = 30
        Width = 64
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        Text = '  /  /    '
      end
      object ED_Acidente_Doenca_Profissional_Alta: TMaskEdit
        Left = 120
        Top = 30
        Width = 64
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
      end
    end
  end
end
