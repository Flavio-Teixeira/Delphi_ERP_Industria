unit Produtos_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TProdutos03 = class(TForm)
    QR_Estrutura: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QR_Titulo: TQRLabel;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QR_Produto: TQRLabel;
    QRDBText2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Produtos03: TProdutos03;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
