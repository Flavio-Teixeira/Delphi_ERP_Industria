unit Novo_Produto_Fornecedor_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TNovoProdutoFornecedor00 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Produto_Codigo: TEdit;
    Label1: TLabel;
    Produto_Descricao: TEdit;
    Label5: TLabel;
    Produto_Familia: TComboBox;
    Label2: TLabel;
    Produto_Tipo: TComboBox;
    Label4: TLabel;
    Produto_Lote: TEdit;
    Produto_Codigo_Barras: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Produto_Unidade: TEdit;
    Label8: TLabel;
    Produto_Unidade_Pesagem: TEdit;
    Label9: TLabel;
    Produto_Peso: TEdit;
    Label10: TLabel;
    Produto_Estoque_Inicial: TEdit;
    Label11: TLabel;
    Produto_Estoque_Atual: TEdit;
    Label12: TLabel;
    Produto_Data_Alteracao: TMaskEdit;
    Label13: TLabel;
    Produto_Classif_Fiscal: TEdit;
    Produto_Classif_Tributaria: TEdit;
    Label14: TLabel;
    Produto_Tipo_Cadastro: TEdit;
    Label27: TLabel;
    Produto_Pedido_Padrao: TComboBox;
    Label16: TLabel;
    Produto_Preco: TEdit;
    Label15: TLabel;
    Produto_IPI: TEdit;
    Label17: TLabel;
    Produto_ICMS: TEdit;
    Label18: TLabel;
    Produto_Referencia: TEdit;
    Label19: TLabel;
    Produto_Fornecedor: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Produto_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_VolumeKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_DolarKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Preco_Dolar_DuplyKeyPress(Sender: TObject;
      var Key: Char);
    procedure Produto_Preco_DuplyKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_ReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_FornecedorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;

    procedure Carrega_Tipo_Produto();
    procedure Carrega_Familia_Produto();
  public
    { Public declarations }
  end;

var
  NovoProdutoFornecedor00: TNovoProdutoFornecedor00;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

//***************
//*** Fun��es ***
//***************

