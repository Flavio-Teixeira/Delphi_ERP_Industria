unit Adiciona_Qtde_Produto_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TAdicionaQtdeProduto02 = class(TForm)
    Panel3: TPanel;
    BT_Adicionar: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Adiciona_Codigo_Produto: TEdit;
    Label1: TLabel;
    Adiciona_Descricao: TEdit;
    Label2: TLabel;
    Adiciona_Valor_Unitario: TEdit;
    Adiciona_ACol: TEdit;
    Adiciona_ARow: TEdit;
    Programa_Anterior: TEdit;
    Adiciona_Nro_Ctrl_Estoque: TEdit;
    Adiciona_Nro_Nota_Estoque: TEdit;
    Adiciona_Tabela_Estoque: TEdit;
    Adiciona_Lote_Estoque: TEdit;
    Adiciona_Tipo_Faturamento: TEdit;
    Adiciona_Quantidade_ANT: TEdit;
    Label4: TLabel;
    Adiciona_Quantidade: TEdit;
    Label5: TLabel;
    Adiciona_Referencia: TEdit;
    Adiciona_Valor_IPI: TEdit;
    Label6: TLabel;
    Adiciona_Unidade: TEdit;
    Label7: TLabel;
    Adiciona_IPI: TEdit;
    Label8: TLabel;
    Adiciona_CF: TEdit;
    Label9: TLabel;
    Adiciona_ST: TEdit;
    GroupBox2: TGroupBox;
    Adiciona_Descricao_Detalhada: TMemo;
    Label10: TLabel;
    Adiciona_Desenho: TEdit;
    Label11: TLabel;
    Adiciona_OS: TEdit;
    Label12: TLabel;
    Adiciona_Equipamento: TEdit;
    Label13: TLabel;
    Adiciona_Material: TEdit;
    Label14: TLabel;
    Adiciona_Prazo_Entrega: TMaskEdit;
    Label15: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure Adiciona_QuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BT_AdicionarClick(Sender: TObject);
    procedure Adiciona_Valor_UnitarioKeyPress(Sender: TObject;
      var Key: Char);
    procedure Adiciona_IPIExit(Sender: TObject);
    procedure Adiciona_QuantidadeExit(Sender: TObject);
    procedure Adiciona_Valor_UnitarioExit(Sender: TObject);
    procedure Adiciona_Codigo_ProdutoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Adiciona_ReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_UnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_CFKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_STKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Checa_Qtde_FB_Produto(Produto: String): String;
    procedure Movto_Estoque();
    procedure Volta_Valores_Estoque(Usuario_HD, Empresa: String);
    procedure Totaliza_Pedido();

  public
    { Public declarations }
  end;

var
  AdicionaQtdeProduto02: TAdicionaQtdeProduto02;
  Estoque_Resultado, Produto_Cod_Estoque, Qtde_Estoque_Atual: String;
  Produto_Qtde_Estoque, Total_Qtde_Estoque: Real;

implementation

uses Conexao_BD, Rotinas_Gerais, Pedidos_01, Pedidos_02, DB, Ibrasmak_00,
  Pedidos_04, Adiciona_Produto_Relacao, Cotacao_03, Cotacao_04, Ordem_01,
  Ordem_02, Notas_Fiscais_Entradas_00, Registro_Notas_Fiscais_Saidas_01,
  Requisicao_03, Requisicao_04, Registro_Notas_Fiscais_Saidas_02;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TAdicionaQtdeProduto02.Checa_Qtde_FB_Produto(Produto: String): String;

var
   Resultado, Qtde_Estoque_Str, Qtde_Produto_Str, Unidade: String;
   Qtde_Produto_Nro: Real;
   Qtde_Estoque_Nro: Real;

begin
     Resultado := 'Validacao';

     ConexaoBD.SQL_FB_Produtos.Close;
     ConexaoBD.SQL_FB_Produtos.SQL.Clear;
     ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = '+#39+ Produto +#39);
     ConexaoBD.SQL_FB_Produtos.Open;

     If ConexaoBD.SQL_FB_Produtos.RecordCount > 0 Then
        Begin
        conexaoBD.SQL_FB_Produtos.First;

        Unidade            := conexaoBD.SQL_FB_Produtosfb_produto_unidade.Text;

        Qtde_Estoque_Atual := conexaoBD.SQL_FB_Produtosfb_produto_estoque_atual.Text;

        Qtde_Estoque_Str   := conexaoBD.SQL_FB_Produtosfb_produto_estoque_atual.Text;
        Qtde_Produto_Str   := Adiciona_Quantidade.Text;

        Qtde_Estoque_Nro   := StrToFloat(Qtde_Estoque_Str);
        Qtde_Produto_Nro   := StrToFloat(Qtde_Produto_Str);

        //*** Carrega as Variáveis Globais ***

        Produto_Cod_Estoque  := Trim(Produto);
        Produto_Qtde_Estoque := Qtde_Estoque_Nro;

        //*** Continua a Checagem ***

        If Qtde_Produto_Nro > Qtde_Estoque_Nro Then
           Begin
           MSG_Erro('Quantidade disponível em estoque: '+ #13+#10+#13+#10+ Qtde_Estoque_Str + ' ' + Unidade);
           Resultado := 'Voltar';
           End
        Else
           Begin
           Resultado := 'Liberar';
        End;

     End;

     Result := Resultado;

end;

//******************
//*** Procedures ***
//******************

procedure TAdicionaQtdeProduto02.Movto_Estoque();

var
   Usuario_HD, Empresa, Comando_SQL: String;

begin
     Ampulheta();

     Usuario_HD := Trim(Numero_HD('C'));

     Estoque_Resultado := Checa_Qtde_FB_Produto(Trim(Adiciona_Codigo_Produto.Text));

     If Estoque_Resultado = 'Liberar' Then
        Begin

        //*** Efetua a Inserção no Estoque_Transacao ***

        Comando_SQL := 'Insert into estoque_transacoes(';
        Comando_SQL := Comando_SQL + 'estoque_transacao_usuario,';
        Comando_SQL := Comando_SQL + 'estoque_transacao_empresa,';
        Comando_SQL := Comando_SQL + 'estoque_transacao_cod_produto,';
        Comando_SQL := Comando_SQL + 'estoque_transacao_qtde_produto,';
        Comando_SQL := Comando_SQL + 'estoque_transacao_tipo_movto)';
        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Usuario_HD + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Empresa + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Adiciona_Codigo_Produto.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Adiciona_Quantidade.Text) + ',';
        Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Retira o Produto do Estoque ***

        If Trim(Adiciona_Tipo_Faturamento.Text) = 'Nota Fiscal' Then
           Begin
           FB_Registra_Movto_Estoque('51',Adiciona_Nro_Ctrl_Estoque.Text,Adiciona_Nro_Nota_Estoque.Text,Adiciona_Tabela_Estoque.Text,Adiciona_Codigo_Produto.Text,Adiciona_Lote_Estoque.Text,Adiciona_Quantidade.Text);
           End
        Else
           Begin
           FB_Registra_Movto_Estoque('52',Adiciona_Nro_Ctrl_Estoque.Text,Adiciona_Nro_Nota_Estoque.Text,Adiciona_Tabela_Estoque.Text,Adiciona_Codigo_Produto.Text,Adiciona_Lote_Estoque.Text,Adiciona_Quantidade.Text);
        End;
     End;

     Seta();
