unit Fila_Espera_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, ADODB, DB, DBCtrls;

type
  TFilaEspera00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Pedidos: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Opcoes_Procura: TComboBox;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid_Producao: TDBGrid;
    Opcao_Producao: TComboBox;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Opcao_Enviar_Producao: TRadioButton;
    Opcao_Abrir_OS: TRadioButton;
    Label5: TLabel;
    DBG_Cliente_Observacao: TDBMemo;
    DBG_Observacao_Nota: TDBMemo;
    DBG_Observacao_Fabrica: TDBMemo;
    DBG_Observacao_Faturamento: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_PedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Opcoes_ProcuraChange(Sender: TObject);
    procedure DBGrid_PedidosCellClick(Column: TColumn);
    procedure BT_SairClick(Sender: TObject);
    procedure DBGrid_ProducaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Opcao_ProducaoChange(Sender: TObject);
    procedure DBGrid_ProducaoCellClick(Column: TColumn);
  private
    { Private declarations }

    procedure Localizar_OS();
    procedure Localizar_Producao();
    procedure Prepara_Estrutura(Codigo_Produto: String);

  public
    { Public declarations }
  end;

var
  FilaEspera00: TFilaEspera00;
  Nro_Recursiva: Integer;

implementation

uses Conexao_BD, Rotinas_Gerais, Fila_Espera_01, Pedidos_02;

{$R *.dfm}

procedure TFilaEspera00.Localizar_OS();

var
   Comando_SQL: String;

begin
     Ampulheta();

     Comando_SQL := 'Select distinct(pedido_numero), ';
     Comando_SQL := Comando_SQL + 'pedido_registro_usuario, ';
     Comando_SQL := Comando_SQL + 'pedido_empresa, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_codigo_tipo, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_codigo, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_nome, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_desconto, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_condicao_pgto_1, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_condicao_pgto_2, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_condicao_pgto_3, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_condicao_pgto_4, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_tipo_faturamento, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_tipo_tabela, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_emite_lote, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_tipo_transporte, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_transportadora, ';
     Comando_SQL := Comando_SQL + 'pedido_valor_desconto, ';
     Comando_SQL := Comando_SQL + 'pedido_valor_pedido, ';
     Comando_SQL := Comando_SQL + 'pedido_valor_total, ';
     Comando_SQL := Comando_SQL + 'pedido_valor_ipi, ';
     Comando_SQL := Comando_SQL + 'pedido_observacao, ';
     Comando_SQL := Comando_SQL + 'pedido_status, ';
     Comando_SQL := Comando_SQL + 'pedido_numero_nota_fiscal, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_pgto_frete, ';
     Comando_SQL := Comando_SQL + 'pedido_natureza_operacao, ';
     Comando_SQL := Comando_SQL + 'pedido_data, ';
     Comando_SQL := Comando_SQL + 'pedido_data_entrega, ';
     Comando_SQL := Comando_SQL + 'pedido_valor_frete, ';
     Comando_SQL := Comando_SQL + 'pedido_cliente_observacao, ';
     Comando_SQL := Comando_SQL + 'pedido_nota_observacao, ';
     Comando_SQL := Comando_SQL + 'pedido_forma_pagamento, ';
     Comando_SQL := Comando_SQL + 'pedido_ordem_compra, ';
     Comando_SQL := Comando_SQL + 'pedido_financiamento_bnds, ';
     Comando_SQL := Comando_SQL + 'pedido_financiamento_proger, ';
     Comando_SQL := Comando_SQL + 'pedido_financiamento_leasing, ';
     Comando_SQL := Comando_SQL + 'pedido_financiamento_ibrasmak, ';
     Comando_SQL := Comando_SQL + 'pedido_pagamento_vista, ';
     Comando_SQL := Comando_SQL + 'pedido_pagamento_parcelado, ';
     Comando_SQL := Comando_SQL + 'pedido_pagamento_combinar, ';
     Comando_SQL := Comando_SQL + 'pedido_parcela_nro, ';
     Comando_SQL := Comando_SQL + 'pedido_parcela_vencto, ';
     Comando_SQL := Comando_SQL + 'pedido_parcela_dias_vencto, ';
     Comando_SQL := Comando_SQL + 'pedido_parcela_mes_subsequente, ';
     Comando_SQL := Comando_SQL + 'pedido_parcela_porcentagem_ato, ';
     Comando_SQL := Comando_SQL + 'pedido_parcela_vlr_ato, ';
     Comando_SQL := Comando_SQL + 'pedido_parcela_prazo_inicio, ';
     Comando_SQL := Comando_SQL + 'pedido_observacao_fabrica, ';
     Comando_SQL := Comando_SQL + 'pedido_opc_fabrica, ';
     Comando_SQL := Comando_SQL + 'pedido_opc_faturamento, ';
     Comando_SQL := Comando_SQL + 'pedido_opc_nao_imprimir, ';
     Comando_SQL := Comando_SQL + 'pedido_alimentacao, ';
     Comando_SQL := Comando_SQL + 'pedido_peso, ';
     Comando_SQL := Comando_SQL + 'pedido_volume, ';
     Comando_SQL := Comando_SQL + 'pedido_solicitado, ';
     Comando_SQL := Comando_SQL + 'pedido_parcela_pedido, ';
     Comando_SQL := Comando_SQL + 'pedido_parcela_faturamento, ';
     Comando_SQL := Comando_SQL + 'pedido_observacao_fatura, ';
     Comando_SQL := Comando_SQL + 'pedido_parcela_descricao, ';
     Comando_SQL := Comando_SQL + 'pedido_status_producao, ';
     Comando_SQL := Comando_SQL + 'pedido_vendedor_numero, ';
     Comando_SQL := Comando_SQL + 'pedido_vendedor_nome, ';
     Comando_SQL := Comando_SQL + 'pedido_vendedor_porcentagem ';
     Comando_SQL := Comando_SQL + ' from pedidos, pedidos_produtos, fb_produtos_estruturas ';
     Comando_SQL := Comando_SQL + ' where ';

     If Opcoes_Procura.Text = 'Aguardando' Then
        Begin
        Comando_SQL := Comando_SQL + '(pedido_status_producao = '+#39+'Aguardando'+#39+' Or pedido_status_producao = '+#39+#39+' Or pedido_status_producao IS NULL) AND ';
        End
     Else If Opcoes_Procura.Text = 'Em Produção' Then
        Begin
        Comando_SQL := Comando_SQL + '(pedido_status_producao = '+#39+'Em Produção'+#39+') AND ';
        End
     Else If Opcoes_Procura.Text = 'Finalizados' Then
        Begin
        Comando_SQL := Comando_SQL + '(pedido_status_producao = '+#39+'Finalizado'+#39+') AND ';
     End;

     Comando_SQL := Comando_SQL + ' pedido_numero = pedido_produto_numero_pedido and pedido_produto_codigo = fb_produto_estrutura_codigo Order By pedido_numero Asc';

     ConexaoBD.SQL_Pedidos.Close;
     ConexaoBD.SQL_Pedidos.SQL.Clear;
     ConexaoBD.SQL_Pedidos.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Pedidos.Open;

     Seta();
