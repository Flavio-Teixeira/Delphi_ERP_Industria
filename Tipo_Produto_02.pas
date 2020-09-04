unit Tipo_Produto_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TTipoProduto02 = class(TForm)
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    BT_Excluir: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Tipo_Produto_Codigo: TEdit;
    Tipo_Produto_Descricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Tipo_Produto_DescricaoKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  TipoProduto02: TTipoProduto02;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TTipoProduto02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Tipo_Produto_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição do Tipo de Produto não foi informada';
        Campo_Retorno := 'Tipo_Produto_Descricao';
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

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Tipo_Produto_Descricao' Then
           Begin
           Tipo_Produto_Descricao.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TTipoProduto02.BT_SairClick(Sender: TObject);
begin
     TipoProduto02.Close;
end;

procedure TTipoProduto02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_tipos_produtos Where fb_tipo_produto_codigo = ' +  Trim(Tipo_Produto_Codigo.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        TipoProduto02.Close;
     End;
end;

procedure TTipoProduto02.BT_AlterarClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Update fb_tipos_produtos Set fb_tipo_produto_descricao = '+#39+ Trim(Tipo_Produto_Descricao.Text) +#39+ ' Where fb_tipo_produto_codigo = ' + Trim(Tipo_Produto_Codigo.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        TipoProduto02.Close;
     End;
end;

procedure TTipoProduto02.Tipo_Produto_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
