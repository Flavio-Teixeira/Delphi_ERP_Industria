unit Adiciona_Produto_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls;

type
  TAdicionaProduto01 = class(TForm)
    Panel2: TPanel;
    SGD_Produtos: TStringGrid;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Adicionar: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Total_servicos: TLabel;
    Programa_Anterior: TEdit;
    Adiciona_Codigo: TEdit;
    Tipo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_AdicionarClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure SGD_ProdutosClick(Sender: TObject);
    procedure Adiciona_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_ServicoKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_QtdeKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_Vlr_UnitarioKeyPress(Sender: TObject;
      var Key: Char);
    procedure Adiciona_Vlr_TotalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    procedure Exibe_Grid_Produtos();

  public
    { Public declarations }
  end;

var
  AdicionaProduto01: TAdicionaProduto01;

implementation

uses Conexao_BD, Rotinas_Gerais,
  Rel_Movimento_Estoque_00, Rel_Estoque_Inventario_00,
  Rel_Estoque_Produtos_01;

{$R *.dfm}

//***************
//*** Funções ***
//***************

//******************
//*** Procedures ***
//******************

procedure TAdicionaProduto01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TAdicionaProduto01.FormShow(Sender: TObject);
begin
    Ampulheta();

    Exibe_Grid_Produtos();

    Seta();
end;

procedure TAdicionaProduto01.BT_SairClick(Sender: TObject);
begin
    AdicionaProduto01.Close;
end;

procedure TAdicionaProduto01.BT_AdicionarClick(Sender: TObject);

var MSG_Texto: String;
    Checa_Produto: Boolean;
    Ind, Erro, Posicao: Integer;
    Vlr_Numero: Real;
    Vlr_Exibicao: String;

begin
     If Trim(Adiciona_Codigo.Text) <> '' Then
        Begin

        MSG_Texto := 'Deseja filtrar apartir do Produto:'+#13+#10+#13+#10;
        MSG_Texto := MSG_Texto + SGD_Produtos.Cells[0,SGD_Produtos.Row] + ' - ' + SGD_Produtos.Cells[1,SGD_Produtos.Row] +#13+#10+#13+#10;
        MSG_Texto := MSG_Texto + '?';

        If Confirma(MSG_Texto) = 6 Then
           Begin

           If Trim(Programa_Anterior.Text) = 'RelMovimentoEstoque00' Then
              Begin
              RelMovimentoEstoque00.Produto.Text := Adiciona_Codigo.Text;
              AdicionaProduto01.Close;
              End
           Else If Trim(Programa_Anterior.Text) = 'RelEstoqueInventario00' Then
              Begin
              RelEstoqueInventario00.Produto.Text := Adiciona_Codigo.Text;
              AdicionaProduto01.Close;
              End
           Else If Trim(Programa_Anterior.Text) = 'RelEstoqueProdutos01' Then
              Begin
              RelEstoqueProdutos01.Produto.Text := Adiciona_Codigo.Text;
              AdicionaProduto01.Close;
              End
           Else
              Begin
              AdicionaProduto01.Close;
           End;
        End;
     End;
end;

