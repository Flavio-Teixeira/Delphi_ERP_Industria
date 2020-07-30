unit Bancos_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TBancos01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Banco_Codigo: TEdit;
    Banco_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Banco_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure Banco_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  Bancos01: TBancos01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

function TBancos01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Banco_Codigo.Text) = '' Then
        Begin
        Erro          := 'O Código do Banco não foi informado';
        Campo_Retorno := 'Banco_Codigo';
        End
     Else If Trim(Banco_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição do Banco não foi informada';
        Campo_Retorno := 'Banco_Descricao';
        End
     Else
        Begin
        ConexaoBD.SQL_Bancos.SQL.Clear;
        ConexaoBD.SQL_Bancos.SQL.Add('Select * from fb_bancos Where fb_banco_codigo = ' + Trim(Banco_Codigo.Text));
        ConexaoBD.SQL_Bancos.Open;

        If ConexaoBD.SQL_Bancos.RecordCount > 0 Then
           Begin
           Erro          := 'O Código do Banco Já existe';
           Campo_Retorno := 'Banco_Codigo';
           End
        Else
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
        If Campo_Retorno = 'Banco_Codigo' Then
           Begin
           Banco_Codigo.SetFocus;
           End
        Else If Campo_Retorno = 'Banco_Descricao' Then
           Begin
           Banco_Descricao.SetFocus;
        End;
     End;

     Result := Resultado;
end;

procedure TBancos01.BT_SairClick(Sender: TObject);
begin
     Bancos01.Close;
end;

procedure TBancos01.Banco_CodigoKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBancos01.Banco_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBancos01.BT_IncluirClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into fb_bancos(fb_banco_codigo, fb_banco_descricao) Values(' +  Trim(Banco_Codigo.Text) + ',' +#39+ Trim(Banco_Descricao.Text) +#39+ ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outro Banco?') = 6 Then
           Begin
           Banco_Codigo.Text    := '';
           Banco_Descricao.Text := '';
           Banco_Codigo.SetFocus;
           End
        Else
           Begin
           Bancos01.Close;
        End;
     End;
end;

procedure TBancos01.FormShow(Sender: TObject);
begin
     Banco_Codigo.SetFocus;
end;

end.
