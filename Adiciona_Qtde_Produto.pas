unit Adiciona_Qtde_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TAdicionaQtdeProduto = class(TForm)
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
    Label6: TLabel;
    Adiciona_Unidade: TEdit;
    Label7: TLabel;
    Adiciona_IPI: TEdit;
    BT_Trocar: TBitBtn;
    Adiciona_CF: TEdit;
    Adiciona_ST: TEdit;
    Label9: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Adiciona_Descricao_Detalhada: TMemo;
    Label10: TLabel;
    Adiciona_Desenho: TEdit;
    Adiciona_OS: TEdit;
    Label11: TLabel;
    Adiciona_Equipamento: TEdit;
    Label12: TLabel;
    Adiciona_Material: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Adiciona_Prazo_Entrega: TMaskEdit;
    Label15: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure Adiciona_QuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BT_AdicionarClick(Sender: TObject);
    procedure Adiciona_Valor_UnitarioKeyPress(Sender: TObject;
      var Key: Char);
    procedure Adiciona_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_IPIExit(Sender: TObject);
    procedure Adiciona_QuantidadeExit(Sender: TObject);
    procedure Adiciona_Valor_UnitarioExit(Sender: TObject);
    procedure BT_TrocarClick(Sender: TObject);
    procedure Adiciona_CFKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_STKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Adiciona_UnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_DescricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Checa_Qtde_FB_Produto(Produto: String): String;
    procedure Inclui_CF();
    procedure Movto_Estoque();
    procedure Volta_Valores_Estoque(Usuario_HD, Empresa: String);
  public
    { Public declarations }
  end;

var
  AdicionaQtdeProduto: TAdicionaQtdeProduto;
  Estoque_Resultado, Produto_Cod_Estoque, Qtde_Estoque_Atual: String;
  Produto_Qtde_Estoque, Total_Qtde_Estoque: Real;

implementation

uses Conexao_BD, Rotinas_Gerais, Pedidos_01, Pedidos_02, DB, Ibrasmak_00,
  Pedidos_04, Cotacao_03, Cotacao_04, Ordem_01, Ordem_02,
  Adiciona_Produto_Relacao, Registro_Notas_Fiscais_Saidas_01,
  Requisicao_03, Requisicao_04, Notas_Fiscais_Saidas_01,
  Registro_Notas_Fiscais_Saidas_02;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TAdicionaQtdeProduto.Checa_Qtde_FB_Produto(Produto: String): String;

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

procedure TAdicionaQtdeProduto.Inclui_CF();

var
   Comando_SQL: String;

begin
     Ampulheta();

     //*** Inclui a Classificação Fiscal No Produto ***

     If Trim(Adiciona_CF.Text) <> '' Then
        Begin
        Comando_SQL := 'Update fb_produtos Set ';
        Comando_SQL := Comando_SQL + 'fb_produto_classif_fiscal = ' + #39 + Trim(Adiciona_CF.Text) + #39 + ' ';

        If Trim(Adiciona_Unidade.Text) <> '' Then
           Begin
           Comando_SQL := Comando_SQL + ', fb_produto_unidade = ' + #39 + Trim(Adiciona_Unidade.Text) + #39 + ' ';
        End;

        If Trim(Adiciona_ST.Text) <> '' Then
           Begin
           Comando_SQL := Comando_SQL + ', fb_produto_classif_tributaria = ' + #39 + Trim(Adiciona_ST.Text) + #39 + ' ';
        End;

        Comando_SQL := Comando_SQL + ' Where fb_produto_codigo = ' + #39 + Trim(Adiciona_Codigo_Produto.Text) + #39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
     End;

     Seta();
end;

procedure TAdicionaQtdeProduto.Movto_Estoque();

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

procedure TAdicionaQtdeProduto.Volta_Valores_Estoque(Usuario_HD, Empresa: String);

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

procedure TAdicionaQtdeProduto.BT_SairClick(Sender: TObject);
begin
     AdicionaQtdeProduto.Close;
end;

