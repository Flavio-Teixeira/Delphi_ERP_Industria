object Avulso02: TAvulso02
  Left = 397
  Top = 188
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'T'#237'tulos Fixos - ALTERA'#199#195'O / EXCLUS'#195'O'
  ClientHeight = 323
  ClientWidth = 762
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
  object Panel3: TPanel
    Left = 4
    Top = 277
    Width = 753
    Height = 41
    TabOrder = 1
    object BT_Alterar: TBitBtn
      Left = 298
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
      Left = 671
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
      Left = 379
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
    object Posicao_Nro_Conta: TEdit
      Left = 5
      Top = 5
      Width = 8
      Height = 19
      Ctl3D = False
      MaxLength = 13
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 4
    Width = 753
    Height = 268
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 7
      Top = 4
      Width = 739
      Height = 255
      Caption = '  Dados do T'#237'tulo  '
      TabOrder = 0
      object Label1: TLabel
        Left = 101
        Top = 26
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
      object Label2: TLabel
        Left = 76
        Top = 49
        Width = 60
        Height = 13
        Caption = 'Data Vencto'
      end
      object Label3: TLabel
        Left = 146
        Top = 49
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label4: TLabel
        Left = 622
        Top = 229
        Width = 30
        Height = 13
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 559
        Top = 170
        Width = 101
        Height = 13
        Caption = 'Valor a ser Pago (R$)'
      end
      object Label6: TLabel
        Left = 612
        Top = 122
        Width = 48
        Height = 13
        Caption = 'Juros (R$)'
      end
      object Label5: TLabel
        Left = 591
        Top = 146
        Width = 69
        Height = 13
        Caption = 'Desconto (R$)'
      end
      object Label37: TLabel
        Left = 540
        Top = 98
        Width = 120
        Height = 13
        Caption = 'Valor Total do T'#237'tulo (R$)'
      end
      object Label8: TLabel
        Left = 4
        Top = 211
        Width = 63
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object Label9: TLabel
        Left = 669
        Top = 49
        Width = 54
        Height = 13
        Caption = 'Data Pagto'
      end
      object Label10: TLabel
        Left = 610
        Top = 194
        Width = 50
        Height = 13
        Caption = 'Saldo (R$)'
      end
      object Label13: TLabel
        Left = 4
        Top = 26
        Width = 29
        Height = 13
        Caption = 'Nro.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 5
        Top = 49
        Width = 65
        Height = 13
        Caption = 'Data Emiss'#227'o'
      end
      object Avulso_Descricao: TEdit
        Left = 146
        Top = 64
        Width = 518
        Height = 19
        Ctl3D = False
        MaxLength = 255
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = Avulso_DescricaoKeyPress
      end
      object Avulso_Data: TMaskEdit
        Left = 76
        Top = 64
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 2
        Text = '  /  /    '
        OnKeyPress = Avulso_DataKeyPress
      end
      object Avulso_Conta: TComboBox
        Left = 146
        Top = 23
        Width = 588
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Avulso_ContaKeyPress
      end
      object Avulso_Status: TComboBox
        Left = 655
        Top = 226
        Width = 79
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 11
        Text = 'Em Aberto'
        OnKeyPress = Avulso_StatusKeyPress
        Items.Strings = (
          'Em Aberto'
          'Pago'
          'Pago Parcial'
          'Cancelado'
          'Devolu'#231#227'o')
      end
      object Avulso_Ser_Pago: TEdit
        Left = 663
        Top = 95
        Width = 71
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 5
        Text = '0,00'
        OnExit = Avulso_Ser_PagoExit
        OnKeyPress = Avulso_Ser_PagoKeyPress
      end
      object Avulso_Juros: TEdit
        Left = 663
        Top = 119
        Width = 71
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 6
        Text = '0,00'
        OnExit = Avulso_JurosExit
        OnKeyPress = Avulso_JurosKeyPress
      end
      object Avulso_Desconto: TEdit
        Left = 663
        Top = 143
        Width = 71
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 7
        Text = '0,00'
        OnExit = Avulso_DescontoExit
        OnKeyPress = Avulso_DescontoKeyPress
      end
      object Avulso_Valor: TEdit
        Left = 663
        Top = 167
        Width = 71
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 8
        Text = '0,00'
        OnExit = Avulso_ValorExit
        OnKeyPress = Avulso_ValorKeyPress
      end
      object Avulso_Observacao: TEdit
        Left = 4
        Top = 226
        Width = 613
        Height = 19
        Ctl3D = False
        MaxLength = 255
        ParentCtl3D = False
        TabOrder = 10
        OnKeyPress = Avulso_ObservacaoKeyPress
      end
      object Avulso_Pagto: TMaskEdit
        Left = 669
        Top = 64
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 4
        Text = '  /  /    '
        OnExit = Avulso_PagtoExit
        OnKeyPress = Avulso_PagtoKeyPress
      end
      object Avulso_Saldo: TEdit
        Left = 663
        Top = 191
        Width = 71
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 9
        Text = '0,00'
        OnExit = Avulso_SaldoExit
        OnKeyPress = Avulso_ValorKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 5
        Top = 104
        Width = 368
        Height = 86
        Caption = '   Fornecedor   '
        TabOrder = 12
        object Label11: TLabel
          Left = 4
          Top = 16
          Width = 20
          Height = 13
          Caption = 'Nro.'
        end
        object Label12: TLabel
          Left = 50
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Avulso_Fornecedor_Numero: TEdit
          Left = 4
          Top = 31
          Width = 42
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 11
          ParentCtl3D = False
          TabOrder = 0
        end
        object Avulso_Fornecedor_Nome: TEdit
          Left = 50
          Top = 31
          Width = 311
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 1
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
      object Avulso_Nro: TEdit
        Left = 36
        Top = 23
        Width = 59
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 13
      end
      object Avulso_Emissao: TMaskEdit
        Left = 5
        Top = 64
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = Avulso_EmissaoKeyPress
      end
    end
  end
end
