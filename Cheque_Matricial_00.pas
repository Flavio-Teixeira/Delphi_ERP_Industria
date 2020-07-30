unit Cheque_Matricial_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TChequeMatricial00 = class(TForm)
    QR_Cheque: TQuickRep;
    DetailBand1: TQRBand;
    QRL_Valor: TQRLabel;
    QRL_Cidade: TQRLabel;
    QRL_Dia: TQRLabel;
    QRL_Mes: TQRLabel;
    QRL_Ano: TQRLabel;
    QRL_Nominal: TQRLabel;
    QRM_Valor_Linha: TQRMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChequeMatricial00: TChequeMatricial00;

implementation

{$R *.dfm}

end.
