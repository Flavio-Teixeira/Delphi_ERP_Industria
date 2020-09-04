unit V_Historico_Produtos_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Mask, StdCtrls, DBCtrls, Buttons, ExtCtrls;

type
  TVHistoricoProdutos02 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    GroupBox7: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label52: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label53: TLabel;
    Label10: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Cliente_Desconto: TEdit;
    Cliente_Condicao_Pgto_1: TEdit;
    Cliente_Condicao_Pgto_2: TEdit;
    Cliente_Condicao_Pgto_3: TEdit;
    Observacao_Nota: TMemo;
    Nro_Nota_Fiscal: TEdit;
    Data_Emissao: TMaskEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Valor_Desconto: TEdit;
    Valor_Total: TEdit;
    Valor_SubTotal: TEdit;
    GroupBox5: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Nro_Duplicata_1: TEdit;
    DT_Vencto_1: TMaskEdit;
    Vlr_Vencto_1: TEdit;
    Nro_Duplicata_2: TEdit;
    DT_Vencto_2: TMaskEdit;
    Vlr_Vencto_2: TEdit;
    Nro_Duplicata_3: TEdit;
    DT_Vencto_3: TMaskEdit;
    Vlr_Vencto_3: TEdit;
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
    Cliente_Endereco: TEdit;
    Cliente_Complemento: TEdit;
    Cliente_Bairro: TEdit;
    Cliente_Cidade: TEdit;
    Cliente_Cep: TMaskEdit;
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
    Cliente_Codigo: TEdit;
    Cliente_Estado: TEdit;
    Cliente_Pais: TEdit;
    Natureza_Operacao: TEdit;
    Cliente_Emite_Lote: TEdit;
    Cliente_Tipo_Transporte: TEdit;
    Cliente_Pgto_Frete: TEdit;
    Cliente_Transportadora: TEdit;
    DBM_NF_Observacao: TDBMemo;
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VHistoricoProdutos02: TVHistoricoProdutos02;

implementation

uses Conexao_BD, Rotinas_Gerais, DB;

{$R *.dfm}

procedure TVHistoricoProdutos02.FormShow(Sender: TObject);
var Ind: integer;
begin
    Ampulheta();
    // Carrega Informações da Nota
    ConexaoBD.SQL_FB_Notas_Entradas.Close;
    ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
    ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * from fb_notas_entradas Where fb_nota_entrada_numero ='+#39+Trim(Nro_Nota_Fiscal.Text)+#39);
    ConexaoBD.SQL_FB_Notas_Entradas.Open;

    {Natureza_Operacao.Text        := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_natureza_oper.Text;
    Cliente_Desconto.Text         := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_desconto.Text;
    Cliente_Condicao_Pgto_1.Text  := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cond_pgto_1.Text;
    Cliente_Condicao_Pgto_2.Text  := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cond_pgto_2.Text;
    Cliente_Condicao_Pgto_3.Text  := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cond_pgto_3.Text;
    Cliente_Emite_Lote.Text       := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_emite_lote.Text;
    Data_Emissao.Text             := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_emissao.Text;
    Cliente_Tipo_Transporte.Text  := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_tipo_transp.Text;
    Cliente_Pgto_Frete.Text       := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_pgto_frete.Text;
    Cliente_Transportadora.Text   := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_transporta.Text;

    Observacao_Nota.Text          := DBM_NF_Observacao.Text;

    Valor_Desconto.Text           := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_valor_desc.Text;
    Valor_SubTotal.Text           := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_valor_total.Text;
    Valor_Total.Text              := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_valor_pedido.Text;
    Nro_Duplicata_1.Text          := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_dup_nro_1.Text;
    Nro_Duplicata_2.Text          := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_dup_nro_2.Text;
    Nro_Duplicata_3.Text          := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_dup_nro_3.Text;
    DT_Vencto_1.Text              := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_dup_dt_vcto_1.Text;
    DT_Vencto_2.Text              := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_dup_dt_vcto_2.Text;
    DT_Vencto_3.Text              := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_dup_dt_vcto_3.Text;
    Vlr_Vencto_1.Text             := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_dup_vlr_1.Text;
    Vlr_Vencto_2.Text             := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_dup_vlr_2.Text;
    Vlr_Vencto_3.Text             := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_dup_vlr_3.Text;


    Cliente_Codigo.Text := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_codigo.Text;
    // Carrega dados do Cliente
    ConexaoBD.SQL_FB_Clientes.Close;
    ConexaoBD.SQL_FB_Clientes.SQL.Clear;
    ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo ='+#39+Trim(Cliente_Codigo.Text)+#39);
    ConexaoBD.SQL_FB_Clientes.Open;

    Cliente_Empresa.Text          := 'Ibrasmak';
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
    ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;
    ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Add('Select * from fb_notas_entradas_produtos Where fb_nota_entrada_produto_numero ='+#39+Trim(Nro_Nota_Fiscal.Text)+#39);
    ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Open;

    SGD_Produtos.RowCount := (ConexaoBD.SQL_FB_Notas_Entradas_Produtos.RecordCount + 1);
    SGD_Produtos.FixedRows := 1;

     //*** Preparação do StringGrid ***
     //*** Quantidade ***
     SGD_Produtos.Cells[0,0]   := 'Quantidade';
     SGD_Produtos.ColWidths[0] := 60;

     //*** Código do Produto ***
     SGD_Produtos.Cells[1,0]   := 'Cód.Produto';
     SGD_Produtos.ColWidths[1] := 64;

     //*** Descrição do Produto ***
     SGD_Produtos.Cells[2,0]   := 'Descrição';
     SGD_Produtos.ColWidths[2] := 185;

     //*** Lote do Produto ***
     SGD_Produtos.Cells[3,0]   := 'Lote';
     SGD_Produtos.ColWidths[3] := 75;

     //*** Data de Fabricação ***
     SGD_Produtos.Cells[4,0]   := 'DT.Fabricação';
     SGD_Produtos.ColWidths[4] := 75;

     //*** Data de Validade ***
     SGD_Produtos.Cells[5,0]   := 'DT.Validade';
     SGD_Produtos.ColWidths[5] := 65;

     //*** Valor Unitário ***
     SGD_Produtos.Cells[6,0]   := 'Vlr.Unitário (R$)';
     SGD_Produtos.ColWidths[6] := 80;

     //*** Valor Total ***
     SGD_Produtos.Cells[7,0]   := 'Vlr.Total (R$)';
     SGD_Produtos.ColWidths[7] := 80;

    Ind := 1;
    While ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Eof = False Do
      begin
      SGD_Produtos.Cells[0,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_qtde.Text;
      SGD_Produtos.Cells[1,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_codigo.Text;
      SGD_Produtos.Cells[2,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_desc.Text;
      SGD_Produtos.Cells[3,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_lote.Text;
      SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_fabricacao.Text;
      SGD_Produtos.Cells[5,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_validade.Text;
      SGD_Produtos.Cells[6,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vr_uni.Text;
      SGD_Produtos.Cells[7,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vr_tot.Text;
      Ind := Ind + 1;
      ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Next;
    End;
    ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close; }

    Seta();
end;

procedure TVHistoricoProdutos02.BT_SairClick(Sender: TObject);
begin
    VHistoricoProdutos02.Close;
end;

end.
