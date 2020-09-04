unit Saldo_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TSaldo02 = class(TForm)
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    BT_Excluir: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label37: TLabel;
    Label1: TLabel;
    Saldo_Conta: TLabel;
    Saldo_Data: TMaskEdit;
    Saldo_Valor: TEdit;
    Label5: TLabel;
    Saldo_Nro: TEdit;
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
  Saldo02: TSaldo02;
  Banco_Descricao_Ant: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

function TSaldo02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Saldo_Data.Text) = '/  /' Then
        Begin
        Erro          := 'A Data do Saldo não foi informada';
        Campo_Retorno := 'Saldo_Data';
        End
     Else If Trim(Saldo_Valor.Text) = '' Then
        Begin
        Erro          := 'O Valor do Saldo não foi informado';
        Campo_Retorno := 'Saldo_Valor';
     End;

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Saldo_Data' Then
           Begin
           Saldo_Data.SetFocus;
           End
        Else If Campo_Retorno = 'Saldo_Valor' Then
           Begin
           Saldo_Valor.SetFocus;
        End;
     End;

     Result := Resultado;
end;

procedure TSaldo02.BT_SairClick(Sender: TObject);
begin
     Saldo02.Close;
end;

procedure TSaldo02.Banco_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TSaldo02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_saldos Where fb_saldo_nro = ' +  Trim(Saldo_Nro.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Saldo02.Close;
     End;
end;

procedure TSaldo02.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL, Nro_Conta: String;

begin
     If Valida_Dados() Then
        Begin
        Comando_SQL := 'Update fb_saldos Set ';
        Comando_SQL := Comando_SQL + 'fb_saldo_data  = ' + #39 + Inverte_Data_Plus(Trim(Saldo_Data.Text),'amd','/') + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_saldo_valor = ' + Virgula_Ponto(Saldo_Valor.Text) + ' ';
        Comando_SQL := Comando_SQL + ' Where fb_saldo_nro = ' +  Trim(Saldo_Nro.Text);

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        Saldo02.Close;
     End;
end;

end.
