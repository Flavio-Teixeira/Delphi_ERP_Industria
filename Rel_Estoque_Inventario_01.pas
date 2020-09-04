unit Rel_Estoque_Inventario_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelEstoqueInventario01 = class(TForm)
    QR_Produtos: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QR_Titulo: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    Rel_Tipo_Produto: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr11: TQRExpr;
    QRLabel2: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    PageFooterBand1: TQRBand;
    QRExpr5: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelEstoqueInventario01: TRelEstoqueInventario01;

implementation

{$R *.dfm}

end.
