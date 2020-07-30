unit Rel_Vendas_Representantes_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelVendasRepresentantes03 = class(TForm)
    QR_Representantes: TQuickRep;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    Representante: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel12: TQRLabel;
    DetailBand2: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel6: TQRLabel;
    QR_Titulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    Valor_ICMS: TQRExpr;
    Comissao: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    LBL_Periodo: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelVendasRepresentantes03: TRelVendasRepresentantes03;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