end;

procedure TFilaEspera00.Localizar_Producao();

var
   Comando_SQL: String;

begin
     Ampulheta();

     Comando_SQL := 'SELECT * FROM producao ';

     If Opcao_Producao.Text = 'Aguardando' Then
        Begin
        Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Aguardando'+#39+' Or producao_status = '+#39+#39+' Or producao_status IS NULL) ';
        End
     Else If Opcao_Producao.Text = 'Produzindo' Then
        Begin
        Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Produzindo'+#39+') ';
        End
     Else If Opcao_Producao.Text = 'Parado' Then
        Begin
        Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Parado'+#39+') ';
        End
     Else If Opcao_Producao.Text = 'Finalizado' Then
        Begin
        Comando_SQL := Comando_SQL + 'where (producao_status = '+#39+'Finalizado'+#39+') ';
     End;

     Comando_SQL := Comando_SQL + ' Order By producao_data_os ASC, producao_numero';

     ConexaoBD.SQL_Producao.Close;
     ConexaoBD.SQL_Producao.SQL.Clear;
     ConexaoBD.SQL_Producao.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Producao.Open;

     Seta();
end;

procedure TFilaEspera00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TFilaEspera00.FormShow(Sender: TObject);
begin
     Localizar_OS();
     Localizar_Producao();
end;

procedure TFilaEspera00.DBGrid_PedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If (DBGrid_Pedidos.Fields[4].Text = 'Aguardando') Or (DBGrid_Pedidos.Fields[4].Text = '') Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clRed;
        End
     Else If DBGrid_Pedidos.Fields[4].Text = 'Em Produção' Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clSkyBlue;
        End
     Else If DBGrid_Pedidos.Fields[4].Text = 'Finalizado' Then
        Begin
        DBGrid_Pedidos.Canvas.Brush.Color := clMoneyGreen;
     End;

     DBGrid_Pedidos.DefaultDrawDataCell(Rect, DBGrid_Pedidos.columns[datacol].field, State);
end;

