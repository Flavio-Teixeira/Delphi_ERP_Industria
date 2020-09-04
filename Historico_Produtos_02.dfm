object HistoricoProdutos02: THistoricoProdutos02
  Left = 241
  Top = 95
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Historico de Produtos'
  ClientHeight = 615
  ClientWidth = 768
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
    Left = 8
    Top = 565
    Width = 753
    Height = 41
    TabOrder = 0
    object BT_Sair: TBitBtn
      Left = 670
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 0
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
    object Cliente_Codigo: TEdit
      Left = 4
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
    end
    object DBM_NF_Observacao: TDBMemo
      Left = 15
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      DataField = 'fb_nota_entrada_observacao'
      DataSource = ConexaoBD.DS_FB_Notas_Entradas
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 752
    Height = 545
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 736
      Height = 528
      Caption = '  Dados do Cliente  '
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 160
        Width = 720
        Height = 354
        Caption = '  Dados para a Nota Fiscal  '
        TabOrder = 1
        object Panel2: TPanel
          Left = 8
          Top = 16
          Width = 708
          Height = 201
          BevelOuter = bvLowered
          TabOrder = 0
          object GroupBox7: TGroupBox
            Left = 5
            Top = 1
            Width = 506
            Height = 129
            Caption = '  Detalhamento da Nota  '
            TabOrder = 0
            object Label46: TLabel
              Left = 57
              Top = 64
              Width = 63
              Height = 13
              Caption = 'Desconto (%)'
            end
            object Label47: TLabel
              Left = 10
              Top = 87
              Width = 110
              Height = 13
              Caption = 'Condi'#231#227'o de Pgto (DD)'
            end
            object Label48: TLabel
              Left = 310
              Top = 8
              Width = 90
              Height = 13
              Caption = 'Tipo de Transporte'
            end
            object Label49: TLabel
              Left = 232
              Top = 44
              Width = 72
              Height = 13
              Caption = 'Transportadora'
            end
            object Label52: TLabel
              Left = 61
              Top = 109
              Width = 59
              Height = 13
              Caption = 'Emite o Lote'
            end
            object Label2: TLabel
              Left = 148
              Top = 87
              Width = 5
              Height = 13
              Caption = '/'
            end
            object Label4: TLabel
              Left = 184
              Top = 87
              Width = 5
              Height = 13
              Caption = '/'
            end
            object Label9: TLabel
              Left = 232
              Top = 79
              Width = 104
              Height = 13
              Caption = 'Observa'#231#245'es da Nota'
            end
            object Label53: TLabel
              Left = 414
              Top = 8
              Width = 64
              Height = 13
              Caption = 'Pgto do Frete'
            end
            object Label10: TLabel
              Left = 12
              Top = 41
              Width = 108
              Height = 13
              Caption = 'Natureza de Opera'#231#227'o'
            end
            object Label24: TLabel
              Left = 27
              Top = 18
              Width = 93
              Height = 13
              Caption = 'Nro. Nota Fiscal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 232
              Top = 8
              Width = 56
              Height = 13
              Caption = 'Dt. Emiss'#227'o'
            end
            object Cliente_Desconto: TEdit
              Left = 124
              Top = 61
              Width = 45
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 7
              ParentCtl3D = False
              TabOrder = 1
            end
            object Cliente_Condicao_Pgto_1: TEdit
              Left = 124
              Top = 84
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 2
            end
            object Cliente_Condicao_Pgto_2: TEdit
              Left = 160
              Top = 84
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 3
            end
            object Cliente_Condicao_Pgto_3: TEdit
              Left = 196
              Top = 84
              Width = 18
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 2
              ParentCtl3D = False
              TabOrder = 4
            end
            object Observacao_Nota: TMemo
              Left = 232
              Top = 93
              Width = 268
              Height = 31
              Ctl3D = False
              ParentCtl3D = False
              ScrollBars = ssVertical
              TabOrder = 6
            end
            object Nro_Nota_Fiscal: TEdit
              Left = 124
              Top = 15
              Width = 64
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 9
              ParentCtl3D = False
              TabOrder = 0
            end
            object Data_Emissao: TMaskEdit
              Left = 232
              Top = 23
              Width = 63
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 5
              Text = '  /  /    '
            end
            object Natureza_Operacao: TEdit
              Left = 124
              Top = 38
              Width = 90
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 9
              ParentCtl3D = False
              TabOrder = 7
            end
            object Cliente_Emite_Lote: TEdit
              Left = 124
              Top = 106
              Width = 33
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 9
              ParentCtl3D = False
              TabOrder = 8
            end
            object Cliente_Tipo_Transporte: TEdit
              Left = 310
              Top = 23
              Width = 91
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 9
              ParentCtl3D = False
              TabOrder = 9
            end
            object Cliente_Pgto_Frete: TEdit
              Left = 414
              Top = 23
              Width = 83
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 9
              ParentCtl3D = False
              TabOrder = 10
            end
            object Cliente_Transportadora: TEdit
              Left = 232
              Top = 58
              Width = 268
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 9
              ParentCtl3D = False
              TabOrder = 11
            end
          end
          object GroupBox3: TGroupBox
            Left = 517
            Top = 1
            Width = 185
            Height = 129
            Caption = '  Totais  '
            TabOrder = 1
            object Label5: TLabel
              Left = 5
              Top = 23
              Width = 87
              Height = 13
              Caption = 'Vlr. Desconto (R$)'
            end
            object Label6: TLabel
              Left = 27
              Top = 101
              Width = 65
              Height = 13
              Caption = 'Vlr. Total (R$)'
            end
            object Label7: TLabel
              Left = 5
              Top = 55
              Width = 87
              Height = 13
              Caption = 'Vlr. Sub-Total (R$)'
            end
            object Label8: TLabel
              Left = 2
              Top = 76
              Width = 180
              Height = 13
              Caption = '------------------------------------------------------------'
            end
            object Valor_Desconto: TEdit
              Left = 96
              Top = 20
              Width = 82
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 13
              ParentCtl3D = False
              TabOrder = 0
              Text = '0'
            end
            object Valor_Total: TEdit
              Left = 96
              Top = 98
              Width = 82
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 13
              ParentCtl3D = False
              TabOrder = 2
              Text = '0'
            end
            object Valor_SubTotal: TEdit
              Left = 96
              Top = 52
              Width = 82
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 13
              ParentCtl3D = False
              TabOrder = 1
              Text = '0'
            end
          end
          object GroupBox5: TGroupBox
            Left = 6
            Top = 134
            Width = 697
            Height = 60
            Caption = '   Condi'#231#245'es de Pagamento   '
            TabOrder = 2
            object Label26: TLabel
              Left = 5
              Top = 20
              Width = 77
              Height = 13
              Caption = 'Nro. Duplicata 1'
            end
            object Label27: TLabel
              Left = 92
              Top = 20
              Width = 60
              Height = 13
              Caption = 'Dt. Vencto 1'
            end
            object Label36: TLabel
              Left = 157
              Top = 20
              Width = 61
              Height = 13
              Caption = 'Vlr. Vencto 1'
            end
            object Label37: TLabel
              Left = 239
              Top = 20
              Width = 77
              Height = 13
              Caption = 'Nro. Duplicata 2'
            end
            object Label38: TLabel
              Left = 326
              Top = 20
              Width = 60
              Height = 13
              Caption = 'Dt. Vencto 2'
            end
            object Label39: TLabel
              Left = 391
              Top = 20
              Width = 61
              Height = 13
              Caption = 'Vlr. Vencto 2'
            end
            object Label40: TLabel
              Left = 474
              Top = 20
              Width = 77
              Height = 13
              Caption = 'Nro. Duplicata 3'
            end
            object Label41: TLabel
              Left = 561
              Top = 20
              Width = 60
              Height = 13
              Caption = 'Dt. Vencto 3'
            end
            object Label42: TLabel
              Left = 626
              Top = 20
              Width = 61
              Height = 13
              Caption = 'Vlr. Vencto 3'
            end
            object Nro_Duplicata_1: TEdit
              Left = 5
              Top = 35
              Width = 85
              Height = 19
              CharCase = ecUpperCase
              Ctl3D = False
              Enabled = False
              MaxLength = 20
              ParentCtl3D = False
              TabOrder = 0
            end
            object DT_Vencto_1: TMaskEdit
              Left = 92
              Top = 35
              Width = 63
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 1
              Text = '  /  /    '
            end
            object Vlr_Vencto_1: TEdit
              Left = 157
              Top = 35
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 13
              ParentCtl3D = False
              TabOrder = 2
            end
            object Nro_Duplicata_2: TEdit
              Left = 239
              Top = 35
              Width = 85
              Height = 19
              CharCase = ecUpperCase
              Ctl3D = False
              Enabled = False
              MaxLength = 20
              ParentCtl3D = False
              TabOrder = 3
            end
            object DT_Vencto_2: TMaskEdit
              Left = 326
              Top = 35
              Width = 63
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 4
              Text = '  /  /    '
            end
            object Vlr_Vencto_2: TEdit
              Left = 391
              Top = 35
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 13
              ParentCtl3D = False
              TabOrder = 5
            end
            object Nro_Duplicata_3: TEdit
              Left = 474
              Top = 35
              Width = 85
              Height = 19
              CharCase = ecUpperCase
              Ctl3D = False
              Enabled = False
              MaxLength = 20
              ParentCtl3D = False
              TabOrder = 6
            end
            object DT_Vencto_3: TMaskEdit
              Left = 561
              Top = 35
              Width = 63
              Height = 19
              Ctl3D = False
              Enabled = False
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentCtl3D = False
              TabOrder = 7
              Text = '  /  /    '
            end
            object Vlr_Vencto_3: TEdit
              Left = 626
              Top = 35
              Width = 65
              Height = 19
              Ctl3D = False
              Enabled = False
              MaxLength = 13
              ParentCtl3D = False
              TabOrder = 8
            end
          end
        end
        object SGD_Produtos: TStringGrid
          Left = 8
          Top = 224
          Width = 708
          Height = 120
          ColCount = 8
          Ctl3D = False
          DefaultRowHeight = 19
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          ColWidths = (
            64
            64
            64
            64
            64
            64
            64
            64)
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 16
        Width = 720
        Height = 136
        Caption = '  Nome / Endere'#231'o  '
        TabOrder = 0
        object Label13: TLabel
          Left = 8
          Top = 56
          Width = 150
          Height = 13
          Caption = 'Logradouro (Rua, Avenida, Etc)'
        end
        object Label14: TLabel
          Left = 307
          Top = 56
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label15: TLabel
          Left = 411
          Top = 56
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label16: TLabel
          Left = 565
          Top = 56
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label19: TLabel
          Left = 349
          Top = 16
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label17: TLabel
          Left = 398
          Top = 16
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label20: TLabel
          Left = 461
          Top = 16
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label3: TLabel
          Left = 69
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 41
          Height = 13
          Caption = 'Empresa'
        end
        object Label28: TLabel
          Left = 8
          Top = 96
          Width = 37
          Height = 13
          Caption = 'Contato'
        end
        object Label35: TLabel
          Left = 138
          Top = 114
          Width = 50
          Height = 13
          Caption = 'Telefones:'
        end
        object Label29: TLabel
          Left = 190
          Top = 96
          Width = 24
          Height = 13
          Caption = 'DDD'
        end
        object Label34: TLabel
          Left = 221
          Top = 96
          Width = 30
          Height = 13
          Caption = 'Ramal'
        end
        object Label30: TLabel
          Left = 265
          Top = 96
          Width = 46
          Height = 13
          Caption = 'Comercial'
        end
        object Label31: TLabel
          Left = 340
          Top = 96
          Width = 55
          Height = 13
          Caption = 'Residencial'
        end
        object Label32: TLabel
          Left = 415
          Top = 96
          Width = 32
          Height = 13
          Caption = 'Celular'
        end
        object Label33: TLabel
          Left = 489
          Top = 96
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label44: TLabel
          Left = 577
          Top = 96
          Width = 29
          Height = 13
          Caption = 'E-Mail'
        end
        object Cliente_Endereco: TEdit
          Left = 8
          Top = 71
          Width = 295
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 3
        end
        object Cliente_Complemento: TEdit
          Left = 307
          Top = 71
          Width = 100
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 4
        end
        object Cliente_Bairro: TEdit
          Left = 411
          Top = 71
          Width = 150
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 5
        end
        object Cliente_Cidade: TEdit
          Left = 565
          Top = 71
          Width = 150
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 6
        end
        object Cliente_Cep: TMaskEdit
          Left = 398
          Top = 31
          Width = 57
          Height = 19
          Ctl3D = False
          Enabled = False
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          ParentCtl3D = False
          TabOrder = 2
          Text = '     -   '
        end
        object Cliente_Nome: TEdit
          Left = 69
          Top = 31
          Width = 274
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 1
        end
        object Cliente_Empresa: TEdit
          Left = 8
          Top = 31
          Width = 57
          Height = 19
          Ctl3D = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 80
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object Cliente_Contato: TEdit
          Left = 8
          Top = 111
          Width = 125
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 7
        end
        object Cliente_DDD: TEdit
          Left = 190
          Top = 111
          Width = 25
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 3
          ParentCtl3D = False
          TabOrder = 8
        end
        object Cliente_Fone_Ramal: TEdit
          Left = 221
          Top = 111
          Width = 39
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 5
          ParentCtl3D = False
          TabOrder = 9
        end
        object Cliente_Fone_Comercial: TEdit
          Left = 265
          Top = 111
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 10
        end
        object Cliente_Fone_Residencial: TEdit
          Left = 340
          Top = 111
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 11
        end
        object Cliente_Fone_Celular: TEdit
          Left = 415
          Top = 111
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 12
        end
        object Cliente_Fone_Fax: TEdit
          Left = 489
          Top = 111
          Width = 70
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 50
          ParentCtl3D = False
          TabOrder = 13
        end
        object Cliente_Email: TEdit
          Left = 565
          Top = 111
          Width = 148
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 14
        end
        object Cliente_Estado: TEdit
          Left = 350
          Top = 31
          Width = 35
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 3
          ParentCtl3D = False
          TabOrder = 15
        end
        object Cliente_Pais: TEdit
          Left = 461
          Top = 31
          Width = 254
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 16
        end
      end
    end
  end
end
