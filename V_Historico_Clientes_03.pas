unit V_Historico_Clientes_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TVHistoricoClientes03 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    editCodigo: TEdit;
    editDescricao: TEdit;
    GroupBox2: TGroupBox;
    SGD_Saidas: TStringGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
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
  private
    procedure Carrega_Clientes();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VHistoricoClientes03: TVHistoricoClientes03;

implementation

uses Conexao_BD, Rotinas_Gerais, V_Historico_Clientes_01;

{$R *.dfm}

procedure TVHistoricoClientes03.FormShow(Sender: TObject);
begin
    Ampulheta();
    Carrega_Clientes();
    Seta();
end;

procedure TVHistoricoClientes03.BitBtn1Click(Sender: TObject);
begin
    VHistoricoClientes03.Close;
end;

procedure TVHistoricoClientes03.Carrega_Clientes;
var
    Ind: Integer;
    Comando_SQL, Nome_Tabela_Nota: String;
begin
    //*** Prepara a Criação de Tabelas Temporárias ***
    Nome_Tabela_Nota         := 'fb_swap_clientes_'+Trim(Numero_HD('C'));

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***
    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Cria a Tabela Temporária de Notas Fiscais e Papeletas ***

    Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Nota + ' (';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_nro int(11) NOT NULL auto_increment,';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_codigo varchar(80) NOT NULL default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_codigo_tipo varchar(6) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_nome varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_razao_social varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_inscricao_municipal varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_inscricao_estadual varchar(20) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_endereco varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_complemento varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_bairro varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_cidade varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_estado char(2) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_cep varchar(9) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_contato varchar(50) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_ddd char(3) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_fone_comercial varchar(50) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_fone_residencial varchar(50) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_fone_celular varchar(50) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_fone_fax varchar(50) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_fone_ramal varchar(5) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_endereco_cobranca varchar(100) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_complemento_cobranca varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_bairro_cobranca varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_cidade_cobranca varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_estado_cobranca char(2) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_cep_cobranca varchar(9) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_valor_credito double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_status_credito char(1) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_banco int(3) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_tipo int(2) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_vendedor int(3) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_tipo_pessoa char(2) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_consignacao char(1) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_zona int(3) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_data_inclusao date default NULL,';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_data_visita date default NULL,';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_data_alteracao date default NULL,';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_data_ultima_compra date default NULL,';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_ultimo_valor double(13,2) default '+#39+'0.00'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_observacoes text,';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_pais varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_pais_cobranca varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_opcao_cobranca varchar(7) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_email varchar(80) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_desconto double(7,3) default '+#39+'0.000'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_condicao_pgto_1 int(2) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_condicao_pgto_2 int(2) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_condicao_pgto_3 int(2) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_condicao_pgto_4 int(2) default NULL,';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_tipo_transporte varchar(15) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_transportadora int(11) default '+#39+'0'+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_tipo_faturamento varchar(15) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_tipo_tabela varchar(15) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_emite_lote char(1) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'fb_swap_cliente_pgto_frete varchar(10) default '+#39+#39+',';
    Comando_SQL := Comando_SQL + 'PRIMARY KEY  (fb_swap_cliente_nro)';
    Comando_SQL := Comando_SQL + ') ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

    //*** Dados Sobre a Nota Fiscal ***
    Comando_SQL := 'Select n.fb_nota_fiscal_numero, n.fb_nota_fiscal_codigo, n.fb_nota_fiscal_data_emissao, ';
    Comando_SQL := Comando_SQL + 'p.fb_nota_fiscal_produto_numero, p.fb_nota_fiscal_produto_codigo, ';
    Comando_SQL := Comando_SQL + 'c.* ';
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

    ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtos.Close;
    ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtos.Open;

    If ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtos.RecordCount > 0 Then Begin
        ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtos.First;

        While Not ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtos.Eof Do Begin
            Comando_SQL := 'Insert into '+Nome_Tabela_Nota+'(';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_codigo_tipo,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_codigo,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_razao_social,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_endereco,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_bairro,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_cidade,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_estado,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_fone_comercial,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_fone_residencial,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_fone_celular,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_email,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_data_ultima_compra)';
            Comando_SQL := Comando_SQL +' Values(';

            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_cliente_codigo_tipo.Text                                   +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_cliente_codigo.Text                                        +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_cliente_razao_social.Text                                          +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_cliente_endereco.Text                                      +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_cliente_bairro.Text                                        +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_cliente_cidade.Text                                        +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_cliente_estado.Text                                        +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_cliente_fone_comercial.Text                                +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_cliente_fone_residencial.Text                              +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_cliente_fone_celular.Text                                  +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_cliente_email.Text                                         +#39+',';
            Comando_SQL := Comando_SQL +#39+ Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtosfb_nota_fiscal_data_emissao.Text,'amd','/') +#39+')';

            ConexaoBD.SQL_Comunitario.Close;
            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            ConexaoBD.SQL_FB_Historico_Cliente_Nota_Fiscal_e_Produtos.Next;
        End;
    End;

    //*** Dados Sobre a Papeleta ***

    Comando_SQL := 'Select n.fb_papeleta_numero, n.fb_papeleta_codigo, n.fb_papeleta_data_emissao, ';
    Comando_SQL := Comando_SQL + 'p.fb_papeleta_produto_numero, p.fb_papeleta_produto_codigo, ';
    Comando_SQL := Comando_SQL + 'c.* ';
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

    ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtos.Close;
    ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtos.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtos.Open;

    If ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtos.RecordCount > 0 Then Begin
        ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtos.First;

        While Not ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtos.Eof Do Begin
            Comando_SQL := 'Insert into '+Nome_Tabela_Nota+'(';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_codigo_tipo,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_codigo,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_razao_social,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_endereco,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_bairro,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_cidade,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_estado,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_fone_comercial,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_fone_residencial,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_fone_celular,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_email,';
            Comando_SQL := Comando_SQL +'fb_swap_cliente_data_ultima_compra)';
            Comando_SQL := Comando_SQL +' Values(';

            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_cliente_codigo_tipo.Text                                   +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_cliente_codigo.Text                                        +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_cliente_razao_social.Text                                          +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_cliente_endereco.Text                                      +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_cliente_bairro.Text                                        +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_cliente_cidade.Text                                        +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_cliente_estado.Text                                        +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_cliente_fone_comercial.Text                                +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_cliente_fone_residencial.Text                              +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_cliente_fone_celular.Text                                  +#39+',';
            Comando_SQL := Comando_SQL +#39+ ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_cliente_email.Text                                         +#39+',';
            Comando_SQL := Comando_SQL +#39+ Inverte_Data_Plus(ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtosfb_papeleta_data_emissao.Text,'amd','/') +#39+')';

            ConexaoBD.SQL_Comunitario.Close;
            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            ConexaoBD.SQL_FB_Historico_Cliente_Papeletas_e_Produtos.Next;
        End;
    End;

    //*** Dados Sobre A Nota Fiscal ***
    Comando_SQL := 'Select * from ' + Trim(Nome_Tabela_Nota) + ' Group By fb_swap_cliente_codigo Order By fb_swap_cliente_data_ultima_compra Desc';

    ConexaoBD.SQL_FB_Swap_Clientes.Close;
    ConexaoBD.SQL_FB_Swap_Clientes.SQL.Clear;
    ConexaoBD.SQL_FB_Swap_Clientes.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Swap_Clientes.Open;

    //*** Carrega o Novo Grid ***
    SGD_Saidas.ColCount := 12;

    GroupBox2.Caption := '   Clientes   - ' + IntToStr(ConexaoBD.SQL_FB_Swap_Clientes.RecordCount) + ' Registros   ';

    If ConexaoBD.SQL_FB_Swap_Clientes.RecordCount > 0 Then
        SGD_Saidas.RowCount := (ConexaoBD.SQL_FB_Swap_Clientes.RecordCount + 1)
    Else
        SGD_Saidas.RowCount := 2;

    //*** Carrega a Lista de Relações de Compras ***
    //*** Zera Grid ***
    For Ind := 0 To SGD_Saidas.RowCount Do Begin
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
    End;

    //*** Preparação do StringGrid ***

    //*** Tipo Código ***
    SGD_Saidas.Cells[0,0]   := 'Tipo Código';
    SGD_Saidas.ColWidths[0] := 60;

    //*** Código ***
    SGD_Saidas.Cells[1,0]   := 'Código';
    SGD_Saidas.ColWidths[1] := 110;

    //*** Nome ***
    SGD_Saidas.Cells[2,0]   := 'Nome';
    SGD_Saidas.ColWidths[2] := 150;

    //*** Endereço ***
    SGD_Saidas.Cells[3,0]   := 'Endereço';
    SGD_Saidas.ColWidths[3] := 150;

    //*** Bairro ***
    SGD_Saidas.Cells[4,0]   := 'Bairro';
    SGD_Saidas.ColWidths[4] := 100;

    //*** Cidade ***
    SGD_Saidas.Cells[5,0]   := 'Cidade';
    SGD_Saidas.ColWidths[5] := 100;

    //*** Estado ***
    SGD_Saidas.Cells[6,0]   := 'Estado';
    SGD_Saidas.ColWidths[6] := 40;

    //*** Tel. Comercial ***
    SGD_Saidas.Cells[7,0]   := 'Tel. Com.';
    SGD_Saidas.ColWidths[7] := 70;

    //*** Tel. Residencial ***
    SGD_Saidas.Cells[8,0]   := 'Tel. Res.';
    SGD_Saidas.ColWidths[8] := 70;

    //*** Tel. Celular ***
    SGD_Saidas.Cells[9,0]   := 'Tel. Cel.';
    SGD_Saidas.ColWidths[9] := 70;

    //*** E-mail ***
    SGD_Saidas.Cells[10,0]   := 'E-mail';
    SGD_Saidas.ColWidths[10] := 120;

    //*** Data Emissão ***
    SGD_Saidas.Cells[11,0]   := 'Data Emissão';
    SGD_Saidas.ColWidths[11] := 70;

    //*** Carrega o Grid com as Informações da Tabela ***

    If ConexaoBD.SQL_FB_Swap_Clientes.RecordCount > 0 Then Begin

        Ind := 1;
        ConexaoBD.SQL_FB_Swap_Clientes.First;

        While Not ConexaoBD.SQL_FB_Swap_Clientes.Eof Do Begin
            //*** Tipo Código ***
            SGD_Saidas.Cells[0,Ind]   := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_codigo_tipo.Text;

            //*** Código ***
            SGD_Saidas.Cells[1,Ind]   := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_codigo.Text;

            //*** Nome ***
            SGD_Saidas.Cells[2,Ind]   := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_razao_social.Text;

            //*** Endereço ***
            SGD_Saidas.Cells[3,Ind]   := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_endereco.Text;

            //*** Bairro ***
            SGD_Saidas.Cells[4,Ind]   := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_bairro.Text;

            //*** Cidade ***
            SGD_Saidas.Cells[5,Ind]   := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_cidade.Text;

            //*** Estado ***
            SGD_Saidas.Cells[6,Ind]   := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_estado.Text;

            //*** Tel. Comercial ***

            SGD_Saidas.Cells[7,Ind]   := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_fone_comercial.Text;

            //*** Tel. Residencial ***
            SGD_Saidas.Cells[8,Ind]   := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_fone_residencial.Text;

            //*** Tel. Celular ***
            SGD_Saidas.Cells[9,Ind]   := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_fone_celular.Text;

            //*** E-mail ***
            SGD_Saidas.Cells[10,Ind]  := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_email.Text;

            //*** Data Emissão ***
            SGD_Saidas.Cells[11,Ind]  := ConexaoBD.SQL_FB_Swap_Clientesfb_swap_cliente_data_ultima_compra.Text;

            Ind := Ind + 1;
            ConexaoBD.SQL_FB_Swap_Clientes.Next;
       End;
    End;

    ConexaoBD.SQL_FB_Swap_Clientes.Close;

    //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***

    Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Nota;

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TVHistoricoClientes03.SGD_SaidasDblClick(Sender: TObject);