end;

procedure TAdicionaQtdeProduto02.Volta_Valores_Estoque(Usuario_HD, Empresa: String);

var
   Comando_SQL: String;

begin
     ConexaoBD.SQL_Estoque_Transacoes.Close;
     ConexaoBD.SQL_Estoque_Transacoes.SQL.Clear;
     ConexaoBD.SQL_Estoque_Transacoes.SQL.Add('Select * from estoque_transacoes Where estoque_transacao_usuario = ' + #39 + Usuario_HD + #39 + ' And estoque_transacao_empresa = ' + #39 + Empresa + #39 + ' And estoque_transacao_cod_produto = ' + #39 + Trim(Adiciona_Codigo_Produto.Text) + #39 + ' Order By estoque_transacao_numero Desc');
     ConexaoBD.SQL_Estoque_Transacoes.Open;

     If conexaoBD.SQL_Estoque_Transacoes.RecordCount > 0 Then
        Begin
        conexaoBD.SQL_Estoque_Transacoes.First;

        //*** Obtem o Produto da Transação de Estoque ***

        Produto_Qtde_Estoque := ConexaoBD.SQL_Estoque_Transacoesestoque_transacao_qtde_produto.AsFloat;

        //*** Restaura o Valor Original do Estoque ***

        If Trim(Adiciona_Tipo_Faturamento.Text) = 'Nota Fiscal' Then
           Begin
           FB_Registra_Movto_Estoque('11',Adiciona_Nro_Ctrl_Estoque.Text,Adiciona_Nro_Nota_Estoque.Text,Adiciona_Tabela_Estoque.Text,Adiciona_Codigo_Produto.Text,Adiciona_Lote_Estoque.Text,Virgula_Ponto(FloatToStr(Produto_Qtde_Estoque)));
           End
        Else
           Begin
           FB_Registra_Movto_Estoque('12',Adiciona_Nro_Ctrl_Estoque.Text,Adiciona_Nro_Nota_Estoque.Text,Adiciona_Tabela_Estoque.Text,Adiciona_Codigo_Produto.Text,Adiciona_Lote_Estoque.Text,Virgula_Ponto(FloatToStr(Produto_Qtde_Estoque)));
        End;

        //*** Deleta a Transação Anterior do Estoque ***

        Comando_SQL := 'Delete From estoque_transacoes Where estoque_transacao_usuario = ' + #39 + Usuario_HD + #39 + ' And estoque_transacao_empresa = ' + #39 + Empresa + #39 + ' And estoque_transacao_cod_produto = ' + #39 + Trim(Adiciona_Codigo_Produto.Text) + #39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
        End
     Else
        Begin
        If Trim(Programa_Anterior.Text) = 'Pedido-Alteracao' Then
           Begin

           //*** Obtem a Quantidade Atual do Estoque ***

           If Trim(Adiciona_Quantidade_ANT.Text) = '' Then
              Begin
              Adiciona_Quantidade_ANT.Text := '0';
           End;

           //*** Restaura o Valor Original do Estoque ***

           If Trim(Adiciona_Tipo_Faturamento.Text) = 'Nota Fiscal' Then
              Begin
              FB_Registra_Movto_Estoque('11',Adiciona_Nro_Ctrl_Estoque.Text,Adiciona_Nro_Nota_Estoque.Text,Adiciona_Tabela_Estoque.Text,Adiciona_Codigo_Produto.Text,Adiciona_Lote_Estoque.Text,Adiciona_Quantidade_ANT.Text);
              End
           Else
              Begin
              FB_Registra_Movto_Estoque('12',Adiciona_Nro_Ctrl_Estoque.Text,Adiciona_Nro_Nota_Estoque.Text,Adiciona_Tabela_Estoque.Text,Adiciona_Codigo_Produto.Text,Adiciona_Lote_Estoque.Text,Adiciona_Quantidade_ANT.Text);
           End;

        End;
     End;
end;

procedure TAdicionaQtdeProduto02.BT_SairClick(Sender: TObject);
begin
     AdicionaQtdeProduto02.Close;
end;

procedure TAdicionaQtdeProduto02.Adiciona_QuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto02.BT_AdicionarClick(Sender: TObject);

var
   Ind: Integer;

begin
     If Trim(Adiciona_Quantidade.Text) = '' Then
        Begin
        Adiciona_Quantidade.Text := '0';
     End;

     //Movto_Estoque();
     Estoque_Resultado := 'Liberar';

     If Estoque_Resultado = 'Liberar' Then
        Begin

        If Trim(Programa_Anterior.Text) = 'Pedido-Inclusao' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Pedidos01.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Pedidos01.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Ind := Pedidos01.SGD_Produtos.RowCount;

              Pedidos01.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;

              Pedidos01.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Codigo_Produto.Text;
              Pedidos01.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Referencia.Text;
              Pedidos01.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Descricao.Text;

              Pedidos01.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)]  := Qtde_Estoque_Atual;
              Pedidos01.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Valor_Unitario.Text;

              Pedidos01.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)]  := Adiciona_IPI.Text;

              Pedidos01.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Descricao_Detalhada.Text;
              Pedidos01.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Unidade.Text;

              Pedidos01.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_Desenho.Text;
              Pedidos01.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_OS.Text;
              Pedidos01.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Equipamento.Text;
              Pedidos01.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := Adiciona_Material.Text;

              Pedidos01.SGD_Produtos.RowCount := Ind + 1;
              Pedidos01.SGD_Produtos.Refresh;

              Totaliza_Pedido();
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Cotação-Inclusao' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Cotacao03.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Cotacao03.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Ind := Cotacao03.SGD_Produtos.RowCount;

              Cotacao03.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;

              Cotacao03.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              Cotacao03.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              Cotacao03.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;

              Cotacao03.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;

              Cotacao03.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Cotacao03.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              Cotacao03.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;

              Cotacao03.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := Adiciona_Prazo_Entrega.Text;

              Cotacao03.SGD_Produtos.RowCount := Ind + 1;
              Cotacao03.SGD_Produtos.Refresh;

              Totaliza_Pedido();
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Cotação-Alteração' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Cotacao04.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Cotacao04.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Ind := Cotacao04.SGD_Produtos.RowCount;

              Cotacao04.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;

              Cotacao04.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              Cotacao04.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              Cotacao04.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;

              Cotacao04.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;

              Cotacao04.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Cotacao04.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              Cotacao04.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;

              Cotacao04.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := InttoStr((Ind - 1));
              Cotacao04.SGD_Produtos.Cells[14,StrToInt(Adiciona_ARow.Text)] := Adiciona_Prazo_Entrega.Text;

              Cotacao04.SGD_Produtos.RowCount := Ind + 1;
              Cotacao04.SGD_Produtos.Refresh;

              Totaliza_Pedido();
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Requisição-Inclusao' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Requisicao03.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Requisicao03.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Ind := Requisicao03.SGD_Produtos.RowCount;

              Requisicao03.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;

              Requisicao03.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              Requisicao03.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              Requisicao03.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;

              Requisicao03.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;

              Requisicao03.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Requisicao03.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              Requisicao03.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;

              Requisicao03.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Desenho.Text;
              Requisicao03.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_OS.Text;
              Requisicao03.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_Equipamento.Text;
              Requisicao03.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Material.Text;

              Requisicao03.SGD_Produtos.RowCount := Ind + 1;
              Requisicao03.SGD_Produtos.Refresh;

              Totaliza_Pedido();
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Requisição-Alteração' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Requisicao04.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Requisicao04.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Ind := Requisicao04.SGD_Produtos.RowCount;

              Requisicao04.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;

              Requisicao04.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              Requisicao04.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              Requisicao04.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;

              Requisicao04.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;

              Requisicao04.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Requisicao04.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              Requisicao04.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;

              Requisicao04.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Desenho.Text;
              Requisicao04.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_OS.Text;
              Requisicao04.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_Equipamento.Text;
              Requisicao04.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Material.Text;

              Requisicao04.SGD_Produtos.RowCount := Ind + 1;
              Requisicao04.SGD_Produtos.Refresh;

              Totaliza_Pedido();
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Ordem-Inclusao' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Ordem01.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Ordem01.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Ind := Ordem01.SGD_Produtos.RowCount;

              Ordem01.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;

              Ordem01.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              Ordem01.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              Ordem01.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;

              Ordem01.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;

              Ordem01.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Ordem01.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              Ordem01.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;

              Ordem01.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := Adiciona_Prazo_Entrega.Text;

              Ordem01.SGD_Produtos.RowCount := Ind + 1;
              Ordem01.SGD_Produtos.Refresh;

              Totaliza_Pedido();
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Ordem-Alteração' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Ordem02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Ordem02.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Ind := Ordem02.SGD_Produtos.RowCount;

              Ordem02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;

              Ordem02.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              Ordem02.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              Ordem02.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;

              Ordem02.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_unidade.Text;

              Ordem02.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Ordem02.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              Ordem02.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;

              Ordem02.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := InttoStr((Ind - 1));
              Ordem02.SGD_Produtos.Cells[14,StrToInt(Adiciona_ARow.Text)] := Adiciona_Prazo_Entrega.Text;

              Ordem02.SGD_Produtos.RowCount := Ind + 1;
              Ordem02.SGD_Produtos.Refresh;

              Totaliza_Pedido();
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Faturamento' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Pedidos04.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Pedidos04.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Pedidos04.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
              Pedidos04.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Pedidos04.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão' Then
           Begin
           //If Trim(Adiciona_Quantidade.Text) = '0' Then
           //   Begin
           //   RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := '';
           //   End
           //Else
           //   Begin
              Ind := RegistroNotasFiscaisSaidas01.SGD_Produtos.RowCount;

              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;

              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;

              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;

              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_CF.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_ST.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao_Detalhada.Text;

              RegistroNotasFiscaisSaidas01.SGD_Produtos.RowCount := Ind + 1;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Refresh;

              Totaliza_Pedido();
           //End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão-MB' Then
           Begin
           //If Trim(Adiciona_Quantidade.Text) = '0' Then
           //   Begin
           //   RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := '';
           //   End
           //Else
           //   Begin
              Ind := RegistroNotasFiscaisSaidas02.SGD_Produtos.RowCount;

              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;

              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;

              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;

              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_CF.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_ST.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao_Detalhada.Text;

              RegistroNotasFiscaisSaidas02.SGD_Produtos.RowCount := Ind + 1;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Refresh;

              Totaliza_Pedido();
           //End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Pedido-Alteracao' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Pedidos02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Pedidos02.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Ind := Pedidos02.SGD_Produtos.RowCount;

              Pedidos02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;

              Pedidos02.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              Pedidos02.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              Pedidos02.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;

              Pedidos02.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Pedidos02.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              Pedidos02.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;

              Pedidos02.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao_Detalhada.Text;
              Pedidos02.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;

              Pedidos02.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_Desenho.Text;
              Pedidos02.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_OS.Text;
              Pedidos02.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := Adiciona_Equipamento.Text;
              Pedidos02.SGD_Produtos.Cells[14,StrToInt(Adiciona_ARow.Text)] := Adiciona_Material.Text;

              Pedidos02.SGD_Produtos.RowCount := Ind + 1;
              Pedidos02.SGD_Produtos.Refresh;

              Totaliza_Pedido();
           End;
           End
        Else
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Pedidos02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Pedidos02.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Ind := Pedidos02.SGD_Produtos.RowCount;

              Pedidos02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;

              Pedidos02.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              Pedidos02.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              Pedidos02.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;

              Pedidos02.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Pedidos02.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              Pedidos02.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;

              Pedidos02.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao_Detalhada.Text;
              Pedidos02.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;

              Pedidos02.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_Desenho.Text;
              Pedidos02.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_OS.Text;
              Pedidos02.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Equipamento.Text;
              Pedidos02.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := Adiciona_Material.Text;

              Pedidos02.SGD_Produtos.RowCount := Ind + 1;
              Pedidos02.SGD_Produtos.Refresh;

              Totaliza_Pedido();
           End;
        End;

        AdicionaQtdeProduto02.Close;
        End
     Else
        Begin
        Adiciona_Quantidade.SetFocus;
     End;