function TNovoProdutoFornecedor00.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     Ampulheta();

     If Trim(Produto_Codigo.Text) = '' Then
        Begin
        Erro          := 'O C�digo do Produto n�o foi informado';
        Campo_Retorno := 'Produto_Codigo';
        End
     Else If Trim(Produto_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descri��o do Produto n�o foi informado';
        Campo_Retorno := 'Produto_Descricao';
        End
     Else If Trim(Produto_Familia.Text) = '' Then
        Begin
        Erro          := 'A Fam�lia do Produto n�o foi informada';
        Campo_Retorno := 'Produto_Familia';
        End
     Else If Trim(Produto_Tipo.Text) = '' Then
        Begin
        Erro          := 'O Tipo do Produto n�o foi informado';
        Campo_Retorno := 'Produto_Tipo';
        End
     Else If Trim(Produto_Estoque_Inicial.Text) = '' Then
        Begin
        Erro          := 'O Estoque Inicial do Produto n�o foi informado';
        Campo_Retorno := 'Produto_Estoque_Inicial';
        End
     Else If Trim(Produto_Estoque_Atual.Text) = '' Then
        Begin
        Erro          := 'O Estoque Atual do Produto n�o foi informado';
        Campo_Retorno := 'Produto_Estoque_Atual';
        End
     Else If Trim(Produto_Data_Alteracao.Text) = '/  /' Then
        Begin
        Erro          := 'A Data de Altera��o n�o foi informada';
        Campo_Retorno := 'Produto_Data_Alteracao';
        End
     Else If Trim(Produto_Preco.Text) = '' Then
        Begin
        Erro          := 'O Pre�o Mensal do Produto n�o foi informado';
        Campo_Retorno := 'Produto_Preco';
        End
     Else
        Begin
        ConexaoBD.SQL_Produtos.SQL.Clear;
        ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' + #39 + Trim(Produto_Codigo.Text) + #39 );
        ConexaoBD.SQL_Produtos.Open;

        If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
           Begin
           Erro          := 'O C�digo do Produto J� existe';
           Campo_Retorno := 'Produto_Codigo';
        End;
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

procedure TNovoProdutoFornecedor00.Carrega_Tipo_Produto();
begin
     // Obtem os Tipos de Produtos

     ConexaoBD.SQL_Tipo_Produto.Close;
     ConexaoBD.SQL_Tipo_Produto.SQL.Clear;
     ConexaoBD.SQL_Tipo_Produto.SQL.Add('Select * from fb_tipos_produtos Order By fb_tipo_produto_codigo');
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

     ConexaoBD.SQL_Tipo_Produto.Close;

     Produto_Tipo.ItemIndex := 0;
end;

procedure TNovoProdutoFornecedor00.Carrega_Familia_Produto();
begin
     // Obtem as Fam�lias de Produtos

     ConexaoBD.SQL_Familia_Produto.Close;
     ConexaoBD.SQL_Familia_Produto.SQL.Clear;
     ConexaoBD.SQL_Familia_Produto.SQL.Add('Select * from fb_familias_produtos Order By fb_familia_produto_codigo');
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

     ConexaoBD.SQL_Familia_Produto.Close;

     Produto_Familia.ItemIndex := 0;
end;

procedure TNovoProdutoFornecedor00.BT_SairClick(Sender: TObject);
begin
     NovoProdutoFornecedor00.Close;
end;

procedure TNovoProdutoFornecedor00.FormShow(Sender: TObject);
begin
     Carrega_Tipo_Produto();
     Carrega_Familia_Produto();

     //*** Carrega as Datas ***

     Produto_Data_Alteracao.Text := DateToStr(Date());
end;

procedure TNovoProdutoFornecedor00.Produto_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_FamiliaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_TipoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_LoteKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_Codigo_BarrasKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_UnidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_Unidade_PesagemKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_PesoKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_Estoque_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_Estoque_AtualKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_Data_AlteracaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_Classif_FiscalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_Classif_TributariaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL, Fornecedor, Peso, Estoque_Inicial, Estoque_Atual, Desconto, Pedido_Padrao, Tipo_Produto, Familia_Produto: String;
   Vlr_Mensal, Vlr_IPI, Vlr_ICMS: String;
   Vlr_Calculo_Nro, Produto_Valor_Nro, Produto_Area_Nro: Real;
   Erro: Integer;

begin
     If Valida_Dados() Then
        Begin

        //*** Obtem o Status do Pedido Padr�o ***

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

        //*** Obtem o Nro do Tipo de Produto, Fam�lia do Produto ***

        Tipo_Produto    := Obtem_Nro_Antes_Traco(Produto_Tipo.Text);
        Familia_Produto := Obtem_Nro_Antes_Traco(Produto_Familia.Text);

        //*** Efetua a Inser��o ***

        Comando_SQL := 'Insert Into fb_produtos(';
        Comando_SQL := Comando_SQL + 'fb_produto_codigo,';
        Comando_SQL := Comando_SQL + 'fb_produto_referencia,';
        Comando_SQL := Comando_SQL + 'fb_produto_descricao,';
        Comando_SQL := Comando_SQL + 'fb_produto_familia,';
        Comando_SQL := Comando_SQL + 'fb_produto_peso,';
        Comando_SQL := Comando_SQL + 'fb_produto_unidade,';
        Comando_SQL := Comando_SQL + 'fb_produto_tipo,';
        Comando_SQL := Comando_SQL + 'fb_produto_estoque_inicial,';
        Comando_SQL := Comando_SQL + 'fb_produto_estoque_atual,';
        Comando_SQL := Comando_SQL + 'fb_produto_unidade_pesagem,';
        Comando_SQL := Comando_SQL + 'fb_produto_classif_tributaria,';
        Comando_SQL := Comando_SQL + 'fb_produto_classif_fiscal,';
        Comando_SQL := Comando_SQL + 'fb_produto_codigo_barras,';
        Comando_SQL := Comando_SQL + 'fb_produto_lote,';
        Comando_SQL := Comando_SQL + 'fb_produto_preco,';
        Comando_SQL := Comando_SQL + 'fb_produto_data_alteracao,';
        Comando_SQL := Comando_SQL + 'fb_produto_pedido_padrao,';
        Comando_SQL := Comando_SQL + 'fb_produto_ipi,';
        Comando_SQL := Comando_SQL + 'fb_produto_icms,';
        Comando_SQL := Comando_SQL + 'fb_produto_fornecedor)';
        Comando_SQL := Comando_SQL + 'Values(';
        Comando_SQL := Comando_SQL + #39 + Trim(Produto_Codigo.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Produto_Referencia.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Produto_Descricao.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + Trim(Familia_Produto) + ',';
        Comando_SQL := Comando_SQL + Trim(Peso) + ',';
        Comando_SQL := Comando_SQL + #39 + Produto_Unidade.Text + #39 + ',';
        Comando_SQL := Comando_SQL + Trim(Tipo_Produto) + ',';
        Comando_SQL := Comando_SQL + Trim(Estoque_Inicial) + ',';
        Comando_SQL := Comando_SQL + Trim(Estoque_Atual) + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Produto_Unidade_Pesagem.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + Trim(Produto_Classif_Tributaria.Text) + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Produto_Classif_Fiscal.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + Trim(Produto_Codigo_Barras.Text) + ',';
        Comando_SQL := Comando_SQL + Trim(Produto_Lote.Text) + ',';
        Comando_SQL := Comando_SQL + Trim(Vlr_Mensal) + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Produto_Data_Alteracao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Pedido_Padrao + #39 + ',';
        Comando_SQL := Comando_SQL + Trim(Vlr_IPI) + ',';
        Comando_SQL := Comando_SQL + Trim(Vlr_ICMS) + ',';
        Comando_SQL := Comando_SQL + Trim(Fornecedor) + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclus�o Efetuada...');

        NovoProdutoFornecedor00.Close;
     End;
end;

procedure TNovoProdutoFornecedor00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 D�gitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TNovoProdutoFornecedor00.Produto_PrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_VolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_Preco_DolarKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_Preco_Dolar_DuplyKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_Preco_DuplyKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_IPIKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_ICMSKeyPress(Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_ReferenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNovoProdutoFornecedor00.Produto_FornecedorKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