procedure TFilaEspera00.Opcoes_ProcuraChange(Sender: TObject);
begin
     Localizar_OS();
end;

procedure TFilaEspera00.DBGrid_PedidosCellClick(Column: TColumn);

var
   Comando_SQL, Data_OS: String;
   Ind, Quantidade_Maquina: Integer;
   Nro_Pedido, Codigo_Cliente, Vlr_Exibicao: String;
   Erro: Integer;
   Vlr_Numero: Real;

begin
     If DBGrid_Pedidos.Fields[0].Text <> '' Then
        Begin

        If Opcao_Enviar_Producao.Checked Then
           Begin

           If (DBGrid_Pedidos.Fields[4].Text = 'Aguardando') Or (DBGrid_Pedidos.Fields[4].Text = '') Then
              Begin

              If Confirma('Deseja Enviar o Pedido de Nro.: '+Trim(DBGrid_Pedidos.Fields[0].Text)+' para a Produção?') = 6 Then
                 Begin
                 Ampulheta();

                 Comando_SQL := 'Update pedidos Set pedido_status_producao = '+#39+'Em Produção'+#39+' Where pedido_numero = '+Trim(DBGrid_Pedidos.Fields[0].Text);

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 //*** Prepara a Lista de Produção ***

                 //*** Obtem os Pedidos ***

                 ConexaoBD.SQL_NF_FB_Pedidos.Close;
                 ConexaoBD.SQL_NF_FB_Pedidos.SQL.Clear;
                 ConexaoBD.SQL_NF_FB_Pedidos.SQL.Add('Select * from pedidos Where pedido_numero = ' + Trim(DBGrid_Pedidos.Fields[0].Text) );
                 ConexaoBD.SQL_NF_FB_Pedidos.Open;

                 Data_OS := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_data.Text);

                 //*** Obtem os Produtos (Somente os com Estrutura) ***

                 Comando_SQL := 'SELECT ';
                 Comando_SQL := Comando_SQL + 'DISTINCT(pedido_produto_codigo), ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_numero, ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_numero_pedido, ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_quantidade, ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_descricao, ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_valor_unitario, ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_valor_total, ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_valor_ipi, ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_lote, ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_referencia, ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_posicao, ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_descricao_detalhada, ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_unidade ';
                 Comando_SQL := Comando_SQL + 'FROM pedidos_produtos, fb_produtos_estruturas ';
                 Comando_SQL := Comando_SQL + 'WHERE pedido_produto_numero_pedido = ' + Trim(DBGrid_Pedidos.Fields[0].Text) + ' AND ';
                 Comando_SQL := Comando_SQL + 'pedido_produto_codigo = fb_produto_estrutura_codigo ';
                 Comando_SQL := Comando_SQL + 'ORDER BY pedido_produto_posicao';

                 ConexaoBD.SQL_NF_FB_Pedidos_Produtos.Close;
                 ConexaoBD.SQL_NF_FB_Pedidos_Produtos.SQL.Clear;
                 ConexaoBD.SQL_NF_FB_Pedidos_Produtos.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_NF_FB_Pedidos_Produtos.Open;

                 If ConexaoBD.SQL_NF_FB_Pedidos_Produtos.RecordCount > 0 Then
                    Begin
                    Quantidade_Maquina := ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_quantidade.AsInteger;

                    For Ind := 1 To Quantidade_Maquina Do
                        Begin
                        Comando_SQL := 'INSERT INTO producao(';
                        Comando_SQL := Comando_SQL + 'producao_numero_os, ';
                        Comando_SQL := Comando_SQL + 'producao_data_os, ';
                        Comando_SQL := Comando_SQL + 'producao_codigo_produto, ';
                        Comando_SQL := Comando_SQL + 'producao_descricao_produto, ';
                        Comando_SQL := Comando_SQL + 'producao_status, ';
                        Comando_SQL := Comando_SQL + 'producao_data_inicio, ';
                        Comando_SQL := Comando_SQL + 'producao_hora_inicio, ';
                        Comando_SQL := Comando_SQL + 'producao_data_final, ';
                        Comando_SQL := Comando_SQL + 'producao_hora_final, ';
                        Comando_SQL := Comando_SQL + 'producao_horas_gastas, ';
                        Comando_SQL := Comando_SQL + 'producao_porcentagem) ';
                        Comando_SQL := Comando_SQL + 'VALUES(';
                        Comando_SQL := Comando_SQL + ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_numero_pedido.Text + ', ';
                        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Data_OS,'amd','-') + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_codigo.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_descricao.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + 'Aguardando' + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(DateToStr(Date()),'amd','-') + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + TimeToStr(Time()) + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + '00:00:00' + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + '0' + #39 + ',';
                        Comando_SQL := Comando_SQL + #39 + '0%' + #39 + ')';

                        ConexaoBD.SQL_Comunitario.SQL.Clear;
                        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Comunitario.ExecSQL;
                    End;

                    ConexaoBD.SQL_NF_FB_Pedidos_Produtos.Next;

                 End;

                 Localizar_OS();
                 Localizar_Producao();

                 DBGrid_Pedidos.Refresh;
                 DBGrid_Producao.Refresh;

                 Seta();
              End;

              End
           Else If DBGrid_Pedidos.Fields[4].Text = 'Em Produção' Then
              Begin
              MSG_Erro('Pedido de Nro.: '+Trim(DBGrid_Pedidos.Fields[0].Text)+' Já Está Em Produção.')
              End
           Else If DBGrid_Pedidos.Fields[4].Text = 'Finalizado' Then
              Begin
              MSG_Erro('Pedido de Nro.: '+Trim(DBGrid_Pedidos.Fields[0].Text)+' Já Está Finalizado.')
           End;

           End
        Else
           Begin

           If (Pedidos02 = Nil) Then Begin
              Ampulheta();
              Application.CreateForm(TPedidos02,Pedidos02);

              //*** Obtem os Dados do Pedido ***

              Nro_Pedido          := DBGrid_Pedidos.Fields[0].Text;

              ConexaoBD.SQL_NF_FB_Pedidos.Close;
              ConexaoBD.SQL_NF_FB_Pedidos.SQL.Clear;
              ConexaoBD.SQL_NF_FB_Pedidos.SQL.Add('Select * from pedidos Where pedido_numero = ' + Trim(Nro_Pedido) );
              ConexaoBD.SQL_NF_FB_Pedidos.Open;

              //*** Obtem os Dados dos Clientes ***

              Codigo_Cliente := ConexaoBD.SQL_NF_FB_Pedidospedido_cliente_codigo.Text;

              ConexaoBD.SQL_Clientes.Close;
              ConexaoBD.SQL_Clientes.SQL.Clear;
              ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39 );
              ConexaoBD.SQL_Clientes.Open;

              //*** Carrega os Dados Obtidos ***

              Pedidos02.Nro_Pedido.Text               := Nro_Pedido;
              Pedidos02.Pedido_Data_Inclusao.Text     := conexaoBD.SQL_NF_FB_Pedidospedido_data.Text;
              if conexaoBD.SQL_NF_FB_Pedidospedido_empresa.Text = 'Ibrasmak' Then begin
                  Pedidos02.Pedido_Empresa.ItemIndex  := 0;
                  end
              else begin
                  Pedidos02.Pedido_Empresa.ItemIndex  := 1;
              end;
              Pedidos02.Cliente_Codigo.Text           := conexaoBD.SQL_Clientesfb_cliente_codigo.Text;
              Pedidos02.Cliente_Codigo_Tipo.Text      := conexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text;
              Pedidos02.Cliente_Nome.Text             := conexaoBD.SQL_Clientesfb_cliente_razao_social.Text;

              //*** Endereço Normal ***

              Pedidos02.Cliente_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Clientesfb_cliente_estado.Text);
              Pedidos02.Cliente_Cep.Text              := conexaoBD.SQL_Clientesfb_cliente_cep.Text;
              Pedidos02.Cliente_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Clientesfb_cliente_pais.Text);
              Pedidos02.Cliente_Endereco.Text         := conexaoBD.SQL_Clientesfb_cliente_endereco.Text;
              Pedidos02.Cliente_Bairro.Text           := conexaoBD.SQL_Clientesfb_cliente_bairro.Text;
              Pedidos02.Cliente_Cidade.Text           := conexaoBD.SQL_Clientesfb_cliente_cidade.Text;

              //*** Continua Carregando os Dados ***

              Pedidos02.Cliente_Contato.Text          := conexaoBD.SQL_Clientesfb_cliente_contato.Text;
              Pedidos02.Cliente_Fone_Comercial.Text   := conexaoBD.SQL_Clientesfb_cliente_fone_comercial.Text;
              Pedidos02.Cliente_Fone_Celular.Text     := conexaoBD.SQL_Clientesfb_cliente_fone_celular.Text;
              Pedidos02.Cliente_Fone_Fax.Text         := conexaoBD.SQL_Clientesfb_cliente_fone_fax.Text;
              Pedidos02.Cliente_Email.Text            := conexaoBD.SQL_Clientesfb_cliente_email.Text;
              Pedidos02.Cliente_Site.Text             := conexaoBD.SQL_Clientesfb_cliente_site.Text;

              Pedidos02.Pedido_Data.Text              := conexaoBD.SQL_NF_FB_Pedidospedido_data.Text;

              //Pedidos02.Cliente_Desconto.Text              := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_desconto.Text;
              //Pedidos02.Cliente_Condicao_Pgto_1.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_1.Text;
              //Pedidos02.Cliente_Condicao_Pgto_2.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_2.Text;
              //Pedidos02.Cliente_Condicao_Pgto_3.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_3.Text;
              //Pedidos02.Cliente_Condicao_Pgto_4.Text       := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_condicao_pgto_4.Text;

              Pedidos02.Cliente_Tipo_Faturamento.ItemIndex := Obtem_Nro_Tipo_Faturamento(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_tipo_faturamento.Text);
              Pedidos02.Cliente_Emite_Lote.ItemIndex       := Obtem_Nro_Emite_Lote(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_emite_lote.Text);
              Pedidos02.Cliente_Transportadora.ItemIndex   := Obtem_Nro_Transportadora(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_transportadora.Text);
              Pedidos02.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_tipo_transporte.Text);
              Pedidos02.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_transportadora.Text));
              Pedidos02.Codigo_Transportadora.Text         := conexaoBD.SQL_NF_FB_Pedidospedido_cliente_transportadora.Text;
              Pedidos02.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete(conexaoBD.SQL_NF_FB_Pedidospedido_cliente_pgto_frete.Text));
              Pedidos02.Nro_Natureza_Operacao.Text         := IntToStr(Obtem_Nro_Natureza_Operacao(conexaoBD.SQL_NF_FB_Pedidospedido_natureza_operacao.Text,'0'));

              Pedidos02.Observacao_Nota.Lines.Clear;
              Pedidos02.Observacao_Nota.Lines.Add(DBG_Observacao_Nota.Text);

              Pedidos02.Cliente_Observacao.Lines.Clear;
              Pedidos02.Cliente_Observacao.Lines.Add(DBG_Cliente_Observacao.Text);

              Pedidos02.Observacao_Faturamento.Lines.Clear;
              Pedidos02.Observacao_Faturamento.Lines.Add(DBG_Observacao_Faturamento.Text);

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_frete.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              Pedidos02.Valor_Frete.Text := Vlr_Exibicao;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_desconto.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              Pedidos02.Valor_Desconto.Text := Vlr_Exibicao;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_pedido.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              Pedidos02.Valor_Pedido.Text := Vlr_Exibicao;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_total.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              Pedidos02.Valor_Total.Text   := Vlr_Exibicao;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidospedido_valor_ipi.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              Pedidos02.Valor_IPI.Text    := Vlr_Exibicao;

              Pedidos02.Data_Entrega.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_data_entrega.Text;

              Pedidos02.Status_Pedido.Text := DBGrid_Pedidos.Fields[5].Text;

              Pedidos02.Parcela_Descricao.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_descricao.Text;

              If Trim(conexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '' Then Begin
                Pedidos02.Cliente_Suframa.Caption := 'COM SUFRAMA';
                Pedidos02.Valor_IPI.Text := '0,00';
                End
              Else Begin
                Pedidos02.Cliente_Suframa.Caption := '';
              End;

              //*** Opções de Financiamento ***

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_bnds.Text) = 'S' Then
                 Begin
                 Pedidos02.Financiamento_BNDS.Checked := True;
              End;

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_proger.Text) = 'S' Then
                 Begin
                 Pedidos02.Financiamento_Proger.Checked := True;
              End;

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_leasing.Text) = 'S' Then
                 Begin
                 Pedidos02.Financiamento_Leasing.Checked := True;
              End;

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_financiamento_ibrasmak.Text) = 'S' Then
                 Begin
                 Pedidos02.Financiamento_Ibrasmak.Checked := True;
              End;

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_pagamento_vista.Text) = 'S' Then
                 Begin
                 Pedidos02.Pagamento_Vista.Checked := True;
              End;

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_pagamento_parcelado.Text) = 'S' Then
                 Begin
                 Pedidos02.Pagamento_Parcelado.Checked := True;
              End;

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_pagamento_combinar.Text) = 'S' Then
                 Begin
                 Pedidos02.Pagamento_Combinar.Checked := True;
              End;

              Pedidos02.Parcela_Nro.Text         := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_nro.Text);
              Pedidos02.Parcela_Vencto.Text      := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_vencto.Text);
              Pedidos02.Parcela_Dias_Vencto.Text := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_dias_vencto.Text);

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_mes_subsequente.Text) = 'S' Then
                 Begin
                 Pedidos02.Parcela_Mes_Subsequente.Checked := True;
              End;

              Pedidos02.Parcela_Porcentagem_Ato.Text := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_porcentagem_ato.Text);
              Pedidos02.Parcela_Vlr_Ato.Text         := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_vlr_ato.Text);
              Pedidos02.Parcela_Prazo_Inicio.Text    := Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_prazo_inicio.Text);

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_opc_fabrica.Text) = 'S' Then
                 Begin
                 Pedidos02.OPC_Fabrica.Checked := True;
              End;

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_opc_faturamento.Text) = 'S' Then
                 Begin
                 Pedidos02.OPC_Faturamento.Checked := True;
              End;

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_opc_nao_imprimir.Text) = 'S' Then
                 Begin
                 Pedidos02.OPC_Nao_Imprimir.Checked := True;
              End;

              Pedidos02.Observacao_Fabrica.Lines.Clear;
              Pedidos02.Observacao_Fabrica.Lines.Add(DBG_Observacao_Fabrica.Text);

              Pedidos02.Cliente_Alimentacao.Text := ConexaoBD.SQL_NF_FB_Pedidospedido_alimentacao.Text;
              Pedidos02.Cliente_Peso.Text        := ConexaoBD.SQL_NF_FB_Pedidospedido_peso.Text;
              Pedidos02.Cliente_Volume.Text      := ConexaoBD.SQL_NF_FB_Pedidospedido_volume.Text;
              Pedidos02.Cliente_Solicitado.Text  := ConexaoBD.SQL_NF_FB_Pedidospedido_solicitado.Text;

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_pedido.Text) = 'S' Then
                 Begin
                 Pedidos02.Parcela_Pedido.Checked := True;
              End;

              If Trim(ConexaoBD.SQL_NF_FB_Pedidospedido_parcela_faturamento.Text) = 'S' Then
                 Begin
                 Pedidos02.Parcela_Faturamento.Checked := True;
              End;

              //*** Fecha SQL ***

              ConexaoBD.SQL_NF_FB_Pedidos.Close;
              ConexaoBD.SQL_Clientes.Close;

              Pedidos02.BT_Imprimir.Enabled        := False;
              Pedidos02.BT_Alterar_Pedidos.Enabled := False;
              Pedidos02.BT_Excluir.Enabled         := False;
              Pedidos02.BT_Faturamento.Enabled     := False;
              Pedidos02.BT_Adicionar.Enabled       := False;
              Pedidos02.BT_Procurar.Enabled        := False;
              Pedidos02.BT_Produtos.Enabled        := False;

              Seta();

            End;

            Pedidos02.ShowModal;

            Localizar_OS();
            Localizar_Producao();

            DBGrid_Pedidos.Refresh;
            DBGrid_Producao.Refresh;

        End;
     End;