end;

procedure TAdicionaQtdeProduto02.Adiciona_Valor_UnitarioKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto02.Totaliza_Pedido();

var
   Ind, Erro: Integer;
   Qtde_Nro, Vlr_Unitario_Nro, Vlr_Total_Nro, Porc_Desconto_Nro, Vlr_Frete_Nro, Vlr_Desconto_Nro, Vlr_Pedido_Nro, Vlr_Geral_Nro, Vlr_IPI_Nro, Vlr_Total_IPI_Nro: Real;
   Qtde_Str, Vlr_Unitario_Str, Vlr_Total_Str, Porc_Desconto_Str, Vlr_Frete_Str, Vlr_Desconto_Str, Vlr_Pedido_Str, Vlr_Geral_Str, Vlr_IPI_Str, Vlr_Total_IPI_Str: String;

begin
     Ampulheta();

     //*** Zera as Variáveis de Cáculo ***

     Vlr_IPI_Nro       := 0;
     Vlr_Total_IPI_Nro := 0;
     Vlr_Desconto_Nro  := 0;
     Vlr_Pedido_Nro    := 0;
     Vlr_Geral_Nro     := 0;
     Vlr_Frete_Nro     := 0;

     //*** Obtem o Valor de Desconto ***

     If Trim(Programa_Anterior.Text) = 'Pedido-Inclusao' Then
        Begin

        {If Trim(Pedidos01.Cliente_Desconto.Text) = '' Then
           Begin
           Porc_Desconto_Nro := 0;
           End
        Else
           Begin
           Porc_Desconto_Str := Trim(Virgula_Ponto(Pedidos01.Cliente_Desconto.Text));
           Val(Porc_Desconto_Str,Porc_Desconto_Nro,Erro);
        End;  }

        //*** Obtem os Valores do Grid ***

        Qtde_Produtos_Selecionados := 0;

        For Ind := 1 To Pedidos01.SGD_Produtos.RowCount Do
            Begin
            //*** Calcula a Quantidade do Grid ***

            Qtde_Str := Trim(Virgula_Ponto(Pedidos01.SGD_Produtos.Cells[0,Ind]));
            Val(Qtde_Str,Qtde_Nro,Erro);

            Vlr_Unitario_Str := Trim(Virgula_Ponto(Pedidos01.SGD_Produtos.Cells[4,Ind]));
            Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

            Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
            Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
            Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));
            Pedidos01.SGD_Produtos.Cells[5,Ind] := Vlr_Total_Str;

            //*** Calcula os Valores Totais ***

            Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

            Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
            Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
            Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

            Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

            //*** Calcula o Valor do IPI ***

            Vlr_IPI_Str := Trim(Virgula_Ponto(Pedidos01.SGD_Produtos.Cells[7,Ind]));
            Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

            If Trim(Pedidos01.Cliente_Suframa.Caption) <> '' Then
               Begin
               Vlr_Total_IPI_Nro := 0;
               End
            Else
               Begin
               Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);
            End;

            //*** Registra o Total de Produtos Selecionados ***

            If Qtde_Nro > 0 Then
               Begin
               Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
            End;
        End;

        //*** Joga os Valores Totais no Pedido ***

        Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
        Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
        Pedidos01.Valor_IPI.Text := Vlr_Total_IPI_Str;

        Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
        Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
        Pedidos01.Valor_Pedido.Text := Vlr_Pedido_Str;

        Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
        Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
        Pedidos01.Valor_Desconto.Text := Vlr_Desconto_Str;

        Vlr_Frete_Str := Trim(Pedidos01.Valor_Frete.Text);

        If Trim(Vlr_Frete_Str) = '' Then
           Begin
           Vlr_Frete_Str := '0';
        End;

        Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

        Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
        Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
        Pedidos01.Valor_Frete.Text := Vlr_Frete_Str;

        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);

        Str((Vlr_Geral_Nro + Vlr_Total_IPI_Nro):13:2,Vlr_Geral_Str);
        Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
        Pedidos01.Valor_Total.Text := Vlr_Geral_Str;

        End
     Else If Trim(Programa_Anterior.Text) = 'Cotação-Inclusao' Then
        Begin

        Porc_Desconto_Nro := 0;

        //*** Obtem os Valores do Grid ***

        Qtde_Produtos_Selecionados := 0;

        For Ind := 1 To Cotacao03.SGD_Produtos.RowCount Do
            Begin
            //*** Calcula a Quantidade do Grid ***

            Qtde_Str := Trim(Virgula_Ponto(Cotacao03.SGD_Produtos.Cells[0,Ind]));
            Val(Qtde_Str,Qtde_Nro,Erro);

            Vlr_Unitario_Str := Trim(Virgula_Ponto(Cotacao03.SGD_Produtos.Cells[5,Ind]));
            Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

            Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
            Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
            Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

            Cotacao03.SGD_Produtos.Cells[6,Ind] := Vlr_Total_Str;

            //*** Calcula os Valores Totais ***

            Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

            Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
            Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
            Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

            Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

            //*** Calcula o Valor do IPI ***

            Vlr_IPI_Str := Trim(Virgula_Ponto(Cotacao03.SGD_Produtos.Cells[8,Ind]));
            Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

            Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);

            //*** Registra o Total de Produtos Selecionados ***

            If Qtde_Nro > 0 Then
               Begin
               Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
            End;
        End;

        //*** Joga os Valores Totais no Pedido ***

        Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
        Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
        Cotacao03.Valor_IPI.Text := Vlr_Total_IPI_Str;

        Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
        Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
        Cotacao03.Valor_Pedido.Text := Vlr_Pedido_Str;

        Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
        Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
        Cotacao03.Valor_Desconto.Text := Vlr_Desconto_Str;

        Vlr_Frete_Str := Trim(Cotacao03.Valor_Frete.Text);

        If Trim(Vlr_Frete_Str) = '' Then
           Begin
           Vlr_Frete_Str := '0';
        End;

        Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

        Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
        Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
        Cotacao03.Valor_Frete.Text := Vlr_Frete_Str;

        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);

        Str((Vlr_Geral_Nro + Vlr_Total_IPI_Nro):13:2,Vlr_Geral_Str);
        Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
        Cotacao03.Valor_Total.Text := Vlr_Geral_Str;

        End
     Else If Trim(Programa_Anterior.Text) = 'Cotação-Alteração' Then
        Begin

        Porc_Desconto_Nro := 0;

        //*** Obtem os Valores do Grid ***

        Qtde_Produtos_Selecionados := 0;

        For Ind := 1 To Cotacao04.SGD_Produtos.RowCount Do
            Begin
            //*** Calcula a Quantidade do Grid ***

            Qtde_Str := Trim(Virgula_Ponto(Cotacao04.SGD_Produtos.Cells[0,Ind]));
            Val(Qtde_Str,Qtde_Nro,Erro);

            Vlr_Unitario_Str := Trim(Virgula_Ponto(Cotacao04.SGD_Produtos.Cells[5,Ind]));
            Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

            Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
            Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
            Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

            Cotacao04.SGD_Produtos.Cells[6,Ind] := Vlr_Total_Str;

            //*** Calcula os Valores Totais ***

            Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

            Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
            Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
            Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

            Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

            //*** Calcula o Valor do IPI ***

            Vlr_IPI_Str := Trim(Virgula_Ponto(Cotacao04.SGD_Produtos.Cells[8,Ind]));
            Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

            Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);

            //*** Registra o Total de Produtos Selecionados ***

            If Qtde_Nro > 0 Then
               Begin
               Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
            End;
        End;

        //*** Joga os Valores Totais no Pedido ***

        Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
        Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
        Cotacao04.Valor_IPI.Text := Vlr_Total_IPI_Str;

        Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
        Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
        Cotacao04.Valor_Pedido.Text := Vlr_Pedido_Str;

        Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
        Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
        Cotacao04.Valor_Desconto.Text := Vlr_Desconto_Str;

        Vlr_Frete_Str := Trim(Cotacao04.Valor_Frete.Text);

        If Trim(Vlr_Frete_Str) = '' Then
           Begin
           Vlr_Frete_Str := '0';
        End;

        Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

        Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
        Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
        Cotacao04.Valor_Frete.Text := Vlr_Frete_Str;

        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);

        Str((Vlr_Geral_Nro + Vlr_Total_IPI_Nro):13:2,Vlr_Geral_Str);
        Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
        Cotacao04.Valor_Total.Text := Vlr_Geral_Str;

        End
     Else If Trim(Programa_Anterior.Text) = 'Requisição-Inclusao' Then
        Begin

        Porc_Desconto_Nro := 0;

        //*** Obtem os Valores do Grid ***

        Qtde_Produtos_Selecionados := 0;

        For Ind := 1 To Requisicao03.SGD_Produtos.RowCount Do
            Begin
            //*** Calcula a Quantidade do Grid ***

            Qtde_Str := Trim(Virgula_Ponto(Requisicao03.SGD_Produtos.Cells[0,Ind]));
            Val(Qtde_Str,Qtde_Nro,Erro);

            Vlr_Unitario_Str := Trim(Virgula_Ponto(Requisicao03.SGD_Produtos.Cells[5,Ind]));
            Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

            Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
            Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
            Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

            Requisicao03.SGD_Produtos.Cells[6,Ind] := Vlr_Total_Str;

            //*** Calcula os Valores Totais ***

            Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

            Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
            Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
            Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

            Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

            //*** Calcula o Valor do IPI ***

            Vlr_IPI_Str := Trim(Virgula_Ponto(Requisicao03.SGD_Produtos.Cells[8,Ind]));
            Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

            Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);

            //*** Registra o Total de Produtos Selecionados ***

            If Qtde_Nro > 0 Then
               Begin
               Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
            End;
        End;

        //*** Joga os Valores Totais no Pedido ***

        Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
        Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
        Requisicao03.Valor_IPI.Text := Vlr_Total_IPI_Str;

        Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
        Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
        Requisicao03.Valor_Pedido.Text := Vlr_Pedido_Str;

        Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
        Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
        Requisicao03.Valor_Desconto.Text := Vlr_Desconto_Str;

        Vlr_Frete_Str := Trim(Requisicao03.Valor_Frete.Text);

        If Trim(Vlr_Frete_Str) = '' Then
           Begin
           Vlr_Frete_Str := '0';
        End;

        Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

        Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
        Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
        Requisicao03.Valor_Frete.Text := Vlr_Frete_Str;

        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);

        Str((Vlr_Geral_Nro + Vlr_Total_IPI_Nro):13:2,Vlr_Geral_Str);
        Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
        Requisicao03.Valor_Total.Text := Vlr_Geral_Str;

        End
     Else If Trim(Programa_Anterior.Text) = 'Requisição-Alteração' Then
        Begin

        Porc_Desconto_Nro := 0;

        //*** Obtem os Valores do Grid ***

        Qtde_Produtos_Selecionados := 0;

        For Ind := 1 To Requisicao04.SGD_Produtos.RowCount Do
            Begin
            //*** Calcula a Quantidade do Grid ***

            Qtde_Str := Trim(Virgula_Ponto(Requisicao04.SGD_Produtos.Cells[0,Ind]));
            Val(Qtde_Str,Qtde_Nro,Erro);

            Vlr_Unitario_Str := Trim(Virgula_Ponto(Requisicao04.SGD_Produtos.Cells[5,Ind]));
            Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

            Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
            Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
            Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

            Requisicao04.SGD_Produtos.Cells[6,Ind] := Vlr_Total_Str;

            //*** Calcula os Valores Totais ***

            Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

            Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
            Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
            Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

            Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

            //*** Calcula o Valor do IPI ***

            Vlr_IPI_Str := Trim(Virgula_Ponto(Requisicao04.SGD_Produtos.Cells[8,Ind]));
            Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

            Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);

            //*** Registra o Total de Produtos Selecionados ***

            If Qtde_Nro > 0 Then
               Begin
               Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
            End;
        End;

        //*** Joga os Valores Totais no Pedido ***

        Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
        Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
        Requisicao04.Valor_IPI.Text := Vlr_Total_IPI_Str;

        Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
        Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
        Requisicao04.Valor_Pedido.Text := Vlr_Pedido_Str;

        Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
        Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
        Requisicao04.Valor_Desconto.Text := Vlr_Desconto_Str;

        Vlr_Frete_Str := Trim(Requisicao04.Valor_Frete.Text);

        If Trim(Vlr_Frete_Str) = '' Then
           Begin
           Vlr_Frete_Str := '0';
        End;

        Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

        Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
        Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
        Requisicao04.Valor_Frete.Text := Vlr_Frete_Str;

        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);

        Str((Vlr_Geral_Nro + Vlr_Total_IPI_Nro):13:2,Vlr_Geral_Str);
        Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
        Requisicao04.Valor_Total.Text := Vlr_Geral_Str;

        End
     Else If Trim(Programa_Anterior.Text) = 'Ordem-Inclusao' Then
        Begin

        Porc_Desconto_Nro := 0;

        //*** Obtem os Valores do Grid ***

        Qtde_Produtos_Selecionados := 0;

        For Ind := 1 To Ordem01.SGD_Produtos.RowCount Do
            Begin
            //*** Calcula a Quantidade do Grid ***

            Qtde_Str := Trim(Virgula_Ponto(Ordem01.SGD_Produtos.Cells[0,Ind]));
            Val(Qtde_Str,Qtde_Nro,Erro);

            Vlr_Unitario_Str := Trim(Virgula_Ponto(Ordem01.SGD_Produtos.Cells[5,Ind]));
            Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

            Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
            Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
            Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

            Ordem01.SGD_Produtos.Cells[6,Ind] := Vlr_Total_Str;

            //*** Calcula os Valores Totais ***

            Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

            Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
            Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
            Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

            Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

            //*** Calcula o Valor do IPI ***

            Vlr_IPI_Str := Trim(Virgula_Ponto(Ordem01.SGD_Produtos.Cells[8,Ind]));
            Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

            Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);

            //*** Registra o Total de Produtos Selecionados ***

            If Qtde_Nro > 0 Then
               Begin
               Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
            End;
        End;

        //*** Joga os Valores Totais no Pedido ***

        Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
        Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
        Ordem01.Valor_IPI.Text := Vlr_Total_IPI_Str;

        Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
        Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
        Ordem01.Valor_Pedido.Text := Vlr_Pedido_Str;

        Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
        Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
        Ordem01.Valor_Desconto.Text := Vlr_Desconto_Str;

        Vlr_Frete_Str := Trim(Ordem01.Valor_Frete.Text);

        If Trim(Vlr_Frete_Str) = '' Then
           Begin
           Vlr_Frete_Str := '0';
        End;

        Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

        Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
        Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
        Ordem01.Valor_Frete.Text := Vlr_Frete_Str;

        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);

        Str((Vlr_Geral_Nro + Vlr_Total_IPI_Nro):13:2,Vlr_Geral_Str);
        Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
        Ordem01.Valor_Total.Text := Vlr_Geral_Str;

        End
     Else If Trim(Programa_Anterior.Text) = 'Ordem-Alteração' Then
        Begin

        Porc_Desconto_Nro := 0;

        //*** Obtem os Valores do Grid ***

        Qtde_Produtos_Selecionados := 0;

        For Ind := 1 To Ordem02.SGD_Produtos.RowCount Do
            Begin
            //*** Calcula a Quantidade do Grid ***

            Qtde_Str := Trim(Virgula_Ponto(Ordem02.SGD_Produtos.Cells[0,Ind]));
            Val(Qtde_Str,Qtde_Nro,Erro);

            Vlr_Unitario_Str := Trim(Virgula_Ponto(Ordem02.SGD_Produtos.Cells[5,Ind]));
            Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

            Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
            Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
            Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

            Ordem02.SGD_Produtos.Cells[6,Ind] := Vlr_Total_Str;

            //*** Calcula os Valores Totais ***

            Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

            Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
            Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
            Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

            Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

            //*** Calcula o Valor do IPI ***

            Vlr_IPI_Str := Trim(Virgula_Ponto(Ordem02.SGD_Produtos.Cells[8,Ind]));
            Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

            Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);

            //*** Registra o Total de Produtos Selecionados ***

            If Qtde_Nro > 0 Then
               Begin
               Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
            End;
        End;

        //*** Joga os Valores Totais no Pedido ***

        Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
        Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
        Ordem02.Valor_IPI.Text := Vlr_Total_IPI_Str;

        Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
        Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
        Ordem02.Valor_Pedido.Text := Vlr_Pedido_Str;

        Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
        Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
        Ordem02.Valor_Desconto.Text := Vlr_Desconto_Str;

        Vlr_Frete_Str := Trim(Ordem02.Valor_Frete.Text);

        If Trim(Vlr_Frete_Str) = '' Then
           Begin
           Vlr_Frete_Str := '0';
        End;

        Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

        Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
        Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
        Ordem02.Valor_Frete.Text := Vlr_Frete_Str;

        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);

        Str((Vlr_Geral_Nro + Vlr_Total_IPI_Nro):13:2,Vlr_Geral_Str);
        Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
        Ordem02.Valor_Total.Text := Vlr_Geral_Str;

        End
     Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão' Then
        Begin

        If Trim(RegistroNotasFiscaisSaidas01.Cliente_Desconto.Text) = '' Then
           Begin
           Porc_Desconto_Nro := 0;
           End
        Else
           Begin
           Porc_Desconto_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.Cliente_Desconto.Text));
           Val(Porc_Desconto_Str,Porc_Desconto_Nro,Erro);
        End;

        //*** Obtem os Valores do Grid ***

        Qtde_Produtos_Selecionados := 0;

        For Ind := 1 To RegistroNotasFiscaisSaidas01.SGD_Produtos.RowCount Do
            Begin
            //*** Calcula a Quantidade do Grid ***

            Qtde_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[1,Ind]));
            Val(Qtde_Str,Qtde_Nro,Erro);

            Vlr_Unitario_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[6,Ind]));
            Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

            If Qtde_Nro = 0 Then
               Begin
               Vlr_Total_Nro := Vlr_Unitario_Nro;
               End
            Else
               Begin
               Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
            End;

            Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
            Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

            RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[7,Ind] := Vlr_Total_Str;

            //*** Calcula os Valores Totais ***

            Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

            Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
            Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
            Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

            Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

            //*** Calcula o Valor do IPI ***

            Vlr_IPI_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[8,Ind]));
            Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

            If Trim(RegistroNotasFiscaisSaidas01.Cliente_Suframa.Text) <> '' Then
               Begin
               Vlr_Total_IPI_Nro := 0;
               End
            Else
               Begin
               Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);
            End;

            //*** Registra o Total de Produtos Selecionados ***

            If Qtde_Nro > 0 Then
               Begin
               Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
            End;
        End;

        //*** Joga os Valores Totais no Pedido ***

        Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
        Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
        RegistroNotasFiscaisSaidas01.Valor_IPI.Text := Vlr_Total_IPI_Str;

        Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
        Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
        RegistroNotasFiscaisSaidas01.Nota_Valor_Produto.Text := Vlr_Pedido_Str;

        Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
        Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
        RegistroNotasFiscaisSaidas01.Valor_Desconto.Text := Vlr_Desconto_Str;

        Vlr_Frete_Str := Trim(RegistroNotasFiscaisSaidas01.Valor_Frete.Text);

        If Trim(Vlr_Frete_Str) = '' Then
           Begin
           Vlr_Frete_Str := '0';
        End;

        Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

        Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
        Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
        RegistroNotasFiscaisSaidas01.Valor_Frete.Text := Vlr_Frete_Str;

        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);

        Str((Vlr_Geral_Nro + Vlr_Total_IPI_Nro):13:2,Vlr_Geral_Str);
        Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
        RegistroNotasFiscaisSaidas01.Valor_Total.Text := Vlr_Geral_Str;

        End
     Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão-MB' Then
        Begin

        If Trim(RegistroNotasFiscaisSaidas02.Cliente_Desconto.Text) = '' Then
           Begin
           Porc_Desconto_Nro := 0;
           End
        Else
           Begin
           Porc_Desconto_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.Cliente_Desconto.Text));
           Val(Porc_Desconto_Str,Porc_Desconto_Nro,Erro);
        End;

        //*** Obtem os Valores do Grid ***

        Qtde_Produtos_Selecionados := 0;

        For Ind := 1 To RegistroNotasFiscaisSaidas02.SGD_Produtos.RowCount Do
            Begin
            //*** Calcula a Quantidade do Grid ***

            Qtde_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[1,Ind]));
            Val(Qtde_Str,Qtde_Nro,Erro);

            Vlr_Unitario_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[6,Ind]));
            Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

            If Qtde_Nro = 0 Then
               Begin
               Vlr_Total_Nro := Vlr_Unitario_Nro;
               End
            Else
               Begin
               Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
            End;

            Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
            Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

            RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[7,Ind] := Vlr_Total_Str;

            //*** Calcula os Valores Totais ***

            Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

            Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
            Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
            Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

            Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

            //*** Calcula o Valor do IPI ***

            Vlr_IPI_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[8,Ind]));
            Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

            If Trim(RegistroNotasFiscaisSaidas02.Cliente_Suframa.Text) <> '' Then
               Begin
               Vlr_Total_IPI_Nro := 0;
               End
            Else
               Begin
               Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);
            End;

            //*** Registra o Total de Produtos Selecionados ***

            If Qtde_Nro > 0 Then
               Begin
               Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
            End;
        End;

        //*** Joga os Valores Totais no Pedido ***

        Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
        Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
        RegistroNotasFiscaisSaidas02.Valor_IPI.Text := Vlr_Total_IPI_Str;

        Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
        Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
        RegistroNotasFiscaisSaidas02.Nota_Valor_Produto.Text := Vlr_Pedido_Str;

        Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
        Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
        RegistroNotasFiscaisSaidas02.Valor_Desconto.Text := Vlr_Desconto_Str;

        Vlr_Frete_Str := Trim(RegistroNotasFiscaisSaidas02.Valor_Frete.Text);

        If Trim(Vlr_Frete_Str) = '' Then
           Begin
           Vlr_Frete_Str := '0';
        End;

        Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

        Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
        Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
        RegistroNotasFiscaisSaidas02.Valor_Frete.Text := Vlr_Frete_Str;

        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);

        Str((Vlr_Geral_Nro + Vlr_Total_IPI_Nro):13:2,Vlr_Geral_Str);
        Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
        RegistroNotasFiscaisSaidas02.Valor_Total.Text := Vlr_Geral_Str;

        End
     Else If Trim(Programa_Anterior.Text) = 'Pedido-Alteracao' Then
        Begin

        //If Trim(Pedidos02.Cliente_Desconto.Text) = '' Then
        //   Begin
           Porc_Desconto_Nro := 0;
        //   End
        //Else
        //   Begin
        //   Porc_Desconto_Str := Trim(Virgula_Ponto(Pedidos02.Cliente_Desconto.Text));
        //   Val(Porc_Desconto_Str,Porc_Desconto_Nro,Erro);
        //End;

        //*** Obtem os Valores do Grid ***

        Qtde_Produtos_Selecionados := 0;

        For Ind := 1 To Pedidos02.SGD_Produtos.RowCount Do
            Begin
            //*** Calcula a Quantidade do Grid ***

            Qtde_Str := Trim(Virgula_Ponto(Pedidos02.SGD_Produtos.Cells[0,Ind]));
            Val(Qtde_Str,Qtde_Nro,Erro);

            Vlr_Unitario_Str := Trim(Virgula_Ponto(Pedidos02.SGD_Produtos.Cells[5,Ind]));
            Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

            Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
            Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
            Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

            Pedidos02.SGD_Produtos.Cells[6,Ind] := Vlr_Total_Str;

            //*** Calcula os Valores Totais ***

            Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

            Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
            Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
            Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

            Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

            //*** Calcula o Valor do IPI ***

            Vlr_IPI_Str := Trim(Virgula_Ponto(Pedidos02.SGD_Produtos.Cells[8,Ind]));
            Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

            Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);

            //*** Registra o Total de Produtos Selecionados ***

            If Qtde_Nro > 0 Then
               Begin
               Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
            End;
        End;

        //*** Joga os Valores Totais no Pedido ***

        Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
        Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
        Pedidos02.Valor_IPI.Text := Vlr_Total_IPI_Str;

        Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
        Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
        Pedidos02.Valor_Pedido.Text := Vlr_Pedido_Str;

        Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
        Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
        Pedidos02.Valor_Desconto.Text := Vlr_Desconto_Str;

        Vlr_Frete_Str := Trim(Pedidos02.Valor_Frete.Text);

        If Trim(Vlr_Frete_Str) = '' Then
           Begin
           Vlr_Frete_Str := '0';
        End;

        Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

        Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
        Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
        Pedidos02.Valor_Frete.Text := Vlr_Frete_Str;

        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);

        Str((Vlr_Geral_Nro + Vlr_Total_IPI_Nro):13:2,Vlr_Geral_Str);
        Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
        Pedidos02.Valor_Total.Text := Vlr_Geral_Str;
     End
     Else
        Begin

        //If Trim(Pedidos02.Cliente_Desconto.Text) = '' Then
        //   Begin
           Porc_Desconto_Nro := 0;
        //   End
        //Else
        //   Begin
        //   Porc_Desconto_Str := Trim(Virgula_Ponto(Pedidos02.Cliente_Desconto.Text));
        //   Val(Porc_Desconto_Str,Porc_Desconto_Nro,Erro);
        //End;

        //*** Obtem os Valores do Grid ***

        Qtde_Produtos_Selecionados := 0;

        For Ind := 1 To Pedidos02.SGD_Produtos.RowCount Do
            Begin
            //*** Calcula a Quantidade do Grid ***

            Qtde_Str := Trim(Virgula_Ponto(Pedidos02.SGD_Produtos.Cells[0,Ind]));
            Val(Qtde_Str,Qtde_Nro,Erro);

            Vlr_Unitario_Str := Trim(Virgula_Ponto(Pedidos02.SGD_Produtos.Cells[4,Ind]));
            Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

            Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
            Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
            Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

            Pedidos02.SGD_Produtos.Cells[5,Ind] := Vlr_Total_Str;

            //*** Calcula os Valores Totais ***

            Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

            Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
            Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
            Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

            Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

            //*** Calcula o Valor do IPI ***

            Vlr_IPI_Str := Trim(Virgula_Ponto(Pedidos02.SGD_Produtos.Cells[7,Ind]));
            Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

            Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);

            //*** Registra o Total de Produtos Selecionados ***

            If Qtde_Nro > 0 Then
               Begin
               Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
            End;
        End;

        //*** Joga os Valores Totais no Pedido ***

        Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
        Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
        Pedidos02.Valor_IPI.Text := Vlr_Total_IPI_Str;

        Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
        Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
        Pedidos02.Valor_Pedido.Text := Vlr_Pedido_Str;

        Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
        Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
        Pedidos02.Valor_Desconto.Text := Vlr_Desconto_Str;

        Vlr_Frete_Str := Trim(Pedidos02.Valor_Frete.Text);

        If Trim(Vlr_Frete_Str) = '' Then
           Begin
           Vlr_Frete_Str := '0';
        End;

        Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

        Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
        Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
        Pedidos02.Valor_Frete.Text := Vlr_Frete_Str;

        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);

        Str((Vlr_Geral_Nro + Vlr_Total_IPI_Nro):13:2,Vlr_Geral_Str);
        Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
        Pedidos02.Valor_Total.Text := Vlr_Geral_Str;
     End;

     Seta();
end;

procedure TAdicionaQtdeProduto02.Adiciona_IPIExit(Sender: TObject);
begin
     If Trim(Adiciona_IPI.Text) = '' Then
        Begin
        Adiciona_IPI.Text := '0';
     End;
end;

procedure TAdicionaQtdeProduto02.Adiciona_QuantidadeExit(Sender: TObject);
begin
     If Trim(Adiciona_Quantidade.Text) = '' Then
        Begin
        Adiciona_Quantidade.Text := '0';
     End;
end;

procedure TAdicionaQtdeProduto02.Adiciona_Valor_UnitarioExit(
  Sender: TObject);
begin
     If Trim(Adiciona_Valor_Unitario.Text) = '' Then
        Begin
        Adiciona_Valor_Unitario.Text := '0,00';
     End;
end;

procedure TAdicionaQtdeProduto02.Adiciona_Codigo_ProdutoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto02.Adiciona_ReferenciaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto02.Adiciona_DescricaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto02.Adiciona_UnidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto02.Adiciona_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto02.Adiciona_CFKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto02.Adiciona_STKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
