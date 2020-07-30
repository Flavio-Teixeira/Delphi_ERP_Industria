unit Faturamento_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, Grids, StdCtrls, DBCtrls, Buttons, ExtCtrls, ImpMat;

type
  TFaturamento01 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Cliente_Codigo: TEdit;
    Cliente_Codigo_Tipo: TEdit;
    DBG_FB_Cliente_Observacao: TDBMemo;
    Informacao_Cliente_Existe: TEdit;
    Nro_Transportadora: TEdit;
    Nro_Pgto_Frete: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    SGD_Produtos: TStringGrid;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label28: TLabel;
    Label35: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Cliente_Endereco: TEdit;
    Cliente_Bairro: TEdit;
    Cliente_Cidade: TEdit;
    Cliente_Estado: TComboBox;
    Cliente_Cep: TMaskEdit;
    Cliente_Pais: TComboBox;
    Cliente_Nome: TEdit;
    Cliente_Contato: TEdit;
    Cliente_Fone_Comercial: TEdit;
    Cliente_Fone_Celular: TEdit;
    Cliente_Fone_Fax: TEdit;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    Codigo_Transportadora: TEdit;
    ETP_Numero_Nota: TEdit;
    ETP_Data_Emissao_Nota: TEdit;
    ETP_Resultado: TEdit;
    Label12: TLabel;
    Nro_Pedido: TEdit;
    Pedido_Data: TEdit;
    Nro_Natureza_Operacao: TEdit;
    GroupBox7: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Cliente_Desconto: TEdit;
    Cliente_Condicao_Pgto_1: TEdit;
    Cliente_Condicao_Pgto_2: TEdit;
    Cliente_Condicao_Pgto_3: TEdit;
    Cliente_Tipo_Transporte: TComboBox;
    Cliente_Transportadora: TComboBox;
    Cliente_Tipo_Faturamento: TComboBox;
    Cliente_Emite_Lote: TComboBox;
    Observacao_Nota: TMemo;
    Cliente_Pgto_Frete: TComboBox;
    Natureza_Operacao: TComboBox;
    Cliente_Observacao: TMemo;
    Cliente_Condicao_Pgto_4: TEdit;
    Label44: TLabel;
    Cliente_Email: TEdit;
    Cliente_Site: TEdit;
    Label1: TLabel;
    Envia_Faturamento: TEdit;
    Status_Pedido: TEdit;
    Label4: TLabel;
    Data_Entrega: TMaskEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Valor_Desconto: TEdit;
    Valor_Total: TEdit;
    Valor_Pedido: TEdit;
    Valor_Frete: TEdit;
    Valor_IPI: TEdit;
    Label21: TLabel;
    Cliente_Ordem_Compra: TEdit;
    Cliente_Suframa: TLabel;
    Nro_Pedido_Faturado: TEdit;
    Sequencia_Pedidos: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Cliente_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_DescontoExit(Sender: TObject);
    procedure Cliente_Condicao_Pgto_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Condicao_Pgto_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Condicao_Pgto_3KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Tipo_FaturamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Emite_LoteKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Tipo_TransporteKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Pgto_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_TransportadoraKeyPress(Sender: TObject;
      var Key: Char);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure Observacao_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Valor_FreteExit(Sender: TObject);
    procedure Valor_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Tipo_TabelaKeyPress(Sender: TObject; var Key: Char);
    procedure Forma_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Natureza_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Data_EntregaKeyPress(Sender: TObject; var Key: Char);
    procedure Data_EntregaExit(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;

    procedure Exibe_Grid_Produtos();
    procedure Carrega_Transportadoras();
    procedure Carrega_Pgto_Frete();
    procedure Totaliza_Pedido();
    procedure Volta_Valores_Estoque(Usuario_HD, Empresa, Produto, Quantidade: String);
    procedure Volta_Valores_Estoque_Sair(Usuario_HD, Empresa, Produto: String);

  public
    { Public declarations }
  end;

var
  Faturamento01: TFaturamento01;
  Qtde_Produtos_Selecionados: Integer;
  Clicou_Imprimir: Boolean;

implementation

uses Conexao_BD, Rotinas_Gerais, Clientes_02, Clientes_00, Ibrasmak_00, Pedido_03, Pedidos_04;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TFaturamento01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno, Valor_Inteiro: String;
   Resultado, Qtde_Nao_Preenchida: Boolean;
   Ind: Integer;

begin
     Resultado           := True;
     Campo_Retorno       := '';
     Qtde_Nao_Preenchida := True;

     Ampulheta();

     For Ind := 1 To SGD_Produtos.RowCount Do
         Begin
         Valor_Inteiro := Trim(SGD_Produtos.Cells[0,Ind]);

         If Trim(Valor_Inteiro) = '' Then
            Begin
            Valor_Inteiro := '0';
         End;

         If StrToFloat(Valor_Inteiro) > 0 Then
            Begin
            Qtde_Nao_Preenchida := False;
         End;
     End;

     If ((Qtde_Nao_Preenchida) And (Envia_Faturamento.Text <> 'Ok')) Then
        Begin
        Erro          := 'Nenhuma Quantidade foi informada nos produtos';
        Campo_Retorno := 'SGD_Produtos';
     End;

     If Trim(Cliente_Codigo.Text) <> '' Then
        Begin
        ConexaoBD.SQL_FB_Clientes.Close;
        ConexaoBD.SQL_FB_Clientes.SQL.Clear;
        ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Cliente_Codigo.Text) + #39 );
        ConexaoBD.SQL_FB_Clientes.Open;

        If Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_status_credito.Text) = 'S' Then
           Begin
           Erro          := 'Cliente Devedor, o Pedido não será efetuado.';
           Campo_Retorno := 'Cliente_Codigo';
        End;
     End;

     If Trim(Cliente_Nome.Text) = '' Then
        Begin
        Erro          := 'Nenhum Cliente foi informado';
        Campo_Retorno := 'Cliente_Nome';
     End;

     Seta();

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'SGD_Produtos' Then
           Begin
           SGD_Produtos.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TFaturamento01.Exibe_Grid_Produtos();

