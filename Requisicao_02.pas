unit Requisicao_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TRequisicao02 = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid_Grupos: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    DBG_Fornecedor_Observacao: TDBMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Lista_Fornecedores: TComboBox;
    BT_Atualizar: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    BT_Tabular: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBGrid_GruposDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Lista_FornecedoresKeyPress(Sender: TObject; var Key: Char);
    procedure Lista_FornecedoresChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_AtualizarClick(Sender: TObject);
    procedure DBGrid_GruposDblClick(Sender: TObject);
    procedure DBGrid_GruposKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BT_TabularClick(Sender: TObject);
  private
    { Private declarations }
    procedure Carrega_Fornecedores();
    procedure Obtem_Fornecedor();
    procedure Criar_PDF(Opcao, Posicao_Ini, Posicao_Fim, Pagina_Ini, Pagina_Fim: String);

  public
    { Public declarations }
  end;

var
  Requisicao02: TRequisicao02;
  Selecionado: string;

implementation

uses Conexao_BD, Rotinas_Gerais, Requisicao_03, Requisicao_04, Cotacao_04,
  Ordem_02, Ibrasmak_00, Tabulacao_PDF;

{$R *.dfm}

procedure TRequisicao02.Criar_PDF(Opcao, Posicao_Ini, Posicao_Fim, Pagina_Ini, Pagina_Fim: String);

var
   Ind, Posicao, Item: Integer;
   Cond_Pgto: string;

