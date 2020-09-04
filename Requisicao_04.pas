unit Requisicao_04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TRequisicao04 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Cliente_Codigo: TEdit;
    Requisicao_Grupo: TEdit;
    Requisicao_Descricao: TEdit;
    Fornecedor_Observacoes: TMemo;
    BT_Alterar_Pedidos: TBitBtn;
    BT_Excluir: TBitBtn;
    Gerar_Nota: TBitBtn;
    Gerar_Arquivo: TBitBtn;
    Enviar_Email: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    GroupBox7: TGroupBox;
    Label47: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    Label25: TLabel;
    Requisicao_Condicao_Pgto_1: TEdit;
    Requisicao_Condicao_Pgto_2: TEdit;
    Requisicao_Condicao_Pgto_3: TEdit;
    Requisicao_Condicao_Pgto_4: TEdit;
    Requisicao_Prazo: TEdit;
    Requisicao_Vendedor: TEdit;
    Requisicao_Funcionario: TEdit;
    Requisicao_Opcao: TComboBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Valor_Desconto: TEdit;
    Valor_Total: TEdit;
    Valor_Pedido: TEdit;
    Valor_Frete: TEdit;
    Valor_IPI: TEdit;
    SGD_Produtos: TStringGrid;
    Panel4: TPanel;
    BT_Adicionar: TBitBtn;
    BT_Novo: TButton;
    BT_Adicionar_Comprados: TBitBtn;
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
    Label44: TLabel;
    Label1: TLabel;
    Label21: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Fornecedor_Endereco: TEdit;
    Fornecedor_Bairro: TEdit;
    Fornecedor_Cidade: TEdit;
    Fornecedor_Estado: TComboBox;
    Fornecedor_Cep: TMaskEdit;
    Fornecedor_Pais: TComboBox;
    Fornecedor_Nome: TEdit;
    BT_Procurar: TBitBtn;
    Fornecedor_Contato: TEdit;
    Fornecedor_Fone_Comercial: TEdit;
    Fornecedor_Fone_Celular: TEdit;
    Fornecedor_Fone_Fax: TEdit;
    Fornecedor_Email: TEdit;
    BT_Alterar: TBitBtn;
    Fornecedor_Site: TEdit;
    Fornecedor_Numero: TEdit;
    Nro_Requisicao: TEdit;
    Requisicao_Data: TEdit;
    GroupBox5: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Requisicao_Obs: TMemo;
    Requisicao_Orcamento: TEdit;
    Requisicao_Status: TComboBox;
    Requisicao_Qtde_Fornecedores: TEdit;
    Label26: TLabel;
    Requisicao_Previsao_Entrega: TEdit;
    Label27: TLabel;
    Requisicao_Solicitante: TEdit;
    Label29: TLabel;
    Requisicao_Planejamento: TEdit;
    Label31: TLabel;
    Requisicao_Centro_Custo: TComboBox;
    Label34: TLabel;
    Requisicao_Empresa: TComboBox;
    Label36: TLabel;
    Requisicao_Equipamento: TEdit;
    Label37: TLabel;
    Requisicao_OS: TEdit;
    Label38: TLabel;
    Requisicao_Observacao_Tabulacao: TEdit;
    Label39: TLabel;
    Requisicao_Requisitante: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_AdicionarClick(Sender: TObject);
    procedure SGD_ProdutosDblClick(Sender: TObject);
    procedure BT_Alterar_PedidosClick(Sender: TObject);
    procedure Valor_PedidoKeyPress(Sender: TObject; var Key: Char);
    procedure Valor_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure Valor_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure Valor_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure Valor_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_VendedorKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_OrcamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_PrazoKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_Condicao_Pgto_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_Condicao_Pgto_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_Condicao_Pgto_3KeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_Condicao_Pgto_4KeyPress(Sender: TObject;
      var Key: Char);
    procedure sssKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_FuncionarioExit(Sender: TObject);
    procedure Requisicao_VendedorExit(Sender: TObject);
    procedure Requisicao_OrcamentoExit(Sender: TObject);
    procedure Requisicao_PrazoExit(Sender: TObject);
    procedure Requisicao_Condicao_Pgto_1Exit(Sender: TObject);
    procedure Requisicao_Condicao_Pgto_2Exit(Sender: TObject);
    procedure Requisicao_Condicao_Pgto_3Exit(Sender: TObject);
    procedure Requisicao_Condicao_Pgto_4Exit(Sender: TObject);
    procedure sssExit(Sender: TObject);
    procedure Valor_PedidoExit(Sender: TObject);
    procedure Valor_DescontoExit(Sender: TObject);
    procedure Valor_FreteExit(Sender: TObject);
    procedure Valor_IPIExit(Sender: TObject);
    procedure Valor_TotalExit(Sender: TObject);
    procedure Gerar_ArquivoClick(Sender: TObject);
    procedure Enviar_EmailClick(Sender: TObject);
    procedure Gerar_NotaClick(Sender: TObject);
    procedure BT_NovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_Adicionar_CompradosClick(Sender: TObject);
    procedure Requisicao_StatusKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_EmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_Previsao_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_SolicitanteKeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_PlanejamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_Centro_CustoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_ObsKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_EquipamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_OSKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_StatusExit(Sender: TObject);
    procedure Requisicao_EmpresaExit(Sender: TObject);
    procedure Requisicao_Previsao_EntregaExit(Sender: TObject);
    procedure Requisicao_SolicitanteExit(Sender: TObject);
    procedure Requisicao_PlanejamentoExit(Sender: TObject);
    procedure Requisicao_Centro_CustoExit(Sender: TObject);
    procedure Requisicao_ObsExit(Sender: TObject);
    procedure Requisicao_EquipamentoExit(Sender: TObject);
    procedure Requisicao_OSExit(Sender: TObject);
    procedure Requisicao_Observacao_TabulacaoExit(Sender: TObject);
    procedure Requisicao_Observacao_TabulacaoKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;

    procedure Exibe_Grid_Produtos();
    procedure Totaliza_Pedido();
    procedure Criar_PDF(Opcao, Posicao_Ini, Posicao_Fim, Pagina_Ini, Pagina_Fim: String);

  public
    { Public declarations }
  end;

var
  Requisicao04: TRequisicao04;
  Clicou_Imprimir: Boolean;
  Qtde_Produtos_Selecionados: Integer;
  Ctrl_Estoque: Boolean;
  Nro_Ctrl_Estoque: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Fornecedor_00, Fornecedor_02,
  Adiciona_Produto_Relacao, Adiciona_Qtde_Produto, Cria_PDF_02,
  Novo_Produto_Fornecedor_00, Requisicao_02, Relacao_Produto_Comprado_00,
  Qtde_Fornecedores, Ibrasmak_00, Motivo_Cancelamento_00;

{$R *.dfm}

var alterar: string;

//***************
//*** Funções ***
//***************

function TRequisicao04.Valida_Dados(): Boolean;

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

     If Qtde_Nao_Preenchida Then
        Begin
        Erro          := 'Nenhuma Quantidade foi informada nos produtos';
        Campo_Retorno := 'SGD_Produtos';
     End;

     If (Trim(Fornecedor_Numero.Text) = '') and (alterar = '') Then
        Begin
        Erro          := 'Nenhum Fornecedor foi informado';
        Campo_Retorno := 'Fornecedor_Numero';
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

procedure TRequisicao04.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRequisicao04.FormShow(Sender: TObject);

