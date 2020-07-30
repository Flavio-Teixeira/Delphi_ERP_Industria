unit Produtos_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TProdutos02 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    Nro_Familia_Produto: TEdit;
    Nro_Tipo_Produto: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label27: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Produto_Codigo: TEdit;
    Produto_Descricao: TEdit;
    Produto_Familia: TComboBox;
    Produto_Tipo: TComboBox;
    Produto_Lote: TEdit;
    Produto_Codigo_Barras: TEdit;
    Produto_Unidade: TEdit;
    Produto_Unidade_Pesagem: TEdit;
    Produto_Peso: TEdit;
    Produto_Estoque_Inicial: TEdit;
    Produto_Estoque_Atual: TEdit;
    Produto_Data_Alteracao: TMaskEdit;
    Produto_Classif_Fiscal: TEdit;
    Produto_Classif_Tributaria: TEdit;
    Produto_Pedido_Padrao: TComboBox;
    Produto_Preco: TEdit;
    Produto_IPI: TEdit;
    Produto_ICMS: TEdit;
    Label18: TLabel;
    Produto_Referencia: TEdit;
    Label19: TLabel;
    Produto_Fornecedor: TEdit;
    GroupBox2: TGroupBox;
    Produto_Descricao_Detalhada: TMemo;
    Label20: TLabel;
    produto_desenho: TEdit;
    produto_os: TEdit;
    Label21: TLabel;
    produto_equipamento: TEdit;
    Label22: TLabel;
    produto_material: TEdit;
    Label23: TLabel;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    BT_Produto: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label24: TLabel;
    Opcao_Visualizar: TComboBox;
    Label25: TLabel;
    DBGrid_Custos: TDBGrid;
    Label26: TLabel;
    Qtde_Sequencia_Estrutura: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    BT_Imprimir: TBitBtn;
    produto_localizacao: TEdit;
    Label35: TLabel;
    Produto_Estoque_Ideal: TEdit;
    Label36: TLabel;
    Label37: TLabel;
    Produto_Estoque_Minimo: TEdit;
    Produto_Revenda: TCheckBox;
    Label38: TLabel;
    Produto_NCM: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Produto_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_FamiliaKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_TipoKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_LoteKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Codigo_BarrasKeyPress(Sender: TObject;
      var Key: Char);
    procedure Produto_UnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Unidade_PesagemKeyPress(Sender: TObject;
      var Key: Char);
    procedure Produto_PesoKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Estoque_InicialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Produto_Estoque_AtualKeyPress(Sender: TObject;
      var Key: Char);
    procedure Produto_Data_AlteracaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Produto_Classif_FiscalKeyPress(Sender: TObject;
      var Key: Char);
    procedure Produto_Classif_TributariaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Produto_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Pedido_PadraoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Produto_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_02KeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_03KeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_04KeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_05KeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_06KeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_07KeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_08KeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_09KeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_10KeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_11KeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_12KeyPress(Sender: TObject; var Key: Char);
    procedure Produto_VolumeKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_DolarKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_ReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_FornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure produto_desenhoKeyPress(Sender: TObject; var Key: Char);
    procedure produto_osKeyPress(Sender: TObject; var Key: Char);
    procedure produto_equipamentoKeyPress(Sender: TObject; var Key: Char);
    procedure produto_materialKeyPress(Sender: TObject; var Key: Char);
    procedure Opcao_VisualizarChange(Sender: TObject);
    procedure BT_ProdutoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid_CustosCellClick(Column: TColumn);
    procedure DBGrid_CustosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure produto_localizacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_NCMKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;

    procedure Carrega_Tipo_Produto();
    procedure Carrega_Familia_Produto();
    procedure Carrega_Estrutura();
  public
    { Public declarations }
  end;