procedure TAdicionaQtdeProduto.Adiciona_QuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto.BT_AdicionarClick(Sender: TObject);
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
              Pedidos01.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
              Pedidos01.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              Pedidos01.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              Pedidos01.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;
              Pedidos01.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;
              Pedidos01.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Pedidos01.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;
              Pedidos01.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao_Detalhada.Text;

              Inclui_CF();
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Pedido-Alteracao' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Pedidos02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Pedidos02.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Pedidos02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
              Pedidos02.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              Pedidos02.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              Pedidos02.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;
              Pedidos02.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;
              Pedidos02.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Pedidos02.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;
              Pedidos02.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao_Detalhada.Text;

              Inclui_CF();
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
              Cotacao03.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
              Cotacao03.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;
              Cotacao03.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;
              Cotacao03.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;

              Cotacao03.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Desenho.Text;
              Cotacao03.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_OS.Text;
              Cotacao03.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_Equipamento.Text;
              Cotacao03.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Material.Text;
              Cotacao03.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := Adiciona_Prazo_Entrega.Text;
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
              Cotacao04.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
              Cotacao04.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;
              Cotacao04.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;
              Cotacao04.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;

              Cotacao04.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Desenho.Text;
              Cotacao04.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_OS.Text;
              Cotacao04.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_Equipamento.Text;
              Cotacao04.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Material.Text;

              Cotacao04.SGD_Produtos.Cells[14,StrToInt(Adiciona_ARow.Text)] := Adiciona_Prazo_Entrega.Text;
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
              Requisicao03.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
              Requisicao03.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;
              Requisicao03.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              Requisicao03.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Desenho.Text;
              Requisicao03.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_OS.Text;
              Requisicao03.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_Equipamento.Text;
              Requisicao03.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Material.Text;
              Requisicao03.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Unidade.Text;
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
              Requisicao04.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
              Requisicao04.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;
              Requisicao04.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;

              Requisicao04.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Desenho.Text;
              Requisicao04.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_OS.Text;
              Requisicao04.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_Equipamento.Text;
              Requisicao04.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Material.Text;
              Requisicao04.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Unidade.Text;
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
              Ordem01.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
              Ordem01.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;
              Ordem01.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;
              Ordem01.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;

              Ordem01.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Desenho.Text;
              Ordem01.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_OS.Text;
              Ordem01.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_Equipamento.Text;
              Ordem01.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Material.Text;

              Ordem01.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := Adiciona_Prazo_Entrega.Text;
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Ordem-Alteração' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              Ordem02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := '';
              Ordem02.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              Ordem02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
              Ordem02.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;
              Ordem02.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;
              Ordem02.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Unidade.Text;

              Ordem02.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Desenho.Text;
              Ordem02.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := Adiciona_OS.Text;
              Ordem02.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := Adiciona_Equipamento.Text;
              Ordem02.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := Adiciona_Material.Text;

              Ordem02.SGD_Produtos.Cells[14,StrToInt(Adiciona_ARow.Text)] := Adiciona_Prazo_Entrega.Text;
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
              //*******************
              //*** Faturamento ***
              //*******************

              Pedidos04.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)]   := Adiciona_Quantidade.Text;
              //Pedidos04.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := '0';
              Pedidos04.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)]   := Adiciona_Codigo_Produto.Text;
              Pedidos04.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)]   := Adiciona_Referencia.Text;
              Pedidos04.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)]   := Adiciona_Descricao.Text;
              Pedidos04.SGD_Produtos.Cells[5,StrToInt(Adiciona_ARow.Text)]   := Adiciona_Valor_Unitario.Text;
              //Pedidos04.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := 'Vlr.Total (R$)';
              Pedidos04.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)]   := Qtde_Estoque_Atual;
              Pedidos04.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)]   := Adiciona_IPI.Text;
              Pedidos04.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]   := Adiciona_Descricao_Detalhada.Text;
              Pedidos04.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Unidade.Text;
              Pedidos04.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)]  := Adiciona_CF.Text;
              Pedidos04.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)]  := Adiciona_ST.Text;

              Inclui_CF();

              //***************
              //*** Pedidos ***
              //***************

              Pedidos02.SGD_Produtos.Cells[9,StrToInt(Adiciona_ARow.Text)]   := Adiciona_Descricao_Detalhada.Text;
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Quantidade.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Codigo_Produto.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Referencia.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Descricao.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Valor_Unitario.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)]  := Adiciona_IPI.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_CF.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_ST.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_Unidade.Text;
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Text;
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Registro-Notas-Inclusão-MB' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Quantidade.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Codigo_Produto.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Referencia.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Descricao.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Valor_Unitario.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)]  := Adiciona_IPI.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_CF.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_ST.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_Unidade.Text;
              RegistroNotasFiscaisSaidas02.SGD_Produtos.Cells[13,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Text;
           End;
           End
        Else If Trim(Programa_Anterior.Text) = 'Notas-Inclusão' Then
           Begin
           If Trim(Adiciona_Quantidade.Text) = '0' Then
              Begin
              RegistroNotasFiscaisSaidas01.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := '';
              End
           Else
              Begin
              NotasFiscaisSaidas01.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Quantidade.Text;
              NotasFiscaisSaidas01.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Codigo_Produto.Text;
              NotasFiscaisSaidas01.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Referencia.Text;
              NotasFiscaisSaidas01.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Descricao.Text;
              NotasFiscaisSaidas01.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)]  := Adiciona_Valor_Unitario.Text;
              NotasFiscaisSaidas01.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)]  := Adiciona_IPI.Text;
              //NotasFiscaisSaidas01.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_CF.Text;
              //NotasFiscaisSaidas01.SGD_Produtos.Cells[11,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_ST.Text;
              //NotasFiscaisSaidas01.SGD_Produtos.Cells[12,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_Unidade.Text;
              NotasFiscaisSaidas01.SGD_Produtos.Cells[10,StrToInt(Adiciona_ARow.Text)] := AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Text;

              Inclui_CF();
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
              Pedidos02.SGD_Produtos.Cells[0,StrToInt(Adiciona_ARow.Text)] := Adiciona_Quantidade.Text;
              Pedidos02.SGD_Produtos.Cells[1,StrToInt(Adiciona_ARow.Text)] := Adiciona_Codigo_Produto.Text;
              Pedidos02.SGD_Produtos.Cells[2,StrToInt(Adiciona_ARow.Text)] := Adiciona_Referencia.Text;
              Pedidos02.SGD_Produtos.Cells[3,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;
              Pedidos02.SGD_Produtos.Cells[4,StrToInt(Adiciona_ARow.Text)] := Adiciona_Valor_Unitario.Text;
              Pedidos02.SGD_Produtos.Cells[6,StrToInt(Adiciona_ARow.Text)] := Qtde_Estoque_Atual;
              Pedidos02.SGD_Produtos.Cells[7,StrToInt(Adiciona_ARow.Text)] := Adiciona_IPI.Text;
              Pedidos02.SGD_Produtos.Cells[8,StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao_Detalhada.Text;
           End;
        End;

        AdicionaQtdeProduto.Close;
        End
     Else
        Begin
        Adiciona_Quantidade.SetFocus;
     End;
end;

procedure TAdicionaQtdeProduto.Adiciona_Valor_UnitarioKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto.Adiciona_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto.Adiciona_IPIExit(Sender: TObject);
begin
     If Trim(Adiciona_IPI.Text) = '' Then
        Begin
        Adiciona_IPI.Text := '0';
     End;
end;

procedure TAdicionaQtdeProduto.Adiciona_QuantidadeExit(Sender: TObject);
begin
     If Trim(Adiciona_Quantidade.Text) = '' Then
        Begin
        Adiciona_Quantidade.Text := '0';
     End;
end;

procedure TAdicionaQtdeProduto.Adiciona_Valor_UnitarioExit(
  Sender: TObject);
begin
     If Trim(Adiciona_Valor_Unitario.Text) = '' Then
        Begin
        Adiciona_Valor_Unitario.Text := '0,00';
     End;
end;

procedure TAdicionaQtdeProduto.BT_TrocarClick(Sender: TObject);
begin
     Ampulheta();

     Application.CreateForm(TAdicionaProdutoRelacao,AdicionaProdutoRelacao);

     AdicionaProdutoRelacao.Programa_Anterior.Text    := 'Troca-Produto-Inclusao';

     Seta();

     AdicionaProdutoRelacao.ShowModal;
     AdicionaProdutoRelacao.Destroy;
end;

procedure TAdicionaQtdeProduto.Adiciona_CFKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto.Adiciona_STKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto.FormShow(Sender: TObject);
begin
     If (Programa_Anterior.Text = 'Faturamento') Or (Programa_Anterior.Text = 'Pedido-Inclusao') Or (Programa_Anterior.Text = 'Pedido-Alteracao') Or (Programa_Anterior.Text = 'Registro-Notas-Inclusão') Or (Programa_Anterior.Text = 'Registro-Notas-Inclusão-MB') Or (Programa_Anterior.Text = 'Notas-Inclusão') Then
        Begin
        Adiciona_CF.Enabled := True;
        Adiciona_ST.Enabled := True;
     End;
end;

procedure TAdicionaQtdeProduto.Adiciona_UnidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaQtdeProduto.Adiciona_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
