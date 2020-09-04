unit Produtos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TProdutos00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Produtos: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Total_Produtos: TLabel;
    Select_Primeira_Vez: TEdit;
    DBG_Produto_Descricao_Detalhada: TDBMemo;
    Programa_Anterior: TEdit;
    Produto_Codigo: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBGrid_ProdutosCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Produtos00: TProdutos00;

implementation

uses Conexao_BD, Rotinas_Gerais, Produtos_01, Produtos_02, Ibrasmak_00,
  Adiciona_Estrutura_00;

var Selecionado: string;

{$R *.dfm}

procedure TProdutos00.BT_SairClick(Sender: TObject);
begin
     If Trim(Programa_Anterior.Text) = '' Then
        Begin
        Produtos00.Close;
        End
     Else
        Begin
        Produtos00.Programa_Anterior.Text := '';
        Produtos00.BT_Incluir.Enabled     := True;
        Produtos00.Visible                := False;
     End;
end;

procedure TProdutos00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TProdutos00.FormShow(Sender: TObject);
begin
    If Trim(Select_Primeira_Vez.Text) <> '' Then
       Begin
       ConexaoBD.SQL_Produtos.SQL.Clear;
       ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_codigo');
       ConexaoBD.SQL_Produtos.Open;

       Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_Produtos.RecordCount);
    End;
    Select_Primeira_Vez.Text := 'NÃO';
end;

procedure TProdutos00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     ConexaoBD.SQL_Produtos.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Código' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_produto_codigo');
           End
        Else If Opcoes_Procura.Text = 'Desenho' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_desenho Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_produto_desenho');
           End
        Else If Opcoes_Procura.Text = 'Referência' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_referencia Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_produto_referencia');
           End
        Else If Opcoes_Procura.Text = 'Descrição' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_descricao Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_produto_descricao');
           End
        Else If Opcoes_Procura.Text = 'Unidade' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_unidade Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_produto_unidade');
           End
        Else If Opcoes_Procura.Text = 'Família' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_familia = ' + Trim(Dados_Procura.Text) + ' Order By fb_produto_familia');
           End
        Else If Opcoes_Procura.Text = 'Tipo' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Dados_Procura.Text) + ' Order By fb_produto_tipo');
           End
        Else If Opcoes_Procura.Text = 'Qtde.Estoque' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_estoque_atual = ' + Trim(Dados_Procura.Text) + ' Order By fb_produto_estoque_atual');
           End
        Else If Opcoes_Procura.Text = 'Cód.Barras' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo_barras = ' + Trim(Dados_Procura.Text) + ' Order By fb_produto_codigo_barras');
           End
        Else If Opcoes_Procura.Text = 'Lote' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_lote = ' + Trim(Dados_Procura.Text) + ' Order By fb_produto_lote');
           End
        Else If Opcoes_Procura.Text = 'Preço' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where ((fb_produto_preco = ' + Trim(Dados_Procura.Text) + ')) Order By fb_produto_codigo');
           End
        Else If Opcoes_Procura.Text = 'Fornecedor' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where ((fb_produto_fornecedor = ' + Trim(Dados_Procura.Text) + ')) Order By fb_produto_fornecedor');
        End;

        End
     Else
        Begin

        If Opcoes_Procura.Text = 'Código' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_codigo');
           End
        Else If Opcoes_Procura.Text = 'Desenho' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_desenho');
           End
        Else If Opcoes_Procura.Text = 'Referência' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_referencia');
           End
        Else If Opcoes_Procura.Text = 'Descrição' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_descricao');
           End
        Else If Opcoes_Procura.Text = 'Unidade' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_unidade');
           End
        Else If Opcoes_Procura.Text = 'Família' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_familia');
           End
        Else If Opcoes_Procura.Text = 'Tipo' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_tipo');
           End
        Else If Opcoes_Procura.Text = 'Qtde.Estoque' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_estoque_atual');
           End
        Else If Opcoes_Procura.Text = 'Cód.Barras' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_codigo_barras');
           End
        Else If Opcoes_Procura.Text = 'Lote' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_lote');
           End
        Else If Opcoes_Procura.Text = 'Preço' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_codigo');
           End
        Else If Opcoes_Procura.Text = 'Fornecedor' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_fornecedor');
        End;

     End;

     ConexaoBD.SQL_Produtos.Open;

     Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_Produtos.RecordCount);

     Seta();
