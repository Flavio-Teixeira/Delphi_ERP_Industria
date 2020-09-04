unit Rel_Faturamento_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelFaturamento03 = class(TForm)
    QR_Faturamento: TQuickRep;
    TitleBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QR_Empresa: TQRLabel;
    QR_Periodo: TQRLabel;
    QR_Titulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr19: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    DetailBand1: TQRBand;
    QRNFS_Faturadas_Estadual_Vlr: TQRLabel;
    QRNFS_Faturadas_Estadual_Qtde: TQRLabel;
    QRNFS_Faturadas_Inter_Estadual_Qtde: TQRLabel;
    QRNFS_Faturadas_Inter_Estadual_Vlr: TQRLabel;
    QRNFS_Faturadas_Total_Qtde: TQRLabel;
    QRNFS_Faturadas_Total_Vlr: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelFaturamento03: TRelFaturamento03;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