procedure TAdicionaProduto01.Exibe_Grid_Produtos;

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
         SGD_Produtos.Cells[0,Ind] := '';
         SGD_Produtos.Cells[1,Ind] := '';
         SGD_Produtos.Cells[2,Ind] := '';
         SGD_Produtos.Cells[3,Ind] := '';
         SGD_Produtos.Cells[4,Ind] := '';
     End;

     //*** Continua o Carregamento Normal ***
     If ((Trim(Programa_Anterior.Text) = 'RelMovimentoEstoque00') or
              (Trim(Programa_Anterior.Text) = 'RelEstoqueInventario00') or
              (Trim(Programa_Anterior.Text) = 'RelEstoqueProdutos01')) Then
         Begin

         ConexaoBD.SQL_FB_Produtos.Close;
         ConexaoBD.SQL_FB_Produtos.SQL.Clear;
         ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_descricao');
         ConexaoBD.SQL_FB_Produtos.Open;

         Total_Servicos.Caption := IntToStr(ConexaoBD.SQL_FB_Produtos.RecordCount);

         If ConexaoBD.SQL_FB_Produtos.RecordCount > 0 Then
            Begin
            SGD_Produtos.RowCount  := 2;
            SGD_Produtos.Refresh;

            SGD_Produtos.RowCount  := (ConexaoBD.SQL_FB_Produtos.RecordCount + 1);
            SGD_Produtos.FixedRows := 1;
            Ind := 0;

            ConexaoBD.SQL_FB_Produtos.First;

            While Not ConexaoBD.SQL_FB_Produtos.Eof Do
                  Begin
                  Ind := Ind + 1;

                  SGD_Produtos.Cells[0,Ind] := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_codigo').Text;
                  SGD_Produtos.Cells[1,Ind] := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_descricao').Text;
                  SGD_Produtos.Cells[2,Ind] := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_tipo').Text;
                  SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_unidade').Text;

                  Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_FB_Produtos.FieldByName('fb_produto_estoque_atual').Text));
                  Val(Vlr_Exibicao,Vlr_Numero,Erro);
                  Str(Vlr_Numero:13:3,Vlr_Exibicao);
                  Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

                  SGD_Produtos.Cells[3,Ind] := Vlr_Exibicao;

                  ConexaoBD.SQL_FB_Produtos.Next;
            End;

            ConexaoBD.SQL_FB_Produtos.First;
            End
         Else
            Begin
            SGD_Produtos.RowCount  := 2;
            SGD_Produtos.FixedRows := 1;
         End;
     End;

     //*** Preparação do StringGrid ***

     //*** Quantidade ***
     SGD_Produtos.Cells[0,0]   := 'Código';
     SGD_Produtos.ColWidths[0] := 100;

     //*** Descrição do Produto ***
     SGD_Produtos.Cells[1,0]   := 'Descrição';
     SGD_Produtos.ColWidths[1] := 450;

     //*** Valor Unitário ***
     SGD_Produtos.Cells[2,0]   := 'Tipo';
     SGD_Produtos.ColWidths[2] := 30;

     //*** Valor Total ***
     SGD_Produtos.Cells[3,0]   := 'Estoque';
     SGD_Produtos.ColWidths[3] := 85;

     //*** Unidade ***
     SGD_Produtos.Cells[4,0]   := 'Unidade';
     SGD_Produtos.ColWidths[4] := 45;

     Seta();
end;

procedure TAdicionaProduto01.BT_ProcurarClick(Sender: TObject);

var
   Busca_Codigo, Busca_Palavra: String;
   Ind: Integer;
   Localizou: Boolean;

begin
     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        Ampulheta();

        Localizou := False;

        For Ind := 1 To (SGD_Produtos.RowCount - 1) Do
            Begin
            Busca_Codigo  := UpperCase(Trim(SGD_Produtos.Cells[1,Ind]));
            Busca_Palavra := UpperCase(Trim(Dados_Procura.Text));

            If StrPos(PChar(Busca_Codigo), PChar(Busca_Palavra)) <> Nil Then
               Begin
               Localizou        := True;
               SGD_Produtos.Row := Ind;
               Break;
            End;
        End;

        If Not Localizou Then
           Begin
           MSG_Erro('Nenhum Produto Foi Localizado...');
        End;

        Seta();

     End;
end;

procedure TAdicionaProduto01.SGD_ProdutosClick(Sender: TObject);

var MSG_Texto: String;
    Checa_Produto: Boolean;
    Ind, Erro: Integer;
    Vlr_Numero: Real;
    Vlr_Exibicao: String;

begin
    If SGD_Produtos.Cells[0,SGD_Produtos.Row] <> '' Then
        Begin
        Adiciona_Codigo.Text       := SGD_Produtos.Cells[0,SGD_Produtos.Row];

        MSG_Texto := 'Deseja filtrar apartir do Produto:'+#13+#10+#13+#10;
        MSG_Texto := MSG_Texto + SGD_Produtos.Cells[0,SGD_Produtos.Row] + ' - ' + SGD_Produtos.Cells[1,SGD_Produtos.Row] +#13+#10+#13+#10;
        MSG_Texto := MSG_Texto + '?';

        If Confirma(MSG_Texto) = 6 Then
           Begin

           If Trim(Programa_Anterior.Text) = 'RelMovimentoEstoque00' Then
              Begin
              RelMovimentoEstoque00.Produto.Text := Adiciona_Codigo.Text;
              AdicionaProduto01.Close;
              End
           Else If Trim(Programa_Anterior.Text) = 'RelEstoqueInventario00' Then
              Begin
              RelEstoqueInventario00.Produto.Text := Adiciona_Codigo.Text;
              AdicionaProduto01.Close;
              End
           Else If Trim(Programa_Anterior.Text) = 'RelEstoqueProdutos01' Then
              Begin
              RelEstoqueProdutos01.Produto.Text := Adiciona_Codigo.Text;
              AdicionaProduto01.Close;
              End
           Else
              Begin
              AdicionaProduto01.Close;
           End;
        End;

    End;
end;

procedure TAdicionaProduto01.Adiciona_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaProduto01.Adiciona_ServicoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaProduto01.Adiciona_QtdeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaProduto01.Adiciona_Vlr_UnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAdicionaProduto01.Adiciona_Vlr_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