end;

procedure TProdutos00.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos00.BT_IncluirClick(Sender: TObject);
begin
     Produtos00.Visible := False;

     Application.CreateForm(TProdutos01,Produtos01);

     Produtos01.Caption := 'Cadastro de Produtos - INCLUSÃO';

     Produtos01.ShowModal;
     Produtos01.Destroy;

     Produtos00.Visible := True;
end;

procedure TProdutos00.DBGrid_ProdutosCellClick(Column: TColumn);
var
    Codigo_Produto: String;
begin
    If DBGrid_Produtos.Fields[0].Text <> '' Then Begin

        If Trim(Programa_Anterior.Text) = '' Then
           Begin

           Selecionado := DBGrid_Produtos.Fields[0].Text;

           Produtos00.Visible := False;

           Ampulheta();
           Application.CreateForm(TProdutos02,Produtos02);

           Produtos02.Caption := 'Cadastro de Produtos - ALTERAÇÃO / EXCLUSÃO';

           //*** Obtem os Dados do Produto ***

           Codigo_Produto := DBGrid_Produtos.Fields[0].Text;

           ConexaoBD.SQL_Produtos.Close;
           ConexaoBD.SQL_Produtos.SQL.Clear;
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' + #39 + Trim(Codigo_Produto) + #39 );
           ConexaoBD.SQL_Produtos.Open;

           //*** Carrega os Dados Obtidos ***

           Produtos02.Produto_Codigo.Text             := ConexaoBD.SQL_Produtosfb_produto_codigo.Text;
           Produtos02.Produto_Referencia.Text         := ConexaoBD.SQL_Produtosfb_produto_referencia.Text;
           Produtos02.Produto_Descricao.Text          := ConexaoBD.SQL_Produtosfb_produto_descricao.Text;
           Produtos02.Nro_Familia_Produto.Text        := IntToStr(Obtem_Nro_Familia_Produto(ConexaoBD.SQL_Produtosfb_produto_familia.Text));
           Produtos02.Nro_Tipo_Produto.Text           := IntToStr(Obtem_Nro_Tipo_Produto(ConexaoBD.SQL_Produtosfb_produto_tipo.Text));
           Produtos02.Produto_Lote.Text               := ConexaoBD.SQL_Produtosfb_produto_lote.Text;
           Produtos02.Produto_Codigo_Barras.Text      := ConexaoBD.SQL_Produtosfb_produto_codigo_barras.Text;
           Produtos02.Produto_Unidade.Text            := ConexaoBD.SQL_Produtosfb_produto_unidade.Text;
           Produtos02.Produto_Unidade_Pesagem.Text    := ConexaoBD.SQL_Produtosfb_produto_unidade_pesagem.Text;
           Produtos02.Produto_Peso.Text               := ConexaoBD.SQL_Produtosfb_produto_peso.Text;
           Produtos02.Produto_Estoque_Ideal.Text      := ConexaoBD.SQL_Produtosfb_produto_estoque_ideal.Text;
           Produtos02.Produto_Estoque_Minimo.Text     := ConexaoBD.SQL_Produtosfb_produto_estoque_minimo.Text;
           Produtos02.Produto_Estoque_Inicial.Text    := ConexaoBD.SQL_Produtosfb_produto_estoque_inicial.Text;
           Produtos02.Produto_Estoque_Atual.Text      := ConexaoBD.SQL_Produtosfb_produto_estoque_atual.Text;
           Produtos02.Produto_Data_Alteracao.Text     := ConexaoBD.SQL_Produtosfb_produto_data_alteracao.Text;
           Produtos02.Produto_Classif_Fiscal.Text     := ConexaoBD.SQL_Produtosfb_produto_classif_fiscal.Text;
           Produtos02.Produto_Classif_Tributaria.Text := ConexaoBD.SQL_Produtosfb_produto_classif_tributaria.Text;
           Produtos02.Produto_Pedido_Padrao.ItemIndex := Obtem_Nro_Produto_Pedido_Padrao(ConexaoBD.SQL_Produtosfb_produto_pedido_padrao.Text);
           Produtos02.Produto_IPI.Text                := ConexaoBD.SQL_Produtosfb_produto_ipi.Text;
           Produtos02.Produto_ICMS.Text               := ConexaoBD.SQL_Produtosfb_produto_icms.Text;
           Produtos02.Produto_Preco.Text              := ConexaoBD.SQL_Produtosfb_produto_preco.Text;
           Produtos02.Produto_Fornecedor.Text         := ConexaoBD.SQL_Produtosfb_produto_fornecedor.Text;
           Produtos02.produto_localizacao.Text        := ConexaoBD.SQL_Produtosfb_produto_localizacao.Text;

           Produtos02.Produto_Descricao_Detalhada.Lines.Clear;
           Produtos02.Produto_Descricao_Detalhada.Lines.Add(DBG_Produto_Descricao_Detalhada.Text);

           Produtos02.produto_desenho.Text            := ConexaoBD.SQL_Produtosfb_produto_desenho.Text;
           Produtos02.produto_os.Text                 := ConexaoBD.SQL_Produtosfb_produto_os.Text;
           Produtos02.produto_equipamento.Text        := ConexaoBD.SQL_Produtosfb_produto_equipamento.Text;
           Produtos02.produto_material.Text           := ConexaoBD.SQL_Produtosfb_produto_material.Text;

           Produtos02.Produto_Revenda.Checked         := StrToBool(ConexaoBD.SQL_Produtosfb_produto_revenda.Text);

           Produtos02.Produto_NCM.Text                := ConexaoBD.SQL_Produtosfb_produto_ncm.Text;

           //*** Fecha SQL ***

           ConexaoBD.SQL_Produtos.Close;

           Seta();

           Produtos02.ShowModal;
           Produtos02.Destroy;

           Ampulheta();

           Produtos00.Visible := True;
           ConexaoBD.SQL_Produtos.Locate('fb_produto_codigo',Trim(Selecionado),[]);

           Seta();

           End
        Else
           Begin 
           Ampulheta();

           //*** Seleciona as Estruturas de Produtos para Gerar a Sequência ***

           ConexaoBD.SQL_Produtos_Estruturas.Close;
           ConexaoBD.SQL_Produtos_Estruturas.SQL.Clear;
           ConexaoBD.SQL_Produtos_Estruturas.SQL.Add('Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(Produto_Codigo.Text)+#39+' Order By fb_produto_estrutura_sequencia');
           ConexaoBD.SQL_Produtos_Estruturas.Open;

           //*** Abre a Tela de Estruturas ***

           Application.CreateForm(TAdicionaEstrutura00,AdicionaEstrutura00);

           AdicionaEstrutura00.fb_produto_estrutura_codigo.Text             := Trim(Produto_Codigo.Text);
           AdicionaEstrutura00.fb_produto_estrutura_item_codigo.Text        := Trim(DBGrid_Produtos.Fields[0].Text);
           AdicionaEstrutura00.fb_produto_estrutura_descricao.Text          := '--------- '+Trim(DBGrid_Produtos.Fields[2].Text);
           AdicionaEstrutura00.fb_produto_estrutura_sequencia.Text          := IntToStr((ConexaoBD.SQL_Produtos_Estruturas.RecordCount + 1));
           AdicionaEstrutura00.fb_produto_estrutura_qtde.Text               := '1';
           AdicionaEstrutura00.fb_produto_estrutura_medida.Text             := '';
           AdicionaEstrutura00.fb_produto_estrutura_tipo.Text               := 'IT';
           AdicionaEstrutura00.fb_produto_estrutura_custo.ItemIndex         := 0;
           AdicionaEstrutura00.fb_produto_estrutura_vlr_custo_unitario.Text := '0,00';

           AdicionaEstrutura00.BT_Incluir.Enabled := True;
           AdicionaEstrutura00.BT_Alterar.Enabled := False;
           AdicionaEstrutura00.BT_Excluir.Enabled := False;

           Seta();
           
           AdicionaEstrutura00.ShowModal;
           AdicionaEstrutura00.Destroy;
        End;

    End;
end;

procedure TProdutos00.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Produtos00 := Nil;
end;

end.
