unit Estoque_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TEstoque00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Panel2: TPanel;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Total_Produtos: TLabel;
    Label4: TLabel;
    DBG_Produtos: TDBGrid;
    Tipo_Show: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBG_ProdutosCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Estoque00: TEstoque00;

implementation

uses Conexao_BD, Rotinas_Gerais, Estoque_01;

{$R *.dfm}

procedure TEstoque00.BT_SairClick(Sender: TObject);
begin
  Estoque00.Close;
end;

procedure TEstoque00.FormShow(Sender: TObject);
begin
    Ampulheta();
    
    Dados_Procura.Text:='';
    If (Tipo_Show.Text='') Then
      Begin
      ConexaoBD.SQL_FB_Produtos.SQL.Clear;
      ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_codigo');
      ConexaoBD.SQL_FB_Produtos.Open;

      Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_FB_Produtos.RecordCount);
    End;
    Tipo_Show.Text:='';

    Seta();
end;

procedure TEstoque00.Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoque00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEstoque00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     ConexaoBD.SQL_FB_Produtos.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

          If Opcoes_Procura.Text = 'Código' Then
            Begin
            ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo Like '+#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_produto_codigo');
            End
          Else If Opcoes_Procura.Text = 'Desenho' Then
            Begin
            ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_desenho Like '+#39+'%'+ Trim(Dados_Procura.Text) +'%'+#39+' Order By fb_produto_desenho');
            End
          Else If Opcoes_Procura.Text = 'Descrição' Then
            Begin
            ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_descricao Like '+#39+ Trim(Dados_Procura.Text) +'%'+#39+ ' Order By fb_produto_descricao');
          End;
        End
     Else
        Begin
          If Opcoes_Procura.Text = 'Código' Then
            Begin
            ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_codigo');
            End
          Else If Opcoes_Procura.Text = 'Desenho' Then
            Begin
            ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_desenho');
            End

          Else If Opcoes_Procura.Text = 'Descrição' Then
            Begin
            ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Order By fb_produto_descricao');
          End;
     End;

     ConexaoBD.SQL_FB_Produtos.Open;
     Total_Produtos.Caption := IntToStr(ConexaoBD.SQL_FB_Produtos.RecordCount);

     Seta();

// Localizando somente um Produto, Mostrar Direto  Próxima Formulário     
     If (ConexaoBD.SQL_FB_Produtos.RecordCount=1) Then
      Begin
        Estoque00.Visible:=False;
          Application.CreateForm(TEstoque01,Estoque01);

          // Transmite valores dos Campos
            Estoque01.Codigo.Text        := ConexaoBD.SQL_FB_Produtosfb_produto_codigo.Text;
            Estoque01.Desenho.Text       := ConexaoBD.SQL_FB_Produtosfb_produto_desenho.Text;
            Estoque01.Descricao.Text     := ConexaoBD.SQL_FB_Produtosfb_produto_descricao.Text;
            Estoque01.Qtd_Inicial.Text   := ConexaoBD.SQL_FB_Produtosfb_produto_estoque_inicial.Text;
            Estoque01.Qtd_Atual.Text     := ConexaoBD.SQL_FB_Produtosfb_produto_estoque_atual.Text;
            Estoque01.Valor_Venda.Text   := ConexaoBD.SQL_FB_Produtosfb_produto_preco.Text;
            Estoque01.Localizacao.Text   := ConexaoBD.SQL_FB_Produtosfb_produto_localizacao.Text;
            Estoque01.Qtd_Ideal.Text     := ConexaoBD.SQL_FB_Produtosfb_produto_estoque_ideal.Text;
            Estoque01.Qtd_Minima.Text    := ConexaoBD.SQL_FB_Produtosfb_produto_estoque_minimo.Text;

          Estoque01.ShowModal;
          Estoque01.Destroy;
        Estoque00.Visible:=True;          
     End;
End;
procedure TEstoque00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TEstoque00.DBG_ProdutosCellClick(Column: TColumn);
var Selecionado: string;
begin
    If (DBG_Produtos.Fields[0].Text<>'') Then Begin
      Selecionado := DBG_Produtos.Fields[0].Text;
      
      Estoque00.Visible:=False;
      Application.CreateForm(TEstoque01,Estoque01);

      // Transmite valores dos Campos
      Estoque01.Codigo.Text      := DBG_Produtos.Fields[0].Text;
      Estoque01.Desenho.Text     := DBG_Produtos.Fields[1].Text;
      Estoque01.Descricao.Text   := DBG_Produtos.Fields[2].Text;
      Estoque01.Qtd_Inicial.Text := DBG_Produtos.Fields[3].Text;
      Estoque01.Qtd_Atual.Text   := DBG_Produtos.Fields[4].Text;
      Estoque01.Valor_Venda.Text := DBG_Produtos.Fields[5].Text;
      Estoque01.Localizacao.Text := DBG_Produtos.Fields[6].Text;
      Estoque01.Qtd_Ideal.Text   := DBG_Produtos.Fields[7].Text;
      Estoque01.Qtd_Minima.Text  := DBG_Produtos.Fields[8].Text;

      Estoque01.ShowModal;
      Estoque01.Destroy;
      Estoque00.Visible:=True;

      ConexaoBD.SQL_FB_Produtos.Locate('fb_produto_codigo',Trim(Selecionado),[]);
    End;
end;

End.
