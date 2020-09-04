unit Rel_Cliente_Representante_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRelClienteRepresentante01 = class(TForm)
    RelFichasVisitas: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText17: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel21: TQRLabel;
    QRDBText18: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelClienteRepresentante01: TRelClienteRepresentante01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
