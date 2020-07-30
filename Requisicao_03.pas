unit Requisicao_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TRequisicao03 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Cliente_Codigo: TEdit;
    Requisicao_Grupo: TEdit;
    Requisicao_Descricao: TEdit;
    Requisicao_Data: TEdit;
    Fornecedor_Observacoes: TMemo;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    GroupBox7: TGroupBox;
    Label47: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Requisicao_Condicao_Pgto_1: TEdit;
    Requisicao_Condicao_Pgto_2: TEdit;
    Requisicao_Condicao_Pgto_3: TEdit;
    Requisicao_Condicao_Pgto_4: TEdit;
    Requisicao_Prazo: TEdit;
    Requisicao_Vendedor: TEdit;
    Requisicao_Funcionario: TEdit;
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
    GroupBox5: TGroupBox;
    Requisicao_Status: TEdit;
    Label8: TLabel;
    Requisicao_Orcamento: TEdit;
    Label12: TLabel;
    Requisicao_Opcao: TComboBox;
    Label25: TLabel;
    Label11: TLabel;
    Requisicao_Obs: TMemo;
    Label18: TLabel;
    Requisicao_Previsao_Entrega: TEdit;
    Label22: TLabel;
    Requisicao_Solicitante: TEdit;
    Label23: TLabel;
    Requisicao_Centro_Custo: TComboBox;
    Label24: TLabel;
    Requisicao_Planejamento: TEdit;
    Label26: TLabel;
    Requisicao_Empresa: TComboBox;
    Label27: TLabel;
    Requisicao_OS: TEdit;
    Label29: TLabel;
    Requisicao_Equipamento: TEdit;
    Label31: TLabel;
    Requisicao_Observacao_Tabulacao: TEdit;
    Label36: TLabel;
    Requisicao_Requisitante: TEdit;
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
    procedure Requisicao_FuncionarioExit(Sender: TObject);
    procedure Requisicao_VendedorExit(Sender: TObject);
    procedure Requisicao_OrcamentoExit(Sender: TObject);
    procedure Requisicao_PrazoExit(Sender: TObject);
    procedure Requisicao_Condicao_Pgto_1Exit(Sender: TObject);
    procedure Requisicao_Condicao_Pgto_2Exit(Sender: TObject);
    procedure Requisicao_Condicao_Pgto_3Exit(Sender: TObject);
    procedure Requisicao_Condicao_Pgto_4Exit(Sender: TObject);
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
    procedure Requisicao_Previsao_EntregaExit(Sender: TObject);
    procedure Requisicao_SolicitanteExit(Sender: TObject);
    procedure Requisicao_PlanejamentoExit(Sender: TObject);
    procedure Requisicao_Centro_CustoExit(Sender: TObject);
    procedure Requisicao_ObsExit(Sender: TObject);
    procedure Requisicao_Previsao_EntregaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_SolicitanteKeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_PlanejamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_Centro_CustoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Requisicao_EmpresaExit(Sender: TObject);
    procedure Requisicao_EmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_EquipamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_OSKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_StatusKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_ObsKeyPress(Sender: TObject; var Key: Char);
    procedure Requisicao_StatusExit(Sender: TObject);
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

  public
    { Public declarations }
  end;

var
  Requisicao03: TRequisicao03;
  Qtde_Produtos_Selecionados: Integer;
  Ctrl_Estoque: Boolean;
  Nro_Ctrl_Estoque: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Fornecedor_00, Fornecedor_02,
  Adiciona_Produto_Relacao, Adiciona_Qtde_Produto,
  Novo_Produto_Fornecedor_00, Relacao_Produto_Comprado_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TRequisicao03.Valida_Dados(): Boolean;

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
{
     If Trim(Fornecedor_Numero.Text) = '' Then
        Begin
        Erro          := 'Nenhum Fornecedor foi informado';
        Campo_Retorno := 'Fornecedor_Numero';
     End;
}
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

procedure TRequisicao03.BT_SairClick(Sender: TObject);
begin
     Requisicao03.Close;
end;

procedure TRequisicao03.BT_ProcurarClick(Sender: TObject);
begin
     Requisicao03.Visible := False;

     Ampulheta();
     Application.CreateForm(TFornecedor00,Fornecedor00);

     Fornecedor00.Programa_Anterior.Text := 'Requisição-Inclusao';
     Fornecedor00.Fornecedor_Area.ItemIndex := 1;
     Fornecedor00.BT_Procurar.Click;
     
     Seta();
     Fornecedor00.ShowModal;
     //Fornecedor00.Destroy;

     Requisicao03.Visible := True;
