unit Historico_Clientes_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, Grids, StdCtrls, DBCtrls, Buttons, ExtCtrls;

type
  THistoricoClientes02 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Tipo_Fatura: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    GroupBox7: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label10: TLabel;
    Cliente_Desconto: TEdit;
    Cliente_Condicao_Pgto_1: TEdit;
    Cliente_Condicao_Pgto_2: TEdit;
    Cliente_Condicao_Pgto_3: TEdit;
    Cliente_Tipo_Transporte: TComboBox;
    Cliente_Transportadora: TComboBox;
    Cliente_Tipo_Faturamento: TComboBox;
    Cliente_Emite_Lote: TComboBox;
    Cliente_Pgto_Frete: TComboBox;
    Natureza_Operacao: TComboBox;
    SGD_Produtos: TStringGrid;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label28: TLabel;
    Label35: TLabel;
    Label29: TLabel;
    Label34: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label44: TLabel;
    Label12: TLabel;
    Cliente_Endereco: TEdit;
    Cliente_Complemento: TEdit;
    Cliente_Bairro: TEdit;
    Cliente_Cidade: TEdit;
    Cliente_Estado: TComboBox;
    Cliente_Cep: TMaskEdit;
    Cliente_Pais: TComboBox;
    Cliente_Nome: TEdit;
    Cliente_Empresa: TEdit;
    Cliente_Contato: TEdit;
    Cliente_DDD: TEdit;
    Cliente_Fone_Ramal: TEdit;
    Cliente_Fone_Comercial: TEdit;
    Cliente_Fone_Residencial: TEdit;
    Cliente_Fone_Celular: TEdit;
    Cliente_Fone_Fax: TEdit;
    Cliente_Email: TEdit;
    Nro_Pedido: TEdit;
    Label8: TLabel;
    Cliente_tipo_codigo: TComboBox;
    Label11: TLabel;
    Cliente_Codigo: TEdit;
    Label18: TLabel;
    Data_Emissao: TMaskEdit;
    Label41: TLabel;
    Representante: TComboBox;
    Label40: TLabel;
    Banco: TComboBox;
    Label36: TLabel;
    Nro_Parcela1: TEdit;
    Label37: TLabel;
    Forma1: TEdit;
    Label23: TLabel;
    DT_Vencimento1: TMaskEdit;
    Label24: TLabel;
    Dt_Pagamento1: TMaskEdit;
    Label26: TLabel;
    Vlr_Parcela1: TEdit;
    Label27: TLabel;
    Vlr_Juros1: TEdit;
    Label25: TLabel;
    Vlr_Pago1: TEdit;
    Label38: TLabel;
    Cod_Bancario1: TEdit;
    Label39: TLabel;
    Label42: TLabel;
    Nro_Parcela2: TEdit;
    Forma2: TEdit;
    DT_Vencimento2: TMaskEdit;
    Dt_Pagamento2: TMaskEdit;
    Vlr_Parcela2: TEdit;
    Vlr_Juros2: TEdit;
    Vlr_Pago2: TEdit;
    Cod_Bancario2: TEdit;
    Label43: TLabel;
    Nro_Parcela3: TEdit;
    Forma3: TEdit;
    DT_Vencimento3: TMaskEdit;
    Dt_Pagamento3: TMaskEdit;
    Vlr_Parcela3: TEdit;
    Vlr_Juros3: TEdit;
    Vlr_Pago3: TEdit;
    Cod_Bancario3: TEdit;
    Label45: TLabel;
    Volume: TEdit;
    Label54: TLabel;
    Nro_Ped: TEdit;
    DBM_NF_Observacao: TDBMemo;
    DBM_NF_Observacao_Log: TDBMemo;
    DBM_Ped_Observacao: TDBMemo;
    DBM_Ped_Observacao_Log: TDBMemo;
    Label55: TLabel;
    Ordem_Compra: TEdit;
    Cliente_Condicao_Pgto_4: TEdit;
    Label2: TLabel;
    Valor_IPI: TEdit;
    Valor_Total: TEdit;
    Label6: TLabel;
    Label4: TLabel;
    Nro_Parcela4: TEdit;
    Forma4: TEdit;
    DT_Vencimento4: TMaskEdit;
    Dt_Pagamento4: TMaskEdit;
    Vlr_Parcela4: TEdit;
    Vlr_Juros4: TEdit;
    Vlr_Pago4: TEdit;
    Cod_Bancario4: TEdit;
    Label9: TLabel;
    Observacao_Nota: TMemo;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HistoricoClientes02: THistoricoClientes02;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure THistoricoClientes02.BT_SairClick(Sender: TObject);