var
   Codigo_Cliente, Tipo_Codigo_Cliente: String;

begin
     If SGD_Saidas.Cells[1,SGD_Saidas.Row] <> '' Then
        Begin

        VHistoricoClientes03.Visible := False;

        Ampulheta();
        Application.CreateForm(TVHistoricoClientes01,VHistoricoClientes01);

        //*** Obtem os Dados do Cliente ***

        Codigo_Cliente      := SGD_Saidas.Cells[1,SGD_Saidas.Row];
        Tipo_Codigo_Cliente := SGD_Saidas.Cells[0,SGD_Saidas.Row];

        ConexaoBD.SQL_Clientes.Close;
        ConexaoBD.SQL_Clientes.SQL.Clear;

        If Tipo_Codigo_Cliente = 'CNPJ' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
           End
        Else If Tipo_Codigo_Cliente = 'CPF' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
           End
        Else If Tipo_Codigo_Cliente = 'RG' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
           End
        Else If Tipo_Codigo_Cliente = 'E-Mail' Then
           Begin
           ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(Codigo_Cliente) + #39 );
        End;

        ConexaoBD.SQL_Clientes.Open;

        //*** Carrega os Dados Obtidos ***

        If Tipo_Codigo_Cliente = 'CNPJ' Then
           Begin
           VHistoricoClientes01.Cliente_Codigo_CNPJ.Text  := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
           End
        Else If Tipo_Codigo_Cliente = 'CPF' Then
           Begin
           VHistoricoClientes01.Cliente_Codigo_CPF.Text   := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
           End
        Else If Tipo_Codigo_Cliente = 'RG' Then
           Begin
           VHistoricoClientes01.Cliente_Codigo_RG.Text    := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
           End
        Else If Tipo_Codigo_Cliente = 'E-Mail' Then
           Begin
           VHistoricoClientes01.Cliente_Codigo_EMail.Text := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;
        End;

        VHistoricoClientes01.Nro_Codigo_Cliente.Text           := ConexaoBD.SQL_Clientesfb_cliente_codigo.AsString;

        VHistoricoClientes01.Cliente_Codigo_Tipo.ItemIndex     := Obtem_Nro_Tipo_Codigo(ConexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text);
        VHistoricoClientes01.Cliente_Razao_Social.Text         := ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text;

        //*** Fecha SQL ***

        ConexaoBD.SQL_Clientes.Close;

        Seta();

        VHistoricoClientes01.ShowModal;
        VHistoricoClientes01.Destroy;

        VHistoricoClientes03.Visible := True;
     End;
end;

end.