var
   Ind, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao, Peso_Str: String;

begin
     Ampulheta();

     //*** Prepara a Exibição dos Produtos para Compra ***

     //*** Zera Grid ***

     For Ind := 0 To SGD_Produtos.RowCount Do
         Begin
         SGD_Produtos.Cells[0,Ind] := '';
         SGD_Produtos.Cells[1,Ind] := '';
         SGD_Produtos.Cells[2,Ind] := '';
         SGD_Produtos.Cells[3,Ind] := '';
         SGD_Produtos.Cells[4,Ind] := '';
         SGD_Produtos.Cells[5,Ind] := '';
         SGD_Produtos.Cells[6,Ind] := '';
         SGD_Produtos.Cells[7,Ind] := '';
     End;

     //*** Continua o Carregamento Normal ***

     ConexaoBD.SQL_NF_FB_Faturados_Produtos.Close;
     ConexaoBD.SQL_NF_FB_Faturados_Produtos.SQL.Clear;
     ConexaoBD.SQL_NF_FB_Faturados_Produtos.SQL.Add('Select * from faturados_produtos Where faturado_produto_numero_faturado = ' + Trim(Nro_Pedido_Faturado.Text) + ' Order By faturado_produto_posicao');
     ConexaoBD.SQL_NF_FB_Faturados_Produtos.Open;

     If ConexaoBD.SQL_NF_FB_Faturados_Produtos.RecordCount > 0 Then
        Begin
        SGD_Produtos.RowCount  := 2;
        SGD_Produtos.Refresh;

        SGD_Produtos.RowCount  := (ConexaoBD.SQL_NF_FB_Faturados_Produtos.RecordCount + 1);
        SGD_Produtos.FixedRows := 1;
        Ind := 0;

        ConexaoBD.SQL_NF_FB_Faturados_Produtos.First;

        While Not ConexaoBD.SQL_NF_FB_Faturados_Produtos.Eof Do
              Begin
              Ind := Ind + 1;

              SGD_Produtos.Cells[0,Ind] := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_quantidade.Text;
              SGD_Produtos.Cells[1,Ind] := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_codigo.Text;
              SGD_Produtos.Cells[2,Ind] := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_referencia.Text;
              SGD_Produtos.Cells[3,Ind] := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_descricao.Text;

              //*** Busca o Peso do Produto ***

              ConexaoBD.SQL_Produtos.Close;
              ConexaoBD.SQL_Produtos.SQL.Clear;
              ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' +#39+ Trim(ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_codigo.Text) + #39);
              ConexaoBD.SQL_Produtos.Open;

              //*** Retorna ao Carregamento Normal ***

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_valor_unitario.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              SGD_Produtos.Cells[4,Ind] := Vlr_Exibicao;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_valor_total.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              SGD_Produtos.Cells[5,Ind] := Vlr_Exibicao;

              SGD_Produtos.Cells[6,Ind] := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_valor_ipi.Text;
              SGD_Produtos.Cells[7,Ind] := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_posicao.Text;

              ConexaoBD.SQL_NF_FB_Faturados_Produtos.Next;
        End;

        End
     Else
        Begin
        SGD_Produtos.RowCount  := 2;
        SGD_Produtos.FixedRows := 1;
     End;

     //*** Preparação do StringGrid ***

     //*** Quantidade ***
     SGD_Produtos.Cells[0,0]   := 'Quantidade';
     SGD_Produtos.ColWidths[0] := 60;

     //*** Código do Produto ***
     SGD_Produtos.Cells[1,0]   := 'Cód.Produto';
     SGD_Produtos.ColWidths[1] := 94;

     //*** Referência ***
     SGD_Produtos.Cells[2,0]   := 'Referência';
     SGD_Produtos.ColWidths[2] := 94;

     //*** Descrição do Produto ***
     SGD_Produtos.Cells[3,0]   := 'Descrição';
     SGD_Produtos.ColWidths[3] := 270;

     //*** Valor Unitário ***
     SGD_Produtos.Cells[4,0]   := 'Vlr.Unitário (R$)';
     SGD_Produtos.ColWidths[4] := 80;

     //*** Valor Total ***
     SGD_Produtos.Cells[5,0]   := 'Vlr.Total (R$)';
     SGD_Produtos.ColWidths[5] := 80;

     //*** Vlr do IPI ***
     SGD_Produtos.Cells[6,0]   := 'Vlr.IPI';
     SGD_Produtos.ColWidths[6] := 0;

     //*** Posicao do Produto ***
     SGD_Produtos.Cells[7,0]   := 'Posição';
     SGD_Produtos.ColWidths[7] := 0;

     Seta();
