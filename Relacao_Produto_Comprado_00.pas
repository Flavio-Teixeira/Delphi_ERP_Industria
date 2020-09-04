unit Relacao_Produto_Comprado_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, Grids, DBGrids;

type
  TRelacaoProdutoComprado00 = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Lista_Fornecedores: TComboBox;
    Label1: TLabel;
    Data_Inicial: TMaskEdit;
    Label4: TLabel;
    Data_Final: TMaskEdit;
    BT_Procurar: TBitBtn;
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid_Notas: TDBGrid;
    BT_Imprimir: TBitBtn;
    Label2: TLabel;
    Fornecedor_Nome: TLabel;
    Programa_Anterior: TEdit;
    Nro_Fornecedor: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure DBGrid_NotasCellClick(Column: TColumn);
    procedure Lista_FornecedoresKeyPress(Sender: TObject; var Key: Char);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    procedure Carrega_Fornecedores();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelacaoProdutoComprado00: TRelacaoProdutoComprado00;

implementation

uses Conexao_BD, Rotinas_Gerais, Notas_Fiscais_Entradas_02,
  Relacao_Produto_Comprado_01, Adiciona_Qtde_Produto_02, Cotacao_03,
  Cotacao_04, Ordem_01, Ordem_02, Requisicao_03, Requisicao_04;

var Selecionado: string;

{$R *.dfm}

procedure TRelacaoProdutoComprado00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRelacaoProdutoComprado00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ConexaoBD.SQL_RelacaoProdutoComprado.Close;

     Action := caFree;
     Release;
     RelacaoProdutoComprado00 := Nil;
end;

procedure TRelacaoProdutoComprado00.FormShow(Sender: TObject);
begin
     //*** Carrega data atual nos campos de periodo ***
     Data_Final.Text   := DateToStr(Date());
     Data_Inicial.Text := '01/01/' + Trim(Copy(Data_Final.Text,7,4));

     //*** Obtem os Fornecedores ***
     Carrega_Fornecedores();

     If Trim(Programa_Anterior.Text) <> '' Then
        Begin
        Lista_Fornecedores.ItemIndex := Obtem_Nro_Fornecedor(Nro_Fornecedor.Text);
     End;
end;