var
    Ind: Integer;
    Qtde_Produto_Digitada: Boolean;
    Valor_Inteiro: String;

begin
    If Ibrasmak00.Cotao1.Enabled = True Then
       Begin
       Gerar_Nota.Enabled := True;
       End
    Else
       Begin
       Gerar_Nota.Enabled := False;
    End;

    alterar := '';
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

procedure TRequisicao04.Exibe_Grid_Produtos();

var
   Ind, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao, Comando_SQL: String;

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
         SGD_Produtos.Cells[8,Ind] := '';
         SGD_Produtos.Cells[9,Ind] := '';
         SGD_Produtos.Cells[10,Ind] := '';
         SGD_Produtos.Cells[11,Ind] := '';
         SGD_Produtos.Cells[12,Ind] := '';
     End;

     //*** Continua o Carregamento Normal ***

     ConexaoBD.SQL_Requisicao_Produto.Close;
     ConexaoBD.SQL_Requisicao_Produto.SQL.Clear;
     ConexaoBD.SQL_Requisicao_Produto.SQL.Add('Select * from fb_requisicoes_produtos Where fb_requisicao_produto_requisicao = ' + Trim(Nro_Requisicao.Text) + ' Order By fb_requisicao_produto_codigo');
     ConexaoBD.SQL_Requisicao_Produto.Open;

     If ConexaoBD.SQL_Requisicao_Produto.RecordCount > 0 Then
        Begin
        SGD_Produtos.RowCount  := 2;
        SGD_Produtos.Refresh;

        SGD_Produtos.RowCount  := (ConexaoBD.SQL_Requisicao_Produto.RecordCount + 2);
        SGD_Produtos.FixedRows := 1;
        Ind := 0;

        ConexaoBD.SQL_Requisicao_Produto.First;

        While Not ConexaoBD.SQL_Requisicao_Produto.Eof Do
              Begin
              Ind := Ind + 1;

              SGD_Produtos.Cells[0,Ind] := ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_qtde.Text;
              SGD_Produtos.Cells[1,Ind] := ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_codigo.Text;
              SGD_Produtos.Cells[2,Ind] := ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_referencia.Text;
              SGD_Produtos.Cells[3,Ind] := ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_descricao.Text;

              SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_unidade.Text;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_valor_unitario.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:5,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              SGD_Produtos.Cells[5,Ind] := Vlr_Exibicao;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_valor_total.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              SGD_Produtos.Cells[6,Ind] := Vlr_Exibicao;
              SGD_Produtos.Cells[7,Ind] := '0';
              SGD_Produtos.Cells[8,Ind] := ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_valor_ipi.Text;

              SGD_Produtos.Cells[9,Ind]  := ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_desenho.Text;
              SGD_Produtos.Cells[10,Ind] := ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_os.Text;
              SGD_Produtos.Cells[11,Ind] := ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_equipamento.Text;
              SGD_Produtos.Cells[12,Ind] := ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_material.Text;

              ConexaoBD.SQL_Requisicao_Produto.Next;
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
     SGD_Produtos.ColWidths[1] := 65;

     //*** Referência do Produto ***
     SGD_Produtos.Cells[2,0]   := 'Referência';
     SGD_Produtos.ColWidths[2] := -1;

     //*** Descrição do Produto ***
     SGD_Produtos.Cells[3,0]   := 'Descrição';
     SGD_Produtos.ColWidths[3] := 200;

     //*** Unidade do Produto ***
     SGD_Produtos.Cells[4,0]   := 'Unidade';
     SGD_Produtos.ColWidths[4] := 45;

     //*** Valor Unitário ***
     SGD_Produtos.Cells[5,0]   := 'Valor (R$)';
     SGD_Produtos.ColWidths[5] := (-1);

     //*** Valor Total ***
     SGD_Produtos.Cells[6,0]   := 'Vlr.Total (R$)';
     SGD_Produtos.ColWidths[6] := (-1);

     //*** Quantidade de Estoque Atual ***
     SGD_Produtos.Cells[7,0]   := 'Qtde Est.Atual';
     SGD_Produtos.ColWidths[7] := (-1);

     //*** Porcentagem do IPI ***
     SGD_Produtos.Cells[8,0]   := 'Porcentagem do IPI';
     SGD_Produtos.ColWidths[8] := (-1);

     //*** Desenho ***
     SGD_Produtos.Cells[9,0]   := 'Desenho';
     SGD_Produtos.ColWidths[9] := 75;

     //*** OS ***
     SGD_Produtos.Cells[10,0]   := 'OS';
     SGD_Produtos.ColWidths[10] := 75;

     //*** Equipamento ***
     SGD_Produtos.Cells[11,0]   := 'Equipamento';
     SGD_Produtos.ColWidths[11] := 75;

     //*** Material ***
     SGD_Produtos.Cells[12,0]   := 'Material';
     SGD_Produtos.ColWidths[12] := 75;

     Seta();
end;

procedure TRequisicao04.BT_SairClick(Sender: TObject);
begin
     Requisicao04.Close;
end;

procedure TRequisicao04.Totaliza_Pedido();

var
   Ind, Erro: Integer;
   Qtde_Nro, Vlr_Unitario_Nro, Vlr_Total_Nro, Porc_Desconto_Nro, Vlr_Frete_Nro, Vlr_Desconto_Nro, Vlr_Pedido_Nro, Vlr_Geral_Nro, Vlr_IPI_Nro, Vlr_Total_IPI_Nro: Real;
   Qtde_Str, Vlr_Unitario_Str, Vlr_Total_Str, Porc_Desconto_Str, Vlr_Frete_Str, Vlr_Desconto_Str, Vlr_Pedido_Str, Vlr_Geral_Str, Vlr_IPI_Str, Vlr_Total_IPI_Str: String;

begin
     Ampulheta();

     //*** Zera as Variáveis de Cáculo ***

     Vlr_Desconto_Nro := 0;
     Vlr_Pedido_Nro   := 0;
     Vlr_Geral_Nro    := 0;
     Vlr_Frete_Nro    := 0;

     //*** Obtem o Valor de Desconto ***

     Porc_Desconto_Nro := 0;

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
         //Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
         //Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

         Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

         //*** Calcula o Valor do IPI ***

         Vlr_IPI_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind]));
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
     Valor_IPI.Text := Vlr_Total_IPI_Str;

     Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
     Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
     Valor_Pedido.Text := Vlr_Pedido_Str;

     Vlr_Desconto_Str := Trim(Valor_Desconto.Text);

     If Trim(Vlr_Desconto_Str) = '' Then
        Begin
        Vlr_Desconto_Str := '0';
     End;

     Vlr_Desconto_Nro := StrToFloat(Vlr_Desconto_Str);

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

     Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro + Vlr_Total_IPI_Nro - Vlr_Desconto_Nro);

     Str(Vlr_Geral_Nro:13:2,Vlr_Geral_Str);
     Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
     Valor_Total.Text := Vlr_Geral_Str;

     Seta();
end;