begin
     Ampulheta();

     Application.CreateForm(TTabulacaoPDF,TabulacaoPDF);

     TabulacaoPDF.Requisicao.Caption  := Requisicao02.DBGrid_Grupos.Fields[0].Text;
     TabulacaoPDF.Equipamento.Caption := Requisicao02.DBGrid_Grupos.Fields[9].Text;
     TabulacaoPDF.OS.Caption          := Requisicao02.DBGrid_Grupos.Fields[10].Text;
     TabulacaoPDF.Secao.Caption       := Requisicao02.DBGrid_Grupos.Fields[8].Text;

     TabulacaoPDF.Data.Caption        := 'Ribeirão Pires, ' + Data_Extenso();

     //*** Zera os Campos da Requisição ***

     TabulacaoPDF.Fornecedor_1.Caption := '';
     TabulacaoPDF.Fornecedor_2.Caption := '';
     TabulacaoPDF.Fornecedor_3.Caption := '';
     TabulacaoPDF.Fornecedor_4.Caption := '';
     TabulacaoPDF.Fornecedor_5.Caption := '';
     TabulacaoPDF.Fornecedor_6.Caption := '';
     TabulacaoPDF.Fornecedor_7.Caption := '';

     TabulacaoPDF.Contato_1.Caption := '';
     TabulacaoPDF.Contato_2.Caption := '';
     TabulacaoPDF.Contato_3.Caption := '';
     TabulacaoPDF.Contato_4.Caption := '';
     TabulacaoPDF.Contato_5.Caption := '';
     TabulacaoPDF.Contato_6.Caption := '';
     TabulacaoPDF.Contato_7.Caption := '';

     TabulacaoPDF.Fone_1.Caption := '';
     TabulacaoPDF.Fone_2.Caption := '';
     TabulacaoPDF.Fone_3.Caption := '';
     TabulacaoPDF.Fone_4.Caption := '';
     TabulacaoPDF.Fone_5.Caption := '';
     TabulacaoPDF.Fone_6.Caption := '';
     TabulacaoPDF.Fone_7.Caption := '';

     TabulacaoPDF.Observacao_1.Caption := '';

     TabulacaoPDF.Pgto_1.Caption := '';
     TabulacaoPDF.Pgto_2.Caption := '';
     TabulacaoPDF.Pgto_3.Caption := '';
     TabulacaoPDF.Pgto_4.Caption := '';
     TabulacaoPDF.Pgto_5.Caption := '';
     TabulacaoPDF.Pgto_6.Caption := '';
     TabulacaoPDF.Pgto_7.Caption := '';

     TabulacaoPDF.Entrega_1.Text := '';
     TabulacaoPDF.Entrega_2.Text := '';
     TabulacaoPDF.Entrega_3.Text := '';
     TabulacaoPDF.Entrega_4.Text := '';
     TabulacaoPDF.Entrega_5.Text := '';
     TabulacaoPDF.Entrega_6.Text := '';
     TabulacaoPDF.Entrega_7.Text := '';

     TabulacaoPDF.Item_1.Caption := '';
     TabulacaoPDF.Item_2.Caption := '';
     TabulacaoPDF.Item_3.Caption := '';
     TabulacaoPDF.Item_4.Caption := '';
     TabulacaoPDF.Item_5.Caption := '';
     TabulacaoPDF.Item_6.Caption := '';
     TabulacaoPDF.Item_7.Caption := '';
     TabulacaoPDF.Item_8.Caption := '';
     TabulacaoPDF.Item_9.Caption := '';
     TabulacaoPDF.Item_10.Caption := '';
     TabulacaoPDF.Item_11.Caption := '';
     TabulacaoPDF.Item_12.Caption := '';
     TabulacaoPDF.Item_13.Caption := '';
     TabulacaoPDF.Item_14.Caption := '';
     TabulacaoPDF.Item_15.Caption := '';
     TabulacaoPDF.Item_16.Caption := '';
     TabulacaoPDF.Item_17.Caption := '';
     TabulacaoPDF.Item_18.Caption := '';
     TabulacaoPDF.Item_19.Caption := '';
     TabulacaoPDF.Item_20.Caption := '';
     TabulacaoPDF.Item_21.Caption := '';
     TabulacaoPDF.Item_22.Caption := '';
     TabulacaoPDF.Item_23.Caption := '';

     TabulacaoPDF.Fornecedor_Item_1_1.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_2.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_3.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_4.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_5.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_6.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_7.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_8.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_9.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_10.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_11.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_12.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_13.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_14.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_15.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_16.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_17.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_18.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_19.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_20.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_21.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_22.Caption := '';
     TabulacaoPDF.Fornecedor_Item_1_23.Caption := '';

     TabulacaoPDF.Fornecedor_Item_2_1.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_2.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_3.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_4.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_5.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_6.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_7.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_8.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_9.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_10.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_11.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_12.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_13.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_14.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_15.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_16.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_17.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_18.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_19.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_20.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_21.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_22.Caption := '';
     TabulacaoPDF.Fornecedor_Item_2_23.Caption := '';

     TabulacaoPDF.Fornecedor_Item_3_1.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_2.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_3.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_4.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_5.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_6.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_7.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_8.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_9.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_10.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_11.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_12.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_13.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_14.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_15.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_16.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_17.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_18.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_19.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_20.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_21.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_22.Caption := '';
     TabulacaoPDF.Fornecedor_Item_3_23.Caption := '';

     TabulacaoPDF.Fornecedor_Item_4_1.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_2.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_3.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_4.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_5.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_6.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_7.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_8.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_9.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_10.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_11.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_12.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_13.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_14.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_15.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_16.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_17.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_18.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_19.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_20.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_21.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_22.Caption := '';
     TabulacaoPDF.Fornecedor_Item_4_23.Caption := '';

     TabulacaoPDF.Fornecedor_Item_5_1.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_2.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_3.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_4.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_5.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_6.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_7.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_8.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_9.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_10.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_11.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_12.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_13.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_14.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_15.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_16.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_17.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_18.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_19.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_20.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_21.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_22.Caption := '';
     TabulacaoPDF.Fornecedor_Item_5_23.Caption := '';

     TabulacaoPDF.Fornecedor_Item_6_1.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_2.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_3.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_4.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_5.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_6.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_7.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_8.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_9.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_10.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_11.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_12.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_13.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_14.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_15.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_16.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_17.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_18.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_19.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_20.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_21.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_22.Caption := '';
     TabulacaoPDF.Fornecedor_Item_6_23.Caption := '';

     TabulacaoPDF.Fornecedor_Item_7_1.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_2.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_3.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_4.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_5.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_6.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_7.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_8.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_9.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_10.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_11.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_12.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_13.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_14.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_15.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_16.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_17.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_18.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_19.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_20.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_21.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_22.Caption := '';
     TabulacaoPDF.Fornecedor_Item_7_23.Caption := '';

     //*** Carrega os Valores dos Campos ***

     TabulacaoPDF.Observacao_1.Caption := Requisicao02.DBGrid_Grupos.Fields[12].Text;

     If Trim(Requisicao02.DBGrid_Grupos.Fields[1].Text) = 'MONIBRAS' Then
        Begin
        TabulacaoPDF.Empresa_01.Caption   := 'MONIBRAS';
        TabulacaoPDF.Empresa_02.Caption   := '';
        End
     Else If Trim(Requisicao02.DBGrid_Grupos.Fields[1].Text) = 'IBRASMAK' Then
        Begin
        TabulacaoPDF.Empresa_01.Caption   := 'IBRASMAK';
        TabulacaoPDF.Empresa_02.Caption   := '';
        End
     Else If Trim(Requisicao02.DBGrid_Grupos.Fields[1].Text) = 'FERRAMENTARIA' Then
        Begin
        TabulacaoPDF.Empresa_01.Caption   := 'IBRASMAK';
        TabulacaoPDF.Empresa_02.Caption   := '(FERRAMENTARIA)';
     End;

     //*** Verifica as Cotações em Anexo ***

     ConexaoBD.SQL_Cotacao.First;

     If ConexaoBD.SQL_Cotacao.RecordCount > 0 Then
        Begin

        Posicao := 0;

        While Not ConexaoBD.SQL_Cotacao.Eof Do
              Begin

              Posicao := Posicao + 1;

              ConexaoBD.SQL_Cotacao_Produto.Close;
              ConexaoBD.SQL_Cotacao_Produto.SQL.Clear;
              ConexaoBD.SQL_Cotacao_Produto.SQL.Add('Select * from fb_cotacoes_produtos Where fb_cotacao_produto_cotacao = ' + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_nro.Text) + ' Order By fb_cotacao_produto_codigo');
              ConexaoBD.SQL_Cotacao_Produto.Open;

              If ConexaoBD.SQL_Cotacao_Produto.RecordCount > 0 Then
                 Begin

                 Item := 0;

                 While Not ConexaoBD.SQL_Cotacao_Produto.Eof Do
                       Begin

                       Item := Item + 1;

                       //**************************
                       //*** INICIO - Posição 1 ***
                       //**************************

                       If Posicao = 1 Then
                          Begin

                          TabulacaoPDF.Fornecedor_1.Caption := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor_descricao.Text,0,15);
                          TabulacaoPDF.Contato_1.Caption    := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_vendedor.Text,0,15);

                          Cond_Pgto := '';

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) + ' ';
                          End;

                          If Trim(Cond_Pgto) <> '' Then
                             Begin
                             Cond_Pgto := Cond_Pgto + 'DD';
                          End;

                          TabulacaoPDF.Pgto_1.Caption := Trim(Cond_Pgto);
                          TabulacaoPDF.Entrega_1.Text := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_prazo_entrega.Text,0,72);

                          conexaoBD.SQL_Fornecedores.Close;
                          conexaoBD.SQL_Fornecedores.SQL.Clear;
                          conexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = '+ ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor.Text );
                          conexaoBD.SQL_Fornecedores.Open;

                          TabulacaoPDF.Fone_1.Caption       := Copy(ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text,0,15);

                          If Item = 1 Then
                             Begin
                             TabulacaoPDF.Item_1.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 2 Then
                             Begin
                             TabulacaoPDF.Item_2.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 3 Then
                             Begin
                             TabulacaoPDF.Item_3.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 4 Then
                             Begin
                             TabulacaoPDF.Item_4.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 5 Then
                             Begin
                             TabulacaoPDF.Item_5.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 6 Then
                             Begin
                             TabulacaoPDF.Item_6.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 7 Then
                             Begin
                             TabulacaoPDF.Item_7.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 8 Then
                             Begin
                             TabulacaoPDF.Item_8.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 9 Then
                             Begin
                             TabulacaoPDF.Item_9.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 10 Then
                             Begin
                             TabulacaoPDF.Item_10.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 11 Then
                             Begin
                             TabulacaoPDF.Item_11.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 12 Then
                             Begin
                             TabulacaoPDF.Item_12.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 13 Then
                             Begin
                             TabulacaoPDF.Item_13.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 14 Then
                             Begin
                             TabulacaoPDF.Item_14.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 15 Then
                             Begin
                             TabulacaoPDF.Item_15.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 16 Then
                             Begin
                             TabulacaoPDF.Item_16.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 17 Then
                             Begin
                             TabulacaoPDF.Item_17.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 18 Then
                             Begin
                             TabulacaoPDF.Item_18.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 19 Then
                             Begin
                             TabulacaoPDF.Item_19.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 20 Then
                             Begin
                             TabulacaoPDF.Item_20.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 21 Then
                             Begin
                             TabulacaoPDF.Item_21.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 22 Then
                             Begin
                             TabulacaoPDF.Item_22.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 23 Then
                             Begin
                             TabulacaoPDF.Item_23.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_1_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                          End;
                       End;

                       //*************************
                       //*** FINAL - Posição 1 ***
                       //*************************

                       //**************************
                       //*** INICIO - Posição 2 ***
                       //**************************

                       If Posicao = 2 Then
                          Begin

                          TabulacaoPDF.Fornecedor_2.Caption := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor_descricao.Text,0,15);
                          TabulacaoPDF.Contato_2.Caption    := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_vendedor.Text,0,15);

                          Cond_Pgto := '';

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) + ' ';
                          End;

                          If Trim(Cond_Pgto) <> '' Then
                             Begin
                             Cond_Pgto := Cond_Pgto + 'DD';
                          End;

                          TabulacaoPDF.Pgto_2.Caption := Trim(Cond_Pgto);
                          TabulacaoPDF.Entrega_2.Text := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_prazo_entrega.Text,0,72);

                          conexaoBD.SQL_Fornecedores.Close;
                          conexaoBD.SQL_Fornecedores.SQL.Clear;
                          conexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = '+ ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor.Text );
                          conexaoBD.SQL_Fornecedores.Open;

                          TabulacaoPDF.Fone_2.Caption       := Copy(ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text,0,15);

                          If Item = 1 Then
                             Begin
                             TabulacaoPDF.Item_1.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 2 Then
                             Begin
                             TabulacaoPDF.Item_2.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 3 Then
                             Begin
                             TabulacaoPDF.Item_3.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 4 Then
                             Begin
                             TabulacaoPDF.Item_4.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 5 Then
                             Begin
                             TabulacaoPDF.Item_5.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 6 Then
                             Begin
                             TabulacaoPDF.Item_6.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 7 Then
                             Begin
                             TabulacaoPDF.Item_7.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 8 Then
                             Begin
                             TabulacaoPDF.Item_8.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 9 Then
                             Begin
                             TabulacaoPDF.Item_9.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 10 Then
                             Begin
                             TabulacaoPDF.Item_10.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 11 Then
                             Begin
                             TabulacaoPDF.Item_11.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 12 Then
                             Begin
                             TabulacaoPDF.Item_12.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 13 Then
                             Begin
                             TabulacaoPDF.Item_13.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 14 Then
                             Begin
                             TabulacaoPDF.Item_14.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 15 Then
                             Begin
                             TabulacaoPDF.Item_15.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 16 Then
                             Begin
                             TabulacaoPDF.Item_16.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 17 Then
                             Begin
                             TabulacaoPDF.Item_17.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 18 Then
                             Begin
                             TabulacaoPDF.Item_18.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 19 Then
                             Begin
                             TabulacaoPDF.Item_19.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 20 Then
                             Begin
                             TabulacaoPDF.Item_20.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 21 Then
                             Begin
                             TabulacaoPDF.Item_21.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 22 Then
                             Begin
                             TabulacaoPDF.Item_22.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 23 Then
                             Begin
                             TabulacaoPDF.Item_23.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_2_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                          End;
                       End;

                       //*************************
                       //*** FINAL - Posição 2 ***
                       //*************************

                       //**************************
                       //*** INICIO - Posição 3 ***
                       //**************************

                       If Posicao = 3 Then
                          Begin

                          TabulacaoPDF.Fornecedor_3.Caption := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor_descricao.Text,0,15);
                          TabulacaoPDF.Contato_3.Caption    := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_vendedor.Text,0,15);

                          Cond_Pgto := '';

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) + ' ';
                          End;

                          If Trim(Cond_Pgto) <> '' Then
                             Begin
                             Cond_Pgto := Cond_Pgto + 'DD';
                          End;

                          TabulacaoPDF.Pgto_3.Caption := Trim(Cond_Pgto);
                          TabulacaoPDF.Entrega_3.Text := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_prazo_entrega.Text,0,72);

                          conexaoBD.SQL_Fornecedores.Close;
                          conexaoBD.SQL_Fornecedores.SQL.Clear;
                          conexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = '+ ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor.Text );
                          conexaoBD.SQL_Fornecedores.Open;

                          TabulacaoPDF.Fone_3.Caption       := Copy(ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text,0,15);

                          If Item = 1 Then
                             Begin
                             TabulacaoPDF.Item_1.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 2 Then
                             Begin
                             TabulacaoPDF.Item_2.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 3 Then
                             Begin
                             TabulacaoPDF.Item_3.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 4 Then
                             Begin
                             TabulacaoPDF.Item_4.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 5 Then
                             Begin
                             TabulacaoPDF.Item_5.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 6 Then
                             Begin
                             TabulacaoPDF.Item_6.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 7 Then
                             Begin
                             TabulacaoPDF.Item_7.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 8 Then
                             Begin
                             TabulacaoPDF.Item_8.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 9 Then
                             Begin
                             TabulacaoPDF.Item_9.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 10 Then
                             Begin
                             TabulacaoPDF.Item_10.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 11 Then
                             Begin
                             TabulacaoPDF.Item_11.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 12 Then
                             Begin
                             TabulacaoPDF.Item_12.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 13 Then
                             Begin
                             TabulacaoPDF.Item_13.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 14 Then
                             Begin
                             TabulacaoPDF.Item_14.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 15 Then
                             Begin
                             TabulacaoPDF.Item_15.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 16 Then
                             Begin
                             TabulacaoPDF.Item_16.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 17 Then
                             Begin
                             TabulacaoPDF.Item_17.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 18 Then
                             Begin
                             TabulacaoPDF.Item_18.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 19 Then
                             Begin
                             TabulacaoPDF.Item_19.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 20 Then
                             Begin
                             TabulacaoPDF.Item_20.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 21 Then
                             Begin
                             TabulacaoPDF.Item_21.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 22 Then
                             Begin
                             TabulacaoPDF.Item_22.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 23 Then
                             Begin
                             TabulacaoPDF.Item_23.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_3_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                          End;
                       End;

                       //*************************
                       //*** FINAL - Posição 3 ***
                       //*************************

                       //**************************
                       //*** INICIO - Posição 4 ***
                       //**************************

                       If Posicao = 4 Then
                          Begin

                          TabulacaoPDF.Fornecedor_4.Caption := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor_descricao.Text,0,15);
                          TabulacaoPDF.Contato_4.Caption    := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_vendedor.Text,0,15);

                          Cond_Pgto := '';

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) + ' ';
                          End;

                          If Trim(Cond_Pgto) <> '' Then
                             Begin
                             Cond_Pgto := Cond_Pgto + 'DD';
                          End;

                          TabulacaoPDF.Pgto_4.Caption := Trim(Cond_Pgto);
                          TabulacaoPDF.Entrega_4.Text := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_prazo_entrega.Text,0,72);

                          conexaoBD.SQL_Fornecedores.Close;
                          conexaoBD.SQL_Fornecedores.SQL.Clear;
                          conexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = '+ ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor.Text );
                          conexaoBD.SQL_Fornecedores.Open;

                          TabulacaoPDF.Fone_4.Caption       := Copy(ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text,0,15);

                          If Item = 1 Then
                             Begin
                             TabulacaoPDF.Item_1.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 2 Then
                             Begin
                             TabulacaoPDF.Item_2.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 3 Then
                             Begin
                             TabulacaoPDF.Item_3.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 4 Then
                             Begin
                             TabulacaoPDF.Item_4.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 5 Then
                             Begin
                             TabulacaoPDF.Item_5.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 6 Then
                             Begin
                             TabulacaoPDF.Item_6.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 7 Then
                             Begin
                             TabulacaoPDF.Item_7.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 8 Then
                             Begin
                             TabulacaoPDF.Item_8.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 9 Then
                             Begin
                             TabulacaoPDF.Item_9.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 10 Then
                             Begin
                             TabulacaoPDF.Item_10.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 11 Then
                             Begin
                             TabulacaoPDF.Item_11.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 12 Then
                             Begin
                             TabulacaoPDF.Item_12.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 13 Then
                             Begin
                             TabulacaoPDF.Item_13.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 14 Then
                             Begin
                             TabulacaoPDF.Item_14.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 15 Then
                             Begin
                             TabulacaoPDF.Item_15.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 16 Then
                             Begin
                             TabulacaoPDF.Item_16.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 17 Then
                             Begin
                             TabulacaoPDF.Item_17.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 18 Then
                             Begin
                             TabulacaoPDF.Item_18.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 19 Then
                             Begin
                             TabulacaoPDF.Item_19.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 20 Then
                             Begin
                             TabulacaoPDF.Item_20.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 21 Then
                             Begin
                             TabulacaoPDF.Item_21.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 22 Then
                             Begin
                             TabulacaoPDF.Item_22.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 23 Then
                             Begin
                             TabulacaoPDF.Item_23.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_4_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                          End;
                       End;

                       //*************************
                       //*** FINAL - Posição 4 ***
                       //*************************

                       //**************************
                       //*** INICIO - Posição 5 ***
                       //**************************

                       If Posicao = 5 Then
                          Begin

                          TabulacaoPDF.Fornecedor_5.Caption := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor_descricao.Text,0,15);
                          TabulacaoPDF.Contato_5.Caption    := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_vendedor.Text,0,15);

                          Cond_Pgto := '';

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) + ' ';
                          End;

                          If Trim(Cond_Pgto) <> '' Then
                             Begin
                             Cond_Pgto := Cond_Pgto + 'DD';
                          End;

                          TabulacaoPDF.Pgto_5.Caption := Trim(Cond_Pgto);
                          TabulacaoPDF.Entrega_5.Text := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_prazo_entrega.Text,0,72);

                          conexaoBD.SQL_Fornecedores.Close;
                          conexaoBD.SQL_Fornecedores.SQL.Clear;
                          conexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = '+ ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor.Text );
                          conexaoBD.SQL_Fornecedores.Open;

                          TabulacaoPDF.Fone_5.Caption       := Copy(ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text,0,15);

                          If Item = 1 Then
                             Begin
                             TabulacaoPDF.Item_1.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 2 Then
                             Begin
                             TabulacaoPDF.Item_2.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 3 Then
                             Begin
                             TabulacaoPDF.Item_3.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 4 Then
                             Begin
                             TabulacaoPDF.Item_4.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 5 Then
                             Begin
                             TabulacaoPDF.Item_5.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 6 Then
                             Begin
                             TabulacaoPDF.Item_6.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 7 Then
                             Begin
                             TabulacaoPDF.Item_7.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 8 Then
                             Begin
                             TabulacaoPDF.Item_8.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 9 Then
                             Begin
                             TabulacaoPDF.Item_9.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 10 Then
                             Begin
                             TabulacaoPDF.Item_10.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 11 Then
                             Begin
                             TabulacaoPDF.Item_11.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 12 Then
                             Begin
                             TabulacaoPDF.Item_12.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 13 Then
                             Begin
                             TabulacaoPDF.Item_13.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 14 Then
                             Begin
                             TabulacaoPDF.Item_14.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 15 Then
                             Begin
                             TabulacaoPDF.Item_15.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 16 Then
                             Begin
                             TabulacaoPDF.Item_16.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 17 Then
                             Begin
                             TabulacaoPDF.Item_17.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 18 Then
                             Begin
                             TabulacaoPDF.Item_18.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 19 Then
                             Begin
                             TabulacaoPDF.Item_19.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 20 Then
                             Begin
                             TabulacaoPDF.Item_20.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 21 Then
                             Begin
                             TabulacaoPDF.Item_21.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 22 Then
                             Begin
                             TabulacaoPDF.Item_22.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 23 Then
                             Begin
                             TabulacaoPDF.Item_23.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_5_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                          End;
                       End;

                       //*************************
                       //*** FINAL - Posição 5 ***
                       //*************************

                       //**************************
                       //*** INICIO - Posição 6 ***
                       //**************************

                       If Posicao = 6 Then
                          Begin

                          TabulacaoPDF.Fornecedor_6.Caption := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor_descricao.Text,0,15);
                          TabulacaoPDF.Contato_6.Caption    := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_vendedor.Text,0,15);

                          Cond_Pgto := '';

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) + ' ';
                          End;

                          If Trim(Cond_Pgto) <> '' Then
                             Begin
                             Cond_Pgto := Cond_Pgto + 'DD';
                          End;

                          TabulacaoPDF.Pgto_6.Caption := Trim(Cond_Pgto);
                          TabulacaoPDF.Entrega_6.Text := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_prazo_entrega.Text,0,72);

                          conexaoBD.SQL_Fornecedores.Close;
                          conexaoBD.SQL_Fornecedores.SQL.Clear;
                          conexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = '+ ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor.Text );
                          conexaoBD.SQL_Fornecedores.Open;

                          TabulacaoPDF.Fone_6.Caption       := Copy(ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text,0,15);

                          If Item = 1 Then
                             Begin
                             TabulacaoPDF.Item_1.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 2 Then
                             Begin
                             TabulacaoPDF.Item_2.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 3 Then
                             Begin
                             TabulacaoPDF.Item_3.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 4 Then
                             Begin
                             TabulacaoPDF.Item_4.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 5 Then
                             Begin
                             TabulacaoPDF.Item_5.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 6 Then
                             Begin
                             TabulacaoPDF.Item_6.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 7 Then
                             Begin
                             TabulacaoPDF.Item_7.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 8 Then
                             Begin
                             TabulacaoPDF.Item_8.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 9 Then
                             Begin
                             TabulacaoPDF.Item_9.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 10 Then
                             Begin
                             TabulacaoPDF.Item_10.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 11 Then
                             Begin
                             TabulacaoPDF.Item_11.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 12 Then
                             Begin
                             TabulacaoPDF.Item_12.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 13 Then
                             Begin
                             TabulacaoPDF.Item_13.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 14 Then
                             Begin
                             TabulacaoPDF.Item_14.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 15 Then
                             Begin
                             TabulacaoPDF.Item_15.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 16 Then
                             Begin
                             TabulacaoPDF.Item_16.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 17 Then
                             Begin
                             TabulacaoPDF.Item_17.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 18 Then
                             Begin
                             TabulacaoPDF.Item_18.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 19 Then
                             Begin
                             TabulacaoPDF.Item_19.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 20 Then
                             Begin
                             TabulacaoPDF.Item_20.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 21 Then
                             Begin
                             TabulacaoPDF.Item_21.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 22 Then
                             Begin
                             TabulacaoPDF.Item_22.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 23 Then
                             Begin
                             TabulacaoPDF.Item_23.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_6_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                          End;
                       End;

                       //*************************
                       //*** FINAL - Posição 6 ***
                       //*************************

                       //**************************
                       //*** INICIO - Posição 7 ***
                       //**************************

                       If Posicao = 7 Then
                          Begin

                          TabulacaoPDF.Fornecedor_7.Caption := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor_descricao.Text,0,15);
                          TabulacaoPDF.Contato_7.Caption    := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_vendedor.Text,0,15);

                          Cond_Pgto := '';

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_2.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_3.Text) + ' ';
                          End;

                          If ((Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '0') And (Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) <> '')) Then
                             Begin
                             Cond_Pgto := Cond_Pgto + Trim(ConexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_4.Text) + ' ';
                          End;

                          If Trim(Cond_Pgto) <> '' Then
                             Begin
                             Cond_Pgto := Cond_Pgto + 'DD';
                          End;

                          TabulacaoPDF.Pgto_7.Caption := Trim(Cond_Pgto);
                          TabulacaoPDF.Entrega_7.Text := Copy(ConexaoBD.SQL_Cotacaofb_cotacao_prazo_entrega.Text,0,72);

                          conexaoBD.SQL_Fornecedores.Close;
                          conexaoBD.SQL_Fornecedores.SQL.Clear;
                          conexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = '+ ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor.Text );
                          conexaoBD.SQL_Fornecedores.Open;

                          TabulacaoPDF.Fone_7.Caption       := Copy(ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text,0,15);

                          If Item = 1 Then
                             Begin
                             TabulacaoPDF.Item_1.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_1.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 2 Then
                             Begin
                             TabulacaoPDF.Item_2.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_2.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 3 Then
                             Begin
                             TabulacaoPDF.Item_3.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_3.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 4 Then
                             Begin
                             TabulacaoPDF.Item_4.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_4.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 5 Then
                             Begin
                             TabulacaoPDF.Item_5.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_5.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 6 Then
                             Begin
                             TabulacaoPDF.Item_6.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_6.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 7 Then
                             Begin
                             TabulacaoPDF.Item_7.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_7.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 8 Then
                             Begin
                             TabulacaoPDF.Item_8.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_8.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 9 Then
                             Begin
                             TabulacaoPDF.Item_9.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_9.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 10 Then
                             Begin
                             TabulacaoPDF.Item_10.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_10.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 11 Then
                             Begin
                             TabulacaoPDF.Item_11.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_11.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 12 Then
                             Begin
                             TabulacaoPDF.Item_12.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_12.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 13 Then
                             Begin
                             TabulacaoPDF.Item_13.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_13.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 14 Then
                             Begin
                             TabulacaoPDF.Item_14.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_14.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 15 Then
                             Begin
                             TabulacaoPDF.Item_15.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_15.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 16 Then
                             Begin
                             TabulacaoPDF.Item_16.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_16.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 17 Then
                             Begin
                             TabulacaoPDF.Item_17.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_17.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 18 Then
                             Begin
                             TabulacaoPDF.Item_18.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_18.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 19 Then
                             Begin
                             TabulacaoPDF.Item_19.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_19.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 20 Then
                             Begin
                             TabulacaoPDF.Item_20.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_20.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 21 Then
                             Begin
                             TabulacaoPDF.Item_21.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_21.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 22 Then
                             Begin
                             TabulacaoPDF.Item_22.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_22.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                             End
                          Else If Item = 23 Then
                             Begin
                             TabulacaoPDF.Item_23.Caption := IntToStr(Item);

                             If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text)) > 0 Then
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text) + ' + ' + Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_ipi.Text) + '%';
                                End
                             Else
                                Begin
                                TabulacaoPDF.Fornecedor_Item_7_23.Caption := Zera_Centavos(ConexaoBD.SQL_Cotacao_Produtofb_cotacao_produto_valor_unitario.Text);
                             End;

                          End;
                       End;

                       //*************************
                       //*** FINAL - Posição 7 ***
                       //*************************

                       ConexaoBD.SQL_Cotacao_Produto.Next;
                 End;
              End;

              ConexaoBD.SQL_Cotacao.Next;
        End;

        ConexaoBD.SQL_Cotacao.First;
     End;





  {If Trim(Cotacao_Empresa.Text) = 'IBRASMAK' Then
     Begin
     TabulacaoPDF.Empresa_01.Caption := 'IBRASMAK';
     TabulacaoPDF.Empresa_02.Caption := '';
     End
  Else If Trim(Cotacao_Empresa.Text) = 'MONIBRAS' Then
     Begin
     TabulacaoPDF.Empresa_01.Caption := 'MONIBRAS';
     TabulacaoPDF.Empresa_02.Caption := '';
     End
  Else If Trim(Cotacao_Empresa.Text) = 'FERRAMENTARIA' Then
     Begin
     TabulacaoPDF.Empresa_01.Caption := 'IBRASMAK';
     TabulacaoPDF.Empresa_02.Caption := '(FERRAMENTARIA)';
  End; }










  {
  TabulacaoPDF.PRL_Paginacao.Caption := 'PÁGINA ' + Trim(Pagina_Ini) + ' DE ' + Trim(Pagina_Fim);
  TabulacaoPDF.LBL_Ini.Caption       := Trim(Pagina_Ini);
  TabulacaoPDF.LBL_Fim.Caption       := Trim(Pagina_Fim);

  TabulacaoPDF.Opcao_Anterior.Text := Opcao;
  TabulacaoPDF.Cliente_Email.Text  := Fornecedor_Email.Text;
  TabulacaoPDF.Nro_Cotacao.Text    := Nro_Cotacao.Text;

  TabulacaoPDF.PRL_Cotacao_Nro.Caption  := Trim(Nro_Cotacao.Text);
  TabulacaoPDF.PRL_Data_Cotacao.Caption := Trim(Cotacao_Data.Text);
  TabulacaoPDF.PRL_Nome.Caption         := Copy(Trim(Fornecedor_Nome.Text),1,60);
  TabulacaoPDF.PRL_Contato.Caption      := Trim(Cotacao_Vendedor.Text);

  If Trim(Fornecedor_Fone_Comercial.Text) <> '' Then
     Begin
     TabulacaoPDF.PRL_Fone_1.Caption   := Trim(Fornecedor_Fone_Comercial.Text);
     End
  Else If Trim(Fornecedor_Fone_Celular.Text) <> '' Then
     Begin
     TabulacaoPDF.PRL_Fone_1.Caption   := Trim(Fornecedor_Fone_Celular.Text);
  End;

  TabulacaoPDF.PRL_Fax.Caption         := Trim(Fornecedor_Fone_Fax.Text);

  If Trim(Cotacao_Condicao_Pgto_1.Text) <> '' Then
     Begin
     If StrToInt(Cotacao_Condicao_Pgto_1.Text) > 0 Then
        Cond_Pgto := Trim(Cotacao_Condicao_Pgto_1.Text);
  End;

  If Trim(Cotacao_Condicao_Pgto_2.Text) <> '' Then
     Begin
     If StrToInt(Cotacao_Condicao_Pgto_2.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ', ' + Trim(Cotacao_Condicao_Pgto_2.Text);
  End;

  If Trim(Cotacao_Condicao_Pgto_3.Text) <> '' Then
     Begin
     If StrToInt(Cotacao_Condicao_Pgto_3.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ', ' + Trim(Cotacao_Condicao_Pgto_3.Text);
  End;

  If Trim(Cotacao_Condicao_Pgto_4.Text) <> '' Then
     Begin
     If StrToInt(Cotacao_Condicao_Pgto_4.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ' e ' + Trim(Cotacao_Condicao_Pgto_4.Text);
  End;

  Cond_Pgto := Cond_Pgto + ' DD';

  TabulacaoPDF.PRL_Pagamento.Caption := Trim(Cond_Pgto);
  TabulacaoPDF.PRL_Entrega.Caption   := Trim(Cotacao_Prazo.Text);


  If Trim(Valor_Frete.Text) <> '0,00' Then
     Begin
     TabulacaoPDF.PRL_Frete.Caption    := Trim(Valor_Frete.Text);
     End
  Else
     Begin
     TabulacaoPDF.PRL_Frete.Caption    := '';
  End;

  TabulacaoPDF.PRL_Validade.Caption := '';
  TabulacaoPDF.PRL_OBS1.Caption     := '';
  TabulacaoPDF.PRL_OBS2.Caption     := '';

  //*** Coloca os Itens no PDF ***

  Posicao := StrToInt(Posicao_Fim);

  For Ind := StrToInt(Posicao_Ini) To Posicao Do
      Begin
      If Ind = 1 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_01.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_01.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_01.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_01.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_01.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_01.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_01.Caption := '';
         End;

         End;

         End
      Else If Ind = 2 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_02.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_02.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_02.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_02.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_02.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_02.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_02.Caption := '';
         End;

         End;

         End
      Else If Ind = 3 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_03.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_03.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_03.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_03.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_03.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_03.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_03.Caption := '';
         End;

         End;

         End
      Else If Ind = 4 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_04.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_04.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_04.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_04.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_04.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_04.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_04.Caption := '';
         End;

         End;

         End
      Else If Ind = 5 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_05.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_05.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_05.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_05.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_05.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_05.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_05.Caption := '';
         End;

         End;

         End
      Else If Ind = 6 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_06.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_06.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_06.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_06.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_06.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_06.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_06.Caption := '';
         End;

         End;

         End
      Else If Ind = 7 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_07.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_07.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_07.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_07.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_07.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_07.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_07.Caption := '';
         End;

         End;

         End
      Else If Ind = 8 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_08.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_08.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_08.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_08.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_08.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_08.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_08.Caption := '';
         End;

         End;

         End
      Else If Ind = 9 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_09.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_09.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_09.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_09.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_09.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_09.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_09.Caption := '';
         End;

         End;

         End
      Else If Ind = 10 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_10.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_10.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_10.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_10.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_10.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_10.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_10.Caption := '';
         End;

         End;

         End
      Else If Ind = 11 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_11.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_11.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_11.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_11.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_11.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_11.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_11.Caption := '';
         End;

         End;

         End
      Else If Ind = 12 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_12.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_12.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_12.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_12.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_12.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_12.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_12.Caption := '';
         End;

         End;

         End
      Else If Ind = 13 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_13.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_13.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_13.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_13.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_13.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_13.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_13.Caption := '';
         End;

         End;

         End
      Else If Ind = 14 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_14.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_14.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_14.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_14.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_14.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_14.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_14.Caption := '';
         End;

         End;

         End
      Else If Ind = 15 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_15.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_15.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_15.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_15.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_15.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_15.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_15.Caption := '';
         End;

         End;

         End
      Else If Ind = 16 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_16.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_16.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_16.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_16.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_16.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_16.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_16.Caption := '';
         End;

         End;

         End
      Else If Ind = 17 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_17.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_17.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_17.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_17.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_17.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_17.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_17.Caption := '';
         End;

         End;

         End
      Else If Ind = 18 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_18.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_18.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_18.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_18.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_18.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_18.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_18.Caption := '';
         End;

         End;

         End
      Else If Ind = 19 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_19.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_19.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_19.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_19.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_19.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_19.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_19.Caption := '';
         End;

         End;

         End
      Else If Ind = 20 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_20.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_20.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_20.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_20.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_20.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_20.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_20.Caption := '';
         End;

         End;

         End
      Else If Ind = 21 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_21.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_21.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_21.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_21.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_21.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_21.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_21.Caption := '';
         End;

         End;

         End
      Else If Ind = 22 Then
         Begin

         If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_22.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_22.Caption  := Trim(SGD_Produtos.Cells[0,Ind]) + ' ' + Trim(SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Desc_22.Caption  := Trim(SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(SGD_Produtos.Cells[3,Ind]);

         If StrToFloat(Trim(SGD_Produtos.Cells[5,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Unit_22.Caption  := SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_22.Caption  := '';
         End;

         If StrToFloat(Trim(SGD_Produtos.Cells[6,Ind])) > 0 Then
            Begin
            TabulacaoPDF.PRL_Total_22.Caption := SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_22.Caption := '';
         End;

         End;

      End;
  End;

  //*** Coloca o Valor no PDF ***

  If Trim(Valor_IPI.Text) <> '0,00' Then
     Begin
     TabulacaoPDF.PRL_VlrIPI.Caption := Trim(Valor_IPI.Text);
     End
  Else
     Begin
     TabulacaoPDF.PRL_VlrIPI.Caption := '';
  End;

  If Trim(Valor_Total.Text) <> '0,00' Then
     Begin
     TabulacaoPDF.PRL_VlrTotal.Caption := Trim(Valor_Total.Text);
     End
  Else
     Begin
     TabulacaoPDF.PRL_VlrTotal.Caption := '';
  End;

  TabulacaoPDF.PRL_Funcionario.Caption := Trim(Cotacao_Funcionario.Text);

  //*** Exibe o PDF ***
  }
  Seta();

  TabulacaoPDF.ShowModal;
  TabulacaoPDF.Destroy;
end;

procedure TRequisicao02.BT_SairClick(Sender: TObject);
begin
     Requisicao02.Close;
end;

procedure TRequisicao02.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRequisicao02.FormShow(Sender: TObject);
begin
    If Trim(Dados_Procura.Text) <> '' Then
       Begin
       BT_ProcurarClick(Sender);

       If (Trim(Lista_Fornecedores.Text) <> '--- FORNECEDORES ---') And (Trim(Lista_Fornecedores.Text) <> '') Then
          Begin
          Obtem_Fornecedor();
       End;

       End
    Else
       Begin
       ConexaoBD.SQL_Requisicao.Close;
       ConexaoBD.SQL_Requisicao.SQL.Clear;
       ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Order By fb_requisicao_nro Desc');
       ConexaoBD.SQL_Requisicao.Open;

       If (Trim(Lista_Fornecedores.Text) <> '--- FORNECEDORES ---') And (Trim(Lista_Fornecedores.Text) <> '') Then
          Begin
          Obtem_Fornecedor();
          End
       Else
          Begin
          Carrega_Fornecedores();
       End;
    End;
end;

procedure TRequisicao02.BT_IncluirClick(Sender: TObject);

var
  cotacoes: string;

begin
     If (Requisicao03 = Nil) Then
        Begin
        Application.CreateForm(TRequisicao03,Requisicao03);
     End;
     Requisicao03.ShowModal;

     if (ConexaoBD.SQL_Requisicaofb_requisicao_nro.Text <> '') then begin
         cotacoes := '999999';

         ConexaoBD.SQL_Ordem.Close;
         ConexaoBD.SQL_Ordem.SQL.Clear;
         ConexaoBD.SQL_Ordem.SQL.Add('Select * from fb_ordens Where fb_ordem_cotacao in ('+cotacoes+') Order By fb_ordem_nro Desc');
         ConexaoBD.SQL_Ordem.Open;

         ConexaoBD.SQL_Cotacao.Close;
         ConexaoBD.SQL_Cotacao.SQL.Clear;
         ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Where fb_cotacao_requisicao = '+#39+ConexaoBD.SQL_Requisicaofb_requisicao_nro.Text+#39+' Order By fb_cotacao_nro Desc');
         ConexaoBD.SQL_Cotacao.Open;

         if ConexaoBD.SQL_Cotacao.RecordCount > 0 Then begin

             ConexaoBD.SQL_Cotacao.First;
             while not ConexaoBD.SQL_Cotacao.Eof do begin
                 cotacoes := cotacoes +', '+ ConexaoBD.SQL_Cotacaofb_cotacao_nro.Text;
                 ConexaoBD.SQL_Cotacao.Next;
             end;
             ConexaoBD.SQL_Cotacao.First;

             ConexaoBD.SQL_Ordem.Close;
             ConexaoBD.SQL_Ordem.SQL.Clear;
             ConexaoBD.SQL_Ordem.SQL.Add('Select * from fb_ordens Where fb_ordem_cotacao in ('+cotacoes+') Order By fb_ordem_nro Desc');
             ConexaoBD.SQL_Ordem.Open;

         end;
     end;
end;

procedure TRequisicao02.DBGrid_GruposDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If DBGrid_Grupos.Fields[7].Text = 'Em Aberto' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clRed;
        End
    Else If DBGrid_Grupos.Fields[7].Text = 'Cotada' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clOlive;
        End
    Else If DBGrid_Grupos.Fields[7].Text = 'Conferência' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clGreen;
        End
    Else If DBGrid_Grupos.Fields[7].Text = 'Parte Entregue' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clSkyBlue;
        End
    Else If DBGrid_Grupos.Fields[7].Text = 'Entregue' Then Begin
        DBGrid_Grupos.Canvas.Brush.Color :=  clMoneyGreen;
    End;

    DBGrid_Grupos.DefaultDrawDataCell(Rect, DBGrid_Grupos.columns[datacol].field, State);
end;

procedure TRequisicao02.Carrega_Fornecedores();
begin
     // Obtem os Fornecedores

     ConexaoBD.SQL_Fornecedores.Close;
     ConexaoBD.SQL_Fornecedores.SQL.Clear;
     ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_area ='+#39+'Compras'+#39+' Order By fb_fornecedor_nome');
     ConexaoBD.SQL_Fornecedores.Open;

     Lista_Fornecedores.Items.Clear;
     Lista_Fornecedores.Items.Add('--- FORNECEDORES ---');

     If conexaoBD.SQL_Fornecedores.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Fornecedores.First;

        While Not conexaoBD.SQL_Fornecedores.Eof Do
              begin
              Lista_Fornecedores.Items.Add(Trim(conexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text));
              conexaoBD.SQL_Fornecedores.Next;
        End;
     end;

     ConexaoBD.SQL_Fornecedores.Close;

     Lista_Fornecedores.ItemIndex := 0;
end;

procedure TRequisicao02.Obtem_Fornecedor();
begin
     Ampulheta();

     Dados_Procura.Text := '';

     If (Trim(Lista_Fornecedores.Text) <> '--- FORNECEDORES ---') And (Trim(Lista_Fornecedores.Text) <> '') Then
        Begin
        ConexaoBD.SQL_Requisicao.Close;
        ConexaoBD.SQL_Requisicao.SQL.Clear;
        ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_fornecedor_descricao Like ' +#39+'%'+ Trim(Lista_Fornecedores.Text) +'%'+#39+' Order By fb_requisicao_fornecedor_descricao');
        ConexaoBD.SQL_Requisicao.Open;
        End
     Else
        Begin
        ConexaoBD.SQL_Requisicao.Close;
        ConexaoBD.SQL_Requisicao.SQL.Clear;
        ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Order By fb_requisicao_fornecedor_descricao');
        ConexaoBD.SQL_Requisicao.Open;
     End;

     Seta();
end;

procedure TRequisicao02.BT_ProcurarClick(Sender: TObject);

var
   requisicoes: String;

begin
     Ampulheta();

     Lista_Fornecedores.ItemIndex := 0;

     ConexaoBD.SQL_Requisicao.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Fornecedor' Then
           Begin
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_fornecedor_descricao Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_requisicao_fornecedor_descricao');
           End
        Else If Opcoes_Procura.Text = 'Nro' Then
           Begin
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_nro = ' + Trim(Dados_Procura.Text) + ' Order By fb_requisicao_nro');
           End
        Else If Opcoes_Procura.Text = 'Data' Then
           Begin
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_data = ' +#39+ Inverte_Data_Plus(Trim(Dados_Procura.Text),'amd','-') +#39+' Order By fb_requisicao_data Desc');
           End
        Else If Opcoes_Procura.Text = 'Previsão Entrega' Then
           Begin
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_prazo_entrega Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_requisicao_prazo_entrega Desc');
           End
        Else If Opcoes_Procura.Text = 'Planejamento' Then
           Begin
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_planejamento Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_requisicao_planejamento Desc');
           End
        Else If Opcoes_Procura.Text = 'Empresa' Then
           Begin
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_empresa Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_requisicao_empresa Desc');
           End
        Else If Opcoes_Procura.Text = 'Desenho' Then
           Begin
           //*** Efetua a Busca Diretamente no Produto ***

           requisicoes := '99999999999';

           ConexaoBD.SQL_Requisicao_Produto.Close;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Clear;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Add('Select * from fb_requisicoes_produtos Where fb_requisicao_produto_desenho Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_requisicao_produto_requisicao');
           ConexaoBD.SQL_Requisicao_Produto.Open;

           If Not ConexaoBD.SQL_Requisicao_Produto.Eof Then
              Begin

              ConexaoBD.SQL_Requisicao_Produto.First;

              While Not ConexaoBD.SQL_Requisicao_Produto.Eof Do
                  Begin
                  requisicoes := requisicoes +', '+ ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_requisicao.Text;
                  ConexaoBD.SQL_Requisicao_Produto.Next;
              End;
           End;

           ConexaoBD.SQL_Requisicao.Close;
           ConexaoBD.SQL_Requisicao.SQL.Clear;
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_nro in ('+requisicoes+') Order By fb_requisicao_nro Desc');
           ConexaoBD.SQL_Requisicao.Open;

           End
        Else If Opcoes_Procura.Text = 'OS' Then
           Begin
           //*** Efetua a Busca Diretamente no Produto ***

           requisicoes := '99999999999';

           ConexaoBD.SQL_Requisicao_Produto.Close;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Clear;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Add('Select * from fb_requisicoes_produtos Where fb_requisicao_produto_os Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_requisicao_produto_requisicao');
           ConexaoBD.SQL_Requisicao_Produto.Open;

           If Not ConexaoBD.SQL_Requisicao_Produto.Eof Then
              Begin

              ConexaoBD.SQL_Requisicao_Produto.First;

              While Not ConexaoBD.SQL_Requisicao_Produto.Eof Do
                  Begin
                  requisicoes := requisicoes +', '+ ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_requisicao.Text;
                  ConexaoBD.SQL_Requisicao_Produto.Next;
              End;
           End;

           ConexaoBD.SQL_Requisicao.Close;
           ConexaoBD.SQL_Requisicao.SQL.Clear;
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_nro in ('+requisicoes+') Order By fb_requisicao_nro Desc');
           ConexaoBD.SQL_Requisicao.Open;

           End
        Else If Opcoes_Procura.Text = 'Equipamento' Then
           Begin
           //*** Efetua a Busca Diretamente no Produto ***

           requisicoes := '99999999999';

           ConexaoBD.SQL_Requisicao_Produto.Close;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Clear;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Add('Select * from fb_requisicoes_produtos Where fb_requisicao_produto_equipamento Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_requisicao_produto_requisicao');
           ConexaoBD.SQL_Requisicao_Produto.Open;

           If Not ConexaoBD.SQL_Requisicao_Produto.Eof Then
              Begin

              ConexaoBD.SQL_Requisicao_Produto.First;

              While Not ConexaoBD.SQL_Requisicao_Produto.Eof Do
                  Begin
                  requisicoes := requisicoes +', '+ ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_requisicao.Text;
                  ConexaoBD.SQL_Requisicao_Produto.Next;
              End;
           End;

           ConexaoBD.SQL_Requisicao.Close;
           ConexaoBD.SQL_Requisicao.SQL.Clear;
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_nro in ('+requisicoes+') Order By fb_requisicao_nro Desc');
           ConexaoBD.SQL_Requisicao.Open;

           End
        Else If Opcoes_Procura.Text = 'Material' Then
           Begin
           //*** Efetua a Busca Diretamente no Produto ***

           requisicoes := '99999999999';

           ConexaoBD.SQL_Requisicao_Produto.Close;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Clear;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Add('Select * from fb_requisicoes_produtos Where fb_requisicao_produto_material Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_requisicao_produto_requisicao');
           ConexaoBD.SQL_Requisicao_Produto.Open;

           If Not ConexaoBD.SQL_Requisicao_Produto.Eof Then
              Begin

              ConexaoBD.SQL_Requisicao_Produto.First;

              While Not ConexaoBD.SQL_Requisicao_Produto.Eof Do
                  Begin
                  requisicoes := requisicoes +', '+ ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_requisicao.Text;
                  ConexaoBD.SQL_Requisicao_Produto.Next;
              End;
           End;

           ConexaoBD.SQL_Requisicao.Close;
           ConexaoBD.SQL_Requisicao.SQL.Clear;
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_nro in ('+requisicoes+') Order By fb_requisicao_nro Desc');
           ConexaoBD.SQL_Requisicao.Open;

           End

        Else If Opcoes_Procura.Text = 'Código do Produto' Then
           Begin
           //*** Efetua a Busca Diretamente no Produto ***

           requisicoes := '99999999999';

           ConexaoBD.SQL_Requisicao_Produto.Close;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Clear;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Add('Select * from fb_requisicoes_produtos Where fb_requisicao_produto_codigo = ' +#39+ Trim(Dados_Procura.Text) +#39+' Order By fb_requisicao_produto_requisicao');
           ConexaoBD.SQL_Requisicao_Produto.Open;

           If Not ConexaoBD.SQL_Requisicao_Produto.Eof Then
              Begin

              ConexaoBD.SQL_Requisicao_Produto.First;

              While Not ConexaoBD.SQL_Requisicao_Produto.Eof Do
                  Begin
                  requisicoes := requisicoes +', '+ ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_requisicao.Text;
                  ConexaoBD.SQL_Requisicao_Produto.Next;
              End;
           End;

           ConexaoBD.SQL_Requisicao.Close;
           ConexaoBD.SQL_Requisicao.SQL.Clear;
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_nro in ('+requisicoes+') Order By fb_requisicao_nro Desc');
           ConexaoBD.SQL_Requisicao.Open;

           End

        Else If Opcoes_Procura.Text = 'Descrição do Produto' Then
           Begin
           //*** Efetua a Busca Diretamente no Produto ***

           requisicoes := '99999999999';

           ConexaoBD.SQL_Requisicao_Produto.Close;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Clear;
           ConexaoBD.SQL_Requisicao_Produto.SQL.Add('Select * from fb_requisicoes_produtos Where fb_requisicao_produto_descricao Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_requisicao_produto_requisicao');
           ConexaoBD.SQL_Requisicao_Produto.Open;

           If Not ConexaoBD.SQL_Requisicao_Produto.Eof Then
              Begin

              ConexaoBD.SQL_Requisicao_Produto.First;

              While Not ConexaoBD.SQL_Requisicao_Produto.Eof Do
                  Begin
                  requisicoes := requisicoes +', '+ ConexaoBD.SQL_Requisicao_Produtofb_requisicao_produto_requisicao.Text;
                  ConexaoBD.SQL_Requisicao_Produto.Next;
              End;
           End;

           ConexaoBD.SQL_Requisicao.Close;
           ConexaoBD.SQL_Requisicao.SQL.Clear;
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_nro in ('+requisicoes+') Order By fb_requisicao_nro Desc');
           ConexaoBD.SQL_Requisicao.Open;

        End;

        End
     Else
        Begin

        If Opcoes_Procura.Text = 'Fornecedor' Then
           Begin
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Order By fb_requisicao_fornecedor_descricao');
           End
        Else If Opcoes_Procura.Text = 'Nro' Then
           Begin
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Order By fb_requisicao_nro');
           End
        Else If Opcoes_Procura.Text = 'Data' Then
           Begin
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Order By fb_requisicao_data Desc');
           End
        Else
           Begin
           ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Order By fb_requisicao_nro Desc');
        End;
        
     End;

     ConexaoBD.SQL_Requisicao.Open;

     Seta();
end;

procedure TRequisicao02.Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao02.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao02.Lista_FornecedoresKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRequisicao02.Lista_FornecedoresChange(Sender: TObject);
begin
     Obtem_Fornecedor();
end;

procedure TRequisicao02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Requisicao02 := Nil;
end;

procedure TRequisicao02.BT_AtualizarClick(Sender: TObject);
begin
   ConexaoBD.SQL_Requisicao.Close;
   ConexaoBD.SQL_Requisicao.SQL.Clear;
   ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Order By fb_requisicao_nro Desc');
   ConexaoBD.SQL_Requisicao.Open;
end;

procedure TRequisicao02.DBGrid_GruposDblClick(Sender: TObject);
var
    Nro_Requisicao, Codigo_Fornecedor, Vlr_Exibicao: String;
    Erro: Integer;
    Vlr_Numero: Real;
begin
    If DBGrid_Grupos.Fields[0].Text <> '' Then Begin
      Ampulheta();

      Selecionado := DBGrid_Grupos.Fields[0].Text;

      If (Requisicao04 = Nil) Then Begin

        Application.CreateForm(TRequisicao04,Requisicao04);

        //*** Obtem os Dados da Requisição ***

        Nro_Requisicao := DBGrid_Grupos.Fields[0].Text;

        ConexaoBD.SQL_Requisicao.Close;
        ConexaoBD.SQL_Requisicao.SQL.Clear;
        ConexaoBD.SQL_Requisicao.SQL.Add('Select * from fb_requisicoes Where fb_requisicao_nro = ' + Trim(Nro_Requisicao) );
        ConexaoBD.SQL_Requisicao.Open;

        //*** Obtem os Dados dos Clientes ***

        Codigo_Fornecedor := ConexaoBD.SQL_Requisicaofb_requisicao_fornecedor.Text;

        ConexaoBD.SQL_Fornecedores.Close;
        ConexaoBD.SQL_Fornecedores.SQL.Clear;
        ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + Trim(Codigo_Fornecedor) );
        ConexaoBD.SQL_Fornecedores.Open;

        //*** Carrega os Dados Obtidos ***

        Requisicao04.Nro_Requisicao.Text                 := Nro_Requisicao;

        Requisicao04.Fornecedor_Numero.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

        Requisicao04.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
        Requisicao04.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
        Requisicao04.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
        Requisicao04.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
        Requisicao04.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
        Requisicao04.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
        Requisicao04.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
        Requisicao04.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
        Requisicao04.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
        Requisicao04.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
        Requisicao04.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
        Requisicao04.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

        Requisicao04.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

        Requisicao04.Fornecedor_Observacoes.Lines.Clear;
        Requisicao04.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);

        Requisicao04.Requisicao_Requisitante.Text    := conexaoBD.SQL_Requisicaofb_requisicao_requisitante.Text;
        Requisicao04.Requisicao_Funcionario.Text     := conexaoBD.SQL_Requisicaofb_requisicao_funcionario.Text;
        Requisicao04.Requisicao_Vendedor.Text        := conexaoBD.SQL_Requisicaofb_requisicao_vendedor.Text;
        Requisicao04.Requisicao_Orcamento.Text       := conexaoBD.SQL_Requisicaofb_requisicao_orcamento_nro.Text;

        Requisicao04.Requisicao_Data.Text           := conexaoBD.SQL_Requisicaofb_requisicao_data.Text;

        Requisicao04.Requisicao_Prazo.Text           := conexaoBD.SQL_Requisicaofb_requisicao_prazo_entrega.Text;
        Requisicao04.Requisicao_Condicao_Pgto_1.Text := conexaoBD.SQL_Requisicaofb_requisicao_cond_pgto_1.Text;
        Requisicao04.Requisicao_Condicao_Pgto_2.Text := conexaoBD.SQL_Requisicaofb_requisicao_cond_pgto_2.Text;
        Requisicao04.Requisicao_Condicao_Pgto_3.Text := conexaoBD.SQL_Requisicaofb_requisicao_cond_pgto_3.Text;
        Requisicao04.Requisicao_Condicao_Pgto_4.Text := conexaoBD.SQL_Requisicaofb_requisicao_cond_pgto_4.Text;
        Requisicao04.Requisicao_Obs.Lines.Add(conexaoBD.SQL_Requisicaofb_requisicao_obs.AsString);

        if conexaoBD.SQL_Requisicaofb_requisicao_status.Text = 'Em Aberto' Then begin
            Requisicao04.Requisicao_Status.ItemIndex := 0;
            end
        else if conexaoBD.SQL_Requisicaofb_requisicao_status.Text = 'Cotada' Then begin
            Requisicao04.Requisicao_Status.ItemIndex := 1;
            end
        else if conexaoBD.SQL_Requisicaofb_requisicao_status.Text = 'Conferência' Then begin
            Requisicao04.Requisicao_Status.ItemIndex := 2;
            end
        else if conexaoBD.SQL_Requisicaofb_requisicao_status.Text = 'Parte Entregue' Then begin
            Requisicao04.Requisicao_Status.ItemIndex := 3;
            end
        else if conexaoBD.SQL_Requisicaofb_requisicao_status.Text = 'Entregue' Then begin
            Requisicao04.Requisicao_Status.ItemIndex := 4;
        end;

        If Trim(conexaoBD.SQL_Requisicaofb_requisicao_opcao.Text) = 'MATERIA PRIMA' Then Begin
          Requisicao04.Requisicao_Opcao.ItemIndex := 0;
          End
        Else If Trim(conexaoBD.SQL_Requisicaofb_requisicao_opcao.Text) = 'CONSUMO' Then Begin
          Requisicao04.Requisicao_Opcao.ItemIndex := 1;
          End
        Else Begin
          Requisicao04.Requisicao_Opcao.ItemIndex := 2;
        End;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Requisicaofb_requisicao_desconto.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Requisicao04.Valor_Desconto.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Requisicaofb_requisicao_frete.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Requisicao04.Valor_Frete.Text := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Requisicaofb_requisicao_vlr_total.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Requisicao04.Valor_Total.Text  := Vlr_Exibicao;

        If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_empresa.Text) = 'IBRASMAK' ) Then
          Begin
          Requisicao04.Requisicao_Empresa.ItemIndex := 0;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_empresa.Text) = 'MONIBRAS' ) Then
          Begin
          Requisicao04.Requisicao_Empresa.ItemIndex := 1;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_empresa.Text) = 'FERRAMENTARIA' ) Then
          Begin
          Requisicao04.Requisicao_Empresa.ItemIndex := 2;
        End;

        Requisicao04.Requisicao_Previsao_Entrega.Text := ConexaoBD.SQL_Requisicaofb_requisicao_prazo_entrega.Text;
        Requisicao04.Requisicao_Solicitante.Text      := ConexaoBD.SQL_Requisicaofb_requisicao_funcionario.Text;
        Requisicao04.Requisicao_Planejamento.Text     := ConexaoBD.SQL_Requisicaofb_requisicao_planejamento.Text;

        If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '01 - Gerência Produção' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 0;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '02 - Almoxarifado' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 1;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '03 - Caldeiraria' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 2;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '04 - Acabamento' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 3;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '05 - Funilaria' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 4;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '06 - Usinagem' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 5;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '07 - Montagem Mecânica' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 6;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '08 - Peças' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 7;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '09 - Solda' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 8;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '10 - Pintura' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 9;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '11 - Estufa' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 10;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '12 - Montagem Elétrica' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 11;
          End
        Else If( Trim(ConexaoBD.SQL_Requisicaofb_requisicao_centro.Text) = '14 - Vendas' ) Then
          Begin
          Requisicao04.Requisicao_Centro_Custo.ItemIndex := 12;
        End;

        Requisicao04.Requisicao_Equipamento.Text := ConexaoBD.SQL_Requisicaofb_requisicao_equipamento.Text;
        Requisicao04.Requisicao_OS.Text := ConexaoBD.SQL_Requisicaofb_requisicao_os.Text;
        Requisicao04.Requisicao_Observacao_Tabulacao.Text := ConexaoBD.SQL_Requisicaofb_requisicao_obs_tabulacao.Text;

        //*** Fecha SQL ***

        ConexaoBD.SQL_Requisicao.Close;
        ConexaoBD.SQL_Fornecedores.Close;

        Seta();
      End;

      Requisicao04.Show;

    End;
end;

procedure TRequisicao02.DBGrid_GruposKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then begin
        DBGrid_GruposDblClick(Sender);
    end;
end;

procedure TRequisicao02.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If DBGrid2.Fields[5].Text = 'Em Aberto' Then
        Begin
        DBGrid2.Canvas.Brush.Color :=  clMaroon;
        End
    Else If DBGrid2.Fields[5].Text = 'Emitida - Aguardando Entrega' Then
        Begin
        DBGrid2.Canvas.Brush.Color :=  clOlive;
        End
    Else If DBGrid2.Fields[5].Text = 'Conferência de Itens' Then
        Begin
        DBGrid2.Canvas.Brush.Color :=  clGreen;
        End
    Else If DBGrid2.Fields[5].Text = 'Entregue' Then
        Begin
        DBGrid2.Canvas.Brush.Color :=  clMoneyGreen;
        End
    Else If DBGrid2.Fields[5].Text = 'Ordem de Compra' Then
        Begin
        DBGrid2.Canvas.Brush.Color :=  clOlive;
        End
    Else If DBGrid2.Fields[5].Text = 'Entregue Parcial' Then
        Begin
        DBGrid2.Canvas.Brush.Color :=  clTeal;
    End;

    DBGrid2.DefaultDrawDataCell(Rect, DBGrid2.columns[datacol].field, State);
end;

procedure TRequisicao02.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If DBGrid1.Fields[4].Text <> 'Cotada' Then Begin
        DBGrid1.Canvas.Brush.Color :=  clOlive;
        End
     Else If DBGrid1.Fields[4].Text <> 'Entregue' Then Begin
        DBGrid1.Canvas.Brush.Color :=  clMoneyGreen;
     End;

     DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[datacol].field, State);
