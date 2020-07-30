unit Processos_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TProcessos02 = class(TForm)
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    BT_Excluir: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Processo_Codigo: TEdit;
    Processo_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Processo_DescricaoKeyPress(Sender: TObject; var Key: Char);
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
  Processos02: TProcessos02;
  Processo_Descricao_Ant: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

function TProcessos02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Processo_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição do Processo não foi informada';
        Campo_Retorno := 'Processo_Descricao';
        End
     Else
        Begin
        If Processo_Descricao.Text <> Processo_Descricao_Ant Then
           Begin
           ConexaoBD.SQL_Processos.SQL.Clear;
           ConexaoBD.SQL_Processos.SQL.Add('Select * from fb_processos Where fb_processo_descricao = ' +#39+ Trim(Processo_Descricao.Text) +#39);
           ConexaoBD.SQL_Processos.Open;

           If ConexaoBD.SQL_Processos.RecordCount > 0 Then
              Begin
              Erro          := 'A Descrição do Processo Já existe';
              Campo_Retorno := 'Processo_Descricao';
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
        If Campo_Retorno = 'Processo_Descricao' Then
           Begin
           Processo_Descricao.SetFocus;
        End;
     End;

     Result := Resultado;
end;

procedure TProcessos02.BT_SairClick(Sender: TObject);
begin
     Processos02.Close;
end;

procedure TProcessos02.Processo_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProcessos02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_processos Where fb_processo_codigo = ' +  Trim(Processo_Codigo.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Processos02.Close;
     End;
end;

procedure TProcessos02.FormShow(Sender: TObject);
begin
    Processo_Descricao_Ant := Processo_Descricao.Text;
end;

procedure TProcessos02.BT_AlterarClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Update fb_processos Set fb_processo_descricao = '+#39+ Trim(Processo_Descricao.Text) +#39+ ' Where fb_processo_codigo = ' + Trim(Processo_Codigo.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        Processos02.Close;
     End;
end;

end.
