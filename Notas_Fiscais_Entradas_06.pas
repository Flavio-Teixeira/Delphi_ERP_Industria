unit Notas_Fiscais_Entradas_06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TNotasFiscaisEntradas06 = class(TForm)
    QR_ProdutosComprados: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QR_Titulo: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QR_Periodo: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText7: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotasFiscaisEntradas06: TNotasFiscaisEntradas06;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
