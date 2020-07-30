unit Pedidos_04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TPedidos04 = class(TForm)
    GroupBox2: TGroupBox;
    SGD_Produtos: TStringGrid;
    Panel3: TPanel;
    BT_Alterar_Pedidos: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure SGD_ProdutosDblClick(Sender: TObject);
    procedure SGD_ProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure BT_Alterar_PedidosClick(Sender: TObject);
  private
    { Private declarations }
    procedure Totaliza_Pedido_Faturamento();

  public
    { Public declarations }
  end;

var
  Pedidos04: TPedidos04;
  Qtde_Produtos_Selecionados: Integer;

implementation

uses Adiciona_Qtde_Produto, Conexao_BD, Rotinas_Gerais, Pedidos_02,
  Produtos_02;

{$R *.dfm}

procedure TPedidos04.BT_SairClick(Sender: TObject);
begin
     Pedidos02.Envia_Faturamento.Text := '';

     Pedidos04.Close;
end;

procedure TPedidos04.SGD_ProdutosDblClick(Sender: TObject);

var
   Acessa_Qtde: Boolean;

begin
     If Qtde_Produtos_Selecionados >= 340 Then
        Begin
        If Trim(SGD_Produtos.Cells[0,SGD_Produtos.Row]) <> '' Then
           Begin
           Acessa_Qtde := True;
           End
        Else
           Begin
           Acessa_Qtde := False;
           MSG_Erro('O número máximo de produtos para a emissão da Nota Fiscal'+Chr(13)+Chr(10)+'já foi atingido.'+Chr(13)+Chr(10)+Chr(13)+Chr(10)+'Para informar mais produtos é necessário fechar este '+Chr(13)+Chr(10)+'pedido e abrir outro.'+Chr(13)+Chr(10)+Chr(13)+Chr(10)+'Você pode continuar alterando os produtos já selecionados');
        End;
        End
     Else
        Begin
        Acessa_Qtde := True;
     End;

     If Acessa_Qtde = True Then
        Begin
        Application.CreateForm(TAdicionaQtdeProduto,AdicionaQtdeProduto);

        AdicionaQtdeProduto.Adiciona_CF.Enabled := True;
        AdicionaQtdeProduto.Adiciona_ST.Enabled := True;

        AdicionaQtdeProduto.Programa_Anterior.Text       := 'Faturamento';
        AdicionaQtdeProduto.Adiciona_ACol.Text           := IntToStr(SGD_Produtos.Col);
        AdicionaQtdeProduto.Adiciona_ARow.Text           := IntToStr(SGD_Produtos.Row);
        AdicionaQtdeProduto.Adiciona_Codigo_Produto.Text := SGD_Produtos.Cells[2,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Referencia.Text     := SGD_Produtos.Cells[3,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Descricao.Text      := SGD_Produtos.Cells[4,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Valor_Unitario.Text := SGD_Produtos.Cells[5,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Quantidade.Text     := SGD_Produtos.Cells[0,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Quantidade_ANT.Text := SGD_Produtos.Cells[0,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Unidade.Text        := SGD_Produtos.Cells[10,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_CF.Text             := SGD_Produtos.Cells[11,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_ST.Text             := SGD_Produtos.Cells[12,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_IPI.Text            := SGD_Produtos.Cells[8,SGD_Produtos.Row];

        AdicionaQtdeProduto.Adiciona_Nro_Ctrl_Estoque.Text := Trim(Pedidos02.Nro_Pedido.Text);
        AdicionaQtdeProduto.Adiciona_Nro_Nota_Estoque.Text := '0';
        AdicionaQtdeProduto.Adiciona_Lote_Estoque.Text     := '0';
        AdicionaQtdeProduto.Adiciona_Tipo_Faturamento.Text := Trim(Pedidos02.Cliente_Tipo_Faturamento.Text);
        AdicionaQtdeProduto.BT_Trocar.Enabled              := False;

        AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Lines.Clear;
        AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Lines.Add(SGD_Produtos.Cells[9,SGD_Produtos.Row]);

        AdicionaQtdeProduto.ShowModal;
        AdicionaQtdeProduto.Destroy;

        SGD_Produtos.Refresh;
     End;
end;

procedure TPedidos04.SGD_ProdutosKeyPress(Sender: TObject; var Key: Char);

var
   Acessa_Qtde: Boolean;
   Ind: Integer;
   Busca_Codigo, Busca_Codigo_Letra, Letra: String;

begin
     If Key = #13 Then
        Begin
        SGD_ProdutosDblClick(Sender);
     End;
end;

procedure TPedidos04.BT_Alterar_PedidosClick(Sender: TObject);

var
   Ind, Erro: Integer;
   Vlr_IPI_Produto, Qtde_Nro_1, Qtde_Nro_2, Qtde_Res_Nro: Real;
   Qtde_Str_1, Qtde_Str_2, Qtde_Res_Str: String;

   Comando_SQL, Emite_Lote, Transportadora, Valor_Inteiro: String;
   Vlr_Frete, Vlr_Desconto, Vlr_IPI, Vlr_Pedido, Vlr_Total, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4: String;
   Nro_Faturado, DT_Entrega: String;

   Financiamento_BNDS_Str, Financiamento_Proger_Str, Financiamento_Leasing_Str, Financiamento_Ibrasmak_Str,
   Pagamento_Vista_Str, Pagamento_Parcelado_Str, Pagamento_Combinado_Str, Parcela_Mes_Subsequente_Str, OPC_Fabrica_Str,
   OPC_Faturamento_Str, OPC_Nao_Imprimir_Str, Parcela_Nro_Str, Parcela_Vencto_Str, Parcela_Dias_Vencto_Str,
   Parcela_Porcentagem_Ato_Str, Parcela_Vlr_Ato_Str, Parcela_Prazo_Inicio_Str, Parcela_Pedido_Str, Parcela_Faturamento_Str, Parcela_Descricao: String;

   Cliente_Peso_Str, Cliente_Volume_Str: String;

begin
     Ampulheta();

     Pedidos02.Envia_Faturamento.Text := 'Ok';

     //*** Totaliza os Pedidos para Faturamento ***

     Totaliza_Pedido_Faturamento();

     //*** Prepara o Processo de Faturamento ***

     Pedidos02.Status_Pedido.Text := 'Faturado';

     For Ind := 1 To SGD_Produtos.RowCount Do
         Begin
         Qtde_Str_1 := Trim(Virgula_Ponto(Pedidos02.SGD_Produtos.Cells[0,Ind]));
         Val(Qtde_Str_1,Qtde_Nro_1,Erro);

         Qtde_Str_2 := Trim(Virgula_Ponto(SGD_Produtos.Cells[0,Ind]));
         Val(Qtde_Str_2,Qtde_Nro_2,Erro);

         If Qtde_Nro_2 < Qtde_Nro_1 Then
            Begin
            Pedidos02.Status_Pedido.Text := 'Semi-Faturado';
         End;

         Qtde_Res_Nro := Qtde_Nro_1 - Qtde_Nro_2;

         Str(Qtde_Res_Nro:7:3,Qtde_Res_Str);
         Qtde_Res_Str := Ponto_Virgula(Trim(Qtde_Res_Str));

         //Pedidos02.SGD_Produtos.Cells[0,Ind] := Qtde_Res_Str;
     End;

     //*** Envia para o Faturamento ***

     //*** Obtem os Valores ***

     DT_Entrega        := Trim(Pedidos02.Data_Entrega.Text);
 
     Vlr_IPI           := Trim(Virgula_Ponto(Pedidos02.Valor_IPI.Text));
     Vlr_Frete         := Trim(Virgula_Ponto(Pedidos02.Valor_Frete.Text));
     Vlr_Desconto      := Trim(Virgula_Ponto(Pedidos02.Valor_Desconto.Text));
     Vlr_Pedido        := Trim(Virgula_Ponto(Pedidos02.Valor_Pedido.Text));
     Vlr_Total         := Trim(Virgula_Ponto(Pedidos02.Valor_Total.Text));
     Desconto          := Trim(Virgula_Ponto(Pedidos02.Porcentagem_Desconto.Text));
     //Cond_Pgto_1       := Trim(Pedidos02.Cliente_Condicao_Pgto_1.Text);
     //Cond_Pgto_2       := Trim(Pedidos02.Cliente_Condicao_Pgto_2.Text);
     //Cond_Pgto_3       := Trim(Pedidos02.Cliente_Condicao_Pgto_3.Text);
     //Cond_Pgto_4       := Trim(Pedidos02.Cliente_Condicao_Pgto_4.Text);

     If Trim(DT_Entrega) = '/  /' Then
        Begin
        DT_Entrega := '00/00/0000';
     End;

     If Trim(Vlr_IPI) = '' Then
        Begin
        Vlr_IPI := '0';
     End;

     If Trim(Vlr_Frete) = '' Then
        Begin
        Vlr_Frete := '0';
     End;

     If Trim(Vlr_Desconto) = '' Then
        Begin
        Vlr_Desconto := '0';
     End;

     If Trim(Vlr_Pedido) = '' Then
        Begin
        Vlr_Pedido := '0';
     End;

     If Trim(Vlr_Total) = '' Then
        Begin
        Vlr_Total := '0';
     End;

     If Trim(Desconto) = '' Then
        Begin
        Desconto := '0';
     End;

     If Trim(Cond_Pgto_1) = '' Then
        Begin
        Cond_Pgto_1 := '0';
     End;

     If Trim(Cond_Pgto_2) = '' Then
        Begin
        Cond_Pgto_2 := '0';
     End;

     If Trim(Cond_Pgto_3) = '' Then
        Begin
        Cond_Pgto_3 := '0';
     End;

     If Trim(Cond_Pgto_4) = '' Then
        Begin
        Cond_Pgto_4 := '0';
     End;

     //*** Obtem a Emissão do Lote ***

     If Pedidos02.Cliente_Emite_Lote.Text = 'Sim' Then
        Begin
        Emite_Lote := 'S';
        End
     Else
        Begin
        Emite_Lote := 'N';
     End;

     //*** Obtem os Dados para Financiamento, Parcelamento e Pagamento ***

     // Financiamento
     // BNDS

     If Pedidos02.Financiamento_BNDS.Checked Then
        Begin
        Financiamento_BNDS_Str := 'S';
        End
     Else
        Begin
        Financiamento_BNDS_Str := 'N';
     End;

     // Proger

     If Pedidos02.Financiamento_Proger.Checked Then
        Begin
        Financiamento_Proger_Str := 'S';
        End
     Else
        Begin
        Financiamento_Proger_Str := 'N';
     End;

     // Leasing

     If Pedidos02.Financiamento_Leasing.Checked Then
        Begin
        Financiamento_Leasing_Str := 'S';
        End
     Else
        Begin
        Financiamento_Leasing_Str := 'N';
     End;

     // Ibrasmak

     If Pedidos02.Financiamento_Ibrasmak.Checked Then
        Begin
        Financiamento_Ibrasmak_Str := 'S';
        End
     Else
        Begin
        Financiamento_Ibrasmak_Str := 'N';
     End;

     // Pagamento
     // Vista

     If Pedidos02.Pagamento_Vista.Checked Then
        Begin
        Pagamento_Vista_Str := 'S';
        End
     Else
        Begin
        Pagamento_Vista_Str := 'N';
     End;

     // Parcelado

     If Pedidos02.Pagamento_Parcelado.Checked Then
        Begin
        Pagamento_Parcelado_Str := 'S';
        End
     Else
        Begin
        Pagamento_Parcelado_Str := 'N';
     End;

     // Combinado

     If Pedidos02.Pagamento_Combinar.Checked Then
        Begin
        Pagamento_Combinado_Str := 'S';
        End
     Else
        Begin
        Pagamento_Combinado_Str := 'N';
     End;

     // Parcelas
     // Mês Subsequente

     If Pedidos02.Parcela_Mes_Subsequente.Checked Then
        Begin
        Parcela_Mes_Subsequente_Str := 'S';
        End
     Else
        Begin
        Parcela_Mes_Subsequente_Str := 'N';
     End;

     // Opções
     // Fabrica

     If Pedidos02.OPC_Fabrica.Checked Then
        Begin
        OPC_Fabrica_Str := 'S';
        End
     Else
        Begin
        OPC_Fabrica_Str := 'N';
     End;

     // Faturamento

     If Pedidos02.OPC_Faturamento.Checked Then
        Begin
        OPC_Faturamento_Str := 'S';
        End
     Else
        Begin
        OPC_Faturamento_Str := 'N';
     End;

     // Não Imprimir

     If Pedidos02.OPC_Nao_Imprimir.Checked Then
        Begin
        OPC_Nao_Imprimir_Str := 'S';
        End
     Else
        Begin
        OPC_Nao_Imprimir_Str := 'N';
     End;

     // Opção de Parcelas

     If Pedidos02.Parcela_Pedido.Checked Then
        Begin
        Parcela_Pedido_Str := 'S';
        End
     Else
        Begin
        Parcela_Pedido_Str := 'N';
     End;

     If Pedidos02.Parcela_Faturamento.Checked Then
        Begin
        Parcela_Faturamento_Str := 'S';
        End
     Else
        Begin
        Parcela_Faturamento_Str := 'N';
     End;  

     // Parcelas - Valores

     Parcela_Descricao           := Trim(Pedidos02.Parcela_Descricao.Text);

     Parcela_Nro_Str             := Trim(Virgula_Ponto(Pedidos02.Parcela_Nro.Text));
     Parcela_Vencto_Str          := Trim(Virgula_Ponto(Pedidos02.Parcela_Vencto.Text));
     Parcela_Dias_Vencto_Str     := Trim(Virgula_Ponto(Pedidos02.Parcela_Dias_Vencto.Text));
     Parcela_Porcentagem_Ato_Str := Trim(Virgula_Ponto(Pedidos02.Parcela_Porcentagem_Ato.Text));
     Parcela_Vlr_Ato_Str         := Trim(Virgula_Ponto(Pedidos02.Parcela_Vlr_Ato.Text));
     Parcela_Prazo_Inicio_Str    := Trim(Virgula_Ponto(Pedidos02.Parcela_Prazo_Inicio.Text));

     Cliente_Peso_Str            := Trim(Virgula_Ponto(Pedidos02.Cliente_Peso.Text));
     Cliente_Volume_Str          := Trim(Virgula_Ponto(Pedidos02.Cliente_Volume.Text));

     //*** Obtem o Nro da Transportadora ***

     Transportadora := Obtem_Nro_Antes_Traco(Pedidos02.Cliente_Transportadora.Text);

     //*** Insere o Pedido Principal ***

     Comando_SQL := 'Insert into faturados(';
     Comando_SQL := Comando_SQL + 'faturado_registro_usuario,';
     Comando_SQL := Comando_SQL + 'faturado_empresa,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_codigo_tipo,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_codigo,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_nome,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_desconto,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_condicao_pgto_1,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_condicao_pgto_2,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_condicao_pgto_3,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_condicao_pgto_4,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_tipo_faturamento,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_emite_lote,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_tipo_transporte,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_transportadora,';
     Comando_SQL := Comando_SQL + 'faturado_valor_desconto,';
     Comando_SQL := Comando_SQL + 'faturado_valor_pedido,';
     Comando_SQL := Comando_SQL + 'faturado_valor_total,';
     Comando_SQL := Comando_SQL + 'faturado_valor_ipi,';
     Comando_SQL := Comando_SQL + 'faturado_status,';
     Comando_SQL := Comando_SQL + 'faturado_numero_nota_fiscal,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_pgto_frete,';
     Comando_SQL := Comando_SQL + 'faturado_data,';

     If Trim(DT_Entrega) <> '00/00/0000' Then
        Begin
        Comando_SQL := Comando_SQL + 'faturado_data_entrega,';
     End;

     Comando_SQL := Comando_SQL + 'faturado_natureza_operacao,';
     Comando_SQL := Comando_SQL + 'faturado_valor_frete,';
     Comando_SQL := Comando_SQL + 'faturado_cliente_observacao,';
     Comando_SQL := Comando_SQL + 'faturado_nota_observacao,';
     Comando_SQL := Comando_SQL + 'faturado_pedido_numero,';
     Comando_SQL := Comando_SQL + 'faturado_ordem_compra,';
     Comando_SQL := Comando_SQL + 'faturado_financiamento_bnds, ';
     Comando_SQL := Comando_SQL + 'faturado_financiamento_proger, ';
     Comando_SQL := Comando_SQL + 'faturado_financiamento_leasing, ';
     Comando_SQL := Comando_SQL + 'faturado_financiamento_ibrasmak, ';
     Comando_SQL := Comando_SQL + 'faturado_pagamento_vista, ';
     Comando_SQL := Comando_SQL + 'faturado_pagamento_parcelado, ';
     Comando_SQL := Comando_SQL + 'faturado_pagamento_combinar, ';
     Comando_SQL := Comando_SQL + 'faturado_parcela_nro, ';
     Comando_SQL := Comando_SQL + 'faturado_parcela_vencto, ';
     Comando_SQL := Comando_SQL + 'faturado_parcela_dias_vencto, ';
     Comando_SQL := Comando_SQL + 'faturado_parcela_mes_subsequente, ';
     Comando_SQL := Comando_SQL + 'faturado_parcela_porcentagem_ato, ';
     Comando_SQL := Comando_SQL + 'faturado_parcela_vlr_ato, ';
     Comando_SQL := Comando_SQL + 'faturado_parcela_prazo_inicio, ';
     Comando_SQL := Comando_SQL + 'faturado_observacao_fabrica, ';
     Comando_SQL := Comando_SQL + 'faturado_opc_fabrica, ';
     Comando_SQL := Comando_SQL + 'faturado_opc_faturamento, ';
     Comando_SQL := Comando_SQL + 'faturado_opc_nao_imprimir, ';
     Comando_SQL := Comando_SQL + 'faturado_alimentacao, ';
     Comando_SQL := Comando_SQL + 'faturado_peso, ';
     Comando_SQL := Comando_SQL + 'faturado_volume, ';
     Comando_SQL := Comando_SQL + 'faturado_solicitado, ';
     Comando_SQL := Comando_SQL + 'faturado_parcela_pedido, ';
     Comando_SQL := Comando_SQL + 'faturado_parcela_faturamento,';
     Comando_SQL := Comando_SQL + 'faturado_observacao_fatura,';
     Comando_SQL := Comando_SQL + 'faturado_parcela_descricao,';
     Comando_SQL := Comando_SQL + 'faturado_sequencia_pedidos)';
     Comando_SQL := Comando_SQL + ' Values(';
     Comando_SQL := Comando_SQL + #39 + Trim(Numero_HD('C')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Pedidos02.Pedido_Empresa.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Pedidos02.Cliente_Codigo_Tipo.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Pedidos02.Cliente_Codigo.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Pedidos02.Cliente_Nome.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Desconto + ',';
     Comando_SQL := Comando_SQL + Cond_Pgto_1 + ',';
     Comando_SQL := Comando_SQL + Cond_Pgto_2 + ',';
     Comando_SQL := Comando_SQL + Cond_Pgto_3 + ',';
     Comando_SQL := Comando_SQL + Cond_Pgto_4 + ',';
     Comando_SQL := Comando_SQL + #39 + Pedidos02.Cliente_Tipo_Faturamento.Text + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Emite_Lote + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Pedidos02.Cliente_Tipo_Transporte.Text + #39 + ',';
     Comando_SQL := Comando_SQL + Transportadora + ',';
     Comando_SQL := Comando_SQL + Vlr_Desconto + ',';
     Comando_SQL := Comando_SQL + Vlr_Pedido + ',';
     Comando_SQL := Comando_SQL + Vlr_Total + ',';
     Comando_SQL := Comando_SQL + Vlr_IPI + ',';
     Comando_SQL := Comando_SQL + #39 + 'Aguardando' + #39 + ',';
     Comando_SQL := Comando_SQL + '0' + ',';
     Comando_SQL := Comando_SQL + #39 + Pedidos02.Cliente_Pgto_Frete.Text + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';

     If Trim(DT_Entrega) <> '00/00/0000' Then
        Begin
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(DT_Entrega),'amd','/') + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + #39 + Trim(Pedidos02.Natureza_Operacao.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Vlr_Frete + ',';
     Comando_SQL := Comando_SQL + #39 + Pedidos02.Cliente_Observacao.Text + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Pedidos02.Observacao_Nota.Text + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Pedidos02.Nro_Pedido_Unico.Text) + ',';
     Comando_SQL := Comando_SQL + #39 + Pedidos02.Cliente_Ordem_Compra.Text + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Financiamento_BNDS_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Financiamento_Proger_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Financiamento_Leasing_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Financiamento_Ibrasmak_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Pagamento_Vista_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Pagamento_Parcelado_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Pagamento_Combinado_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Parcela_Nro_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Parcela_Vencto_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Parcela_Dias_Vencto_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Parcela_Mes_Subsequente_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Parcela_Porcentagem_Ato_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Parcela_Vlr_Ato_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Parcela_Prazo_Inicio_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Pedidos02.Observacao_Fabrica.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(OPC_Fabrica_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(OPC_Faturamento_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(OPC_Nao_Imprimir_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Pedidos02.Cliente_Alimentacao.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Peso_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Volume_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Pedidos02.Cliente_Solicitado.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Parcela_Pedido_Str) + #39 + ', ';
     Comando_SQL := Comando_SQL + #39 + Trim(Parcela_Faturamento_Str) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Pedidos02.Observacao_Faturamento.Text + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Parcela_Descricao) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + ' ' + Trim(Pedidos02.Nro_Pedido.Text) + ', ' + #39 + ')';

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Obtem Número do Faturamento ***

     ConexaoBD.SQL_Faturados.Close;
     ConexaoBD.SQL_Faturados.SQL.Clear;
     ConexaoBD.SQL_Faturados.SQL.Add('Select * from faturados Where faturado_registro_usuario = ' +#39+ Trim(Numero_HD('C')) +#39+ ' Order By faturado_numero Desc');
     ConexaoBD.SQL_Faturados.Open;

     conexaoBD.SQL_Faturados.First;

     Nro_Faturado := conexaoBD.SQL_Faturadosfaturado_numero.Text;

     //*** Insere os Produtos do Faturamento Principal ***

     For Ind := 1 To SGD_Produtos.RowCount Do
         Begin

         Valor_Inteiro := Trim(SGD_Produtos.Cells[0,Ind]);

         If Trim(Valor_Inteiro) = '' Then
            Begin
            Valor_Inteiro := '0';
         End;

         If StrToFloat(Valor_Inteiro) > 0 Then
            Begin
            Comando_SQL := 'Insert into faturados_produtos(';
            Comando_SQL := Comando_SQL + 'faturado_produto_numero_faturado,';
            Comando_SQL := Comando_SQL + 'faturado_produto_quantidade,';
            Comando_SQL := Comando_SQL + 'faturado_produto_codigo,';
            Comando_SQL := Comando_SQL + 'faturado_produto_referencia,';
            Comando_SQL := Comando_SQL + 'faturado_produto_descricao,';
            Comando_SQL := Comando_SQL + 'faturado_produto_valor_unitario,';
            Comando_SQL := Comando_SQL + 'faturado_produto_valor_total,';
            Comando_SQL := Comando_SQL + 'faturado_produto_valor_ipi,';
            Comando_SQL := Comando_SQL + 'faturado_produto_posicao,';
            Comando_SQL := Comando_SQL + 'faturado_produto_descricao_detalhada)';
            Comando_SQL := Comando_SQL + ' Values(';
            Comando_SQL := Comando_SQL + #39 + Trim(Nro_Faturado) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[0,Ind])) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[3,Ind]) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[4,Ind]) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[5,Ind])) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[6,Ind])) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind])) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(IntToStr(Ind)) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[9,Ind]) + #39 + ')';

            Pedidos02.SGD_Produtos.Cells[9,Ind] := SGD_Produtos.Cells[9,Ind];

            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            //*** Inclui a Classificação Fiscal No Produto ***

            If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
               Begin
               Comando_SQL := 'Update fb_produtos Set ';
               Comando_SQL := Comando_SQL + 'fb_produto_classif_fiscal = ' + #39 + Trim(SGD_Produtos.Cells[11,Ind]) + #39 + ' ';

               If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
                  Begin
                  Comando_SQL := Comando_SQL + ', fb_produto_unidade = ' + #39 + Trim(SGD_Produtos.Cells[10,Ind]) + #39 + ' ';
               End;

               If Trim(SGD_Produtos.Cells[12,Ind]) <> '' Then
                  Begin
                  Comando_SQL := Comando_SQL + ', fb_produto_classif_tributaria = ' + #39 + Trim(SGD_Produtos.Cells[12,Ind]) + #39 + ' ';
               End;
               
               Comando_SQL := Comando_SQL + ' Where fb_produto_codigo = ' + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39;

               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Comunitario.ExecSQL;
            End;
         End;
     End;

     MSG_Erro('Pedido Enviado para Faturamento...');

     Pedidos04.Close;
end;

procedure TPedidos04.Totaliza_Pedido_Faturamento();

var
   Ind, Erro: Integer;
   Qtde_Nro, Vlr_Unitario_Nro, Vlr_Total_Nro, Porc_Desconto_Nro, Vlr_Desconto_Nro, Vlr_Frete_Nro, Vlr_Pedido_Nro, Vlr_Geral_Nro, Vlr_IPI_Nro, Porc_IPI_Nro: Real;
   Qtde_Str, Vlr_Unitario_Str, Vlr_Total_Str, Porc_Desconto_Str, Vlr_Desconto_Str, Vlr_Frete_Str, Vlr_Pedido_Str, Vlr_Geral_Str, Vlr_IPI_Str, Porc_IPI_Str: String;

begin
     Ampulheta();

     //*** Zera as Variáveis de Cáculo ***

     Vlr_Desconto_Nro := 0;
     Vlr_Pedido_Nro   := 0;
     Vlr_Geral_Nro    := 0;
     Vlr_Frete_Nro    := 0;
     Vlr_IPI_Nro      := 0;

     //*** Obtem o Valor de Desconto ***

     If Trim(Pedidos02.Porcentagem_Desconto.Text) = '' Then
        Begin
        Porc_Desconto_Nro := 0;
        End
     Else
        Begin
        Porc_Desconto_Str := Trim(Virgula_Ponto(Pedidos02.Porcentagem_Desconto.Text));
        Val(Porc_Desconto_Str,Porc_Desconto_Nro,Erro);
     End;

     //*** Obtem os Valores do Grid ***

     Qtde_Produtos_Selecionados := 0;

     For Ind := 1 To SGD_Produtos.RowCount Do
         Begin
         //*** Calcula a Quantidade do Grid ***

         Qtde_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[0,Ind]));
         Val(Qtde_Str,Qtde_Nro,Erro);

         Vlr_Unitario_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[5,Ind]));
         Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

         Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
         Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
         Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

         Porc_IPI_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind]));
         Val(Porc_IPI_Str,Porc_IPI_Nro,Erro);

         Vlr_IPI_Nro  := Vlr_IPI_Nro + ((Vlr_Total_Nro * Porc_IPI_Nro) / 100);

         SGD_Produtos.Cells[6,Ind] := Vlr_Total_Str;

         //*** Calcula os Valores Totais ***

         Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

         Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
         Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
         Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

         Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

         //*** Registra o Total de Produtos Selecionados ***

         If Qtde_Nro > 0 Then
            Begin
            Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
         End;
     End;

     //*** Joga os Valores Totais no Pedido ***

     Str(Vlr_IPI_Nro:13:2,Vlr_IPI_Str);
     Vlr_IPI_Str := Ponto_Virgula(Trim(Vlr_IPI_Str));
     Pedidos02.Valor_IPI.Text := Vlr_IPI_Str;

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

     Str(Vlr_Geral_Nro:13:2,Vlr_Geral_Str);
     Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
     Pedidos02.Valor_Total.Text := Vlr_Geral_Str;

     Seta();
end;

end.