end;

procedure TFaturamento01.Carrega_Transportadoras();
begin
     Ampulheta();

     // Obtem as Transportadoras

     ConexaoBD.SQL_Transportadoras.Close;
     ConexaoBD.SQL_Transportadoras.SQL.Clear;
     ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Order By fb_transportadora_nome');
     ConexaoBD.SQL_Transportadoras.Open;

     Cliente_Transportadora.Items.Clear;

     If conexaoBD.SQL_Transportadoras.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Transportadoras.First;

        While Not conexaoBD.SQL_Transportadoras.Eof Do
              begin
              Cliente_Transportadora.Items.Add(IntToStr(conexaoBD.SQL_Transportadorasfb_transportadora_numero.AsInteger)+' - '+conexaoBD.SQL_Transportadorasfb_transportadora_nome.AsString);
              conexaoBD.SQL_Transportadoras.Next;
        End;
     end;

     ConexaoBD.SQL_Transportadoras.Close;

     Cliente_Transportadora.ItemIndex := StrToInt(Nro_Transportadora.Text);

     Seta();
end;

procedure TFaturamento01.Carrega_Pgto_Frete();
begin
     Cliente_Pgto_Frete.Items.Clear;
     Cliente_Pgto_Frete.Items.Add('Cliente');
     Cliente_Pgto_Frete.Items.Add('Ibrasmak');

     Cliente_Pgto_Frete.ItemIndex := StrToInt(Nro_Pgto_Frete.Text);
end;

procedure TFaturamento01.Totaliza_Pedido();

var
   Ind, Erro: Integer;
   Qtde_Nro, Vlr_Unitario_Nro, Vlr_Total_Nro, Porc_Desconto_Nro, Vlr_Desconto_Nro, Vlr_Frete_Nro, Vlr_Pedido_Nro, Vlr_Geral_Nro, Vlr_IPI_Nro, Vlr_Total_IPI_Nro: Real;
   Qtde_Str, Vlr_Unitario_Str, Vlr_Total_Str, Porc_Desconto_Str, Vlr_Desconto_Str, Vlr_Frete_Str, Vlr_Pedido_Str, Vlr_Geral_Str, Vlr_IPI_Str, Vlr_Total_IPI_Str: String;