end;

procedure TRequisicao02.DBGrid1DblClick(Sender: TObject);

var
    Nro_Cotacao, Codigo_Fornecedor, Vlr_Exibicao: String;
    Erro: Integer;
    Vlr_Numero: Real;
    cotacoes: string;

begin
    If Ibrasmak00.Cotao1.Enabled = True Then
       Begin

       If DBGrid1.Fields[0].Text <> '' Then Begin
         Ampulheta();

         Selecionado := DBGrid1.Fields[0].Text;

         If (Cotacao04 = Nil) Then Begin

           Application.CreateForm(TCotacao04,Cotacao04);

           Cotacao04.Programa_Anterior.Text := 'Requisicao';

           //*** Obtem os Dados da Cotação ***

           Nro_Cotacao := DBGrid1.Fields[0].Text;

           ConexaoBD.SQL_Cotacao.Close;
           ConexaoBD.SQL_Cotacao.SQL.Clear;
           ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Where fb_cotacao_nro = ' + Trim(Nro_Cotacao) );
           ConexaoBD.SQL_Cotacao.Open;

           //*** Obtem os Dados dos Clientes ***

           Codigo_Fornecedor := ConexaoBD.SQL_Cotacaofb_cotacao_fornecedor.Text;

           ConexaoBD.SQL_Fornecedores.Close;
           ConexaoBD.SQL_Fornecedores.SQL.Clear;
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + Trim(Codigo_Fornecedor) );
           ConexaoBD.SQL_Fornecedores.Open;

           //*** Carrega os Dados Obtidos ***

           Cotacao04.Nro_Cotacao.Text                 := Nro_Cotacao;

           Cotacao04.Fornecedor_Numero.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

           Cotacao04.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
           Cotacao04.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
           Cotacao04.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
           Cotacao04.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
           Cotacao04.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
           Cotacao04.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
           Cotacao04.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
           Cotacao04.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
           Cotacao04.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
           Cotacao04.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
           Cotacao04.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
           Cotacao04.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

           Cotacao04.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

           Cotacao04.Fornecedor_Observacoes.Lines.Clear;
           Cotacao04.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);

           Cotacao04.Cotacao_Funcionario.Text     := conexaoBD.SQL_Cotacaofb_cotacao_funcionario.Text;
           Cotacao04.Cotacao_Vendedor.Text        := conexaoBD.SQL_Cotacaofb_cotacao_vendedor.Text;
           Cotacao04.Cotacao_Orcamento.Text       := conexaoBD.SQL_Cotacaofb_cotacao_orcamento_nro.Text;

           Cotacao04.Cotacao_Data.Text           := conexaoBD.SQL_Cotacaofb_cotacao_data.Text;

           Cotacao04.Cotacao_Prazo.Text           := conexaoBD.SQL_Cotacaofb_cotacao_prazo_entrega.Text;
           Cotacao04.Cotacao_Condicao_Pgto_1.Text := conexaoBD.SQL_Cotacaofb_cotacao_cond_pgto_1.Text;

           Cotacao04.Cotacao_Status.Text          := conexaoBD.SQL_Cotacaofb_cotacao_status.Text;
           Cotacao04.edNroRequisicao.Text         := conexaoBD.SQL_Cotacaofb_cotacao_requisicao.Text;

           If Trim(conexaoBD.SQL_Cotacaofb_cotacao_opcao.Text) = 'MATERIA PRIMA' Then Begin
             Cotacao04.Cotacao_Opcao.ItemIndex := 0;
             End
           Else If Trim(conexaoBD.SQL_Cotacaofb_cotacao_opcao.Text) = 'CONSUMO' Then Begin
             Cotacao04.Cotacao_Opcao.ItemIndex := 1;
             End
           Else Begin
             Cotacao04.Cotacao_Opcao.ItemIndex := 2;
           End;

           Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Cotacaofb_cotacao_desconto.Text));
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Cotacao04.Valor_Desconto.Text := Vlr_Exibicao;

           Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Cotacaofb_cotacao_frete.Text));
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Cotacao04.Valor_Frete.Text := Vlr_Exibicao;

           Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Cotacaofb_cotacao_vlr_total.Text));
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Cotacao04.Valor_Total.Text  := Vlr_Exibicao;

           If Trim(ConexaoBD.SQL_Cotacaofb_cotacao_status.Text) = 'Cotada' Then
              Begin
              Cotacao04.Cotacao_Status.ItemIndex := 0;
              End
           Else If Trim(ConexaoBD.SQL_Cotacaofb_cotacao_status.Text) = 'Entregue' Then
              Begin
              Cotacao04.Cotacao_Status.ItemIndex := 1;
           End;

           If( Trim(ConexaoBD.SQL_Cotacaofb_cotacao_empresa.Text) = 'IBRASMAK' ) Then
             Begin
             Cotacao04.Cotacao_Empresa.ItemIndex := 0;
             End
           Else If( Trim(ConexaoBD.SQL_Cotacaofb_cotacao_empresa.Text) = 'MONIBRAS' ) Then
             Begin
             Cotacao04.Cotacao_Empresa.ItemIndex := 1;
             End
           Else If( Trim(ConexaoBD.SQL_Cotacaofb_cotacao_empresa.Text) = 'FERRAMENTARIA' ) Then
             Begin
             Cotacao04.Cotacao_Empresa.ItemIndex := 2;
           End;

           //*** Fecha SQL ***

           ConexaoBD.SQL_Cotacao.Close;
           ConexaoBD.SQL_Fornecedores.Close;

           Seta();
         End;

         Cotacao04.ShowModal;

         if (ConexaoBD.SQL_Requisicaofb_requisicao_nro.Text <> '') then begin
             cotacoes := '999999';

             ConexaoBD.SQL_Ordem.Close;
             ConexaoBD.SQL_Ordem.SQL.Clear;
             ConexaoBD.SQL_Ordem.SQL.Add('Select * from fb_ordens Where fb_ordem_cotacao in ('+cotacoes+') Order By fb_ordem_nro Desc');
             ConexaoBD.SQL_Ordem.Open;

             ConexaoBD.SQL_Cotacao.Close;
             ConexaoBD.SQL_Cotacao.SQL.Clear;
             ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Where fb_cotacao_requisicao = '+#39+ConexaoBD.SQL_Requisicaofb_requisicao_nro.Text+#39+' Order By fb_cotacao_nro Desc');
             ConexaoBD.SQL_Cotacao.Open;

             if ConexaoBD.SQL_Cotacao.RecordCount > 0 Then begin

                 ConexaoBD.SQL_Cotacao.First;
                 while not ConexaoBD.SQL_Cotacao.Eof do begin
                     cotacoes := cotacoes +', '+ ConexaoBD.SQL_Cotacaofb_cotacao_nro.Text;
                     ConexaoBD.SQL_Cotacao.Next;
                 end;
                 ConexaoBD.SQL_Cotacao.First;

                 ConexaoBD.SQL_Ordem.Close;
                 ConexaoBD.SQL_Ordem.SQL.Clear;
                 ConexaoBD.SQL_Ordem.SQL.Add('Select * from fb_ordens Where fb_ordem_cotacao in ('+cotacoes+') Order By fb_ordem_nro Desc');
                 ConexaoBD.SQL_Ordem.Open;

             end;
         end;

       End;
    End;
