unit SubProcessos_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TSubProcessos01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    SubProcesso_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure SubProcesso_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  SubProcessos01: TSubProcessos01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

function TSubProcessos01.Valida_Dados(): Boolean;

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
        ConexaoBD.SQL_SubProcessos.SQL.Clear;
        ConexaoBD.SQL_SubProcessos.SQL.Add('Select * from fb_subprocessos Where fb_subprocesso_descricao = ' +#39+ Trim(SubProcesso_Descricao.Text) +#39);
        ConexaoBD.SQL_SubProcessos.Open;

        If ConexaoBD.SQL_SubProcessos.RecordCount > 0 Then
           Begin
           Erro          := 'A Descrição do Sub-Processo Já existe';
           Campo_Retorno := 'SubProcesso_Descricao';
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

procedure TSubProcessos01.BT_SairClick(Sender: TObject);
begin
     SubProcessos01.Close;
end;

procedure TSubProcessos01.SubProcesso_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TSubProcessos01.BT_IncluirClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into fb_subprocessos(fb_subprocesso_descricao) Values(' +#39+ Trim(SubProcesso_Descricao.Text) +#39+ ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outro Sub-Processo?') = 6 Then
           Begin
           SubProcesso_Descricao.Text := '';
           SubProcesso_Descricao.SetFocus;
           End
        Else
           Begin
           SubProcessos01.Close;
        End;
     End;
end;

procedure TSubProcessos01.FormShow(Sender: TObject);
begin
     SubProcesso_Descricao.SetFocus;
end;

end.
