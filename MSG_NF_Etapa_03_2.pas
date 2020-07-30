unit MSG_NF_Etapa_03_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TMSGNFEtapa03_2 = class(TForm)
    Label1: TLabel;
    BT_Confirmar: TBitBtn;
    BT_Sair: TBitBtn;
    Ultima_Nota: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure Ultima_NotaKeyPress(Sender: TObject;
      var Key: Char);
    procedure BT_ConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MSGNFEtapa03_2: TMSGNFEtapa03_2;

implementation

uses Rotinas_Gerais, Notas_Fiscais_Saidas_02, MSG_NF_Etapa_02_2;

{$R *.dfm}

procedure TMSGNFEtapa03_2.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TMSGNFEtapa03_2.BT_SairClick(Sender: TObject);
begin
     MSGNFEtapa02_2.ETP_Ultima_Nota.Text := '';

     MSGNFEtapa03_2.Close;
end;

procedure TMSGNFEtapa03_2.Ultima_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TMSGNFEtapa03_2.BT_ConfirmarClick(Sender: TObject);
begin
     If Trim(Ultima_Nota.Text) <> '' Then
        Begin
        MSGNFEtapa02_2.ETP_Ultima_Nota.Text := Ultima_Nota.Text;

        MSGNFEtapa03_2.Close;
        End
     Else
        Begin
        MSG_Erro('Por Favor, Informe uma Numeração Válida.'+Chr(13)+Chr(10)+'Ex.: 0 ou 123, Número da Última Nota, Etc.');
     End;
end;

end.