begin
     Ampulheta();

     //*** Zera as Variáveis de Cáculo ***

     Vlr_Desconto_Nro := 0;
     Vlr_Pedido_Nro   := 0;
     Vlr_Geral_Nro    := 0;
     Vlr_Frete_Nro    := 0;

     //*** Obtem o Valor de Desconto ***

     If Trim(Cliente_Desconto.Text) = '' Then
        Begin
        Porc_Desconto_Nro := 0;
        End
     Else
        Begin
        Porc_Desconto_Str := Trim(Virgula_Ponto(Cliente_Desconto.Text));
        Val(Porc_Desconto_Str,Porc_Desconto_Nro,Erro);
     End;

     //*** Obtem os Valores do Grid ***

     Qtde_Produtos_Selecionados := 0;

     For Ind := 1 To SGD_Produtos.RowCount Do
         Begin
         //*** Calcula a Quantidade do Grid ***

         Qtde_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[0,Ind]));
         Val(Qtde_Str,Qtde_Nro,Erro);

         Vlr_Unitario_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[4,Ind]));
         Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

         Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
         Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
         Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

         SGD_Produtos.Cells[5,Ind] := Vlr_Total_Str;

         //*** Calcula os Valores Totais ***

         Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

         Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
         Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
         Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

         Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

         //*** Calcula o Valor do IPI ***

         Vlr_IPI_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[7,Ind]));
         Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

         If Trim(Cliente_Suframa.Caption) <> '' Then
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
     Valor_IPI.Text := Vlr_Total_IPI_Str;

     Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
     Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
     Valor_Pedido.Text := Vlr_Pedido_Str;

     Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
     Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
     Valor_Desconto.Text := Vlr_Desconto_Str;

     Vlr_Frete_Str := Trim(Valor_Frete.Text);

     If Trim(Vlr_Frete_Str) = '' Then
        Begin
        Vlr_Frete_Str := '0';
     End;

     Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

     Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
     Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
     Valor_Frete.Text := Vlr_Frete_Str;

     Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro + Vlr_Total_IPI_Nro);
     
     Str(Vlr_Geral_Nro:13:2,Vlr_Geral_Str);
     Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
     Valor_Total.Text := Vlr_Geral_Str;

     Seta();
end;

procedure TFaturamento01.Volta_Valores_Estoque(Usuario_HD, Empresa, Produto, Quantidade: String);

var
   Comando_SQL: String;
   Produto_Qtde_Estoque, Total_Qtde_Estoque: Real;