end;

procedure TFilaEspera00.BT_SairClick(Sender: TObject);
begin
     FilaEspera00.Close;
end;

procedure TFilaEspera00.DBGrid_ProducaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If (DBGrid_Producao.Fields[6].Text = 'Aguardando') Or (DBGrid_Producao.Fields[6].Text = '') Then
        Begin
        DBGrid_Producao.Canvas.Brush.Color := clRed;
        End
     Else If DBGrid_Producao.Fields[6].Text = 'Parado' Then
        Begin
        DBGrid_Producao.Canvas.Brush.Color := clYellow;
        End
     Else If DBGrid_Producao.Fields[6].Text = 'Produzindo' Then
        Begin
        DBGrid_Producao.Canvas.Brush.Color := clSkyBlue;
        End
     Else If DBGrid_Producao.Fields[6].Text = 'Finalizado' Then
        Begin
        DBGrid_Producao.Canvas.Brush.Color := clMoneyGreen;
     End;

     DBGrid_Producao.DefaultDrawDataCell(Rect, DBGrid_Producao.columns[datacol].field, State);
end;

procedure TFilaEspera00.Opcao_ProducaoChange(Sender: TObject);
begin
     Localizar_Producao();
end;

procedure TFilaEspera00.DBGrid_ProducaoCellClick(Column: TColumn);