procedure TRequisicao04.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        Application.CreateForm(TMotivoCancelamento00,MotivoCancelamento00);

        MotivoCancelamento00.OS_Numero.Text            := Nro_Requisicao.Text;
        MotivoCancelamento00.OS_CNPJ.Text              := Fornecedor_Numero.Text;
        MotivoCancelamento00.OS_Titulo.Text            := 'Cancelamento de Requisição';
        MotivoCancelamento00.OS_DataCriacao.Text       := Requisicao_Data.Text;
        MotivoCancelamento00.OS_Tipo_os.Text           := 'Requisição';
        MotivoCancelamento00.Edit_Operador.Text        := Ibrasmak00.Login.Text;

        Seta();

        MotivoCancelamento00.ShowModal;
        MotivoCancelamento00.Destroy;

        Ampulheta();

        //*** Deleta a Requisição Principal ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_requisicoes Where fb_requisicao_nro = ' +  Trim(Nro_Requisicao.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Deleta os Itens da Requisição Principal ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_requisicoes_produtos Where fb_requisicao_produto_requisicao = ' +  Trim(Nro_Requisicao.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Requisicao04.Close;
     End;
end;

procedure TRequisicao04.BT_ProcurarClick(Sender: TObject);
begin
     Requisicao04.Visible := False;

     Ampulheta();
     Application.CreateForm(TFornecedor00,Fornecedor00);

     Fornecedor00.Programa_Anterior.Text := 'Requisição-Alteração';
     Fornecedor00.Fornecedor_Area.ItemIndex := 1;
     Fornecedor00.BT_Procurar.Click;

     Seta();
     Fornecedor00.ShowModal;
     //Fornecedor00.Destroy;

     Requisicao04.Visible := True;
end;

procedure TRequisicao04.BT_AlterarClick(Sender: TObject);

var
   Codigo_Fornecedor: String;

begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        Requisicao04.Visible := False;

        Ampulheta();
        Application.CreateForm(TFornecedor02,Fornecedor02);

        Fornecedor02.Programa_Anterior.Text := 'Requisição-Alteração';

        //*** Obtem os Dados do Cliente ***

        Codigo_Fornecedor := Fornecedor_Numero.Text;

        ConexaoBD.SQL_Fornecedores.Close;
        ConexaoBD.SQL_Fornecedores.SQL.Clear;
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + #39 + Trim(Codigo_Fornecedor) + #39 );
        ConexaoBD.SQL_Fornecedores.Open;

        //*** Carrega os Dados Obtidos ***

        Fornecedor02.Fornecedor_Numero.Text       := ConexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;
        Fornecedor02.Fornecedor_Codigo_CNPJ.Text  := ConexaoBD.SQL_Fornecedoresfb_fornecedor_codigo.AsString;

        Fornecedor02.Fornecedor_Nome.Text                 := ConexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text;
        Fornecedor02.Fornecedor_Razao_Social.Text         := ConexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
        Fornecedor02.Fornecedor_Inscricao_Municipal.Text  := ConexaoBD.SQL_Fornecedoresfb_fornecedor_inscricao_municipal.Text;
        Fornecedor02.Fornecedor_Inscricao_Estadual.Text   := ConexaoBD.SQL_Fornecedoresfb_fornecedor_inscricao_estadual.Text;
        Fornecedor02.Fornecedor_Endereco.Text             := ConexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
        Fornecedor02.Fornecedor_Bairro.Text               := ConexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
        Fornecedor02.Fornecedor_Cidade.Text               := ConexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
        Fornecedor02.Fornecedor_Estado.ItemIndex          := Obtem_Nro_Estado(ConexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
        Fornecedor02.Fornecedor_Cep.Text                  := ConexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
        Fornecedor02.Fornecedor_Fone.Text                 := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone.Text;
        Fornecedor02.Fornecedor_Fax.Text                  := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fax.Text;
        Fornecedor02.Fornecedor_Contato.Text              := ConexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
        Fornecedor02.Fornecedor_Fone_Comercial.Text       := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
        Fornecedor02.Fornecedor_Fone_Celular.Text         := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
        Fornecedor02.Fornecedor_Fone_Fax.Text             := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
        Fornecedor02.Fornecedor_Data_Inclusao.Text        := ConexaoBD.SQL_Fornecedoresfb_fornecedor_data_inclusao.Text;
        Fornecedor02.Fornecedor_Data_Alteracao.Text       := ConexaoBD.SQL_Fornecedoresfb_fornecedor_data_alteracao.Text;
        Fornecedor02.Fornecedor_Data_Ultima_Compra.Text   := ConexaoBD.SQL_Fornecedoresfb_fornecedor_data_ultima_compra.Text;

        Fornecedor02.Fornecedor_Observacoes.Lines.Clear;
        Fornecedor02.Fornecedor_Observacoes.Lines.Add(Fornecedor_Observacoes.Text);

        Fornecedor02.Fornecedor_Pais.ItemIndex := Obtem_Nro_Pais(ConexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);

        Fornecedor02.Fornecedor_Email.Text                := ConexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;
        Fornecedor02.Fornecedor_Site.Text                 := ConexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

        //*** Fecha SQL ***

        ConexaoBD.SQL_Fornecedores.Close;

        Seta();

        Fornecedor02.ShowModal;
        Fornecedor02.Destroy;

        Requisicao04.Visible := True;
        End
     Else
        Begin
        MSG_Erro('É Necessário informar um Fornecedor antes de alterar os dados cadastrais do mesmo');
     End;
end;

procedure TRequisicao04.BT_AdicionarClick(Sender: TObject);
begin
//     If Trim(Fornecedor_Numero.Text) <> '' Then
//        Begin
        Ampulheta();

        SGD_Produtos.Refresh;

        Application.CreateForm(TAdicionaProdutoRelacao,AdicionaProdutoRelacao);

        AdicionaProdutoRelacao.Programa_Anterior.Text := 'Requisição-Alteração';
        AdicionaProdutoRelacao.Nro_Fornecedor.Text    := Trim(Fornecedor_Numero.Text);

        Seta();
        AdicionaProdutoRelacao.ShowModal;
        AdicionaProdutoRelacao.Destroy;

        SGD_Produtos.Refresh;
//        End
//     Else
//        Begin
//        MSG_Erro('Selecione Primeiramente o Fornecedor');
//     End;
end;

procedure TRequisicao04.SGD_ProdutosDblClick(Sender: TObject);

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
           MSG_Erro('O número máximo de produtos '+Chr(13)+Chr(10)+'já foi atingido.'+Chr(13)+Chr(10)+Chr(13)+Chr(10)+'Para informar mais produtos é necessário fechar esta '+Chr(13)+Chr(10)+'cotação e abrir outra.'+Chr(13)+Chr(10)+Chr(13)+Chr(10)+'Você pode continuar alterando os produtos já selecionados');
        End;
        End
     Else
        Begin
        Acessa_Qtde := True;
     End;

     If Acessa_Qtde = True Then
        Begin
        Application.CreateForm(TAdicionaQtdeProduto,AdicionaQtdeProduto);

        AdicionaQtdeProduto.Programa_Anterior.Text       := 'Requisição-Alteração';
        AdicionaQtdeProduto.Adiciona_ACol.Text           := IntToStr(SGD_Produtos.Col);
        AdicionaQtdeProduto.Adiciona_ARow.Text           := IntToStr(SGD_Produtos.Row);
        AdicionaQtdeProduto.Adiciona_Codigo_Produto.Text := SGD_Produtos.Cells[1,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Referencia.Text     := SGD_Produtos.Cells[2,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Descricao.Text      := SGD_Produtos.Cells[3,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Unidade.Text        := SGD_Produtos.Cells[4,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Valor_Unitario.Text := SGD_Produtos.Cells[5,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_IPI.Text            := SGD_Produtos.Cells[8,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Quantidade.Text     := SGD_Produtos.Cells[0,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Quantidade_ANT.Text := SGD_Produtos.Cells[0,SGD_Produtos.Row];

        AdicionaQtdeProduto.Adiciona_Desenho.Text        := SGD_Produtos.Cells[9,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_OS.Text             := SGD_Produtos.Cells[10,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Equipamento.Text    := SGD_Produtos.Cells[11,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Material.Text       := SGD_Produtos.Cells[12,SGD_Produtos.Row];

        AdicionaQtdeProduto.Adiciona_IPI.Enabled         := True;

        AdicionaQtdeProduto.Adiciona_Nro_Ctrl_Estoque.Text := Trim(Nro_Ctrl_Estoque);
        AdicionaQtdeProduto.Adiciona_Nro_Nota_Estoque.Text := '0';
        AdicionaQtdeProduto.Adiciona_Lote_Estoque.Text     := '0';
        AdicionaQtdeProduto.Adiciona_Tipo_Faturamento.Text := '0';

        AdicionaQtdeProduto.BT_Trocar.Visible := False;

        AdicionaQtdeProduto.ShowModal;
        AdicionaQtdeProduto.Destroy;

        Totaliza_Pedido();
        SGD_Produtos.Refresh;
     End;
end;

procedure TRequisicao04.BT_Alterar_PedidosClick(Sender: TObject);

var
   Comando_SQL, Emite_Lote, Transportadora, Valor_Inteiro: String;
   Vlr_Frete, Vlr_IPI, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4: String;
   Ind, Linha: Integer;

begin
    alterar := 'ok';
     If Valida_Dados() Then
        Begin

        Ampulheta();

        //*** Obtem os Valores ***

        Vlr_Frete         := Trim(Virgula_Ponto(Valor_Frete.Text));
        Vlr_Desconto      := Trim(Virgula_Ponto(Valor_Desconto.Text));
        Vlr_Pedido        := Trim(Virgula_Ponto(Valor_Pedido.Text));
        Vlr_IPI           := Trim(Virgula_Ponto(Valor_IPI.Text));
        Vlr_Total         := Trim(Virgula_Ponto(Valor_Total.Text));

        Cond_Pgto_1       := Trim(Requisicao_Condicao_Pgto_1.Text);
        Cond_Pgto_2       := Trim(Requisicao_Condicao_Pgto_2.Text);
        Cond_Pgto_3       := Trim(Requisicao_Condicao_Pgto_3.Text);
        Cond_Pgto_4       := Trim(Requisicao_Condicao_Pgto_4.Text);

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

        If Trim(Vlr_IPI) = '' Then
           Begin
           Vlr_IPI := '0';
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

        //*** Altera o Pedido Principal ***

        Comando_SQL := 'Update fb_requisicoes Set ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_grupo = ' + #39 + Trim(Requisicao_Grupo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_fornecedor = ' + #39 + Trim(Fornecedor_Numero.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_fornecedor_descricao = ' + #39 + Trim(Fornecedor_Nome.Text) + #39 + ',';
        //Comando_SQL := Comando_SQL + 'fb_requisicao_data = ' + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_vlr_total = ' + #39 + Vlr_Total + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_vendedor = ' + #39 + Trim(Requisicao_Vendedor.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_orcamento_nro = ' + #39 + Trim(Requisicao_Orcamento.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_prazo_entrega = ' + #39 + Trim(Requisicao_Previsao_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_desconto = ' + #39 + Vlr_Desconto + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_requisitante = ' + #39 + Trim(Requisicao_Requisitante.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_funcionario = ' + #39 + Trim(Requisicao_Solicitante.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_1 = ' + #39 + Cond_Pgto_1 + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_2 = ' + #39 + Cond_Pgto_2 + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_3 = ' + #39 + Cond_Pgto_3 + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_4 = ' + #39 + Cond_Pgto_4 + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_requisicao_status = ' + #39 + Trim(Requisicao_Status.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_opcao = ' + #39 + Trim(Requisicao_Opcao.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_obs = ' + #39 + Trim(Requisicao_Obs.Lines.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_frete = ' + #39 + Vlr_Frete + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_centro = ' + #39 + Trim(Requisicao_Centro_Custo.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_planejamento = ' + #39 + Trim(Requisicao_Planejamento.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_empresa = ' + #39 + Trim(Requisicao_Empresa.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_equipamento = ' + #39 + Trim(Requisicao_Equipamento.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_os = ' + #39 + Trim(Requisicao_OS.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_obs_tabulacao = ' + #39 + Trim(Requisicao_Observacao_Tabulacao.Text) + #39 + ' ';
        Comando_SQL := Comando_SQL + ' Where fb_requisicao_nro = ' + #39 + Trim(Nro_Requisicao.Text)+#39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Apaga os Itens da Requisição ***

        Comando_SQL := 'Delete from fb_requisicoes_produtos Where fb_requisicao_produto_requisicao = ' + Trim(Nro_Requisicao.Text);

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Insere os Produtos da Requisição ***

        For Ind := 1 To SGD_Produtos.RowCount Do
            Begin

            Valor_Inteiro := Trim(SGD_Produtos.Cells[0,Ind]);

            If Trim(Valor_Inteiro) = '' Then
               Begin
               Valor_Inteiro := '0';
            End;

            If StrToFloat(Valor_Inteiro) > 0 Then
               Begin
               Comando_SQL := 'Insert into fb_requisicoes_produtos(';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_requisicao, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_codigo, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_referencia, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_descricao, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_qtde, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_valor_unitario, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_valor_total, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_valor_ipi, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_unidade, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_desenho, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_os, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_equipamento, ';
               Comando_SQL := Comando_SQL + 'fb_requisicao_produto_material) ';
               Comando_SQL := Comando_SQL + ' Values(';
               Comando_SQL := Comando_SQL + Trim(Nro_Requisicao.Text) + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[1,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[3,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[0,Ind])) + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[5,Ind])) + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[6,Ind])) + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind])) + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[4,Ind])) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[9,Ind])) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[10,Ind])) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[11,Ind])) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[12,Ind])) + #39 + ')';

               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Comunitario.ExecSQL;
            End;
        End;

        Exibe_Grid_Produtos();
        Totaliza_Pedido();

        Seta();

        MSG_Erro('Alteração Efetuada.');
     End;
