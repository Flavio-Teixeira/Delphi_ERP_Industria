unit Rel_Vencidos_Papeleta_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelVencidosPapeleta01 = class(TForm)
    QR_Vencidos: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QR_Titulo: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QR_Emissao: TQRLabel;
    QRLabel10: TQRLabel;
    DetailBand1: TQRBand;
    QRE_Duplicata1: TQRExpr;
    QRE_Emissao1: TQRExpr;
    QRE_Banco1: TQRExpr;
    QRE_Codigo1: TQRExpr;
    QRE_Nome1: TQRExpr;
    QRE_Vlr_Duplicata1: TQRExpr;
    QRE_Vencimento1: TQRExpr;
    QRE_Duplicata2: TQRExpr;
    QRE_Emissao2: TQRExpr;
    QRE_Banco2: TQRExpr;
    QRE_Codigo2: TQRExpr;
    QRE_Nome2: TQRExpr;
    QRE_Vlr_Duplicata2: TQRExpr;
    QRE_Vencimento2: TQRExpr;
    QRE_Duplicata3: TQRExpr;
    QRE_Emissao3: TQRExpr;
    QRE_Banco3: TQRExpr;
    QRE_Codigo3: TQRExpr;
    QRE_Nome3: TQRExpr;
    QRE_Vlr_Duplicata3: TQRExpr;
    QRE_Vencimento3: TQRExpr;
    QRE_Atraso1: TQRExpr;
    QRE_Atraso2: TQRExpr;
    QRE_Atraso3: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRE_Total: TQRExpr;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelVencidosPapeleta01: TRelVencidosPapeleta01;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Vencidos_Papeleta_00;

{$R *.dfm}

procedure TRelVencidosPapeleta01.FormCreate(Sender: TObject);
begin
//*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';
end;

end.
