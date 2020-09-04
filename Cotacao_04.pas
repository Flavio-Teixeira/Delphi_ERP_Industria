unit Cotacao_04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Grids, Buttons, ExtCtrls;

type
  TCotacao04 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Cliente_Codigo: TEdit;
    Cotacao_Grupo: TEdit;
    Cotacao_Descricao: TEdit;
    Fornecedor_Observacoes: TMemo;
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
    Cotacao_Condicao_Pgto_1: TEdit;
    Cotacao_Prazo: TEdit;
    Cotacao_Vendedor: TEdit;
    Cotacao_Orcamento: TEdit;
    Cotacao_Funcionario: TEdit;
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
    Label11: TLabel;
    Nro_Cotacao: TEdit;
    BT_Alterar_Pedidos: TBitBtn;
    BT_Excluir: TBitBtn;
    Gerar_Nota: TBitBtn;
    Gerar_Arquivo: TBitBtn;
    Enviar_Email: TBitBtn;
    BT_Novo: TButton;
    Label25: TLabel;
    Cotacao_Opcao: TComboBox;
    Cotacao_Data: TEdit;
    Label18: TLabel;
    BT_Adicionar_Comprados: TBitBtn;
    edNroRequisicao: TEdit;
    Cotacao_Status: TComboBox;
    Programa_Anterior: TEdit;
    Cotacao_Empresa: TComboBox;
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
    procedure Cotacao_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure Cotacao_VendedorKeyPress(Sender: TObject; var Key: Char);
    procedure Cotacao_OrcamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Cotacao_PrazoKeyPress(Sender: TObject; var Key: Char);
    procedure Cotacao_Condicao_Pgto_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cotacao_Condicao_Pgto_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cotacao_Condicao_Pgto_3KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cotacao_Condicao_Pgto_4KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cotacao_Status1KeyPress(Sender: TObject; var Key: Char);
    procedure Cotacao_FuncionarioExit(Sender: TObject);
    procedure Cotacao_VendedorExit(Sender: TObject);
    procedure Cotacao_OrcamentoExit(Sender: TObject);
    procedure Cotacao_PrazoExit(Sender: TObject);
    procedure Cotacao_Condicao_Pgto_1Exit(Sender: TObject);
    procedure Cotacao_Condicao_Pgto_2Exit(Sender: TObject);
    procedure Cotacao_Condicao_Pgto_3Exit(Sender: TObject);
    procedure Cotacao_Condicao_Pgto_4Exit(Sender: TObject);
    procedure Cotacao_Status1Exit(Sender: TObject);
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
  Cotacao04: TCotacao04;
  Clicou_Imprimir: Boolean;
  Qtde_Produtos_Selecionados: Integer;
  Ctrl_Estoque: Boolean;
  Nro_Ctrl_Estoque: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Fornecedor_00, Fornecedor_02,
  Adiciona_Produto_Relacao, Adiciona_Qtde_Produto, Cria_PDF,
  Novo_Produto_Fornecedor_00, Cotacao_02, Relacao_Produto_Comprado_00,
  Adiciona_Produto_Relacao_02, Motivo_Cancelamento_00, Ibrasmak_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TCotacao04.Valida_Dados(): Boolean;

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

     If Trim(Fornecedor_Numero.Text) = '' Then
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

procedure TCotacao04.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TCotacao04.FormShow(Sender: TObject);

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

    Totaliza_Pedido();
end;