procedure TRelacaoProdutoComprado00.Carrega_Fornecedores();
begin
     // Obtem os Fornecedores

     ConexaoBD.SQL_Fornecedores.Close;
     ConexaoBD.SQL_Fornecedores.SQL.Clear;
     ConexaoBD.SQL_Fornecedores.SQL.Add('Select * from fb_fornecedores Where fb_fornecedor_area = '+#39+ 'Compras' +#39+ ' Order By fb_fornecedor_nome');
     ConexaoBD.SQL_Fornecedores.Open;

     If conexaoBD.SQL_Fornecedores.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Fornecedores.First;

        Lista_Fornecedores.Items.Add('--- TODOS ---');

        While Not conexaoBD.SQL_Fornecedores.Eof Do
              begin
              Lista_Fornecedores.Items.Add(Trim(conexaoBD.SQL_Fornecedoresfb_fornecedor_numero.Text) + ' - ' + Trim(conexaoBD.SQL_Fornecedoresfb_fornecedor_nome.Text));
              conexaoBD.SQL_Fornecedores.Next;
        End;
     end;

     ConexaoBD.SQL_Fornecedores.Close;

     Lista_Fornecedores.ItemIndex := 0;
end;

procedure TRelacaoProdutoComprado00.BT_SairClick(Sender: TObject);
begin
     RelacaoProdutoComprado00.Close;
end;

procedure TRelacaoProdutoComprado00.BT_ProcurarClick(Sender: TObject);

var
   Comando_SQL: String;

begin
      If Trim(Data_Inicial.Text) = '/  /' Then
         begin
         MSG_Erro('Data Inicial não preenchida...');
         Data_Inicial.SetFocus;
         end
      Else if Trim(Data_Final.Text) = '/  /' then
         begin
         MSG_Erro('Data Final não preenchida...');
         Data_Final.SetFocus;
         end
      Else if StrToDate(Data_Inicial.Text) > StrToDate(Data_Final.Text) then
         begin
         MSG_Erro('Data Inicial deve ser menor que a Data Final...');
         Data_Final.SetFocus;
         end
      Else
         begin
         Ampulheta();

         If Lista_Fornecedores.Text = '--- TODOS ---' Then
           begin
           Comando_SQL := 'select fb_nota_entrada_numero, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_fornecedor_nro, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_fornecedor_nome, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_numero_nota, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_data_emissao, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_numero, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_codigo, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_referencia, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_descricao, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_unid, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_qtde, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_unit, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_total, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_icms, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_ipi, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_ipi from fb_notas_entradas, fb_notas_entradas_produtos ';
           Comando_SQL := Comando_SQL + 'where ';
           Comando_SQL := Comando_SQL + '((fb_nota_entrada_data_emissao >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_nota_entrada_data_emissao <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ')) and ';
           Comando_SQL := Comando_SQL + '(fb_nota_entrada_produto_numero = fb_nota_entrada_numero) Order By fb_nota_entrada_data_emissao Desc, fb_nota_entrada_numero_nota Asc, fb_nota_entrada_produto_descricao Asc';
           end
         Else
           begin
           Comando_SQL := 'select fb_nota_entrada_numero, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_fornecedor_nro, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_fornecedor_nome, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_numero_nota, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_data_emissao, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_numero, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_codigo, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_referencia, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_descricao, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_unid, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_qtde, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_unit, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_total, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_icms, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_ipi, ';
           Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_vlr_ipi from fb_notas_entradas, fb_notas_entradas_produtos ';
           Comando_SQL := Comando_SQL + 'where (fb_nota_entrada_fornecedor_nro = ' + Obtem_Nro_Antes_Traco(Lista_Fornecedores.Text) + ' and ';
           Comando_SQL := Comando_SQL + '(fb_nota_entrada_data_emissao >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_nota_entrada_data_emissao <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ')) and ';
           Comando_SQL := Comando_SQL + '(fb_nota_entrada_produto_numero = fb_nota_entrada_numero) Order By fb_nota_entrada_data_emissao Desc, fb_nota_entrada_numero_nota Asc, fb_nota_entrada_produto_descricao Asc';
         End;

         ConexaoBD.SQL_RelacaoProdutoComprado.Close;
         ConexaoBD.SQL_RelacaoProdutoComprado.SQL.Clear;
         ConexaoBD.SQL_RelacaoProdutoComprado.SQL.Add(Comando_SQL);
         ConexaoBD.SQL_RelacaoProdutoComprado.Open;

         Fornecedor_Nome.Caption := Trim(Lista_Fornecedores.Text);
         Fornecedor_Nome.Refresh;

         Seta();
      End;
end;

procedure TRelacaoProdutoComprado00.DBGrid_NotasCellClick(Column: TColumn);
var
    Posicao_Nota: String;
