unit SubProcessos_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TSubProcessos02 = class(TForm)
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    BT_Excluir: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    SubProcesso_Codigo: TEdit;
    SubProcesso_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure SubProcesso_DescricaoKeyPress(Sender: TObject; var Key: Char);
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
  SubProcessos02: TSubProcessos02;
  SubProcesso_Descricao_Ant: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

function TSubProcessos02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(SubProcesso_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição do Sub-Processo não foi informada';
        Campo_Retorno := 'SubProcesso_Descricao';
        End
     Else
        Begin
        If SubProcesso_Descricao.Text <> SubProcesso_Descricao_Ant Then
           Begin
           ConexaoBD.SQL_SubProcessos.SQL.Clear;
           ConexaoBD.SQL_SubProcessos.SQL.Add('Select * from fb_subprocessos Where fb_subprocesso_descricao = ' +#39+ Trim(SubProcesso_Descricao.Text) +#39);
           ConexaoBD.SQL_SubProcessos.Open;

           If ConexaoBD.SQL_SubProcessos.RecordCount > 0 Then
              Begin
              Erro          := 'A Descrição do Sub-Processo Já existe';
              Campo_Retorno := 'SubProcesso_Descricao';
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
        If Campo_Retorno = 'SubProcesso_Descricao' Then
           Begin
           SubProcesso_Descricao.SetFocus;
        End;
     End;

     Result := Resultado;
end;

procedure TSubProcessos02.BT_SairClick(Sender: TObject);
begin
     SubProcessos02.Close;
end;

procedure TSubProcessos02.SubProcesso_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TSubProcessos02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_subprocessos Where fb_subprocesso_codigo = ' +  Trim(SubProcesso_Codigo.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        SubProcessos02.Close;
     End;
end;

procedure TSubProcessos02.FormShow(Sender: TObject);
begin
    SubProcesso_Descricao_Ant := SubProcesso_Descricao.Text;
end;

procedure TSubProcessos02.BT_AlterarClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Update fb_subprocessos Set fb_subprocesso_descricao = '+#39+ Trim(SubProcesso_Descricao.Text) +#39+ ' Where fb_subprocesso_codigo = ' + Trim(SubProcesso_Codigo.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        SubProcessos02.Close;
     End;
end;

end.