procedure TCotacao04.Exibe_Grid_Produtos();

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
         SGD_Produtos.Cells[13,Ind] := '';
         SGD_Produtos.Cells[14,Ind] := '';
     End;

     //*** Continua o Carregamento Normal ***

     ConexaoBD.SQL_Cotacao_Produto.Close;
     ConexaoBD.SQL_Cotacao_Produto.SQL.Clear;
     ConexaoBD.SQL_Cotacao_Produto.SQL.Add('Select * from fb_cotacoes_produtos Where fb_cotacao_produto_cotacao = ' + Trim(Nro_Cotacao.Text) + ' Order By fb_cotacao_produto_codigo');
     ConexaoBD.SQL_Cotacao_Produto.Open;

     If ConexaoBD.SQL_Cotacao_Produto.RecordCount > 0 Then
        Begin
        SGD_Produtos.RowCount  := 2;
        SGD_Produtos.Refresh;

        SGD_Produtos.RowCount  := (ConexaoBD.SQL_Cotacao_Produto.RecordCount + 2);
        SGD_Produtos.FixedRows := 1;
        Ind := 0;

        ConexaoBD.SQL_Cotacao_Produto.First;

        While Not ConexaoBD.SQL_Cotacao_Produto.Eof Do
              Begin
              Ind := Ind + 1;

              SGD_Produtos.Cells[0,Ind] := ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_qtde.Text;
              SGD_Produtos.Cells[1,Ind] := ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_codigo.Text;
              SGD_Produtos.Cells[2,Ind] := ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_referencia.Text;
              SGD_Produtos.Cells[3,Ind] := ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_descricao.Text;

              SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_unidade.Text;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:5,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              SGD_Produtos.Cells[5,Ind] := Vlr_Exibicao;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_total.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              SGD_Produtos.Cells[6,Ind] := Vlr_Exibicao;
              SGD_Produtos.Cells[7,Ind] := '0';
              SGD_Produtos.Cells[8,Ind] := ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text;

              SGD_Produtos.Cells[9,Ind]  := ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_desenho.Text;
              SGD_Produtos.Cells[10,Ind] := ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_os.Text;
              SGD_Produtos.Cells[11,Ind] := ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_equipamento.Text;
              SGD_Produtos.Cells[12,Ind] := ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_material.Text;
              SGD_Produtos.Cells[13,Ind] := IntToStr(Ind);

              SGD_Produtos.Cells[14,Ind] := ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_prazo_entrega.Text;

              ConexaoBD.SQL_Cotacao_Produto.Next;
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
     SGD_Produtos.ColWidths[3] := 185;

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

     //*** Item ***
     SGD_Produtos.Cells[13,0]   := 'Item';
     SGD_Produtos.ColWidths[13] := 25;

     //*** Prazo de Entrega ***
     SGD_Produtos.Cells[14,0]   := 'Prazo de Entrega';
     SGD_Produtos.ColWidths[14] := 90;

     Seta();
end;

procedure TCotacao04.BT_SairClick(Sender: TObject);
begin
     Cotacao04.Close;
end;

procedure TCotacao04.Totaliza_Pedido();

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

procedure TCotacao04.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        Application.CreateForm(TMotivoCancelamento00,MotivoCancelamento00);

        MotivoCancelamento00.OS_Numero.Text            := Nro_Cotacao.Text;
        MotivoCancelamento00.OS_CNPJ.Text              := Fornecedor_Numero.Text;
        MotivoCancelamento00.OS_Titulo.Text            := 'Cancelamento de Cotação';
        MotivoCancelamento00.OS_DataCriacao.Text       := Cotacao_Data.Text;
        MotivoCancelamento00.OS_Tipo_os.Text           := 'Cotação';
        MotivoCancelamento00.Edit_Operador.Text        := Ibrasmak00.Login.Text;

        Seta();

        MotivoCancelamento00.ShowModal;
        MotivoCancelamento00.Destroy;

        Ampulheta();

        //*** Deleta a Cotação Principal ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_cotacoes Where fb_cotacao_nro = ' +  Trim(Nro_Cotacao.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Deleta os Itens da Cotação Principal ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_cotacoes_produtos Where fb_cotacao_produto_cotacao = ' +  Trim(Nro_Cotacao.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Cotacao04.Close;
     End;
end;

procedure TCotacao04.BT_ProcurarClick(Sender: TObject);
begin
     Cotacao04.Visible := False;

     Ampulheta();
     Application.CreateForm(TFornecedor00,Fornecedor00);

     Fornecedor00.Programa_Anterior.Text := 'Cotação-Alteração';
     Fornecedor00.Fornecedor_Area.ItemIndex := 1;
     Fornecedor00.BT_Procurar.Click;

     Seta();
     Fornecedor00.ShowModal;
     //Fornecedor00.Destroy;

     Cotacao04.Visible := True;
end;

procedure TCotacao04.BT_AlterarClick(Sender: TObject);

var
   Codigo_Fornecedor: String;

begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        cotacao04.Visible := False;

        Ampulheta();
        Application.CreateForm(TFornecedor02,Fornecedor02);

        Fornecedor02.Programa_Anterior.Text := 'Cotação-Alteração';

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

        Cotacao04.Visible := True;
        End
     Else
        Begin
        MSG_Erro('É Necessário informar um Fornecedor antes de alterar os dados cadastrais do mesmo');
     End;
end;

procedure TCotacao04.BT_AdicionarClick(Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        Ampulheta();

        SGD_Produtos.Refresh;

        Application.CreateForm(TAdicionaProdutoRelacao02,AdicionaProdutoRelacao02);

        AdicionaProdutoRelacao02.Programa_Anterior.Text := 'Cotação-Alteração';
        AdicionaProdutoRelacao02.Nro_Fornecedor.Text    := Trim(Fornecedor_Numero.Text);

        Seta();
        AdicionaProdutoRelacao02.ShowModal;
        AdicionaProdutoRelacao02.Destroy;

        SGD_Produtos.Refresh;
        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Fornecedor');
     End;
end;

procedure TCotacao04.SGD_ProdutosDblClick(Sender: TObject);

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

        AdicionaQtdeProduto.Programa_Anterior.Text       := 'Cotação-Alteração';
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

        AdicionaQtdeProduto.Adiciona_Prazo_Entrega.Text  := SGD_Produtos.Cells[14,SGD_Produtos.Row];
        
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

procedure TCotacao04.BT_Alterar_PedidosClick(Sender: TObject);

var
   Comando_SQL, Emite_Lote, Transportadora, Valor_Inteiro: String;
   Vlr_Frete, Vlr_IPI, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4: String;
   Ind, Linha: Integer;

begin
     If Valida_Dados() Then
        Begin

        Ampulheta();

        //*** Obtem os Valores ***

        Vlr_Frete         := Trim(Virgula_Ponto(Valor_Frete.Text));
        Vlr_Desconto      := Trim(Virgula_Ponto(Valor_Desconto.Text));
        Vlr_Pedido        := Trim(Virgula_Ponto(Valor_Pedido.Text));
        Vlr_IPI           := Trim(Virgula_Ponto(Valor_IPI.Text));
        Vlr_Total         := Trim(Virgula_Ponto(Valor_Total.Text));

        Cond_Pgto_1       := Trim(Cotacao_Condicao_Pgto_1.Text);

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

        //*** Altera o Pedido Principal ***

        Comando_SQL := 'Update fb_cotacoes Set ';
        Comando_SQL := Comando_SQL + 'fb_cotacao_grupo = ' + Trim(Cotacao_Grupo.Text) + ',';
        Comando_SQL := Comando_SQL + 'fb_cotacao_fornecedor = ' + Trim(Fornecedor_Numero.Text) + ',';
        Comando_SQL := Comando_SQL + 'fb_cotacao_fornecedor_descricao = ' + #39 + Trim(Fornecedor_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_cotacao_data = ' + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_cotacao_vlr_total = ' + Vlr_Total + ',';
        Comando_SQL := Comando_SQL + 'fb_cotacao_vendedor = ' + #39 + Trim(Cotacao_Vendedor.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_cotacao_orcamento_nro = ' + #39 + Trim(Cotacao_Orcamento.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_cotacao_prazo_entrega = ' + #39 + Trim(Cotacao_Prazo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_cotacao_desconto = ' + Vlr_Desconto + ',';
        Comando_SQL := Comando_SQL + 'fb_cotacao_funcionario = ' + #39 + Trim(Cotacao_Funcionario.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_cotacao_cond_pgto_1 = ' + #39 + Trim(Cond_Pgto_1) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_cotacao_status = ' + #39 + Trim(Cotacao_Status.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_cotacao_opcao = ' + #39 + Trim(Cotacao_Opcao.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_cotacao_frete = ' + Vlr_Frete + ', ';
        Comando_SQL := Comando_SQL + 'fb_cotacao_empresa = ' + #39 + Trim(Cotacao_Empresa.Text) + #39 + ' ';
        Comando_SQL := Comando_SQL + ' Where fb_cotacao_nro = ' + Trim(Nro_Cotacao.Text);

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Apaga os Itens da Cotação ***

        Comando_SQL := 'Delete from fb_cotacoes_produtos Where fb_cotacao_produto_cotacao = ' + Trim(Nro_Cotacao.Text);

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
               Comando_SQL := Comando_SQL + 'fb_cotacao_produto_material, ';
               Comando_SQL := Comando_SQL + 'fb_cotacao_produto_prazo_entrega) ';

               Comando_SQL := Comando_SQL + ' Values(';
               Comando_SQL := Comando_SQL + Trim(Nro_Cotacao.Text) + ',';
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
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[12,Ind])) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(SGD_Produtos.Cells[14,Ind]),'amd','/') + #39 + ')';

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