begin
    If DBGrid_Notas.Fields[0].Text <> '' Then
       Begin

       If Trim(Programa_Anterior.Text) = '' Then
          Begin

          Selecionado := DBGrid_Notas.Fields[0].Text;

          If (NotasFiscaisEntradas02 = Nil) Then
             Begin
             Ampulheta();
             Application.CreateForm(TNotasFiscaisEntradas02,NotasFiscaisEntradas02);

             Posicao_Nota                             := DBGrid_Notas.Fields[0].Text;
             NotasFiscaisEntradas02.Posicao_Nota.Text := Posicao_Nota;

             NotasFiscaisEntradas02.BT_Procurar.Enabled := False;
             NotasFiscaisEntradas02.BT_Adicionar.Enabled := False;
             NotasFiscaisEntradas02.BT_Alterar.Enabled := False;
             NotasFiscaisEntradas02.BT_Excluir.Enabled := False;
             NotasFiscaisEntradas02.BT_Adicionar_Servicos.Enabled := False;
             NotasFiscaisEntradas02.BT_Adicionar_Venctos.Enabled := False;

             Seta();
          End;

          NotasFiscaisEntradas02.Show;

          ConexaoBD.SQL_RelacaoProdutoComprado.Locate('fb_nota_entrada_numero',Trim(Selecionado),[]);

          End
       Else
          Begin
          Application.CreateForm(TAdicionaQtdeProduto02,AdicionaQtdeProduto02);

          If Trim(Programa_Anterior.Text) = 'Cotação-Inclusao' Then
             Begin
             AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Cotacao03.SGD_Produtos.Col);
             AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Cotacao03.SGD_Produtos.RowCount - 1);
             End
          Else If Trim(Programa_Anterior.Text) = 'Cotação-Alteração' Then
             Begin
             AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Cotacao04.SGD_Produtos.Col);
             AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Cotacao04.SGD_Produtos.RowCount - 1);
             End
          Else If Trim(Programa_Anterior.Text) = 'Requisição-Inclusao' Then
             Begin
             AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Requisicao03.SGD_Produtos.Col);
             AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Requisicao03.SGD_Produtos.RowCount - 1);
             End
          Else If Trim(Programa_Anterior.Text) = 'Requisição-Alteração' Then
             Begin
             AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Requisicao04.SGD_Produtos.Col);
             AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Requisicao04.SGD_Produtos.RowCount - 1);
             End
          Else If Trim(Programa_Anterior.Text) = 'Ordem-Inclusao' Then
             Begin
             AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Ordem01.SGD_Produtos.Col);
             AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Ordem01.SGD_Produtos.RowCount - 1);
             End
          Else If Trim(Programa_Anterior.Text) = 'Ordem-Alteração' Then
             Begin
             AdicionaQtdeProduto02.Adiciona_ACol.Text           := IntToStr(Ordem02.SGD_Produtos.Col);
             AdicionaQtdeProduto02.Adiciona_ARow.Text           := IntToStr(Ordem02.SGD_Produtos.RowCount - 1);
          End;

          AdicionaQtdeProduto02.Programa_Anterior.Text       := Programa_Anterior.Text;
          AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Text := DBGrid_Notas.Fields[4].Text;
          AdicionaQtdeProduto02.Adiciona_Referencia.Text     := DBGrid_Notas.Fields[5].Text;
          AdicionaQtdeProduto02.Adiciona_Descricao.Text      := DBGrid_Notas.Fields[6].Text;
          AdicionaQtdeProduto02.Adiciona_Quantidade.Text     := '0';
          AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Text := DBGrid_Notas.Fields[9].Text;
          AdicionaQtdeProduto02.Adiciona_Valor_IPI.Text      := DBGrid_Notas.Fields[13].Text;
          AdicionaQtdeProduto02.Adiciona_IPI.Text            := DBGrid_Notas.Fields[12].Text;
          AdicionaQtdeProduto02.Adiciona_Unidade.Text        := DBGrid_Notas.Fields[7].Text;

          AdicionaQtdeProduto02.Adiciona_CF.Text             := '';
          AdicionaQtdeProduto02.Adiciona_ST.Text             := '';

          AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Enabled := True;
          AdicionaQtdeProduto02.Adiciona_Referencia.Enabled     := True;
          AdicionaQtdeProduto02.Adiciona_Descricao.Enabled      := True;
          AdicionaQtdeProduto02.Adiciona_Quantidade.Enabled     := True;
          AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Enabled := True;
          AdicionaQtdeProduto02.Adiciona_Valor_IPI.Enabled      := True;
          AdicionaQtdeProduto02.Adiciona_IPI.Enabled            := True;
          AdicionaQtdeProduto02.Adiciona_Unidade.Enabled        := True;

          AdicionaQtdeProduto02.Adiciona_CF.Enabled             := False;
          AdicionaQtdeProduto02.Adiciona_ST.Enabled             := False;

          AdicionaQtdeProduto02.ShowModal;
          AdicionaQtdeProduto02.Destroy;
       End;

    End;
end;

procedure TRelacaoProdutoComprado00.Lista_FornecedoresKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelacaoProdutoComprado00.Data_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelacaoProdutoComprado00.Data_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelacaoProdutoComprado00.BT_ImprimirClick(Sender: TObject);
begin
     Ampulheta();

     Application.CreateForm(TRelacaoProdutoComprado01,RelacaoProdutoComprado01);

     RelacaoProdutoComprado01.QR_Periodo.Caption := 'Período de ' + Trim(Data_Inicial.Text) + ' a ' + Trim(Data_Final.Text) + ' - Fornecedor: ' + Trim(Fornecedor_Nome.Caption);

     Seta();

     RelacaoProdutoComprado01.QR_ProdutosComprados.Preview;
     RelacaoProdutoComprado01.Destroy;
end;

end.
