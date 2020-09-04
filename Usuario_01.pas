unit Usuario_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TUsuario01 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    GroupBox1: TGroupBox;
    Confirma_Senha: TEdit;
    Label4: TLabel;
    Senha: TEdit;
    Label3: TLabel;
    Nome: TEdit;
    Label2: TLabel;
    Login: TEdit;
    Label1: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure LoginKeyPress(Sender: TObject; var Key: Char);
    procedure NomeKeyPress(Sender: TObject; var Key: Char);
    procedure SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure Confirma_SenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Usuario01: TUsuario01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TUsuario01.BT_SairClick(Sender: TObject);
begin
  Usuario01.Close;
end;

procedure TUsuario01.BT_IncluirClick(Sender: TObject);
var Comando_SQL : String;
begin
  if Trim(Login.Text) = '' Then
    begin
    MSG_Erro('Antes de proseguir preencha o campo login...');
    Login.SetFocus;
    end
  else
    begin
    ConexaoBD.SQL_Senhas.Close;
    ConexaoBD.SQL_Senhas.SQL.Clear;
    ConexaoBD.SQL_Senhas.SQL.Add('Select * from senhas where senha_codigo ='+#39+Trim(Login.Text)+#39);
    ConexaoBD.SQL_Senhas.Open;
    if ConexaoBD.SQL_Senhas.RecordCount > 0 Then
      begin
      MSG_Erro('Login ja existente...');
      Login.SetFocus;
      end
    else if Trim(Senha.Text) = '' Then
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
      Comando_SQL := 'Insert into senhas(';
      Comando_SQL := Comando_SQL + 'senha_usuario, ';
      Comando_SQL := Comando_SQL + 'senha_codigo, ';
      Comando_SQL := Comando_SQL + 'senha_nome_completo';
      Comando_SQL := Comando_SQL + ') values(';
      Comando_SQL := Comando_SQL +#39+ Trim(Login.Text) +#39+', ';
      Comando_SQL := Comando_SQL +#39+ Trim(Senha.Text) +#39+', ';
      Comando_SQL := Comando_SQL +#39+ Trim(Nome.Text) +#39;
      Comando_SQL := Comando_SQL + ')';

      ConexaoBD.SQL_Comunitario.Close;
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_Comunitario.ExecSQL;

      MSG_Erro('Inclusão efetuada com sucesso...');

      if Confirma('Deseja Incluir um novo Usuário?') = 6 Then
        begin
        Login.Text          := '';
        Nome.Text           := '';
        Senha.Text          := '';
        Confirma_Senha.Text := '';
        Login.SetFocus;
        end
      else
        begin
        Usuario01.Close;
      End;
    end;
    ConexaoBD.SQL_Senhas.Close;
  end;
end;

procedure TUsuario01.LoginKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TUsuario01.NomeKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TUsuario01.SenhaKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TUsuario01.Confirma_SenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

end.
