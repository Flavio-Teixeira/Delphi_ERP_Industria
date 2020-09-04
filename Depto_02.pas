unit Depto_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TDepto02 = class(TForm)
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    BT_Excluir: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Depto_Numero: TEdit;
    Depto_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Depto_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  Depto02: TDepto02;
  Depto_Descricao_Ant: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

function TDepto02.Valida_Dados(): Boolean;

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
        If Depto_Descricao.Text <> Depto_Descricao_Ant Then
           Begin
           ConexaoBD.SQL_Depto.SQL.Clear;
           ConexaoBD.SQL_Depto.SQL.Add('Select * from fb_depto Where fb_depto_descricao = ' +#39+ Trim(Depto_Descricao.Text) +#39);
           ConexaoBD.SQL_Depto.Open;

           If ConexaoBD.SQL_Depto.RecordCount > 0 Then
              Begin
              Erro          := 'A Descrição do Departamento Já existe';
              Campo_Retorno := 'depto_descricao';
           End;
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

procedure TDepto02.BT_SairClick(Sender: TObject);
begin
     Depto02.Close;
end;

procedure TDepto02.Depto_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDepto02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_depto Where fb_depto_numero = ' +  Trim(Depto_Numero.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Depto02.Close;
     End;
end;

procedure TDepto02.FormShow(Sender: TObject);
begin
    Depto_Descricao_Ant := Depto_Descricao.Text;
end;

procedure TDepto02.BT_AlterarClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Update fb_depto Set fb_depto_descricao = '+#39+ Trim(Depto_Descricao.Text) +#39+ ' Where fb_depto_numero = ' + Trim(Depto_Numero.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        Depto02.Close;
     End;
end;

end.
