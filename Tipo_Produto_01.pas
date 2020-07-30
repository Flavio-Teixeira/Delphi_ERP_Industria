unit Tipo_Produto_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TTipoProduto01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Tipo_Produto_Codigo: TEdit;
    Tipo_Produto_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Tipo_Produto_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure Tipo_Produto_DescricaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  TipoProduto01: TTipoProduto01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TTipoProduto01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Tipo_Produto_Codigo.Text) = '' Then
        Begin
        Erro          := 'O Código do Tipo de Produto não foi informado';
        Campo_Retorno := 'Tipo_Produto_Codigo';
        End
     Else If Trim(Tipo_Produto_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição do Tipo de Produto não foi informada';
        Campo_Retorno := 'Tipo_Produto_Descricao';
        End
     Else
        Begin
        ConexaoBD.SQL_Tipo_Produto.SQL.Clear;
        ConexaoBD.SQL_Tipo_Produto.SQL.Add('Select * from fb_tipos_produtos Where fb_tipo_produto_codigo = ' + Trim(Tipo_Produto_Codigo.Text));
        ConexaoBD.SQL_Tipo_Produto.Open;

        If ConexaoBD.SQL_Tipo_Produto.RecordCount > 0 Then
           Begin
           Erro          := 'O Código do Tipo de Produto Já existe';
           Campo_Retorno := 'Tipo_Produto_Codigo';
           End
        Else
           Begin
           ConexaoBD.SQL_Tipo_Produto.SQL.Clear;
           ConexaoBD.SQL_Tipo_Produto.SQL.Add('Select * from fb_tipos_produtos Where fb_tipo_produto_descricao = ' +#39+ Trim(Tipo_Produto_Descricao.Text) +#39);
           ConexaoBD.SQL_Tipo_Produto.Open;

           If ConexaoBD.SQL_Tipo_Produto.RecordCount > 0 Then
              Begin
              Erro          := 'A Descrição do Tipo de Produto Já existe';
              Campo_Retorno := 'Tipo_Produto_Descricao';
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
        If Campo_Retorno = 'Tipo_Produto_Codigo' Then
           Begin
           Tipo_Produto_Codigo.SetFocus;
           End
        Else If Campo_Retorno = 'Tipo_Produto_Descricao' Then
           Begin
           Tipo_Produto_Descricao.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TTipoProduto01.BT_SairClick(Sender: TObject);
begin
     TipoProduto01.Close;
end;

procedure TTipoProduto01.Tipo_Produto_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTipoProduto01.Tipo_Produto_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TTipoProduto01.BT_IncluirClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into fb_tipos_produtos(fb_tipo_produto_codigo, fb_tipo_produto_descricao) Values(' +  Trim(Tipo_Produto_Codigo.Text) + ',' +#39+ Trim(Tipo_Produto_Descricao.Text) +#39+ ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão Efetuada...');

        If Confirma('Incluir Outro Tipo de Produto?') = 6 Then
           Begin
           Tipo_Produto_Codigo.Text    := '';
           Tipo_Produto_Descricao.Text := '';
           Tipo_Produto_Codigo.SetFocus;
           End
        Else
           Begin
           TipoProduto01.Close;
        End;
     End;
end;

end.
