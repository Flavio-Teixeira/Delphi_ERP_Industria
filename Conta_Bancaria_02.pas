unit Conta_Bancaria_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TContaBancaria02 = class(TForm)
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    BT_Excluir: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Conta_Bancaria_Banco: TEdit;
    Conta_Bancaria_Agencia: TEdit;
    Conta_Bancaria_Conta: TEdit;
    Conta_Bancaria_Titular: TEdit;
    Label5: TLabel;
    Conta_Bancaria_Nro: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Banco_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  ContaBancaria02: TContaBancaria02;
  Banco_Descricao_Ant: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

function TContaBancaria02.Valida_Dados(): Boolean;

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

procedure TContaBancaria02.BT_SairClick(Sender: TObject);
begin
     ContaBancaria02.Close;
end;

procedure TContaBancaria02.Banco_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContaBancaria02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_contas_bancarias Where fb_conta_bancaria_nro = ' +  Trim(Conta_Bancaria_Nro.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        ContaBancaria02.Close;
     End;
end;

procedure TContaBancaria02.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL: String;

begin
     If Valida_Dados() Then
        Begin
        Comando_SQL := 'Update fb_contas_bancarias Set ';
        Comando_SQL := Comando_SQL + 'fb_conta_bancaria_banco = ' + #39 + Trim(Conta_Bancaria_Banco.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_conta_bancaria_agencia = ' + #39 + Trim(Conta_Bancaria_Agencia.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_conta_bancaria_conta = ' + #39 + Trim(Conta_Bancaria_Conta.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_conta_bancaria_titular = ' + #39 + Trim(Conta_Bancaria_Titular.Text) + #39 + ' ';
        Comando_SQL := Comando_SQL + ' Where fb_conta_bancaria_nro = ' +  Trim(Conta_Bancaria_Nro.Text);

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        ContaBancaria02.Close;
     End;
end;

end.
