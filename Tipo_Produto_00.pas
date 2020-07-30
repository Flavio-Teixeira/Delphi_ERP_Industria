unit Tipo_Produto_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TTipoProduto00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Tipo_Produto: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure DBGrid_Tipo_ProdutoCellClick(Column: TColumn);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TipoProduto00: TTipoProduto00;

implementation

uses Conexao_BD, Rotinas_Gerais, Tipo_Produto_01, Tipo_Produto_02,
  Ibrasmak_00;

var Selecionado: string;

{$R *.dfm}

procedure TTipoProduto00.BT_SairClick(Sender: TObject);
begin
     TipoProduto00.Close;
end;

procedure TTipoProduto00.DBGrid_Tipo_ProdutoCellClick(Column: TColumn);
begin
    If DBGrid_Tipo_Produto.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Tipo_Produto.Fields[0].Text;

      TipoProduto00.Visible := False;

      Ampulheta();
      Application.CreateForm(TTipoProduto02,TipoProduto02);

      TipoProduto02.Tipo_Produto_Codigo.Text    := DBGrid_Tipo_Produto.Fields[0].Text;
      TipoProduto02.Tipo_Produto_Descricao.Text := DBGrid_Tipo_Produto.Fields[1].Text;

      Seta();

      TipoProduto02.ShowModal;
      TipoProduto02.Destroy;

      TipoProduto00.Visible := True;

      ConexaoBD.SQL_Tipo_Produto.Locate('fb_tipo_produto_codigo',Trim(Selecionado),[]);
    End;
end;

procedure TTipoProduto00.BT_IncluirClick(Sender: TObject);
begin
     TipoProduto00.Visible := False;

     Application.CreateForm(TTipoProduto01,TipoProduto01);
     TipoProduto01.ShowModal;
     TipoProduto01.Destroy;

     TipoProduto00.Visible := True;
end;

procedure TTipoProduto00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Tipo_Produto.SQL.Clear;
    ConexaoBD.SQL_Tipo_Produto.SQL.Add('Select * from fb_tipos_produtos Order By fb_tipo_produto_codigo');
    ConexaoBD.SQL_Tipo_Produto.Open;
end;

procedure TTipoProduto00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     TipoProduto00 := Nil;
end;

end.
