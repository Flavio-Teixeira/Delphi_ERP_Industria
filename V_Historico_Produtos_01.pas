unit V_Historico_Produtos_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TVHistoricoProdutos01 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    editCodigo: TEdit;
    editDescricao: TEdit;
    SGD_Saidas: TStringGrid;
    SGD_Entradas: TStringGrid;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    edtEstado: TEdit;
    edtCidade: TEdit;
    edtBairro: TEdit;
    Label8: TLabel;
    editReferencia: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SGD_SaidasDblClick(Sender: TObject);
    procedure SGD_EntradasDblClick(Sender: TObject);
  private
    procedure Carrega_Grid_Saidas();
    procedure Carrega_Grid_Entradas();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VHistoricoProdutos01: TVHistoricoProdutos01;

implementation

uses Conexao_BD, Rotinas_Gerais, V_Historico_Clientes_02,
  V_Historico_Produtos_02;

{$R *.dfm}

procedure TVHistoricoProdutos01.Carrega_Grid_Saidas();

var
   Ind: Integer;
   Comando_SQL : String;
   Nome_Tabela_Nota: String;

begin
    //*** Prepara a Criação de Tabelas Temporárias ***

    Nome_Tabela_Nota         := 'fb_swap_'+Trim(Numero_HD('C'));

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***

    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Cria a Tabela Temporária de Notas Fiscais e Papeletas ***

    Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Nota + ' (';
    Comando_SQL := Comando_SQL + 'fb_swap_numero int(11) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo_tipo varchar(6) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nome varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_desconto double(7,3) default '+#39+'0.000'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_1 int(2) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_2 int(2) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_3 int(2) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_tipo_fatura varchar(15) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_tipo_tabela varchar(15) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_emite_lote char(1) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_tipo_transp varchar(15) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_transporta varchar(11) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_valor_desc double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_valor_pedido double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_valor_total double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_observacao text,';
    Comando_SQL := Comando_SQL + 'fb_swap_pgto_frete varchar(10) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_natureza_oper varchar(15) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_data_emissao date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_estado char(2) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_faturado int(1) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_vendedor int(3) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_banco int(3) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_1 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_1 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_1 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_1 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_1 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_1 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_1 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_1 varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_2 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_2 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_2 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_2 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_2 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_2 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_2 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_2 varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_3 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_3 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_3 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_3 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_3 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_3 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_3 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_3 varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_volume int(3) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_observacao_log text,';
    Comando_SQL := Comando_SQL + 'fb_swap_autonumeracao int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_valor_frete double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_autonumeracao)';
    Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Nota Fiscal ***

    Comando_SQL := 'Select n.*, p.fb_nota_fiscal_produto_numero, p.fb_nota_fiscal_produto_codigo ';
    Comando_SQL := Comando_SQL + 'From fb_notas_fiscais n, fb_notas_fiscais_produtos p, fb_clientes c ';
    Comando_SQL := Comando_SQL + 'Where (n.fb_nota_fiscal_numero = p.fb_nota_fiscal_produto_numero) ';
    Comando_SQL := Comando_SQL + 'and (n.fb_nota_fiscal_codigo = c.fb_cliente_codigo) ';
    Comando_SQL := Comando_SQL + 'and ((n.fb_nota_fiscal_data_emissao >= '+#39+Inverte_Data_Plus(edtDataInicial.Text,'amd','/')+#39+') ';
    Comando_SQL := Comando_SQL + 'and  (n.fb_nota_fiscal_data_emissao <= '+#39+Inverte_Data_Plus(edtDataFinal.Text,'amd','/')  +#39+')) ';

    if Trim(edtEstado.Text) <> '- Todos -' Then
        Comando_SQL := Comando_SQL + 'and (c.fb_cliente_estado = '+#39+Trim(edtEstado.Text)+#39+') ';
    if Trim(edtCidade.Text) <> '- - - - - - - - - - Todas - - - - - - - - - -' Then
        Comando_SQL := Comando_SQL + 'and (c.fb_cliente_cidade = '+#39+Trim(edtCidade.Text)+#39+') ';
    if Trim(edtBairro.Text) <> '- - - - - - - - - - Todos - - - - - - - - - -' Then
        Comando_SQL := Comando_SQL + 'and (c.fb_cliente_bairro = '+#39+Trim(edtBairro.Text)+#39+') ';

    Comando_SQL := Comando_SQL + 'and (p.fb_nota_fiscal_produto_codigo = '+#39+Trim(editCodigo.Text)+#39+')';

    ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtos.Close;
    ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtos.Open;

    If ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtos.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtos.First;

       While Not ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtos.Eof Do
             Begin

             Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
             Comando_SQL := Comando_SQL + 'fb_swap_numero,';
             Comando_SQL := Comando_SQL + 'fb_swap_codigo_tipo,';
             Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
             Comando_SQL := Comando_SQL + 'fb_swap_nome,';
             Comando_SQL := Comando_SQL + 'fb_swap_desconto,';
             Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_tipo_fatura,';
             Comando_SQL := Comando_SQL + 'fb_swap_tipo_tabela,';
             Comando_SQL := Comando_SQL + 'fb_swap_emite_lote,';
             Comando_SQL := Comando_SQL + 'fb_swap_tipo_transp,';
             Comando_SQL := Comando_SQL + 'fb_swap_transporta,';
             Comando_SQL := Comando_SQL + 'fb_swap_valor_desc,';
             Comando_SQL := Comando_SQL + 'fb_swap_valor_pedido,';
             Comando_SQL := Comando_SQL + 'fb_swap_valor_total,';
             Comando_SQL := Comando_SQL + 'fb_swap_observacao,';
             Comando_SQL := Comando_SQL + 'fb_swap_pgto_frete,';
             Comando_SQL := Comando_SQL + 'fb_swap_natureza_oper,';
             Comando_SQL := Comando_SQL + 'fb_swap_data_emissao,';
             Comando_SQL := Comando_SQL + 'fb_swap_estado,';
             Comando_SQL := Comando_SQL + 'fb_swap_faturado,';
             Comando_SQL := Comando_SQL + 'fb_swap_vendedor,';
             Comando_SQL := Comando_SQL + 'fb_swap_banco,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_volume,';
             Comando_SQL := Comando_SQL + 'fb_swap_observacao_log)';
             Comando_SQL := Comando_SQL + ' Values(';

             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_numero.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_codigo_tipo.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_codigo.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_nome.Text + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_desconto.Text) + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_cond_pgto_1.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_cond_pgto_2.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_cond_pgto_3.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_tipo_fatura.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_tipo_tabela.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_emite_lote.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_tipo_transp.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_transporta.Text + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_valor_desc.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_valor_pedido.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_valor_total.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_observacao.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_pgto_frete.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_natureza_oper.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_data_emissao.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_estado.Text + #39 + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_faturado.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_vendedor.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_banco.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_nro_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_forma_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_dt_vcto_1.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_dt_pgto_1.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_vlr_1.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_vlr_pgto_1.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_vlr_juros_1.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_cod_bco_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_nro_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_forma_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_dt_vcto_2.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_dt_pgto_2.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_vlr_2.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_vlr_pgto_2.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_vlr_juros_2.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_cod_bco_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_nro_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_forma_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_dt_vcto_3.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_dt_pgto_3.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_vlr_3.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_vlr_pgto_3.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_vlr_juros_3.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_dup_cod_bco_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_volume.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtosfb_nota_fiscal_observacao_log.Text + #39 + ')';

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Historico_Nota_Fiscal_e_Produtos.Next;
       End;
    End;

    //*** Dados Sobre a Papeleta ***

    Comando_SQL := 'Select n.*, p.fb_papeleta_produto_numero, p.fb_papeleta_produto_codigo ';
    Comando_SQL := Comando_SQL + 'From fb_papeletas n, fb_papeletas_produtos p, fb_clientes c ';
    Comando_SQL := Comando_SQL + 'Where (n.fb_papeleta_numero = p.fb_papeleta_produto_numero) ';
    Comando_SQL := Comando_SQL + 'and (n.fb_papeleta_codigo = c.fb_cliente_codigo) ';
    Comando_SQL := Comando_SQL + 'and ((n.fb_papeleta_data_emissao >= '+#39+Inverte_Data_Plus(edtDataInicial.Text,'amd','/')+#39+') ';
    Comando_SQL := Comando_SQL + 'and  (n.fb_papeleta_data_emissao <= '+#39+Inverte_Data_Plus(edtDataFinal.Text,'amd','/')  +#39+')) ';

    if Trim(edtEstado.Text) <> '- Todos -' Then
        Comando_SQL := Comando_SQL + 'and (c.fb_cliente_estado = '+#39+Trim(edtEstado.Text)+#39+') ';
    if Trim(edtCidade.Text) <> '- - - - - - - - - - Todas - - - - - - - - - -' Then
        Comando_SQL := Comando_SQL + 'and (c.fb_cliente_cidade = '+#39+Trim(edtCidade.Text)+#39+') ';
    if Trim(edtBairro.Text) <> '- - - - - - - - - - Todos - - - - - - - - - -' Then
        Comando_SQL := Comando_SQL + 'and (c.fb_cliente_bairro = '+#39+Trim(edtBairro.Text)+#39+') ';

    Comando_SQL := Comando_SQL + 'and (p.fb_papeleta_produto_codigo = '+#39+Trim(editCodigo.Text)+#39+')';

    ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtos.Close;
    ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtos.Open;

    If ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtos.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtos.First;

       While Not ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtos.Eof Do
             Begin
             Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
             Comando_SQL := Comando_SQL + 'fb_swap_numero,';
             Comando_SQL := Comando_SQL + 'fb_swap_codigo_tipo,';
             Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
             Comando_SQL := Comando_SQL + 'fb_swap_nome,';
             Comando_SQL := Comando_SQL + 'fb_swap_desconto,';
             Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_tipo_fatura,';
             Comando_SQL := Comando_SQL + 'fb_swap_tipo_tabela,';
             Comando_SQL := Comando_SQL + 'fb_swap_emite_lote,';
             Comando_SQL := Comando_SQL + 'fb_swap_tipo_transp,';
             Comando_SQL := Comando_SQL + 'fb_swap_transporta,';
             Comando_SQL := Comando_SQL + 'fb_swap_valor_desc,';
             Comando_SQL := Comando_SQL + 'fb_swap_valor_pedido,';
             Comando_SQL := Comando_SQL + 'fb_swap_valor_total,';
             Comando_SQL := Comando_SQL + 'fb_swap_observacao,';
             Comando_SQL := Comando_SQL + 'fb_swap_pgto_frete,';
             Comando_SQL := Comando_SQL + 'fb_swap_natureza_oper,';
             Comando_SQL := Comando_SQL + 'fb_swap_data_emissao,';
             Comando_SQL := Comando_SQL + 'fb_swap_estado,';
             Comando_SQL := Comando_SQL + 'fb_swap_faturado,';
             Comando_SQL := Comando_SQL + 'fb_swap_vendedor,';
             Comando_SQL := Comando_SQL + 'fb_swap_banco,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_volume,';
             Comando_SQL := Comando_SQL + 'fb_swap_observacao_log)';
             Comando_SQL := Comando_SQL + ' Values(';

             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_numero.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_codigo_tipo.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_codigo.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_nome.Text + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_desconto.Text) + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_cond_pgto_1.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_cond_pgto_2.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_cond_pgto_3.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_tipo_fatura.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_tipo_tabela.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_emite_lote.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_tipo_transp.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_transporta.Text + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_valor_desc.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_valor_pedido.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_valor_total.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_observacao.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_pgto_frete.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_natureza_oper.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_data_emissao.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_estado.Text + #39 + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_faturado.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_vendedor.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_banco.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_nro_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_forma_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_dt_vcto_1.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_dt_pgto_1.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_vlr_1.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_vlr_pgto_1.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_vlr_juros_1.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_cod_bco_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_nro_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_forma_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_dt_vcto_2.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_dt_pgto_2.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_vlr_2.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_vlr_pgto_2.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_vlr_juros_2.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_cod_bco_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_nro_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_forma_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_dt_vcto_3.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_dt_pgto_3.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_vlr_3.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_vlr_pgto_3.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_vlr_juros_3.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_dup_cod_bco_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_volume.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtosfb_papeleta_observacao_log.Text + #39 + ')';

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Historico_Papeletas_e_Produtos.Next;
       End;
    End;

    //*** Dados Sobre A Nota Fiscal ***

    Comando_SQL := 'Select * from ' + Trim(Nome_Tabela_Nota) + ' Order By fb_swap_data_emissao Desc, fb_swap_numero Desc';

    ConexaoBD.SQL_FB_Swap_Notas.Close;
    ConexaoBD.SQL_FB_Swap_Notas.SQL.Clear;
    ConexaoBD.SQL_FB_Swap_Notas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Swap_Notas.Open;

    //*** Carrega o Novo Grid ***

    SGD_Saidas.ColCount := 22;

    GroupBox2.Caption := '   Saídas   - ' + IntToStr(ConexaoBD.SQL_FB_Swap_Notas.RecordCount) + ' Registros   ';

    If ConexaoBD.SQL_FB_Swap_Notas.RecordCount > 0 Then
       Begin
       SGD_Saidas.RowCount := (ConexaoBD.SQL_FB_Swap_Notas.RecordCount + 1);
       End
    Else
       Begin
       SGD_Saidas.RowCount := 2;
    End;

    //*** Carrega a Lista de Relações de Compras ***
    //*** Zera Grid ***

    For Ind := 0 To SGD_Saidas.RowCount Do
        Begin
        SGD_Saidas.Cells[0,Ind]  := '';
        SGD_Saidas.Cells[1,Ind]  := '';
        SGD_Saidas.Cells[2,Ind]  := '';
        SGD_Saidas.Cells[3,Ind]  := '';
        SGD_Saidas.Cells[4,Ind]  := '';
        SGD_Saidas.Cells[5,Ind]  := '';
        SGD_Saidas.Cells[6,Ind]  := '';
        SGD_Saidas.Cells[7,Ind]  := '';
        SGD_Saidas.Cells[8,Ind]  := '';
        SGD_Saidas.Cells[9,Ind]  := '';
        SGD_Saidas.Cells[10,Ind] := '';
        SGD_Saidas.Cells[11,Ind] := '';
        SGD_Saidas.Cells[12,Ind] := '';
        SGD_Saidas.Cells[13,Ind] := '';
        SGD_Saidas.Cells[14,Ind] := '';
        SGD_Saidas.Cells[15,Ind] := '';
        SGD_Saidas.Cells[16,Ind] := '';
        SGD_Saidas.Cells[17,Ind] := '';
        SGD_Saidas.Cells[18,Ind] := '';
        SGD_Saidas.Cells[19,Ind] := '';
        SGD_Saidas.Cells[20,Ind] := '';
        SGD_Saidas.Cells[21,Ind] := '';
    End;

    //*** Preparação do StringGrid ***

    //*** Faturamento ***
    SGD_Saidas.Cells[0,0]   := 'Faturamento';
    SGD_Saidas.ColWidths[0] := 65;

    //*** Nro.Nota ***
    SGD_Saidas.Cells[1,0]   := 'Nro.Nota';
    SGD_Saidas.ColWidths[1] := 50;

    //*** Natureza de Operação ***
    SGD_Saidas.Cells[2,0]   := 'Natureza de Operação';
    SGD_Saidas.ColWidths[2] := 165;

    //*** Data de Emissão ***
    SGD_Saidas.Cells[3,0]   := 'Dt.Emissão';
    SGD_Saidas.ColWidths[3] := 65;

    //*** Vlr. do Pedido ***
    SGD_Saidas.Cells[4,0]   := 'Vlr.Pedido';
    SGD_Saidas.ColWidths[4] := 65;

    //*** Vlr. do Desconto ***
    SGD_Saidas.Cells[5,0]   := 'Vlr.Desconto';
    SGD_Saidas.ColWidths[5] := 70;

    //*** Vlr. da Nota ***
    SGD_Saidas.Cells[6,0]   := 'Vlr.Nota';
    SGD_Saidas.ColWidths[6] := 65;

    //*** Separador ***
    SGD_Saidas.Cells[7,0]   := ' ';
    SGD_Saidas.ColWidths[7] := 10;

    //*** Condição de Pagamento ***
    SGD_Saidas.Cells[8,0]   := 'Cond.Pgto';
    SGD_Saidas.ColWidths[8] := 60;

    //*** Data de Vencto 1 ***
    SGD_Saidas.Cells[9,0]   := 'Dt.Vcto 1';
    SGD_Saidas.ColWidths[9] := 65;

    //*** Data de Pagto 1 ***
    SGD_Saidas.Cells[10,0]   := 'Dt.Pgto 1';
    SGD_Saidas.ColWidths[10] := 65;

    //*** Valor Pago 1 ***
    SGD_Saidas.Cells[11,0]   := 'Vlr.Pago 1';
    SGD_Saidas.ColWidths[11] := 65;

    //*** Separador ***
    SGD_Saidas.Cells[12,0]   := ' ';
    SGD_Saidas.ColWidths[12] := 10;

    //*** Data de Vencto 2 ***
    SGD_Saidas.Cells[13,0]   := 'Dt.Vcto 2';
    SGD_Saidas.ColWidths[13] := 65;

    //*** Data de Pagto 2 ***
    SGD_Saidas.Cells[14,0]   := 'Dt.Pgto 2';
    SGD_Saidas.ColWidths[14] := 65;

    //*** Valor Pago 2 ***
    SGD_Saidas.Cells[15,0]   := 'Vlr.Pago 2';
    SGD_Saidas.ColWidths[15] := 65;

    //*** Separador ***
    SGD_Saidas.Cells[16,0]   := ' ';
    SGD_Saidas.ColWidths[16] := 10;

    //*** Data de Vencto 3 ***
    SGD_Saidas.Cells[17,0]   := 'Dt.Vcto 3';
    SGD_Saidas.ColWidths[17] := 65;

    //*** Data de Pagto 3 ***
    SGD_Saidas.Cells[18,0]   := 'Dt.Pgto 3';
    SGD_Saidas.ColWidths[18] := 65;

    //*** Valor Pago 3 ***
    SGD_Saidas.Cells[19,0]   := 'Vlr.Pago 3';
    SGD_Saidas.ColWidths[19] := 65;

    //*** Separador ***
    SGD_Saidas.Cells[20,0]   := ' ';
    SGD_Saidas.ColWidths[20] := 10;

    //*** Observação da Nota ***
    SGD_Saidas.Cells[21,0]   := 'Observação da Nota';
    SGD_Saidas.ColWidths[21] := 550;

    //*** Carrega o Grid com as Informações da Tabela ***

    If ConexaoBD.SQL_FB_Swap_Notas.RecordCount > 0 Then
       Begin

       Ind := 1;
       ConexaoBD.SQL_FB_Swap_Notas.First;

       While Not ConexaoBD.SQL_FB_Swap_Notas.Eof Do
             Begin
             //*** Faturamento ***
             SGD_Saidas.Cells[0,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_tipo_fatura.Text;

             //*** Nro.Nota ***
             SGD_Saidas.Cells[1,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_numero.Text;

             //*** Natureza de Operação ***
             SGD_Saidas.Cells[2,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_natureza_oper.Text;

             //*** Data de Emissão ***
             SGD_Saidas.Cells[3,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_data_emissao.Text;

             //*** Vlr. do Pedido ***
             SGD_Saidas.Cells[4,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_valor_pedido.Text;

             //*** Vlr. do Desconto ***
             SGD_Saidas.Cells[5,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_valor_desc.Text;

             //*** Vlr. da Nota ***
             SGD_Saidas.Cells[6,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_valor_total.Text;

             //*** Condição de Pagamento ***

             SGD_Saidas.Cells[8,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_1.Text;

             If Trim(ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_2.Text) <> '' Then
                Begin
                SGD_Saidas.Cells[8,Ind] := Trim(SGD_Saidas.Cells[8,Ind]) + '-' + Trim(ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_2.Text);
                End
             Else If Trim(ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_3.Text) <> '' Then
                Begin
                SGD_Saidas.Cells[8,Ind] := Trim(SGD_Saidas.Cells[8,Ind]) + '-' + Trim(ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_3.Text);
             End;

             //*** Data de Vencto 1 ***
             SGD_Saidas.Cells[9,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_vcto_1.Text;

             //*** Data de Pagto 1 ***
             SGD_Saidas.Cells[10,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_pgto_1.Text;

             //*** Valor Pago 1 ***
             SGD_Saidas.Cells[11,Ind]  := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_vlr_pgto_1.Text;

             //*** Data de Vencto 2 ***
             SGD_Saidas.Cells[13,Ind]  := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_vcto_2.Text;

             //*** Data de Pagto 2 ***
             SGD_Saidas.Cells[14,Ind]  := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_pgto_2.Text;

             //*** Valor Pago 2 ***
             SGD_Saidas.Cells[15,Ind]  := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_vlr_pgto_2.Text;

             //*** Data de Vencto 3 ***
             SGD_Saidas.Cells[17,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_vcto_3.Text;

             //*** Data de Pagto 3 ***
             SGD_Saidas.Cells[18,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_pgto_3.Text;

             //*** Valor Pago 3 ***
             SGD_Saidas.Cells[19,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_vlr_pgto_3.Text;

             //*** Observação da Nota ***

             If Trim(SGD_Saidas.Cells[0,Ind]) = 'Nota Fiscal' Then
                Begin
                Comando_SQL := 'Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Trim(SGD_Saidas.Cells[1,Ind]);

                ConexaoBD.SQL_FB_Nota_Fiscal.Close;
                ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
                ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_FB_Nota_Fiscal.Open;

                SGD_Saidas.Cells[21,Ind] := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_observacao.Text;
                End
             Else
                Begin
                Comando_SQL := 'Select * from fb_papeletas Where fb_papeleta_numero = ' + Trim(SGD_Saidas.Cells[1,Ind]);

                ConexaoBD.SQL_FB_Papeletas.Close;
                ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
                ConexaoBD.SQL_FB_Papeletas.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_FB_Papeletas.Open;

                SGD_Saidas.Cells[21,Ind] := ConexaoBD.SQL_FB_Papeletasfb_papeleta_observacao.Text;
             End;

             Ind := Ind + 1;
             ConexaoBD.SQL_FB_Swap_Notas.Next;
       End;
    End;

    ConexaoBD.SQL_FB_Swap_Notas.Close;

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***

    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TVHistoricoProdutos01.Carrega_Grid_Entradas();

var
   Ind: Integer;
   Comando_SQL : String;
   Nome_Tabela_Nota: String;

begin
    //*** Prepara a Criação de Tabelas Temporárias ***

    Nome_Tabela_Nota         := 'fb_swap_'+Trim(Numero_HD('C'));

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***

    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Cria a Tabela Temporária de Notas Fiscais e Papeletas ***

    Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Nota + ' (';
    Comando_SQL := Comando_SQL + 'fb_swap_numero int(11) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo_tipo varchar(6) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_codigo varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_nome varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_desconto double(7,3) default '+#39+'0.000'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_1 int(2) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_2 int(2) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_3 int(2) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_tipo_fatura varchar(15) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_tipo_tabela varchar(15) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_emite_lote char(1) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_tipo_transp varchar(15) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_transporta varchar(11) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_valor_desc double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_valor_pedido double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_valor_total double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_observacao text,';
    Comando_SQL := Comando_SQL + 'fb_swap_pgto_frete varchar(10) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_natureza_oper varchar(15) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_data_emissao date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_estado char(2) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_faturado int(1) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_vendedor int(3) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_banco int(3) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_1 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_1 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_1 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_1 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_1 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_1 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_1 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_1 varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_2 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_2 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_2 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_2 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_2 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_2 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_2 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_2 varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_3 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_3 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_3 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_3 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_3 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_3 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_3 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_3 varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_volume int(3) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_observacao_log text,';
    Comando_SQL := Comando_SQL + 'fb_swap_autonumeracao int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_valor_frete double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_autonumeracao)';
    Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Nota Fiscal ***

    Comando_SQL := 'Select n.*, p.fb_nota_entrada_produto_numero, p.fb_nota_entrada_produto_codigo ';
    Comando_SQL := Comando_SQL + 'From fb_notas_entradas n, fb_notas_entradas_produtos p, fb_clientes c ';
    Comando_SQL := Comando_SQL + 'Where (n.fb_nota_entrada_numero = p.fb_nota_entrada_produto_numero) ';
    Comando_SQL := Comando_SQL + 'and (n.fb_nota_entrada_codigo = c.fb_cliente_codigo) ';
    Comando_SQL := Comando_SQL + 'and ((n.fb_nota_entrada_data_emissao >= '+#39+Inverte_Data_Plus(edtDataInicial.Text,'amd','/')+#39+') ';
    Comando_SQL := Comando_SQL + 'and  (n.fb_nota_entrada_data_emissao <= '+#39+Inverte_Data_Plus(edtDataFinal.Text,'amd','/')  +#39+')) ';

    if Trim(edtEstado.Text) <> '- Todos -' Then
        Comando_SQL := Comando_SQL + 'and (c.fb_cliente_estado = '+#39+Trim(edtEstado.Text)+#39+') ';
    if Trim(edtCidade.Text) <> '- - - - - - - - - - Todas - - - - - - - - - -' Then
        Comando_SQL := Comando_SQL + 'and (c.fb_cliente_cidade = '+#39+Trim(edtCidade.Text)+#39+') ';
    if Trim(edtBairro.Text) <> '- - - - - - - - - - Todos - - - - - - - - - -' Then
        Comando_SQL := Comando_SQL + 'and (c.fb_cliente_bairro = '+#39+Trim(edtBairro.Text)+#39+') ';

    Comando_SQL := Comando_SQL + 'and (p.fb_nota_entrada_produto_codigo = '+#39+Trim(editCodigo.Text)+#39+')';

    ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtos.Close;
    ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtos.Open;

    If ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtos.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtos.First;

       While Not ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtos.Eof Do
             Begin

             Comando_SQL := 'Insert into ' + Nome_Tabela_Nota + '(';
             Comando_SQL := Comando_SQL + 'fb_swap_numero,';
             Comando_SQL := Comando_SQL + 'fb_swap_codigo_tipo,';
             Comando_SQL := Comando_SQL + 'fb_swap_codigo,';
             Comando_SQL := Comando_SQL + 'fb_swap_nome,';
             Comando_SQL := Comando_SQL + 'fb_swap_desconto,';
             Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_tipo_fatura,';
             Comando_SQL := Comando_SQL + 'fb_swap_tipo_tabela,';
             Comando_SQL := Comando_SQL + 'fb_swap_emite_lote,';
             Comando_SQL := Comando_SQL + 'fb_swap_tipo_transp,';
             Comando_SQL := Comando_SQL + 'fb_swap_transporta,';
             Comando_SQL := Comando_SQL + 'fb_swap_valor_desc,';
             Comando_SQL := Comando_SQL + 'fb_swap_valor_pedido,';
             Comando_SQL := Comando_SQL + 'fb_swap_valor_total,';
             Comando_SQL := Comando_SQL + 'fb_swap_observacao,';
             Comando_SQL := Comando_SQL + 'fb_swap_pgto_frete,';
             Comando_SQL := Comando_SQL + 'fb_swap_natureza_oper,';
             Comando_SQL := Comando_SQL + 'fb_swap_data_emissao,';
             Comando_SQL := Comando_SQL + 'fb_swap_estado,';
             Comando_SQL := Comando_SQL + 'fb_swap_faturado,';
             Comando_SQL := Comando_SQL + 'fb_swap_vendedor,';
             Comando_SQL := Comando_SQL + 'fb_swap_banco,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_1,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_2,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_3,';
             Comando_SQL := Comando_SQL + 'fb_swap_volume,';
             Comando_SQL := Comando_SQL + 'fb_swap_observacao_log)';
             Comando_SQL := Comando_SQL + ' Values(';

             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_numero.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_codigo_tipo.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_codigo.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_nome.Text + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_desconto.Text) + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_cond_pgto_1.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_cond_pgto_2.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_cond_pgto_3.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_tipo_fatura.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_tipo_tabela.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_emite_lote.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_tipo_transp.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_transporta.Text + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_valor_desc.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_valor_pedido.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_valor_total.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_observacao.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_pgto_frete.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_natureza_oper.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_data_emissao.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_estado.Text + #39 + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_faturado.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_vendedor.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_banco.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_nro_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_forma_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_dt_vcto_1.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_dt_pgto_1.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_vlr_1.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_vlr_pgt_1.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_vlr_juro_1.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_cod_bco_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_nro_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_forma_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_dt_vcto_2.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_dt_pgto_2.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_vlr_2.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_vlr_pgt_2.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_vlr_juro_2.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_cod_bco_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_nro_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_forma_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_dt_vcto_3.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_dt_pgto_3.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_vlr_3.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_vlr_pgt_3.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_vlr_juro_3.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_dup_cod_bco_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_volume.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtosfb_nota_entrada_observacao_log.Text + #39 + ')';

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Historico_Nota_Entrada_e_Produtos.Next;
       End;
    End;

    //*** Dados Sobre A Nota Fiscal ***

    Comando_SQL := 'Select * from ' + Trim(Nome_Tabela_Nota) + ' Order By fb_swap_data_emissao Desc, fb_swap_numero Desc';

    ConexaoBD.SQL_FB_Swap_Notas.Close;
    ConexaoBD.SQL_FB_Swap_Notas.SQL.Clear;
    ConexaoBD.SQL_FB_Swap_Notas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Swap_Notas.Open;

    //*** Carrega o Novo Grid ***

    SGD_Entradas.ColCount := 22;

    GroupBox3.Caption := '   Entradas   - ' + IntToStr(ConexaoBD.SQL_FB_Swap_Notas.RecordCount) + ' Registros   ';

    If ConexaoBD.SQL_FB_Swap_Notas.RecordCount > 0 Then
       Begin
       SGD_Entradas.RowCount := (ConexaoBD.SQL_FB_Swap_Notas.RecordCount + 1);
       End
    Else
       Begin
       SGD_Entradas.RowCount := 2;
    End;

    //*** Carrega a Lista de Relações de Compras ***
    //*** Zera Grid ***

    For Ind := 0 To SGD_Entradas.RowCount Do
        Begin
        SGD_Entradas.Cells[00,Ind] := '';
        SGD_Entradas.Cells[01,Ind] := '';
        SGD_Entradas.Cells[02,Ind] := '';
        SGD_Entradas.Cells[03,Ind] := '';
        SGD_Entradas.Cells[04,Ind] := '';
        SGD_Entradas.Cells[05,Ind] := '';
        SGD_Entradas.Cells[06,Ind] := '';
        SGD_Entradas.Cells[07,Ind] := '';
        SGD_Entradas.Cells[08,Ind] := '';
        SGD_Entradas.Cells[09,Ind] := '';
        SGD_Entradas.Cells[10,Ind] := '';
        SGD_Entradas.Cells[11,Ind] := '';
        SGD_Entradas.Cells[12,Ind] := '';
        SGD_Entradas.Cells[13,Ind] := '';
        SGD_Entradas.Cells[14,Ind] := '';
        SGD_Entradas.Cells[15,Ind] := '';
        SGD_Entradas.Cells[16,Ind] := '';
        SGD_Entradas.Cells[17,Ind] := '';
        SGD_Entradas.Cells[18,Ind] := '';
        SGD_Entradas.Cells[19,Ind] := '';
        SGD_Entradas.Cells[20,Ind] := '';
        SGD_Entradas.Cells[21,Ind] := '';
    End;

    //*** Preparação do StringGrid ***

    //*** Faturamento ***
    SGD_Entradas.Cells[0,0]   := 'Faturamento';
    SGD_Entradas.ColWidths[0] := 65;

    //*** Nro.Nota ***
    SGD_Entradas.Cells[1,0]   := 'Nro.Nota';
    SGD_Entradas.ColWidths[1] := 50;

    //*** Natureza de Operação ***
    SGD_Entradas.Cells[2,0]   := 'Natureza de Operação';
    SGD_Entradas.ColWidths[2] := 165;

    //*** Data de Emissão ***
    SGD_Entradas.Cells[3,0]   := 'Dt.Emissão';
    SGD_Entradas.ColWidths[3] := 65;

    //*** Vlr. do Pedido ***
    SGD_Entradas.Cells[4,0]   := 'Vlr.Pedido';
    SGD_Entradas.ColWidths[4] := 65;

    //*** Vlr. do Desconto ***
    SGD_Entradas.Cells[5,0]   := 'Vlr.Desconto';
    SGD_Entradas.ColWidths[5] := 70;

    //*** Vlr. da Nota ***
    SGD_Entradas.Cells[6,0]   := 'Vlr.Nota';
    SGD_Entradas.ColWidths[6] := 65;

    //*** Separador ***
    SGD_Entradas.Cells[7,0]   := ' ';
    SGD_Entradas.ColWidths[7] := 10;

    //*** Condição de Pagamento ***
    SGD_Entradas.Cells[8,0]   := 'Cond.Pgto';
    SGD_Entradas.ColWidths[8] := 60;

    //*** Data de Vencto 1 ***
    SGD_Entradas.Cells[9,0]   := 'Dt.Vcto 1';
    SGD_Entradas.ColWidths[9] := 65;

    //*** Data de Pagto 1 ***
    SGD_Entradas.Cells[10,0]   := 'Dt.Pgto 1';
    SGD_Entradas.ColWidths[10] := 65;

    //*** Valor Pago 1 ***
    SGD_Entradas.Cells[11,0]   := 'Vlr.Pago 1';
    SGD_Entradas.ColWidths[11] := 65;

    //*** Separador ***
    SGD_Entradas.Cells[12,0]   := ' ';
    SGD_Entradas.ColWidths[12] := 10;

    //*** Data de Vencto 2 ***
    SGD_Entradas.Cells[13,0]   := 'Dt.Vcto 2';
    SGD_Entradas.ColWidths[13] := 65;

    //*** Data de Pagto 2 ***
    SGD_Entradas.Cells[14,0]   := 'Dt.Pgto 2';
    SGD_Entradas.ColWidths[14] := 65;

    //*** Valor Pago 2 ***
    SGD_Entradas.Cells[15,0]   := 'Vlr.Pago 2';
    SGD_Entradas.ColWidths[15] := 65;

    //*** Separador ***
    SGD_Entradas.Cells[16,0]   := ' ';
    SGD_Entradas.ColWidths[16] := 10;

    //*** Data de Vencto 3 ***
    SGD_Entradas.Cells[17,0]   := 'Dt.Vcto 3';
    SGD_Entradas.ColWidths[17] := 65;

    //*** Data de Pagto 3 ***
    SGD_Entradas.Cells[18,0]   := 'Dt.Pgto 3';
    SGD_Entradas.ColWidths[18] := 65;

    //*** Valor Pago 3 ***
    SGD_Entradas.Cells[19,0]   := 'Vlr.Pago 3';
    SGD_Entradas.ColWidths[19] := 65;

    //*** Separador ***
    SGD_Entradas.Cells[20,0]   := ' ';
    SGD_Entradas.ColWidths[20] := 10;

    //*** Observação da Nota ***
    SGD_Entradas.Cells[21,0]   := 'Observação da Nota';
    SGD_Entradas.ColWidths[21] := 550;

    //*** Carrega o Grid com as Informações da Tabela ***

    If ConexaoBD.SQL_FB_Swap_Notas.RecordCount > 0 Then
       Begin

       Ind := 1;
       ConexaoBD.SQL_FB_Swap_Notas.First;

       While Not ConexaoBD.SQL_FB_Swap_Notas.Eof Do
             Begin
             //*** Faturamento ***
             SGD_Entradas.Cells[0,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_tipo_fatura.Text;

             //*** Nro.Nota ***
             SGD_Entradas.Cells[1,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_numero.Text;

             //*** Natureza de Operação ***
             SGD_Entradas.Cells[2,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_natureza_oper.Text;

             //*** Data de Emissão ***
             SGD_Entradas.Cells[3,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_data_emissao.Text;

             //*** Vlr. do Pedido ***
             SGD_Entradas.Cells[4,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_valor_pedido.Text;

             //*** Vlr. do Desconto ***
             SGD_Entradas.Cells[5,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_valor_desc.Text;

             //*** Vlr. da Nota ***
             SGD_Entradas.Cells[6,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_valor_total.Text;

             //*** Condição de Pagamento ***

             SGD_Entradas.Cells[8,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_1.Text;

             If Trim(ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_2.Text) <> '' Then
                Begin
                SGD_Entradas.Cells[8,Ind] := Trim(SGD_Entradas.Cells[8,Ind]) + '-' + Trim(ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_2.Text);
                End
             Else If Trim(ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_3.Text) <> '' Then
                Begin
                SGD_Entradas.Cells[8,Ind] := Trim(SGD_Entradas.Cells[8,Ind]) + '-' + Trim(ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_3.Text);
             End;

             //*** Data de Vencto 1 ***
             SGD_Entradas.Cells[9,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_vcto_1.Text;

             //*** Data de Pagto 1 ***
             SGD_Entradas.Cells[10,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_pgto_1.Text;

             //*** Valor Pago 1 ***
             SGD_Entradas.Cells[11,Ind]  := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_vlr_pgto_1.Text;

             //*** Data de Vencto 2 ***
             SGD_Entradas.Cells[13,Ind]  := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_vcto_2.Text;

             //*** Data de Pagto 2 ***
             SGD_Entradas.Cells[14,Ind]  := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_pgto_2.Text;

             //*** Valor Pago 2 ***
             SGD_Entradas.Cells[15,Ind]  := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_vlr_pgto_2.Text;

             //*** Data de Vencto 3 ***
             SGD_Entradas.Cells[17,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_vcto_3.Text;

             //*** Data de Pagto 3 ***
             SGD_Entradas.Cells[18,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_dt_pgto_3.Text;

             //*** Valor Pago 3 ***
             SGD_Entradas.Cells[19,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_dup_vlr_pgto_3.Text;

             //*** Observação da Nota ***

             {If Trim(SGD_Entradas.Cells[0,Ind]) = 'Nota Entrada' Then
                Begin
                Comando_SQL := 'Select * from fb_notas_fiscais Where fb_nota_entrada_numero = ' + Trim(SGD_Entradas.Cells[1,Ind]);

                ConexaoBD.SQL_FB_Notas_Entradas.Close;
                ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
                ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_FB_Notas_Entradas.Open;

                SGD_Entradas.Cells[21,Ind] := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_observacao.Text;
             End; }

             Ind := Ind + 1;
             ConexaoBD.SQL_FB_Swap_Notas.Next;
       End;
    End;

    ConexaoBD.SQL_FB_Swap_Notas.Close;

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***

    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TVHistoricoProdutos01.FormShow(Sender: TObject);
begin
    Ampulheta();
    Carrega_Grid_Saidas();
    Carrega_Grid_Entradas();
    Seta();
end;

procedure TVHistoricoProdutos01.BitBtn1Click(Sender: TObject);
begin
    VHistoricoProdutos01.Close;
end;

procedure TVHistoricoProdutos01.SGD_SaidasDblClick(Sender: TObject);
begin
     If Trim(SGD_Saidas.Cells[0,SGD_Saidas.Row]) <> '' Then
        Begin

        Application.CreateForm(TVHistoricoClientes02,VHistoricoClientes02);

        VHistoricoClientes02.Nro_Pedido.Text     := Trim(SGD_Saidas.Cells[1,SGD_Saidas.Row]);
        VHistoricoClientes02.Tipo_Fatura.Text    := Trim(SGD_Saidas.Cells[0,SGD_Saidas.Row]);

        VHistoricoClientes02.ShowModal;
        VHistoricoClientes02.Destroy;
     End;
end;

procedure TVHistoricoProdutos01.SGD_EntradasDblClick(Sender: TObject);
begin
     If Trim(SGD_Entradas.Cells[0,SGD_Entradas.Row]) <> '' Then
        Begin

        Application.CreateForm(TVHistoricoProdutos02,VHistoricoProdutos02);

        VHistoricoProdutos02.Nro_Nota_Fiscal.Text     := Trim(SGD_Entradas.Cells[1,SGD_Entradas.Row]);

        VHistoricoProdutos02.ShowModal;
        VHistoricoProdutos02.Destroy;
     End;
end;

end.
