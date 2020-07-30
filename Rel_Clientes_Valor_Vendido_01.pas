unit Rel_Clientes_Valor_Vendido_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelClientesValorVendido01 = class(TForm)
    QR_ClientesValorVendido: TQuickRep;
    QRBand1: TQRBand;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRL_Empresa: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData6: TQRSysData;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr3: TQRExpr;
    QRBand3: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr4: TQRExpr;
    lblTipoRelatorio: TQRLabel;
    lblPeriodo: TQRLabel;
    lblTitulo: TQRLabel;
    lblQtdeDoRanking: TQRLabel;
    QRLabel1: TQRLabel;
    lblPosicao: TQRLabel;
    procedure QR_ClientesValorVendidoAfterPrint(Sender: TObject);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QR_ClientesValorVendidoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelClientesValorVendido01: TRelClientesValorVendido01;
  Ranking: Integer;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TRelClientesValorVendido01.QR_ClientesValorVendidoAfterPrint(
  Sender: TObject);
begin
    Ranking := 0;
end;

procedure TRelClientesValorVendido01.QRBand2AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
    Ranking := Ranking + 1;
    lblPosicao.Caption := IntToStr(Ranking);
end;

procedure TRelClientesValorVendido01.QR_ClientesValorVendidoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    Ranking := 0;
    Ranking := Ranking + 1;
    lblPosicao.Caption := IntToStr(Ranking);
end;

end.
