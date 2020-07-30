unit Login_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, WinSkinData;

type
  TLogin00 = class(TForm)
    Panel1: TPanel;
    Dados_Funcionarios: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Usuario: TEdit;
    Codigo: TEdit;
    Login_Mensagem: TLabel;
    btn_OK: TBitBtn;
    btn_Cancel: TBitBtn;
    Senha_Codigo: TEdit;
    Senha_Usuario: TEdit;
    Senha_Tipo: TEdit;
    Sistema_Data_Dia: TEdit;
    Sistema_Dolar_Dia: TEdit;
    procedure bfb_SairClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UsuarioChange(Sender: TObject);
    procedure CodigoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Dolar_ValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login00: TLogin00;
  Contador: Integer;
  Comando_SQL : String;
implementation

uses Rotinas_Gerais, Conexao_BD, Ibrasmak_00, Splash_Screen;

{$R *.dfm}

procedure Verifica_Login();
var
   ValorSenha: String;
begin
    if Contador=4 then
      begin
      Contador:=0;
    end;

    //*** Verifica se o Usuário Existe ***

    ConexaoBD.SQL_Senhas.Close;
    ConexaoBD.SQL_Senhas.SQL.Clear;
    ConexaoBD.SQL_Senhas.SQL.Add('Select * from senhas where senha_usuario = "'+ Trim(Login00.Usuario.Text)+ '"');
    ConexaoBD.SQL_Senhas.Open;

    If ConexaoBD.SQL_Senhas.RecordCount <= 0 then
      Begin

      Login00.Login_Mensagem.Caption:='Login Recusado, Usuário Desconhecido...';

      Contador := Contador + 1;

      if Contador = 4 then
        begin
        Login00.Close;
      end;
      
      Login00.Usuario.SetFocus;
      Exit;

      end
    else
      begin
      
      ValorSenha := ConexaoBD.SQL_Senhassenha_codigo.AsString;

      if ValorSenha <> Login00.Codigo.Text then
        begin

        Login00.Login_Mensagem.Caption:='Login Recusado, Senha Inválida...';

        Contador := Contador + 1;

        if Contador = 4 then
          begin
          Login00.Close;
        end;

        Login00.Codigo.SetFocus;
        Exit;

      End;

      //*** Aramazena os Dados do Funcionário logado ***
      Login00.Senha_Codigo.Text :=   ConexaoBD.SQL_Senhassenha_codigo.AsString;
      Login00.Senha_Usuario.Text:=   ConexaoBD.SQL_Senhassenha_usuario.AsString;

      ConexaoBD.SQL_Senhas.Close;
      ConexaoBD.SQL_Senhas.SQL.Clear;

      //*** Cria o próximo formlulário e oculta este ***
      Login00.Visible := False;

      Application.CreateForm(TIbrasmak00,Ibrasmak00);
      Ibrasmak00.Login.Text := Trim(Login00.Usuario.Text);
      Ibrasmak00.ShowModal;
      Ibrasmak00.Destroy;
      Login00.Close;

    End;
End;

procedure TLogin00.bfb_SairClick(Sender: TObject);
begin
    Login00.Close;
end;

procedure TLogin00.btn_OKClick(Sender: TObject);
begin
    Verifica_Login();
end;

procedure TLogin00.UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
      begin
      Codigo.SetFocus;
    end;
end;

procedure TLogin00.CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
      begin
      Verifica_Login();
    end;
end;

procedure TLogin00.btn_CancelClick(Sender: TObject);
begin
  Login00.Close;
end;

procedure TLogin00.FormCreate(Sender: TObject);
begin
    //*** Trabalha com o Ano de 4 Dígitos ***
    ShortDateFormat := 'dd/mm/yyyy';

    //*** Formata da Data conforme o Padrão Desejado ***
    ShortTimeFormat := 'hh:mm:ss';
end;

procedure TLogin00.UsuarioChange(Sender: TObject);
begin
    If (Usuario.Text<>'') Then Login_Mensagem.Caption:='';
end;

procedure TLogin00.CodigoChange(Sender: TObject);
begin
    If (Codigo.Text<>'') Then Login_Mensagem.Caption:='';
end;

procedure TLogin00.FormShow(Sender: TObject);

var Data_Dolar: String;

begin
    If Not ConexaoBD.Conexao_Principal.Connected Then
      Begin
      Application.CreateForm(TSplashScreen,SplashScreen);
      SplashScreen.Show;
      SplashScreen.Update;

      Abre_Conexao();

      SplashScreen.Hide;
      SplashScreen.Free;

      Dados_Funcionarios.Visible := True;
      btn_OK.Enabled             := True;
      Usuario.SetFocus;
    End;
end;

procedure TLogin00.Dolar_ValorKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