end;

procedure TRequisicao04.Valor_PedidoKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Valor_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Valor_FreteKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Valor_IPIKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Valor_TotalKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_VendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_OrcamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_PrazoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_Condicao_Pgto_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_Condicao_Pgto_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_Condicao_Pgto_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_Condicao_Pgto_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.sssKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_FuncionarioExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_VendedorExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_OrcamentoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_PrazoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_Condicao_Pgto_1Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_Condicao_Pgto_2Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_Condicao_Pgto_3Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_Condicao_Pgto_4Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.sssExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Valor_PedidoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Valor_DescontoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Valor_FreteExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Valor_IPIExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Valor_TotalExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Gerar_ArquivoClick(Sender: TObject);

var
   Pos: Integer;

begin
     Pos := (SGD_Produtos.RowCount - 2);

     If (Pos >= 1) And (Pos <= 22) Then
        Begin
        Criar_PDF('Imprimir','1','22','1','1');
        End
     Else If (Pos >= 23) And (Pos <= 44) Then
        Begin
        Criar_PDF('Imprimir','1','22','1','2');
        End
     Else If (Pos >= 45) And (Pos <= 66) Then
        Begin
        Criar_PDF('Imprimir','1','22','1','3');
        End
     Else If (Pos >= 67) And (Pos <= 88) Then
        Begin
        Criar_PDF('Imprimir','1','22','1','4');
        End
     Else If (Pos >= 89) And (Pos <= 110) Then
        Begin
        Criar_PDF('Imprimir','1','22','1','5');
        End
     Else If (Pos >= 111) And (Pos <= 132) Then
        Begin
        Criar_PDF('Imprimir','1','22','1','6');
        End
     Else If (Pos >= 133) And (Pos <= 154) Then
        Begin
        Criar_PDF('Imprimir','1','22','1','7');
     End;
