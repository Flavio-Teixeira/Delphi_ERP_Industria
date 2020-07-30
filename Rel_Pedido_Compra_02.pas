unit Rel_Pedido_Compra_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Grids;

type
  TRelPedidoCompra02 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    SGD_Produtos: TStringGrid;
    BT_Gerar: TBitBtn;
    BT_Visualizar: TBitBtn;
    sql: TEdit;
    titulo_relatorio: TEdit;
    tipo_relatorio: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SGD_ProdutosDblClick(Sender: TObject);
    procedure BT_VisualizarClick(Sender: TObject);
    procedure BT_GerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelPedidoCompra02: TRelPedidoCompra02;

implementation

uses Conexao_BD, Rotinas_Gerais, Pedidos_01, Pedidos_02,
  Notas_Fiscais_Entradas_00, Rel_Pedido_Compra_01, Requisicao_03;

{$R *.dfm}

procedure TRelPedidoCompra02.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TRelPedidoCompra02.BT_SairClick(Sender: TObject);
begin
     RelPedidoCompra02.Close;
end;

procedure TRelPedidoCompra02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     RelPedidoCompra02 := Nil;
end;

procedure TRelPedidoCompra02.SGD_ProdutosDblClick(Sender: TObject);
begin
  If Trim(SGD_Produtos.Cells[0,SGD_Produtos.Row]) = 'OK' Then
     Begin
     SGD_Produtos.Cells[0,SGD_Produtos.Row] := '';
     End
  Else
     Begin
     SGD_Produtos.Cells[0,SGD_Produtos.Row] := 'OK';
  End;
end;

procedure TRelPedidoCompra02.BT_VisualizarClick(Sender: TObject);
var
    Comando_SQL, produto_ok: string;
    Ind: integer;

begin
    Ampulheta();

    Application.CreateForm(TRelPedidoCompra01,RelPedidoCompra01);

    ConexaoBD.SQL_FB_Produtos.Close;
    ConexaoBD.SQL_FB_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Produtos.SQL.Add(sql.Text);
    ConexaoBD.SQL_FB_Produtos.Open;

    Seta();

    RelPedidoCompra01.QR_Titulo.Caption := titulo_relatorio.Text;

    RelPedidoCompra01.QR_Produtos.Preview;
    RelPedidoCompra01.Destroy;

    ConexaoBD.SQL_FB_Produtos.Close;
end;

procedure TRelPedidoCompra02.BT_GerarClick(Sender: TObject);
var
    Comando_SQL, produto_ok, Vlr_Exibicao: string;
    Ind, i, Erro: integer;
    Vlr_Numero: Real;