begin
     If Trim(Trim(Cliente_Tipo_Faturamento.Text)) = 'Nota Fiscal' Then
        Begin
        FB_Registra_Movto_Estoque('11',Trim(Nro_Pedido.Text),'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(Quantidade));
        End
     Else
        Begin
        FB_Registra_Movto_Estoque('12',Trim(Nro_Pedido.Text),'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(Quantidade));
     End;
end;

procedure TFaturamento01.Volta_Valores_Estoque_Sair(Usuario_HD, Empresa, Produto: String);

var
   Comando_SQL: String;
   Produto_Qtde_Estoque, Total_Qtde_Estoque: Real;

begin
     ConexaoBD.SQL_Estoque_Transacoes.Close;
     ConexaoBD.SQL_Estoque_Transacoes.SQL.Clear;
     ConexaoBD.SQL_Estoque_Transacoes.SQL.Add('Select * from estoque_transacoes Where estoque_transacao_usuario = ' + #39 + Usuario_HD + #39 + ' And estoque_transacao_empresa = ' + #39 + Empresa + #39 + ' And estoque_transacao_cod_produto = ' + #39 + Produto + #39);
     ConexaoBD.SQL_Estoque_Transacoes.Open;

     If conexaoBD.SQL_Estoque_Transacoes.RecordCount > 0 Then
        Begin
        conexaoBD.SQL_Estoque_Transacoes.First;

        //*** Obtem o Produto da Transação de Estoque ***

        Produto_Qtde_Estoque := StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Estoque_Transacoesestoque_transacao_qtde_produto.Text));

        //*** Restaura o Valor Original do Estoque ***

        If Trim(Trim(Cliente_Tipo_Faturamento.Text)) = 'Nota Fiscal' Then
           Begin
           FB_Registra_Movto_Estoque('11',Nro_Pedido.Text,'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(FloatToStr(Produto_Qtde_Estoque)));
           End
        Else
           Begin
           FB_Registra_Movto_Estoque('12',Nro_Pedido.Text,'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(FloatToStr(Produto_Qtde_Estoque)));
        End;

        //*** Retira o Valor Original do Estoque ***

        ConexaoBD.SQL_Pedidos_Transacoes.Close;
        ConexaoBD.SQL_Pedidos_Transacoes.SQL.Clear;
        ConexaoBD.SQL_Pedidos_Transacoes.SQL.Add('Select * from pedidos_transacoes Where pedido_transacao_usuario = ' + #39 + Usuario_HD + #39 + ' And pedido_transacao_empresa = ' + #39 + Empresa + #39 + ' And pedido_transacao_cod_produto = ' + #39 + Produto + #39 + ' And pedido_transacao_nro_pedido = ' + Trim(Nro_Pedido.Text));
        ConexaoBD.SQL_Pedidos_Transacoes.Open;

        If conexaoBD.SQL_Pedidos_Transacoes.RecordCount > 0 Then
           Begin
           conexaoBD.SQL_Pedidos_Transacoes.First;

           If Trim(Trim(Cliente_Tipo_Faturamento.Text)) = 'Nota Fiscal' Then
              Begin
              FB_Registra_Movto_Estoque('51',Trim(Nro_Pedido.Text),'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(conexaoBD.SQL_Pedidos_Transacoespedido_transacao_qtde_produto.Text));
              End
           Else
              Begin
              FB_Registra_Movto_Estoque('52',Trim(Nro_Pedido.Text),'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(conexaoBD.SQL_Pedidos_Transacoespedido_transacao_qtde_produto.Text));
           End;
        End;

        //*** Deleta a Transação Anterior do Estoque ***

        Comando_SQL := 'Delete From estoque_transacoes Where estoque_transacao_usuario = ' + #39 + Usuario_HD + #39 + ' And estoque_transacao_empresa = ' + #39 + Empresa + #39 + ' And estoque_transacao_cod_produto = ' + #39 + Produto + #39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
     End;
end;

procedure TFaturamento01.BT_SairClick(Sender: TObject);
begin
     Faturamento01.Close;
end;

procedure TFaturamento01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';
     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TFaturamento01.FormShow(Sender: TObject);
var
    Ind: Integer;
    Qtde_Produto_Digitada: Boolean;
    Valor_Inteiro: String;
begin
    Qtde_Produto_Digitada := False;

    For Ind := 1 To SGD_Produtos.RowCount Do
       Begin
       Valor_Inteiro := Trim(SGD_Produtos.Cells[0,Ind]);

       If Trim(Valor_Inteiro) = '' Then
          Begin
          Valor_Inteiro := '0';
       End;

       If StrToFloat(Valor_Inteiro) > 0 Then
          Begin
          Qtde_Produto_Digitada := True;
       End;
    End;

    If Qtde_Produto_Digitada = False Then
      Begin
      Exibe_Grid_Produtos();
    End;

    Clicou_Imprimir := False;
end;

procedure TFaturamento01.BT_AlterarClick(Sender: TObject);

var
   Codigo_Cliente, Tipo_Codigo_Cliente, Tipo_Empresa_Cliente: String;

begin
     Faturamento01.Visible := False;

     Ampulheta();
     Application.CreateForm(TClientes02,Clientes02);

     Clientes02.Programa_Anterior.Text := 'Pedido-Alteracao';

     //*** Obtem os Dados do Cliente ***

     Codigo_Cliente       := Cliente_Codigo.Text;
     Tipo_Codigo_Cliente  := Cliente_Codigo_Tipo.Text;
     Tipo_Empresa_Cliente := '0';

     ConexaoBD.SQL_FB_Clientes.Close;
     ConexaoBD.SQL_FB_Clientes.SQL.Clear;

     If Tipo_Codigo_Cliente = 'CNPJ' Then
        Begin
        ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
        End
     Else If Tipo_Codigo_Cliente = 'CPF' Then
        Begin
        ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
        End
     Else If Tipo_Codigo_Cliente = 'RG' Then
        Begin
        ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
        End
     Else If Tipo_Codigo_Cliente = 'E-Mail' Then
        Begin
        ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
     End;

     ConexaoBD.SQL_FB_Clientes.Open;

     //*** Carrega os Dados Obtidos ***

     If Tipo_Codigo_Cliente = 'CNPJ' Then
        Begin
        Clientes02.Cliente_Codigo_CNPJ.Text  := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo.AsString;
        End
     Else If Tipo_Codigo_Cliente = 'CPF' Then
        Begin
        Clientes02.Cliente_Codigo_CPF.Text   := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo.AsString;
        End
     Else If Tipo_Codigo_Cliente = 'RG' Then
        Begin
        Clientes02.Cliente_Codigo_RG.Text    := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo.AsString;
        End
     Else If Tipo_Codigo_Cliente = 'E-Mail' Then
        Begin
        Clientes02.Cliente_Codigo_EMail.Text := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo.AsString;
     End;

     Clientes02.Cliente_Codigo_Tipo.ItemIndex     := Obtem_Nro_Tipo_Codigo(ConexaoBD.SQL_FB_Clientesfb_cliente_codigo_tipo.Text);
     Clientes02.Cliente_Nome.Text                 := ConexaoBD.SQL_FB_Clientesfb_cliente_nome.Text;
     Clientes02.Cliente_Razao_Social.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_razao_social.Text;
     Clientes02.Cliente_Inscricao_Municipal.Text  := ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_municipal.Text;
     Clientes02.Cliente_Inscricao_Estadual.Text   := ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_estadual.Text;
     Clientes02.Cliente_Endereco.Text             := ConexaoBD.SQL_FB_Clientesfb_cliente_endereco.Text;
     Clientes02.Cliente_Bairro.Text               := ConexaoBD.SQL_FB_Clientesfb_cliente_bairro.Text;
     Clientes02.Cliente_Cidade.Text               := ConexaoBD.SQL_FB_Clientesfb_cliente_cidade.Text;
     Clientes02.Cliente_Estado.ItemIndex          := Obtem_Nro_Estado(ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text);
     Clientes02.Cliente_Cep.Text                  := ConexaoBD.SQL_FB_Clientesfb_cliente_cep.Text;
     Clientes02.Cliente_Contato.Text              := ConexaoBD.SQL_FB_Clientesfb_cliente_contato.Text;
     Clientes02.Cliente_Fone_Comercial.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_comercial.Text;
     Clientes02.Cliente_Fone_Celular.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_celular.Text;
     Clientes02.Cliente_Fone_Fax.Text             := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_fax.Text;
     Clientes02.Cliente_Endereco_Cobranca.Text    := ConexaoBD.SQL_FB_Clientesfb_cliente_endereco_cobranca.Text;
     Clientes02.Cliente_Bairro_Cobranca.Text      := ConexaoBD.SQL_FB_Clientesfb_cliente_bairro_cobranca.Text;
     Clientes02.Cliente_Cidade_Cobranca.Text      := ConexaoBD.SQL_FB_Clientesfb_cliente_cidade_cobranca.Text;
     Clientes02.Cliente_Estado_Cobranca.ItemIndex := Obtem_Nro_Estado(ConexaoBD.SQL_FB_Clientesfb_cliente_estado_cobranca.Text);
     Clientes02.Cliente_Cep_Cobranca.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_cep_cobranca.Text;
     Clientes02.Cliente_Status_Credito.ItemIndex  := Obtem_Nro_Status_Credito(ConexaoBD.SQL_FB_Clientesfb_cliente_status_credito.Text);
     Clientes02.Nro_Cliente_Tipo_Empresa.Text     := Tipo_Empresa_Cliente;
     Clientes02.Nro_Banco.Text                    := IntToStr(Obtem_Nro_Banco_EMP('NT',ConexaoBD.SQL_FB_Clientesfb_cliente_banco.Text));
     Clientes02.Nro_Representante.Text            := IntToStr(Obtem_Nro_Representante_EMP('NT',ConexaoBD.SQL_FB_Clientesfb_cliente_vendedor.Text));
     Clientes02.Cliente_Tipo_Pessoa.ItemIndex     := Obtem_Nro_Tipo_Pessoa(ConexaoBD.SQL_FB_Clientesfb_cliente_tipo_pessoa.Text);
     Clientes02.Cliente_Data_Inclusao.Text        := ConexaoBD.SQL_FB_Clientesfb_cliente_data_inclusao.Text;
     Clientes02.Cliente_Data_Visita.Text          := ConexaoBD.SQL_FB_Clientesfb_cliente_data_visita.Text;
     Clientes02.Cliente_Data_Alteracao.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_data_alteracao.Text;
     Clientes02.Cliente_Data_Ultima_Compra.Text   := ConexaoBD.SQL_FB_Clientesfb_cliente_data_ultima_compra.Text;
     Clientes02.Cliente_Ultimo_Valor.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_ultimo_valor.Text;

     Clientes02.Cliente_Observacoes.Lines.Clear;
     Clientes02.Cliente_Observacoes.Lines.Add(Cliente_Observacao.Text);

     Clientes02.Cliente_Pais.ItemIndex            := Obtem_Nro_Pais(ConexaoBD.SQL_FB_Clientesfb_cliente_pais.Text);

     Clientes02.Cliente_Opcao_Cobranca.ItemIndex  := Obtem_Nro_Opcao_Cobranca(ConexaoBD.SQL_FB_Clientesfb_cliente_opcao_cobranca.Text);

     Clientes02.Cliente_Email.Text := ConexaoBD.SQL_FB_Clientesfb_cliente_email.Text;

     Clientes02.Cliente_Desconto.Text              := ConexaoBD.SQL_FB_Clientesfb_cliente_desconto.Text;
     Clientes02.Cliente_Condicao_Pgto_1.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_condicao_pgto_1.Text;
     Clientes02.Cliente_Condicao_Pgto_2.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_condicao_pgto_2.Text;
     Clientes02.Cliente_Condicao_Pgto_3.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_condicao_pgto_3.Text;
     Clientes02.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(ConexaoBD.SQL_FB_Clientesfb_cliente_tipo_transporte.Text);
     Clientes02.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora_EMP('NT',ConexaoBD.SQL_FB_Clientesfb_cliente_transportadora.Text));

     Clientes02.Cliente_Emite_Lote.ItemIndex       := Obtem_Nro_Emite_Lote(ConexaoBD.SQL_FB_Clientesfb_cliente_emite_lote.Text);
     Clientes02.Cliente_Transportadora.ItemIndex   := Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Clientesfb_cliente_transportadora.Text);
     Clientes02.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete_EMP('NT',ConexaoBD.SQL_FB_Clientesfb_cliente_pgto_frete.Text));

     //*** Fecha SQL ***

     ConexaoBD.SQL_FB_Clientes.Close;

     Seta();

     Clientes02.ShowModal;
     Clientes02.Destroy;

     Faturamento01.Visible := True;

     Totaliza_Pedido();
end;

procedure TFaturamento01.Cliente_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;

     Totaliza_Pedido();
end;

procedure TFaturamento01.Cliente_DescontoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TFaturamento01.Cliente_Condicao_Pgto_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Cliente_Condicao_Pgto_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Cliente_Condicao_Pgto_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Cliente_Tipo_FaturamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Cliente_Emite_LoteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Cliente_Tipo_TransporteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Cliente_Pgto_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Cliente_TransportadoraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.BT_ExcluirClick(Sender: TObject);

var
   Ind: Integer;
   Comando_SQL, Produto, Valor_Inteiro: String;
   Produto_Qtde_Estoque, Total_Qtde_Estoque: Integer;
   Quantidade : Real;

begin
     If Confirma('Ao excluir este Faturamento, o mesmo voltará a ser um Pedido. Confirma a Exclusão?') = 6 Then
        Begin
        //*** Volta o Pedido ***
        Comando_SQL := 'Update pedidos set ';
        Comando_SQL := Comando_SQL + 'pedido_status = '+#39+'Aguardando'+#39+' ';
        Comando_SQL := Comando_SQL + ' Where pedido_numero IN(' + Trim(Sequencia_Pedidos.Text) + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Apaga o Registro para Faturamento ***
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete From faturados_produtos Where faturado_produto_numero_faturado = ' + Trim(Nro_Pedido_Faturado.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete From faturados Where faturado_numero = ' + Nro_Pedido_Faturado.Text);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Fecha Aplicação ***
        MSG_Erro('Faturamento Retornado para Pedido');
        Faturamento01.Close;
     End;
end;

procedure TFaturamento01.Observacao_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Valor_FreteExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TFaturamento01.Valor_FreteKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Cliente_Tipo_TabelaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Forma_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Natureza_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Data_EntregaKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFaturamento01.Data_EntregaExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

end.
