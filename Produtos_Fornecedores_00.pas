unit Produtos_Fornecedores_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TProdutosFornecedores00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Produtos: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Total_Produtos: TLabel;
    Label1: TLabel;
    Lista_Fornecedores: TComboBox;
    BT_Procurar: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBGrid_ProdutosCellClick(Column: TColumn);
  private
    { Private declarations }
    procedure Carrega_Fornecedores();

  public
    { Public declarations }
  end;

var
  ProdutosFornecedores00: TProdutosFornecedores00;

implementation

uses Conexao_BD, Rotinas_Gerais, Produtos_01, Produtos_02;

var Selecionado: string;

{$R *.dfm}

procedure TProdutosFornecedores00.BT_SairClick(Sender: TObject);
begin
     ProdutosFornecedores00.Close;
end;

procedure TProdutosFornecedores00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ConexaoBD.SQL_Produtos.Close;

     Action := caFree;
     Release;
     ProdutosFornecedores00 := Nil;
end;

procedure TProdutosFornecedores00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss'; 
end;

procedure TProdutosFornecedores00.FormShow(Sender: TObject);
begin
     //*** Obtem os Fornecedores ***
     Carrega_Fornecedores();
end;

procedure TProdutosFornecedores00.Carrega_Fornecedores();
begin
     // Obtem os Fornecedores

     ConexaoBD.SQL_Fornecedores.Close;
     ConexaoBD.SQL_Fornecedores.SQL.Clear;
     ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_area = '+#39+ 'Compras' +#39+ ' Order By fb_fornecedor_nome');
     ConexaoBD.SQL_Fornecedores.Open;

     If conexaoBD.SQL_Fornecedores.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Fornecedores.First;

        While Not conexaoBD.SQL_Fornecedores.Eof Do
              begin
              Lista_Fornecedores.Items.Add(Trim(conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text) + ' - ' + Trim(conexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text));
              conexaoBD.SQL_Fornecedores.Next;
        End;
     end;

     ConexaoBD.SQL_Fornecedores.Close;

     Lista_Fornecedores.ItemIndex := 0;
end;

procedure TProdutosFornecedores00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     ConexaoBD.SQL_Produtos.Close;
     ConexaoBD.SQL_Produtos.SQL.Clear;
     ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_fornecedor = ' + Obtem_Nro_Antes_Traco(Lista_Fornecedores.Text) + ' Order By fb_produto_codigo');
     ConexaoBD.SQL_Produtos.Open;

     Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_Produtos.RecordCount);

     Seta();
end;

procedure TProdutosFornecedores00.BT_IncluirClick(Sender: TObject);
begin
     Application.CreateForm(TProdutos01,Produtos01);

     Produtos01.Caption := 'Cadastro de Produtos - INCLUSÃO';
     Produtos01.Produto_Fornecedor.Text := Obtem_Nro_Antes_Traco(Lista_Fornecedores.Text);

     Produtos01.ShowModal;
     Produtos01.Destroy;

     ConexaoBD.SQL_Produtos.Close;
     ConexaoBD.SQL_Produtos.SQL.Clear;
     ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_fornecedor = ' + Obtem_Nro_Antes_Traco(Lista_Fornecedores.Text) + ' Order By fb_produto_codigo');
     ConexaoBD.SQL_Produtos.Open;

     Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_Produtos.RecordCount);
end;

procedure TProdutosFornecedores00.DBGrid_ProdutosCellClick(
  Column: TColumn);
var
    Codigo_Produto: String;
