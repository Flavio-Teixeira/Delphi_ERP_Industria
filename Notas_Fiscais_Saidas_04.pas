unit Notas_Fiscais_Saidas_04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls;

type
  TNotasFiscaisSaidas04 = class(TForm)
    QR_LPT: TQuickRep;
    QRBand2: TQRBand;
    Descricao_LPT: TQRMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotasFiscaisSaidas04: TNotasFiscaisSaidas04;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