var
  Produtos02: TProdutos02;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00, Etapas_00, Processos_00,
  SubProcessos_00, Produtos_00, Adiciona_Produto_Relacao,
  Adiciona_Estrutura_00, Produtos_03;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TProdutos02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     Ampulheta();

     If Trim(Produto_Codigo.Text) = '' Then
        Begin
        Erro          := 'O Código do Produto não foi informado';
        Campo_Retorno := 'Produto_Codigo';
        End
     Else If Trim(Produto_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição do Produto não foi informado';
        Campo_Retorno := 'Produto_Descricao';
        End
     Else If Trim(Produto_Familia.Text) = '' Then
        Begin
        Erro          := 'A Família do Produto não foi informada';
        Campo_Retorno := 'Produto_Familia';
        End
     Else If Trim(Produto_Tipo.Text) = '' Then
        Begin
        Erro          := 'O Tipo do Produto não foi informado';
        Campo_Retorno := 'Produto_Tipo';
        End
     Else If Trim(Produto_Estoque_Ideal.Text) = '' Then
        Begin
        Erro          := 'O Estoque Ideal do Produto não foi informado';
        Campo_Retorno := 'Produto_Estoque_Ideal';
        End
     Else If Trim(Produto_Estoque_Minimo.Text) = '' Then
        Begin
        Erro          := 'O Estoque Mínimo do Produto não foi informado';
        Campo_Retorno := 'Produto_Estoque_Minimo';
        End
     Else If Trim(Produto_Estoque_Inicial.Text) = '' Then
        Begin
        Erro          := 'O Estoque Inicial do Produto não foi informado';
        Campo_Retorno := 'Produto_Estoque_Inicial';
        End
     Else If Trim(Produto_Estoque_Atual.Text) = '' Then
        Begin
        Erro          := 'O Estoque Atual do Produto não foi informado';
        Campo_Retorno := 'Produto_Estoque_Atual';
        End

     Else If Trim(Produto_Data_Alteracao.Text) = '/  /' Then
        Begin
        Erro          := 'A Data de Alteração não foi informada';
        Campo_Retorno := 'Produto_Data_Alteracao';
        End
     Else If Trim(Produto_Preco.Text) = '' Then
        Begin
        Erro          := 'O Preço Mensal do Produto não foi informado';
        Campo_Retorno := 'Produto_Preco';
     End;

     Seta();

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Produto_Codigo' Then
           Begin
           Produto_Codigo.SetFocus;
           End
        Else If Campo_Retorno = 'Produto_Descricao' Then
           Begin
           Produto_Descricao.SetFocus;
           End
        Else If Campo_Retorno = 'Produto_Familia' Then
           Begin
           Produto_Familia.SetFocus;
           End
        Else If Campo_Retorno = 'Produto_Tipo' Then
           Begin
           Produto_Tipo.SetFocus;
           End
        Else If Campo_Retorno = 'Produto_Estoque_Ideal' Then
           Begin
           Produto_Estoque_Ideal.SetFocus;
           End
        Else If Campo_Retorno = 'Produto_Estoque_Minimo' Then
           Begin
           Produto_Estoque_Minimo.SetFocus;
           End
        Else If Campo_Retorno = 'Produto_Estoque_Inicial' Then
           Begin
           Produto_Estoque_Inicial.SetFocus;
           End
        Else If Campo_Retorno = 'Produto_Estoque_Atual' Then
           Begin
           Produto_Estoque_Atual.SetFocus;
           End
        Else If Campo_Retorno = 'Produto_Data_Alteracao' Then
           Begin
           Produto_Data_Alteracao.SetFocus;
           End
        Else If Campo_Retorno = 'Produto_Preco' Then
           Begin
           Produto_Preco.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TProdutos02.Carrega_Estrutura();

var
   Visualizar_Estrutura, Comando_SQL: String;
   
begin
     //*** Obtem a Estrutura dos Produtos ***

     Ampulheta();

     If Trim(Opcao_Visualizar.Text) = '--- Todos ---' Then
        Begin
        Visualizar_Estrutura := '';
        Comando_SQL := 'Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(Produto_Codigo.Text)+#39+' Order By fb_produto_estrutura_sequencia';
        End
     Else If Trim(Opcao_Visualizar.Text) = 'Etapa' Then
        Begin
        Visualizar_Estrutura := 'ET';
        Comando_SQL := 'Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(Produto_Codigo.Text)+#39+' AND fb_produto_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By fb_produto_estrutura_sequencia';
        End
     Else If Trim(Opcao_Visualizar.Text) = 'Processo' Then
        Begin
        Visualizar_Estrutura := 'PR';
        Comando_SQL := 'Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(Produto_Codigo.Text)+#39+' AND fb_produto_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By fb_produto_estrutura_sequencia';
        End
     Else If Trim(Opcao_Visualizar.Text) = 'Sub-Processo' Then
        Begin
        Visualizar_Estrutura := 'SP';
        Comando_SQL := 'Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(Produto_Codigo.Text)+#39+' AND fb_produto_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By fb_produto_estrutura_sequencia';
        End
     Else If Trim(Opcao_Visualizar.Text) = 'Item' Then
        Begin
        Visualizar_Estrutura := 'IT';
        Comando_SQL := 'Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(Produto_Codigo.Text)+#39+' AND fb_produto_estrutura_tipo = '+#39+Trim(Visualizar_Estrutura)+#39+' Order By fb_produto_estrutura_sequencia';
     End;

     ConexaoBD.SQL_Produtos_Estruturas.Close;
     ConexaoBD.SQL_Produtos_Estruturas.SQL.Clear;
     ConexaoBD.SQL_Produtos_Estruturas.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Produtos_Estruturas.Open;

     Qtde_Sequencia_Estrutura.Caption := IntToStr(ConexaoBD.SQL_Produtos_Estruturas.RecordCount);

     Seta();
end;

procedure TProdutos02.Carrega_Tipo_Produto();
begin
     // Obtem os Tipos de Produtos

     ConexaoBD.SQL_Tipo_Produto.Close;
     ConexaoBD.SQL_Tipo_Produto.SQL.Clear;
     ConexaoBD.SQL_Tipo_Produto.SQL.Add('Select * from fb_tipos_produtos Order By fb_tipo_produto_descricao');
     ConexaoBD.SQL_Tipo_Produto.Open;

     Produto_Tipo.Items.Clear;

     If conexaoBD.SQL_Tipo_Produto.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Tipo_Produto.First;

        While Not conexaoBD.SQL_Tipo_Produto.Eof Do
              begin
              Produto_Tipo.Items.Add(IntToStr(conexaoBD.SQL_Tipo_Produtofb_tipo_produto_codigo.AsInteger)+' - '+conexaoBD.SQL_Tipo_Produtofb_tipo_produto_descricao.AsString);
              conexaoBD.SQL_Tipo_Produto.Next;
        End;
     end;

     Produto_Tipo.ItemIndex := StrToInt(Nro_Tipo_Produto.Text);

     ConexaoBD.SQL_Tipo_Produto.Close;
end;

procedure TProdutos02.Carrega_Familia_Produto();
begin
     // Obtem as Famílias de Produtos

     ConexaoBD.SQL_Familia_Produto.Close;
     ConexaoBD.SQL_Familia_Produto.SQL.Clear;
     ConexaoBD.SQL_Familia_Produto.SQL.Add('Select * from fb_familias_produtos Order By fb_familia_produto_descricao');
     ConexaoBD.SQL_Familia_Produto.Open;

     Produto_Familia.Items.Clear;

     If conexaoBD.SQL_Familia_Produto.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Familia_Produto.First;

        While Not conexaoBD.SQL_Familia_Produto.Eof Do
              begin
              Produto_Familia.Items.Add(IntToStr(conexaoBD.SQL_Familia_Produtofb_Familia_produto_codigo.AsInteger)+' - '+conexaoBD.SQL_Familia_Produtofb_Familia_produto_descricao.AsString);
              conexaoBD.SQL_Familia_Produto.Next;
        End;
     end;

     Produto_Familia.ItemIndex := StrToInt(Nro_Familia_Produto.Text);

     ConexaoBD.SQL_Familia_Produto.Close;
end;

procedure TProdutos02.BT_SairClick(Sender: TObject);
begin
     Produtos02.Close;
end;

procedure TProdutos02.FormShow(Sender: TObject);
begin
    Carrega_Tipo_Produto();
    Carrega_Familia_Produto();
    Carrega_Estrutura();
end;

procedure TProdutos02.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TProdutos02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_produtos Where fb_produto_codigo = ' + #39 + Trim(Produto_Codigo.Text) + #39 );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        Produtos02.Close;
     End;
end;

procedure TProdutos02.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL, Fornecedor, Peso, Estoque_Ideal, Estoque_Minimo, Estoque_Inicial, Estoque_Atual, Desconto, Pedido_Padrao, Tipo_Produto, Familia_Produto: String;
   Vlr_Mensal, Vlr_IPI, Vlr_ICMS: String;
   Vlr_Calculo_Nro, Produto_Valor_Nro, Produto_Area_Nro: Real;
   Erro: Integer;

begin
     If Valida_Dados() Then
        Begin

        //*** Obtem o Status do Pedido Padrão ***

        If Produto_Pedido_Padrao.Text = 'Sim' Then
           Begin
           Pedido_Padrao := 'S';
           End
        Else
           Begin
           Pedido_Padrao := 'N';
        End;

        //*** Obtem os Valores ***

        Fornecedor       := Trim(Virgula_Ponto(Produto_Fornecedor.Text));
        Peso             := Trim(Virgula_Ponto(Produto_Peso.Text));
        Estoque_Ideal    := Trim(Virgula_Ponto(Produto_Estoque_Ideal.Text));
        Estoque_Minimo   := Trim(Virgula_Ponto(Produto_Estoque_Minimo.Text));
        Estoque_Inicial  := Trim(Virgula_Ponto(Produto_Estoque_Inicial.Text));
        Estoque_Atual    := Trim(Virgula_Ponto(Produto_Estoque_Atual.Text));
        Vlr_Mensal       := Trim(Virgula_Ponto(Produto_Preco.Text));
        Vlr_IPI          := Trim(Virgula_Ponto(Produto_IPI.Text));
        Vlr_ICMS         := Trim(Virgula_Ponto(Produto_ICMS.Text));

        If Trim(Fornecedor) = '' Then
           Begin
           Fornecedor := '0';
        End;

        If Trim(Peso) = '' Then
           Begin
           Peso := '0';
        End;

        If Trim(Vlr_Mensal) = '' Then
           Begin
           Vlr_Mensal := '0';
        End;

        If Trim(Vlr_IPI) = '' Then
           Begin
           Vlr_IPI := '0';
        End;

        If Trim(Vlr_ICMS) = '' Then
           Begin
           Vlr_ICMS := '0';
        End;

        If Trim(Produto_Classif_Tributaria.Text) = '' Then
           Begin
           Produto_Classif_Tributaria.Text := '0';
        End;

        If Trim(Produto_Codigo_Barras.Text) = '' Then
           Begin
           Produto_Codigo_Barras.Text := '0';
        End;

        If Trim(Produto_Lote.Text) = '' Then
           Begin
           Produto_Lote.Text := '0';
        End;

        //*** Obtem o Nro do Tipo de Produto, Família do Produto ***

        Tipo_Produto    := Obtem_Nro_Antes_Traco(Produto_Tipo.Text);
        Familia_Produto := Obtem_Nro_Antes_Traco(Produto_Familia.Text);

        //*** Efetua a Alteração ***
        
        Comando_SQL := 'Update fb_produtos Set ';
        Comando_SQL := Comando_SQL + 'fb_produto_codigo = ' + #39 + Trim(Produto_Codigo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_referencia = ' + #39 + Trim(Produto_Referencia.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_descricao = ' + #39 + Trim(Produto_Descricao.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_familia = ' + Trim(Familia_Produto) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_peso = ' + Trim(Peso) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_unidade = ' + #39 + Produto_Unidade.Text + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_tipo = ' + Trim(Tipo_Produto) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_estoque_ideal = ' + Trim(Estoque_Ideal) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_estoque_minimo = ' + Trim(Estoque_Minimo) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_estoque_inicial = ' + Trim(Estoque_Inicial) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_unidade_pesagem = ' + #39 + Trim(Produto_Unidade_Pesagem.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_classif_tributaria = ' + Trim(Produto_Classif_Tributaria.Text) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_classif_fiscal = ' + #39 + Trim(Produto_Classif_Fiscal.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_codigo_barras = ' + Trim(Produto_Codigo_Barras.Text) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_lote = ' + Trim(Produto_Lote.Text) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_preco = ' + Trim(Vlr_Mensal) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_data_alteracao = ' + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_pedido_padrao = ' + #39 + Pedido_Padrao + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_ipi = ' + Trim(Vlr_IPI) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_icms = ' + Trim(Vlr_ICMS) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_fornecedor = ' + Trim(Fornecedor) + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_descricao_detalhada = ' + #39 + Trim(Produto_Descricao_Detalhada.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_produto_desenho = ' + #39 + Trim(produto_desenho.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_os = ' + #39 + Trim(produto_os.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_equipamento = ' + #39 + Trim(produto_equipamento.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + 'fb_produto_material = ' + #39 + Trim(produto_material.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_produto_localizacao = ' + #39 + Trim(produto_localizacao.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_produto_revenda = ' + #39 + Trim(BoolToStr(Produto_Revenda.Checked)) + #39 + ', ';
        Comando_SQL := Comando_SQL + 'fb_produto_ncm = ' + #39 + Trim(Produto_NCM.Text) + #39 + ' ';
        Comando_SQL := Comando_SQL + ' Where fb_produto_codigo = ' + #39 + Trim(Produto_Codigo.Text) + #39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Alteração Efetuada...');

        Produtos02.Close;
     End;
end;

procedure TProdutos02.Produto_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_FamiliaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_TipoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_LoteKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Codigo_BarrasKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_UnidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Unidade_PesagemKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_PesoKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Estoque_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Estoque_AtualKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Data_AlteracaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Classif_FiscalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Classif_TributariaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Pedido_PadraoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_PrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_02KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_03KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_04KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_05KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_06KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_07KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_08KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_09KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_10KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_11KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_12KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_VolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_Preco_DolarKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_IPIKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_ICMSKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_ReferenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_FornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.produto_desenhoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.produto_osKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.produto_equipamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.produto_materialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Opcao_VisualizarChange(Sender: TObject);
begin
     Carrega_Estrutura();
end;

procedure TProdutos02.BT_ProdutoClick(Sender: TObject);
begin
     Ampulheta();
     If (Etapas00 = Nil) Then
        Begin
        Application.CreateForm(TEtapas00,Etapas00);
     End;
     Etapas00.Programa_Anterior.Text := 'Etapa';
     Etapas00.Produto_Codigo.Text    := Trim(Produto_Codigo.Text);
     Etapas00.BT_Incluir.Enabled     := False;
     Seta();
     Etapas00.ShowModal;
end;

procedure TProdutos02.BitBtn1Click(Sender: TObject);
begin
     Ampulheta();
     If (Processos00 = Nil) Then
        Begin
        Application.CreateForm(TProcessos00,Processos00);
     End;
     Processos00.Programa_Anterior.Text := 'Processo';
     Processos00.Produto_Codigo.Text    := Trim(Produto_Codigo.Text);
     Processos00.BT_Incluir.Enabled     := False;
     Seta();
     Processos00.ShowModal;
end;

procedure TProdutos02.BitBtn2Click(Sender: TObject);
begin
     Ampulheta();
     If (SubProcessos00 = Nil) Then
        Begin
        Application.CreateForm(TSubProcessos00,SubProcessos00);
     End;
     SubProcessos00.Programa_Anterior.Text := 'SubProcesso';
     SubProcessos00.Produto_Codigo.Text    := Trim(Produto_Codigo.Text);
     SubProcessos00.BT_Incluir.Enabled     := False;
     Seta();
     SubProcessos00.ShowModal;
end;

procedure TProdutos02.BitBtn3Click(Sender: TObject);
begin
     Ampulheta();
     If (Produtos00 = Nil) Then
        Begin
        Application.CreateForm(TProdutos00,Produtos00);
     End;
     Produtos00.Programa_Anterior.Text := 'Item';
     Produtos00.Produto_Codigo.Text    := Trim(Produto_Codigo.Text);
     Produtos00.BT_Incluir.Enabled     := True;
     Seta();
     Produtos00.Visible := True;
     Produtos00.Show;
end;

procedure TProdutos02.DBGrid_CustosCellClick(Column: TColumn);
begin
     If DBGrid_Custos.Fields[0].Text <> '' Then
        Begin

        Ampulheta();

        Application.CreateForm(TAdicionaEstrutura00,AdicionaEstrutura00);

        AdicionaEstrutura00.fb_produto_estrutura_numero.Text             := Trim(DBGrid_Custos.Fields[0].Text);
        AdicionaEstrutura00.fb_produto_estrutura_sequencia.Text          := Trim(DBGrid_Custos.Fields[1].Text);
        AdicionaEstrutura00.fb_produto_estrutura_tipo.Text               := Trim(DBGrid_Custos.Fields[2].Text);
        AdicionaEstrutura00.fb_produto_estrutura_qtde.Text               := Trim(DBGrid_Custos.Fields[3].Text);
        AdicionaEstrutura00.fb_produto_estrutura_medida.Text             := Trim(DBGrid_Custos.Fields[4].Text);
        AdicionaEstrutura00.fb_produto_estrutura_item_codigo.Text        := Trim(DBGrid_Custos.Fields[5].Text);
        AdicionaEstrutura00.fb_produto_estrutura_descricao.Text          := Trim(DBGrid_Custos.Fields[6].Text);

        If Trim(DBGrid_Custos.Fields[7].Text) = '---' Then
           Begin
           AdicionaEstrutura00.fb_produto_estrutura_custo.ItemIndex := 0;
           End
        Else
           Begin
           AdicionaEstrutura00.fb_produto_estrutura_custo.ItemIndex := 1;
        End;

        AdicionaEstrutura00.fb_produto_estrutura_vlr_custo_unitario.Text := Trim(DBGrid_Custos.Fields[8].Text);
        AdicionaEstrutura00.fb_produto_estrutura_codigo.Text             := Trim(DBGrid_Custos.Fields[9].Text);

        AdicionaEstrutura00.BT_Incluir.Enabled := False;
        AdicionaEstrutura00.BT_Alterar.Enabled := True;
        AdicionaEstrutura00.BT_Excluir.Enabled := True;

        Seta();

        AdicionaEstrutura00.ShowModal;
        AdicionaEstrutura00.Destroy;
     End;
end;

procedure TProdutos02.DBGrid_CustosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If DBGrid_Custos.Fields[2].Text = 'ET' Then Begin
        DBGrid_Custos.Canvas.Brush.Color :=  $0028792B;
        End
    Else If DBGrid_Custos.Fields[2].Text = 'PR' Then Begin
        DBGrid_Custos.Canvas.Brush.Color :=  $0039AE3E;
        End
    Else If DBGrid_Custos.Fields[2].Text = 'SP' Then Begin
        DBGrid_Custos.Canvas.Brush.Color :=  $0047DB4E;
        End
    Else If DBGrid_Custos.Fields[2].Text = 'IT' Then Begin
        DBGrid_Custos.Canvas.Brush.Color :=  $0051F959;
    End;

    DBGrid_Custos.DefaultDrawDataCell(Rect, DBGrid_Custos.columns[datacol].field, State);
end;

procedure TProdutos02.BT_ImprimirClick(Sender: TObject);
begin
     Ampulheta();

     Application.CreateForm(TProdutos03,Produtos03);

     Produtos03.QR_Produto.Caption := Trim(Produto_Codigo.Text)+' - '+Trim(Produto_Descricao.Text);

     Seta();

     Produtos03.QR_Estrutura.Preview;
     Produtos03.Destroy;
end;

procedure TProdutos02.produto_localizacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TProdutos02.Produto_NCMKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