end;

procedure TRequisicao02.DBGrid2DblClick(Sender: TObject);

var
    Nro_Ordem, Codigo_Fornecedor, Vlr_Exibicao: String;
    Erro: Integer;
    Vlr_Numero: Real;
    cotacoes: string;

begin
    If Ibrasmak00.OrdemdeCompra1.Enabled = True Then
       Begin

       If DBGrid2.Fields[0].Text <> '' Then Begin
         Selecionado := DBGrid2.Fields[0].Text;

         If (Ordem02 = Nil) Then Begin
           Ampulheta();
           Application.CreateForm(TOrdem02,Ordem02);

           Ordem02.Programa_Anterior.Text := 'Requisicao';

           //*** Obtem os Dados da Cotação ***

           Nro_Ordem := DBGrid2.Fields[0].Text;

           ConexaoBD.SQL_Ordem.Close;
           ConexaoBD.SQL_Ordem.SQL.Clear;
           ConexaoBD.SQL_Ordem.SQL.Add('Select * from fb_ordens Where fb_ordem_nro = ' + Trim(Nro_Ordem) );
           ConexaoBD.SQL_Ordem.Open;

           //*** Obtem os Dados dos Clientes ***

           Codigo_Fornecedor := ConexaoBD.SQL_Ordemfb_ordem_fornecedor.Text;

           ConexaoBD.SQL_Fornecedores.Close;
           ConexaoBD.SQL_Fornecedores.SQL.Clear;
           ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_numero = ' + Trim(Codigo_Fornecedor) );
           ConexaoBD.SQL_Fornecedores.Open;

           //*** Carrega os Dados Obtidos ***

           Ordem02.Nro_Ordem.Text                 := Nro_Ordem;

           Ordem02.Fornecedor_Numero.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text;

           Ordem02.Fornecedor_Codigo.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_codigo.Text;
           Ordem02.Fornecedor_IE.Text               := conexaoBD.SQL_Fornecedoresfb_fornecedor_inscricao_estadual.Text;

           Ordem02.Fornecedor_Nome.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text;
           Ordem02.Fornecedor_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
           Ordem02.Fornecedor_Cep.Text              := conexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;
           Ordem02.Fornecedor_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Fornecedoresfb_fornecedor_pais.Text);
           Ordem02.Fornecedor_Endereco.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
           Ordem02.Fornecedor_Bairro.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
           Ordem02.Fornecedor_Cidade.Text           := conexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
           Ordem02.Fornecedor_Contato.Text          := conexaoBD.SQL_Fornecedoresfb_fornecedor_contato.Text;
           Ordem02.Fornecedor_Fone_Comercial.Text   := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
           Ordem02.Fornecedor_Fone_Celular.Text     := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
           Ordem02.Fornecedor_Fone_Fax.Text         := conexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;
           Ordem02.Fornecedor_Email.Text            := conexaoBD.SQL_Fornecedoresfb_fornecedor_email.Text;

           Ordem02.Fornecedor_Site.Text             := conexaoBD.SQL_Fornecedoresfb_fornecedor_site.Text;

           Ordem02.Fornecedor_Observacoes.Lines.Clear;
           Ordem02.Fornecedor_Observacoes.Lines.Add(DBG_Fornecedor_Observacao.Text);

           Ordem02.Ordem_Funcionario.Text     := conexaoBD.SQL_Ordemfb_ordem_funcionario.Text;
           Ordem02.Ordem_Vendedor.Text        := conexaoBD.SQL_Ordemfb_ordem_vendedor.Text;

           Ordem02.Ordem_Data.Text            := conexaoBD.SQL_Ordemfb_ordem_data.Text;

           Ordem02.Ordem_Orcamento.Text       := conexaoBD.SQL_Ordemfb_ordem_orcamento_nro.Text;
           Ordem02.Ordem_Prazo.Text           := conexaoBD.SQL_Ordemfb_ordem_prazo_entrega.Text;
           Ordem02.Ordem_Condicao_Pgto_1.Text := conexaoBD.SQL_Ordemfb_ordem_cond_pgto_1.Text;

           Ordem02.Ordem_OBS_1.Text           := conexaoBD.SQL_Ordemfb_ordem_obs_1.Text;
           Ordem02.Ordem_OBS_2.Text           := conexaoBD.SQL_Ordemfb_ordem_obs_2.Text;
           Ordem02.Ordem_OBS_3.Text           := conexaoBD.SQL_Ordemfb_ordem_obs_3.Text;
           Ordem02.Ordem_OBS_4.Text           := conexaoBD.SQL_Ordemfb_ordem_obs_4.Text;
           Ordem02.Ordem_OBS_5.Text           := conexaoBD.SQL_Ordemfb_ordem_obs_5.Text;

           Ordem02.Ordem_Status.Text          := conexaoBD.SQL_Ordemfb_ordem_status.Text;

           If Trim(conexaoBD.SQL_Ordemfb_ordem_opcao.Text) = 'MATERIA PRIMA' Then Begin
             Ordem02.Ordem_Opcao.ItemIndex := 0;
             End
           Else If Trim(conexaoBD.SQL_Ordemfb_ordem_opcao.Text) = 'CONSUMO' Then Begin
             Ordem02.Ordem_Opcao.ItemIndex := 1;
             End
           Else Begin
             Ordem02.Ordem_Opcao.ItemIndex := 2;
           End;

           Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Ordemfb_ordem_desconto.Text));
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Ordem02.Valor_Desconto.Text := Vlr_Exibicao;

           Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Ordemfb_ordem_frete.Text));
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Ordem02.Valor_Frete.Text := Vlr_Exibicao;

           Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Ordemfb_ordem_vlr_total.Text));
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Ordem02.Valor_Total.Text  := Vlr_Exibicao;

           If Trim(ConexaoBD.SQL_Ordemfb_ordem_status.Text) = 'Em Aberto' Then
              Begin
              Ordem02.Ordem_Status.ItemIndex := 0;
              End
           Else If Trim(ConexaoBD.SQL_Ordemfb_ordem_status.Text) = 'Emitida - Aguardando Entrega' Then
              Begin
              Ordem02.Ordem_Status.ItemIndex := 1;
              End
           Else If Trim(ConexaoBD.SQL_Ordemfb_ordem_status.Text) = 'Conferência de Itens' Then
              Begin
              Ordem02.Ordem_Status.ItemIndex := 2;
              End
           Else If Trim(ConexaoBD.SQL_Ordemfb_ordem_status.Text) = 'Entregue' Then
              Begin
              Ordem02.Ordem_Status.ItemIndex := 3;
              End
           Else If Trim(ConexaoBD.SQL_Ordemfb_ordem_status.Text) = 'Entregue Parcial' Then
              Begin
              Ordem02.Ordem_Status.ItemIndex := 4;
           End;

           If( Trim(ConexaoBD.SQL_Ordemfb_ordem_empresa.Text) = 'IBRASMAK' ) Then
             Begin
             Ordem02.Ordem_Empresa.ItemIndex := 0;
             End
           Else If( Trim(ConexaoBD.SQL_Ordemfb_ordem_empresa.Text) = 'MONIBRAS' ) Then
             Begin
             Ordem02.Ordem_Empresa.ItemIndex := 1;
             End
           Else If( Trim(ConexaoBD.SQL_Ordemfb_ordem_empresa.Text) = 'FERRAMENTARIA' ) Then
             Begin
             Ordem02.Ordem_Empresa.ItemIndex := 2;
           End;

           //*** Fecha SQL ***

           ConexaoBD.SQL_Ordem.Close;
           ConexaoBD.SQL_Fornecedores.Close;

           Seta();
         End;

         Ordem02.ShowModal;

         if (ConexaoBD.SQL_Requisicaofb_requisicao_nro.Text <> '') then begin
             cotacoes := '999999';

             ConexaoBD.SQL_Ordem.Close;
             ConexaoBD.SQL_Ordem.SQL.Clear;
             ConexaoBD.SQL_Ordem.SQL.Add('Select * from fb_ordens Where fb_ordem_cotacao in ('+cotacoes+') Order By fb_ordem_nro Desc');
             ConexaoBD.SQL_Ordem.Open;

             ConexaoBD.SQL_Cotacao.Close;
             ConexaoBD.SQL_Cotacao.SQL.Clear;
             ConexaoBD.SQL_Cotacao.SQL.Add('Select * from fb_cotacoes Where fb_cotacao_requisicao = '+#39+ConexaoBD.SQL_Requisicaofb_requisicao_nro.Text+#39+' Order By fb_cotacao_nro Desc');
             ConexaoBD.SQL_Cotacao.Open;

             if ConexaoBD.SQL_Cotacao.RecordCount > 0 Then begin

                 ConexaoBD.SQL_Cotacao.First;
                 while not ConexaoBD.SQL_Cotacao.Eof do begin
                     cotacoes := cotacoes +', '+ ConexaoBD.SQL_Cotacaofb_cotacao_nro.Text;
                     ConexaoBD.SQL_Cotacao.Next;
                 end;
                 ConexaoBD.SQL_Cotacao.First;

                 ConexaoBD.SQL_Ordem.Close;
                 ConexaoBD.SQL_Ordem.SQL.Clear;
                 ConexaoBD.SQL_Ordem.SQL.Add('Select * from fb_ordens Where fb_ordem_cotacao in ('+cotacoes+') Order By fb_ordem_nro Desc');
                 ConexaoBD.SQL_Ordem.Open;

             end;
         end;

       End;
    End;
end;

procedure TRequisicao02.BT_TabularClick(Sender: TObject);

begin
    If Ibrasmak00.Cotao1.Enabled = True Then
       Begin
       If DBGrid_Grupos.Fields[0].Text <> '' Then
          Begin
          Criar_PDF('EMail','1','22','1','1');
       End;
       End
    Else
       Begin
       BT_Tabular.Enabled := False;
    End;
end;

end.