end;

procedure TRequisicao04.Criar_PDF(Opcao, Posicao_Ini, Posicao_Fim, Pagina_Ini, Pagina_Fim: String);

var
   Ind, Posicao: Integer;
   Cond_Pgto, IPI_String: string;
   IPI_Val: Real;

begin
  Ampulheta();

  Application.CreateForm(TCriaPDF02,CriaPDF02);

  If Trim(Requisicao_Empresa.Text) = 'IBRASMAK' Then
     Begin
     CriaPDF02.Empresa_01.Caption := 'IBRASMAK';
     CriaPDF02.Empresa_02.Caption := '';

     CriaPDF02.Endereco_01.Caption := 'IBRASMAK IND. BRASILEIRA DE MÁQUINAS LTDA';
     CriaPDF02.Endereco_02.Caption := 'CNPJ: 47.139.456/0001-09                      IE: 581.034.396.119';
     CriaPDF02.Endereco_03.Caption := 'ESTRADA DE SAPOPEMBA, 159 KM 45 - CEP 09432-300 -  RIBEIRÃO PIRES - SP';
     CriaPDF02.Endereco_04.Caption := 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700';
     CriaPDF02.Endereco_05.Caption := 'e-mail: compras@ibrasmak.com.br';
     End
  Else If Trim(Requisicao_Empresa.Text) = 'MONIBRAS' Then
     Begin
     CriaPDF02.Empresa_01.Caption := 'MONIBRAS';
     CriaPDF02.Empresa_02.Caption := '';

     CriaPDF02.Endereco_01.Caption := 'MONIBRAS MÁQUINAS E EQUIPAMENTOS LTDA';
     CriaPDF02.Endereco_02.Caption := 'CNPJ: 04.449.820/0001-16                      IE: 581.128.318.116';
     CriaPDF02.Endereco_03.Caption := 'ESTRADA DE SAPOPEMBA, 149 KM 45 - CEP 09432-300 -  RIBEIRÃO PIRES - SP';
     CriaPDF02.Endereco_04.Caption := 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700';
     CriaPDF02.Endereco_05.Caption := 'e-mail: compras@ibrasmak.com.br';
     End
  Else If Trim(Requisicao_Empresa.Text) = 'FERRAMENTARIA' Then
     Begin
     CriaPDF02.Empresa_01.Caption := 'IBRASMAK';
     CriaPDF02.Empresa_02.Caption := '(FERRAMENTARIA)';

     CriaPDF02.Endereco_01.Caption := 'IBRASMAK IND. BRASILEIRA DE MÁQUINAS LTDA';
     CriaPDF02.Endereco_02.Caption := 'CNPJ: 47.139.456/0001-09                      IE: 581.034.396.119';
     CriaPDF02.Endereco_03.Caption := 'ESTRADA DE SAPOPEMBA, 159 KM 45 - CEP 09432-300 -  RIBEIRÃO PIRES - SP';
     CriaPDF02.Endereco_04.Caption := 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700';
     CriaPDF02.Endereco_05.Caption := 'e-mail: compras@ibrasmak.com.br';
  End;

  CriaPDF02.PRL_Requisitante.Caption := Requisicao_Requisitante.Text;
  CriaPDF02.PRL_Solicitante.Caption  := Requisicao_Solicitante.Text;

  CriaPDF02.Endereco_01.Caption := '';
  CriaPDF02.Endereco_02.Caption := '';
  CriaPDF02.Endereco_03.Caption := '';
  CriaPDF02.Endereco_04.Caption := '';
  CriaPDF02.Endereco_05.Caption := '';

  CriaPDF02.PRL_Paginacao.Caption := 'PÁGINA ' + Trim(Pagina_Ini) + ' DE ' + Trim(Pagina_Fim);
  CriaPDF02.LBL_Ini.Caption       := Trim(Pagina_Ini);
  CriaPDF02.LBL_Fim.Caption       := Trim(Pagina_Fim);

  CriaPDF02.PRL_OBS1.Caption      := Trim(Requisicao_Obs.Text);

  CriaPDF02.Opcao_Anterior.Text := Opcao;
  CriaPDF02.Cliente_Email.Text  := Fornecedor_Email.Text;
  CriaPDF02.Nro_Requisicao.Text    := Nro_Requisicao.Text;

  CriaPDF02.PRL_Requisicao_Nro.Caption  := Trim(Nro_Requisicao.Text);
  CriaPDF02.PRL_Data_Requisicao.Caption := Trim(Requisicao_Data.Text);
  CriaPDF02.PRL_Nome.Caption         := Copy(Trim(Fornecedor_Nome.Text),1,35);
  CriaPDF02.PRL_Contato.Caption      := Trim(Fornecedor_Contato.Text);

  CriaPDF02.PRL_Equipamento.Caption  := Trim(Requisicao_Equipamento.Text);
  CriaPDF02.PRL_OS.Caption           := Trim(Requisicao_OS.Text);
  CriaPDF02.PRL_Centro.Caption       := Trim(Requisicao_Centro_Custo.Text);

  If Trim(Fornecedor_Fone_Comercial.Text) <> '' Then
     Begin
     CriaPDF02.PRL_Fone_1.Caption   := Trim(Fornecedor_Fone_Comercial.Text);
     End
  Else If Trim(Fornecedor_Fone_Celular.Text) <> '' Then
     Begin
     CriaPDF02.PRL_Fone_1.Caption   := Trim(Fornecedor_Fone_Celular.Text);
  End;

  CriaPDF02.PRL_Fax.Caption         := Trim(Fornecedor_Fone_Fax.Text);

  If Trim(Requisicao_Condicao_Pgto_1.Text) <> '' Then
     Begin
     If StrToInt(Requisicao_Condicao_Pgto_1.Text) > 0 Then
        Cond_Pgto := Trim(Requisicao_Condicao_Pgto_1.Text);
  End;

  If Trim(Requisicao_Condicao_Pgto_2.Text) <> '' Then
     Begin
     If StrToInt(Requisicao_Condicao_Pgto_2.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ', ' + Trim(Requisicao_Condicao_Pgto_2.Text);
  End;

  If Trim(Requisicao_Condicao_Pgto_3.Text) <> '' Then
     Begin
     If StrToInt(Requisicao_Condicao_Pgto_3.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ', ' + Trim(Requisicao_Condicao_Pgto_3.Text);
  End;

  If Trim(Requisicao_Condicao_Pgto_4.Text) <> '' Then
     Begin
     If StrToInt(Requisicao_Condicao_Pgto_4.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ' e ' + Trim(Requisicao_Condicao_Pgto_4.Text);
  End;

  Cond_Pgto := Cond_Pgto;

  CriaPDF02.PRL_Pagamento.Caption := Trim(Cond_Pgto);
  CriaPDF02.PRL_Entrega.Caption   := Trim(Requisicao_Prazo.Text);

  {
  If Trim(Valor_Frete.Text) <> '0,00' Then
     Begin
     CriaPDF02.PRL_Frete.Caption    := Trim(Valor_Frete.Text);
     End
  Else
     Begin
     CriaPDF02.PRL_Frete.Caption    := '';
  End;

  CriaPDF02.PRL_Validade.Caption := '';}

  //*** Coloca os Itens no PDF ***

  Posicao := StrToInt(Posicao_Fim);

  For Ind := StrToInt(Posicao_Ini) To Posicao Do
      Begin
      If Ind = 1 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_01.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_01.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_01.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_01.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_01.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_01.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_01.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_01.Caption := '';
         End;

         End;

         End
      Else If Ind = 2 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_02.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_02.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_02.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_02.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_02.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_02.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_02.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_02.Caption := '';
         End;

         End;

         End
      Else If Ind = 3 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_03.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_03.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_03.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_03.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_03.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_03.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_03.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_03.Caption := '';
         End;

         End;

         End
      Else If Ind = 4 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_04.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_04.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_04.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_04.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_04.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_04.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_04.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_04.Caption := '';
         End;

         End;

         End
      Else If Ind = 5 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_05.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_05.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_05.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_05.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_05.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_05.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_05.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_05.Caption := '';
         End;

         End;

         End
      Else If Ind = 6 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_06.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_06.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_06.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_06.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_06.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_06.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_06.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_06.Caption := '';
         End;

         End;

         End
      Else If Ind = 7 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_07.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_07.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_07.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_07.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_07.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_07.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_07.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_07.Caption := '';
         End;

         End;

         End
      Else If Ind = 8 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_08.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_08.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_08.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_08.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_08.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_08.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_08.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_08.Caption := '';
         End;

         End;

         End
      Else If Ind = 9 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_09.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_09.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_09.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_09.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_09.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_09.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_09.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_09.Caption := '';
         End;

         End;

         End
      Else If Ind = 10 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_10.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_10.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_10.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_10.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_10.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_10.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_10.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_10.Caption := '';
         End;

         End;

         End
      Else If Ind = 11 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_11.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_11.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_11.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_11.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_11.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_11.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_11.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_11.Caption := '';
         End;

         End;

         End
      Else If Ind = 12 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_12.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_12.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_12.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_12.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_12.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_12.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_12.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_12.Caption := '';
         End;

         End;

         End
      Else If Ind = 13 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_13.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_13.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_13.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_13.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_13.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_13.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_13.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_13.Caption := '';
         End;

         End;

         End
      Else If Ind = 14 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_14.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_14.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_14.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_14.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_14.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_14.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_14.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_14.Caption := '';
         End;

         End;

         End
      Else If Ind = 15 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_15.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_15.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_15.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_15.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_15.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_15.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_15.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_15.Caption := '';
         End;

         End;

         End
      Else If Ind = 16 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_16.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_16.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_16.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_16.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_16.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_16.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_16.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_16.Caption := '';
         End;

         End;

         End
      Else If Ind = 17 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_17.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_17.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_17.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_17.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_17.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_17.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_17.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_17.Caption := '';
         End;

         End;

         End
      Else If Ind = 18 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_18.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_18.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_18.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_18.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_18.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_18.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_18.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_18.Caption := '';
         End;

         End;

         End
      Else If Ind = 19 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_19.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_19.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_19.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_19.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_19.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_19.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_19.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_19.Caption := '';
         End;

         End;

         End
      Else If Ind = 20 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_20.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_20.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_20.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_20.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_20.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_20.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_20.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_20.Caption := '';
         End;

         End;

         End
      Else If Ind = 21 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_21.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_21.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_21.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_21.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_21.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_21.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_21.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_21.Caption := '';
         End;

         End;

         End
      Else If Ind = 22 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_22.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_22.Caption  := Trim(SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_22.Caption  := Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_22.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_22.Caption := SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_22.Caption  := '';
         End;

         If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_22.Caption := SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_22.Caption := '';
         End;

         End;

      End;
  End;

  //*** Coloca o Valor no PDF ***

  If Trim(Valor_IPI.Text) <> '0,00' Then
     Begin
     CriaPDF02.PRL_VlrIPI.Caption := Trim(Valor_IPI.Text);
     End
  Else
     Begin
     CriaPDF02.PRL_VlrIPI.Caption := '';
  End;

  If Trim(Valor_Total.Text) <> '0,00' Then
     Begin
     CriaPDF02.PRL_VlrTotal.Caption := Trim(Valor_Total.Text);
     End
  Else
     Begin
     CriaPDF02.PRL_VlrTotal.Caption := '';
  End;

//  CriaPDF02.PRL_Funcionario.Caption := Trim(Requisicao_Funcionario.Text);

  //*** Exibe o PDF ***

  Seta();

  CriaPDF02.ShowModal;
  CriaPDF02.Destroy;
end;

Procedure TRequisicao04.Enviar_EmailClick(Sender: TObject);

var
   Pos: Integer;

begin
     Pos := (SGD_Produtos.RowCount - 2);

     If (Pos >= 1) And (Pos <= 22) Then
        Begin
        Criar_PDF('EMail','1','22','1','1');
        End
     Else If (Pos >= 23) And (Pos <= 44) Then
        Begin
        Criar_PDF('EMail','1','22','1','2');
        End
     Else If (Pos >= 45) And (Pos <= 66) Then
        Begin
        Criar_PDF('EMail','1','22','1','3');
        End
     Else If (Pos >= 67) And (Pos <= 88) Then
        Begin
        Criar_PDF('EMail','1','22','1','4');
        End
     Else If (Pos >= 89) And (Pos <= 110) Then
        Begin
        Criar_PDF('EMail','1','22','1','5');
        End
     Else If (Pos >= 111) And (Pos <= 132) Then
        Begin
        Criar_PDF('EMail','1','22','1','6');
        End
     Else If (Pos >= 133) And (Pos <= 154) Then
        Begin
        Criar_PDF('EMail','1','22','1','7');
     End;
end;

procedure TRequisicao04.Gerar_NotaClick(Sender: TObject);
{
var
   Comando_SQL, Emite_Lote, Transportadora, Valor_Inteiro: String;
   Vlr_Frete, Vlr_IPI, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4: String;
   Nro_Ordem: String;
   Ind, Linha: Integer;

begin
     If Confirma('Você deseja realmente gerar uma Ordem de Compra para esta Requisição?') = 6 Then
        Begin

        If Valida_Dados() Then
           Begin

           Ampulheta();

           //*** Obtem os Valores ***

           Vlr_Frete         := Trim(Virgula_Ponto(Valor_Frete.Text));
           Vlr_Desconto      := Trim(Virgula_Ponto(Valor_Desconto.Text));
           Vlr_Pedido        := Trim(Virgula_Ponto(Valor_Pedido.Text));
           Vlr_IPI           := Trim(Virgula_Ponto(Valor_IPI.Text));
           Vlr_Total         := Trim(Virgula_Ponto(Valor_Total.Text));

           Cond_Pgto_1       := Trim(Requisicao_Condicao_Pgto_1.Text);
           Cond_Pgto_2       := Trim(Requisicao_Condicao_Pgto_2.Text);
           Cond_Pgto_3       := Trim(Requisicao_Condicao_Pgto_3.Text);
           Cond_Pgto_4       := Trim(Requisicao_Condicao_Pgto_4.Text);

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

           If Trim(Vlr_IPI) = '' Then
              Begin
              Vlr_IPI := '0';
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

           //*** Insere a Ordem de Compra ***

           Comando_SQL := 'Insert into fb_ordens(';
           Comando_SQL := Comando_SQL + 'fb_ordem_fornecedor, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_fornecedor_descricao, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_data, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_vlr_total, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_vendedor, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_orcamento_nro, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_prazo_entrega, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_desconto, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_funcionario, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_cond_pgto_1, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_cond_pgto_2, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_cond_pgto_3, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_cond_pgto_4, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_frete, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_status, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_opcao) ';
           Comando_SQL := Comando_SQL + ' Values(';
           Comando_SQL := Comando_SQL + Trim(Fornecedor_Numero.Text) + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Nome.Text) + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';
           Comando_SQL := Comando_SQL + Vlr_Total + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Vendedor.Text) + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Orcamento.Text) + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Prazo.Text) + #39 + ',';
           Comando_SQL := Comando_SQL + Vlr_Desconto + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Funcionario.Text) + #39 + ',';
           Comando_SQL := Comando_SQL + Cond_Pgto_1 + ',';
           Comando_SQL := Comando_SQL + Cond_Pgto_2 + ',';
           Comando_SQL := Comando_SQL + Cond_Pgto_3 + ',';
           Comando_SQL := Comando_SQL + Cond_Pgto_4 + ',';
           Comando_SQL := Comando_SQL + Vlr_Frete + ',';
           Comando_SQL := Comando_SQL + #39 + 'Ordem de Compra' + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Opcao.Text) + #39 + ')';

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           //*** Obtem Número da Ordem de Compra ***

           ConexaoBD.SQL_Ordem.Close;
           ConexaoBD.SQL_Ordem.SQL.Clear;
           ConexaoBD.SQL_Ordem.SQL.Add('Select * from fb_ordens Order By fb_ordem_nro Desc');
           ConexaoBD.SQL_Ordem.Open;

           conexaoBD.SQL_Ordem.First;

           Nro_Ordem := conexaoBD.SQL_Ordemfb_ordem_nro.Text;

           //*** Insere os Produtos da Ordem de Compra ***

           For Ind := 1 To SGD_Produtos.RowCount Do
               Begin

               Valor_Inteiro := Trim(SGD_Produtos.Cells[0,Ind]);

               If Trim(Valor_Inteiro) = '' Then
                  Begin
                  Valor_Inteiro := '0';
               End;

               If StrToFloat(Valor_Inteiro) > 0 Then
                  Begin
                  Comando_SQL := 'Insert into fb_ordens_produtos(';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_ordem, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_codigo, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_referencia, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_descricao, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_qtde, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_valor_unitario, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_valor_total, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_valor_ipi, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_unidade) ';
                  Comando_SQL := Comando_SQL + ' Values(';
                  Comando_SQL := Comando_SQL + Trim(Nro_Ordem) + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[1,Ind]) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[3,Ind]) + #39 + ',';
                  Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[0,Ind])) + ',';
                  Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[5,Ind])) + ',';
                  Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[6,Ind])) + ',';
                  Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind])) + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[4,Ind])) + #39 + ')';

                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;
           End;

           //*** Altera o Status da Requisição ***

           Comando_SQL := 'Update fb_requisicoes Set ';
           Comando_SQL := Comando_SQL + 'fb_requisicao_status = ' + #39 + 'OC - Nro.: ' + Trim(Nro_Ordem) + #39 + ' ';
           Comando_SQL := Comando_SQL + 'Where fb_requisicao_nro = ' + Trim(Nro_Requisicao.Text);

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           Seta();

           MSG_Erro('Ordem de Compra de Nro.: ' + Trim(Nro_Ordem) + '. Gerada com Sucesso.');

           Requisicao04.Close;
        End;
     End;  }


