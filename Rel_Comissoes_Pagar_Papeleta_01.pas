unit Rel_Comissoes_Pagar_Papeleta_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelComissoesPagarPapeletas01 = class(TForm)
    RelComissoesPapeleta: TQuickRep;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    Valor_ICMS: TQRExpr;
    Rel_Comissao_1: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    Rel_Comissao_2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    Rel_Comissao_3: TQRExpr;
    QRLabel17: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel6: TQRLabel;
    QR_Titulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QR_DT_Pgto: TQRLabel;
    PageFooterBand1: TQRBand;
    Rel_Tot_Pgto: TQRExpr;
    Rel_Tot_ICMS: TQRExpr;
    Rel_Tot_Comissao: TQRExpr;
    QRLabel16: TQRLabel;
    Rel_Tot_Nota: TQRExpr;
    Rel_Tot_Dup: TQRExpr;
    QRLabel18: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    Rel_Porc: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelComissoesPagarPapeletas01: TRelComissoesPagarPapeletas01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
