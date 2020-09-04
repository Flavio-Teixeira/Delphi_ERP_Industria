unit Rel_Pedido_Compra_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TRelPedidoCompra00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Produto: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    BT_Buscar: TBitBtn;
    Label40: TLabel;
    Busca: TComboBox;
    BT_Visualizar: TBitBtn;
    procedure BT_ImprimirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_BuscarClick(Sender: TObject);
    procedure NovoClick(Sender: TObject);
    procedure BT_VisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelPedidoCompra00: TRelPedidoCompra00;

implementation

uses Rotinas_Gerais, Conexao_BD, Rel_Movimento_Estoque_01, Ibrasmak_00,
  Adiciona_Produto_01, Rel_Pedido_Compra_01, Rel_Movimento_Estoque_00,
  Rel_Pedido_Compra_02;

{$R *.dfm}

procedure TRelPedidoCompra00.BT_ImprimirClick(Sender: TObject);
var
  Comando_SQL : String;
begin
    Ampulheta();

    Application.CreateForm(TRelPedidoCompra01,RelPedidoCompra01);

    Comando_SQL := 'select * from fb_produtos where ';

    If(Produto.Text <> '') Then
    Begin
        Comando_SQL := Comando_SQL + 'fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' and ';
    End;

    If(Busca.ItemIndex = 0) Then
    Begin
        Comando_SQL := Comando_SQL + 'fb_produto_estoque_atual >= fb_produto_estoque_ideal and ';
    End
    Else
    Begin
        Comando_SQL := Comando_SQL + 'fb_produto_estoque_atual <= fb_produto_estoque_minimo and ';
    End;

    Comando_SQL := Comando_SQL + '1=1 ';

    Comando_SQL := Comando_SQL + 'Order By fb_produto_codigo';

    ConexaoBD.SQL_FB_Produtos.Close;
    ConexaoBD.SQL_FB_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Produtos.Open;

    Seta();

    If(Busca.ItemIndex = 0) Then
    Begin
        RelPedidoCompra01.QR_Titulo.Caption := 'Relatório de Pedido de Compra - Produtos com Estoque acima do Ideal';
    End
    Else
    Begin
        RelPedidoCompra01.QR_Titulo.Caption := 'Relatório de Pedido de Compra - Produtos com Estoque abaixo do Mínimo';
    End;

    RelPedidoCompra01.QR_Produtos.Preview;
    RelPedidoCompra01.Destroy;

    ConexaoBD.SQL_FB_Produtos.Close;

end;

procedure TRelPedidoCompra00.BT_SairClick(Sender: TObject);
begin
  RelPedidoCompra00.Close;
end;

procedure TRelPedidoCompra00.Data_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelPedidoCompra00.Data_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelPedidoCompra00.ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelPedidoCompra00.BT_BuscarClick(Sender: TObject);
begin
    Application.CreateForm(TAdicionaProduto01,AdicionaProduto01);
    AdicionaProduto01.Programa_Anterior.Text := 'RelPedidoCompra00';
    AdicionaProduto01.ShowModal;
    AdicionaProduto01.Destroy;
end;

procedure TRelPedidoCompra00.NovoClick(Sender: TObject);
var
  Comando_SQL: string;
  Ind: integer;

