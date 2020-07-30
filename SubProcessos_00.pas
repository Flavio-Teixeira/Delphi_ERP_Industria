unit SubProcessos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TSubProcessos00 = class(TForm)
    Panel2: TPanel;
    DBGrid_SubProcessos: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Programa_Anterior: TEdit;
    Produto_Codigo: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_SubProcessosCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SubProcessos00: TSubProcessos00;

implementation

uses Conexao_BD, Rotinas_Gerais, SubProcessos_01, SubProcessos_02, Ibrasmak_00,
  Adiciona_Estrutura_00;

var Selecionado: string;

{$R *.dfm}

procedure TSubProcessos00.BT_SairClick(Sender: TObject);
begin
     SubProcessos00.Close;
end;

procedure TSubProcessos00.BT_IncluirClick(Sender: TObject);
begin
     SubProcessos00.Visible := False;

     Application.CreateForm(TSubProcessos01,SubProcessos01);
     SubProcessos01.ShowModal;
     SubProcessos01.Destroy;

     SubProcessos00.Visible := True;
end;

procedure TSubProcessos00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_SubProcessos.SQL.Clear;
    ConexaoBD.SQL_SubProcessos.SQL.Add('Select * from fb_subprocessos Order By fb_subprocesso_codigo');
    ConexaoBD.SQL_SubProcessos.Open;
end;

procedure TSubProcessos00.DBGrid_SubProcessosCellClick(Column: TColumn);
begin
    If DBGrid_SubProcessos.Fields[0].Text <> '' Then Begin

        If Trim(Programa_Anterior.Text) = '' Then
           Begin
           Selecionado := DBGrid_SubProcessos.Fields[0].Text;

           SubProcessos00.Visible := False;

           Ampulheta();
           Application.CreateForm(TSubProcessos02,SubProcessos02);

           SubProcessos02.SubProcesso_Codigo.Text    := DBGrid_SubProcessos.Fields[0].Text;
           SubProcessos02.SubProcesso_Descricao.Text := DBGrid_SubProcessos.Fields[1].Text;

           Seta();

           SubProcessos02.ShowModal;
           SubProcessos02.Destroy;

           SubProcessos00.Visible := True;

           ConexaoBD.SQL_SubProcessos.Locate('fb_subprocesso_codigo',Trim(Selecionado),[]);
           End
        Else
           Begin 
           Ampulheta();

           //*** Seleciona as Estruturas de Produtos para Gerar a Sequência ***

           ConexaoBD.SQL_Produtos_Estruturas.Close;
           ConexaoBD.SQL_Produtos_Estruturas.SQL.Clear;
           ConexaoBD.SQL_Produtos_Estruturas.SQL.Add('Select * from fb_produtos_estruturas Where fb_produto_estrutura_codigo = '+#39+Trim(Produto_Codigo.Text)+#39+' Order By fb_produto_estrutura_sequencia');
           ConexaoBD.SQL_Produtos_Estruturas.Open;

           //*** Abre a Tela de Estruturas ***

           Application.CreateForm(TAdicionaEstrutura00,AdicionaEstrutura00);

           AdicionaEstrutura00.fb_produto_estrutura_codigo.Text             := Trim(Produto_Codigo.Text);
           AdicionaEstrutura00.fb_produto_estrutura_item_codigo.Text        := Trim(DBGrid_SubProcessos.Fields[0].Text);
           AdicionaEstrutura00.fb_produto_estrutura_descricao.Text          := '------ '+Trim(DBGrid_SubProcessos.Fields[1].Text);
           AdicionaEstrutura00.fb_produto_estrutura_sequencia.Text          := IntToStr((ConexaoBD.SQL_Produtos_Estruturas.RecordCount + 1));
           AdicionaEstrutura00.fb_produto_estrutura_qtde.Text               := '1';
           AdicionaEstrutura00.fb_produto_estrutura_medida.Text             := '';
           AdicionaEstrutura00.fb_produto_estrutura_tipo.Text               := 'SP';
           AdicionaEstrutura00.fb_produto_estrutura_custo.ItemIndex         := 0;
           AdicionaEstrutura00.fb_produto_estrutura_vlr_custo_unitario.Text := '0,00';

           AdicionaEstrutura00.BT_Incluir.Enabled := True;
           AdicionaEstrutura00.BT_Alterar.Enabled := False;
           AdicionaEstrutura00.BT_Excluir.Enabled := False;

           Seta();
           
           AdicionaEstrutura00.ShowModal;
           AdicionaEstrutura00.Destroy;
        End;

    End;
end;

procedure TSubProcessos00.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     SubProcessos00 := Nil;
end;

end.