end;

procedure TRequisicao03.BT_AlterarClick(Sender: TObject);

var
   Codigo_Fornecedor: String;

begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        Requisicao03.Visible := False;

        Ampulheta();
        Application.CreateForm(TFornecedor02,Fornecedor02);

        Fornecedor02.Programa_Anterior.Text := 'Requisição-Inclusao';

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

        Requisicao03.Visible := True;
        End
     Else
        Begin
        MSG_Erro('É Necessário informar um Fornecedor antes de alterar os dados cadastrais do mesmo');
     End;
end;

procedure TRequisicao03.BT_AdicionarClick(Sender: TObject);
begin
//     If Trim(Fornecedor_Numero.Text) <> '' Then
//        Begin
        Ampulheta();

        SGD_Produtos.Refresh;

        Application.CreateForm(TAdicionaProdutoRelacao,AdicionaProdutoRelacao);

        AdicionaProdutoRelacao.Programa_Anterior.Text := 'Requisição-Inclusao';
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

procedure TRequisicao03.FormShow(Sender: TObject);

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

procedure TRequisicao03.Exibe_Grid_Produtos();

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
         SGD_Produtos.Cells[0,Ind]  := '';
         SGD_Produtos.Cells[1,Ind]  := '';
         SGD_Produtos.Cells[2,Ind]  := '';
         SGD_Produtos.Cells[3,Ind]  := '';
         SGD_Produtos.Cells[4,Ind]  := '';
         SGD_Produtos.Cells[5,Ind]  := '';
         SGD_Produtos.Cells[6,Ind]  := '';
         SGD_Produtos.Cells[7,Ind]  := '';
         SGD_Produtos.Cells[8,Ind]  := '';
         SGD_Produtos.Cells[9,Ind]  := '';
         SGD_Produtos.Cells[10,Ind] := '';
         SGD_Produtos.Cells[11,Ind] := '';
         SGD_Produtos.Cells[12,Ind] := '';
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

              SGD_Produtos.Cells[0,Ind]  := '';
              SGD_Produtos.Cells[1,Ind]  := ConexaoBD.SQL_FB_Produtosfb_produto_codigo.Text;
              SGD_Produtos.Cells[2,Ind]  := ConexaoBD.SQL_FB_Produtosfb_produto_referencia.Text;
              SGD_Produtos.Cells[3,Ind]  := ConexaoBD.SQL_FB_Produtosfb_produto_descricao.Text;
              SGD_Produtos.Cells[4,Ind]  := ConexaoBD.SQL_FB_Produtosfb_produto_unidade.Text;

              Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_FB_Produtosfb_produto_preco.Text));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

              SGD_Produtos.Cells[5,Ind]  := Vlr_Exibicao;

              SGD_Produtos.Cells[6,Ind]  := '';
              SGD_Produtos.Cells[7,Ind]  := '';

              SGD_Produtos.Cells[8,Ind]  := ConexaoBD.SQL_FB_Produtosfb_produto_ipi.Text;

              SGD_Produtos.Cells[9,Ind]  := ConexaoBD.SQL_FB_Produtosfb_produto_desenho.Text;
              SGD_Produtos.Cells[10,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_os.Text;
              SGD_Produtos.Cells[11,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_equipamento.Text;
              SGD_Produtos.Cells[12,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_material.Text;

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

     Seta();
end;

procedure TRequisicao03.Valor_PedidoKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Valor_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Valor_FreteKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Valor_IPIKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Valor_TotalKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_FuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_VendedorKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_OrcamentoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_PrazoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_Condicao_Pgto_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_Condicao_Pgto_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_Condicao_Pgto_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_Condicao_Pgto_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_FuncionarioExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_VendedorExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_OrcamentoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_PrazoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_Condicao_Pgto_1Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_Condicao_Pgto_2Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_Condicao_Pgto_3Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_Condicao_Pgto_4Exit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Valor_PedidoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Valor_DescontoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Valor_FreteExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Valor_IPIExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Valor_TotalExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Totaliza_Pedido();

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

procedure TRequisicao03.SGD_ProdutosDblClick(Sender: TObject);

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

        AdicionaQtdeProduto.Programa_Anterior.Text       := 'Requisição-Inclusao';
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

procedure TRequisicao03.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL, Emite_Lote, Transportadora, Valor_Inteiro: String;
   Vlr_Frete, Vlr_IPI, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4: String;
   Nro_Requisicao: String;
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

        Comando_SQL := 'Insert into fb_requisicoes(';
        Comando_SQL := Comando_SQL + 'fb_requisicao_grupo, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_fornecedor, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_fornecedor_descricao, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_data, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_vlr_total, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_vendedor, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_orcamento_nro, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_prazo_entrega, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_desconto, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_requisitante, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_funcionario, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_1, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_2, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_3, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_cond_pgto_4, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_frete, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_status, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_obs, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_opcao, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_centro, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_planejamento, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_empresa, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_equipamento, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_os, ';
        Comando_SQL := Comando_SQL + 'fb_requisicao_obs_tabulacao)';
        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Grupo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Numero.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Vlr_Total + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Vendedor.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Orcamento.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Previsao_Entrega.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Vlr_Desconto + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Requisitante.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Solicitante.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Cond_Pgto_1 + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Cond_Pgto_2 + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Cond_Pgto_3 + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Cond_Pgto_4 + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Vlr_Frete + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Requisicao_Status.Text + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Obs.Lines.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Opcao.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Centro_Custo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Planejamento.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Empresa.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Equipamento.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_OS.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_Observacao_Tabulacao.Text) + #39 + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Obtem Número do Pedido ***

        ConexaoBD.SQL_Requisicao.Close;
        ConexaoBD.SQL_Requisicao.SQL.Clear;
        ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Order By fb_requisicao_nro Desc');
        ConexaoBD.SQL_Requisicao.Open;

        conexaoBD.SQL_Requisicao.First;

        Nro_Requisicao := conexaoBD.SQL_Requisicaofb_requisicao_nro.Text;

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
               Comando_SQL := Comando_SQL + #39 + Trim(Nro_Requisicao) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[1,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[3,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[0,Ind])) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[5,Ind])) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[6,Ind])) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind])) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[4,Ind])) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[9,Ind])) + #39 + ',';

               If ((Trim(Requisicao_OS.Text) <> '') And (Trim(Requisicao_OS.Text) <> '0')) Then
                  Begin

                  If (Trim(Virgula_Ponto(SGD_Produtos.Cells[10,Ind])) <> '') And (Trim(Virgula_Ponto(SGD_Produtos.Cells[10,Ind])) <> '0') Then
                     Begin
                     Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[10,Ind])) + #39 + ',';
                     End
                  Else
                     Begin
                     Comando_SQL := Comando_SQL + #39 + Trim(Requisicao_OS.Text) + #39 + ',';
                  End;

                  End
               Else
                  Begin
                  Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[10,Ind])) + #39 + ',';
               End;

               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[11,Ind])) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[12,Ind])) + #39 + ')';

               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Comunitario.ExecSQL;
            End;
        End;

        Seta();

        MSG_Erro('Nova Requisição Adicionada.');

        Requisicao03.Close;
     End;
