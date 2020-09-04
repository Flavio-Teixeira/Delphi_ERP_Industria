unit Familia_Produto_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TFamiliaProduto00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Familia_Produto: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBGrid_Familia_ProdutoCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FamiliaProduto00: TFamiliaProduto00;

implementation

uses Conexao_BD, Rotinas_Gerais, Familia_Produto_01, Familia_Produto_02,
  Ibrasmak_00;

var Selecionado: string;

{$R *.dfm}

procedure TFamiliaProduto00.BT_SairClick(Sender: TObject);
begin
     FamiliaProduto00.Close;
end;

procedure TFamiliaProduto00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Familia_Produto.SQL.Clear;
    ConexaoBD.SQL_Familia_Produto.SQL.Add('Select * from fb_familias_produtos Order By fb_familia_produto_codigo');
    ConexaoBD.SQL_Familia_Produto.Open;
end;

procedure TFamiliaProduto00.BT_IncluirClick(Sender: TObject);
begin
     FamiliaProduto00.Visible := False;

     Application.CreateForm(TFamiliaProduto01,FamiliaProduto01);
     FamiliaProduto01.ShowModal;
     FamiliaProduto01.Destroy;

     FamiliaProduto00.Visible := True;
end;

procedure TFamiliaProduto00.DBGrid_Familia_ProdutoCellClick(
  Column: TColumn);
begin
    If DBGrid_Familia_Produto.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Familia_Produto.Fields[0].Text;

      FamiliaProduto00.Visible := False;

      Ampulheta();
      Application.CreateForm(TFamiliaProduto02,FamiliaProduto02);

      FamiliaProduto02.Familia_Produto_Codigo.Text    := DBGrid_Familia_Produto.Fields[0].Text;
      FamiliaProduto02.Familia_Produto_Descricao.Text := DBGrid_Familia_Produto.Fields[1].Text;

      Seta();

      FamiliaProduto02.ShowModal;
      FamiliaProduto02.Destroy;

      FamiliaProduto00.Visible := True;

      ConexaoBD.SQL_Familia_Produto.Locate('fb_familia_produto_codigo',Trim(Selecionado),[]);
    End;
end;

procedure TFamiliaProduto00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     FamiliaProduto00 := Nil;
end;

end.
