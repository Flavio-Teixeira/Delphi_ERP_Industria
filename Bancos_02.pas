unit Bancos_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TBancos02 = class(TForm)
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    BT_Excluir: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Banco_Codigo: TEdit;
    Banco_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Banco_DescricaoKeyPress(Sender: TObject; var Key: Char);
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
  Bancos02: TBancos02;
  Banco_Descricao_Ant: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

function TBancos02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Banco_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição do Banco não foi informada';
        Campo_Retorno := 'Banco_Descricao';
        End
     Else
        Begin
        If Banco_Descricao.Text <> Banco_Descricao_Ant Then
           Begin
           ConexaoBD.SQL_Bancos.SQL.Clear;
           ConexaoBD.SQL_Bancos.SQL.Add('Select * from fb_bancos Where fb_banco_descricao = ' +#39+ Trim(Banco_Descricao.Text) +#39);
           ConexaoBD.SQL_Bancos.Open;

           If ConexaoBD.SQL_Bancos.RecordCount > 0 Then
              Begin
              Erro          := 'A Descrição do Banco Já existe';
              Campo_Retorno := 'Banco_Descricao';
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
        If Campo_Retorno = 'Banco_Descricao' Then
           Begin
           Banco_Descricao.SetFocus;
        End;
     End;

     Result := Resultado;
end;

procedure TBancos02.BT_SairClick(Sender: TObject);
begin
     Bancos02.Close;
end;

procedure TBancos02.Banco_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBancos02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_bancos Where fb_banco_codigo = ' +  Trim(Banco_Codigo.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Bancos02.Close;
     End;
end;

procedure TBancos02.FormShow(Sender: TObject);
begin
    Banco_Descricao_Ant := Banco_Descricao.Text;
end;

procedure TBancos02.BT_AlterarClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Update fb_bancos Set fb_banco_descricao = '+#39+ Trim(Banco_Descricao.Text) +#39+ ' Where fb_banco_codigo = ' + Trim(Banco_Codigo.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        Bancos02.Close;
     End;
end;

end.
