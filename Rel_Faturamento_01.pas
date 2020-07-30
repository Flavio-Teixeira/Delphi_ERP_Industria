unit Rel_Faturamento_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelFaturamento01 = class(TForm)
    QR_Faturamento: TQuickRep;
    TitleBand1: TQRBand;
    LBL_Empresa: TQRLabel;
    QR_Periodo: TQRLabel;
    QR_Titulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    DetailBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel1: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    DetailBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr12: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelFaturamento01: TRelFaturamento01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
