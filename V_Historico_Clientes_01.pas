unit V_Historico_Clientes_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBCtrls;

type
  TVHistoricoClientes01 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Nro_Tipo_Cliente: TEdit;
    Nro_Banco: TEdit;
    Nro_Zona: TEdit;
    Nro_Representante: TEdit;
    Nro_Transportadora: TEdit;
    Nro_Cliente_Tipo_Empresa: TEdit;
    Nro_Tipo_Tabela: TEdit;
    Nro_Pgto_Frete: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Cliente_Mensagem_Mascara: TLabel;
    Cliente_Codigo_Tipo: TComboBox;
    Cliente_Razao_Social: TEdit;
    Cliente_Codigo_CNPJ: TMaskEdit;
    Cliente_Codigo_CPF: TMaskEdit;
    Cliente_Codigo_RG: TEdit;
    Cliente_Codigo_EMail: TEdit;
    Panel2: TPanel;
    GroupBox8: TGroupBox;
    SGD_Compras: TStringGrid;
    Nro_Codigo_Cliente: TEdit;
    DBG_Observacao_Papeleta: TDBMemo;
    DBG_Observacao_Nota: TDBMemo;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure SGD_ComprasDblClick(Sender: TObject);
    procedure SGD_ComprasKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure Exibe_Exemplo_Codigo();
    procedure Carrega_Grid_Compras();
  end;

var
  VHistoricoClientes01: TVHistoricoClientes01;

implementation

uses Conexao_BD, Rotinas_Gerais, V_Historico_Clientes_02;

{$R *.dfm}

procedure TVHistoricoClientes01.FormShow(Sender: TObject);
begin
     Ampulheta();

     Exibe_Exemplo_Codigo();
     Carrega_Grid_Compras();

     Seta();
end;

procedure TVHistoricoClientes01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TVHistoricoClientes01.Exibe_Exemplo_Codigo();
begin
     If Cliente_Codigo_Tipo.Text = 'CNPJ' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '(Exemplo: 99.999.999/9999-99)';
        Cliente_Codigo_CNPJ.Visible  := True;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := False;
        End
     Else If Cliente_Codigo_Tipo.Text = 'CPF' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '(Exemplo: 999.999.999-99)';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := True;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := False;
        End
     Else If Cliente_Codigo_Tipo.Text = 'RG' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := True;
        Cliente_Codigo_EMail.Visible := False;
        End
     Else If Cliente_Codigo_Tipo.Text = 'E-Mail' Then
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
        Cliente_Codigo_CNPJ.Visible  := False;
        Cliente_Codigo_CPF.Visible   := False;
        Cliente_Codigo_RG.Visible    := False;
        Cliente_Codigo_EMail.Visible := True;
        End
     Else
        Begin
        Cliente_Mensagem_Mascara.Caption := '';
     End;
end;

procedure TVHistoricoClientes01.BT_SairClick(Sender: TObject);
begin
     VHistoricoClientes01.Close;
end;

