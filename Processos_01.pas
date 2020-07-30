unit Processos_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TProcessos01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Processo_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Processo_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  Processos01: TProcessos01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

function TProcessos01.Valida_Dados(): Boolean;

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
        ConexaoBD.SQL_Processos.SQL.Clear;
        ConexaoBD.SQL_Processos.SQL.Add('Select * from fb_processos Where fb_processo_descricao = ' +#39+ Trim(Processo_Descricao.Text) +#39);
        ConexaoBD.SQL_Processos.Open;

        If ConexaoBD.SQL_Processos.RecordCount > 0 Then
           Begin
           Erro          := 'A Descrição do Processo Já existe';
           Campo_Retorno := 'Processo_Descricao';
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

procedure TProcessos01.BT_SairClick(Sender: TObject);
begin
     Processos01.Close;
end;

procedure TProcessos01.Processo_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProcessos01.BT_IncluirClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into fb_processos(fb_processo_descricao) Values(' +#39+ Trim(Processo_Descricao.Text) +#39+ ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outro Processo?') = 6 Then
           Begin
           Processo_Descricao.Text := '';
           Processo_Descricao.SetFocus;
           End
        Else
           Begin
           Processos01.Close;
        End;
     End;
end;

procedure TProcessos01.FormShow(Sender: TObject);
begin
     Processo_Descricao.SetFocus;
end;

end.
