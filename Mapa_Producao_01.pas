unit Mapa_Producao_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TMapaProducao01 = class(TForm)
    QR_Relatorio: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QR_Titulo: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QR_Periodo: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MapaProducao01: TMapaProducao01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
