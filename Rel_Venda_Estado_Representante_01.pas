unit Rel_Venda_Estado_Representante_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelVendaEstadoRepresentante01 = class(TForm)
    RelVendasEstadosRepresentantes: TQuickRep;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRL_Empresa: TQRLabel;
    QR_Titulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRL_Periodo: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    Rel_Media_Representante: TQRExpr;
    QRLabel16: TQRLabel;
    QRL_Media: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    Rel_Total_Media_Representante: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    Rel_Geral_Media_Representante: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelVendaEstadoRepresentante01: TRelVendaEstadoRepresentante01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
