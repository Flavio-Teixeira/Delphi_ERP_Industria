unit Familia_Produto_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFamiliaProduto01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Familia_Produto_Codigo: TEdit;
    Familia_Produto_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure Familia_Produto_CodigoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Familia_Produto_DescricaoKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  FamiliaProduto01: TFamiliaProduto01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TFamiliaProduto01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Familia_Produto_Codigo.Text) = '' Then
        Begin
        Erro          := 'O Código da Família do Produto não foi informado';
        Campo_Retorno := 'Familia_Produto_Codigo';
        End
     Else If Trim(Familia_Produto_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição da Família do Produto não foi informada';
        Campo_Retorno := 'Familia_Produto_Descricao';
        End
     Else
        Begin
        ConexaoBD.SQL_Familia_Produto.SQL.Clear;
        ConexaoBD.SQL_Familia_Produto.SQL.Add('Select * from fb_familias_produtos Where fb_familia_produto_codigo = ' + Trim(Familia_Produto_Codigo.Text));
        ConexaoBD.SQL_Familia_Produto.Open;

        If ConexaoBD.SQL_Familia_Produto.RecordCount > 0 Then
           Begin
           Erro          := 'O Código da Família do Produto Já existe';
           Campo_Retorno := 'Familia_Produto_Codigo';
           End
        Else
           Begin
           ConexaoBD.SQL_Familia_Produto.SQL.Clear;
           ConexaoBD.SQL_Familia_Produto.SQL.Add('Select * from fb_familias_produtos Where fb_familia_produto_descricao = ' +#39+ Trim(Familia_Produto_Descricao.Text) +#39);
           ConexaoBD.SQL_Familia_Produto.Open;

           If ConexaoBD.SQL_Familia_Produto.RecordCount > 0 Then
              Begin
              Erro          := 'A Descrição da Família do Produto Já existe';
              Campo_Retorno := 'Familia_Produto_Descricao';
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
        If Campo_Retorno = 'Familia_Produto_Codigo' Then
           Begin
           Familia_Produto_Codigo.SetFocus;
           End
        Else If Campo_Retorno = 'Familia_Produto_Descricao' Then
           Begin
           Familia_Produto_Descricao.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TFamiliaProduto01.BT_SairClick(Sender: TObject);
begin
     FamiliaProduto01.Close;
end;

procedure TFamiliaProduto01.BT_IncluirClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into fb_familias_produtos(fb_familia_produto_codigo, fb_familia_produto_descricao) Values(' +  Trim(Familia_Produto_Codigo.Text) + ',' +#39+ Trim(Familia_Produto_Descricao.Text) +#39+ ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outra Família de Produto?') = 6 Then
           Begin
           Familia_Produto_Codigo.Text    := '';
           Familia_Produto_Descricao.Text := '';
           Familia_Produto_Codigo.SetFocus;
           End
        Else
           Begin
           FamiliaProduto01.Close;
        End;
     End;
end;

procedure TFamiliaProduto01.Familia_Produto_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFamiliaProduto01.Familia_Produto_DescricaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
