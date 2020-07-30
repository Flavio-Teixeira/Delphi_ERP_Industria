unit Historico_Produtos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  THistoricoProdutos00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Produtos: TDBGrid;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Total_Produtos: TLabel;
    Tipo_Historico: TEdit;
    procedure BT_ProcurarClick(Sender: TObject);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_ProdutosCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HistoricoProdutos00: THistoricoProdutos00;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00, Historico_Produtos_03;

{$R *.dfm}

procedure THistoricoProdutos00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     ConexaoBD.SQL_Produtos.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Código' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_produto_codigo');
           End
        Else If Opcoes_Procura.Text = 'Referência' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_referencia Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_produto_referencia');
           End  
        Else If Opcoes_Procura.Text = 'Descrição' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_descricao Like ' +#39+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_produto_descricao');
           End
        Else If Opcoes_Procura.Text = 'Unidade' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_unidade Like ' +#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_produto_unidade');
           End
        Else If Opcoes_Procura.Text = 'Família' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_familia = ' + Trim(Dados_Procura.Text) + ' Order By fb_produto_familia');
           End
        Else If Opcoes_Procura.Text = 'Tipo' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_tipo = ' + Trim(Dados_Procura.Text) + ' Order By fb_produto_tipo');
           End
        Else If Opcoes_Procura.Text = 'Qtde.Estoque' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_estoque_atual = ' + Trim(Dados_Procura.Text) + ' Order By fb_produto_estoque_atual');
           End
        Else If Opcoes_Procura.Text = 'Cód.Barras' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo_barras = ' + Trim(Dados_Procura.Text) + ' Order By fb_produto_codigo_barras');
           End
        Else If Opcoes_Procura.Text = 'Lote' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_lote = ' + Trim(Dados_Procura.Text) + ' Order By fb_produto_lote');
        End;

        End
     Else
        Begin

        If Opcoes_Procura.Text = 'Código' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_codigo');
           End
        Else If Opcoes_Procura.Text = 'Referência' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_referencia');
           End
        Else If Opcoes_Procura.Text = 'Descrição' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_descricao');
           End
        Else If Opcoes_Procura.Text = 'Unidade' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_unidade');
           End
        Else If Opcoes_Procura.Text = 'Família' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_familia');
           End
        Else If Opcoes_Procura.Text = 'Tipo' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_tipo');
           End
        Else If Opcoes_Procura.Text = 'Qtde.Estoque' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_estoque_atual');
           End
        Else If Opcoes_Procura.Text = 'Cód.Barras' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_codigo_barras');
           End
        Else If Opcoes_Procura.Text = 'Lote' Then
           Begin
           ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_lote');
        End;

     End;

     ConexaoBD.SQL_Produtos.Open;

     Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_Produtos.RecordCount);

     Seta();
end;

procedure THistoricoProdutos00.Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricoProdutos00.Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricoProdutos00.DBGrid_ProdutosCellClick(Column: TColumn);
var Codigo_Produto: String;
    Selecionado: string;
begin
     If DBGrid_Produtos.Fields[0].Text <> '' Then Begin
        Selecionado := DBGrid_Produtos.Fields[0].Text;
        
        HistoricoProdutos00.Visible := False;

        Ampulheta();
        Application.CreateForm(THistoricoProdutos03,HistoricoProdutos03);

        HistoricoProdutos03.Tipo_Historico.Text := Tipo_Historico.Text;

        //*** Obtem os Dados do Produto ***

        Codigo_Produto := DBGrid_Produtos.Fields[1].Text;

        ConexaoBD.SQL_Produtos.Close;
        ConexaoBD.SQL_Produtos.SQL.Clear;
        ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' + #39 + Trim(Codigo_Produto) + #39 );
        ConexaoBD.SQL_Produtos.Open;

        //*** Carrega os Dados Obtidos ***

        HistoricoProdutos03.editReferencia.Text := ConexaoBD.SQL_Produtosfb_produto_referencia.Text;
        HistoricoProdutos03.editCodigo.Text     := ConexaoBD.SQL_Produtosfb_produto_codigo.Text;
        HistoricoProdutos03.editDescricao.Text  := ConexaoBD.SQL_Produtosfb_produto_descricao.Text;

        //*** Fecha SQL ***

        ConexaoBD.SQL_Produtos.Close;

        Seta();

        HistoricoProdutos03.ShowModal;
        HistoricoProdutos03.Destroy;

        HistoricoProdutos00.Visible := True;   

        ConexaoBD.SQL_Produtos.Locate('fb_produto_codigo',Trim(Selecionado),[]);
    End;
end;

procedure THistoricoProdutos00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure THistoricoProdutos00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Produtos.SQL.Clear;
    ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_codigo');
    ConexaoBD.SQL_Produtos.Open;

    Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_Produtos.RecordCount);
end;

procedure THistoricoProdutos00.BT_SairClick(Sender: TObject);
begin
    HistoricoProdutos00.Close;
end;

end.
