object RelFichasVisitas01: TRelFichasVisitas01
  Left = 347
  Top = 222
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Fichas de Visita dos Representantes'
  ClientHeight = 457
  ClientWidth = 774
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
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object RelFichasVisitas: TQuickRep
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object DetailBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 346
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        915.458333333333300000
        1899.708333333333000000)
      BandType = rbDetail
      object QRShape1: TQRShape
        Left = 0
        Top = 6
        Width = 718
        Height = 332
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          878.416666666666800000
          0.000000000000000000
          15.875000000000000000
          1899.708333333333000000)
        Shape = qrsRectangle
      end
      object QRShape2: TQRShape
        Left = 8
        Top = 13
        Width = 703
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666666700000
          21.166666666666670000
          34.395833333333340000
          1860.020833333333000000)
        Shape = qrsRectangle
      end
      object QRLabel1: TQRLabel
        Left = 12
        Top = 17
        Width = 695
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          31.750000000000000000
          44.979166666666670000
          1838.854166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '--- Ibrasmak ---'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 12
        Top = 56
        Width = 695
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          31.750000000000000000
          148.166666666666700000
          1838.854166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'F I C H A      D E      V I S I T A '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 54
        Top = 83
        Width = 46
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          142.875000000000000000
          219.604166666666700000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Empresa:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 105
        Top = 83
        Width = 80
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          277.812500000000000000
          219.604166666666700000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_nome'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 552
        Top = 83
        Width = 29
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1460.500000000000000000
          219.604166666666700000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CNPJ:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 587
        Top = 83
        Width = 86
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1553.104166666667000000
          219.604166666666700000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_codigo'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 8
        Top = 101
        Width = 92
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          267.229166666666700000
          243.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Inscricao Estadual:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 105
        Top = 101
        Width = 145
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          277.812500000000000000
          267.229166666666700000
          383.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_inscricao_estadual'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 546
        Top = 101
        Width = 35
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1444.625000000000000000
          267.229166666666700000
          92.604166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Status:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 587
        Top = 101
        Width = 123
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1553.104166666667000000
          267.229166666666700000
          325.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_status_credito'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 8
        Top = 134
        Width = 50
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          354.541666666666700000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Endere'#231'o:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 63
        Top = 134
        Width = 100
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          166.687500000000000000
          354.541666666666700000
          264.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_endereco'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 383
        Top = 134
        Width = 68
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1013.354166666667000000
          354.541666666666700000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Complemento:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 458
        Top = 134
        Width = 117
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          354.541666666666700000
          309.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_complemento'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 25
        Top = 152
        Width = 33
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          66.145833333333330000
          402.166666666666700000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Bairro:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 63
        Top = 152
        Width = 82
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          166.687500000000000000
          402.166666666666700000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_bairro'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 414
        Top = 152
        Width = 37
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1095.375000000000000000
          402.166666666666700000
          97.895833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cidade:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 458
        Top = 152
        Width = 86
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1211.791666666667000000
          402.166666666666700000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_cidade'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 638
        Top = 152
        Width = 37
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1688.041666666667000000
          402.166666666666700000
          97.895833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Estado:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 679
        Top = 152
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1796.520833333334000000
          402.166666666666600000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_estado'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 35
        Top = 171
        Width = 23
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          92.604166666666670000
          452.437500000000000000
          60.854166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CEP:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 63
        Top = 171
        Width = 72
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          166.687500000000000000
          452.437500000000000000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_cep'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 144
        Top = 171
        Width = 82
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          381.000000000000000000
          452.437500000000000000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Telefones:  DDD:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 231
        Top = 171
        Width = 32
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          611.187500000000000000
          452.437500000000000000
          84.666666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_ddd'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 346
        Top = 171
        Width = 51
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          915.458333333333300000
          452.437500000000000000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Comercial:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 402
        Top = 171
        Width = 128
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1063.625000000000000000
          452.437500000000000000
          338.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_fone_comercial'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 338
        Top = 188
        Width = 59
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          894.291666666666700000
          497.416666666666700000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Residencial:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 402
        Top = 188
        Width = 134
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1063.625000000000000000
          497.416666666666700000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_fone_residencial'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 542
        Top = 171
        Width = 37
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1434.041666666667000000
          452.437500000000000000
          97.895833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Celular:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 554
        Top = 188
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1465.791666666667000000
          497.416666666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FAX:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 582
        Top = 171
        Width = 114
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1539.875000000000000000
          452.437500000000000000
          301.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_fone_celular'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText15: TQRDBText
        Left = 582
        Top = 188
        Width = 98
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1539.875000000000000000
          497.416666666666700000
          259.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_fone_fax'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel19: TQRLabel
        Left = 271
        Top = 171
        Width = 33
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          717.020833333333300000
          452.437500000000000000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Ramal:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText16: TQRDBText
        Left = 309
        Top = 171
        Width = 31
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          817.562500000000000000
          452.437500000000000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_fone_ramal'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 17
        Top = 190
        Width = 41
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          44.979166666666670000
          502.708333333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contato:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText17: TQRDBText
        Left = 63
        Top = 190
        Width = 90
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          166.687500000000000000
          502.708333333333300000
          238.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_contato'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel21: TQRLabel
        Left = 321
        Top = 220
        Width = 141
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          849.312500000000000000
          582.083333333333300000
          373.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Representante Respons'#225'vel:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText18: TQRDBText
        Left = 466
        Top = 220
        Width = 117
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1232.958333333333000000
          582.083333333333300000
          309.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_representante_nome'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 20
        Top = 220
        Width = 141
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          52.916666666666670000
          582.083333333333300000
          373.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Visitado em:            /             /'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 6
        Top = 239
        Width = 293
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          632.354166666666700000
          775.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tipo do Cliente: ____________________________________'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 9
        Top = 266
        Width = 112
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          703.791666666666700000
          296.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data da '#218'ltima Compra:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText19: TQRDBText
        Left = 127
        Top = 266
        Width = 150
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          336.020833333333300000
          703.791666666666700000
          396.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Ficha_Visita
        DataField = 'fb_cliente_data_ultima_compra'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 5
        Top = 284
        Width = 116
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          751.416666666666700000
          306.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor da '#218'ltima Compra:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRExpr1: TQRExpr
        Left = 126
        Top = 284
        Width = 250
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          333.375000000000000000
          751.416666666666700000
          661.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'FORMATNUMERIC('#39'R$ 0.00'#39',fb_cliente_ultimo_valor)'
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 6
        Top = 315
        Width = 252
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          833.437500000000000000
          666.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OBSERVA'#199#213'ES GERAIS: Anotar no Verso da Ficha'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 384
        Top = 241
        Width = 326
        Height = 88
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          232.833333333333400000
          1016.000000000000000000
          637.645833333333400000
          862.541666666666900000)
        Shape = qrsRectangle
      end
      object QRLabel27: TQRLabel
        Left = 502
        Top = 311
        Width = 102
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1328.208333333333000000
          822.854166666666700000
          269.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Assinatura / Carimbo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
end