begin
    i := 0;

    Ampulheta();

    Application.CreateForm(TRequisicao03,Requisicao03);

    //*** Preparação do StringGrid ***

    //*** Quantidade ***
    Requisicao03.SGD_Produtos.Cells[0,0]   := 'Quantidade';
    Requisicao03.SGD_Produtos.ColWidths[0] := 60;

    //*** Código do Produto ***
    Requisicao03.SGD_Produtos.Cells[1,0]   := 'Cód.Produto';
    Requisicao03.SGD_Produtos.ColWidths[1] := 65;

    //*** Referência do Produto ***
    Requisicao03.SGD_Produtos.Cells[2,0]   := 'Referência';
    Requisicao03.SGD_Produtos.ColWidths[2] := -1;

    //*** Descrição do Produto ***
    Requisicao03.SGD_Produtos.Cells[3,0]   := 'Descrição';
    Requisicao03.SGD_Produtos.ColWidths[3] := 200;

    //*** Unidade do Produto ***
    Requisicao03.SGD_Produtos.Cells[4,0]   := 'Unidade';
    Requisicao03.SGD_Produtos.ColWidths[4] := 45;

    //*** Valor Unitário ***
    Requisicao03.SGD_Produtos.Cells[5,0]   := 'Valor (R$)';
    Requisicao03.SGD_Produtos.ColWidths[5] := (-1);

    //*** Valor Total ***
    Requisicao03.SGD_Produtos.Cells[6,0]   := 'Vlr.Total (R$)';
    Requisicao03.SGD_Produtos.ColWidths[6] := (-1);

    //*** Quantidade de Estoque Atual ***
    Requisicao03.SGD_Produtos.Cells[7,0]   := 'Qtde Est.Atual';
    Requisicao03.SGD_Produtos.ColWidths[7] := (-1);

    //*** Porcentagem do IPI ***
    Requisicao03.SGD_Produtos.Cells[8,0]   := 'Porcentagem do IPI';
    Requisicao03.SGD_Produtos.ColWidths[8] := (-1);

    //*** Desenho ***
    Requisicao03.SGD_Produtos.Cells[9,0]   := 'Desenho';
    Requisicao03.SGD_Produtos.ColWidths[9] := 75;

    //*** OS ***
    Requisicao03.SGD_Produtos.Cells[10,0]   := 'OS';
    Requisicao03.SGD_Produtos.ColWidths[10] := 75;

    //*** Equipamento ***
    Requisicao03.SGD_Produtos.Cells[11,0]   := 'Equipamento';
    Requisicao03.SGD_Produtos.ColWidths[11] := 75;

    //*** Material ***
    Requisicao03.SGD_Produtos.Cells[12,0]   := 'Material';
    Requisicao03.SGD_Produtos.ColWidths[12] := 75;

    For Ind := 1 To SGD_Produtos.RowCount Do
      Begin

      if( (Trim(SGD_Produtos.Cells[0,Ind]) = 'OK') or (Trim(SGD_Produtos.Cells[0,Ind]) = 'RQ') ) Then
          Begin
          produto_ok := 'RQ';
          i := i + 1;
      End
      Else
          Begin
          produto_ok := '';
      End;

      Comando_SQL := 'Update fb_produtos Set ';
      Comando_SQL := Comando_SQL + 'fb_produto_requisicao = ' + #39 + produto_ok + #39 + ' ';
      Comando_SQL := Comando_SQL + 'Where fb_produto_codigo = ' + #39 + Trim(SGD_Produtos.Cells[1,Ind]) + #39;

      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_Comunitario.ExecSQL;

    end;

    Requisicao03.SGD_Produtos.RowCount  := (i + 2);
    Requisicao03.SGD_Produtos.FixedRows := 1;

    i := 0;

    For Ind := 1 To SGD_Produtos.RowCount Do
        Begin
        
        if( Trim(SGD_Produtos.Cells[0,Ind]) = 'OK') Then
            Begin

            i := i + 1;

            ConexaoBD.SQL_FB_Produtos.Close;
            ConexaoBD.SQL_FB_Produtos.SQL.Clear;
            ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' + #39 + Trim(SGD_Produtos.Cells[1,Ind]) + #39);
            ConexaoBD.SQL_FB_Produtos.Open;

            Requisicao03.SGD_Produtos.Cells[0,i]  := FloatToStr(StrToFloat(ConexaoBD.SQL_FB_Produtosfb_produto_estoque_ideal.Text) - StrToFloat(ConexaoBD.SQL_FB_Produtosfb_produto_estoque_atual.Text));

            if(Requisicao03.SGD_Produtos.Cells[0,i] = '0') Then
                Begin
                Requisicao03.SGD_Produtos.Cells[0,i]  := '1';
            end;
            
            Requisicao03.SGD_Produtos.Cells[1,i]  := ConexaoBD.SQL_FB_Produtosfb_produto_codigo.Text;
            Requisicao03.SGD_Produtos.Cells[2,i]  := ConexaoBD.SQL_FB_Produtosfb_produto_referencia.Text;
            Requisicao03.SGD_Produtos.Cells[3,i]  := ConexaoBD.SQL_FB_Produtosfb_produto_descricao.Text;
            Requisicao03.SGD_Produtos.Cells[4,i]  := ConexaoBD.SQL_FB_Produtosfb_produto_unidade.Text;

            Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_FB_Produtosfb_produto_preco.Text));
            Val(Vlr_Exibicao,Vlr_Numero,Erro);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

            Requisicao03.SGD_Produtos.Cells[5,i]  := Vlr_Exibicao;

            Requisicao03.SGD_Produtos.Cells[6,i]  := '';
            Requisicao03.SGD_Produtos.Cells[7,i]  := '';

            Requisicao03.SGD_Produtos.Cells[8,i]  := ConexaoBD.SQL_FB_Produtosfb_produto_ipi.Text;

            Requisicao03.SGD_Produtos.Cells[9,i]  := ConexaoBD.SQL_FB_Produtosfb_produto_desenho.Text;
            Requisicao03.SGD_Produtos.Cells[10,i] := ConexaoBD.SQL_FB_Produtosfb_produto_os.Text;
            Requisicao03.SGD_Produtos.Cells[11,i] := ConexaoBD.SQL_FB_Produtosfb_produto_equipamento.Text;
            Requisicao03.SGD_Produtos.Cells[12,i] := ConexaoBD.SQL_FB_Produtosfb_produto_material.Text;
        End;
    End;

    Requisicao03.ShowModal;

    //RelPedidoCompra02.Visible := True;

    RelPedidoCompra02.Close;

end;

end.