begin
    If DBGrid_Produtos.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Produtos.Fields[0].Text;

      Ampulheta();
      Application.CreateForm(TProdutos02,Produtos02);

      Produtos02.Caption := 'Cadastro de Produtos - ALTERAÇÃO / EXCLUSÃO';

      //*** Obtem os Dados do Produto ***

      Codigo_Produto := DBGrid_Produtos.Fields[0].Text;

      ConexaoBD.SQL_Produtos.Close;
      ConexaoBD.SQL_Produtos.SQL.Clear;
      ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' + #39 + Trim(Codigo_Produto) + #39);
      ConexaoBD.SQL_Produtos.Open;

      //*** Carrega os Dados Obtidos ***

      Produtos02.Produto_Codigo.Text             := ConexaoBD.SQL_Produtosfb_produto_codigo.Text;
      Produtos02.Produto_Referencia.Text         := ConexaoBD.SQL_Produtosfb_produto_referencia.Text;
      Produtos02.Produto_Descricao.Text          := ConexaoBD.SQL_Produtosfb_produto_descricao.Text;
      Produtos02.Nro_Familia_Produto.Text        := IntToStr(Obtem_Nro_Familia_Produto(ConexaoBD.SQL_Produtosfb_produto_familia.Text));
      Produtos02.Nro_Tipo_Produto.Text           := IntToStr(Obtem_Nro_Tipo_Produto(ConexaoBD.SQL_Produtosfb_produto_tipo.Text));
      Produtos02.Produto_Lote.Text               := ConexaoBD.SQL_Produtosfb_produto_lote.Text;
      Produtos02.Produto_Codigo_Barras.Text      := ConexaoBD.SQL_Produtosfb_produto_codigo_barras.Text;
      Produtos02.Produto_Unidade.Text            := ConexaoBD.SQL_Produtosfb_produto_unidade.Text;
      Produtos02.Produto_Unidade_Pesagem.Text    := ConexaoBD.SQL_Produtosfb_produto_unidade_pesagem.Text;
      Produtos02.Produto_Peso.Text               := ConexaoBD.SQL_Produtosfb_produto_peso.Text;
      Produtos02.Produto_Estoque_Inicial.Text    := ConexaoBD.SQL_Produtosfb_produto_estoque_inicial.Text;
      Produtos02.Produto_Estoque_Atual.Text      := ConexaoBD.SQL_Produtosfb_produto_estoque_atual.Text;
      Produtos02.Produto_Data_Alteracao.Text     := ConexaoBD.SQL_Produtosfb_produto_data_alteracao.Text;
      Produtos02.Produto_Classif_Fiscal.Text     := ConexaoBD.SQL_Produtosfb_produto_classif_fiscal.Text;
      Produtos02.Produto_Classif_Tributaria.Text := ConexaoBD.SQL_Produtosfb_produto_classif_tributaria.Text;
      Produtos02.Produto_Pedido_Padrao.ItemIndex := Obtem_Nro_Produto_Pedido_Padrao(ConexaoBD.SQL_Produtosfb_produto_pedido_padrao.Text);
      Produtos02.Produto_IPI.Text                := ConexaoBD.SQL_Produtosfb_produto_ipi.Text;
      Produtos02.Produto_ICMS.Text               := ConexaoBD.SQL_Produtosfb_produto_icms.Text;
      Produtos02.Produto_Preco.Text              := ConexaoBD.SQL_Produtosfb_produto_preco.Text;
      Produtos02.Produto_Fornecedor.Text         := ConexaoBD.SQL_Produtosfb_produto_fornecedor.Text;

      //*** Fecha SQL ***

      ConexaoBD.SQL_Produtos.Close;

      Seta();

      Produtos02.ShowModal;
      Produtos02.Destroy;

      ConexaoBD.SQL_Produtos.Close;
      ConexaoBD.SQL_Produtos.SQL.Clear;
      ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_fornecedor = ' + Obtem_Nro_Antes_Traco(Lista_Fornecedores.Text) + ' Order By fb_produto_codigo');
      ConexaoBD.SQL_Produtos.Open;

      Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_Produtos.RecordCount);

      ConexaoBD.SQL_Produtos.Locate('fb_produto_codigo',Trim(Selecionado),[]);
    End;
end;

end.