var
   Comando_SQL, Emite_Lote, Transportadora, Valor_Inteiro: String;
   Vlr_Frete, Vlr_IPI, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4: String;
   Nro_Cotacao: String;
   Ind, Linha: Integer;
   Qtde_Inicial, Qtde_Final: Integer;
   Frase_Geracao: String;

begin
     If Confirma('Você deseja realmente gerar uma Cotação para esta Requisição?') = 6 Then
        Begin

        alterar := '';

        If Valida_Dados() Then
           Begin

           //*** Pergunta a Quantidade de Fornecedores ***

           Application.CreateForm(TQtdeFornecedores,QtdeFornecedores);
           QtdeFornecedores.ShowModal;
           QtdeFornecedores.Destroy;

           If ((Trim(Requisicao_Qtde_Fornecedores.Text) = '') Or (Trim(Requisicao_Qtde_Fornecedores.Text) = '0') Or (Trim(Requisicao_Qtde_Fornecedores.Text) = '00')) Then
              Begin
              Requisicao_Qtde_Fornecedores.Text := '1';
           End;

           Qtde_Inicial := 1;
           Qtde_Final   := StrToInt(Trim(Requisicao_Qtde_Fornecedores.Text));

           For Qtde_Inicial := 1 To Qtde_Final Do
               Begin

               If ((Qtde_Inicial = 1) And (Trim(Fornecedor_Nome.Text) <> '*** REQUISIÇÃO INTERNA - (IBRASMAK) ***')) Then
                  Begin
                  Frase_Geracao := 'Sequência de Geração: ' + IntToStr(Qtde_Inicial) + ' - Confirma a Geração de Cotação para o Fornecedor: Nro.: ' + Trim(Fornecedor_Numero.Text) + ' - '  + Trim(Fornecedor_Nome.Text) + '?';
                  End
               Else
                  Begin
                  Frase_Geracao := 'Sequência de Geração: ' + IntToStr(Qtde_Inicial) + ' - Confirma a Escolha e Geração de Cotação para o Próximo Fornecedor?';
               End;

               If Confirma(Frase_Geracao) = 6 Then
                  Begin

                  If ((Qtde_Inicial <> 1) Or (UpperCase(Trim(Fornecedor_Nome.Text)) = '*** REQUISIÇÃO INTERNA - (IBRASMAK) ***')) Then
                     Begin
                     Requisicao04.Visible := False;

                     Ampulheta();
                     Application.CreateForm(TFornecedor00,Fornecedor00);

                     Fornecedor00.Programa_Anterior.Text := 'Requisição-Alteração';
                     Fornecedor00.Fornecedor_Area.ItemIndex := 1;
                     Fornecedor00.BT_Procurar.Click;

                     Seta();
                     Fornecedor00.ShowModal;

                     Requisicao04.Visible := True;
                  End;

                  Ampulheta();

                  //*** Obtem os Valores ***

                  Vlr_Frete         := Trim(Virgula_Ponto(Valor_Frete.Text));
                  Vlr_Desconto      := Trim(Virgula_Ponto(Valor_Desconto.Text));
                  Vlr_Pedido        := Trim(Virgula_Ponto(Valor_Pedido.Text));
                  Vlr_IPI           := Trim(Virgula_Ponto(Valor_IPI.Text));
                  Vlr_Total         := Trim(Virgula_Ponto(Valor_Total.Text));

                  Cond_Pgto_1       := Trim(Requisicao_Condicao_Pgto_1.Text);
                  Cond_Pgto_2       := Trim(Requisicao_Condicao_Pgto_2.Text);
                  Cond_Pgto_3       := Trim(Requisicao_Condicao_Pgto_3.Text);
                  Cond_Pgto_4       := Trim(Requisicao_Condicao_Pgto_4.Text);

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

                  If Trim(Vlr_IPI) = '' Then
                     Begin
                     Vlr_IPI := '0';
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

                  //*** Insere o Pedido Principal ***

                  Comando_SQL := 'Insert into fb_cotacoes(';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_grupo, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_fornecedor, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_fornecedor_descricao, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_data, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_vlr_total, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_vendedor, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_orcamento_nro, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_prazo_entrega, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_desconto, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_funcionario, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_cond_pgto_1, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_cond_pgto_2, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_cond_pgto_3, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_cond_pgto_4, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_frete, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_status, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_requisicao, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_opcao, ';
                  Comando_SQL := Comando_SQL + 'fb_cotacao_empresa) ';
                  Comando_SQL := Comando_SQL + ' Values(';
                  Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Grupo.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Numero.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Nome.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Vlr_Total + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Vendedor.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Orcamento.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Prazo.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Vlr_Desconto + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + '' + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Cond_Pgto_1 + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Cond_Pgto_2 + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Cond_Pgto_3 + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Cond_Pgto_4 + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Vlr_Frete + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + 'Cotada' + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(Nro_Requisicao.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Opcao.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Empresa.Text) + #39 + ')';

                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;

                  //*** Obtem Número do Pedido ***

                  ConexaoBD.SQL_Cotacao.Close;
                  ConexaoBD.SQL_Cotacao.SQL.Clear;
                  ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Order By fb_cotacao_nro Desc');
                  ConexaoBD.SQL_Cotacao.Open;

                  conexaoBD.SQL_Cotacao.First;

                  Nro_Cotacao := conexaoBD.SQL_Cotacaofb_cotacao_nro.Text;

                  // **** Altera Status da Requisição
                  If Trim(Requisicao_Status.Text) = 'Requisição' Then
                      Requisicao_Status.Text := 'Cotada';
            {      If Trim(Requisicao_Status.Text) = 'Requisição' Then
                      Requisicao_Status.Text := 'CT '+Nro_Cotacao
                  Else
                      Requisicao_Status.Text := Requisicao_Status.Text+' | '+Nro_Cotacao;
             }

                  Comando_SQL := 'Update fb_requisicoes Set ';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_grupo = ' + #39 + Trim(Requisicao_Grupo.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_fornecedor = ' + #39 + Trim(Fornecedor_Numero.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_fornecedor_descricao = ' + #39 + Trim(Fornecedor_Nome.Text) + #39 + ',';
                  //Comando_SQL := Comando_SQL + 'fb_requisicao_data = ' + #39 + Inverte_Data_Plus(Trim(Requisicao_Data.Text),'amd','/') + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_vlr_total = ' + #39 + Vlr_Total + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_vendedor = ' + #39 + Trim(Requisicao_Vendedor.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_orcamento_nro = ' + #39 + Trim(Requisicao_Orcamento.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_prazo_entrega = ' + #39 + Trim(Requisicao_Prazo.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_desconto = ' + #39 + Vlr_Desconto + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_funcionario = ' + #39 + Trim(Requisicao_Funcionario.Text) + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_1 = ' + #39 + Cond_Pgto_1 + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_2 = ' + #39 + Cond_Pgto_2 + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_3 = ' + #39 + Cond_Pgto_3 + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_4 = ' + #39 + Cond_Pgto_4 + #39 + ',';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_status = ' + #39 + Trim(Requisicao_Status.Text) + #39 + ', ';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_opcao = ' + #39 + Trim(Requisicao_Opcao.Text) + #39 + ', ';
                  Comando_SQL := Comando_SQL + 'fb_requisicao_frete = ' + #39 + Vlr_Frete + #39 + ' ';
                  Comando_SQL := Comando_SQL + ' Where fb_requisicao_nro = ' + #39 + Trim(Nro_Requisicao.Text)+#39;

                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;

                  //*** Insere os Produtos da Cotação ***

                  For Ind := 1 To SGD_Produtos.RowCount Do
                      Begin

                      Valor_Inteiro := Trim(SGD_Produtos.Cells[0,Ind]);

                      If Trim(Valor_Inteiro) = '' Then
                         Begin
                         Valor_Inteiro := '0';
                      End;

                      If StrToFloat(Valor_Inteiro) > 0 Then
                         Begin
                         Comando_SQL := 'Insert into fb_cotacoes_produtos(';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_cotacao, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_codigo, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_referencia, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_descricao, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_qtde, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_valor_unitario, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_valor_total, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_valor_ipi, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_unidade, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_desenho, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_os, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_equipamento, ';
                         Comando_SQL := Comando_SQL + 'fb_cotacao_produto_material) ';
                         Comando_SQL := Comando_SQL + ' Values(';
                         Comando_SQL := Comando_SQL + #39 + Trim(Nro_Cotacao) + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[1,Ind]) + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[3,Ind]) + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[0,Ind])) + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + '0' + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + '0' + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind])) + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[4,Ind])) + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[9,Ind])) + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[10,Ind])) + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[11,Ind])) + #39 + ',';
                         Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[12,Ind])) + #39 + ')';

                         ConexaoBD.SQL_Comunitario.SQL.Clear;
                         ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Comunitario.ExecSQL;
                      End;
                  End;

                  Seta();

                  MSG_Erro('Nova Cotação de Nro.: ' + Trim(Nro_Cotacao) + '. Adicionada.');
               End;
           End;

           Requisicao04.Close;
        End;
     End;