var
   Comando_SQL, Estoque_Produto: String;

begin
     Nro_Recursiva := 0;

     If DBGrid_Producao.Fields[0].Text <> '' Then
        Begin
        Ampulheta();
        
        Application.CreateForm(TFilaEspera01,FilaEspera01);

	      FilaEspera01.producao_numero.Text            := DBGrid_Producao.Fields[0].Text;
	      FilaEspera01.producao_numero_os.Text         := DBGrid_Producao.Fields[1].Text;
	      FilaEspera01.producao_data_os.Text           := DBGrid_Producao.Fields[2].Text;
	      FilaEspera01.producao_codigo_produto.Text    := DBGrid_Producao.Fields[3].Text;
	      FilaEspera01.producao_descricao_produto.Text := DBGrid_Producao.Fields[4].Text;
	      FilaEspera01.producao_status.Text            := DBGrid_Producao.Fields[6].Text;
	      FilaEspera01.producao_data_inicio.Text       := DBGrid_Producao.Fields[5].Text;
	      FilaEspera01.producao_data_final.Text        := DBGrid_Producao.Fields[7].Text;

        //*** Prepara a Estrutura da Produção ***

        Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(DBGrid_Producao.Fields[0].Text)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';

        ConexaoBD.SQL_Producao_Estrutura.Close;
        ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
        ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Producao_Estrutura.Open;

        If conexaoBD.SQL_Producao_Estrutura.RecordCount > 0 Then
           Begin
           FilaEspera01.Qtde_Sequencia_Estrutura.Caption := IntToStr(ConexaoBD.SQL_Producao_Estrutura.RecordCount);

           While Not conexaoBD.SQL_Producao_Estrutura.Eof Do
                 Begin

                 //*** INICIO - Estoque do Produto ***

                 ConexaoBD.SQL_Produtos.Close;
                 ConexaoBD.SQL_Produtos.SQL.Clear;
                 ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' + #39 + Trim(conexaoBD.SQL_Producao_Estruturaproducao_estrutura_item_codigo.Text) + #39 );
                 ConexaoBD.SQL_Produtos.Open;

                 If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
                    Begin
                    Estoque_Produto := ConexaoBD.SQL_Produtosfb_produto_estoque_atual.Text;
                    End
                 Else
                    Begin
                    Estoque_Produto := '-';
                 End;

                 Comando_SQL := 'Update producao_estrutura set ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_estoque = ' + #39 + Trim(Estoque_Produto) + #39 + ' ';
                 Comando_SQL := Comando_SQL + 'Where ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_numero = ' + Trim(conexaoBD.SQL_Producao_Estruturaproducao_estrutura_numero.Text);

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 //*** FINAL - Estoque do Produto ***

                 conexaoBD.SQL_Producao_Estrutura.Next;
           End;

           End
        Else
           Begin
           Nro_Recursiva := Nro_Recursiva + 1;
           Prepara_Estrutura(Trim(DBGrid_Producao.Fields[3].Text));
           Nro_Recursiva := Nro_Recursiva - 1;           

           Comando_SQL := 'Select * from producao_estrutura Where producao_estrutura_numero_producao = '+#39+Trim(DBGrid_Producao.Fields[0].Text)+#39+' Order By producao_estrutura_numero, producao_estrutura_numero_producao, producao_estrutura_sequencia';

           ConexaoBD.SQL_Producao_Estrutura.Close;
           ConexaoBD.SQL_Producao_Estrutura.SQL.Clear;
           ConexaoBD.SQL_Producao_Estrutura.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Producao_Estrutura.Open;

           FilaEspera01.Qtde_Sequencia_Estrutura.Caption := IntToStr(ConexaoBD.SQL_Producao_Estrutura.RecordCount);
        End;

        Seta();

        FilaEspera01.ShowModal;
        FilaEspera01.Destroy;
     End;
