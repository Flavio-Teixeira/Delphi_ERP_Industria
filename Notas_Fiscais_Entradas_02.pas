unit Notas_Fiscais_Entradas_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, Buttons, ExtCtrls, DBCtrls, ComCtrls;

type
  TNotasFiscaisEntradas02 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Nota_Desconto_ICMS: TCheckBox;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label53: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Nota_Base_ICMS: TEdit;
    Nota_Valor_ICMS: TEdit;
    Nota_Base_ICMS_Sub: TEdit;
    Nota_Valor_ICMS_Sub: TEdit;
    Nota_Valor_Produto: TEdit;
    Nota_Valor_Frete: TEdit;
    Nota_Valor_Seguro: TEdit;
    Nota_Outras_Despesas: TEdit;
    Nota_Valor_IPI: TEdit;
    Nota_Valor_Nota: TEdit;
    Transportadora_CNPJ: TMaskEdit;
    Transportadora_Nome: TEdit;
    Nota_Pgto_Frete: TComboBox;
    Nota_Qtde: TEdit;
    Nota_Especie: TEdit;
    Nota_Marca: TEdit;
    Nota_Peso_Bruto: TEdit;
    Nota_Peso_Liquido: TEdit;
    Nota_Obs: TEdit;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    Posicao_Nota: TEdit;
    DBG_Nota_Obs: TDBMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    Label3: TLabel;
    Fornecedor_Numero: TEdit;
    Fornecedor_Nome: TEdit;
    BT_Procurar: TBitBtn;
    GroupBox2: TGroupBox;
    Label29: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label34: TLabel;
    Label4: TLabel;
    Label47: TLabel;
    Label28: TLabel;
    Nota_Numero: TEdit;
    Nota_Emissao: TMaskEdit;
    Nota_Entrada: TMaskEdit;
    Nota_Recebimento: TMaskEdit;
    Nota_CFOP: TEdit;
    Nota_Natureza: TEdit;
    Nota_Condicao_Pgto_1: TEdit;
    Nota_Descricao_Contas_Pagar: TEdit;
    GroupBox3: TGroupBox;
    SGD_Produtos: TStringGrid;
    BT_Adicionar: TBitBtn;
    TabSheet2: TTabSheet;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SGD_Servicos: TStringGrid;
    Panel8: TPanel;
    BT_Adicionar_Servicos: TBitBtn;
    Nota_Aliquota_ISS: TEdit;
    Nota_Valor_ISS: TEdit;
    Nota_Valor_Servicos: TEdit;
    TabSheet3: TTabSheet;
    GroupBox6: TGroupBox;
    SGD_Vencimentos: TStringGrid;
    BT_Adicionar_Venctos: TBitBtn;
    Label30: TLabel;
    Nota_Status: TEdit;
    Nota_CFOP_2: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    Nota_Utilizacao: TComboBox;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Nota_NumeroKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_EmissaoKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_EntradaKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_RecebimentoKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_CFOPKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_NaturezaKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Condicao_Pgto_1KeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Descricao_Contas_PagarKeyPress(Sender: TObject;
      var Key: Char);
    procedure Nota_Aliquota_ISSKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_ISSKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_ServicosKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Base_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Base_ICMS_SubKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_ICMS_SubKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_SeguroKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Outras_DespesasKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_CNPJKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Pgto_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_QtdeKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_EspecieKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_MarcaKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Peso_BrutoKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Peso_LiquidoKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_ObsKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Condicao_Pgto_1Exit(Sender: TObject);
    procedure Nota_Aliquota_ISSExit(Sender: TObject);
    procedure Nota_Valor_ISSExit(Sender: TObject);
    procedure Nota_Valor_ServicosExit(Sender: TObject);
    procedure Nota_Base_ICMSExit(Sender: TObject);
    procedure Nota_Valor_ICMSExit(Sender: TObject);
    procedure Nota_Base_ICMS_SubExit(Sender: TObject);
    procedure Nota_Valor_ICMS_SubExit(Sender: TObject);
    procedure Nota_Valor_ProdutoExit(Sender: TObject);
    procedure Nota_Valor_FreteExit(Sender: TObject);
    procedure Nota_Valor_SeguroExit(Sender: TObject);
    procedure Nota_Outras_DespesasExit(Sender: TObject);
    procedure Nota_Valor_IPIExit(Sender: TObject);
    procedure Nota_Valor_NotaExit(Sender: TObject);
    procedure Nota_QtdeExit(Sender: TObject);
    procedure Nota_Peso_BrutoExit(Sender: TObject);
    procedure Nota_Peso_LiquidoExit(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_AdicionarClick(Sender: TObject);
    procedure BT_Adicionar_ServicosClick(Sender: TObject);
    procedure BT_Adicionar_VenctosClick(Sender: TObject);
    procedure SGD_ProdutosDblClick(Sender: TObject);
    procedure SGD_ServicosDblClick(Sender: TObject);
    procedure SGD_VencimentosDblClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Nota_CFOP_2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;

    procedure Exibe_Grid_Produtos();
    procedure Exibe_Grid_Servicos();
    procedure Exibe_Grid_Vencimentos();

  public
    { Public declarations }
  end;

var
  NotasFiscaisEntradas02: TNotasFiscaisEntradas02;

implementation

uses Conexao_BD, Rotinas_Gerais, Notas_Fiscais_Entradas_03,
  Notas_Fiscais_Entradas_04, Notas_Fiscais_Entradas_05, Fornecedor_00,
  Notas_Fiscais_Entradas_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TNotasFiscaisEntradas02.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno, Valor_Inteiro: String;
   Resultado, Qtde_Nao_Preenchida: Boolean;
   Ind: Integer;

begin
     Resultado           := True;
     Campo_Retorno       := '';

     Ampulheta();

     If Trim(Fornecedor_Numero.Text) = '' Then
        Begin
        Erro          := 'O Fornecedor Não foi Selecionado.';
        Campo_Retorno := '';
        End
     Else If (Trim(Nota_Numero.Text) = '') Or (Trim(Nota_Numero.Text) = '0') Then
        Begin
        Erro          := 'O Número da Nota Não Foi Informado.';
        Campo_Retorno := 'Nota_Numero';
        End
     Else If Trim(Nota_Emissao.Text) = '/  /' Then
        Begin
        Erro          := 'A Data de Emissão da Nota Não Foi Informada.';
        Campo_Retorno := 'Nota_Emissao';
        End
     Else If Trim(Nota_CFOP.Text) = '' Then
        Begin
        Erro          := 'O CFOP da Nota Não Foi Informado.';
        Campo_Retorno := 'Nota_CFOP';
        End
     Else If Trim(Nota_Natureza.Text) = '' Then
        Begin
        Erro          := 'A Natureza de Operação Não Foi Informada.';
        Campo_Retorno := 'Nota_Natureza';
        End
     Else If Trim(Nota_Descricao_Contas_Pagar.Text) = '' Then
        Begin
        Erro          := 'A Descrição do Contas a Pagar não foi Informada.';
        Campo_Retorno := 'Nota_Descricao_Contas_Pagar';
        End
     Else If SGD_Vencimentos.RowCount <= 2 Then
        Begin
        Erro          := 'O Vencimento não foi Preenchido.';
        Campo_Retorno := 'SGD_Vencimentos';
     End;

     Seta();

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin

        PageControl1.ActivePage := TabSheet1;
        PageControl1.Refresh;

        If Campo_Retorno = 'Fornecedor_Numero' Then
           Begin
           Fornecedor_Numero.SetFocus;
           End
        Else If Campo_Retorno = 'Nota_Numero' Then
           Begin
           Nota_Numero.SetFocus;
           End
        Else If Campo_Retorno = 'Nota_Emissao' Then
           Begin
           Nota_Emissao.SetFocus;
           End
        Else If Campo_Retorno = 'Nota_CFOP' Then
           Begin
           Nota_CFOP.SetFocus;
           End
        Else If Campo_Retorno = 'Nota_Natureza' Then
           Begin
           Nota_Natureza.SetFocus;
           End
        Else If Campo_Retorno = 'Nota_Descricao_Contas_Pagar' Then
           Begin
           Nota_Descricao_Contas_Pagar.SetFocus;
           End
        Else If Campo_Retorno = 'SGD_Vencimentos' Then
           Begin
           PageControl1.ActivePage := TabSheet3;
           PageControl1.Refresh;

           SGD_Vencimentos.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TNotasFiscaisEntradas02.BT_SairClick(Sender: TObject);
begin
     NotasFiscaisEntradas02.Close;
end;

procedure TNotasFiscaisEntradas02.FormShow(Sender: TObject);
begin
     If Trim(Posicao_Nota.Text) <> '' Then
        Begin

        //*** Obtem os Dados da Nota de Entrada ***

        ConexaoBD.SQL_FB_Notas_Entradas.Close;
        ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
        ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * from fb_notas_entradas Where fb_nota_entrada_numero = ' + Trim(Posicao_Nota.Text) );
        ConexaoBD.SQL_FB_Notas_Entradas.Open;

        If ConexaoBD.SQL_FB_Notas_Entradas.RecordCount > 0 Then
           Begin
           Fornecedor_Numero.Text           := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_fornecedor_nro.Text;
           Fornecedor_Nome.Text             := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_fornecedor_nome.Text;

           Nota_Numero.Text                 := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_numero_nota.Text;
           Nota_Emissao.Text                := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_emissao.Text;
           Nota_Entrada.Text                := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_entrada.Text;
           Nota_Recebimento.Text            := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_recebimento.Text;
           Nota_CFOP.Text                   := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text;
           Nota_CFOP_2.Text                 := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop_2.Text;
           Nota_Natureza.Text               := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_natureza_operacao.Text;
           Nota_Condicao_Pgto_1.Text        := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cond_pgto_1.Text;
           Nota_Descricao_Contas_Pagar.Text := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_contas_pagar.Text;

           Nota_Aliquota_ISS.Text           := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_s_aliquota_iss.Text;
           Nota_Valor_ISS.Text              := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_s_vlr_iss.Text;
           Nota_Valor_Servicos.Text         := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_s_vlr_servico.Text;

           Nota_Base_ICMS.Text              := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_base_icms.Text;
           Nota_Valor_ICMS.Text             := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_icms.Text;
           Nota_Base_ICMS_Sub.Text          := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_base_icms_sub.Text;
           Nota_Valor_ICMS_Sub.Text         := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_icms_sub.Text;
           Nota_Valor_Produto.Text          := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_produtos.Text;

           Nota_Valor_Frete.Text            := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_frete.Text;
           Nota_Valor_Seguro.Text           := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_seguro.Text;
           Nota_Outras_Despesas.Text        := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_outras_despesas.Text;
           Nota_Valor_IPI.Text              := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text;
           Nota_Valor_Nota.Text             := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.Text;

           Transportadora_CNPJ.Text         := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_transportadora_cnpj.Text;
           Transportadora_Nome.Text         := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_transportadora.Text;

           If Trim(ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_pgto_frete.Text) = 'Ibrasmak' Then
              Begin
              Nota_Pgto_Frete.ItemIndex     := 0;
              End
           Else
              Begin
              Nota_Pgto_Frete.ItemIndex     := 1;
           End;

           Nota_Qtde.Text                   := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_qtde.Text;
           Nota_Especie.Text                := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_especie.Text;
           Nota_Marca.Text                  := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_marca.Text;
           Nota_Peso_Bruto.Text             := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_peso_bruto.Text;
           Nota_Peso_Liquido.Text           := ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_peso_liquido.Text;
           Nota_Obs.Text                    := DBG_Nota_Obs.Text;

           If Trim(ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_desconto_icms.Text) = 'S' Then
              Begin
              Nota_Desconto_ICMS.Checked := True;
              End
           Else
              Begin
              Nota_Desconto_ICMS.Checked := False;
           End;

           If Trim(ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_status.Text) <> '' Then
              Begin
              Nota_Status.Text := Trim(ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_status.Text);
              End
           Else
              Begin
              Nota_Status.Text := 'Entrada Manual';
           End;

           If Trim(ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_utilizacao.Text) = 'Industrialização' Then
              Begin
              Nota_Utilizacao.ItemIndex := 0;
              End
           Else If Trim(ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_utilizacao.Text) = 'Consumo' Then
              Begin
              Nota_Utilizacao.ItemIndex := 1;
              End
           Else If Trim(ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_utilizacao.Text) = 'Revenda' Then
              Begin
              Nota_Utilizacao.ItemIndex := 2;
           End;

        End;

        ConexaoBD.SQL_FB_Notas_Entradas.Close;

        Exibe_Grid_Produtos();
        Exibe_Grid_Servicos();
        Exibe_Grid_Vencimentos();
     End;
end;

procedure TNotasFiscaisEntradas02.Exibe_Grid_Produtos();

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

     //*** Preparação do StringGrid ***

     //*** Código do Produto ***
     SGD_Produtos.Cells[0,0]   := 'Cód.Produto';
     SGD_Produtos.ColWidths[0] := 74;

     //*** Referência do Produto ***
     SGD_Produtos.Cells[1,0]   := 'Referência';
     SGD_Produtos.ColWidths[1] := 74;

     //*** Descrição do Produto ***
     SGD_Produtos.Cells[2,0]   := 'Descrição';
     SGD_Produtos.ColWidths[2] := 110;

     //*** C.F. ***
     SGD_Produtos.Cells[3,0]   := 'C.F.';
     SGD_Produtos.ColWidths[3] := 30;

     //*** S.T. ***
     SGD_Produtos.Cells[4,0]   := 'S.T.';
     SGD_Produtos.ColWidths[4] := 30;

     //*** Unidade do Produto ***
     SGD_Produtos.Cells[5,0]   := 'Unidade';
     SGD_Produtos.ColWidths[5] := 50;

     //*** Qtde ***
     SGD_Produtos.Cells[6,0]   := 'Qtde';
     SGD_Produtos.ColWidths[6] := 40;

     //*** Qtde em Unidades***
     SGD_Produtos.Cells[7,0]   := 'Qtde Unidades';
     SGD_Produtos.ColWidths[7] := 80;

     //*** Valor Unitário ***
     SGD_Produtos.Cells[8,0]   := 'Valor (R$)';
     SGD_Produtos.ColWidths[8] := 80;

     //*** Valor Total ***
     SGD_Produtos.Cells[9,0]   := 'Vlr.Total (R$)';
     SGD_Produtos.ColWidths[9] := 75;

     //*** ICMS ***
     SGD_Produtos.Cells[10,0]   := 'ICMS%';
     SGD_Produtos.ColWidths[10] := 40;

     //*** IPI ***
     SGD_Produtos.Cells[11,0]   := 'IPI %';
     SGD_Produtos.ColWidths[11] := 30;

     //*** Valor Total ***
     SGD_Produtos.Cells[12,0]   := 'Vlr.IPI (R$)';
     SGD_Produtos.ColWidths[12] := 60;

     //*** Obtem os Dados dos Produtos da Nota de Entrada ***

     ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;
     ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Clear;
     ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Add('Select * from fb_notas_entradas_produtos Where fb_nota_entrada_produto_numero = ' + Trim(Posicao_Nota.Text) + ' And fb_nota_entrada_produto_tipo = ' + #39 + 'PRODUTO' + #39 + ' Order By fb_nota_entrada_produto_posicao Asc');
     ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Open;

     If ConexaoBD.SQL_FB_Notas_Entradas_Produtos.RecordCount > 0 Then
        Begin

        Ind := 0;

        ConexaoBD.SQL_FB_Notas_Entradas_Produtos.First;

        While Not ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Eof Do
              Begin

              Ind := Ind + 1;

              //*** Código do Produto ***
              SGD_Produtos.Cells[0,Ind]   := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_codigo.Text;

              //*** Referência do Produto ***
              SGD_Produtos.Cells[1,Ind]   := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_referencia.Text;

              //*** Descrição do Produto ***
              SGD_Produtos.Cells[2,Ind]   := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_descricao.Text;

              //*** C.F. ***
              SGD_Produtos.Cells[3,Ind]   := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_cf.Text;

              //*** S.T. ***
              SGD_Produtos.Cells[4,Ind]   := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_st.Text;

              //*** Unidade do Produto ***
              SGD_Produtos.Cells[5,Ind]   := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_unid.Text;

              //*** Qtde ***
              SGD_Produtos.Cells[6,Ind]   := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_qtde.Text;

              //*** Qtde ***
              SGD_Produtos.Cells[7,Ind]   := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_qtde_unidade.Text;

              //*** Valor Unitário ***
              SGD_Produtos.Cells[8,Ind]   := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_unit.Text;

              //*** Valor Total ***
              SGD_Produtos.Cells[9,Ind]   := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text;

              //*** ICMS ***
              SGD_Produtos.Cells[10,Ind]   := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_icms.Text;

              //*** IPI ***
              SGD_Produtos.Cells[11,Ind]  := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_ipi.Text;

              //*** Valor IPI ***
              SGD_Produtos.Cells[12,Ind]  := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_ipi.Text;

              NotasFiscaisEntradas02.SGD_Produtos.RowCount := Ind + 2;

              ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Next;
        End;

     End;

     ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;

     Seta();
end;

procedure TNotasFiscaisEntradas02.Exibe_Grid_Servicos();

var
   Ind, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao: String;

begin
     Ampulheta();

     //*** Prepara a Exibição dos Produtos para Compra ***

     //*** Zera Grid ***

     For Ind := 0 To SGD_Servicos.RowCount Do
         Begin
         SGD_Servicos.Cells[0,Ind] := '';
         SGD_Servicos.Cells[1,Ind] := '';
         SGD_Servicos.Cells[2,Ind] := '';
     End;

     //*** Preparação do StringGrid ***

     //*** Código do Produto ***
     SGD_Servicos.Cells[0,0]   := 'Descrição Serviços Prestados';
     SGD_Servicos.ColWidths[0] := 528;

     //*** Referência do Produto ***
     SGD_Servicos.Cells[1,0]   := 'Valor Unitário (R$)';
     SGD_Servicos.ColWidths[1] := 95;

     //*** Descrição do Produto ***
     SGD_Servicos.Cells[2,0]   := 'Valor Total (R$)';
     SGD_Servicos.ColWidths[2] := 80;

     //*** Obtem os Dados dos Produtos da Nota de Entrada ***

     ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;
     ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Clear;
     ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Add('Select * from fb_notas_entradas_produtos Where fb_nota_entrada_produto_numero = ' + Trim(Posicao_Nota.Text) + ' And fb_nota_entrada_produto_tipo = ' + #39 + 'SERVICO' + #39 + ' Order By fb_nota_entrada_produto_posicao Asc');
     ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Open;

     If ConexaoBD.SQL_FB_Notas_Entradas_Produtos.RecordCount > 0 Then
        Begin

        Ind := 0;
        ConexaoBD.SQL_FB_Notas_Entradas_Produtos.First;

        While Not ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Eof Do
              Begin

              Ind := Ind + 1;

              SGD_Servicos.Cells[0,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_descricao.Text;
              SGD_Servicos.Cells[1,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_unit.Text;
              SGD_Servicos.Cells[2,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text;

              NotasFiscaisEntradas02.SGD_Servicos.RowCount := Ind + 2;

              ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Next;
        End;

     End;

     ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;

     Seta();
end;

procedure TNotasFiscaisEntradas02.Exibe_Grid_Vencimentos();

var
   Ind, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao: String;

begin
     Ampulheta();

     //*** Prepara a Exibição dos Produtos para Compra ***

     //*** Zera Grid ***

     For Ind := 0 To SGD_Vencimentos.RowCount Do
         Begin
         SGD_Vencimentos.Cells[0,Ind] := '';
         SGD_Vencimentos.Cells[1,Ind] := '';
         SGD_Vencimentos.Cells[2,Ind] := '';
     End;

     //*** Preparação do StringGrid ***

     //*** Código do Produto ***
     SGD_Vencimentos.Cells[0,0]   := 'Duplicata';
     SGD_Vencimentos.ColWidths[0] := 522;

     //*** Referência do Produto ***
     SGD_Vencimentos.Cells[1,0]   := 'Vencimento';
     SGD_Vencimentos.ColWidths[1] := 95;

     //*** Descrição do Produto ***
     SGD_Vencimentos.Cells[2,0]   := 'Valor (R$)';
     SGD_Vencimentos.ColWidths[2] := 80;

     //*** Obtem os Dados dos Produtos da Nota de Entrada ***

     ConexaoBD.SQL_FB_Notas_Entradas_Venctos.Close;
     ConexaoBD.SQL_FB_Notas_Entradas_Venctos.SQL.Clear;
     ConexaoBD.SQL_FB_Notas_Entradas_Venctos.SQL.Add('Select * from fb_notas_entradas_venctos Where fb_nota_entrada_vencto_numero = ' + Trim(Posicao_Nota.Text) + ' Order By fb_nota_entrada_vencto_posicao Asc');
     ConexaoBD.SQL_FB_Notas_Entradas_Venctos.Open;

     If ConexaoBD.SQL_FB_Notas_Entradas_Venctos.RecordCount > 0 Then
        Begin

        Ind := 0;
        ConexaoBD.SQL_FB_Notas_Entradas_Venctos.First;

        While Not ConexaoBD.SQL_FB_Notas_Entradas_Venctos.Eof Do
              Begin

              Ind := Ind + 1;

              SGD_Vencimentos.Cells[0,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Venctosfb_nota_entrada_vencto_duplicata.Text;
              SGD_Vencimentos.Cells[1,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Venctosfb_nota_entrada_vencto_data.Text;
              SGD_Vencimentos.Cells[2,Ind] := ConexaoBD.SQL_FB_Notas_Entradas_Venctosfb_nota_entrada_vencto_valor.Text;

              NotasFiscaisEntradas02.SGD_Vencimentos.RowCount := Ind + 2;

              ConexaoBD.SQL_FB_Notas_Entradas_Venctos.Next;
        End;

     End;

     ConexaoBD.SQL_FB_Notas_Entradas_Venctos.Close;

     Seta();
end;

procedure TNotasFiscaisEntradas02.Nota_NumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_EmissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_EntradaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_RecebimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_CFOPKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_NaturezaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Condicao_Pgto_1KeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Descricao_Contas_PagarKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Aliquota_ISSKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_ISSKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_ServicosKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Base_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Base_ICMS_SubKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_ICMS_SubKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_ProdutoKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_SeguroKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Outras_DespesasKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Transportadora_CNPJKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Transportadora_NomeKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Pgto_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_QtdeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_EspecieKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_MarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Peso_BrutoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Peso_LiquidoKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_ObsKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Condicao_Pgto_1Exit(
  Sender: TObject);
begin
     If Trim(Nota_Condicao_Pgto_1.Text) = '' Then
        Begin
        Nota_Condicao_Pgto_1.Text := '0';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Aliquota_ISSExit(Sender: TObject);
begin
     If Trim(Nota_Aliquota_ISS.Text) = '' Then
        Begin
        Nota_Aliquota_ISS.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_ISSExit(Sender: TObject);
begin
     If Trim(Nota_Valor_ISS.Text) = '' Then
        Begin
        Nota_Valor_ISS.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_ServicosExit(Sender: TObject);
begin
     If Trim(Nota_Valor_Servicos.Text) = '' Then
        Begin
        Nota_Valor_Servicos.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Base_ICMSExit(Sender: TObject);
begin
     If Trim(Nota_Base_ICMS.Text) = '' Then
        Begin
        Nota_Base_ICMS.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_ICMSExit(Sender: TObject);
begin
     If Trim(Nota_Valor_ICMS.Text) = '' Then
        Begin
        Nota_Valor_ICMS.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Base_ICMS_SubExit(Sender: TObject);
begin
     If Trim(Nota_Base_ICMS_Sub.Text) = '' Then
        Begin
        Nota_Base_ICMS_Sub.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_ICMS_SubExit(Sender: TObject);
begin
     If Trim(Nota_Valor_ICMS_Sub.Text) = '' Then
        Begin
        Nota_Valor_ICMS_Sub.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_ProdutoExit(Sender: TObject);
begin
     If Trim(Nota_Valor_Produto.Text) = '' Then
        Begin
        Nota_Valor_Produto.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_FreteExit(Sender: TObject);
begin
     If Trim(Nota_Valor_Frete.Text) = '' Then
        Begin
        Nota_Valor_Frete.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_SeguroExit(Sender: TObject);
begin
     If Trim(Nota_Valor_Seguro.Text) = '' Then
        Begin
        Nota_Valor_Seguro.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Outras_DespesasExit(
  Sender: TObject);
begin
     If Trim(Nota_Outras_Despesas.Text) = '' Then
        Begin
        Nota_Outras_Despesas.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_IPIExit(Sender: TObject);
begin
     If Trim(Nota_Valor_IPI.Text) = '' Then
        Begin
        Nota_Valor_IPI.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Valor_NotaExit(Sender: TObject);
begin
     If Trim(Nota_Valor_Nota.Text) = '' Then
        Begin
        Nota_Valor_Nota.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_QtdeExit(Sender: TObject);
begin
     If Trim(Nota_Qtde.Text) = '' Then
        Begin
        Nota_Qtde.Text := '0';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Peso_BrutoExit(Sender: TObject);
begin
     If Trim(Nota_Peso_Bruto.Text) = '' Then
        Begin
        Nota_Peso_Bruto.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_Peso_LiquidoExit(Sender: TObject);
begin
     If Trim(Nota_Peso_Liquido.Text) = '' Then
        Begin
        Nota_Peso_Liquido.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas02.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão?') = 6 Then
        Begin
        Ampulheta();

        //*** Deleta a Nota de Entrada ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_notas_entradas Where fb_nota_entrada_numero = ' + Trim(Posicao_Nota.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Deleta os Produtos da Nota de Entrada ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_notas_entradas_produtos Where fb_nota_entrada_produto_numero = ' + Trim(Posicao_Nota.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Deleta os Vencimentos da Nota de Entrada ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_notas_entradas_venctos Where fb_nota_entrada_vencto_numero = ' + Trim(Posicao_Nota.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Recarrega Informações ***

        ConexaoBD.SQL_FB_Notas_Entradas.Close;
        ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
        ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * from fb_notas_entradas Order By fb_nota_entrada_data_emissao Desc');
        ConexaoBD.SQL_FB_Notas_Entradas.Open;

        Seta();

        MSG_Erro('Exclusão Efetuada... Por favor, avise o Departamento Financeiro para remover estes títulos do Contas a Pagar. Caso você não efetue este procedimento poderá acarretar problemas para a Empresa.');

        NotasFiscaisEntradas02.Close;
     End;
end;

procedure TNotasFiscaisEntradas02.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //*** Recarrega Informações ***

     ConexaoBD.SQL_FB_Notas_Entradas.Close;
     ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
     ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * from fb_notas_entradas Order By fb_nota_entrada_data_emissao Desc');
     ConexaoBD.SQL_FB_Notas_Entradas.Open;


     if Trim(Selecionado) = '' Then Selecionado := '0';
     if(ConexaoBD.SQL_FB_Notas_Entradas.Active = true)then ConexaoBD.SQL_FB_Notas_Entradas.Locate('fb_nota_entrada_numero_nota',(Selecionado),[]);


     //*** Fecha o Programa ***

     Action := caFree;
     Release;
     NotasFiscaisEntradas02 := Nil;
end;

procedure TNotasFiscaisEntradas02.BT_AdicionarClick(Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        Ampulheta();

        SGD_Produtos.Refresh;

        Application.CreateForm(TNotasFiscaisEntradas03,NotasFiscaisEntradas03);

        NotasFiscaisEntradas03.Programa_Anterior.Text := 'Entrada-Alteracao';
        NotasFiscaisEntradas03.Nro_Fornecedor.Text    := Trim(Fornecedor_Numero.Text);
        NotasFiscaisEntradas03.Adiciona_ARow.Text     := IntToStr(SGD_Produtos.RowCount - 1);

        Seta();
        NotasFiscaisEntradas03.ShowModal;
        NotasFiscaisEntradas03.Destroy;

        SGD_Produtos.Refresh;
        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Fornecedor');
     End;
end;

procedure TNotasFiscaisEntradas02.BT_Adicionar_ServicosClick(
  Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        Ampulheta();

        SGD_Servicos.Refresh;

        Application.CreateForm(TNotasFiscaisEntradas04,NotasFiscaisEntradas04);

        NotasFiscaisEntradas04.Programa_Anterior.Text := 'Entrada-Alteracao';
        NotasFiscaisEntradas04.Nro_Fornecedor.Text    := Trim(Fornecedor_Numero.Text);
        NotasFiscaisEntradas04.Adiciona_ARow.Text     := IntToStr(SGD_Servicos.RowCount - 1);

        Seta();
        NotasFiscaisEntradas04.ShowModal;
        NotasFiscaisEntradas04.Destroy;

        SGD_Servicos.Refresh;
        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Fornecedor');
     End;
end;

procedure TNotasFiscaisEntradas02.BT_Adicionar_VenctosClick(
  Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin
        Ampulheta();

        SGD_Vencimentos.Refresh;

        Application.CreateForm(TNotasFiscaisEntradas05,NotasFiscaisEntradas05);

        NotasFiscaisEntradas05.Programa_Anterior.Text := 'Entrada-Alteracao';
        NotasFiscaisEntradas05.Nro_Fornecedor.Text    := Trim(Fornecedor_Numero.Text);
        NotasFiscaisEntradas05.Adiciona_ARow.Text     := IntToStr(SGD_Vencimentos.RowCount - 1);

        Seta();
        NotasFiscaisEntradas05.ShowModal;
        NotasFiscaisEntradas05.Destroy;

        SGD_Vencimentos.Refresh;
        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Fornecedor');
     End;
end;

procedure TNotasFiscaisEntradas02.SGD_ProdutosDblClick(Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin

        If (Trim(SGD_Produtos.Cells[6, SGD_Produtos.Row]) <> '') And (Trim(SGD_Produtos.Cells[6, SGD_Produtos.Row]) <> '0') Then
           Begin

           Ampulheta();

           SGD_Produtos.Refresh;

           Application.CreateForm(TNotasFiscaisEntradas03,NotasFiscaisEntradas03);

           NotasFiscaisEntradas03.Programa_Anterior.Text := 'Entrada-Alteracao-Alteracao';
           NotasFiscaisEntradas03.Nro_Fornecedor.Text    := Trim(Fornecedor_Numero.Text);
           NotasFiscaisEntradas03.Adiciona_ARow.Text     := IntToStr(SGD_Produtos.Row);

           NotasFiscaisEntradas03.Adiciona_Codigo_Produto.Text      := SGD_Produtos.Cells[0, SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_Referencia.Text          := SGD_Produtos.Cells[1, SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_Descricao.Text           := SGD_Produtos.Cells[2, SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_CF.Text                  := SGD_Produtos.Cells[3, SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_ST.Text                  := SGD_Produtos.Cells[4, SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_Unidade.Text             := SGD_Produtos.Cells[5, SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_Quantidade.Text          := SGD_Produtos.Cells[6, SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_Quantidade_Unidade.Text  := SGD_Produtos.Cells[7, SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_Vlr_Unitario.Text        := SGD_Produtos.Cells[8, SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_Vlr_Total.Text           := SGD_Produtos.Cells[9, SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_ICMS.Text                := SGD_Produtos.Cells[10, SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_IPI.Text                 := SGD_Produtos.Cells[11,SGD_Produtos.Row];
           NotasFiscaisEntradas03.Adiciona_Vlr_IPI.Text             := SGD_Produtos.Cells[12,SGD_Produtos.Row];

           Seta();
           NotasFiscaisEntradas03.ShowModal;
           NotasFiscaisEntradas03.Destroy;

           SGD_Produtos.Refresh;
        End;

        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Fornecedor');
     End;
end;

procedure TNotasFiscaisEntradas02.SGD_ServicosDblClick(Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin

        If Trim(SGD_Servicos.Cells[0, SGD_Servicos.Row]) <> '' Then
           Begin

           Ampulheta();

           SGD_Servicos.Refresh;

           Application.CreateForm(TNotasFiscaisEntradas04,NotasFiscaisEntradas04);

           NotasFiscaisEntradas04.Programa_Anterior.Text := 'Entrada-Alteracao-Alteracao';
           NotasFiscaisEntradas04.Nro_Fornecedor.Text    := Trim(Fornecedor_Numero.Text);
           NotasFiscaisEntradas04.Adiciona_ARow.Text     := IntToStr(SGD_Servicos.Row);

           NotasFiscaisEntradas04.Adiciona_Descricao.Text      := SGD_Servicos.Cells[0, SGD_Servicos.Row];
           NotasFiscaisEntradas04.Adiciona_Vlr_Unitario.Text   := SGD_Servicos.Cells[1, SGD_Servicos.Row];
           NotasFiscaisEntradas04.Adiciona_Vlr_Total.Text      := SGD_Servicos.Cells[2, SGD_Servicos.Row];

           Seta();
           NotasFiscaisEntradas04.ShowModal;
           NotasFiscaisEntradas04.Destroy;

           SGD_Servicos.Refresh;
        End;

        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Fornecedor');
     End;
end;

procedure TNotasFiscaisEntradas02.SGD_VencimentosDblClick(Sender: TObject);
begin
     If Trim(Fornecedor_Numero.Text) <> '' Then
        Begin

        If Trim(SGD_Vencimentos.Cells[0, SGD_Vencimentos.Row]) <> '' Then
           Begin

           Ampulheta();

           SGD_Vencimentos.Refresh;

           Application.CreateForm(TNotasFiscaisEntradas05,NotasFiscaisEntradas05);

           NotasFiscaisEntradas05.Programa_Anterior.Text := 'Entrada-Alteracao-Alteracao';
           NotasFiscaisEntradas05.Nro_Fornecedor.Text    := Trim(Fornecedor_Numero.Text);
           NotasFiscaisEntradas05.Adiciona_ARow.Text     := IntToStr(SGD_Vencimentos.Row);

           NotasFiscaisEntradas05.Adiciona_Descricao.Text  := SGD_Vencimentos.Cells[0, SGD_Vencimentos.Row];
           NotasFiscaisEntradas05.Adiciona_Vencimento.Text := SGD_Vencimentos.Cells[1, SGD_Vencimentos.Row];
           NotasFiscaisEntradas05.Adiciona_Vlr_Total.Text  := SGD_Vencimentos.Cells[2, SGD_Vencimentos.Row];

           Seta();
           NotasFiscaisEntradas05.ShowModal;
           NotasFiscaisEntradas05.Destroy;

           SGD_Vencimentos.Refresh;
        End;

        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Fornecedor');
     End;
end;

procedure TNotasFiscaisEntradas02.BT_ProcurarClick(Sender: TObject);
begin
     NotasFiscaisEntradas02.Visible := False;

     Ampulheta();
     Application.CreateForm(TFornecedor00,Fornecedor00);

     Fornecedor00.Programa_Anterior.Text := 'Entrada-Alteracao';
     Fornecedor00.Fornecedor_Area.ItemIndex := 1;
     Fornecedor00.BT_Procurar.Click;

     Seta();
     Fornecedor00.ShowModal;
     //Fornecedor00.Destroy;

     NotasFiscaisEntradas02.Visible := True;
end;

procedure TNotasFiscaisEntradas02.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL, Posicao_Nota_Nova, Nro_Conta, Busca_Duplicata: String;
   Ind, Parcela_INI, Parcela_FIM: Integer;

begin
     If Valida_Dados() Then
        Begin

        Ampulheta();

        //*** Deleta a Nota de Entrada ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_notas_entradas Where fb_nota_entrada_numero = ' + Trim(Posicao_Nota.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Deleta os Produtos da Nota de Entrada ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_notas_entradas_produtos Where fb_nota_entrada_produto_numero = ' + Trim(Posicao_Nota.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Deleta os Vencimentos da Nota de Entrada ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_notas_entradas_venctos Where fb_nota_entrada_vencto_numero = ' + Trim(Posicao_Nota.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Insere a Nota de Entrada ***

        Comando_SQL := 'Insert into fb_notas_entradas(';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_fornecedor_nro, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_fornecedor_nome, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_numero_nota, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_data_emissao, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_data_entrada, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_data_recebimento, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_natureza_operacao, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_cfop, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_s_aliquota_iss, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_s_vlr_iss, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_s_vlr_servico, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_base_icms, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_vlr_icms, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_base_icms_sub, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_vlr_icms_sub, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_vlr_produtos, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_vlr_frete, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_vlr_seguro, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_outras_despesas, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_vlr_ipi, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_vlr_nota, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_transportadora_cnpj, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_transportadora, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_pgto_frete, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_qtde, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_especie, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_marca, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_peso_bruto, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_peso_liquido, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_observacoes, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_cond_pgto_1, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_contas_pagar, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_desconto_icms, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_status, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_cfop_2, ';
        Comando_SQL := Comando_SQL + 'fb_nota_entrada_utilizacao) ';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + Trim(Fornecedor_Numero.Text) + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Fornecedor_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + Trim(Nota_Numero.Text) + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Nota_Emissao.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Nota_Entrada.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Nota_Recebimento.Text),'amd','/') + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Nota_Natureza.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Nota_CFOP.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Aliquota_ISS.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Valor_ISS.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Valor_Servicos.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Base_ICMS.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Valor_ICMS.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Base_ICMS_Sub.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Valor_ICMS_Sub.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Valor_Produto.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Valor_Frete.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Valor_Seguro.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Outras_Despesas.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Valor_IPI.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Valor_Nota.Text)) + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Transportadora_CNPJ.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Transportadora_Nome.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Nota_Pgto_Frete.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Nota_Qtde.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Nota_Especie.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Nota_Marca.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Peso_Bruto.Text)) + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Nota_Peso_Liquido.Text)) + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Nota_Obs.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Nota_Condicao_Pgto_1.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Nota_Descricao_Contas_Pagar.Text) + #39 + ',';

        If Nota_Desconto_ICMS.Checked Then
           Begin
           Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ',';
           End
        Else
           Begin
           Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ',';
        End;

        Comando_SQL := Comando_SQL + #39 + Trim(Nota_Status.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Nota_CFOP_2.Text) + #39 + ',';
        Comando_SQL := Comando_SQL + #39 + Trim(Nota_Utilizacao.Text) + #39 + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Obtem a Posição da Nota ***

        ConexaoBD.SQL_FB_Notas_Entradas.Close;
        ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
        ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * from fb_notas_entradas Where fb_nota_entrada_fornecedor_nro = ' + Trim(Fornecedor_Numero.Text) + ' Order By fb_nota_entrada_numero Desc');
        ConexaoBD.SQL_FB_Notas_Entradas.Open;

        conexaoBD.SQL_FB_Notas_Entradas.First;

        Posicao_Nota_Nova := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_numero.Text;

        //*** Insere os Produtos da Nota ***

        For Ind := 1 To SGD_Produtos.RowCount Do
            Begin

            If Trim(SGD_Produtos.Cells[6,Ind]) <> '' Then
               Begin
               Comando_SQL := 'Insert into fb_notas_entradas_produtos(';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_numero, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_posicao, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_codigo, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_referencia, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_descricao, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_qtde, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_qtde_unidade, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_cf, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_st, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_unid, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_unit, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_total, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_icms, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_ipi, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_ipi, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_tipo) ';
               Comando_SQL := Comando_SQL + ' Values(';
               Comando_SQL := Comando_SQL + Trim(Posicao_Nota_Nova) + ',';
               Comando_SQL := Comando_SQL + Trim(IntToStr(Ind)) + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[0,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[1,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[6,Ind])) + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[7,Ind])) + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[3,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[4,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[5,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind])) + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[9,Ind])) + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[10,Ind])) + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[11,Ind])) + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[12,Ind])) + ',';
               Comando_SQL := Comando_SQL + #39 + 'PRODUTO' + #39 + ')';

               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Comunitario.ExecSQL;

               //*** Inclui a Referência dos Produtos ***

               If Trim(SGD_Produtos.Cells[1,Ind]) <> '' Then
                  Begin
                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add('Update fb_produtos Set fb_produto_referencia = ' +#39+ Trim(SGD_Produtos.Cells[1,Ind]) +#39+ ' Where fb_produto_codigo = ' + #39 + Trim(SGD_Produtos.Cells[0,Ind]) + #39);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;
               
            End;
        End;

        //*** Insere os Serviços da Nota ***

        For Ind := 1 To SGD_Servicos.RowCount Do
            Begin

            If Trim(SGD_Servicos.Cells[1,Ind]) <> '' Then
               Begin
               Comando_SQL := 'Insert into fb_notas_entradas_produtos(';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_numero, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_posicao, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_codigo, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_referencia, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_descricao, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_qtde, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_qtde_unidade, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_cf, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_st, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_unid, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_unit, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_total, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_icms, '; 
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_ipi, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_ipi, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_tipo) ';
               Comando_SQL := Comando_SQL + ' Values(';
               Comando_SQL := Comando_SQL + Trim(Posicao_Nota_Nova) + ',';
               Comando_SQL := Comando_SQL + Trim(IntToStr(Ind)) + ',';
               Comando_SQL := Comando_SQL + #39 + '' + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + '' + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Servicos.Cells[0,Ind]) + #39 + ',';
               Comando_SQL := Comando_SQL + '0' + ',';
               Comando_SQL := Comando_SQL + '0' + ',';
               Comando_SQL := Comando_SQL + #39 + '' + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + '' + #39 + ',';
               Comando_SQL := Comando_SQL + #39 + '' + #39 + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Servicos.Cells[1,Ind])) + ',';
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Servicos.Cells[2,Ind])) + ',';
               Comando_SQL := Comando_SQL + '0' + ',';
               Comando_SQL := Comando_SQL + '0' + ',';
               Comando_SQL := Comando_SQL + '0' + ',';
               Comando_SQL := Comando_SQL + #39 + 'SERVICO' + #39 + ')';

               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Comunitario.ExecSQL;
            End;
        End;

        //*** Insere os Vencimentos da Nota ***

        Parcela_INI := 0;
        Parcela_FIM := 0;

        For Ind := 1 To SGD_Vencimentos.RowCount Do
            Begin

            If Trim(SGD_Vencimentos.Cells[1,Ind]) <> '' Then
               Begin
               Parcela_FIM := Parcela_FIM + 1;
            End;
        End;

        For Ind := 1 To SGD_Vencimentos.RowCount Do
            Begin

            If Trim(SGD_Vencimentos.Cells[1,Ind]) <> '' Then
               Begin
               Parcela_INI := Parcela_INI + 1;

               Comando_SQL := 'Insert into fb_notas_entradas_venctos(';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_vencto_numero, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_vencto_posicao, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_vencto_duplicata, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_vencto_data, ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_vencto_valor) ';
               Comando_SQL := Comando_SQL + ' Values(';
               Comando_SQL := Comando_SQL + Trim(Posicao_Nota_Nova) + ',';
               Comando_SQL := Comando_SQL + Trim(IntToStr(Ind)) + ',';
               Comando_SQL := Comando_SQL + #39 + Trim(SGD_Vencimentos.Cells[0,Ind]) + #39 + ',';

               If Trim(SGD_Vencimentos.Cells[1,Ind]) = '/  /' Then
                  Begin
                  Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
                  End
               Else
                  Begin
                  Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(SGD_Vencimentos.Cells[1,Ind]),'amd','/') + #39 + ',';
               End;

               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Vencimentos.Cells[2,Ind])) + ')';

               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Comunitario.ExecSQL;

               //*** Insere as Informações no Contas a Pagar ***

               Busca_Duplicata := Trim(Nota_Descricao_Contas_Pagar.Text) + ' - Duplicata: ' + Trim(SGD_Vencimentos.Cells[0,Ind]) + ' - NF: ' + Trim(Nota_Numero.Text) + ' - Parcela ' + IntToStr(Parcela_INI) + ' de ' + IntToStr(Parcela_FIM) + ' - (Fornecedor: ' + Trim(Fornecedor_Nome.Text) + ')';

               ConexaoBD.SQL_FB_Conta_Pagar.Close;
               ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
               ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where fb_conta_pagar_descricao = ' + #39 + Trim(Busca_Duplicata) + #39 );
               ConexaoBD.SQL_FB_Conta_Pagar.Open;

               If ConexaoBD.SQL_FB_Conta_Pagar.RecordCount <= 0 Then
                  Begin

                  ConexaoBD.SQL_FB_Conta_Bancaria.Close;
                  ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Clear;
                  ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Add('Select * from fb_contas_bancarias Order By fb_conta_bancaria_banco, fb_conta_bancaria_nro');
                  ConexaoBD.SQL_FB_Conta_Bancaria.Open;

                  If ConexaoBD.SQL_FB_Conta_Bancaria.RecordCount > 0 Then
                     Begin
                     ConexaoBD.SQL_FB_Conta_Bancaria.First;
                     Nro_Conta := Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text);
                     End
                  Else
                     Begin
                     Nro_Conta := '0';
                  End;

                  ConexaoBD.SQL_FB_Conta_Bancaria.Close;

                  Comando_SQL := 'Insert into fb_contas_pagar(';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_data, ';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_descricao, ';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_valor, ';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_conta, ';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_status, ';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_posicao, ';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_fixo, ';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_valor_ser_pago, ';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_valor_juros, ';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_valor_desconto, ';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_observacao, ';
                  Comando_SQL := Comando_SQL + 'fb_conta_pagar_data_emissao) ';
                  Comando_SQL := Comando_SQL + 'Values(';

                  If Trim(SGD_Vencimentos.Cells[1,Ind]) = '/  /' Then
                     Begin
                     Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
                     End
                  Else
                     Begin
                     Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(SGD_Vencimentos.Cells[1,Ind]),'amd','/') + #39 + ',';
                  End;

                  Comando_SQL := Comando_SQL + #39 + Trim(Nota_Descricao_Contas_Pagar.Text) + ' - Duplicata: ' + Trim(SGD_Vencimentos.Cells[0,Ind]) + ' - NF: ' + Trim(Nota_Numero.Text) + ' - Parcela ' + IntToStr(Parcela_INI) + ' de ' + IntToStr(Parcela_FIM) + ' - (Fornecedor: ' + Trim(Fornecedor_Nome.Text) + ')' + #39 + ', ';
                  Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Vencimentos.Cells[2,Ind])) + ', ';
                  Comando_SQL := Comando_SQL + Trim(Nro_Conta) + ',';
                  Comando_SQL := Comando_SQL + #39 + 'Em Aberto' + #39 + ', ';
                  Comando_SQL := Comando_SQL + '2' + ',';
                  Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ', ';
                  Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Vencimentos.Cells[2,Ind])) + ', ';
                  Comando_SQL := Comando_SQL + '0.00' + ', ';
                  Comando_SQL := Comando_SQL + '0.00' + ', ';
                  Comando_SQL := Comando_SQL + #39 + ' ' + #39 + ',';

                  If Trim(Nota_Emissao.Text) = '/  /' Then
                     Begin
                     Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ')';
                     End
                  Else
                     Begin
                     Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Nota_Emissao.Text),'amd','/') + #39 + ')';
                  End;

                  ConexaoBD.SQL_Comunitario.SQL.Clear;
                  ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_Comunitario.ExecSQL;
               End;
            End;
        End;

        //*** Conclusão da Inclusão *** }

        Seta();
        MSG_Erro('Nota de Entrada Alterada.');

        //*** Recarrega Informações ***

        ConexaoBD.SQL_FB_Notas_Entradas.Close;
        ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
        ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * from fb_notas_entradas Order By fb_nota_entrada_data_emissao Desc');
        ConexaoBD.SQL_FB_Notas_Entradas.Open;

        NotasFiscaisEntradas02.Close;
     End;
end;

procedure TNotasFiscaisEntradas02.Nota_CFOP_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
