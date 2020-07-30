unit Pedidos_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, Grids, StdCtrls, DBCtrls, Buttons, ExtCtrls, ImpMat,
  ComCtrls;

type
  TPedidos02 = class(TForm)
    Panel3: TPanel;
    BT_Alterar_Pedidos: TBitBtn;
    BT_Sair: TBitBtn;
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
    Panel4: TPanel;
    BT_Adicionar: TBitBtn;
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
    BT_Procurar: TBitBtn;
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
    Label44: TLabel;
    Cliente_Email: TEdit;
    Cliente_Site: TEdit;
    Label1: TLabel;
    BT_Imprimir: TBitBtn;
    BT_Faturamento: TBitBtn;
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
    Cliente_Suframa: TLabel;
    Pedido_Data_Inclusao: TMaskEdit;
    Nota_Dados_Complementares: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox7: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label9: TLabel;
    Cliente_Tipo_Transporte: TComboBox;
    Cliente_Transportadora: TComboBox;
    Cliente_Tipo_Faturamento: TComboBox;
    Cliente_Emite_Lote: TComboBox;
    Cliente_Pgto_Frete: TComboBox;
    Natureza_Operacao: TComboBox;
    Cliente_Ordem_Compra: TEdit;
    Transportadora_Nao_Cadastrada: TEdit;
    TabSheet2: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Financiamento_BNDS: TCheckBox;
    Financiamento_Leasing: TCheckBox;
    Financiamento_Ibrasmak: TCheckBox;
    Financiamento_Proger: TCheckBox;
    Pagamento_Vista: TRadioButton;
    Pagamento_Parcelado: TRadioButton;
    Pagamento_Combinar: TRadioButton;
    Forma_Parcelamento: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Parcela_Nro: TEdit;
    Parcela_Vencto: TEdit;
    Parcela_Dias_Vencto: TEdit;
    Parcela_Mes_Subsequente: TCheckBox;
    Valor_Ato: TGroupBox;
    Label29: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    Parcela_Porcentagem_Ato: TEdit;
    Parcela_Vlr_Ato: TEdit;
    Parcela_Prazo_Inicio: TEdit;
    TabSheet3: TTabSheet;
    Label18: TLabel;
    Label22: TLabel;
    Observacao_Nota: TMemo;
    Cliente_Observacao: TMemo;
    TabSheet4: TTabSheet;
    Label36: TLabel;
    Observacao_Fabrica: TMemo;
    OPC_Fabrica: TRadioButton;
    OPC_Faturamento: TRadioButton;
    OPC_Nao_Imprimir: TRadioButton;
    Label2: TLabel;
    Label39: TLabel;
    Cliente_Alimentacao: TEdit;
    Label37: TLabel;
    Cliente_Peso: TEdit;
    Cliente_Volume: TEdit;
    Label38: TLabel;
    GroupBox8: TGroupBox;
    Cliente_Solicitado: TEdit;
    DBG_NF_FB_Pedido_Produto_Descricao_Detalhada: TDBMemo;
    Label40: TLabel;
    Parcela_Pedido: TRadioButton;
    Parcela_Faturamento: TRadioButton;
    Label27: TLabel;
    Label41: TLabel;
    Observacao_Faturamento: TMemo;
    GroupBox5: TGroupBox;
    Pedido_Empresa: TComboBox;
    Label42: TLabel;
    Cliente_Codigo: TEdit;
    Parcela_Descricao: TEdit;
    BT_Produtos: TBitBtn;
    Nro_Pedido_Unico: TEdit;
    BT_Adicionar_Transportadora: TBitBtn;
    Label21: TLabel;
    Porcentagem_Desconto: TEdit;
    Label43: TLabel;
    Registro_OS_Geral: TEdit;
    Button1: TButton;
    GroupBox6: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Cliente_Vendedor: TComboBox;
    Cliente_Comissao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_AdicionarClick(Sender: TObject);
    procedure SGD_ProdutosDblClick(Sender: TObject);
    procedure Cliente_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_DescontoExit(Sender: TObject);
    procedure SGD_ProdutosKeyPress(Sender: TObject; var Key: Char);
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
    procedure BT_Alterar_PedidosClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure Observacao_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Valor_FreteExit(Sender: TObject);
    procedure Valor_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Tipo_TabelaKeyPress(Sender: TObject; var Key: Char);
    procedure Forma_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Natureza_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure BT_FaturamentoClick(Sender: TObject);
    procedure Data_EntregaKeyPress(Sender: TObject; var Key: Char);
    procedure Data_EntregaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cliente_AlimentacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_PesoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_VolumeKeyPress(Sender: TObject; var Key: Char);
    procedure Financiamento_BNDSKeyPress(Sender: TObject; var Key: Char);
    procedure Financiamento_ProgerKeyPress(Sender: TObject; var Key: Char);
    procedure Financiamento_LeasingKeyPress(Sender: TObject;
      var Key: Char);
    procedure Financiamento_IbrasmakKeyPress(Sender: TObject;
      var Key: Char);
    procedure Pagamento_VistaKeyPress(Sender: TObject; var Key: Char);
    procedure Pagamento_ParceladoKeyPress(Sender: TObject; var Key: Char);
    procedure Pagamento_CombinarKeyPress(Sender: TObject; var Key: Char);
    procedure Parcela_NroKeyPress(Sender: TObject; var Key: Char);
    procedure Parcela_VenctoKeyPress(Sender: TObject; var Key: Char);
    procedure Parcela_Dias_VenctoKeyPress(Sender: TObject; var Key: Char);
    procedure Parcela_PedidoKeyPress(Sender: TObject; var Key: Char);
    procedure Parcela_FaturamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Parcela_Mes_SubsequenteKeyPress(Sender: TObject;
      var Key: Char);
    procedure Parcela_Porcentagem_AtoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Parcela_Vlr_AtoKeyPress(Sender: TObject; var Key: Char);
    procedure Parcela_Prazo_InicioKeyPress(Sender: TObject; var Key: Char);
    procedure Parcela_Porcentagem_AtoExit(Sender: TObject);
    procedure Pagamento_VistaClick(Sender: TObject);
    procedure Pagamento_ParceladoClick(Sender: TObject);
    procedure Pagamento_CombinarClick(Sender: TObject);
    procedure Parcela_DescricaoExit(Sender: TObject);
    procedure BT_ProdutosClick(Sender: TObject);
    procedure BT_Adicionar_TransportadoraClick(Sender: TObject);
    procedure Porcentagem_DescontoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Cliente_VendedorKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_ComissaoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_VendedorChange(Sender: TObject);
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
  Pedidos02: TPedidos02;
  Qtde_Produtos_Selecionados: Integer;
  Clicou_Imprimir, Programa_Aberto: Boolean;

implementation

uses Conexao_BD, Rotinas_Gerais, Clientes_02, Clientes_00,
  Adiciona_Produto_Relacao, Adiciona_Qtde_Produto, Ibrasmak_00, Pedido_03,
  Pedidos_04, Pedidos_03, DB, Produtos_00, Transportadoras_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TPedidos02.Valida_Dados(): Boolean;

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
           //Erro          := 'Cliente Devedor, a OS não será efetuada.';
           //Campo_Retorno := 'Cliente_Codigo';
        End;
     End;

     If Trim(Cliente_Nome.Text) = '' Then
        Begin
        Erro          := 'Nenhum Cliente foi informado';
        Campo_Retorno := 'Cliente_Nome';
     End;

     If Trim(Parcela_Vlr_Ato.Text) = '' Then
        Begin
        Parcela_Vlr_Ato.Text := '0,00';
     End;

     If StrToFloat(Trim(Parcela_Vlr_Ato.Text)) > 0 Then
        Begin
        If (StrToFloat(Trim(Parcela_Vlr_Ato.Text)) >= StrToFloat(Trim(Valor_Total.Text))) Then
           Begin
           Erro          := 'O Valor do Ato tem que ser Menor que o Valor Total.';
           Campo_Retorno := 'Parcela_Vlr_Ato';
        End;
     End;

     //If (Trim(Parcela_Nro.Text) = '1') Or (Trim(Parcela_Nro.Text) = '01') Then
     //   Begin
     //   Erro          := 'A Parcela deve ser superiora a 1.';
     //   Campo_Retorno := 'Parcela_Nro';
     //End;

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
           //SGD_Produtos.SetFocus;
           End
        Else If Campo_Retorno = 'Parcela_Vlr_Ato' Then
           Begin
           Nota_Dados_Complementares.ActivePage := TabSheet2;
           Nota_Dados_Complementares.Refresh;

           //Parcela_Vlr_Ato.SetFocus;
           End
        Else If Campo_Retorno = 'Parcela_Nro' Then
           Begin
           Nota_Dados_Complementares.ActivePage := TabSheet2;
           Nota_Dados_Complementares.Refresh;

           //Parcela_Nro.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TPedidos02.Exibe_Grid_Produtos();

var
   Ind, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao, Comando_SQL: String;

