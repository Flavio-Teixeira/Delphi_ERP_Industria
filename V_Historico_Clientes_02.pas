unit V_Historico_Clientes_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, Grids, StdCtrls, DBCtrls, Buttons, ExtCtrls;

type
  TVHistoricoClientes02 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Tipo_Fatura: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    GroupBox7: TGroupBox;
    Label47: TLabel;
    Label49: TLabel;
    Cliente_Condicao_Pgto_1: TEdit;
    Cliente_Condicao_Pgto_2: TEdit;
    Cliente_Condicao_Pgto_3: TEdit;
    Cliente_Transportadora: TComboBox;
    SGD_Produtos: TStringGrid;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label12: TLabel;
    Cliente_Nome: TEdit;
    Nro_Pedido: TEdit;
    Label8: TLabel;
    Cliente_tipo_codigo: TComboBox;
    Cliente_Codigo: TEdit;
    Label18: TLabel;
    Data_Emissao: TMaskEdit;
    Label54: TLabel;
    Nro_Ped: TEdit;
    DBM_NF_Observacao: TDBMemo;
    DBM_NF_Observacao_Log: TDBMemo;
    DBM_Ped_Observacao: TDBMemo;
    DBM_Ped_Observacao_Log: TDBMemo;
    Label55: TLabel;
    Ordem_Compra: TEdit;
    Cliente_Condicao_Pgto_4: TEdit;
    Label6: TLabel;
    Valor_Total: TEdit;
    Label1: TLabel;
    Valor_IPI: TEdit;
    Movto_Pos_Total: TEdit;
    Movto_Pos_Atual: TEdit;
    BT_Anterior: TButton;
    BT_Proximo: TButton;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ProximoClick(Sender: TObject);
    procedure BT_AnteriorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Carrega_Informacoes();

  public
    { Public declarations }
  end;

var
  VHistoricoClientes02: TVHistoricoClientes02;

implementation

uses Conexao_BD, Rotinas_Gerais, V_Historico_Clientes_01;

{$R *.dfm}

procedure TVHistoricoClientes02.BT_SairClick(Sender: TObject);
begin
  VHistoricoClientes02.Close;
end;

procedure TVHistoricoClientes02.FormShow(Sender: TObject);
begin
     Carrega_Informacoes();
end;

procedure TVHistoricoClientes02.Carrega_Informacoes();

