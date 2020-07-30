unit Ordem_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TOrdem03 = class(TForm)
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
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel12: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ordem03: TOrdem03;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
