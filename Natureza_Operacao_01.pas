unit Natureza_Operacao_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TNaturezaOperacao01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Natureza_Operacao_Descricao_Curta: TEdit;
    Label1: TLabel;
    Natureza_Operacao_Descricao_Longa: TEdit;
    Label3: TLabel;
    Natureza_Operacao_CFOP: TEdit;
    Label4: TLabel;
    Natureza_Operacao_Observacao_Nota: TMemo;
    Natureza_Operacao_Revenda: TCheckBox;
    procedure BT_SairClick(Sender: TObject);
    procedure Natureza_Operacao_Descricao_CurtaKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Natureza_Operacao_Observacao_NotaKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  NaturezaOperacao01: TNaturezaOperacao01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

function TNaturezaOperacao01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Natureza_Operacao_Descricao_Curta.Text) = '' Then
        Begin
        Erro := 'A Descrição Curta não foi informada';
        Natureza_Operacao_Descricao_Curta.SetFocus;
        End

     Else If Trim(Natureza_Operacao_Descricao_Longa.Text) = '' Then
        Begin
        Erro := 'A Descrição Longa não foi informada';
        Natureza_Operacao_Descricao_Longa.SetFocus;
        End
        
     Else If Trim(Natureza_Operacao_CFOP.Text) = '' Then
        Begin
        Erro := 'O CFOP não foi informado';
        Natureza_Operacao_CFOP.SetFocus;
     End;

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     Result := Resultado;
end;

procedure TNaturezaOperacao01.BT_SairClick(Sender: TObject);
begin
     NaturezaOperacao01.Close;
end;

procedure TNaturezaOperacao01.Natureza_Operacao_Descricao_CurtaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNaturezaOperacao01.BT_IncluirClick(Sender: TObject);
var
  Comando_SQL : string;

begin
     If Valida_Dados() Then
        Begin

        Comando_SQL := 'Insert into fb_naturezas_operacao(';
        Comando_SQL := Comando_SQL + 'fb_natureza_operacao_descricao_curta, ';
        Comando_SQL := Comando_SQL + 'fb_natureza_operacao_descricao_longa, ';
        Comando_SQL := Comando_SQL + 'fb_natureza_operacao_cfop, ';
        Comando_SQL := Comando_SQL + 'fb_natureza_operacao_observacao_nota, ';
        Comando_SQL := Comando_SQL + 'fb_natureza_operacao_revenda) ';

        Comando_SQL := Comando_SQL + 'Values(';
        Comando_SQL := Comando_SQL +#39+ Trim(Natureza_Operacao_Descricao_Curta.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Natureza_Operacao_Descricao_Longa.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Natureza_Operacao_CFOP.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(Natureza_Operacao_Observacao_Nota.Text) +#39+ ',';
        Comando_SQL := Comando_SQL +#39+ Trim(BoolToStr(Natureza_Operacao_Revenda.Checked)) +#39+ ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outra Natureza de Operação?') = 6 Then
           Begin
           Natureza_Operacao_Descricao_Curta.Text := '';
           Natureza_Operacao_Descricao_Longa.Text := '';
           Natureza_Operacao_CFOP.Text            := '';
           Natureza_Operacao_Observacao_Nota.Text := '';
           Natureza_Operacao_Revenda.Checked      := False;
           End
        Else
           Begin
           NaturezaOperacao01.Close;
        End;
     End;
end;

procedure TNaturezaOperacao01.FormShow(Sender: TObject);
begin
     Natureza_Operacao_Descricao_Curta.SetFocus;
end;

procedure TNaturezaOperacao01.Natureza_Operacao_Observacao_NotaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
