unit Cotacao_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImpMat, Grids, Mask, StdCtrls, DBCtrls, Buttons, ExtCtrls;

type
  TCotacao03 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Cliente_Codigo: TEdit;
    Cotacao_Grupo: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    GroupBox7: TGroupBox;
    Label47: TLabel;
    Cotacao_Condicao_Pgto_1: TEdit;
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
    Cotacao_Descricao: TEdit;
    Cotacao_Data: TEdit;
    Label21: TLabel;
    Fornecedor_Numero: TEdit;
    Fornecedor_Observacoes: TMemo;
    Label4: TLabel;
    Cotacao_Prazo: TEdit;
    Label9: TLabel;
    Cotacao_Vendedor: TEdit;
    Label12: TLabel;
    Cotacao_Orcamento: TEdit;
    Label14: TLabel;
    Cotacao_Funcionario: TEdit;
    Label8: TLabel;
    BT_Novo: TButton;
    Label25: TLabel;
    Cotacao_Opcao: TComboBox;
    BT_Adicionar_Comprados: TBitBtn;
    Cotacao_Status: TComboBox;
    Cotacao_Empresa: TComboBox;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_AdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    procedure Cotacao_FuncionarioExit(Sender: TObject);
    procedure Cotacao_VendedorExit(Sender: TObject);
    procedure Cotacao_OrcamentoExit(Sender: TObject);
    procedure Cotacao_PrazoExit(Sender: TObject);
    procedure Cotacao_Condicao_Pgto_1Exit(Sender: TObject);
    procedure Cotacao_Condicao_Pgto_2Exit(Sender: TObject);
    procedure Cotacao_Condicao_Pgto_3Exit(Sender: TObject);
    procedure Cotacao_Condicao_Pgto_4Exit(Sender: TObject);
    procedure Valor_PedidoExit(Sender: TObject);
    procedure Valor_DescontoExit(Sender: TObject);
    procedure Valor_FreteExit(Sender: TObject);
    procedure Valor_IPIExit(Sender: TObject);
    procedure Valor_TotalExit(Sender: TObject);
    procedure SGD_ProdutosDblClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_NovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_Adicionar_CompradosClick(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;

    procedure Exibe_Grid_Produtos();
    procedure Totaliza_Pedido();

  public
    { Public declarations }
  end;

var
  Cotacao03: TCotacao03;
  Qtde_Produtos_Selecionados: Integer;
  Ctrl_Estoque: Boolean;
  Nro_Ctrl_Estoque: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Fornecedor_00, Fornecedor_02,
  Adiciona_Produto_Relacao, Adiciona_Qtde_Produto,
  Novo_Produto_Fornecedor_00, Relacao_Produto_Comprado_00,
  Adiciona_Produto_Relacao_02;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TCotacao03.Valida_Dados(): Boolean;

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

procedure TCotacao03.BT_SairClick(Sender: TObject);
begin
     Cotacao03.Close;
end;

procedure TCotacao03.BT_ProcurarClick(Sender: TObject);
begin
     Cotacao03.Visible := False;

     Ampulheta();
     Application.CreateForm(TFornecedor00,Fornecedor00);

     Fornecedor00.Programa_Anterior.Text := 'Cotação-Inclusao';
     Fornecedor00.Fornecedor_Area.ItemIndex := 1;
     Fornecedor00.BT_Procurar.Click;
     
     Seta();
     Fornecedor00.ShowModal;
     //Fornecedor00.Destroy;

     Cotacao03.Visible := True;
end;

procedure TCotacao03.BT_AlterarClick(Sender: TObject);

var
   Codigo_Fornecedor: String;

begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        cotacao03.Visible := False;

        Ampulheta();
        Application.CreateForm(TFornecedor02,Fornecedor02);

        Fornecedor02.Programa_Anterior.Text := 'Cotação-Inclusao';

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

        Cotacao03.Visible := True;
        End
     Else
        Begin
        MSG_Erro('É Necessário informar um Fornecedor antes de alterar os dados cadastrais do mesmo');
     End;
end;

procedure TCotacao03.BT_AdicionarClick(Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        Ampulheta();

        SGD_Produtos.Refresh;

        Application.CreateForm(TAdicionaProdutoRelacao02,AdicionaProdutoRelacao02);

        AdicionaProdutoRelacao02.Programa_Anterior.Text := 'Cotação-Inclusao';
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

procedure TCotacao03.FormShow(Sender: TObject);

var
   Ind: Integer;
   Qtde_Produto_Digitada: Boolean;
   Valor_Inteiro, Comando_SQL: String;

begin
     Ampulheta();

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

     Seta();
end;

procedure TCotacao03.Exibe_Grid_Produtos();

var
   Ind, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao: String;

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
     End;

     //*** Continua o Carregamento Normal ***

     ConexaoBD.SQL_FB_Produtos.Close;
     ConexaoBD.SQL_FB_Produtos.SQL.Clear;
     ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_pedido_padrao = '+#39+'S'+#39+' Order By fb_produto_codigo, fb_produto_descricao');
     ConexaoBD.SQL_FB_Produtos.Open;

     If ConexaoBD.SQL_FB_Produtos.RecordCount > 0 Then
        Begin
        SGD_Produtos.RowCount  := 2;
        SGD_Produtos.Refresh;

        SGD_Produtos.RowCount  := (ConexaoBD.SQL_FB_Produtos.RecordCount + 1);
        SGD_Produtos.FixedRows := 1;
        Ind := 0;

        ConexaoBD.SQL_FB_Produtos.First;

        While Not ConexaoBD.SQL_FB_Produtos.Eof Do
              Begin
              Ind := Ind + 1;

              SGD_Produtos.Cells[0,Ind] := '';
              SGD_Produtos.Cells[1,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_codigo.Text;
              SGD_Produtos.Cells[2,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_referencia.Text;
              SGD_Produtos.Cells[3,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_descricao.Text;
              SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_unidade.Text;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_FB_Produtosfb_produto_preco.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              SGD_Produtos.Cells[5,Ind] := Vlr_Exibicao;

              SGD_Produtos.Cells[6,Ind] := '';
              SGD_Produtos.Cells[7,Ind] := '';

              SGD_Produtos.Cells[8,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_ipi.Text;

              SGD_Produtos.Cells[9,Ind]  := ConexaoBD.SQL_FB_Produtosfb_produto_desenho.Text;
              SGD_Produtos.Cells[10,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_os.Text;
              SGD_Produtos.Cells[11,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_equipamento.Text;
              SGD_Produtos.Cells[12,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_material.Text;

              //SGD_Produtos.Cells[13,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_material.Text;

              ConexaoBD.SQL_FB_Produtos.Next;
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

     //*** Prazo de Entrega ***
     SGD_Produtos.Cells[13,0]   := 'Prazo de Entrega';
     SGD_Produtos.ColWidths[13] := 90;

     Seta();
end;

procedure TCotacao03.Valor_PedidoKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Valor_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Valor_FreteKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Valor_IPIKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Valor_TotalKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Cotacao_FuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Cotacao_VendedorKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Cotacao_OrcamentoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Cotacao_PrazoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Cotacao_Condicao_Pgto_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Cotacao_Condicao_Pgto_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Cotacao_Condicao_Pgto_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Cotacao_Condicao_Pgto_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCotacao03.Cotacao_FuncionarioExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Cotacao_VendedorExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Cotacao_OrcamentoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Cotacao_PrazoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Cotacao_Condicao_Pgto_1Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Cotacao_Condicao_Pgto_2Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Cotacao_Condicao_Pgto_3Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Cotacao_Condicao_Pgto_4Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Valor_PedidoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Valor_DescontoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Valor_FreteExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Valor_IPIExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Valor_TotalExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TCotacao03.Totaliza_Pedido();

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

procedure TCotacao03.SGD_ProdutosDblClick(Sender: TObject);

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

        AdicionaQtdeProduto.Programa_Anterior.Text       := 'Cotação-Inclusao';
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
        AdicionaQtdeProduto.Adiciona_Prazo_Entrega.Text  := SGD_Produtos.Cells[13,SGD_Produtos.Row];

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

procedure TCotacao03.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL, Emite_Lote, Transportadora, Valor_Inteiro: String;
   Vlr_Frete, Vlr_IPI, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4: String;
   Nro_Cotacao: String;
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
        Comando_SQL := Comando_SQL + 'fb_cotacao_frete, ';
        Comando_SQL := Comando_SQL + 'fb_cotacao_status, ';
        Comando_SQL := Comando_SQL + 'fb_cotacao_opcao, ';
        Comando_SQL := Comando_SQL + 'fb_cotacao_empresa) ';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + Trim(Cotacao_Grupo.Text) + ',';
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
        Comando_SQL := Comando_SQL + #39 + Trim(Cotacao_Status.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cotacao_Opcao.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Cotacao_Empresa.Text) + #39 + ')';

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
               Comando_SQL := Comando_SQL + Trim(Nro_Cotacao) + ',';
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
               Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(SGD_Produtos.Cells[13,Ind]),'amd','/') + #39 + ')';

               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Comunitario.ExecSQL;
            End;
        End;

        Seta();

        MSG_Erro('Nova Cotação Adicionada.');

        Cotacao03.Close;
     End;
end;

procedure TCotacao03.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TCotacao03.BT_NovoClick(Sender: TObject);
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

procedure TCotacao03.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     ConexaoBD.SQL_Cotacao.Close;
     ConexaoBD.SQL_Cotacao.SQL.Clear;
     ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Order By fb_cotacao_data Desc, fb_cotacao_nro Desc');
     ConexaoBD.SQL_Cotacao.Open;

     Action := caFree;
     Release;
     Cotacao03 := Nil;
end;

procedure TCotacao03.BT_Adicionar_CompradosClick(Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        Ampulheta();

        SGD_Produtos.Refresh;

        Application.CreateForm(TRelacaoProdutoComprado00,RelacaoProdutoComprado00);

        RelacaoProdutoComprado00.Programa_Anterior.Text     := 'Cotação-Inclusao';
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