end;

procedure TRequisicao04.BT_NovoClick(Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        SGD_Produtos.Refresh;

        Application.CreateForm(TNovoProdutoFornecedor00,NovoProdutoFornecedor00);

        NovoProdutoFornecedor00.Produto_Fornecedor.Text := Fornecedor_Numero.Text;

        NovoProdutoFornecedor00.ShowModal;
        NovoProdutoFornecedor00.Destroy;

        SGD_Produtos.Refresh;
        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Fornecedor');
     End;
end;


procedure TRequisicao04.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     ConexaoBD.SQL_Requisicao.Close;
     ConexaoBD.SQL_Requisicao.SQL.Clear;
     ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Order By fb_requisicao_nro Desc');
     ConexaoBD.SQL_Requisicao.Open;

     ConexaoBD.SQL_Requisicao.Locate('fb_requisicao_nro',Trim(Selecionado),[]);

     Action := caFree;
     Release;
     Requisicao04 := Nil;
end;

procedure TRequisicao04.BT_Adicionar_CompradosClick(Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        Ampulheta();

        SGD_Produtos.Refresh;

        Application.CreateForm(TRelacaoProdutoComprado00,RelacaoProdutoComprado00);

        RelacaoProdutoComprado00.Programa_Anterior.Text     := 'Requisição-Alteração';
        RelacaoProdutoComprado00.Nro_Fornecedor.Text        := Trim(Fornecedor_Numero.Text);
        RelacaoProdutoComprado00.BT_Imprimir.Visible        := False;
        RelacaoProdutoComprado00.Lista_Fornecedores.Enabled := False;

        Seta();
        RelacaoProdutoComprado00.ShowModal;

        SGD_Produtos.Refresh;
        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Fornecedor');
     End;
end;

procedure TRequisicao04.Requisicao_StatusKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_EmpresaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_Previsao_EntregaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_SolicitanteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_PlanejamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_Centro_CustoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_ObsKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_EquipamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_OSKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao04.Requisicao_StatusExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_EmpresaExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_Previsao_EntregaExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_SolicitanteExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_PlanejamentoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_Centro_CustoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_ObsExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_EquipamentoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_OSExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_Observacao_TabulacaoExit(
  Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao04.Requisicao_Observacao_TabulacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
end.
