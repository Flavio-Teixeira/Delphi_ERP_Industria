unit Depto_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TDepto01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Depto_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Depto_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  Depto01: TDepto01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

function TDepto01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Depto_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição do Departamento não foi informada';
        Campo_Retorno := 'Depto_Descricao';
        End
     Else
        Begin
        ConexaoBD.SQL_Depto.SQL.Clear;
        ConexaoBD.SQL_Depto.SQL.Add('Select * from fb_depto Where fb_depto_descricao = ' +#39+ Trim(Depto_Descricao.Text) +#39);
        ConexaoBD.SQL_Depto.Open;

        If ConexaoBD.SQL_Depto.RecordCount > 0 Then
           Begin
           Erro          := 'A Descrição do Departamento Já existe';
           Campo_Retorno := 'Depto_Descricao';
        End;
     End;

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Depto_Descricao' Then
           Begin
           Depto_Descricao.SetFocus;
        End;
     End;

     Result := Resultado;
end;

procedure TDepto01.BT_SairClick(Sender: TObject);
begin
     Depto01.Close;
end;

procedure TDepto01.Depto_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDepto01.BT_IncluirClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into fb_depto(fb_depto_descricao) Values(' +#39+ Trim(Depto_Descricao.Text) +#39+ ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outro Departamento?') = 6 Then
           Begin
           Depto_Descricao.Text := '';
           End
        Else
           Begin
           Depto01.Close;
        End;
     End;
end;

procedure TDepto01.FormShow(Sender: TObject);
begin
     Depto_Descricao.SetFocus;
end;

end.
