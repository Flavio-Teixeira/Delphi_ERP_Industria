unit Etapas_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TEtapas01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Etapa_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Etapa_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  Etapas01: TEtapas01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

function TEtapas01.Valida_Dados(): Boolean;

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
        ConexaoBD.SQL_Etapas.SQL.Clear;
        ConexaoBD.SQL_Etapas.SQL.Add('Select * from fb_etapas Where fb_etapa_descricao = ' +#39+ Trim(Etapa_Descricao.Text) +#39);
        ConexaoBD.SQL_Etapas.Open;

        If ConexaoBD.SQL_Etapas.RecordCount > 0 Then
           Begin
           Erro          := 'A Descrição da Etapa Já existe';
           Campo_Retorno := 'Etapa_Descricao';
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

procedure TEtapas01.BT_SairClick(Sender: TObject);
begin
     Etapas01.Close;
end;

procedure TEtapas01.Etapa_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtapas01.BT_IncluirClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into fb_etapas(fb_etapa_descricao) Values(' +#39+ Trim(Etapa_Descricao.Text) +#39+ ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outra Etapa?') = 6 Then
           Begin
           Etapa_Descricao.Text := '';
           Etapa_Descricao.SetFocus;
           End
        Else
           Begin
           Etapas01.Close;
        End;
     End;
end;

procedure TEtapas01.FormShow(Sender: TObject);
begin
     Etapa_Descricao.SetFocus;
end;

end.
