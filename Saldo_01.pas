unit Saldo_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TSaldo01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Saldo_Data: TMaskEdit;
    Label11: TLabel;
    Label37: TLabel;
    Saldo_Valor: TEdit;
    Label1: TLabel;
    Saldo_Conta: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure Saldo_DataKeyPress(Sender: TObject;
      var Key: Char);
    procedure Saldo_ValorKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  Saldo01: TSaldo01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

function TSaldo01.Valida_Dados(): Boolean;

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

procedure TSaldo01.BT_SairClick(Sender: TObject);
begin
     Saldo01.Close;
end;

procedure TSaldo01.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL, Nro_Conta: String;

begin
     If Valida_Dados() Then
        Begin
        Nro_Conta := Obtem_Nro_Antes_Traco(Saldo_Conta.Caption);

        Comando_SQL := 'Insert into fb_saldos(';
        Comando_SQL := Comando_SQL + 'fb_saldo_conta, ';
        Comando_SQL := Comando_SQL + 'fb_saldo_data, ';
        Comando_SQL := Comando_SQL + 'fb_saldo_valor) ';
        Comando_SQL := Comando_SQL + 'Values(';
        Comando_SQL := Comando_SQL + Trim(Nro_Conta) + ', ';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Saldo_Data.Text),'amd','/') + #39 + ', ';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Saldo_Valor.Text) + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        Saldo01.Close;
     End;
end;

procedure TSaldo01.Saldo_DataKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TSaldo01.Saldo_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TSaldo01.FormShow(Sender: TObject);
begin
     Saldo_Data.Text := DateToStr(Date());
     Saldo_Data.SetFocus;
end;

end.
