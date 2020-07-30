unit Rel_Funcionarios_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TRelFuncionarios01 = class(TForm)
    QR_MovEstoque: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QR_Titulo: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel3: TQRLabel;
    empresa: TQRLabel;
    QRLabel11: TQRLabel;
    status: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelFuncionarios01: TRelFuncionarios01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