end;

procedure TRequisicao03.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRequisicao03.BT_NovoClick(Sender: TObject);
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

procedure TRequisicao03.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     ConexaoBD.SQL_Requisicao.Close;
     ConexaoBD.SQL_Requisicao.SQL.Clear;
     ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Order By fb_requisicao_nro Desc');
     ConexaoBD.SQL_Requisicao.Open;

     Action := caFree;
     Release;
     Requisicao03 := Nil;
end;

procedure TRequisicao03.BT_Adicionar_CompradosClick(Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        Ampulheta();

        SGD_Produtos.Refresh;

        Application.CreateForm(TRelacaoProdutoComprado00,RelacaoProdutoComprado00);

        RelacaoProdutoComprado00.Programa_Anterior.Text     := 'Requisição-Inclusao';
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

procedure TRequisicao03.Requisicao_Previsao_EntregaExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_SolicitanteExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_PlanejamentoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_Centro_CustoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_ObsExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_Previsao_EntregaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_SolicitanteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_PlanejamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_Centro_CustoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_EmpresaExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_EmpresaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_EquipamentoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_OSKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_StatusKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_ObsKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao03.Requisicao_StatusExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_EquipamentoExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_OSExit(Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_Observacao_TabulacaoExit(
  Sender: TObject);
begin
     Totaliza_Pedido();
end;

procedure TRequisicao03.Requisicao_Observacao_TabulacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