procedure TCotacao04.Valor_PedidoKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Valor_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Valor_FreteKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Valor_IPIKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Valor_TotalKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Cotacao_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Cotacao_VendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Cotacao_OrcamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Cotacao_PrazoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Cotacao_Condicao_Pgto_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Cotacao_Condicao_Pgto_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Cotacao_Condicao_Pgto_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Cotacao_Condicao_Pgto_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Cotacao_Status1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao04.Cotacao_FuncionarioExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Cotacao_VendedorExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Cotacao_OrcamentoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Cotacao_PrazoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Cotacao_Condicao_Pgto_1Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Cotacao_Condicao_Pgto_2Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Cotacao_Condicao_Pgto_3Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Cotacao_Condicao_Pgto_4Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Cotacao_Status1Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Valor_PedidoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Valor_DescontoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Valor_FreteExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Valor_IPIExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Valor_TotalExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao04.Gerar_ArquivoClick(Sender: TObject);

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

procedure TCotacao04.Criar_PDF(Opcao, Posicao_Ini, Posicao_Fim, Pagina_Ini, Pagina_Fim: String);

var
   Ind, Posicao: Integer;
   Cond_Pgto, Vlr_Exibicao: string;
   Vlr_Numero: Real;

begin
  Ampulheta();

  Application.CreateForm(TCriaPDF,CriaPDF);

  If Trim(Cotacao_Empresa.Text) = 'IBRASMAK' Then
     Begin
     CriaPDF.Empresa_01.Caption := 'IBRASMAK';
     CriaPDF.Empresa_02.Caption := '';

     CriaPDF.Endereco_01.Caption := 'IBRASMAK IND. BRASILEIRA DE MÁQUINAS LTDA';
     CriaPDF.Endereco_02.Caption := 'CNPJ: 47.139.456/0001-09                      IE: 581.034.396.119';
     CriaPDF.Endereco_03.Caption := 'ESTRADA DE SAPOPEMBA, 159 KM 45 - CEP 09432-300 -  RIBEIRÃO PIRES - SP';
     CriaPDF.Endereco_04.Caption := 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700';
     CriaPDF.Endereco_05.Caption := 'e-mail: compras@ibrasmak.com.br';
     End
  Else If Trim(Cotacao_Empresa.Text) = 'MONIBRAS' Then
     Begin
     CriaPDF.Empresa_01.Caption := 'MONIBRAS';
     CriaPDF.Empresa_02.Caption := '';

     CriaPDF.Endereco_01.Caption := 'MONIBRAS MÁQUINAS E EQUIPAMENTOS LTDA';
     CriaPDF.Endereco_02.Caption := 'CNPJ: 04.449.820/0001-16                      IE: 581.128.318.116';
     CriaPDF.Endereco_03.Caption := 'ESTRADA DE SAPOPEMBA, 149 KM 45 - CEP 09432-300 -  RIBEIRÃO PIRES - SP';
     CriaPDF.Endereco_04.Caption := 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700';
     CriaPDF.Endereco_05.Caption := 'e-mail: compras@ibrasmak.com.br';
     End
  Else If Trim(Cotacao_Empresa.Text) = 'FERRAMENTARIA' Then
     Begin
     CriaPDF.Empresa_01.Caption := 'IBRASMAK';
     CriaPDF.Empresa_02.Caption := '(FERRAMENTARIA)';

     CriaPDF.Endereco_01.Caption := 'IBRASMAK IND. BRASILEIRA DE MÁQUINAS LTDA';
     CriaPDF.Endereco_02.Caption := 'CNPJ: 47.139.456/0001-09                      IE: 581.034.396.119';
     CriaPDF.Endereco_03.Caption := 'ESTRADA DE SAPOPEMBA, 159 KM 45 - CEP 09432-300 -  RIBEIRÃO PIRES - SP';
     CriaPDF.Endereco_04.Caption := 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700';
     CriaPDF.Endereco_05.Caption := 'e-mail: compras@ibrasmak.com.br';
  End;

  CriaPDF.PRL_Paginacao.Caption := 'PÁGINA ' + Trim(Pagina_Ini) + ' DE ' + Trim(Pagina_Fim);
  CriaPDF.LBL_Ini.Caption       := Trim(Pagina_Ini);
  CriaPDF.LBL_Fim.Caption       := Trim(Pagina_Fim);

  CriaPDF.Opcao_Anterior.Text := Opcao;
  CriaPDF.Cliente_Email.Text  := Fornecedor_Email.Text;
  CriaPDF.Nro_Cotacao.Text    := Nro_Cotacao.Text;

  CriaPDF.PRL_Cotacao_Nro.Caption  := Trim(Nro_Cotacao.Text);
  CriaPDF.PRL_Data_Cotacao.Caption := Trim(Cotacao_Data.Text);
  CriaPDF.PRL_Nome.Caption         := Copy(Trim(Fornecedor_Nome.Text),1,60);
  CriaPDF.PRL_Contato.Caption      := Trim(Cotacao_Vendedor.Text);

  CriaPDF.PRL_Desconto.Caption     := Trim(Valor_Desconto.Text);

  If Trim(Fornecedor_Fone_Comercial.Text) <> '' Then
     Begin
     CriaPDF.PRL_Fone_1.Caption   := Trim(Fornecedor_Fone_Comercial.Text);
     End
  Else If Trim(Fornecedor_Fone_Celular.Text) <> '' Then
     Begin
     CriaPDF.PRL_Fone_1.Caption   := Trim(Fornecedor_Fone_Celular.Text);
  End;

  CriaPDF.PRL_Fax.Caption         := Trim(Fornecedor_Fone_Fax.Text);

  If Trim(Cotacao_Condicao_Pgto_1.Text) <> '' Then
     Begin
     Cond_Pgto := Trim(Cotacao_Condicao_Pgto_1.Text);
  End;

  Cond_Pgto := Cond_Pgto;

  CriaPDF.PRL_Pagamento.Caption := Trim(Cond_Pgto);
  CriaPDF.PRL_Entrega.Caption   := Trim(Cotacao_Prazo.Text);


  If Trim(Valor_Frete.Text) <> '0,00' Then
     Begin
     CriaPDF.PRL_Frete.Caption    := Trim(Valor_Frete.Text);
     End
  Else
     Begin
     CriaPDF.PRL_Frete.Caption    := '';
  End;

  CriaPDF.PRL_Validade.Caption := '';
  CriaPDF.PRL_OBS1.Caption     := '';
  CriaPDF.PRL_OBS2.Caption     := '';

  //*** Coloca os Itens no PDF ***

  Posicao := StrToInt(Posicao_Fim);

  For Ind := StrToInt(Posicao_Ini) To Posicao Do
      Begin
      If Ind = 1 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
           Begin

           CriaPDF.PRL_Item_01.Caption  := IntToStr(Ind);
           CriaPDF.PRL_Qtde_01.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
           CriaPDF.PRL_Desc_01.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

           If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
              Begin
              Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              CriaPDF.PRL_IPI_01.Caption  := Ponto_Virgula(Vlr_Exibicao);
              End
           Else
              Begin
              CriaPDF.PRL_IPI_01.Caption  := '';
           End;

           If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
              Begin
              CriaPDF.PRL_Unit_01.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
              End
           Else
              Begin
              CriaPDF.PRL_Unit_01.Caption  := '';
           End;

           If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
              Begin
              CriaPDF.PRL_Total_01.Caption := SGD_Produtos.Cells[6,Ind];
              End
           Else
              Begin
              CriaPDF.PRL_Total_01.Caption := '';
           End;

           If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
              Begin
              CriaPDF.PRL_Prazo_Entrega_01.Caption := '';
              End
           Else
              Begin
              CriaPDF.PRL_Prazo_Entrega_01.Caption := SGD_Produtos.Cells[14,Ind];
           End;

           //CriaPDF.PRL_OS_01.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 2 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_02.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_02.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_02.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_02.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_02.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_02.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_02.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_02.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_02.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_02.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_02.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_02.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 3 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_03.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_03.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_03.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_03.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_03.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_03.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_03.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_03.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_03.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_03.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_03.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_03.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 4 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_04.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_04.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_04.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_04.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_04.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_04.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_04.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_04.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_04.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_04.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_04.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_04.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 5 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_05.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_05.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_05.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_05.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_05.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_05.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_05.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_05.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_05.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_05.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_05.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_05.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 6 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_06.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_06.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_06.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_06.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_06.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_06.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_06.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_06.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_06.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_06.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_06.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_06.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 7 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_07.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_07.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_07.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_07.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_07.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_07.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_07.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_07.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_07.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_07.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_07.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_07.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 8 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_08.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_08.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_08.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_08.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_08.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_08.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_08.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_08.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_08.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_08.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_08.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_08.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 9 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_09.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_09.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_09.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_09.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_09.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_09.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_09.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_09.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_09.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_09.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_09.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_09.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 10 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_10.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_10.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_10.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_10.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_10.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_10.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_10.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_10.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_10.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_10.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_10.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_10.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 11 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_11.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_11.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_11.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_11.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_11.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_11.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_11.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_11.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_11.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_11.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_11.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_11.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 12 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_12.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_12.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_12.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_12.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_12.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_12.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_12.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_12.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_12.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_12.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_12.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_12.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 13 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_13.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_13.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_13.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_13.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_13.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_13.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_13.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_13.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_13.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_13.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_13.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_13.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 14 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_14.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_14.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_14.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_14.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_14.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_14.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_14.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_14.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_14.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_14.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_14.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_14.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 15 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_15.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_15.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_15.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_15.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_15.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_15.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_15.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_15.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_15.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_15.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_15.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_15.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 16 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_16.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_16.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_16.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_16.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_16.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_16.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_16.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_16.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_16.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_16.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_16.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_16.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 17 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_17.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_17.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_17.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_17.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_17.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_17.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_17.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_17.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_17.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_17.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_17.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_17.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 18 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_18.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_18.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_18.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_18.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_18.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_18.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_18.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_18.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_18.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_18.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_18.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_18.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 19 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_19.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_19.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_19.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_19.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_19.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_19.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_19.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_19.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_19.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_19.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_19.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_19.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 20 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_20.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_20.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_20.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_20.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_20.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_20.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_20.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_20.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_20.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_20.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_20.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_20.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 21 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_21.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_21.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_21.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_21.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_21.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_21.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_21.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_21.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_21.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_21.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_21.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_21.Caption := SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If Ind = 22 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF.PRL_Item_22.Caption  := IntToStr(Ind);
         CriaPDF.PRL_Qtde_22.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         CriaPDF.PRL_Desc_22.Caption  := Copy(Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]),1,100);

         If StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) > 0 Then
            Begin
            Vlr_Numero := ((StrToFloat(Trim(SGD_Produtos.Cells[8,Ind])) * StrToFloat(Trim(SGD_Produtos.Cells[6,Ind]))) / 100);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            CriaPDF.PRL_IPI_22.Caption  := Ponto_Virgula(Vlr_Exibicao);
            End
         Else
            Begin
            CriaPDF.PRL_IPI_22.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Unit_22.Caption  := Zera_Centavos(SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaPDF.PRL_Unit_22.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            CriaPDF.PRL_Total_22.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaPDF.PRL_Total_22.Caption := '';
         End;

         If Trim(SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaPDF.PRL_Prazo_Entrega_22.Caption := '';
            End
         Else
            Begin
            CriaPDF.PRL_Prazo_Entrega_22.Caption := SGD_Produtos.Cells[14,Ind];
         End;

         //CriaPDF.PRL_OS_22.Caption := SGD_Produtos.Cells[10,Ind];

         End;

      End;
  End;

  //*** Coloca o Valor no PDF ***

  If Trim(Valor_IPI.Text) <> '0,00' Then
     Begin
     CriaPDF.PRL_VlrIPI.Caption := Trim(Valor_IPI.Text);
     End
  Else
     Begin
     CriaPDF.PRL_VlrIPI.Caption := '';
  End;

  If Trim(Valor_Total.Text) <> '0,00' Then
     Begin
     CriaPDF.PRL_VlrTotal.Caption := Trim(Valor_Total.Text);
     End
  Else
     Begin
     CriaPDF.PRL_VlrTotal.Caption := '';
  End;

  CriaPDF.PRL_Funcionario.Caption := Trim(Cotacao_Funcionario.Text);

  //*** Exibe o PDF ***

  Seta();

  CriaPDF.ShowModal;
  CriaPDF.Destroy;
end;

Procedure TCotacao04.Enviar_EmailClick(Sender: TObject);

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

procedure TCotacao04.Gerar_NotaClick(Sender: TObject);

var
   Comando_SQL, Emite_Lote, Transportadora, Valor_Inteiro: String;
   Vlr_Frete, Vlr_IPI, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4: String;
   Nro_Ordem: String;
   Ind, Linha: Integer;

begin
     If Confirma('Você deseja realmente gerar uma Ordem de Compra para esta Cotação?') = 6 Then
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

           Cond_Pgto_1       := Trim(Cotacao_Condicao_Pgto_1.Text);

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
           Comando_SQL := Comando_SQL + 'fb_ordem_frete, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_status, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_requisicao, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_cotacao, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_opcao, ';
           Comando_SQL := Comando_SQL + 'fb_ordem_empresa) ';
           Comando_SQL := Comando_SQL + ' Values(';
           Comando_SQL := Comando_SQL + Trim(Fornecedor_Numero.Text) + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Nome.Text) + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';
           Comando_SQL := Comando_SQL + Vlr_Total + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Cotacao_Vendedor.Text) + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Cotacao_Orcamento.Text) + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Cotacao_Prazo.Text) + #39 + ',';
           Comando_SQL := Comando_SQL + Vlr_Desconto + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Cotacao_Funcionario.Text) + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Cond_Pgto_1) + #39 + ',';
           Comando_SQL := Comando_SQL + Vlr_Frete + ',';
           Comando_SQL := Comando_SQL + #39 + 'Em Aberto' + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + edNroRequisicao.Text + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Nro_Cotacao.Text + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Cotacao_Opcao.Text) + #39 + ',';
           Comando_SQL := Comando_SQL + #39 + Trim(Cotacao_Empresa.Text) + #39 + ')';

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
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_unidade, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_desenho, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_os, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_equipamento, ';
                  Comando_SQL := Comando_SQL + 'fb_ordem_produto_material) ';
                  Comando_SQL := Comando_SQL + ' Values(';
                  Comando_SQL := Comando_SQL + Trim(Nro_Ordem) + ',';
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

           //*** Altera o Status da Cotação ***

           Comando_SQL := 'Update fb_cotacoes Set ';
           Comando_SQL := Comando_SQL + 'fb_cotacao_status = ' + #39 + 'OC - Nro.: ' + Trim(Nro_Ordem) + #39 + ' ';
           Comando_SQL := Comando_SQL + 'Where fb_cotacao_nro = ' + Trim(Nro_Cotacao.Text);

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           Seta();

           MSG_Erro('Ordem de Compra de Nro.: ' + Trim(Nro_Ordem) + '. Gerada com Sucesso.');

           Cotacao04.Close;
        End;
     End;
end;

procedure TCotacao04.BT_NovoClick(Sender: TObject);
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


procedure TCotacao04.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     If Trim(Programa_Anterior.Text) = '' Then
        Begin
        ConexaoBD.SQL_Cotacao.Close;
        ConexaoBD.SQL_Cotacao.SQL.Clear;
        ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Order By fb_cotacao_data Desc, fb_cotacao_nro Desc');
        ConexaoBD.SQL_Cotacao.Open;

        ConexaoBD.SQL_Cotacao.Locate('fb_cotacao_nro',Trim(Selecionado),[]);
     End;

     Action := caFree;
     Release;
     Cotacao04 := Nil;
end;

procedure TCotacao04.BT_Adicionar_CompradosClick(Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        Ampulheta();

        SGD_Produtos.Refresh;

        Application.CreateForm(TRelacaoProdutoComprado00,RelacaoProdutoComprado00);

        RelacaoProdutoComprado00.Programa_Anterior.Text     := 'Cotação-Alteração';
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

end.
