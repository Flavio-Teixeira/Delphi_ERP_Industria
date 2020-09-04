object QtdeFornecedores: TQtdeFornecedores
  Left = 268
  Top = 195
  BorderStyle = bsDialog
  Caption = 'Quantidade de Fornecedores'
  ClientHeight = 72
  ClientWidth = 287
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
  object Label23: TLabel
    Left = 8
    Top = 16
    Width = 244
    Height = 13
    Caption = 'Para Quantos Fornecedores Deseja Gerar Cota'#231#227'o:'
  end
  object Nro_Fornecedores: TEdit
    Left = 255
    Top = 14
    Width = 25
    Height = 19
    Ctl3D = False
    MaxLength = 2
    ParentCtl3D = False
    TabOrder = 0
    Text = '1'
    OnKeyPress = Nro_FornecedoresKeyPress
  end
  object BT_Ok: TBitBtn
    Left = 106
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
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
end