procedure TVHistoricoClientes01.Carrega_Grid_Compras();

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
    Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_4 int(2) default '+#39+'0'+#39+',';
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
    Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_1 varchar(7) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_1 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_1 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_1 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_1 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_1 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_1 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_1 varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_2 varchar(7) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_2 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_2 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_2 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_2 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_2 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_2 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_2 varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_3 varchar(7) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_3 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_3 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_3 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_3 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_3 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_3 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_3 varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_nro_4 varchar(7) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_forma_4 varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_vcto_4 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_dt_pgto_4 date default '+#39+'0000-00-00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_4 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_pgto_4 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_vlr_juros_4 double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_dup_cod_bco_4 varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_volume int(3) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_observacao_log text,';
    Comando_SQL := Comando_SQL + 'fb_swap_autonumeracao int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_valor_frete double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_valor_ipi double(13,2) default NULL,';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_autonumeracao)';
    Comando_SQL := Comando_SQL + ') ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Nota Fiscal ***

    Comando_SQL := 'Select * from fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo = ' + #39 + Trim(Nro_Codigo_Cliente.Text) + #39;

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Nota_Fiscal.First;

       While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
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
             Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_4,';
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
             Comando_SQL := Comando_SQL + 'fb_swap_observacao_log,';
             Comando_SQL := Comando_SQL + 'fb_swap_valor_ipi)';
             Comando_SQL := Comando_SQL + ' Values(';

             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo_tipo.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_desconto.Text) + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_1.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_2.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_3.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_4.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_fatura.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_tabela.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_emite_lote.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_transp.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_desc.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_pedido.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_observacao.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_pgto_frete.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_estado.Text + #39 + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_faturado.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_vendedor.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_1.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_1.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_juros_1.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_cod_bco_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_2.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_2.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_juros_2.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_cod_bco_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_3.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_3.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_juros_3.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_cod_bco_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_volume.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_observacao_log.Text + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text) + ')';

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Nota_Fiscal.Next;
       End;
    End;

    //*** Dados Sobre a Papeleta ***

    Comando_SQL := 'Select * from fb_papeletas Where ';
    Comando_SQL := Comando_SQL + 'fb_papeleta_codigo = ' + #39 + Trim(Nro_Codigo_Cliente.Text) + #39;

    ConexaoBD.SQL_FB_Papeletas.Close;
    ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
    ConexaoBD.SQL_FB_Papeletas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Papeletas.Open;

    If ConexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Papeletas.First;

       While Not ConexaoBD.SQL_FB_Papeletas.Eof Do
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
             Comando_SQL := Comando_SQL + 'fb_swap_cond_pgto_4,';
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
             Comando_SQL := Comando_SQL + 'fb_swap_observacao_log,';
             Comando_SQL := Comando_SQL + 'fb_swap_valor_ipi)';
             Comando_SQL := Comando_SQL + ' Values(';

             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Papeletasfb_papeleta_numero.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo_tipo.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_nome.Text + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_desconto.Text) + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Papeletasfb_papeleta_cond_pgto_1.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Papeletasfb_papeleta_cond_pgto_2.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Papeletasfb_papeleta_cond_pgto_3.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Papeletasfb_papeleta_cond_pgto_4.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_tipo_fatura.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_tipo_tabela.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_emite_lote.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_tipo_transp.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_transporta.Text + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_desc.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_pedido.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_observacao.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_pgto_frete.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_natureza_oper.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Papeletasfb_papeleta_data_emissao.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_estado.Text + #39 + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Papeletasfb_papeleta_faturado.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Papeletasfb_papeleta_vendedor.Text + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Papeletasfb_papeleta_banco.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_forma_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_1.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_pgto_1.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_1.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_1.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_juros_1.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_cod_bco_1.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_forma_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_2.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_pgto_2.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_2.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_2.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_juros_2.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_cod_bco_2.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_forma_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_3.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_pgto_3.Text,'amd','/') + #39 + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_3.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_3.Text) + ',';
             Comando_SQL := Comando_SQL + Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_juros_3.Text) + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_cod_bco_3.Text + #39 + ',';
             Comando_SQL := Comando_SQL + ConexaoBD.SQL_FB_Papeletasfb_papeleta_volume.Text + ',';
             Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Papeletasfb_papeleta_observacao_log.Text + #39 + ')';
             Comando_SQL := Comando_SQL + #39 + '0.00' + #39 + ')';

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Papeletas.Next;
       End;
    End;

    //*** Dados Sobre A Nota Fiscal ***

    Comando_SQL := 'Select * from ' + Trim(Nome_Tabela_Nota) + ' Order By fb_swap_data_emissao Desc';

    ConexaoBD.SQL_FB_Swap_Notas.Close;
    ConexaoBD.SQL_FB_Swap_Notas.SQL.Clear;
    ConexaoBD.SQL_FB_Swap_Notas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Swap_Notas.Open;

    //*** Carrega o Novo Grid ***

    SGD_Compras.ColCount := 10;

    If ConexaoBD.SQL_FB_Swap_Notas.RecordCount > 0 Then
       Begin
       SGD_Compras.RowCount := (ConexaoBD.SQL_FB_Swap_Notas.RecordCount + 1);
       End
    Else
       Begin
       SGD_Compras.RowCount := 2;
    End;

    //*** Carrega a Lista de Relações de Compras ***
    //*** Zera Grid ***

    For Ind := 0 To SGD_Compras.RowCount Do
        Begin
        SGD_Compras.Cells[0,Ind]  := '';
        SGD_Compras.Cells[1,Ind]  := '';
        SGD_Compras.Cells[2,Ind]  := '';
        SGD_Compras.Cells[3,Ind]  := '';
        SGD_Compras.Cells[4,Ind]  := '';
        SGD_Compras.Cells[5,Ind]  := '';
        SGD_Compras.Cells[6,Ind]  := '';
        SGD_Compras.Cells[7,Ind]  := '';
        SGD_Compras.Cells[8,Ind]  := '';
        SGD_Compras.Cells[9,Ind]  := '';
    End;

    //*** Preparação do StringGrid ***

    //*** Faturamento ***
    SGD_Compras.Cells[0,0]   := 'Faturamento';
    SGD_Compras.ColWidths[0] := 65;

    //*** Nro.Nota ***
    SGD_Compras.Cells[1,0]   := 'Nro.Nota';
    SGD_Compras.ColWidths[1] := 50;

    //*** Data de Emissão ***
    SGD_Compras.Cells[2,0]   := 'Dt.Emissão';
    SGD_Compras.ColWidths[2] := 65;

    //*** Condição de Pagamento 1 ***
    SGD_Compras.Cells[3,0]   := 'Cond.Pgto.1';
    SGD_Compras.ColWidths[3] := 65;

    //*** Condição de Pagamento 2 ***
    SGD_Compras.Cells[4,0]   := 'Cond.Pgto.2';
    SGD_Compras.ColWidths[4] := 65;

    //*** Condição de Pagamento 3 ***
    SGD_Compras.Cells[5,0]   := 'Cond.Pgto.3';
    SGD_Compras.ColWidths[5] := 65;

    //*** Condição de Pagamento 4 ***
    SGD_Compras.Cells[6,0]   := 'Cond.Pgto.4';
    SGD_Compras.ColWidths[6] := 65;

    //*** Valor do IPI ***
    SGD_Compras.Cells[7,0]   := 'Vlr.IPI';
    SGD_Compras.ColWidths[7] := 65;

    //*** Valor Total ***
    SGD_Compras.Cells[8,0]   := 'Vlr.Total';
    SGD_Compras.ColWidths[8] := 65;

    //*** Transportadora ***
    SGD_Compras.Cells[9,0]   := 'Transportadora';
    SGD_Compras.ColWidths[9] := 120;

    //*** Carrega o Grid com as Informações da Tabela ***

    If ConexaoBD.SQL_FB_Swap_Notas.RecordCount > 0 Then
       Begin

       Ind := 1;
       ConexaoBD.SQL_FB_Swap_Notas.First;

       While Not ConexaoBD.SQL_FB_Swap_Notas.Eof Do
             Begin
             //*** Faturamento ***
             SGD_Compras.Cells[0,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_tipo_fatura.Text;

             //*** Nro.Nota ***
             SGD_Compras.Cells[1,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_numero.Text;

             //*** Data de Emissão ***
             SGD_Compras.Cells[2,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_data_emissao.Text;

             //*** Condição de Pagamento 1 ***
             SGD_Compras.Cells[3,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_1.Text;

             //*** Condição de Pagamento 2 ***
             SGD_Compras.Cells[4,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_2.Text;

             //*** Condição de Pagamento 3 ***
             SGD_Compras.Cells[5,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_3.Text;

             //*** Condição de Pagamento 4 ***
             SGD_Compras.Cells[6,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_cond_pgto_4.Text;

             //*** Valor do IPI ***
             SGD_Compras.Cells[7,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_valor_ipi.Text;

             //*** Valor Total ***
             SGD_Compras.Cells[8,Ind]   := ConexaoBD.SQL_FB_Swap_Notasfb_swap_valor_total.Text;

             //*** Transportadora ***

              Comando_SQL := 'Select * from fb_transportadoras where fb_transportadora_numero = ' + Trim(ConexaoBD.SQL_FB_Swap_Notasfb_swap_transporta.Text);

              ConexaoBD.SQL_Transportadoras.Close;
              ConexaoBD.SQL_Transportadoras.SQL.Clear;
              ConexaoBD.SQL_Transportadoras.SQL.Add(Comando_SQL);
              ConexaoBD.SQL_Transportadoras.Open;

              If ConexaoBD.SQL_Transportadoras.RecordCount > 0 Then
                 Begin
                 SGD_Compras.Cells[9,Ind] := ConexaoBD.SQL_Transportadorasfb_transportadora_nome.Text;
                 End
              Else
                 Begin
                 SGD_Compras.Cells[9,Ind] := '-';
              End;

              ConexaoBD.SQL_Transportadoras.Close;

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

procedure TVHistoricoClientes01.SGD_ComprasDblClick(Sender: TObject);
begin
     If Trim(SGD_Compras.Cells[0,SGD_Compras.Row]) <> '' Then
        Begin

        If (VHistoricoClientes02 = Nil) Then
           Begin
           Application.CreateForm(TVHistoricoClientes02,VHistoricoClientes02);

           VHistoricoClientes02.Nro_Pedido.Text      := Trim(SGD_Compras.Cells[1,SGD_Compras.Row]);
           VHistoricoClientes02.Tipo_Fatura.Text     := Trim(SGD_Compras.Cells[0,SGD_Compras.Row]);

           VHistoricoClientes02.Movto_Pos_Total.Text := IntToStr(SGD_Compras.RowCount - 1);
           VHistoricoClientes02.Movto_Pos_Atual.Text := IntToStr(SGD_Compras.Row);
        End;

        VHistoricoClientes02.Show;

     End;
end;

procedure TVHistoricoClientes01.SGD_ComprasKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        If Trim(SGD_Compras.Cells[0,SGD_Compras.Row]) <> '' Then
           Begin

           Application.CreateForm(TVHistoricoClientes02,VHistoricoClientes02);

           VHistoricoClientes02.Nro_Pedido.Text     := Trim(SGD_Compras.Cells[1,SGD_Compras.Row]);
           VHistoricoClientes02.Tipo_Fatura.Text    := Trim(SGD_Compras.Cells[0,SGD_Compras.Row]);

           VHistoricoClientes02.ShowModal;
           VHistoricoClientes02.Destroy;
        End;
     End;
end;

procedure TVHistoricoClientes01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     VHistoricoClientes01 := Nil;
end;

end.
