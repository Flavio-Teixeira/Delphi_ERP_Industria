unit Conta_Bancaria_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TContaBancaria01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Conta_Bancaria_Banco: TEdit;
    Label1: TLabel;
    Conta_Bancaria_Agencia: TEdit;
    Label3: TLabel;
    Conta_Bancaria_Conta: TEdit;
    Label4: TLabel;
    Conta_Bancaria_Titular: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Banco_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure Conta_Bancaria_BancoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Conta_Bancaria_AgenciaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Conta_Bancaria_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure Conta_Bancaria_TitularKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  ContaBancaria01: TContaBancaria01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

function TContaBancaria01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Conta_Bancaria_Banco.Text) = '' Then
        Begin
        Erro          := 'O Nome do Banco não foi informado';
        Campo_Retorno := 'Conta_Bancaria_Banco';
        End
     Else If Trim(Conta_Bancaria_Agencia.Text) = '' Then
        Begin
        Erro          := 'A Agência não foi informada';
        Campo_Retorno := 'Conta_Bancaria_Agencia';
        End
     Else If Trim(Conta_Bancaria_Conta.Text) = '' Then
        Begin
        Erro          := 'A Conta não foi informada';
        Campo_Retorno := 'Conta_Bancaria_Conta';
        End
     Else If Trim(Conta_Bancaria_Titular.Text) = '' Then
        Begin
        Erro          := 'O Titular não foi informado';
        Campo_Retorno := 'Conta_Bancaria_Titular';
     End;

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Conta_Bancaria_Banco' Then
           Begin
           Conta_Bancaria_Banco.SetFocus;
           End
        Else If Campo_Retorno = 'Conta_Bancaria_Agencia' Then
           Begin
           Conta_Bancaria_Agencia.SetFocus;
           End
        Else If Campo_Retorno = 'Conta_Bancaria_Conta' Then
           Begin
           Conta_Bancaria_Conta.SetFocus;
           End
        Else If Campo_Retorno = 'Conta_Bancaria_Titular' Then
           Begin
           Conta_Bancaria_Titular.SetFocus;
        End;
     End;

     Result := Resultado;
end;

procedure TContaBancaria01.BT_SairClick(Sender: TObject);
begin
     ContaBancaria01.Close;
end;

procedure TContaBancaria01.Banco_CodigoKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContaBancaria01.Conta_Bancaria_BancoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContaBancaria01.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL: String;

begin
     If Valida_Dados() Then
        Begin
        Comando_SQL := 'Insert into fb_contas_bancarias(';
        Comando_SQL := Comando_SQL + 'fb_conta_bancaria_banco, ';
        Comando_SQL := Comando_SQL + 'fb_conta_bancaria_agencia, ';
        Comando_SQL := Comando_SQL + 'fb_conta_bancaria_conta, ';
        Comando_SQL := Comando_SQL + 'fb_conta_bancaria_titular) ';
        Comando_SQL := Comando_SQL + 'Values(';
        Comando_SQL := Comando_SQL + #39 + Trim(Conta_Bancaria_Banco.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + #39 + Trim(Conta_Bancaria_Agencia.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + #39 + Trim(Conta_Bancaria_Conta.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + #39 + Trim(Conta_Bancaria_Titular.Text) + #39 + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outra Conta?') = 6 Then
           Begin
           Conta_Bancaria_Banco.Text   := '';
           Conta_Bancaria_Agencia.Text := '';
           Conta_Bancaria_Conta.Text   := '';
           Conta_Bancaria_Titular.Text := '';

           Conta_Bancaria_Banco.SetFocus;
           End
        Else
           Begin
           ContaBancaria01.Close;
        End;
     End;
end;

procedure TContaBancaria01.FormShow(Sender: TObject);
begin
     Conta_Bancaria_Banco.SetFocus;
end;

procedure TContaBancaria01.Conta_Bancaria_AgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContaBancaria01.Conta_Bancaria_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContaBancaria01.Conta_Bancaria_TitularKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
