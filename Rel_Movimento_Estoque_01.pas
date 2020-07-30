unit Rel_Movimento_Estoque_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TRelMovimentoEstoque01 = class(TForm)
    QR_MovEstoque: TQuickRep;
    QRGroup2: TQRGroup;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QR_Titulo: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    Saldo_Atual: TQRExpr;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRExpr9: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelMovimentoEstoque01: TRelMovimentoEstoque01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
