unit Natureza_Operacao_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TNaturezaOperacao02 = class(TForm)
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    BT_Excluir: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Natureza_Operacao_Descricao_Curta: TEdit;
    Label3: TLabel;
    Natureza_Operacao_Descricao_Longa: TEdit;
    Label4: TLabel;
    Natureza_Operacao_CFOP: TEdit;
    Label5: TLabel;
    Natureza_Operacao_Observacao_Nota: TMemo;
    Natureza_Operacao_Numero: TEdit;
    Natureza_Operacao_Revenda: TCheckBox;
    procedure BT_SairClick(Sender: TObject);
    procedure Depto_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Natureza_Operacao_Observacao_NotaKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  NaturezaOperacao02: TNaturezaOperacao02;
  Depto_Descricao_Ant: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00, Depto_02;

{$R *.dfm}

function TNaturezaOperacao02.Valida_Dados(): Boolean;

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

procedure TNaturezaOperacao02.BT_SairClick(Sender: TObject);
begin
     NaturezaOperacao02.Close;
end;

procedure TNaturezaOperacao02.Depto_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNaturezaOperacao02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_naturezas_operacao Where fb_natureza_operacao_nro = ' +  Trim(Natureza_Operacao_Numero.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        NaturezaOperacao02.Close;
     End;
end;

procedure TNaturezaOperacao02.BT_AlterarClick(Sender: TObject);
var
  Comando_SQL : string;

begin
     If Valida_Dados() Then
        Begin

        Comando_SQL := 'Update fb_naturezas_operacao Set ';
        Comando_SQL := Comando_SQL + 'fb_natureza_operacao_descricao_curta  = '+#39+ Trim(Natureza_Operacao_Descricao_Curta.Text)+#39+', ';
        Comando_SQL := Comando_SQL + 'fb_natureza_operacao_descricao_longa  = '+#39+ Trim(Natureza_Operacao_Descricao_Longa.Text)+#39+', ';
        Comando_SQL := Comando_SQL + 'fb_natureza_operacao_cfop             = '+#39+ Trim(Natureza_Operacao_CFOP.Text)+#39+', ';
        Comando_SQL := Comando_SQL + 'fb_natureza_operacao_observacao_nota  = '+#39+ Trim(Natureza_Operacao_Observacao_Nota.Text)+#39+', ';
        Comando_SQL := Comando_SQL + 'fb_natureza_operacao_revenda  = '+#39+ Trim(BoolToStr(Natureza_Operacao_Revenda.Checked))+#39+' ';
        Comando_SQL := Comando_SQL + 'Where fb_natureza_operacao_nro        = '+Trim(Natureza_Operacao_Numero.Text);

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        NaturezaOperacao02.Close;
     End;
end;

procedure TNaturezaOperacao02.Natureza_Operacao_Observacao_NotaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
