object RelComparativo00: TRelComparativo00
  Left = 192
  Top = 103
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio Comparativo - Comtas a Pagar / Contas a Receber'
  ClientHeight = 329
  ClientWidth = 438
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 3
    Top = 8
    Width = 430
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 93
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label4: TLabel
      Left = 237
      Top = 16
      Width = 16
      Height = 13
      Caption = 'At'#233
    end
    object Data_Inicial: TMaskEdit
      Left = 153
      Top = 12
      Width = 63
      Height = 19
      Ctl3D = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 0
      Text = '  /  /    '
    end
    object Data_Final: TMaskEdit
      Left = 273
      Top = 12
      Width = 63
      Height = 19
      Ctl3D = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object Panel2: TPanel
    Left = 3
    Top = 284
    Width = 430
    Height = 41
    TabOrder = 1
    object BT_Imprimir: TBitBtn
      Left = 178
      Top = 8
      Width = 74
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BT_ImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BT_Sair: TBitBtn
      Left = 348
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
  object Panel3: TPanel
    Left = 3
    Top = 53
    Width = 430
    Height = 115
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 80
      Width = 414
      Height = 28
      AutoSize = False
      Caption = 
        'ATEN'#199#195'O: Se a Data de Vencimento de um Contas a Receber e Contas' +
        ' a Pagar coincidirem em finais de Semana o Sistema ir'#225' Lan'#231'a-los' +
        ' na Segunda-Feira.'
      WordWrap = True
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 1
      Width = 418
      Height = 72
      Caption = '   Contas a Receber   '
      TabOrder = 0
      object Opcao_Soma_Dia: TRadioButton
        Left = 11
        Top = 20
        Width = 395
        Height = 17
        Caption = 
          'Gerar as Contas a Receber Somando 1 Dia na Data de Vencimento Es' +
          'tipulada'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object Opcao_Dia_Normal: TRadioButton
        Left = 11
        Top = 43
        Width = 395
        Height = 17
        Caption = 'Gerar as Contas a Receber com a Data de Vencimento Estipulada'
        TabOrder = 1
      end
    end
  end
  object Panel4: TPanel
    Left = 3
    Top = 173
    Width = 430
    Height = 107
    TabOrder = 3
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 414
      Height = 53
      AutoSize = False
      Caption = 
        'ATEN'#199#195'O: O Sistema ir'#225' Considerar a Conta Escolhida Como Padr'#227'o,' +
        ' tomando como base o primeiro saldo localizado entre o per'#237'odo e' +
        'scolhido. Caso a op'#231#227'o escolhida seja todas as contas o Sistema ' +
        'somar'#225' os primeiros saldos encontrados no per'#237'odo informado.'
      WordWrap = True
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 1
      Width = 418
      Height = 43
      Caption = '   Conta a ser Considerada como Padr'#227'o   '
      TabOrder = 0
      object Conta_Padrao: TComboBox
        Left = 6
        Top = 17
        Width = 405
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
end
