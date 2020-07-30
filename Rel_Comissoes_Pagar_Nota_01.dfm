object RelComissoesPagarNota01: TRelComissoesPagarNota01
  Left = 277
  Top = 156
  Width = 791
  Height = 375
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'C'#225'lculo das Comiss'#245'es a Pagar - NOTAS FISCAIS'
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
  object RelComissoesNota: TQuickRep
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = ConexaoBD.SQL_Rel_Comissoes_Nota
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
    object QRGroup1: TQRGroup
      Left = 38
      Top = 114
      Width = 718
      Height = 53
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        140.229166666666700000
        1899.708333333333000000)
      Expression = 'fb_representante_codigo'
      FooterBand = PageFooterBand1
      Master = RelComissoesNota
      ReprintOnNewPage = False
      object QRDBText1: TQRDBText
        Left = 86
        Top = 3
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          227.541666666666700000
          7.937500000000000000
          108.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Comissoes_Nota
        DataField = 'fb_representante_codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 142
        Top = 3
        Width = 135
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          375.708333333333400000
          7.937500000000000000
          357.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Comissoes_Nota
        DataField = 'fb_representante_nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 8
        Top = 3
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          7.937500000000000000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Representante:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 131
        Top = 4
        Width = 5
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          346.604166666666700000
          10.583333333333330000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '-'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 8
        Top = 35
        Width = 43
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          92.604166666666680000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nro.Nota'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 60
        Top = 36
        Width = 33
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          158.750000000000000000
          95.250000000000000000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cliente'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 196
        Top = 36
        Width = 45
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          518.583333333333400000
          95.250000000000000000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Duplicata'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 249
        Top = 36
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          658.812500000000000000
          95.250000000000000000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dt.Emiss'#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 310
        Top = 36
        Width = 49
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          820.208333333333500000
          95.250000000000000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dt.Vencto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 375
        Top = 36
        Width = 35
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          992.187500000000000000
          95.250000000000000000
          92.604166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dt.Pgto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 443
        Top = 36
        Width = 40
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1172.104166666667000000
          95.250000000000000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vlr.Nota'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 490
        Top = 36
        Width = 62
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1296.458333333333000000
          95.250000000000000000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vlr.Duplicata'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 564
        Top = 36
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1492.250000000000000000
          95.250000000000000000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vlr.Pago'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 618
        Top = 36
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1635.125000000000000000
          95.250000000000000000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vlr.ICMS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 665
        Top = 36
        Width = 48
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1759.479166666667000000
          95.250000000000000000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Comiss'#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 167
      Width = 718
      Height = 75
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        198.437500000000000000
        1899.708333333333000000)
      BandType = rbDetail
      object QRDBText3: TQRDBText
        Left = 8
        Top = 4
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Comissoes_Nota
        DataField = 'fb_nota_fiscal_numero'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 60
        Top = 4
        Width = 304
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          158.750000000000000000
          10.583333333333330000
          804.333333333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Comissoes_Nota
        DataField = 'fb_nota_fiscal_nome'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Valor_ICMS: TQRExpr
        Left = 614
        Top = 22
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1624.541666666667000000
          58.208333333333340000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',if(fb_nota_fiscal_comissao' +
          '_1 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',IF(fb_representante_icms ='#39'S'#39',IF(n' +
          't_nota_fiscal_estado ='#39'SP'#39',fb_nota_fiscal_dup_vlr_pgto_1 * 0.18,' +
          'IF((fb_nota_fiscal_estado ='#39'RS'#39') or (fb_nota_fiscal_estado ='#39'SC'#39 +
          ') or (fb_nota_fiscal_estado ='#39'PR'#39') or (fb_nota_fiscal_estado ='#39'R' +
          'J'#39') or (fb_nota_fiscal_estado ='#39'MG'#39') or (fb_nota_fiscal_estado =' +
          #39'MT'#39') or (fb_nota_fiscal_estado ='#39'MS'#39'),fb_nota_fiscal_dup_vlr_pg' +
          'to_1 * 0.12,fb_nota_fiscal_dup_vlr_pgto_1 * 0.07)),0)),'#39'-'#39'),'#39#39')'
        FontSize = 8
      end
      object Rel_Comissao_1: TQRExpr
        Left = 667
        Top = 22
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1764.770833333333000000
          58.208333333333340000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',if(fb_nota_fiscal_comissao' +
          '_1 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',(fb_nota_fiscal_dup_vlr_pgto_1 - (' +
          'IF(fb_representante_icms ='#39'S'#39',IF(fb_nota_fiscal_estado ='#39'SP'#39',fb_' +
          'nota_fiscal_dup_vlr_pgto_1 * 0.18,IF((fb_nota_fiscal_estado ='#39'RS' +
          #39') or (fb_nota_fiscal_estado ='#39'SC'#39') or (fb_nota_fiscal_estado ='#39 +
          'PR'#39') or (fb_nota_fiscal_estado ='#39'RJ'#39') or (fb_nota_fiscal_estado ' +
          '='#39'MG'#39') or (fb_nota_fiscal_estado ='#39'MT'#39') or (fb_nota_fiscal_estad' +
          'o ='#39'MS'#39'),fb_nota_fiscal_dup_vlr_pgto_1 * 0.12,fb_nota_fiscal_dup' +
          '_vlr_pgto_1 * 0.07)),0))) * (fb_representante_1_porcentagem / 10' +
          '0)),'#39'-'#39'),'#39#39')'
        FontSize = 8
      end
      object QRExpr5: TQRExpr
        Left = 202
        Top = 22
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333400000
          58.208333333333340000
          103.187500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',fb_nota_fiscal_dup_nro_1,'#39 +
          #39')'
        FontSize = 8
      end
      object QRExpr6: TQRExpr
        Left = 248
        Top = 22
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          656.166666666666800000
          58.208333333333340000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',fb_nota_fiscal_data_emissa' +
          'o,'#39#39')'
        FontSize = 8
      end
      object QRExpr7: TQRExpr
        Left = 309
        Top = 22
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          817.562500000000000000
          58.208333333333340000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',fb_nota_fiscal_dup_dt_vcto' +
          '_1,'#39#39')'
        FontSize = 8
      end
      object QRExpr8: TQRExpr
        Left = 375
        Top = 22
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          992.187500000000000000
          58.208333333333340000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',fb_nota_fiscal_dup_dt_pgto' +
          '_1,'#39#39')'
        FontSize = 8
      end
      object QRExpr9: TQRExpr
        Left = 437
        Top = 4
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1156.229166666667000000
          10.583333333333330000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'FORMATNUMERIC('#39'0.00'#39',fb_nota_fiscal_valor_total)'
        FontSize = 8
      end
      object QRExpr10: TQRExpr
        Left = 506
        Top = 22
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1338.791666666667000000
          58.208333333333340000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',fb_no' +
          'ta_fiscal_dup_vlr_1),'#39#39')'
        FontSize = 8
      end
      object QRExpr11: TQRExpr
        Left = 560
        Top = 22
        Width = 46
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1481.666666666667000000
          58.208333333333340000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',if(fb_nota_fiscal_comissao' +
          '_1 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',fb_nota_fiscal_dup_vlr_pgto_1),'#39'-'#39 +
          '),'#39#39')'
        FontSize = 8
      end
      object QRExpr1: TQRExpr
        Left = 202
        Top = 39
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333400000
          103.187500000000000000
          103.187500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_2 = '#39'S'#39',fb_nota_fiscal_dup_nro_2,'#39 +
          #39')'
        FontSize = 8
      end
      object QRExpr2: TQRExpr
        Left = 248
        Top = 39
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          656.166666666666800000
          103.187500000000000000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_2 = '#39'S'#39',fb_nota_fiscal_data_emissa' +
          'o,'#39#39')'
        FontSize = 8
      end
      object QRExpr12: TQRExpr
        Left = 309
        Top = 39
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          817.562500000000000000
          103.187500000000000000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_2 = '#39'S'#39',fb_nota_fiscal_dup_dt_vcto' +
          '_2,'#39#39')'
        FontSize = 8
      end
      object QRExpr13: TQRExpr
        Left = 375
        Top = 39
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          992.187500000000000000
          103.187500000000000000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_2 = '#39'S'#39',fb_nota_fiscal_dup_dt_pgto' +
          '_2,'#39#39')'
        FontSize = 8
      end
      object QRExpr15: TQRExpr
        Left = 506
        Top = 39
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1338.791666666667000000
          103.187500000000000000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_2 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',fb_no' +
          'ta_fiscal_dup_vlr_2),'#39#39')'
        FontSize = 8
      end
      object QRExpr16: TQRExpr
        Left = 560
        Top = 39
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          103.187500000000000000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_2 = '#39'S'#39',if(fb_nota_fiscal_comissao' +
          '_2 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',fb_nota_fiscal_dup_vlr_pgto_2),'#39'-'#39 +
          '),'#39#39')'
        FontSize = 8
      end
      object QRExpr17: TQRExpr
        Left = 614
        Top = 39
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1624.541666666667000000
          103.187500000000000000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_2 = '#39'S'#39',if(fb_nota_fiscal_comissao' +
          '_2 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',IF(fb_representante_icms ='#39'S'#39',IF(n' +
          't_nota_fiscal_estado ='#39'SP'#39',fb_nota_fiscal_dup_vlr_pgto_2 * 0.18,' +
          'IF((fb_nota_fiscal_estado ='#39'RS'#39') or (fb_nota_fiscal_estado ='#39'SC'#39 +
          ') or (fb_nota_fiscal_estado ='#39'PR'#39') or (fb_nota_fiscal_estado ='#39'R' +
          'J'#39') or (fb_nota_fiscal_estado ='#39'MG'#39') or (fb_nota_fiscal_estado =' +
          #39'MT'#39') or (fb_nota_fiscal_estado ='#39'MS'#39'),fb_nota_fiscal_dup_vlr_pg' +
          'to_2 * 0.12,fb_nota_fiscal_dup_vlr_pgto_2 * 0.07)),0)),'#39'-'#39'),'#39#39')'
        FontSize = 8
      end
      object Rel_Comissao_2: TQRExpr
        Left = 667
        Top = 39
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1764.770833333333000000
          103.187500000000000000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_2 = '#39'S'#39',if(fb_nota_fiscal_comissao' +
          '_2 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',(fb_nota_fiscal_dup_vlr_pgto_2 - (' +
          'IF(fb_representante_icms ='#39'S'#39',IF(fb_nota_fiscal_estado ='#39'SP'#39',fb_' +
          'nota_fiscal_dup_vlr_pgto_2 * 0.18,IF((fb_nota_fiscal_estado ='#39'RS' +
          #39') or (fb_nota_fiscal_estado ='#39'SC'#39') or (fb_nota_fiscal_estado ='#39 +
          'PR'#39') or (fb_nota_fiscal_estado ='#39'RJ'#39') or (fb_nota_fiscal_estado ' +
          '='#39'MG'#39') or (fb_nota_fiscal_estado ='#39'MT'#39') or (fb_nota_fiscal_estad' +
          'o ='#39'MS'#39'),fb_nota_fiscal_dup_vlr_pgto_2 * 0.12,fb_nota_fiscal_dup' +
          '_vlr_pgto_2 * 0.07)),0))) * (fb_representante_1_porcentagem / 10' +
          '0)),'#39'-'#39'),'#39#39')'
        FontSize = 8
      end
      object QRExpr3: TQRExpr
        Left = 202
        Top = 56
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333400000
          148.166666666666700000
          103.187500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_3 = '#39'S'#39',fb_nota_fiscal_dup_nro_3,'#39 +
          #39')'
        FontSize = 8
      end
      object QRExpr4: TQRExpr
        Left = 248
        Top = 56
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          656.166666666666800000
          148.166666666666700000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_3 = '#39'S'#39',fb_nota_fiscal_data_emissa' +
          'o,'#39#39')'
        FontSize = 8
      end
      object QRExpr19: TQRExpr
        Left = 309
        Top = 56
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          817.562500000000000000
          148.166666666666700000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_3 = '#39'S'#39',fb_nota_fiscal_dup_dt_vcto' +
          '_3,'#39#39')'
        FontSize = 8
      end
      object QRExpr20: TQRExpr
        Left = 375
        Top = 56
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          992.187500000000000000
          148.166666666666700000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_3 = '#39'S'#39',fb_nota_fiscal_dup_dt_pgto' +
          '_3,'#39#39')'
        FontSize = 8
      end
      object QRExpr22: TQRExpr
        Left = 506
        Top = 56
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1338.791666666667000000
          148.166666666666700000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_3 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',fb_no' +
          'ta_fiscal_dup_vlr_3),'#39#39')'
        FontSize = 8
      end
      object QRExpr23: TQRExpr
        Left = 560
        Top = 56
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          148.166666666666700000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_3 = '#39'S'#39',if(fb_nota_fiscal_comissao' +
          '_3 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',fb_nota_fiscal_dup_vlr_pgto_3),'#39'-'#39 +
          '),'#39#39')'
        FontSize = 8
      end
      object QRExpr24: TQRExpr
        Left = 614
        Top = 56
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1624.541666666667000000
          148.166666666666700000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_3 = '#39'S'#39',if(fb_nota_fiscal_comissao' +
          '_3 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',IF(fb_representante_icms ='#39'S'#39',IF(n' +
          't_nota_fiscal_estado ='#39'SP'#39',fb_nota_fiscal_dup_vlr_pgto_3 * 0.18,' +
          'IF((fb_nota_fiscal_estado ='#39'RS'#39') or (fb_nota_fiscal_estado ='#39'SC'#39 +
          ') or (fb_nota_fiscal_estado ='#39'PR'#39') or (fb_nota_fiscal_estado ='#39'R' +
          'J'#39') or (fb_nota_fiscal_estado ='#39'MG'#39') or (fb_nota_fiscal_estado =' +
          #39'MT'#39') or (fb_nota_fiscal_estado ='#39'MS'#39'),fb_nota_fiscal_dup_vlr_pg' +
          'to_3 * 0.12,fb_nota_fiscal_dup_vlr_pgto_3 * 0.07)),0)),'#39'-'#39'),'#39#39')'
        FontSize = 8
      end
      object Rel_Comissao_3: TQRExpr
        Left = 667
        Top = 56
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1764.770833333333000000
          148.166666666666700000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 
          'if(fb_nota_fiscal_dup_imprime_3 = '#39'S'#39',if(fb_nota_fiscal_comissao' +
          '_3 = '#39'S'#39',FORMATNUMERIC('#39'0.00'#39',(fb_nota_fiscal_dup_vlr_pgto_3 - (' +
          'IF(fb_representante_icms ='#39'S'#39',IF(fb_nota_fiscal_estado ='#39'SP'#39',fb_' +
          'nota_fiscal_dup_vlr_pgto_3 * 0.18,IF((fb_nota_fiscal_estado ='#39'RS' +
          #39') or (fb_nota_fiscal_estado ='#39'SC'#39') or (fb_nota_fiscal_estado ='#39 +
          'PR'#39') or (fb_nota_fiscal_estado ='#39'RJ'#39') or (fb_nota_fiscal_estado ' +
          '='#39'MG'#39') or (fb_nota_fiscal_estado ='#39'MT'#39') or (fb_nota_fiscal_estad' +
          'o ='#39'MS'#39'),fb_nota_fiscal_dup_vlr_pgto_3 * 0.12,fb_nota_fiscal_dup' +
          '_vlr_pgto_3 * 0.07)),0))) * (fb_representante_1_porcentagem / 10' +
          '0)),'#39'-'#39'),'#39#39')'
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 379
        Top = 4
        Width = 50
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1002.770833333333000000
          10.583333333333330000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '- Vlr.Nota:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 76
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        201.083333333333300000
        1899.708333333333000000)
      BandType = rbPageHeader
      object QRLabel6: TQRLabel
        Left = 8
        Top = 4
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Ibrasmak'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_Titulo: TQRLabel
        Left = 8
        Top = 26
        Width = 705
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          21.166666666666670000
          68.791666666666680000
          1865.312500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Comiss'#227'o a Pagar '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRSysData1: TQRSysData
        Left = 530
        Top = 4
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1402.291666666667000000
          10.583333333333330000
          156.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Data: '
        Transparent = False
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 628
        Top = 4
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1661.583333333333000000
          10.583333333333330000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Hora: '
        Transparent = False
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 8
        Top = 56
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          148.166666666666700000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data de Pagamento:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_DT_Pgto: TQRLabel
        Left = 111
        Top = 56
        Width = 67
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          293.687500000000000000
          148.166666666666700000
          177.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QR_DT_Pgto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object PageFooterBand1: TQRBand
      Left = 38
      Top = 242
      Width = 718
      Height = 46
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        121.708333333333300000
        1899.708333333333000000)
      BandType = rbGroupFooter
      object Rel_Tot_Pgto: TQRExpr
        Left = 560
        Top = 23
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          60.854166666666680000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 
          'FORMATNUMERIC('#39'0.00'#39',SUM(if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',i' +
          'f(fb_nota_fiscal_comissao_1 = '#39'S'#39',fb_nota_fiscal_dup_vlr_pgto_1,' +
          '0.00),0.00) + if(fb_nota_fiscal_dup_imprime_2 = '#39'S'#39',if(fb_nota_f' +
          'iscal_comissao_2 = '#39'S'#39',fb_nota_fiscal_dup_vlr_pgto_2,0.00),0.00)' +
          ' + if(fb_nota_fiscal_dup_imprime_3 = '#39'S'#39',if(fb_nota_fiscal_comis' +
          'sao_3 = '#39'S'#39',fb_nota_fiscal_dup_vlr_pgto_3,0.00),0.00)))'
        FontSize = 8
      end
      object Rel_Tot_ICMS: TQRExpr
        Left = 614
        Top = 23
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1624.541666666667000000
          60.854166666666680000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 
          'FORMATNUMERIC('#39'0.00'#39',SUM(if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',i' +
          'f(fb_nota_fiscal_comissao_1 = '#39'S'#39',IF(fb_representante_icms ='#39'S'#39',' +
          'IF(fb_nota_fiscal_estado ='#39'SP'#39',fb_nota_fiscal_dup_vlr_pgto_1 * 0' +
          '.18,IF((fb_nota_fiscal_estado ='#39'RS'#39') or (fb_nota_fiscal_estado =' +
          #39'SC'#39') or (fb_nota_fiscal_estado ='#39'PR'#39') or (fb_nota_fiscal_estado' +
          ' ='#39'RJ'#39') or (fb_nota_fiscal_estado ='#39'MG'#39') or (fb_nota_fiscal_esta' +
          'do ='#39'MT'#39') or (fb_nota_fiscal_estado ='#39'MS'#39'),fb_nota_fiscal_dup_vl' +
          'r_pgto_1 * 0.12,fb_nota_fiscal_dup_vlr_pgto_1 * 0.07)),0.00),0.0' +
          '0),0.00) + if(fb_nota_fiscal_dup_imprime_2 = '#39'S'#39',if(fb_nota_fisc' +
          'al_comissao_2 = '#39'S'#39',IF(fb_representante_icms ='#39'S'#39',IF(fb_nota_fis' +
          'cal_estado ='#39'SP'#39',fb_nota_fiscal_dup_vlr_pgto_2 * 0.18,IF((fb_not' +
          'a_fiscal_estado ='#39'RS'#39') or (fb_nota_fiscal_estado ='#39'SC'#39') or (fb_n' +
          'ota_fiscal_estado ='#39'PR'#39') or (fb_nota_fiscal_estado ='#39'RJ'#39') or (nt' +
          '_nota_fiscal_estado ='#39'MG'#39') or (fb_nota_fiscal_estado ='#39'MT'#39') or (' +
          'fb_nota_fiscal_estado ='#39'MS'#39'),fb_nota_fiscal_dup_vlr_pgto_2 * 0.1' +
          '2,fb_nota_fiscal_dup_vlr_pgto_2 * 0.07)),0.00),0.00),0.00) + if(' +
          'fb_nota_fiscal_dup_imprime_3 = '#39'S'#39',if(fb_nota_fiscal_comissao_3 ' +
          '= '#39'S'#39',IF(fb_representante_icms ='#39'S'#39',IF(fb_nota_fiscal_estado ='#39'S' +
          'P'#39',fb_nota_fiscal_dup_vlr_pgto_3 * 0.18,IF((fb_nota_fiscal_estad' +
          'o ='#39'RS'#39') or (fb_nota_fiscal_estado ='#39'SC'#39') or (fb_nota_fiscal_est' +
          'ado ='#39'PR'#39') or (fb_nota_fiscal_estado ='#39'RJ'#39') or (fb_nota_fiscal_e' +
          'stado ='#39'MG'#39') or (fb_nota_fiscal_estado ='#39'MT'#39') or (fb_nota_fiscal' +
          '_estado ='#39'MS'#39'),fb_nota_fiscal_dup_vlr_pgto_3 * 0.12,fb_nota_fisc' +
          'al_dup_vlr_pgto_3 * 0.07)),0.00),0.00),0.00)))'
        FontSize = 8
      end
      object Rel_Tot_Comissao: TQRExpr
        Left = 667
        Top = 23
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1764.770833333333000000
          60.854166666666680000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 
          'FORMATNUMERIC('#39'0.00'#39',SUM(if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',i' +
          'f(fb_nota_fiscal_comissao_1 = '#39'S'#39',(fb_nota_fiscal_dup_vlr_pgto_1' +
          ' - (IF(fb_representante_icms ='#39'S'#39',IF(fb_nota_fiscal_estado ='#39'SP'#39 +
          ',fb_nota_fiscal_dup_vlr_pgto_1 * 0.18,IF((fb_nota_fiscal_estado ' +
          '='#39'RS'#39') or (fb_nota_fiscal_estado ='#39'SC'#39') or (fb_nota_fiscal_estad' +
          'o ='#39'PR'#39') or (fb_nota_fiscal_estado ='#39'RJ'#39') or (fb_nota_fiscal_est' +
          'ado ='#39'MG'#39') or (fb_nota_fiscal_estado ='#39'MT'#39') or (fb_nota_fiscal_e' +
          'stado ='#39'MS'#39'),fb_nota_fiscal_dup_vlr_pgto_1 * 0.12,fb_nota_fiscal' +
          '_dup_vlr_pgto_1 * 0.07)),0.00))) * (fb_representante_1_porcentag' +
          'em / 100),0.00),0.00) + if(fb_nota_fiscal_dup_imprime_2 = '#39'S'#39',if' +
          '(fb_nota_fiscal_comissao_2 = '#39'S'#39',(fb_nota_fiscal_dup_vlr_pgto_2 ' +
          '- (IF(fb_representante_icms ='#39'S'#39',IF(fb_nota_fiscal_estado ='#39'SP'#39',' +
          'fb_nota_fiscal_dup_vlr_pgto_2 * 0.18,IF((fb_nota_fiscal_estado =' +
          #39'RS'#39') or (fb_nota_fiscal_estado ='#39'SC'#39') or (fb_nota_fiscal_estado' +
          ' ='#39'PR'#39') or (fb_nota_fiscal_estado ='#39'RJ'#39') or (fb_nota_fiscal_esta' +
          'do ='#39'MG'#39') or (fb_nota_fiscal_estado ='#39'MT'#39') or (fb_nota_fiscal_es' +
          'tado ='#39'MS'#39'),fb_nota_fiscal_dup_vlr_pgto_2 * 0.12,fb_nota_fiscal_' +
          'dup_vlr_pgto_2 * 0.07)),0.00))) * (fb_representante_1_porcentage' +
          'm / 100),0.00),0.00) + if(fb_nota_fiscal_dup_imprime_3 = '#39'S'#39',if(' +
          'fb_nota_fiscal_comissao_3 = '#39'S'#39',(fb_nota_fiscal_dup_vlr_pgto_3 -' +
          ' (IF(fb_representante_icms ='#39'S'#39',IF(fb_nota_fiscal_estado ='#39'SP'#39',n' +
          't_nota_fiscal_dup_vlr_pgto_3 * 0.18,IF((fb_nota_fiscal_estado ='#39 +
          'RS'#39') or (fb_nota_fiscal_estado ='#39'SC'#39') or (fb_nota_fiscal_estado ' +
          '='#39'PR'#39') or (fb_nota_fiscal_estado ='#39'RJ'#39') or (fb_nota_fiscal_estad' +
          'o ='#39'MG'#39') or (fb_nota_fiscal_estado ='#39'MT'#39') or (fb_nota_fiscal_est' +
          'ado ='#39'MS'#39'),fb_nota_fiscal_dup_vlr_pgto_3 * 0.12,fb_nota_fiscal_d' +
          'up_vlr_pgto_3 * 0.07)),0.00))) * (fb_representante_1_porcentagem' +
          ' / 100),0.00),0.00)))'
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 398
        Top = 23
        Width = 31
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1053.041666666667000000
          60.854166666666680000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Rel_Tot_Nota: TQRExpr
        Left = 437
        Top = 23
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1156.229166666667000000
          60.854166666666680000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 'FORMATNUMERIC('#39'0.00'#39',SUM(fb_nota_fiscal_valor_total))'
        FontSize = 8
      end
      object Rel_Tot_Dup: TQRExpr
        Left = 506
        Top = 23
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1338.791666666667000000
          60.854166666666680000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 
          'FORMATNUMERIC('#39'0.00'#39',SUM(if(fb_nota_fiscal_dup_imprime_1 = '#39'S'#39',n' +
          't_nota_fiscal_dup_vlr_1,0) + if(fb_nota_fiscal_dup_imprime_2 = '#39 +
          'S'#39',fb_nota_fiscal_dup_vlr_2,0) + if(fb_nota_fiscal_dup_imprime_3' +
          ' = '#39'S'#39',fb_nota_fiscal_dup_vlr_3,0)))'
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 8
        Top = 22
        Width = 33
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          58.208333333333340000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Repr.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 42
        Top = 22
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          111.125000000000000000
          58.208333333333340000
          74.083333333333340000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Comissoes_Nota
        DataField = 'fb_representante_codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel19: TQRLabel
        Left = 73
        Top = 23
        Width = 5
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          193.145833333333300000
          60.854166666666680000
          13.229166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '-'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 81
        Top = 22
        Width = 211
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          214.312500000000000000
          58.208333333333340000
          558.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = ConexaoBD.SQL_Rel_Comissoes_Nota
        DataField = 'fb_representante_nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 443
        Top = 7
        Width = 40
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1172.104166666667000000
          18.520833333333330000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vlr.Nota'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel21: TQRLabel
        Left = 490
        Top = 7
        Width = 62
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1296.458333333333000000
          18.520833333333330000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vlr.Duplicata'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 564
        Top = 7
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1492.250000000000000000
          18.520833333333330000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vlr.Pago'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 618
        Top = 7
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1635.125000000000000000
          18.520833333333330000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vlr.ICMS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 665
        Top = 7
        Width = 48
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1759.479166666667000000
          18.520833333333330000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Comiss'#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 309
        Top = 23
        Width = 32
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          817.562500000000000000
          60.854166666666680000
          84.666666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Porc.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Rel_Porc: TQRExpr
        Left = 344
        Top = 23
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          910.166666666666600000
          60.854166666666680000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 'FORMATNUMERIC('#39'0.00 %'#39',fb_representante_1_porcentagem)'
        FontSize = 8
      end
    end
  end
end
