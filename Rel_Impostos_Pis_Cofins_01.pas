unit Rel_Impostos_Pis_Cofins_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelImpostosPisCofins01 = class(TForm)
    QR_Imposto_Pis_Cofins: TQuickRep;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRSysData3: TQRSysData;
    lblTitulo: TQRLabel;
    lblPeriodo: TQRLabel;
    lblPorcentagemImposto: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    Exp_Vlr: TQRExpr;
    SummaryBand1: TQRBand;
    Exp_Vlr_Total: TQRExpr;
    Exp_Imposto: TQRExpr;
    Total_Exp_Imposto: TQRExpr;
    lblICMSNotaEntrada: TQRLabel;
    Exp_Total: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelImpostosPisCofins01: TRelImpostosPisCofins01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