begin
    RelPedidoCompra00.Visible := False;

    Ampulheta();
    Application.CreateForm(TRelPedidoCompra02,RelPedidoCompra02);

    //*** Carrega os Produtos ***

    Comando_SQL := 'select * from fb_produtos where ';

    If(Produto.Text <> '') Then
    Begin
        Comando_SQL := Comando_SQL + 'fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' and ';
    End;

    If(Busca.ItemIndex = 0) Then
    Begin
        Comando_SQL := Comando_SQL + 'fb_produto_estoque_atual >= fb_produto_estoque_ideal and ';
    End
    Else
    Begin
        Comando_SQL := Comando_SQL + 'fb_produto_estoque_atual <= fb_produto_estoque_minimo and ';
    End;

    Comando_SQL := Comando_SQL + '1=1 ';

    Comando_SQL := Comando_SQL + 'Order By fb_produto_codigo';

    ConexaoBD.SQL_FB_Produtos.Close;
    ConexaoBD.SQL_FB_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Produtos.Open;

    If Not ConexaoBD.SQL_FB_Produtos.Eof Then
       Begin

       For Ind := 0 To RelPedidoCompra02.SGD_Produtos.RowCount Do Begin
           RelPedidoCompra02.SGD_Produtos.Cells[0,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[1,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[2,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[3,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[4,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[5,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[6,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[7,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[8,Ind]  := '';
       End;

       RelPedidoCompra02.SGD_Produtos.RowCount  := (ConexaoBD.SQL_FB_Produtos.RecordCount + 2);
       RelPedidoCompra02.SGD_Produtos.FixedRows := 1;

       //*** Preparação do StringGrid ***

       RelPedidoCompra02.SGD_Produtos.Cells[0,0]   := 'OK';
       RelPedidoCompra02.SGD_Produtos.ColWidths[0] := 20;

       RelPedidoCompra02.SGD_Produtos.Cells[1,0]   := 'Código';
       RelPedidoCompra02.SGD_Produtos.ColWidths[1] := 100;

       RelPedidoCompra02.SGD_Produtos.Cells[2,0]   := 'Descrição';
       RelPedidoCompra02.SGD_Produtos.ColWidths[2] := 224;

       RelPedidoCompra02.SGD_Produtos.Cells[3,0]   := 'Qtde Ideal';
       RelPedidoCompra02.SGD_Produtos.ColWidths[3] := 70;

       RelPedidoCompra02.SGD_Produtos.Cells[4,0]   := 'Qtde Mínima';
       RelPedidoCompra02.SGD_Produtos.ColWidths[4] := 70;

       RelPedidoCompra02.SGD_Produtos.Cells[5,0]   := 'Qtde Atual';
       RelPedidoCompra02.SGD_Produtos.ColWidths[5] := 70;

       RelPedidoCompra02.SGD_Produtos.Cells[6,0]   := 'Vlr. (R$)';
       RelPedidoCompra02.SGD_Produtos.ColWidths[6] := 70;

       RelPedidoCompra02.SGD_Produtos.Cells[7,0]   := 'Vlr.Total (R$)';
       RelPedidoCompra02.SGD_Produtos.ColWidths[7] := 70;
    End;

    ConexaoBD.SQL_FB_Produtos.First;

    Ind := 1;

    While Not ConexaoBD.SQL_FB_Produtos.Eof Do
          Begin
          RelPedidoCompra02.SGD_Produtos.Cells[0,Ind]  := '';
          RelPedidoCompra02.SGD_Produtos.Cells[1,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_codigo').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[2,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_descricao').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[3,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_estoque_ideal').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[4,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_estoque_minimo').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[5,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_estoque_atual').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[6,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_preco').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[7,Ind]  := '';
          ConexaoBD.SQL_FB_Produtos.Next;

          Ind := Ind + 1;
    End;

    //*** Fecha SQL ***

    ConexaoBD.SQL_FB_Produtos.Close;

    Seta();

    RelPedidoCompra02.ShowModal;

    RelPedidoCompra00.Visible := True;
end;

procedure TRelPedidoCompra00.BT_VisualizarClick(Sender: TObject);
var
  Comando_SQL: string;
  Ind: integer;

begin
    RelPedidoCompra00.Visible := False;

    Ampulheta();
    Application.CreateForm(TRelPedidoCompra02,RelPedidoCompra02);

    //*** Carrega os Produtos ***

    Comando_SQL := 'select * from fb_produtos where ';

    If(Produto.Text <> '') Then
    Begin
        Comando_SQL := Comando_SQL + 'fb_produto_codigo LIKE '+#39+Trim(Produto.Text)+'%'+#39+' and ';
    End;

    If(Busca.ItemIndex = 0) Then
       Begin
       Comando_SQL := Comando_SQL + 'fb_produto_estoque_atual <= fb_produto_estoque_ideal ';
       End
    Else
       Begin
       Comando_SQL := Comando_SQL + 'fb_produto_estoque_atual <= fb_produto_estoque_minimo ';
    End;

    Comando_SQL := Comando_SQL + 'Order By fb_produto_codigo';

    ConexaoBD.SQL_FB_Produtos.Close;
    ConexaoBD.SQL_FB_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Produtos.Open;

    If Not ConexaoBD.SQL_FB_Produtos.Eof Then
       Begin

       For Ind := 0 To RelPedidoCompra02.SGD_Produtos.RowCount Do Begin
           RelPedidoCompra02.SGD_Produtos.Cells[0,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[1,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[2,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[3,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[4,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[5,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[6,Ind]  := '';
           RelPedidoCompra02.SGD_Produtos.Cells[7,Ind]  := '';
       End;

       RelPedidoCompra02.SGD_Produtos.RowCount  := (ConexaoBD.SQL_FB_Produtos.RecordCount + 2);
       RelPedidoCompra02.SGD_Produtos.FixedRows := 1;

       //*** Preparação do StringGrid ***

       RelPedidoCompra02.SGD_Produtos.Cells[0,0]   := 'OK';
       RelPedidoCompra02.SGD_Produtos.ColWidths[0] := 20;

       RelPedidoCompra02.SGD_Produtos.Cells[1,0]   := 'Código';
       RelPedidoCompra02.SGD_Produtos.ColWidths[1] := 100;

       RelPedidoCompra02.SGD_Produtos.Cells[2,0]   := 'Descrição';
       RelPedidoCompra02.SGD_Produtos.ColWidths[2] := 224;

       RelPedidoCompra02.SGD_Produtos.Cells[3,0]   := 'Qtde Ideal';
       RelPedidoCompra02.SGD_Produtos.ColWidths[3] := 70;

       RelPedidoCompra02.SGD_Produtos.Cells[4,0]   := 'Qtde Mínima';
       RelPedidoCompra02.SGD_Produtos.ColWidths[4] := 70;

       RelPedidoCompra02.SGD_Produtos.Cells[5,0]   := 'Qtde Atual';
       RelPedidoCompra02.SGD_Produtos.ColWidths[5] := 70;

       RelPedidoCompra02.SGD_Produtos.Cells[6,0]   := 'Vlr. (R$)';
       RelPedidoCompra02.SGD_Produtos.ColWidths[6] := 70;

       RelPedidoCompra02.SGD_Produtos.Cells[7,0]   := 'Vlr.Total (R$)';
       RelPedidoCompra02.SGD_Produtos.ColWidths[7] := 70;
    End;

    ConexaoBD.SQL_FB_Produtos.First;

    Ind := 1;

    While Not ConexaoBD.SQL_FB_Produtos.Eof Do
          Begin

          {if(ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_requisicao').Text = 'S') Then
              Begin
              RelPedidoCompra02.SGD_Produtos.Cells[0,Ind] := 'OK';
          End
          Else
              Begin
              RelPedidoCompra02.SGD_Produtos.Cells[0,Ind] := '';
          End;}

          RelPedidoCompra02.SGD_Produtos.Cells[0,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_requisicao').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[1,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_codigo').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[2,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_descricao').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[3,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_estoque_ideal').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[4,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_estoque_minimo').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[5,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_estoque_atual').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[6,Ind]  := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_preco').Text;
          RelPedidoCompra02.SGD_Produtos.Cells[7,Ind]  := FormatFloat('0.00',(StrToFloat(ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_estoque_atual').Text) * StrToFloat(ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_preco').Text)));
          ConexaoBD.SQL_FB_Produtos.Next;

          Ind := Ind + 1;
    End;

    RelPedidoCompra02.sql.Text := Comando_SQL;

    If(Busca.ItemIndex = 0) Then
    Begin
        RelPedidoCompra02.titulo_relatorio.Text := 'Relatório de Pedido de Compra - Produtos com Estoque acima do Ideal';
        RelPedidoCompra02.tipo_relatorio.Text   := 'Ideal';
    End
    Else
    Begin
        RelPedidoCompra02.titulo_relatorio.Text := 'Relatório de Pedido de Compra - Produtos com Estoque abaixo do Mínimo';
        RelPedidoCompra02.tipo_relatorio.Text   := 'Mínimo';
    End;

    //*** Fecha SQL ***

    ConexaoBD.SQL_FB_Produtos.Close;

    Seta();

    RelPedidoCompra02.ShowModal;

    RelPedidoCompra00.Visible := True;
end;

end.
