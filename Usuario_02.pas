unit Usuario_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TUsuario02 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Confirma_Senha: TEdit;
    Senha: TEdit;
    Nome: TEdit;
    Login: TEdit;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure NomeKeyPress(Sender: TObject; var Key: Char);
    procedure SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure Confirma_SenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Usuario02: TUsuario02;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TUsuario02.BT_SairClick(Sender: TObject);
begin
  Usuario02.Close;
end;

procedure TUsuario02.BT_ExcluirClick(Sender: TObject);
begin
  if Confirma('Deseja realmente excluir o usuario(a) '+Trim(Login.Text)+'?') = 6 Then
    begin
    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add('Delete from senhas Where senha_usuario ='+#39+Trim(Login.Text)+#39);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    MSG_Erro('Exclusão efetuada com sucesso...');
    Usuario02.Close;
  end;
end;

procedure TUsuario02.FormShow(Sender: TObject);
begin
  ConexaoBD.SQL_Senhas.Close;
  ConexaoBD.SQL_Senhas.SQL.Clear;
  ConexaoBD.SQL_Senhas.SQL.Add('Select * from senhas Where senha_usuario ='+#39+Trim(Login.Text)+#39);
  ConexaoBD.SQL_Senhas.Open;

  Nome.Text           := ConexaoBD.SQL_Senhassenha_nome_completo.Text;
  Senha.Text          := ConexaoBD.SQL_Senhassenha_codigo.Text;

  Confirma_Senha.Text := ConexaoBD.SQL_Senhassenha_codigo.Text;

  ConexaoBD.SQL_Senhas.Close;
end;

procedure TUsuario02.BT_AlterarClick(Sender: TObject);
var Comando_SQL : String;
begin
  if Trim(Senha.Text) = '' Then
    begin
    MSG_Erro('Preencha o campo senha antes de prosseguir...');
    Senha.SetFocus;
    end
  else if Trim(Confirma_Senha.Text) = '' Then
    begin
    MSG_Erro('Preencha o campo confirmação de senha antes de prosseguir...');
    Confirma_Senha.SetFocus;
    end
  else if Trim(Senha.Text) <> Trim(Confirma_Senha.Text) Then
    begin
    MSG_Erro('Verifique senha e confirmação de senha digitadas...');
    Senha.SetFocus;
    end
  else
    begin
    Comando_SQL := 'Update senhas set ';
    Comando_SQL := Comando_SQL + 'senha_codigo ='+#39+ Trim(Senha.Text) +#39+', ';
    Comando_SQL := Comando_SQL + 'senha_nome_completo ='+#39+ Trim(Nome.Text) +#39+' ';
    Comando_SQL := Comando_SQL + 'Where senha_usuario ='+#39+ Trim(Login.Text) +#39;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    MSG_Erro('Alteração efetuada com sucesso...');
    Usuario02.Close;
  end;
end;

procedure TUsuario02.NomeKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TUsuario02.SenhaKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TUsuario02.Confirma_SenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

end.