var
   Ind: integer;

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

    Cliente_tipo_codigo.Text      := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo_tipo.Text;
    Cliente_Nome.Text             := ConexaoBD.SQL_FB_Clientesfb_cliente_razao_social.Text;
    ConexaoBD.SQL_FB_Clientes.Close;

    // Carrega produtos da Nota
    ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add('Select * from fb_notas_fiscais_produtos Where fb_nota_fiscal_produto_numero ='+#39+Trim(Nro_Pedido.Text)+#39+' Order By fb_nota_fiscal_produto_posicao Asc');
    ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount <= 0 Then
       Begin
       SGD_Produtos.RowCount := 2;
       End
    Else
       Begin
       SGD_Produtos.RowCount := (ConexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount + 1);
    End;

    SGD_Produtos.FixedRows := 1;

    SGD_Produtos.Cells[0,0]   := 'Quantidade';
    SGD_Produtos.ColWidths[0] := 60;
    SGD_Produtos.Cells[1,0]   := 'Cód.Produto';
    SGD_Produtos.ColWidths[1] := 100;
    SGD_Produtos.Cells[2,0]   := 'Referência';
    SGD_Produtos.ColWidths[2] := 100;
    SGD_Produtos.Cells[3,0]   := 'Descrição';
    SGD_Produtos.ColWidths[3] := 260;
    SGD_Produtos.Cells[4,0]   := 'Vlr.Unitário (R$)';
    SGD_Produtos.ColWidths[4] := 80;
    SGD_Produtos.Cells[5,0]   := 'Vlr.Total (R$)';
    SGD_Produtos.ColWidths[5] := 80;

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
      SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_uni.Text;
      SGD_Produtos.Cells[5,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text;
      Ind := Ind + 1;
      ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
    End;
    ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;

    // Carrega dados da Nota
    ConexaoBD.SQL_FB_Transportadoras.Close;
    ConexaoBD.SQL_FB_Transportadoras.SQL.Clear;
    ConexaoBD.SQL_FB_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_numero ='+#39+ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text+#39);
    ConexaoBD.SQL_FB_Transportadoras.Open;
    Cliente_Transportadora.Text   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text + ' - ' + ConexaoBD.SQL_FB_Transportadorasfb_transportadora_nome.Text;
    ConexaoBD.SQL_FB_Transportadoras.Close;

    Cliente_Condicao_Pgto_1.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_1.Text;
    Cliente_Condicao_Pgto_2.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_2.Text;
    Cliente_Condicao_Pgto_3.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_3.Text;
    Cliente_Condicao_Pgto_4.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_4.Text;
    Data_Emissao.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;

    Nro_Ped.Text      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nro_pedido.Text;
    Valor_Total.Text  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
    Valor_IPI.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text;
    Ordem_Compra.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_ordem_compra.Text;

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    end
  Else If Trim(Tipo_Fatura.Text) = 'Papeleta' Then
    begin
    ConexaoBD.SQL_FB_Papeletas.Close;
    ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
    ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * from fb_papeletas Where fb_papeleta_numero ='+#39+Trim(Nro_Pedido.Text)+#39+' Order By fb_papeleta_produto_posicao Asc');
    ConexaoBD.SQL_FB_Papeletas.Open;

    Cliente_Codigo.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text;
    // Carrega dados do Cliente
    ConexaoBD.SQL_FB_Clientes.Close;
    ConexaoBD.SQL_FB_Clientes.SQL.Clear;
    ConexaoBD.SQL_FB_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo ='+#39+Trim(Cliente_Codigo.Text)+#39);
    ConexaoBD.SQL_FB_Clientes.Open;

    Cliente_tipo_codigo.Text      := ConexaoBD.SQL_FB_Clientesfb_cliente_codigo_tipo.Text;
    Cliente_Nome.Text             := ConexaoBD.SQL_FB_Clientesfb_cliente_razao_social.Text;
    ConexaoBD.SQL_FB_Clientes.Close;

    // Carrega produtos da Nota
    ConexaoBD.SQL_FB_Papeletas_Produtos.Close;
    ConexaoBD.SQL_FB_Papeletas_Produtos.SQL.Clear;
    ConexaoBD.SQL_FB_Papeletas_Produtos.SQL.Add('Select * from fb_papeletas_produtos Where fb_papeleta_produto_numero ='+#39+Trim(Nro_Pedido.Text)+#39+' Order By fb_papeleta_produto_posicao Asc');
    ConexaoBD.SQL_FB_Papeletas_Produtos.Open;

    If ConexaoBD.SQL_FB_Papeletas_Produtos.RecordCount <= 0 Then
       Begin
       SGD_Produtos.RowCount := 2;
       End
    Else
       Begin
       SGD_Produtos.RowCount := (ConexaoBD.SQL_FB_Papeletas_Produtos.RecordCount + 1);
    End;

    SGD_Produtos.FixedRows := 1;

    SGD_Produtos.Cells[0,0]   := 'Quantidade';
    SGD_Produtos.ColWidths[0] := 60;
    SGD_Produtos.Cells[1,0]   := 'Cód.Produto';
    SGD_Produtos.ColWidths[1] := 100;
    SGD_Produtos.Cells[2,0]   := 'Referência';
    SGD_Produtos.ColWidths[2] := 100;
    SGD_Produtos.Cells[3,0]   := 'Descrição';
    SGD_Produtos.ColWidths[3] := 260;
    SGD_Produtos.Cells[4,0]   := 'Vlr.Unitário (R$)';
    SGD_Produtos.ColWidths[4] := 80;
    SGD_Produtos.Cells[5,0]   := 'Vlr.Total (R$)';
    SGD_Produtos.ColWidths[5] := 80;

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
      SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_FB_Papeletas_Produtosfb_papeleta_produto_vlr_uni.Text;
      SGD_Produtos.Cells[5,Ind] := ConexaoBD.SQL_FB_Papeletas_Produtosfb_papeleta_produto_vlr_tot.Text;
      Ind := Ind + 1;
      ConexaoBD.SQL_FB_Papeletas_Produtos.Next;
    End;
    ConexaoBD.SQL_FB_Papeletas_Produtos.Close;

    // Carrega dados da Nota
    ConexaoBD.SQL_FB_Transportadoras.Close;
    ConexaoBD.SQL_FB_Transportadoras.SQL.Clear;
    ConexaoBD.SQL_FB_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_numero ='+#39+ConexaoBD.SQL_FB_Papeletasfb_papeleta_transporta.Text+#39);
    ConexaoBD.SQL_FB_Transportadoras.Open;
    Cliente_Transportadora.Text   := ConexaoBD.SQL_FB_Papeletasfb_papeleta_transporta.Text + ' - ' + ConexaoBD.SQL_FB_Transportadorasfb_transportadora_nome.Text;
    ConexaoBD.SQL_FB_Transportadoras.Close;

    Cliente_Condicao_Pgto_1.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_cond_pgto_1.Text;
    Cliente_Condicao_Pgto_2.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_cond_pgto_2.Text;
    Cliente_Condicao_Pgto_3.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_cond_pgto_3.Text;
    Cliente_Condicao_Pgto_4.Text  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_cond_pgto_4.Text;
    Data_Emissao.Text             := ConexaoBD.SQL_FB_Papeletasfb_papeleta_data_emissao.Text;

    Nro_Ped.Text            := ConexaoBD.SQL_FB_Papeletasfb_papeleta_nro_pedido.Text;
    Valor_Total.Text        := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
    Valor_IPI.Text          := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_ipi.Text;
    Ordem_Compra.Text       := ConexaoBD.SQL_FB_Papeletasfb_papeleta_ordem_compra.Text;

    ConexaoBD.SQL_FB_Papeletas.Close;
  End;

  Seta();
end;

procedure TVHistoricoClientes02.BT_ProximoClick(Sender: TObject);
begin
     If StrToInt(Movto_Pos_Atual.Text) < StrToInt(Movto_Pos_Total.Text) Then
        Begin

        Movto_Pos_Atual.Text := IntToStr(StrToInt(Movto_Pos_Atual.Text) + 1);
        Nro_Pedido.Text      := Trim(VHistoricoClientes01.SGD_Compras.Cells[1,StrToInt(Movto_Pos_Atual.Text)]);
        Tipo_Fatura.Text     := Trim(VHistoricoClientes01.SGD_Compras.Cells[0,StrToInt(Movto_Pos_Atual.Text)]);

        Carrega_Informacoes();
     End;
end;

procedure TVHistoricoClientes02.BT_AnteriorClick(Sender: TObject);
begin
     If StrToInt(Movto_Pos_Atual.Text) > 1 Then
        Begin

        Movto_Pos_Atual.Text := IntToStr(StrToInt(Movto_Pos_Atual.Text) - 1);
        Nro_Pedido.Text      := Trim(VHistoricoClientes01.SGD_Compras.Cells[1,StrToInt(Movto_Pos_Atual.Text)]);
        Tipo_Fatura.Text     := Trim(VHistoricoClientes01.SGD_Compras.Cells[0,StrToInt(Movto_Pos_Atual.Text)]);

        Carrega_Informacoes();
     End;
end;

procedure TVHistoricoClientes02.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     VHistoricoClientes02 := Nil;
end;

end.
