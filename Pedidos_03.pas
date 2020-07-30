unit Pedidos_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, QRCtrls, QuickRpt, ExtCtrls;

type
  TPedidos03 = class(TForm)
    QR_Ordem_Servico: TQuickRep;
    QRBand1: TQRBand;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    lblVlrTotalTitulo: TQRLabel;
    QRSysData6: TQRSysData;
    lblTitulo: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    Exp_Total: TQRExpr;
    QRBand3: TQRBand;
    lblTotal: TQRLabel;
    Exp_Total_Total: TQRExpr;
    QRLabel5: TQRLabel;
    lblNro_OS: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    lblCNPJ: TQRLabel;
    lblCliente: TQRLabel;
    lblEndereco: TQRLabel;
    lblCidade: TQRLabel;
    lblEstado: TQRLabel;
    lblIE: TQRLabel;
    lblFone: TQRLabel;
    lblFax: TQRLabel;
    lblBairro: TQRLabel;
    lblCEP: TQRLabel;
    lblContato: TQRLabel;
    QRLabel26: TQRLabel;
    lblAlimentacao: TQRLabel;
    QRShape2: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel24: TQRLabel;
    lblTransportadora: TQRLabel;
    QRLabel25: TQRLabel;
    lblTransportadoraFone: TQRLabel;
    QRLabel28: TQRLabel;
    lblPrazo: TQRLabel;
    lblPagamentoTitulo: TQRLabel;
    lblPagamento: TQRLabel;
    QRShape3: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    lblData_OS: TQRLabel;
    QRLabel32: TQRLabel;
    lblSolicitado: TQRLabel;
    lblVlrUnitarioTitulo: TQRLabel;
    Exp_Unitario: TQRExpr;
    Exp_Unitario_Total: TQRExpr;
    lblObservacoes: TQRMemo;
    lblItem: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    lblFinanciamento: TQRLabel;
    QRShape4: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel33: TQRLabel;
    Parcela_Nro: TQRLabel;
    QRLabel44: TQRLabel;
    Parcela_Faturamento: TQRLabel;
    Parcela_Pedido: TQRLabel;
    Parcela_Mes_Subsequente: TQRLabel;
    Parcela_Dias_Vencto: TQRLabel;
    Parcela_Vencto: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape5: TQRShape;
    QRLabel49: TQRLabel;
    Parcela_Porcentagem_Ato: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel41: TQRLabel;
    Parcela_Vlr_Ato: TQRLabel;
    Parcela_Prazo_Inicio: TQRLabel;
    QRLabel39: TQRLabel;
    Parcela_Vencto2: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    lblOrdem_Compra_Cliente: TQRLabel;
    QRLabel4: TQRLabel;
    lblVendedor: TQRLabel;
    QRLabel30: TQRLabel;
    lblComissao: TQRLabel;
    procedure QR_Ordem_ServicoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QR_Ordem_ServicoAfterPrint(Sender: TObject);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pedidos03: TPedidos03;
  Item: Integer;

implementation

uses Rotinas_Gerais, Conexao_BD;

{$R *.dfm}

procedure TPedidos03.QR_Ordem_ServicoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    Item := 0;
    Item := Item + 1;
    lblItem.Caption := IntToStr(Item);
end;

procedure TPedidos03.QR_Ordem_ServicoAfterPrint(Sender: TObject);
begin
    Item := 0;
end;

procedure TPedidos03.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
    Item := Item + 1;
    lblItem.Caption := IntToStr(Item);
end;

procedure TPedidos03.FormShow(Sender: TObject);
begin
     Pedidos03.QRLabel33.Visible   := False;
     Pedidos03.Parcela_Nro.Visible := False;

     Pedidos03.QRLabel33.Caption   := ' ';
     Pedidos03.Parcela_Nro.Caption := ' ';
end;

end.
