unit Rel_Faturamento_Outras_Saidas_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelFaturamentoOutrasSaidas01 = class(TForm)
    QR_Faturamento: TQuickRep;
    TitleBand1: TQRBand;
    LBL_Empresa: TQRLabel;
    QR_Periodo: TQRLabel;
    QR_Titulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    PageHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr19: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    DetailBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelFaturamentoOutrasSaidas01: TRelFaturamentoOutrasSaidas01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