begin
     Ampulheta();

     //*** Carrega as Demais Opções ***

     Natureza_Operacao.ItemIndex := StrToInt(Nro_Natureza_Operacao.Text);

     Carrega_Transportadoras();
     Carrega_Pgto_Frete();

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
         SGD_Produtos.Cells[8,Ind] := '';
         SGD_Produtos.Cells[9,Ind] := '';
         SGD_Produtos.Cells[10,Ind] := '';
         SGD_Produtos.Cells[11,Ind] := '';
         SGD_Produtos.Cells[12,Ind] := '';
         SGD_Produtos.Cells[13,Ind] := '';
         SGD_Produtos.Cells[14,Ind] := '';
         SGD_Produtos.Cells[15,Ind] := '';
     End;

     //*** Apaga os Pedidos de Transações Anteriores ***

     Comando_SQL := 'Delete From pedidos_transacoes Where pedido_transacao_nro_pedido IN (' + Trim(Nro_Pedido.Text) + ')';

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Continua o Carregamento Normal ***

     ConexaoBD.SQL_NF_FB_Pedidos_Produtos.Close;
     ConexaoBD.SQL_NF_FB_Pedidos_Produtos.SQL.Clear;
     ConexaoBD.SQL_NF_FB_Pedidos_Produtos.SQL.Add('Select * from pedidos_produtos Where pedido_produto_numero_pedido IN (' + Trim(Nro_Pedido.Text) + ') Order By pedido_produto_numero_pedido, pedido_produto_posicao');
     ConexaoBD.SQL_NF_FB_Pedidos_Produtos.Open;

     If ConexaoBD.SQL_NF_FB_Pedidos_Produtos.RecordCount > 0 Then
        Begin
        SGD_Produtos.RowCount  := 2;
        SGD_Produtos.Refresh;

        SGD_Produtos.RowCount  := (ConexaoBD.SQL_NF_FB_Pedidos_Produtos.RecordCount + 2);
        SGD_Produtos.FixedRows := 1;
        Ind := 0;

        ConexaoBD.SQL_NF_FB_Pedidos_Produtos.First;

        While Not ConexaoBD.SQL_NF_FB_Pedidos_Produtos.Eof Do
              Begin
              Ind := Ind + 1;

              SGD_Produtos.Cells[0,Ind] := ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_quantidade.Text;
              SGD_Produtos.Cells[2,Ind] := ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_codigo.Text;
              SGD_Produtos.Cells[3,Ind] := ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_referencia.Text;
              SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_descricao.Text;

              Comando_SQL :=  '';
              Comando_SQL := Comando_SQL +  'Select ';
              Comando_SQL := Comando_SQL +    'SUM(f_p.faturado_produto_quantidade) as faturado_produto_quantidade ';
              Comando_SQL := Comando_SQL +  'from faturados_produtos f_p, faturados fat ';
              Comando_SQL := Comando_SQL +  'Where ';
              Comando_SQL := Comando_SQL +    '(f_p.faturado_produto_codigo = ' +#39+ Trim(SGD_Produtos.Cells[2,Ind]) +#39+ ') And ';
              Comando_SQL := Comando_SQL +    '(fat.faturado_sequencia_pedidos LIKE ' +#39+'% '+ Trim(Nro_Pedido.Text) +',%'+#39+ ') And ';
              Comando_SQL := Comando_SQL +    '(fat.faturado_numero = f_p.faturado_produto_numero_faturado) ';
              Comando_SQL := Comando_SQL +  'Group By f_p.faturado_produto_codigo ';
              Comando_SQL := Comando_SQL +  'Order By fat.faturado_numero Desc';

              ConexaoBD.SQL_Comunitario.Close;
              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Comunitario.Open;

              SGD_Produtos.Cells[1,Ind] := '';
              if (ConexaoBD.SQL_Comunitario.RecordCount > 0) then begin
                    SGD_Produtos.Cells[1,Ind] := ConexaoBD.SQL_Comunitario.FieldByName('faturado_produto_quantidade').AsString;
              end;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_valor_unitario.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              SGD_Produtos.Cells[5,Ind] := Vlr_Exibicao;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_valor_total.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              SGD_Produtos.Cells[6,Ind] := Vlr_Exibicao;
              SGD_Produtos.Cells[7,Ind] := '0';

              SGD_Produtos.Cells[8,Ind] := ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_valor_ipi.Text;
              SGD_Produtos.Cells[9,Ind] := DBG_NF_FB_Pedido_Produto_Descricao_Detalhada.Text;
              SGD_Produtos.Cells[10,Ind] := ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_unidade.Text;

              SGD_Produtos.Cells[15,Ind] := ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_numero_pedido.Text;

              //*** Dados do Produto ***
              ConexaoBD.SQL_FB_Produtos.Close;
              ConexaoBD.SQL_FB_Produtos.SQL.Clear;
              ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = '+#39+ Trim(ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_codigo.Text) +#39+' Order By fb_produto_codigo, fb_produto_descricao');
              ConexaoBD.SQL_FB_Produtos.Open;

              If ConexaoBD.SQL_FB_Produtos.RecordCount > 0 Then
                 Begin
                 If Trim(ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_unidade.Text) = '' Then
                    Begin
                    SGD_Produtos.Cells[10,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_unidade.Text;
                 End;

                 If Trim(ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_unidade.Text) = '' Then
                    Begin
                    SGD_Produtos.Cells[10,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_unidade.Text;
                 End;


                 SGD_Produtos.Cells[11,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_desenho.Text;
                 SGD_Produtos.Cells[12,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_os.Text;
                 SGD_Produtos.Cells[13,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_equipamento.Text;
                 SGD_Produtos.Cells[14,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_material.Text;
              End;

              //*** Registra o Produto na Tabela de Transações de Pedidos ***

              Comando_SQL := 'Insert into pedidos_transacoes(';
              Comando_SQL := Comando_SQL + 'pedido_transacao_usuario,';
              Comando_SQL := Comando_SQL + 'pedido_transacao_empresa,';
              Comando_SQL := Comando_SQL + 'pedido_transacao_cod_produto,';
              Comando_SQL := Comando_SQL + 'pedido_transacao_cod_referencia,';
              Comando_SQL := Comando_SQL + 'pedido_transacao_qtde_produto,';
              Comando_SQL := Comando_SQL + 'pedido_transacao_tipo_movto,';
              Comando_SQL := Comando_SQL + 'pedido_transacao_nro_pedido)';
              Comando_SQL := Comando_SQL + ' Values(';
              Comando_SQL := Comando_SQL + #39 + Trim(Numero_HD('C')) + #39 + ',';
              Comando_SQL := Comando_SQL + #39 + 'LOJA' + #39 + ',';
              Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + ',';
              Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[3,Ind]) + #39 + ',';
              Comando_SQL := Comando_SQL + Virgula_Ponto(SGD_Produtos.Cells[0,Ind]) + ',';
              Comando_SQL := Comando_SQL + #39 + '-' + #39 + ',';
              Comando_SQL := Comando_SQL + #39 + Trim(Nro_Pedido_Unico.Text) + #39 + ')';

              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Comunitario.ExecSQL;

              ConexaoBD.SQL_NF_FB_Pedidos_Produtos.Next;
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

     SGD_Produtos.Cells[1,0]   := 'Qtde. Fat.';
     SGD_Produtos.ColWidths[1] := 60;

     //*** Código do Produto ***
     SGD_Produtos.Cells[2,0]   := 'Cód.Produto';
     SGD_Produtos.ColWidths[2] := 80;

     //*** Referência ***
     SGD_Produtos.Cells[3,0]   := 'Referência';
     SGD_Produtos.ColWidths[3] := 80;

     //*** Descrição do Produto ***
     SGD_Produtos.Cells[4,0]   := 'Descrição';
     SGD_Produtos.ColWidths[4] := 244;

     //*** Valor Unitário ***
     SGD_Produtos.Cells[5,0]   := 'Valor (R$)';
     SGD_Produtos.ColWidths[5] := 80;

     //*** Valor Total ***
     SGD_Produtos.Cells[6,0]   := 'Vlr.Total (R$)';
     SGD_Produtos.ColWidths[6] := 80;

     //*** Quantidade de Estoque Atual ***
     SGD_Produtos.Cells[7,0]   := 'Qtde Est.Atual';
     SGD_Produtos.ColWidths[7] := -1;

     //*** Porcentagem do IPI ***
     SGD_Produtos.Cells[8,0]   := 'Porcentagem do IPI';
     SGD_Produtos.ColWidths[8] := -1;

     //*** Descrição Detalhada ***
     SGD_Produtos.Cells[9,0]   := 'Descrição Detalhada';
     SGD_Produtos.ColWidths[9] := -1;

     //*** Unidade do Produto ***
     SGD_Produtos.Cells[10,0]   := 'Unidade do Produto';
     SGD_Produtos.ColWidths[10] := -1;

     //*** Desenho ***
     SGD_Produtos.Cells[11,0]   := 'Desenho';
     SGD_Produtos.ColWidths[11] := -1;

     //*** OS ***
     SGD_Produtos.Cells[12,0]   := 'OS';
     SGD_Produtos.ColWidths[12] := -1;

     //*** Equipamento ***
     SGD_Produtos.Cells[13,0]   := 'Equipamento';
     SGD_Produtos.ColWidths[13] := -1;

     //*** Material ***
     SGD_Produtos.Cells[14,0]   := 'Material';
     SGD_Produtos.ColWidths[14] := -1;

     //*** Número Pedido ***
     SGD_Produtos.Cells[15,0]   := 'Número Pedido';
     SGD_Produtos.ColWidths[15] := -1;

     Seta();
end;

procedure TPedidos02.Carrega_Transportadoras();
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

procedure TPedidos02.Carrega_Pgto_Frete();
begin
     Cliente_Pgto_Frete.Items.Clear;
     Cliente_Pgto_Frete.Items.Add('Cliente');
     Cliente_Pgto_Frete.Items.Add('Ibrasmak');

     Cliente_Pgto_Frete.ItemIndex := StrToInt(Nro_Pgto_Frete.Text);
end;

procedure TPedidos02.Totaliza_Pedido();

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

     If Trim(Porcentagem_Desconto.Text) = '' Then
        Begin
        Porc_Desconto_Nro := 0;
        End
     Else
        Begin
        Porc_Desconto_Str := Trim(Virgula_Ponto(Porcentagem_Desconto.Text));
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

         SGD_Produtos.Cells[6,Ind] := Vlr_Total_Str;

         //*** Calcula os Valores Totais ***

         Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

         Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
         Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
         Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

         Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

         //*** Calcula o Valor do IPI ***

         Vlr_IPI_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind]));
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

procedure TPedidos02.Volta_Valores_Estoque(Usuario_HD, Empresa, Produto, Quantidade: String);

var
   Comando_SQL: String;
   Produto_Qtde_Estoque, Total_Qtde_Estoque: Real;

begin
     {If Trim(Trim(Cliente_Tipo_Faturamento.Text)) = 'Nota Fiscal' Then
        Begin
        FB_Registra_Movto_Estoque('11',Trim(Nro_Pedido.Text),'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(Quantidade));
        End
     Else
        Begin
        FB_Registra_Movto_Estoque('12',Trim(Nro_Pedido.Text),'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(Quantidade));
     End;}
end;

procedure TPedidos02.Volta_Valores_Estoque_Sair(Usuario_HD, Empresa, Produto: String);

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
        {
        If Trim(Trim(Cliente_Tipo_Faturamento.Text)) = 'Nota Fiscal' Then
           Begin
           FB_Registra_Movto_Estoque('11',Nro_Pedido.Text,'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(FloatToStr(Produto_Qtde_Estoque)));
           End
        Else
           Begin
           FB_Registra_Movto_Estoque('12',Nro_Pedido.Text,'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(FloatToStr(Produto_Qtde_Estoque)));
        End;
        }
        //*** Retira o Valor Original do Estoque ***

        ConexaoBD.SQL_Pedidos_Transacoes.Close;
        ConexaoBD.SQL_Pedidos_Transacoes.SQL.Clear;
        ConexaoBD.SQL_Pedidos_Transacoes.SQL.Add('Select * from pedidos_transacoes Where pedido_transacao_usuario = ' + #39 + Usuario_HD + #39 + ' And pedido_transacao_empresa = ' + #39 + Empresa + #39 + ' And pedido_transacao_cod_produto = ' + #39 + Produto + #39 + ' And pedido_transacao_nro_pedido IN (' + Trim(Nro_Pedido.Text) + ')');
        ConexaoBD.SQL_Pedidos_Transacoes.Open;

        If conexaoBD.SQL_Pedidos_Transacoes.RecordCount > 0 Then
           Begin
           conexaoBD.SQL_Pedidos_Transacoes.First;
           {
           If Trim(Trim(Cliente_Tipo_Faturamento.Text)) = 'Nota Fiscal' Then
              Begin
              FB_Registra_Movto_Estoque('51',Trim(Nro_Pedido.Text),'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(conexaoBD.SQL_Pedidos_Transacoespedido_transacao_qtde_produto.Text));
              End
           Else
              Begin
              FB_Registra_Movto_Estoque('52',Trim(Nro_Pedido.Text),'0',Trim('LOJA'),Produto,'0',Virgula_Ponto(conexaoBD.SQL_Pedidos_Transacoespedido_transacao_qtde_produto.Text));
           End; }
        End;

        //*** Deleta a Transação Anterior do Estoque ***

        Comando_SQL := 'Delete From estoque_transacoes Where estoque_transacao_usuario = ' + #39 + Usuario_HD + #39 + ' And estoque_transacao_empresa = ' + #39 + Empresa + #39 + ' And estoque_transacao_cod_produto = ' + #39 + Produto + #39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
     End;
end;

procedure TPedidos02.BT_SairClick(Sender: TObject);
begin
     //*** Recarrega o Grid da Tela Anterior ***

     ConexaoBD.SQL_Pedidos.Close;
     ConexaoBD.SQL_Pedidos.SQL.Clear;
     ConexaoBD.SQL_Pedidos.SQL.Add('Select * from pedidos Where pedido_status <> '+#39+'Faturado'+#39+' Order By pedido_numero');
     ConexaoBD.SQL_Pedidos.Open;

     Pedidos02.Close;
end;

procedure TPedidos02.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';
     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';

     Programa_Aberto := False;
end;

procedure TPedidos02.FormShow(Sender: TObject);
var
    Ind: Integer;
    Qtde_Produto_Digitada: Boolean;
    Valor_Inteiro: String;
begin
    Programa_Aberto       := True;
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

    Totaliza_Pedido();
end;

procedure TPedidos02.BT_AlterarClick(Sender: TObject);

var
   Codigo_Cliente, Tipo_Codigo_Cliente, Tipo_Empresa_Cliente: String;

begin
     Pedidos02.Visible := False;

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

     Pedidos02.Visible := True;

     Totaliza_Pedido();
end;

procedure TPedidos02.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     If (Clientes00 = Nil) Then
        Begin
        Application.CreateForm(TClientes00,Clientes00);
     End;

     Seta();

     Clientes00.Programa_Anterior.Text := 'Pedido-Alteracao';
     Clientes00.Show;
     Clientes00.WindowState := wsNormal;

     Totaliza_Pedido();
end;

procedure TPedidos02.BT_AdicionarClick(Sender: TObject);
begin
     Ampulheta();

     SGD_Produtos.Refresh;

     Application.CreateForm(TAdicionaProdutoRelacao,AdicionaProdutoRelacao);

     AdicionaProdutoRelacao.Programa_Anterior.Text    := 'Pedido-Alteracao';

     Seta();
     AdicionaProdutoRelacao.ShowModal;
     AdicionaProdutoRelacao.Destroy;

     SGD_Produtos.Refresh;
end;

procedure TPedidos02.SGD_ProdutosDblClick(Sender: TObject);

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
           MSG_Erro('O número máximo de produtos para a emissão da Nota Fiscal'+Chr(13)+Chr(10)+'já foi atingido.'+Chr(13)+Chr(10)+Chr(13)+Chr(10)+'Para informar mais produtos é necessário fechar esta '+Chr(13)+Chr(10)+'OS e abrir outra.'+Chr(13)+Chr(10)+Chr(13)+Chr(10)+'Você pode continuar alterando os produtos já selecionados');
        End;
        End
     Else
        Begin
        Acessa_Qtde := True;
     End;

     If Acessa_Qtde = True Then
        Begin
        Application.CreateForm(TAdicionaQtdeProduto,AdicionaQtdeProduto);

        AdicionaQtdeProduto.Programa_Anterior.Text       := 'Pedido-Alteracao';
        AdicionaQtdeProduto.Adiciona_ACol.Text           := IntToStr(SGD_Produtos.Col);
        AdicionaQtdeProduto.Adiciona_ARow.Text           := IntToStr(SGD_Produtos.Row);
        AdicionaQtdeProduto.Adiciona_Codigo_Produto.Text := SGD_Produtos.Cells[2,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Referencia.Text     := SGD_Produtos.Cells[3,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Descricao.Text      := SGD_Produtos.Cells[4,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Valor_Unitario.Text := SGD_Produtos.Cells[5,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Quantidade.Text     := SGD_Produtos.Cells[0,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Quantidade_ANT.Text := SGD_Produtos.Cells[0,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_IPI.Text            := SGD_Produtos.Cells[8,SGD_Produtos.Row];

        AdicionaQtdeProduto.Adiciona_Nro_Ctrl_Estoque.Text := Trim(Nro_Pedido_Unico.Text);
        AdicionaQtdeProduto.Adiciona_Nro_Nota_Estoque.Text := '0';
        AdicionaQtdeProduto.Adiciona_Lote_Estoque.Text     := '0';
        AdicionaQtdeProduto.Adiciona_Tipo_Faturamento.Text := Trim(Cliente_Tipo_Faturamento.Text);

        AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Lines.Clear;
        AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Lines.Add(SGD_Produtos.Cells[9,SGD_Produtos.Row]);

        //*** Iníncio - Localiza a Unidade do Produto ***

        ConexaoBD.SQL_FB_Produtos.Close;
        ConexaoBD.SQL_FB_Produtos.SQL.Clear;
        ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = '+#39+ Trim(SGD_Produtos.Cells[2,SGD_Produtos.Row]) +#39);
        ConexaoBD.SQL_FB_Produtos.Open;

        If ConexaoBD.SQL_FB_Produtos.RecordCount > 0 Then
           Begin
           AdicionaQtdeProduto.Adiciona_Unidade.Text := ConexaoBD.SQL_FB_Produtosfb_produto_unidade.Text;
           AdicionaQtdeProduto.Adiciona_CF.Text      := ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text;
           AdicionaQtdeProduto.Adiciona_ST.Text      := ConexaoBD.SQL_FB_Produtosfb_produto_classif_tributaria.Text;

           AdicionaQtdeProduto.Adiciona_Desenho.Text     := ConexaoBD.SQL_FB_Produtosfb_produto_desenho.Text;
           AdicionaQtdeProduto.Adiciona_OS.Text          := ConexaoBD.SQL_FB_Produtosfb_produto_os.Text;
           AdicionaQtdeProduto.Adiciona_Equipamento.Text := ConexaoBD.SQL_FB_Produtosfb_produto_equipamento.Text;
           AdicionaQtdeProduto.Adiciona_Material.Text    := ConexaoBD.SQL_FB_Produtosfb_produto_material.Text;
        End;

        ConexaoBD.SQL_FB_Produtos.Close;

        //*** Fim - Localiza a Unidade do Produto ***

        If Trim(Registro_OS_Geral.Text) <> '' Then
           Begin
           AdicionaQtdeProduto.BT_Trocar.Visible := False;
           AdicionaQtdeProduto.BT_Adicionar.Visible  := False;     
        End;

        AdicionaQtdeProduto.ShowModal;
        AdicionaQtdeProduto.Destroy;

        Totaliza_Pedido();
        SGD_Produtos.Refresh;
     End;
end;

procedure TPedidos02.Cliente_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;

     Totaliza_Pedido();
end;

procedure TPedidos02.Cliente_DescontoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TPedidos02.SGD_ProdutosKeyPress(Sender: TObject; var Key: Char);

var
   Acessa_Qtde: Boolean;
   Ind: Integer;
   Busca_Codigo, Busca_Codigo_Letra, Letra: String;

begin
     If Key = #13 Then
        Begin
        If Qtde_Produtos_Selecionados >= 340 Then
           Begin
           If Trim(SGD_Produtos.Cells[0,SGD_Produtos.Row]) <> '' Then
              Begin
              Acessa_Qtde := True;
              End
           Else
              Begin
              Acessa_Qtde := False;
              MSG_Erro('O número máximo de produtos para a emissão da Nota Fiscal'+Chr(13)+Chr(10)+'já foi atingido.'+Chr(13)+Chr(10)+Chr(13)+Chr(10)+'Para informar mais produtos é necessário fechar esta '+Chr(13)+Chr(10)+'OS e abrir outra.'+Chr(13)+Chr(10)+Chr(13)+Chr(10)+'Você pode continuar alterando os produtos já selecionados');
           End;
           End
        Else
           Begin
           Acessa_Qtde := True;
        End;

        If Acessa_Qtde = True Then
           Begin
           Application.CreateForm(TAdicionaQtdeProduto,AdicionaQtdeProduto);

           AdicionaQtdeProduto.Programa_Anterior.Text       := 'Pedido-Alteracao';
           AdicionaQtdeProduto.Adiciona_ACol.Text           := IntToStr(SGD_Produtos.Col);
           AdicionaQtdeProduto.Adiciona_ARow.Text           := IntToStr(SGD_Produtos.Row);
           AdicionaQtdeProduto.Adiciona_Codigo_Produto.Text := SGD_Produtos.Cells[2,SGD_Produtos.Row];
           AdicionaQtdeProduto.Adiciona_Referencia.Text     := SGD_Produtos.Cells[3,SGD_Produtos.Row];
           AdicionaQtdeProduto.Adiciona_Descricao.Text      := SGD_Produtos.Cells[4,SGD_Produtos.Row];
           AdicionaQtdeProduto.Adiciona_Valor_Unitario.Text := SGD_Produtos.Cells[5,SGD_Produtos.Row];
           AdicionaQtdeProduto.Adiciona_Quantidade.Text     := SGD_Produtos.Cells[0,SGD_Produtos.Row];
           AdicionaQtdeProduto.Adiciona_Quantidade_ANT.Text := SGD_Produtos.Cells[0,SGD_Produtos.Row];

           AdicionaQtdeProduto.Adiciona_Nro_Ctrl_Estoque.Text := Trim(Nro_Pedido_Unico.Text);
           AdicionaQtdeProduto.Adiciona_Nro_Nota_Estoque.Text := '0';
           AdicionaQtdeProduto.Adiciona_Lote_Estoque.Text     := '0';
           AdicionaQtdeProduto.Adiciona_Tipo_Faturamento.Text := Trim(Cliente_Tipo_Faturamento.Text);

           AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Lines.Clear;
           AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Lines.Add(SGD_Produtos.Cells[8,SGD_Produtos.Row]);

           AdicionaQtdeProduto.Adiciona_Desenho.Text     := SGD_Produtos.Cells[11,SGD_Produtos.Row];
           AdicionaQtdeProduto.Adiciona_OS.Text          := SGD_Produtos.Cells[12,SGD_Produtos.Row];
           AdicionaQtdeProduto.Adiciona_Equipamento.Text := SGD_Produtos.Cells[13,SGD_Produtos.Row];
           AdicionaQtdeProduto.Adiciona_Material.Text    := SGD_Produtos.Cells[14,SGD_Produtos.Row];

           AdicionaQtdeProduto.ShowModal;
           AdicionaQtdeProduto.Destroy;

           Totaliza_Pedido();
           SGD_Produtos.Refresh;
        End;
     End;
end;

procedure TPedidos02.Cliente_Condicao_Pgto_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_Condicao_Pgto_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_Condicao_Pgto_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_Tipo_FaturamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_Emite_LoteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_Tipo_TransporteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_Pgto_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_TransportadoraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.BT_Alterar_PedidosClick(Sender: TObject);

var
   Comando_SQL, Emite_Lote, Transportadora, Valor_Inteiro, DT_Entrega: String;
   Vlr_Frete, Vlr_IPI, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4: String;
   Ind: Integer;
   Quantidade: Real;

   Financiamento_BNDS_Str, Financiamento_Proger_Str, Financiamento_Leasing_Str, Financiamento_Ibrasmak_Str,
   Pagamento_Vista_Str, Pagamento_Parcelado_Str, Pagamento_Combinado_Str, Parcela_Mes_Subsequente_Str, OPC_Fabrica_Str,
   OPC_Faturamento_Str, OPC_Nao_Imprimir_Str, Parcela_Nro_Str, Parcela_Vencto_Str, Parcela_Dias_Vencto_Str,
   Parcela_Porcentagem_Ato_Str, Parcela_Vlr_Ato_Str, Parcela_Prazo_Inicio_Str, Parcela_Pedido_Str, Parcela_Faturamento_Str: String;

   Cliente_Peso_Str, Cliente_Volume_Str: String;

begin
     If Valida_Dados() Then
        Begin

        Ampulheta();

        //*** Obtem os Valores ***

        DT_Entrega        := Trim(Data_Entrega.Text);
        Vlr_IPI           := Trim(Virgula_Ponto(Valor_IPI.Text));

        Vlr_Frete         := Trim(Virgula_Ponto(Valor_Frete.Text));
        Vlr_Desconto      := Trim(Virgula_Ponto(Valor_Desconto.Text));
        Vlr_Pedido        := Trim(Virgula_Ponto(Valor_Pedido.Text));
        Vlr_Total         := Trim(Virgula_Ponto(Valor_Total.Text));
        Desconto          := Trim(Virgula_Ponto(Porcentagem_Desconto.Text));
        //Cond_Pgto_1     := Trim(Cliente_Condicao_Pgto_1.Text);
        //Cond_Pgto_2     := Trim(Cliente_Condicao_Pgto_2.Text);
        //Cond_Pgto_3     := Trim(Cliente_Condicao_Pgto_3.Text);
        //Cond_Pgto_4     := Trim(Cliente_Condicao_Pgto_4.Text);

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

        If Cliente_Emite_Lote.Text = 'Sim' Then
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

        If Financiamento_BNDS.Checked Then
           Begin
           Financiamento_BNDS_Str := 'S';
           End
        Else
           Begin
           Financiamento_BNDS_Str := 'N';
        End;

        // Proger

        If Financiamento_Proger.Checked Then
           Begin
           Financiamento_Proger_Str := 'S';
           End
        Else
           Begin
           Financiamento_Proger_Str := 'N';
        End;

        // Leasing

        If Financiamento_Leasing.Checked Then
           Begin
           Financiamento_Leasing_Str := 'S';
           End
        Else
           Begin
           Financiamento_Leasing_Str := 'N';
        End;

        // Ibrasmak

        If Financiamento_Ibrasmak.Checked Then
           Begin
           Financiamento_Ibrasmak_Str := 'S';
           End
        Else
           Begin
           Financiamento_Ibrasmak_Str := 'N';
        End;

        // Pagamento
        // Vista

        If Pagamento_Vista.Checked Then
           Begin
           Pagamento_Vista_Str := 'S';
           End
        Else
           Begin
           Pagamento_Vista_Str := 'N';
        End;

        // Parcelado

        If Pagamento_Parcelado.Checked Then
           Begin
           Pagamento_Parcelado_Str := 'S';
           End
        Else
           Begin
           Pagamento_Parcelado_Str := 'N';
        End;

        // Combinado

        If Pagamento_Combinar.Checked Then
           Begin
           Pagamento_Combinado_Str := 'S';
           End
        Else
           Begin
           Pagamento_Combinado_Str := 'N';
        End;

        // Parcelas
        // Mês Subsequente

        If Parcela_Mes_Subsequente.Checked Then
           Begin
           Parcela_Mes_Subsequente_Str := 'S';
           End
        Else
           Begin
           Parcela_Mes_Subsequente_Str := 'N';
        End;

        // Opções
        // Fabrica

        If OPC_Fabrica.Checked Then
           Begin
           OPC_Fabrica_Str := 'S';
           End
        Else
           Begin
           OPC_Fabrica_Str := 'N';
        End;

        // Faturamento

        If OPC_Faturamento.Checked Then
           Begin
           OPC_Faturamento_Str := 'S';
           End
        Else
           Begin
           OPC_Faturamento_Str := 'N';
        End;

        // Não Imprimir

        If OPC_Nao_Imprimir.Checked Then
           Begin
           OPC_Nao_Imprimir_Str := 'S';
           End
        Else
           Begin
           OPC_Nao_Imprimir_Str := 'N';
        End;

        // Opção de Parcelas

        If Parcela_Pedido.Checked Then
           Begin
           Parcela_Pedido_Str := 'S';
           End
        Else
           Begin
           Parcela_Pedido_Str := 'N';
        End;

        If Parcela_Faturamento.Checked Then
           Begin
           Parcela_Faturamento_Str := 'S';
           End
        Else
           Begin
           Parcela_Faturamento_Str := 'N';
        End;

        //*** Porcentagem de Comissão ***

        If Trim(Cliente_Comissao.Text) = '' Then
           Begin
           Cliente_Comissao.Text := '0';
        End;

        // Parcelas - Valores

        Parcela_Nro_Str             := Trim(Virgula_Ponto(Parcela_Nro.Text));
        Parcela_Vencto_Str          := Trim(Virgula_Ponto(Parcela_Vencto.Text));
        Parcela_Dias_Vencto_Str     := Trim(Virgula_Ponto(Parcela_Dias_Vencto.Text));
        Parcela_Porcentagem_Ato_Str := Trim(Virgula_Ponto(Parcela_Porcentagem_Ato.Text));
        Parcela_Vlr_Ato_Str         := Trim(Virgula_Ponto(Parcela_Vlr_Ato.Text));
        Parcela_Prazo_Inicio_Str    := Trim(Virgula_Ponto(Parcela_Prazo_Inicio.Text));

        Cliente_Peso_Str            := Trim(Virgula_Ponto(Cliente_Peso.Text));
        Cliente_Volume_Str          := Trim(Virgula_Ponto(Cliente_Volume.Text));

        //*** Obtem o Nro da Transportadora ***
        Transportadora          := Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text);
        Nro_Transportadora.Text := IntToStr(Obtem_Nro_Transportadora(Transportadora));

        //*** Altera o Pedido Principal ***
        Comando_SQL := 'Update pedidos set ';
        Comando_SQL := Comando_SQL + 'pedido_registro_usuario = ' + #39 + Trim(Numero_HD('C')) + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_empresa = ' + #39 + Trim(Pedido_Empresa.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_codigo_tipo = ' + #39 + Trim(Cliente_Codigo_Tipo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_codigo = ' + #39 + Trim(Cliente_Codigo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_nome = ' + #39 + Trim(Cliente_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_desconto = ' + Desconto + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_condicao_pgto_1 = ' + Cond_Pgto_1 + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_condicao_pgto_2 = ' + Cond_Pgto_2 + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_condicao_pgto_3 = ' + Cond_Pgto_3 + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_condicao_pgto_4 = ' + Cond_Pgto_4 + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_tipo_faturamento = ' + #39 + Cliente_Tipo_Faturamento.Text + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_emite_lote = ' + #39 + Emite_Lote + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_tipo_transporte = ' + #39 + Cliente_Tipo_Transporte.Text + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_transportadora = ' + Transportadora + ',';
        Comando_SQL := Comando_SQL + 'pedido_valor_desconto = ' + Vlr_Desconto + ',';
        Comando_SQL := Comando_SQL + 'pedido_valor_pedido = ' + Vlr_Pedido + ',';
        Comando_SQL := Comando_SQL + 'pedido_valor_total = ' + Vlr_Total + ',';
        Comando_SQL := Comando_SQL + 'pedido_valor_ipi = ' + Vlr_IPI + ',';

        If ((Trim(Pedido_Data_Inclusao.Text) <> '00/00/0000') And (Trim(Pedido_Data_Inclusao.Text) <> '/  /'))  Then
           Begin
           Comando_SQL:=Comando_SQL+ 'pedido_data = ' + #39 + Inverte_Data_Plus(Trim(Pedido_Data_Inclusao.Text),'amd','/') + #39 + ',';
        End;

        If Trim(DT_Entrega) <> '00/00/0000' Then
           Begin
           Comando_SQL:=Comando_SQL+ 'pedido_data_entrega = ' + #39 + Inverte_Data_Plus(Trim(DT_Entrega),'amd','/') + #39 + ',';
        End;

        Comando_SQL := Comando_SQL + 'pedido_cliente_pgto_frete = ' + #39 + Cliente_Pgto_Frete.Text + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_natureza_operacao = ' + #39 + Trim(Natureza_Operacao.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_valor_frete = ' + Vlr_Frete + ',';
        Comando_SQL := Comando_SQL + 'pedido_cliente_observacao = ' + #39 + Cliente_Observacao.Text + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_nota_observacao = ' + #39 + Observacao_Nota.Text + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_status = ' + #39 + Trim(Status_Pedido.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'pedido_ordem_compra = ' + #39 + Trim(Cliente_Ordem_Compra.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_financiamento_bnds = ' + #39 + Trim(Financiamento_BNDS_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_financiamento_proger = ' + #39 + Trim(Financiamento_Proger_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_financiamento_leasing = ' + #39 + Trim(Financiamento_Leasing_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_financiamento_ibrasmak = ' + #39 + Trim(Financiamento_Ibrasmak_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_pagamento_vista = ' + #39 + Trim(Pagamento_Vista_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_pagamento_parcelado = ' + #39 + Trim(Pagamento_Parcelado_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_pagamento_combinar = ' + #39 + Trim(Pagamento_Combinado_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_parcela_nro = ' + #39 + Trim(Parcela_Nro_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_parcela_vencto = ' + #39 + Trim(Parcela_Vencto_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_parcela_dias_vencto = ' + #39 + Trim(Parcela_Dias_Vencto_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_parcela_mes_subsequente = ' + #39 + Trim(Parcela_Mes_Subsequente_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_parcela_porcentagem_ato = ' + #39 + Trim(Parcela_Porcentagem_Ato_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_parcela_vlr_ato = ' + #39 + Trim(Parcela_Vlr_Ato_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_parcela_prazo_inicio =  ' + #39 + Trim(Parcela_Prazo_Inicio_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_observacao_fabrica = ' + #39 + Trim(Observacao_Fabrica.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_opc_fabrica = ' + #39 + Trim(OPC_Fabrica_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_opc_faturamento = ' + #39 + Trim(OPC_Faturamento_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_opc_nao_imprimir =  ' + #39 + Trim(OPC_Nao_Imprimir_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_alimentacao =  ' + #39 + Trim(Cliente_Alimentacao.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_peso =  ' + #39 + Trim(Cliente_Peso_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_volume =  ' + #39 + Trim(Cliente_Volume_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_solicitado =  ' + #39 + Trim(Cliente_Solicitado.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_parcela_pedido =  ' + #39 + Trim(Parcela_Pedido_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_parcela_faturamento =  ' + #39 + Trim(Parcela_Faturamento_Str) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_observacao_fatura =  ' + #39 + Trim(Observacao_Faturamento.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_parcela_descricao =  ' + #39 + Trim(Parcela_Descricao.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_vendedor_numero =  ' + Obtem_Nro_Antes_Traco(Cliente_Vendedor.Text) + ', ';
        Comando_SQL := Comando_SQL + 'pedido_vendedor_nome =  ' + #39 + Obtem_Depois_Traco(Cliente_Vendedor.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'pedido_vendedor_porcentagem =  ' + #39 + Virgula_Ponto(Cliente_Comissao.Text) + #39 + ' ';
        Comando_SQL := Comando_SQL + ' where pedido_numero IN (' + Trim(Nro_Pedido.Text) + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Apaga os Produtos Já Inclusos ***

        Comando_SQL := 'Delete from pedidos_produtos';
        Comando_SQL := Comando_SQL + ' Where pedido_produto_numero_pedido IN (' + Trim(Nro_Pedido.Text) + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Insere os Produtos do Pedido Principal ***

        For Ind := 1 To SGD_Produtos.RowCount Do
            Begin

            Valor_Inteiro := Trim(SGD_Produtos.Cells[0,Ind]);

            If Trim(Valor_Inteiro) = '' Then
               Begin
               Valor_Inteiro := '0';
            End;

            If ((Trim(SGD_Produtos.Cells[0,Ind]) <> '') And (Trim(SGD_Produtos.Cells[0,Ind]) <> '0') And (Trim(SGD_Produtos.Cells[0,Ind]) <> '0,000'))  Then
               Begin
               Comando_SQL := 'Insert into pedidos_produtos(';
               Comando_SQL := Comando_SQL + 'pedido_produto_numero_pedido,';
               Comando_SQL := Comando_SQL + 'pedido_produto_quantidade,';
               Comando_SQL := Comando_SQL + 'pedido_produto_codigo,';
               Comando_SQL := Comando_SQL + 'pedido_produto_referencia,';
               Comando_SQL := Comando_SQL + 'pedido_produto_descricao,';
               Comando_SQL := Comando_SQL + 'pedido_produto_valor_unitario,';
               Comando_SQL := Comando_SQL + 'pedido_produto_valor_total,';
               Comando_SQL := Comando_SQL + 'pedido_produto_valor_ipi,';
               Comando_SQL := Comando_SQL + 'pedido_produto_posicao,';
               Comando_SQL := Comando_SQL + 'pedido_produto_descricao_detalhada,';
               Comando_SQL := Comando_SQL + 'pedido_produto_unidade)';
               Comando_SQL := Comando_SQL + ' Values(';

               If Trim(SGD_Produtos.Cells[15,Ind]) <> '' Then
                  Begin
                  Comando_SQL := Comando_SQL + Trim(SGD_Produtos.Cells[15,Ind]) + ',';
                  End
               Else
                  Begin
                  Comando_SQL := Comando_SQL + Trim(Nro_Pedido_Unico.Text) + ',';
               End;

               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[0,Ind])) + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[3,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[4,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[5,Ind])) + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[6,Ind])) + ',';

               If Trim(Cliente_Suframa.Caption) <> '' Then
                  Begin
                  Comando_SQL := Comando_SQL + '0,';
                  End
               Else
                  Begin
                  Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind])) + ',';
               End;

               Comando_SQL := Comando_SQL + Trim(IntToStr(Ind)) + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[9,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[10,Ind]) + #39 + ')';

            //   End
            //Else
            //   Begin
            //   Comando_SQL := 'Delete from pedidos_produtos';
            //   Comando_SQL := Comando_SQL + ' Where (pedido_produto_numero_pedido = ' + Trim(Nro_Pedido.Text) + ') And (pedido_produto_codigo = '+#39+ Trim(SGD_Produtos.Cells[1,Ind]) +#39+')';
            //End;

            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            End;
        End;

        Exibe_Grid_Produtos();

        //*** Incluir Observações no Cliente ***

        If Trim(Cliente_Observacao.Text) <> '' Then
           Begin
           Comando_SQL := 'Update fb_clientes Set ';
           Comando_SQL := Comando_SQL + 'fb_cliente_observacoes = ';
           Comando_SQL := Comando_SQL + #39 + Cliente_Observacao.Text + #39 + ' Where fb_cliente_codigo = ' + #39 + Trim(Cliente_Codigo.Text) + #39;

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;
        End;

        //*** Mensagem de Pedido Efetuado ***

        Seta();

        If Not Clicou_Imprimir Then
           Begin
           MSG_Erro('Alteração Efetuada...');

           //Pedidos02.Close;
        End;

        Clicou_Imprimir := False;

     End;
end;

procedure TPedidos02.BT_ExcluirClick(Sender: TObject);

var
   Ind: Integer;
   Comando_SQL, Produto: String;
   Produto_Qtde_Estoque, Total_Qtde_Estoque: Integer;
   Quantidade : Real;

begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        //*** Deleta o Pedido Principal ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from pedidos Where pedido_numero IN (' +  Trim(Nro_Pedido.Text) + ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Registra o Movimento de Estoque ***

        ConexaoBD.SQL_NF_FB_Pedidos_Produtos.Close;
        ConexaoBD.SQL_NF_FB_Pedidos_Produtos.SQL.Clear;
        ConexaoBD.SQL_NF_FB_Pedidos_Produtos.SQL.Add('Select * from pedidos_produtos Where pedido_produto_numero_pedido IN (' + Trim(Nro_Pedido.Text) + ') Order By pedido_produto_numero_pedido, pedido_produto_posicao');
        ConexaoBD.SQL_NF_FB_Pedidos_Produtos.Open;

        If ConexaoBD.SQL_NF_FB_Pedidos_Produtos.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_NF_FB_Pedidos_Produtos.First;

           While Not ConexaoBD.SQL_NF_FB_Pedidos_Produtos.Eof Do
                 Begin
                 //FB_Registra_Movto_Estoque('42',Trim(Nro_Pedido.Text),'0','',Trim(ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_codigo.Text),'0',Virgula_Ponto(Trim(ConexaoBD.SQL_NF_FB_Pedidos_Produtospedido_produto_quantidade.Text)) );

                 ConexaoBD.SQL_NF_FB_Pedidos_Produtos.Next;
           End;
        End;

        //*** Deleta os Itens do Pedido Principal ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from pedidos_produtos Where pedido_produto_numero_pedido IN (' +  Trim(Nro_Pedido.Text) + ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Pedidos02.Close;
     End;
end;

procedure TPedidos02.Observacao_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Valor_FreteExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TPedidos02.Valor_FreteKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_Tipo_TabelaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Forma_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Natureza_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.BT_ImprimirClick(Sender: TObject);

var
   Comando_SQL: String;
   Ind, Linha: Integer;

begin
        Clicou_Imprimir := True;

        BT_Alterar_Pedidos.Click;

        //*** Imprime a Ordem de Serviços de acordo com a Opção Escolhida ***

        Seta();

        If OPC_Nao_Imprimir.Checked Then
           Begin

           MSG_Erro('Por favor, selecione uma das opções de Impressão.');

           End
        Else If OPC_Faturamento.Checked Then
           Begin

           Application.CreateForm(TPedidos03,Pedidos03);

           Pedidos03.lblTitulo.Caption    := 'ORDEM DE SERVIÇO - Faturamento';

           Pedidos03.lblNro_OS.Caption    := Trim(Nro_Pedido.Text);
           Pedidos03.lblData_OS.Caption   := Pedido_Data_Inclusao.Text;

           Pedidos03.QRLabel14.Caption    := Pedido_Empresa.Text;

           Pedidos03.lblCNPJ.Caption      := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo.Text;
           Pedidos03.lblIE.Caption        := ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_estadual.Text;
           Pedidos03.lblCliente.Caption   := ConexaoBD.SQL_FB_Clientesfb_cliente_razao_social.Text;
           Pedidos03.lblEndereco.Caption  := Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_endereco.Text) + ' ' + Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_complemento.Text);
           Pedidos03.lblCidade.Caption    := ConexaoBD.SQL_FB_Clientesfb_cliente_cidade.Text;
           Pedidos03.lblBairro.Caption    := ConexaoBD.SQL_FB_Clientesfb_cliente_bairro.Text;
           Pedidos03.lblEstado.Caption    := ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text;
           Pedidos03.lblCEP.Caption       := ConexaoBD.SQL_FB_Clientesfb_cliente_cep.Text;
           Pedidos03.lblFone.Caption      := Cliente_Fone_Comercial.Text;
           Pedidos03.lblFax.Caption       := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_fax.Text;
           Pedidos03.lblContato.Caption   := Cliente_Contato.Text;

           ConexaoBD.SQL_Transportadoras.Close;
           ConexaoBD.SQL_Transportadoras.SQL.Clear;
           ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_numero = '+Trim(Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text))+' Order By fb_transportadora_nome');
           ConexaoBD.SQL_Transportadoras.Open;

           Pedidos03.lblTransportadora.Caption     := ConexaoBD.SQL_Transportadorasfb_transportadora_razao_social.Text;
           Pedidos03.lblTransportadoraFone.Caption := Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_ddd.Text) + ' ' + Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_fone.Text);

           ConexaoBD.SQL_Transportadoras.Close;

           Pedidos03.lblPrazo.Caption     := Data_Entrega.Text;

           If Pagamento_Vista.Checked Then
              Begin
              Pedidos03.lblPagamento.Caption := 'À Vista';
              End
           Else If Pagamento_Parcelado.Checked Then
              Begin
              Pedidos03.lblPagamento.Caption := 'Parcelado';
              End
           Else If Pagamento_Combinar.Checked Then
              Begin
              Pedidos03.lblPagamento.Caption := 'À Combinar';
           End;

           Pedidos03.lblFinanciamento.Caption := '';
           If Financiamento_BNDS.Checked Then
               Pedidos03.lblFinanciamento.Caption := Pedidos03.lblFinanciamento.Caption + 'BNDS ';

           If Financiamento_Proger.Checked Then
               Pedidos03.lblFinanciamento.Caption := Pedidos03.lblFinanciamento.Caption + 'Proger ';

           If Financiamento_Leasing.Checked Then
               Pedidos03.lblFinanciamento.Caption := Pedidos03.lblFinanciamento.Caption + 'Leasing ';

           If Financiamento_Ibrasmak.Checked Then
               Pedidos03.lblFinanciamento.Caption := Pedidos03.lblFinanciamento.Caption + 'Ibrasmak ';

           Pedidos03.Parcela_Nro.Caption := Parcela_Nro.Text;
           Pedidos03.Parcela_Vencto.Caption := Parcela_Vencto.Text;
           Pedidos03.Parcela_Vencto2.Caption := Parcela_Descricao.Text;
           Pedidos03.Parcela_Dias_Vencto.Caption := Parcela_Dias_Vencto.Text;

           If Parcela_Pedido.Checked Then
             Pedidos03.Parcela_Pedido.Caption := '(X) Pedido'
           else
             Pedidos03.Parcela_Pedido.Caption := '() Pedido';

           If Parcela_Faturamento.Checked Then
             Pedidos03.Parcela_Faturamento.Caption := '(X) Faturamento'
           else
             Pedidos03.Parcela_Faturamento.Caption := '() Faturamento';

           If Parcela_Mes_Subsequente.Checked Then
             Pedidos03.Parcela_Mes_Subsequente.Caption := '(X) Mês Subsequente'
           else
             Pedidos03.Parcela_Mes_Subsequente.Caption := '() Mês Subsequente';

           Pedidos03.Parcela_Porcentagem_Ato.Caption := Parcela_Porcentagem_Ato.Text;
           Pedidos03.Parcela_Vlr_Ato.Caption := Parcela_Vlr_Ato.Text;
           Pedidos03.Parcela_Prazo_Inicio.Caption := Parcela_Prazo_Inicio.Text;


           Pedidos03.lblObservacoes.Lines.Clear;
           Pedidos03.lblObservacoes.Lines.Add(Observacao_Faturamento.Text);

           Pedidos03.lblOrdem_Compra_Cliente.Caption := Cliente_Ordem_Compra.Text;           

           Pedidos03.lblSolicitado.Caption  := Cliente_Solicitado.Text;
           Pedidos03.lblAlimentacao.Caption := Cliente_Alimentacao.Text;

           Pedidos03.QRLabel33.Caption   := ' ';
           Pedidos03.Parcela_Nro.Caption := ' ';
           Pedidos03.Parcela_Dias_Vencto.Caption := ' ';

           Pedidos03.lblVendedor.Caption := Trim(Cliente_Vendedor.Text);
           Pedidos03.lblComissao.Caption := Trim(Cliente_Comissao.Text);

           Pedidos03.QR_Ordem_Servico.Preview;
           Pedidos03.QR_Ordem_Servico.Destroy;
           Pedidos03.Destroy;

           End
        Else If OPC_Fabrica.Checked Then
           Begin

           Application.CreateForm(TPedidos03,Pedidos03);

           Pedidos03.lblTitulo.Caption    := 'ORDEM DE SERVIÇO - Fabrica';

           Pedidos03.lblNro_OS.Caption    := Trim(Nro_Pedido.Text);
           Pedidos03.lblData_OS.Caption   := Pedido_Data_Inclusao.Text;

           Pedidos03.QRLabel14.Caption    := Pedido_Empresa.Text;

           Pedidos03.lblCNPJ.Caption      := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo.Text;
           Pedidos03.lblIE.Caption        := ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_estadual.Text;
           Pedidos03.lblCliente.Caption   := ConexaoBD.SQL_FB_Clientesfb_cliente_razao_social.Text;
           Pedidos03.lblEndereco.Caption  := Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_endereco.Text) + ' ' + Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_complemento.Text);
           Pedidos03.lblCidade.Caption    := ConexaoBD.SQL_FB_Clientesfb_cliente_cidade.Text;
           Pedidos03.lblBairro.Caption    := ConexaoBD.SQL_FB_Clientesfb_cliente_bairro.Text;
           Pedidos03.lblEstado.Caption    := ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text;
           Pedidos03.lblCEP.Caption       := ConexaoBD.SQL_FB_Clientesfb_cliente_cep.Text;
           Pedidos03.lblFone.Caption      := Cliente_Fone_Comercial.Text;
           Pedidos03.lblFax.Caption       := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_fax.Text;
           Pedidos03.lblContato.Caption   := Cliente_Contato.Text;

           ConexaoBD.SQL_Transportadoras.Close;
           ConexaoBD.SQL_Transportadoras.SQL.Clear;
           ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_numero = '+Trim(Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text))+' Order By fb_transportadora_nome');
           ConexaoBD.SQL_Transportadoras.Open;

           Pedidos03.lblTransportadora.Caption     := ConexaoBD.SQL_Transportadorasfb_transportadora_razao_social.Text;
           Pedidos03.lblTransportadoraFone.Caption := Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_ddd.Text) + ' ' + Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_fone.Text);

           ConexaoBD.SQL_Transportadoras.Close;

           Pedidos03.lblPrazo.Caption     := Data_Entrega.Text;

           Pedidos03.lblPagamentoTitulo.Caption := ' ';
           Pedidos03.lblPagamento.Caption       := ' ';


           Pedidos03.lblFinanciamento.Caption := '-';
           Pedidos03.Parcela_Nro.Caption := '-';
           Pedidos03.Parcela_Vencto.Caption := '-';
           Pedidos03.Parcela_Vencto2.Caption := '-';
           Pedidos03.Parcela_Dias_Vencto.Caption := '-';

           Pedidos03.Parcela_Pedido.Caption := '-';
           Pedidos03.Parcela_Faturamento.Caption := '-';
           Pedidos03.Parcela_Mes_Subsequente.Caption := '-';

           Pedidos03.Parcela_Porcentagem_Ato.Caption := '-';
           Pedidos03.Parcela_Vlr_Ato.Caption := '-';
           Pedidos03.Parcela_Prazo_Inicio.Caption := '-';


           Pedidos03.lblObservacoes.Lines.Clear;
           Pedidos03.lblObservacoes.Lines.Add(Observacao_Fabrica.Text);

           Pedidos03.lblOrdem_Compra_Cliente.Caption := Cliente_Ordem_Compra.Text;           

           Pedidos03.lblSolicitado.Caption  := Cliente_Solicitado.Text;
           Pedidos03.lblAlimentacao.Caption := Cliente_Alimentacao.Text;

           Pedidos03.Exp_Unitario.Expression := 'IF(1=1,'+#39+#39+','+#39+#39+')';
           Pedidos03.Exp_Total.Expression    := 'IF(1=1,'+#39+#39+','+#39+#39+')';

           Pedidos03.Exp_Unitario_Total.Expression := 'IF(1=1,'+#39+#39+','+#39+#39+')';
           Pedidos03.Exp_Total_Total.Expression    := 'IF(1=1,'+#39+#39+','+#39+#39+')';

           Pedidos03.lblVlrTotalTitulo.Caption    := ' ';
           Pedidos03.lblVlrUnitarioTitulo.Caption := ' ';
           Pedidos03.lblTotal.Caption             := ' ';

           Pedidos03.QRLabel33.Caption   := ' ';
           Pedidos03.Parcela_Nro.Caption := ' ';
           Pedidos03.Parcela_Dias_Vencto.Caption := ' ';

           Pedidos03.QRLabel4.Caption    := ' ';
           Pedidos03.QRLabel30.Caption   := ' ';
           Pedidos03.lblVendedor.Caption := ' ';
           Pedidos03.lblComissao.Caption := ' ';
           
           Pedidos03.QR_Ordem_Servico.Preview;
           Pedidos03.QR_Ordem_Servico.Destroy;
           Pedidos03.Destroy;

           End
        Else
           Begin
           MSG_Erro('Por favor, selecione uma das opções de Impressão.');
        End;

