unit Rel_OS_Canceladas_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelOSCanceladas01 = class(TForm)
    QR_Faturamento: TQuickRep;
    QRBand2: TQRBand;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QR_Topo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QR_Titulo: TQRLabel;
    QR_Periodo: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelOSCanceladas01: TRelOSCanceladas01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
