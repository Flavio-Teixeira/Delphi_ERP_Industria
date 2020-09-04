unit Rel_Estoque_Produtos_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TRelEstoqueProdutos01 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Produto_Tipo: TComboBox;
    Panel3: TPanel;
    opc_vendas: TRadioButton;
    opc_compras: TRadioButton;
    opc_todos: TRadioButton;
    Label1: TLabel;
    opc_ordem: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Produto: TEdit;
    BT_Buscar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_BuscarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Carrega_Tipo_Produto();

  public
    { Public declarations }
  end;

var
  RelEstoqueProdutos01: TRelEstoqueProdutos01;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Estoque_Produtos_00, Ibrasmak_00,
  Adiciona_Produto_01;

{$R *.dfm}

//***************
//*** Funções ***
//***************

//******************
//*** Procedures ***
//******************

procedure TRelEstoqueProdutos01.Carrega_Tipo_Produto();
begin
     // Obtem os Tipos de Produtos

     ConexaoBD.SQL_Tipo_Produto.Close;
     ConexaoBD.SQL_Tipo_Produto.SQL.Clear;
     ConexaoBD.SQL_Tipo_Produto.SQL.Add('Select * from fb_tipos_produtos Order By fb_tipo_produto_descricao');
     ConexaoBD.SQL_Tipo_Produto.Open;

     Produto_Tipo.Items.Clear;
     Produto_Tipo.Items.Add('--- Todos os Tipos ---');

     If conexaoBD.SQL_Tipo_Produto.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Tipo_Produto.First;

        While Not conexaoBD.SQL_Tipo_Produto.Eof Do
              begin
              Produto_Tipo.Items.Add(IntToStr(conexaoBD.SQL_Tipo_Produtofb_tipo_produto_codigo.AsInteger)+' - '+conexaoBD.SQL_Tipo_Produtofb_tipo_produto_descricao.AsString);
              conexaoBD.SQL_Tipo_Produto.Next;
        End;
     end;

     ConexaoBD.SQL_Tipo_Produto.Close;

     Produto_Tipo.ItemIndex := 0;
end;

procedure TRelEstoqueProdutos01.FormShow(Sender: TObject);
begin
    Carrega_Tipo_Produto();
end;

procedure TRelEstoqueProdutos01.BT_ImprimirClick(Sender: TObject);

var
   Tipo_Produto: String;

begin
     Tipo_Produto := Obtem_Nro_Antes_Traco(Produto_Tipo.Text);

     Ampulheta();

     Application.CreateForm(TRelEstoqueProdutos00,RelEstoqueProdutos00);

     If Trim(Tipo_Produto) = '' Then
        Begin

        If opc_todos.Checked Then
           Begin

           If Trim(opc_ordem.Text) = 'Código' Then
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_codigo');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_codigo');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
              End
           Else
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_descricao');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_descricao');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
           End;

           End
        Else If opc_compras.Checked Then
           Begin

           If Trim(opc_ordem.Text) = 'Código' Then
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos where fb_produto_fornecedor > 0 And fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_codigo');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos where fb_produto_fornecedor > 0 Order By fb_produto_codigo');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
              End
           Else
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos where fb_produto_fornecedor > 0 And fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_descricao');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos where fb_produto_fornecedor > 0 Order By fb_produto_descricao');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
           End;

           End
        Else If opc_vendas.Checked Then
           Begin

           If Trim(opc_ordem.Text) = 'Código' Then
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos where (fb_produto_fornecedor <= 0 Or fb_produto_fornecedor = '+#39+#39' Or fb_produto_fornecedor = '+#39+'Null'+#39' Or fb_produto_fornecedor = '+#39+'NULL'+#39') And fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_codigo');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos where (fb_produto_fornecedor <= 0 Or fb_produto_fornecedor = '+#39+#39' Or fb_produto_fornecedor = '+#39+'Null'+#39' Or fb_produto_fornecedor = '+#39+'NULL'+#39') Order By fb_produto_codigo');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
              End
           Else
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos where (fb_produto_fornecedor <= 0 Or fb_produto_fornecedor = '+#39+#39' Or fb_produto_fornecedor = '+#39+'Null'+#39' Or fb_produto_fornecedor = '+#39+'NULL'+#39') And fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_descricao');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos where (fb_produto_fornecedor <= 0 Or fb_produto_fornecedor = '+#39+#39' Or fb_produto_fornecedor = '+#39+'Null'+#39' Or fb_produto_fornecedor = '+#39+'NULL'+#39') Order By fb_produto_descricao');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
           End;

        End;

        End
     Else
        Begin

        If opc_todos.Checked Then
           Begin

           If Trim(opc_ordem.Text) = 'Código' Then
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' And fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_codigo');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' Order By fb_produto_codigo');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
              End
           Else
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' And fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_descricao');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' Order By fb_produto_descricao');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
           End;

           End
        Else If opc_compras.Checked Then
           Begin

           If Trim(opc_ordem.Text) = 'Código' Then
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' And fb_produto_fornecedor > 0 And fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_codigo');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' And fb_produto_fornecedor > 0 Order By fb_produto_codigo');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
              End
           Else
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' And fb_produto_fornecedor > 0 And fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_descricao');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' And fb_produto_fornecedor > 0 Order By fb_produto_descricao');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
           End;

           End
        Else If opc_vendas.Checked Then
           Begin

           If Trim(opc_ordem.Text) = 'Código' Then
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' And (fb_produto_fornecedor <= 0 Or fb_produto_fornecedor = '+#39+#39' Or fb_produto_fornecedor = '+#39+'Null'+#39' Or fb_produto_fornecedor = '+#39+'NULL'+#39') And fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_codigo');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' And (fb_produto_fornecedor <= 0 Or fb_produto_fornecedor = '+#39+#39' Or fb_produto_fornecedor = '+#39+'Null'+#39' Or fb_produto_fornecedor = '+#39+'NULL'+#39') Order By fb_produto_codigo');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
              End
           Else
              Begin
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;

              If Trim(Produto.Text) <> '' Then
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' And (fb_produto_fornecedor <= 0 Or fb_produto_fornecedor = '+#39+#39' Or fb_produto_fornecedor = '+#39+'Null'+#39' Or fb_produto_fornecedor = '+#39+'NULL'+#39') And fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' Order By fb_produto_descricao');
                 End
              Else
                 Begin
                 ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Tipo_Produto) + ' And (fb_produto_fornecedor <= 0 Or fb_produto_fornecedor = '+#39+#39' Or fb_produto_fornecedor = '+#39+'Null'+#39' Or fb_produto_fornecedor = '+#39+'NULL'+#39') Order By fb_produto_descricao');
              End;

              ConexaoBD.SQL_FB_Produtos.Open;
           End;

        End;

     End;

     //*** Impressão do Relatório ***

     RelEstoqueProdutos00.Rel_Tipo_Produto.Caption := Trim(Produto_Tipo.Text);

     Seta();

     RelEstoqueProdutos00.QR_Produtos.Preview;
     RelEstoqueProdutos00.Destroy;

     ConexaoBD.SQL_FB_Produtos.Close;
end;

procedure TRelEstoqueProdutos01.BT_SairClick(Sender: TObject);
begin
     RelEstoqueProdutos01.Close;
end;

procedure TRelEstoqueProdutos01.BT_BuscarClick(Sender: TObject);
begin
    Application.CreateForm(TAdicionaProduto01,AdicionaProduto01);
    AdicionaProduto01.Programa_Anterior.Text := 'RelEstoqueProdutos01';
    AdicionaProduto01.ShowModal;
    AdicionaProduto01.Destroy;
end;

end.
