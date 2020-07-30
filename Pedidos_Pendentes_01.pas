unit Pedidos_Pendentes_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TPedidosPendentes01 = class(TForm)
    QR_Relatorio: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QR_Titulo: TQRLabel;
    QRLabel8: TQRLabel;
    QR_Periodo: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PedidosPendentes01: TPedidosPendentes01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
