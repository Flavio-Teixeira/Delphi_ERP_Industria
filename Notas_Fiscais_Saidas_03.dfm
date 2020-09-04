object NotasFiscaisSaidas03: TNotasFiscaisSaidas03
  Left = 294
  Top = 181
  BorderStyle = bsDialog
  Caption = 'Impress'#227'o de Outra Nota Fiscal'
  ClientHeight = 66
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 4
    Top = 4
    Width = 801
    Height = 60
    TabOrder = 0
    object Label24: TLabel
      Left = 6
      Top = 33
      Width = 23
      Height = 13
      Caption = 'Qtde'
    end
    object Label25: TLabel
      Left = 66
      Top = 33
      Width = 38
      Height = 13
      Caption = 'Esp'#233'cie'
    end
    object Label26: TLabel
      Left = 275
      Top = 33
      Width = 30
      Height = 13
      Caption = 'Marca'
    end
    object Label27: TLabel
      Left = 476
      Top = 33
      Width = 52
      Height = 13
      Caption = 'Peso Bruto'
    end
    object Label36: TLabel
      Left = 587
      Top = 33
      Width = 63
      Height = 13
      Caption = 'Peso L'#237'quido'
    end
    object Label1: TLabel
      Left = 42
      Top = 8
      Width = 717
      Height = 13
      Caption = 
        'ATEN'#199#195'O: Devido ao Grande N'#250'mero de Produtos o Sistema Emitir'#225' u' +
        'm Outra Nota Fiscal, por favor, Preencha as Informa'#231#245'es Abaixo e' +
        ' Clique em Ok.'
    end
    object Qtde_Volume: TEdit
      Left = 32
      Top = 30
      Width = 26
      Height = 19
      Ctl3D = False
      MaxLength = 3
      ParentCtl3D = False
      TabOrder = 0
      Text = '1'
      OnKeyPress = Qtde_VolumeKeyPress
    end
    object Especie: TEdit
      Left = 107
      Top = 30
      Width = 160
      Height = 19
      Ctl3D = False
      MaxLength = 40
      ParentCtl3D = False
      TabOrder = 1
      Text = 'CAIXA'
      OnKeyPress = EspecieKeyPress
    end
    object Marca: TEdit
      Left = 308
      Top = 30
      Width = 160
      Height = 19
      Ctl3D = False
      MaxLength = 40
      ParentCtl3D = False
      TabOrder = 2
      Text = 'IBRASMAK'
      OnKeyPress = MarcaKeyPress
    end
    object Peso_Bruto: TEdit
      Left = 531
      Top = 30
      Width = 48
      Height = 19
      Ctl3D = False
      MaxLength = 7
      ParentCtl3D = False
      TabOrder = 3
      OnKeyPress = Peso_BrutoKeyPress
    end
    object Peso_Liquido: TEdit
      Left = 653
      Top = 30
      Width = 48
      Height = 19
      Ctl3D = False
      MaxLength = 7
      ParentCtl3D = False
      TabOrder = 4
      OnKeyPress = Peso_LiquidoKeyPress
    end
    object BT_Ok: TBitBtn
      Left = 719
      Top = 27
      Width = 75
      Height = 25
      Caption = '&Ok'
      TabOrder = 5
      OnClick = BT_OkClick
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
    object Retorno: TEdit
      Left = 0
      Top = 6
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 3
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
      OnKeyPress = Qtde_VolumeKeyPress
    end
  end
end