begin
  HistoricoClientes02.Close;
end;

procedure THistoricoClientes02.FormShow(Sender: TObject);
var Ind: integer;
begin
  Ampulheta();
  // Carrega Informações da Nota
  If Trim(Tipo_Fatura.Text) = 'Nota Fiscal' Then
    begin
    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where fb_nota_fiscal_numero ='+#39+Trim(Nro_Pedido.Text)+#39);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    Cliente_Codigo.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;
    // Carrega dados do Cliente
    ConexaoBD.SQL_FB_Clientes.Close;
    ConexaoBD.SQL_FB_Clientes.SQL.Clear;
    ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo ='+#39+Trim(Cliente_Codigo.Text)+#39);
    ConexaoBD.SQL_FB_Clientes.Open;

    Cliente_Empresa.Text          := 'Ibrasmak';
    Cliente_tipo_codigo.Text      := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo_tipo.Text;
    Cliente_Nome.Text             := ConexaoBD.SQL_FB_Clientesfb_cliente_nome.Text;
    Cliente_Estado.Text           := ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text;
    Cliente_Cep.Text              := ConexaoBD.SQL_FB_Clientesfb_cliente_cep.Text;
    Cliente_Pais.Text             := ConexaoBD.SQL_FB_Clientesfb_cliente_pais.Text;
    Cliente_Endereco.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_endereco.Text;
    Cliente_Complemento.Text      := ConexaoBD.SQL_FB_Clientesfb_cliente_complemento.Text;
    Cliente_Bairro.Text           := ConexaoBD.SQL_FB_Clientesfb_cliente_bairro.Text;
    Cliente_Cidade.Text           := ConexaoBD.SQL_FB_Clientesfb_cliente_cidade.Text;
    Cliente_Contato.Text          := ConexaoBD.SQL_FB_Clientesfb_cliente_contato.Text;
    Cliente_DDD.Text              := ConexaoBD.SQL_FB_Clientesfb_cliente_ddd.Text;
    Cliente_Fone_Ramal.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_ramal.Text;
    Cliente_Fone_Comercial.Text   := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_comercial.Text;
    Cliente_Fone_Residencial.Text := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_residencial.Text;
    Cliente_Fone_Celular.Text     := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_comercial.Text;
    Cliente_Fone_Fax.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_comercial.Text;
    Cliente_Email.Text            := ConexaoBD.SQL_FB_Clientesfb_cliente_email.Text;
    ConexaoBD.SQL_FB_Clientes.Close;

    // Carrega produtos da Nota
    ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add('Select * from fb_notas_fiscais_produtos Where fb_nota_fiscal_produto_numero ='+#39+Trim(Nro_Pedido.Text)+#39);
    ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

    SGD_Produtos.RowCount := (ConexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount + 1);
    SGD_Produtos.FixedRows := 1;

    SGD_Produtos.Cells[0,0]   := 'Quantidade';
    SGD_Produtos.ColWidths[0] := 60;
    SGD_Produtos.Cells[1,0]   := 'Cód.Produto';
    SGD_Produtos.ColWidths[1] := 80;
    SGD_Produtos.Cells[2,0]   := 'Referência';
    SGD_Produtos.ColWidths[2] := 80;
    SGD_Produtos.Cells[3,0]   := 'Descrição';
    SGD_Produtos.ColWidths[3] := 224;
    SGD_Produtos.Cells[4,0]   := 'Lote';
    SGD_Produtos.ColWidths[4] := 80;
    SGD_Produtos.Cells[5,0]   := 'Vlr.Unitário (R$)';
    SGD_Produtos.ColWidths[5] := 80;
    SGD_Produtos.Cells[6,0]   := 'Vlr.Total (R$)';
    SGD_Produtos.ColWidths[6] := 80;

    Ind := 1;
    While ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof = False Do
      begin
      SGD_Produtos.Cells[0,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_qtde.Text;
      SGD_Produtos.Cells[1,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text;

      ConexaoBD.SQL_FB_Produtos.Close;
      ConexaoBD.SQL_FB_Produtos.SQL.Clear;
      ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = '+#39+Trim(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text)+#39);
      ConexaoBD.SQL_FB_Produtos.Open;
      SGD_Produtos.Cells[2,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_referencia.Text;
      ConexaoBD.SQL_FB_Produtos.Close;

      SGD_Produtos.Cells[3,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_desc.Text;
      SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_lote.Text;
      SGD_Produtos.Cells[5,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_uni.Text;
      SGD_Produtos.Cells[6,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text;
      Ind := Ind + 1;
      ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
    End;
    ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;

    // Carrega dados da Nota
    Natureza_Operacao.Text        := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper.Text;
    Cliente_Tipo_Faturamento.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_fatura.Text;
    Cliente_Tipo_Transporte.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_transp.Text;

    ConexaoBD.SQL_FB_Transportadoras.Close;
    ConexaoBD.SQL_FB_Transportadoras.SQL.Clear;
    ConexaoBD.SQL_FB_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_numero ='+#39+ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text+#39);
    ConexaoBD.SQL_FB_Transportadoras.Open;
    Cliente_Transportadora.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text + ' - ' + ConexaoBD.SQL_FB_Transportadorasfb_transportadora_nome.Text;
    ConexaoBD.SQL_FB_Transportadoras.Close;

    if ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_emite_lote.Text = 'S' Then
      begin
      Cliente_Emite_Lote.Text := 'Sim';
      end
    Else
      begin
      Cliente_Emite_Lote.Text := 'Não';
    end;
    Cliente_Pgto_Frete.Text       := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_pgto_frete.Text;

    ConexaoBD.SQL_FB_Representantes.Close;
    ConexaoBD.SQL_FB_Representantes.SQL.Clear;
    ConexaoBD.SQL_FB_Representantes.SQL.Add('Select * from fb_representantes Where fb_representante_codigo ='+#39+ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_vendedor.Text+#39);
    ConexaoBD.SQL_FB_Representantes.Open;
    Representante.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_vendedor.Text + ' - ' + ConexaoBD.SQL_FB_Representantesfb_representante_nome.Text;
    ConexaoBD.SQL_FB_Representantes.Close;

    ConexaoBD.SQL_FB_Bancos.Close;
    ConexaoBD.SQL_FB_Bancos.SQL.Clear;
    ConexaoBD.SQL_FB_Bancos.SQL.Add('Select * from fb_bancos Where fb_banco_codigo ='+#39+ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text+#39);
    ConexaoBD.SQL_FB_Bancos.Open;
    Banco.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text + ' - ' + ConexaoBD.SQL_FB_Bancosfb_banco_descricao.Text;
    ConexaoBD.SQL_FB_Bancos.Close;

    Cliente_Desconto.Text         := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_desconto.Text;
    Cliente_Condicao_Pgto_1.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_1.Text;
    Cliente_Condicao_Pgto_2.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_2.Text;
    Cliente_Condicao_Pgto_3.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_3.Text;
    Cliente_Condicao_Pgto_4.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_4.Text;
    Data_Emissao.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;

    Nro_Parcela1.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text;
    Forma1.Text         := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text;
    DT_Vencimento1.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;
    Dt_Pagamento1.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_1.Text;
    Vlr_Parcela1.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text;
    Vlr_Juros1.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_juros_1.Text;
    Vlr_Pago1.Text      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_1.Text;
    Cod_Bancario1.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_cod_bco_1.Text;
    Nro_Parcela2.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text;
    Forma2.Text         := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text;
    DT_Vencimento2.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;
    Dt_Pagamento2.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_2.Text;
    Vlr_Parcela2.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text;
    Vlr_Juros2.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_juros_2.Text;
    Vlr_Pago2.Text      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_2.Text;
    Cod_Bancario2.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_cod_bco_2.Text;
    Nro_Parcela3.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text;
    Forma3.Text         := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text;
    DT_Vencimento3.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;
    Dt_Pagamento3.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_3.Text;
    Vlr_Parcela3.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text;
    Vlr_Juros3.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_juros_3.Text;
    Vlr_Pago3.Text      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_3.Text;
    Cod_Bancario3.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_cod_bco_3.Text;

    Nro_Parcela4.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_4.Text;
    Forma4.Text         := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_4.Text;
    DT_Vencimento4.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_4.Text;
    Dt_Pagamento4.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_4.Text;
    Vlr_Parcela4.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.Text;
    Vlr_Juros4.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_juros_4.Text;
    Vlr_Pago4.Text      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_4.Text;
    Cod_Bancario4.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_cod_bco_4.Text;
            
    Observacao_Nota.Text    := DBM_NF_Observacao.Text;
    Volume.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_volume.Text;
    Nro_Ped.Text            := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nro_pedido.Text;
    Valor_Total.Text        := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
    Valor_IPI.Text          := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text;

    Observacao_Nota.Lines.Clear;
    Observacao_Nota.Lines.Add(DBM_NF_Observacao.Text);

    Ordem_Compra.Text       := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_ordem_compra.Text;

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    end
  Else If Trim(Tipo_Fatura.Text) = 'Papeleta' Then
    begin
    ConexaoBD.SQL_FB_Papeletas.Close;
    ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
    ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * from fb_papeletas Where fb_papeleta_numero ='+#39+Trim(Nro_Pedido.Text)+#39);
    ConexaoBD.SQL_FB_Papeletas.Open;

    Cliente_Codigo.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text;
    // Carrega dados do Cliente
    ConexaoBD.SQL_FB_Clientes.Close;
    ConexaoBD.SQL_FB_Clientes.SQL.Clear;
    ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo ='+#39+Trim(Cliente_Codigo.Text)+#39);
    ConexaoBD.SQL_FB_Clientes.Open;

    Cliente_Empresa.Text          := 'Ibrasmak';
    Cliente_tipo_codigo.Text      := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo_tipo.Text;
    Cliente_Nome.Text             := ConexaoBD.SQL_FB_Clientesfb_cliente_nome.Text;
    Cliente_Estado.Text           := ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text;
    Cliente_Cep.Text              := ConexaoBD.SQL_FB_Clientesfb_cliente_cep.Text;
    Cliente_Pais.Text             := ConexaoBD.SQL_FB_Clientesfb_cliente_pais.Text;
    Cliente_Endereco.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_endereco.Text;
    Cliente_Complemento.Text      := ConexaoBD.SQL_FB_Clientesfb_cliente_complemento.Text;
    Cliente_Bairro.Text           := ConexaoBD.SQL_FB_Clientesfb_cliente_bairro.Text;
    Cliente_Cidade.Text           := ConexaoBD.SQL_FB_Clientesfb_cliente_cidade.Text;
    Cliente_Contato.Text          := ConexaoBD.SQL_FB_Clientesfb_cliente_contato.Text;
    Cliente_DDD.Text              := ConexaoBD.SQL_FB_Clientesfb_cliente_ddd.Text;
    Cliente_Fone_Ramal.Text       := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_ramal.Text;
    Cliente_Fone_Comercial.Text   := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_comercial.Text;
    Cliente_Fone_Residencial.Text := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_residencial.Text;
    Cliente_Fone_Celular.Text     := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_comercial.Text;
    Cliente_Fone_Fax.Text         := ConexaoBD.SQL_FB_Clientesfb_cliente_fone_comercial.Text;
    Cliente_Email.Text            := ConexaoBD.SQL_FB_Clientesfb_cliente_email.Text;
    ConexaoBD.SQL_FB_Clientes.Close;

    // Carrega produtos da Nota
    ConexaoBD.SQL_FB_Papeletas_Produtos.Close;
    ConexaoBD.SQL_FB_Papeletas_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Papeletas_Produtos.SQL.Add('Select * from fb_papeletas_produtos Where fb_papeleta_produto_numero ='+#39+Trim(Nro_Pedido.Text)+#39);
    ConexaoBD.SQL_FB_Papeletas_Produtos.Open;

    SGD_Produtos.RowCount := (ConexaoBD.SQL_FB_Papeletas_Produtos.RecordCount + 1);
    SGD_Produtos.FixedRows := 1;

    SGD_Produtos.Cells[0,0]   := 'Quantidade';
    SGD_Produtos.ColWidths[0] := 60;
    SGD_Produtos.Cells[1,0]   := 'Cód.Produto';
    SGD_Produtos.ColWidths[1] := 80;
    SGD_Produtos.Cells[2,0]   := 'Referência';
    SGD_Produtos.ColWidths[2] := 80;
    SGD_Produtos.Cells[3,0]   := 'Descrição';
    SGD_Produtos.ColWidths[3] := 224;
    SGD_Produtos.Cells[4,0]   := 'Lote';
    SGD_Produtos.ColWidths[4] := 80;
    SGD_Produtos.Cells[5,0]   := 'Vlr.Unitário (R$)';
    SGD_Produtos.ColWidths[5] := 80;
    SGD_Produtos.Cells[6,0]   := 'Vlr.Total (R$)';
    SGD_Produtos.ColWidths[6] := 80;

    Ind := 1;
    While ConexaoBD.SQL_FB_Papeletas_Produtos.Eof = False Do
      begin
      SGD_Produtos.Cells[0,Ind] := ConexaoBD.SQL_FB_Papeletas_Produtosfb_papeleta_produto_qtde.Text;
      SGD_Produtos.Cells[1,Ind] := ConexaoBD.SQL_FB_Papeletas_Produtosfb_papeleta_produto_codigo.Text;

      ConexaoBD.SQL_FB_Produtos.Close;
      ConexaoBD.SQL_FB_Produtos.SQL.Clear;
      ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_referencia = '+#39+Trim(ConexaoBD.SQL_FB_Papeletas_Produtosfb_papeleta_produto_codigo.Text)+#39);
      ConexaoBD.SQL_FB_Produtos.Open;
      SGD_Produtos.Cells[2,Ind] := ConexaoBD.SQL_FB_Produtosfb_produto_referencia.Text;
      ConexaoBD.SQL_FB_Produtos.Close;

      SGD_Produtos.Cells[3,Ind] := ConexaoBD.SQL_FB_Papeletas_Produtosfb_papeleta_produto_desc.Text;
      SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_FB_Papeletas_Produtosfb_papeleta_produto_lote.Text;
      SGD_Produtos.Cells[5,Ind] := ConexaoBD.SQL_FB_Papeletas_Produtosfb_papeleta_produto_vlr_uni.Text;
      SGD_Produtos.Cells[6,Ind] := ConexaoBD.SQL_FB_Papeletas_Produtosfb_papeleta_produto_vlr_tot.Text;
      Ind := Ind + 1;
      ConexaoBD.SQL_FB_Papeletas_Produtos.Next;
    End;
    ConexaoBD.SQL_FB_Papeletas_Produtos.Close;

    // Carrega dados da Nota
    Natureza_Operacao.Text        := ConexaoBD.SQL_FB_Papeletasfb_papeleta_natureza_oper.Text;
    Cliente_Tipo_Faturamento.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_tipo_fatura.Text;
    Cliente_Tipo_Transporte.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_tipo_transp.Text;

    ConexaoBD.SQL_FB_Transportadoras.Close;
    ConexaoBD.SQL_FB_Transportadoras.SQL.Clear;
    ConexaoBD.SQL_FB_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_numero ='+#39+ConexaoBD.SQL_FB_Papeletasfb_papeleta_transporta.Text+#39);
    ConexaoBD.SQL_FB_Transportadoras.Open;
    Cliente_Transportadora.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_transporta.Text + ' - ' + ConexaoBD.SQL_FB_Transportadorasfb_transportadora_nome.Text;
    ConexaoBD.SQL_FB_Transportadoras.Close;

    if ConexaoBD.SQL_FB_Papeletasfb_papeleta_emite_lote.Text = 'S' Then
      begin
      Cliente_Emite_Lote.Text := 'Sim';
      end
    Else
      begin
      Cliente_Emite_Lote.Text := 'Não';
    end;
    Cliente_Pgto_Frete.Text       := ConexaoBD.SQL_FB_Papeletasfb_papeleta_pgto_frete.Text;

    ConexaoBD.SQL_FB_Representantes.Close;
    ConexaoBD.SQL_FB_Representantes.SQL.Clear;
    ConexaoBD.SQL_FB_Representantes.SQL.Add('Select * from fb_representantes Where fb_representante_codigo ='+#39+ConexaoBD.SQL_FB_Papeletasfb_papeleta_vendedor.Text+#39);
    ConexaoBD.SQL_FB_Representantes.Open;
    Representante.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_vendedor.Text + ' - ' + ConexaoBD.SQL_FB_Representantesfb_representante_nome.Text;
    ConexaoBD.SQL_FB_Representantes.Close;

    ConexaoBD.SQL_FB_Bancos.Close;
    ConexaoBD.SQL_FB_Bancos.SQL.Clear;
    ConexaoBD.SQL_FB_Bancos.SQL.Add('Select * from fb_bancos Where fb_banco_codigo ='+#39+ConexaoBD.SQL_FB_Papeletasfb_papeleta_banco.Text+#39);
    ConexaoBD.SQL_FB_Bancos.Open;
    Banco.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_banco.Text + ' - ' + ConexaoBD.SQL_FB_Bancosfb_banco_descricao.Text;
    ConexaoBD.SQL_FB_Bancos.Close;

    Cliente_Desconto.Text         := ConexaoBD.SQL_FB_Papeletasfb_papeleta_desconto.Text;
    Cliente_Condicao_Pgto_1.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_cond_pgto_1.Text;
    Cliente_Condicao_Pgto_2.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_cond_pgto_2.Text;
    Cliente_Condicao_Pgto_3.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_cond_pgto_3.Text;
    Data_Emissao.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_data_emissao.Text;

    Nro_Parcela1.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_1.Text;
    Forma1.Text         := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_forma_1.Text;
    DT_Vencimento1.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_1.Text;
    Dt_Pagamento1.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_pgto_1.Text;
    Vlr_Parcela1.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_1.Text;
    Vlr_Juros1.Text     := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_juros_1.Text;
    Vlr_Pago1.Text      := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_1.Text;
    Cod_Bancario1.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_cod_bco_1.Text;
    Nro_Parcela2.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_2.Text;
    Forma2.Text         := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_forma_2.Text;
    DT_Vencimento2.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_2.Text;
    Dt_Pagamento2.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_pgto_2.Text;
    Vlr_Parcela2.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_2.Text;
    Vlr_Juros2.Text     := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_juros_2.Text;
    Vlr_Pago2.Text      := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_2.Text;
    Cod_Bancario2.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_cod_bco_2.Text;
    Nro_Parcela3.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_3.Text;
    Forma3.Text         := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_forma_3.Text;
    DT_Vencimento3.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_3.Text;
    Dt_Pagamento3.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_pgto_3.Text;
    Vlr_Parcela3.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_3.Text;
    Vlr_Juros3.Text     := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_juros_3.Text;
    Vlr_Pago3.Text      := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_3.Text;
    Cod_Bancario3.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_cod_bco_3.Text;

    Observacao_Nota.Text    := DBM_Ped_Observacao.Text;
    Volume.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_volume.Text;
    Nro_Ped.Text            := ConexaoBD.SQL_FB_Papeletasfb_papeleta_nro_pedido.Text;
    Valor_Total.Text        := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
    Valor_IPI.Text          := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_ipi.Text;

    Observacao_Nota.Lines.Clear;
    Observacao_Nota.Lines.Add(DBM_Ped_Observacao.Text);

    Ordem_Compra.Text       := ConexaoBD.SQL_FB_Papeletasfb_papeleta_ordem_compra.Text;

    ConexaoBD.SQL_FB_Papeletas.Close;
  End;

  Seta();
end;

end.