end;

procedure TFilaEspera00.Prepara_Estrutura(Codigo_Produto: String);

var
   Comando_SQL: String;
   SQL_Recursiva: TADOQuery;
   DS_Recursiva: TDataSource;
   Retorno_Recursiva: Boolean;
   Estoque_Produto: String;

begin
     Retorno_Recursiva := False;
     
     SQL_Recursiva            := TADOQuery.Create(nil);
     SQL_Recursiva.Connection := ConexaoBD.Conexao_Principal;
     
     DS_Recursiva             := TDataSource.Create(nil);
     DS_Recursiva.DataSet     := SQL_Recursiva;

     Comando_SQL := 'Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(Codigo_Produto)+#39+' Order By fb_produto_estrutura_sequencia';

     SQL_Recursiva.Close;
     SQL_Recursiva.SQL.Clear;
     SQL_Recursiva.SQL.Add(Comando_SQL);
     SQL_Recursiva.Open;

     //*** Insere a Estrutura ***

     If SQL_Recursiva.RecordCount > 0 Then
        Begin

        While Not SQL_Recursiva.Eof Do
              Begin

              If (SQL_Recursiva.FieldByName('fb_produto_estrutura_sequencia').AsInteger <= 1) And (Nro_Recursiva > 1)  Then
                 Begin
                 Comando_SQL := 'Insert into producao_estrutura(';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_numero_producao, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_item, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_codigo, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_item_codigo, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_descricao, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_sequencia, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_qtde, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_medida, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_tipo, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_custo, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_vlr_custo_unitario, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_status, ';
                 Comando_SQL := Comando_SQL + 'producao_estrutura_estoque) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + Trim(DBGrid_Producao.Fields[0].Text) + ', ';
                 Comando_SQL := Comando_SQL + '0, ';
                 Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + '          >>> INICIO DA ESTRUTURA DE: ' + Trim(Codigo_Produto) + ' <<<' + #39 + ', ';
                 Comando_SQL := Comando_SQL + '0, ';
                 Comando_SQL := Comando_SQL + '0, ';
                 Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
                 Comando_SQL := Comando_SQL + '0, ';
                 Comando_SQL := Comando_SQL + #39 + '---' + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + '0' + #39 + ')';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 Retorno_Recursiva := True;
              End;

              //*** INICIO - Estoque do Produto ***

              ConexaoBD.SQL_Produtos.Close;
              ConexaoBD.SQL_Produtos.SQL.Clear;
              ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_item_codigo').Text) + #39 );
              ConexaoBD.SQL_Produtos.Open;

              If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
                 Begin
                 Estoque_Produto := ConexaoBD.SQL_Produtosfb_produto_estoque_atual.Text;
                 End
              Else
                 Begin
                 Estoque_Produto := '-';
              End;

              //*** FINAL - Estoque do Produto ***

              Comando_SQL := 'Insert into producao_estrutura(';
              Comando_SQL := Comando_SQL + 'producao_estrutura_numero_producao, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_item, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_codigo, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_item_codigo, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_descricao, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_sequencia, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_qtde, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_medida, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_tipo, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_custo, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_vlr_custo_unitario, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_status, ';
              Comando_SQL := Comando_SQL + 'producao_estrutura_estoque) ';
              Comando_SQL := Comando_SQL + 'Values(';
              Comando_SQL := Comando_SQL + Trim(DBGrid_Producao.Fields[0].Text) + ', ';
              Comando_SQL := Comando_SQL + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_numero').Text) + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_codigo').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_item_codigo').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_descricao').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_sequencia').Text) + ', ';
              Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_qtde').Text)) + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_medida').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_tipo').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_custo').Text) + #39 + ', ';
              Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_vlr_custo_unitario').Text)) + ', ';
              Comando_SQL := Comando_SQL + #39 + 'Aguardando' + #39 + ', ';
              Comando_SQL := Comando_SQL + #39 + Trim(Estoque_Produto) + #39 + ')';

              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Comunitario.ExecSQL;

              If Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_tipo').Text) = 'IT' Then
                 Begin
                 Nro_Recursiva := Nro_Recursiva + 1;
                 Prepara_Estrutura(Trim(SQL_Recursiva.FieldByName('fb_produto_estrutura_item_codigo').Text));
                 Nro_Recursiva := Nro_Recursiva - 1;
              End;

              SQL_Recursiva.Next;
        End;

        If Retorno_Recursiva Then
           Begin
           Comando_SQL := 'Insert into producao_estrutura(';
           Comando_SQL := Comando_SQL + 'producao_estrutura_numero_producao, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_item, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_codigo, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_item_codigo, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_descricao, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_sequencia, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_qtde, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_medida, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_tipo, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_custo, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_vlr_custo_unitario, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_status, ';
           Comando_SQL := Comando_SQL + 'producao_estrutura_estoque) ';
           Comando_SQL := Comando_SQL + 'Values(';
           Comando_SQL := Comando_SQL + Trim(DBGrid_Producao.Fields[0].Text) + ', ';
           Comando_SQL := Comando_SQL + '0, ';
           Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
           Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
           Comando_SQL := Comando_SQL + #39 + '          >>> FINAL DA ESTRUTURA DE: ' + Trim(Codigo_Produto) + ' <<<' + #39 + ', ';
           Comando_SQL := Comando_SQL + '0, ';
           Comando_SQL := Comando_SQL + '0, ';
           Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
           Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
           Comando_SQL := Comando_SQL + #39 + '-' + #39 + ', ';
           Comando_SQL := Comando_SQL + '0, ';
           Comando_SQL := Comando_SQL + #39 + '---' + #39 + ', ';
           Comando_SQL := Comando_SQL + #39 + '0' + #39 + ')';

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           Retorno_Recursiva := False;
        End;
     End;
end;

end.
