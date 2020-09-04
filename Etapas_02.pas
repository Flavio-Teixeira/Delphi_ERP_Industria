unit Etapas_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TEtapas02 = class(TForm)
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    BT_Excluir: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Etapa_Codigo: TEdit;
    Etapa_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Etapa_DescricaoKeyPress(Sender: TObject; var Key: Char);
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
  Etapas02: TEtapas02;
  Etapa_Descricao_Ant: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

function TEtapas02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Etapa_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição da Etapa não foi informada';
        Campo_Retorno := 'Etapa_Descricao';
        End
     Else
        Begin
        If Etapa_Descricao.Text <> Etapa_Descricao_Ant Then
           Begin
           ConexaoBD.SQL_Etapas.SQL.Clear;
           ConexaoBD.SQL_Etapas.SQL.Add('Select * from fb_etapas Where fb_etapa_descricao = ' +#39+ Trim(Etapa_Descricao.Text) +#39);
           ConexaoBD.SQL_Etapas.Open;

           If ConexaoBD.SQL_Etapas.RecordCount > 0 Then
              Begin
              Erro          := 'A Descrição da Etapa Já existe';
              Campo_Retorno := 'Etapa_Descricao';
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
        If Campo_Retorno = 'Etapa_Descricao' Then
           Begin
           Etapa_Descricao.SetFocus;
        End;
     End;

     Result := Resultado;
end;

procedure TEtapas02.BT_SairClick(Sender: TObject);
begin
     Etapas02.Close;
end;

procedure TEtapas02.Etapa_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtapas02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_etapas Where fb_etapa_codigo = ' +  Trim(Etapa_Codigo.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Etapas02.Close;
     End;
end;

procedure TEtapas02.FormShow(Sender: TObject);
begin
    Etapa_Descricao_Ant := Etapa_Descricao.Text;
end;

procedure TEtapas02.BT_AlterarClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Update fb_etapas Set fb_etapa_descricao = '+#39+ Trim(Etapa_Descricao.Text) +#39+ ' Where fb_etapa_codigo = ' + Trim(Etapa_Codigo.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        Etapas02.Close;
     End;
end;

end.