end;

procedure TPedidos02.BT_FaturamentoClick(Sender: TObject);

var
   Ind, Erro: Integer;
   Com_Qtde_Produto: Boolean;
   Qtde_Fat, Comando_SQL, Qtde_Str_1, Qtde_Str_2: string;
   Qtde_Nro_1, Qtde_Nro_2: Real;

begin
     Ampulheta();

     Clicou_Imprimir := True;

     BT_Alterar_Pedidos.Click;

     Application.CreateForm(TPedidos04,Pedidos04);

     //*** Carrega o Grid de Podutos para Faturamento ***

     //*** Preparação do StringGrid ***

     Pedidos04.SGD_Produtos.RowCount := SGD_Produtos.RowCount;

     //*** Quantidade ***
     Pedidos04.SGD_Produtos.Cells[0,0]   := 'Quantidade';
     Pedidos04.SGD_Produtos.ColWidths[0] := 60;

     //*** Quantidade Faturada ***
     Pedidos04.SGD_Produtos.Cells[1,0]   := 'Qtde. Fat.';
     Pedidos04.SGD_Produtos.ColWidths[1] := 60;

     //*** Código do Produto ***
     Pedidos04.SGD_Produtos.Cells[2,0]   := 'Cód.Produto';
     Pedidos04.SGD_Produtos.ColWidths[2] := 80;

     //*** Referência ***
     Pedidos04.SGD_Produtos.Cells[3,0]   := 'Referência';
     Pedidos04.SGD_Produtos.ColWidths[3] := 80;

     //*** Descrição do Produto ***
     Pedidos04.SGD_Produtos.Cells[4,0]   := 'Descrição';
     Pedidos04.SGD_Produtos.ColWidths[4] := 350;

     //*** Valor Unitário ***
     Pedidos04.SGD_Produtos.Cells[5,0]   := 'Valor (R$)';
     Pedidos04.SGD_Produtos.ColWidths[5] := 80;

     //*** Valor Total ***
     Pedidos04.SGD_Produtos.Cells[6,0]   := 'Vlr.Total (R$)';
     Pedidos04.SGD_Produtos.ColWidths[6] := -1;

     //*** Quantidade de Estoque Atual ***
     Pedidos04.SGD_Produtos.Cells[7,0]   := 'Qtde Est.Atual';
     Pedidos04.SGD_Produtos.ColWidths[7] := -1;

     //*** Porcentage do IPI ***
     Pedidos04.SGD_Produtos.Cells[8,0]   := 'Porcentagem do IPI';
     Pedidos04.SGD_Produtos.ColWidths[8] := -1;

     //*** Descrição Detalhada ***
     Pedidos04.SGD_Produtos.Cells[9,0]   := 'Descrição Detalhada';
     Pedidos04.SGD_Produtos.ColWidths[9] := -1;

     //*** Unidade do Produto ***
     Pedidos04.SGD_Produtos.Cells[10,0]   := 'Unidade do Produto';
     Pedidos04.SGD_Produtos.ColWidths[10] := -1;

     //*** Classificação Fiscal ***
     Pedidos04.SGD_Produtos.Cells[11,0]   := 'CF';
     Pedidos04.SGD_Produtos.ColWidths[11] := -1;

     //*** Situação Tributária ***
     Pedidos04.SGD_Produtos.Cells[12,0]   := 'ST';
     Pedidos04.SGD_Produtos.ColWidths[12] := -1;

     For Ind := 1 To SGD_Produtos.RowCount Do Begin
        Comando_SQL :=  '';
        Comando_SQL := Comando_SQL +  'Select ';
        Comando_SQL := Comando_SQL +    'SUM(f_p.faturado_produto_quantidade) as faturado_produto_quantidade ';
        Comando_SQL := Comando_SQL +  'from faturados_produtos f_p, faturados fat ';
        Comando_SQL := Comando_SQL +  'Where ';
        Comando_SQL := Comando_SQL +    '(f_p.faturado_produto_codigo = ' +#39+ Trim(SGD_Produtos.Cells[2,Ind]) +#39+ ') And ';
        Comando_SQL := Comando_SQL +    '(fat.faturado_sequencia_pedidos LIKE ' +#39+'% '+ Trim(Nro_Pedido.Text) +',%'+#39+ ') And ';
        Comando_SQL := Comando_SQL +    '(fat.faturado_numero = f_p.faturado_produto_numero_faturado) ';
        Comando_SQL := Comando_SQL +  'Group By f_p.faturado_produto_codigo ';
        Comando_SQL := Comando_SQL +  'Order By fat.faturado_numero Desc';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.Open;

        Qtde_Fat := '0';
        if (ConexaoBD.SQL_Comunitario.RecordCount > 0) then begin
              Qtde_Fat := ConexaoBD.SQL_Comunitario.FieldByName('faturado_produto_quantidade').AsString;
        end;

        Pedidos04.SGD_Produtos.Cells[0,Ind] := SGD_Produtos.Cells[0,Ind];
        Pedidos04.SGD_Produtos.Cells[1,Ind] := Qtde_Fat;
        Pedidos04.SGD_Produtos.Cells[2,Ind] := SGD_Produtos.Cells[2,Ind];
        Pedidos04.SGD_Produtos.Cells[3,Ind] := SGD_Produtos.Cells[3,Ind];
        Pedidos04.SGD_Produtos.Cells[4,Ind] := SGD_Produtos.Cells[4,Ind];
        Pedidos04.SGD_Produtos.Cells[5,Ind] := SGD_Produtos.Cells[5,Ind];
        Pedidos04.SGD_Produtos.Cells[6,Ind] := SGD_Produtos.Cells[6,Ind];
        Pedidos04.SGD_Produtos.Cells[7,Ind] := SGD_Produtos.Cells[7,Ind];

         If Trim(Cliente_Suframa.Caption) <> '' Then
            Begin
            Pedidos04.SGD_Produtos.Cells[8,Ind] := '0';
            End
         Else
            Begin
            Pedidos04.SGD_Produtos.Cells[8,Ind] := SGD_Produtos.Cells[8,Ind];
         End;

         Pedidos04.SGD_Produtos.Cells[9,Ind] := SGD_Produtos.Cells[9,Ind];
         Pedidos04.SGD_Produtos.Cells[10,Ind] := SGD_Produtos.Cells[10,Ind];

         ConexaoBD.SQL_Produtos.Close;
         ConexaoBD.SQL_Produtos.SQL.Clear;
         ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' +#39+ Trim(SGD_Produtos.Cells[2,Ind]) + #39);
         ConexaoBD.SQL_Produtos.Open;

         Pedidos04.SGD_Produtos.Cells[10,Ind] := ConexaoBD.SQL_Produtosfb_produto_unidade.Text;
         Pedidos04.SGD_Produtos.Cells[11,Ind] := ConexaoBD.SQL_Produtosfb_produto_classif_fiscal.Text;
         Pedidos04.SGD_Produtos.Cells[12,Ind] := ConexaoBD.SQL_Produtosfb_produto_classif_tributaria.Text;
     End;

     Seta();

     Pedidos04.ShowModal;
     Pedidos04.Destroy;

     Totaliza_Pedido();
     SGD_Produtos.Refresh;

     If Trim(Envia_Faturamento.Text) = 'Ok' Then
        Begin

        Com_Qtde_Produto := False;

        For Ind := 1 To SGD_Produtos.RowCount Do
            Begin
            If StrToFloat(Ponto_Virgula(Pedidos02.SGD_Produtos.Cells[0,Ind])) > 0 Then
               Begin
               Com_Qtde_Produto := True;
            End;
        End;

        //If Not Com_Qtde_Produto Then
        //   Begin
        //   Status_Pedido.Text := 'Faturado';
        //   End
        //Else
        //   Begin
        //   Status_Pedido.Text := 'Semi-Faturado';
        //End;

        Clicou_Imprimir := True;

        BT_Alterar_Pedidos.Click;

        Status_Pedido.Text := 'Faturado';
        For Ind := 1 To SGD_Produtos.RowCount Do
             Begin
             Qtde_Str_1 := Trim(Virgula_Ponto(SGD_Produtos.Cells[0,Ind]));
             Val(Qtde_Str_1,Qtde_Nro_1,Erro);

             Qtde_Str_2 := Trim(Virgula_Ponto(SGD_Produtos.Cells[1,Ind]));
             Val(Qtde_Str_2,Qtde_Nro_2,Erro);

             If Qtde_Nro_2 < Qtde_Nro_1 Then
                Begin
                Status_Pedido.Text := 'Semi-Faturado';
             End;
         End;

         BT_Alterar_Pedidos.Click;

        //*** Recarrega o Grid da Tela Anterior ***

        ConexaoBD.SQL_Pedidos.Close;
        ConexaoBD.SQL_Pedidos.SQL.Clear;
        ConexaoBD.SQL_Pedidos.SQL.Add('Select * from pedidos Where pedido_status <> '+#39+'Faturado'+#39+' Order By pedido_numero');
        ConexaoBD.SQL_Pedidos.Open;

        Pedidos02.Close;
     End;
end;

procedure TPedidos02.Data_EntregaKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Data_EntregaExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TPedidos02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //*** Recarrega o Grid da Tela Anterior ***

     ConexaoBD.SQL_Pedidos.Close;
     ConexaoBD.SQL_Pedidos.SQL.Clear;
     ConexaoBD.SQL_Pedidos.SQL.Add('Select * from pedidos Where pedido_status <> '+#39+'Faturado'+#39+' Order By pedido_numero');
     ConexaoBD.SQL_Pedidos.Open;

     Action := caFree;
     Release;
     Pedidos02 := Nil;
end;

procedure TPedidos02.Cliente_AlimentacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_PesoKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_VolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Financiamento_BNDSKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Financiamento_ProgerKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Financiamento_LeasingKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Financiamento_IbrasmakKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Pagamento_VistaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Pagamento_ParceladoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Pagamento_CombinarKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Parcela_NroKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Parcela_VenctoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Parcela_Dias_VenctoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Parcela_PedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Parcela_FaturamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Parcela_Mes_SubsequenteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Parcela_Porcentagem_AtoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Parcela_Vlr_AtoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Parcela_Prazo_InicioKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Parcela_Porcentagem_AtoExit(Sender: TObject);

Var
   Parcela_Vlr_Ato_Str: String;

begin
     If Trim(Parcela_Porcentagem_Ato.Text) = '' Then
        Begin
        Parcela_Porcentagem_Ato.Text := '0';
     End;

     If Gera_Str_To_Nro_Int(Parcela_Porcentagem_Ato.Text) > 0 Then
        Begin
        Str(((StrToFloat(Valor_Total.Text) * Gera_Str_To_Nro_Int(Parcela_Porcentagem_Ato.Text)) / 100):13:2,Parcela_Vlr_Ato_Str);
        Parcela_Vlr_Ato.Text := Ponto_Virgula(Trim(Parcela_Vlr_Ato_Str));
     End;
end;

procedure TPedidos02.Pagamento_VistaClick(Sender: TObject);
begin
     Forma_Parcelamento.Enabled := False;
     Valor_Ato.Enabled          := False;

     Parcela_Nro.Text             := '0';
     Parcela_Vencto.Text          := '0';
     Parcela_Dias_Vencto.Text     := '0';
     Parcela_Porcentagem_Ato.Text := '0';
     Parcela_Vlr_Ato.Text         := '0';
     Parcela_Prazo_Inicio.Text    := '0';
end;

procedure TPedidos02.Pagamento_ParceladoClick(Sender: TObject);
begin
     Forma_Parcelamento.Enabled := True;
     Valor_Ato.Enabled          := True;

     Parcela_Nro.Text             := '0';
     Parcela_Vencto.Text          := '0';
     Parcela_Dias_Vencto.Text     := '0';
     Parcela_Porcentagem_Ato.Text := '0';
     Parcela_Vlr_Ato.Text         := '0';
     Parcela_Prazo_Inicio.Text    := '0';

     If Programa_Aberto Then
        Begin
        //Parcela_Nro.SetFocus;
     End;
end;

procedure TPedidos02.Pagamento_CombinarClick(Sender: TObject);
begin
     Forma_Parcelamento.Enabled := True;
     Valor_Ato.Enabled          := True;

     Parcela_Nro.Text             := '0';
     Parcela_Vencto.Text          := '0';
     Parcela_Dias_Vencto.Text     := '0';
     Parcela_Porcentagem_Ato.Text := '0';
     Parcela_Vlr_Ato.Text         := '0';
     Parcela_Prazo_Inicio.Text    := '0';

     If Programa_Aberto Then
        Begin
        //Parcela_Nro.SetFocus;
     End;
end;

procedure TPedidos02.Parcela_DescricaoExit(Sender: TObject);
var Ind, qtd_parcela : integer;
begin

  qtd_parcela := 0;

  if(Parcela_Descricao.Text <> '') then
  begin

    For Ind := 1 To length(Parcela_Descricao.Text) Do
    begin
      if Copy(Parcela_Descricao.Text,Ind,1) = '/' then
      begin
        qtd_parcela := qtd_parcela + 1;
      end;
    end;

    qtd_parcela := qtd_parcela + 1;

    Parcela_Nro.Text := IntToStr(qtd_parcela);

  end;

end;

procedure TPedidos02.BT_ProdutosClick(Sender: TObject);
begin
    If (Produtos00 = Nil) Then
       Begin
       Application.CreateForm(TProdutos00,Produtos00);
    End;
    Produtos00.Show;
end;

procedure TPedidos02.BT_Adicionar_TransportadoraClick(Sender: TObject);
begin
    Ampulheta();

    Application.CreateForm(TTransportadoras00,Transportadoras00);

    Seta();

    Transportadoras00.ShowModal;

    Carrega_Transportadoras();
end;

procedure TPedidos02.Porcentagem_DescontoExit(Sender: TObject);
begin
    Totaliza_Pedido();
end;

procedure TPedidos02.Button1Click(Sender: TObject);
begin
     Application.CreateForm(TTransportadoras00,Transportadoras00);
     Transportadoras00.Programa_Anterior.Text := 'Pedidos-Alteração';
     Transportadoras00.ShowModal;
end;

procedure TPedidos02.Cliente_VendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_ComissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TPedidos02.Cliente_VendedorChange(Sender: TObject);
begin
     ConexaoBD.SQL_Representantes.SQL.Clear;
     ConexaoBD.SQL_Representantes.SQL.Add('Select * from fb_representantes Where fb_representante_codigo = ' + Obtem_Nro_Antes_Traco(Cliente_Vendedor.Text));
     ConexaoBD.SQL_Representantes.Open;

     Cliente_Comissao.Text := ConexaoBD.SQL_Representantesfb_representante_1_porcentagem.Text;

     If Trim(Cliente_Comissao.Text) = '' Then
        Begin
        Cliente_Comissao.Text := '0';
     End;
end;

end.
