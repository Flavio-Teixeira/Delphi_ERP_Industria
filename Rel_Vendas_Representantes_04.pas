unit Rel_Vendas_Representantes_04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TRelVendasRepresentantes04 = class(TForm)
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
    DetailBand2: TQRBand;
    Comissao: TQRExpr;
    Valor_ICMS: TQRExpr;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel12: TQRLabel;
    Total_Valor_ICMS: TQRExpr;
    Total_Comissao: TQRExpr;
    PageHeaderBand1: TQRBand;
    QRLabel6: TQRLabel;
    QR_Titulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    LBL_Periodo: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelVendasRepresentantes04: TRelVendasRepresentantes04;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
