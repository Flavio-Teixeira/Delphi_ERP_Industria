unit Qtde_Fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TQtdeFornecedores = class(TForm)
    Label23: TLabel;
    Nro_Fornecedores: TEdit;
    BT_Ok: TBitBtn;
    procedure Nro_FornecedoresKeyPress(Sender: TObject; var Key: Char);
    procedure BT_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QtdeFornecedores: TQtdeFornecedores;

implementation

uses Conexao_BD, Rotinas_Gerais, Requisicao_04;

{$R *.dfm}

procedure TQtdeFornecedores.Nro_FornecedoresKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TQtdeFornecedores.BT_OkClick(Sender: TObject);
begin
     If ((Trim(Nro_Fornecedores.Text) = '') Or (Trim(Nro_Fornecedores.Text) = '0') Or (Trim(Nro_Fornecedores.Text) = '00')) Then
        Begin
        Requisicao04.Requisicao_Qtde_Fornecedores.Text := '1';
        End
     Else
        Begin
        Requisicao04.Requisicao_Qtde_Fornecedores.Text := Trim(Nro_Fornecedores.Text);
     End;

     QtdeFornecedores.Close;
end;

end.
