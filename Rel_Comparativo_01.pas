unit Rel_Comparativo_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelComparativo01 = class(TForm)
    QR_Comparativo: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    QR_Periodo: TQRLabel;
    QR_Titulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr19: TQRExpr;
    DetailBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr6: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelComparativo01: TRelComparativo01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
