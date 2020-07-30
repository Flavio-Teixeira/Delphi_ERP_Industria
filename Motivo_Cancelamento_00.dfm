object MotivoCancelamento00: TMotivoCancelamento00
  Left = 357
  Top = 149
  BorderStyle = bsNone
  Caption = 'Motivo do Cancelamento'
  ClientHeight = 144
  ClientWidth = 352
  Color = clRed
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
    Top = 96
    Width = 336
    Height = 41
    TabOrder = 0
    object BT_OK: TBitBtn
      Left = 130
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BT_OKClick
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
    object OS_Numero: TEdit
      Left = 8
      Top = 14
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
    end
    object OS_CNPJ: TEdit
      Left = 16
      Top = 14
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object OS_Titulo: TEdit
      Left = 24
      Top = 14
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
    object OS_DataCriacao: TEdit
      Left = 32
      Top = 14
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
    end
    object OS_Tipo_os: TEdit
      Left = 40
      Top = 14
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 336
    Height = 88
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 321
      Height = 72
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 42
        Width = 35
        Height = 13
        Caption = 'Motivo:'
      end
      object Label5: TLabel
        Left = 8
        Top = 18
        Width = 47
        Height = 13
        Caption = 'Operador:'
      end
      object Edit_Motivo: TEdit
        Left = 64
        Top = 40
        Width = 248
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 1
      end
      object Edit_Operador: TEdit
        Left = 64
        Top = 16
        Width = 248
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
end
