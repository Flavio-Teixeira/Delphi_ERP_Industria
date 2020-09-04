unit Processos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TProcessos00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Processos: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Programa_Anterior: TEdit;
    Produto_Codigo: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_ProcessosCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Processos00: TProcessos00;

implementation

uses Conexao_BD, Rotinas_Gerais, Processos_01, Processos_02, Ibrasmak_00,
  Adiciona_Estrutura_00;

var Selecionado: string;

{$R *.dfm}

procedure TProcessos00.BT_SairClick(Sender: TObject);
begin
     Processos00.Close;
end;

procedure TProcessos00.BT_IncluirClick(Sender: TObject);
begin
     Processos00.Visible := False;

     Application.CreateForm(TProcessos01,Processos01);
     Processos01.ShowModal;
     Processos01.Destroy;

     Processos00.Visible := True;
end;

procedure TProcessos00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Processos.SQL.Clear;
    ConexaoBD.SQL_Processos.SQL.Add('Select * from fb_processos Order By fb_processo_codigo');
    ConexaoBD.SQL_Processos.Open;
end;

procedure TProcessos00.DBGrid_ProcessosCellClick(Column: TColumn);
begin
    If DBGrid_Processos.Fields[0].Text <> '' Then Begin

        If Trim(Programa_Anterior.Text) = '' Then
           Begin
           Selecionado := DBGrid_Processos.Fields[0].Text;

           Processos00.Visible := False;

           Ampulheta();
           Application.CreateForm(TProcessos02,Processos02);

           Processos02.Processo_Codigo.Text    := DBGrid_Processos.Fields[0].Text;
           Processos02.Processo_Descricao.Text := DBGrid_Processos.Fields[1].Text;

           Seta();

           Processos02.ShowModal;
           Processos02.Destroy;

           Processos00.Visible := True;

           ConexaoBD.SQL_Processos.Locate('fb_processo_codigo',Trim(Selecionado),[]);
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
           AdicionaEstrutura00.fb_produto_estrutura_item_codigo.Text        := Trim(DBGrid_Processos.Fields[0].Text);
           AdicionaEstrutura00.fb_produto_estrutura_descricao.Text          := '--- '+Trim(DBGrid_Processos.Fields[1].Text);
           AdicionaEstrutura00.fb_produto_estrutura_sequencia.Text          := IntToStr((ConexaoBD.SQL_Produtos_Estruturas.RecordCount + 1));
           AdicionaEstrutura00.fb_produto_estrutura_qtde.Text               := '1';
           AdicionaEstrutura00.fb_produto_estrutura_medida.Text             := '';
           AdicionaEstrutura00.fb_produto_estrutura_tipo.Text               := 'PR';
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

procedure TProcessos00.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Processos00 := Nil;
end;

end.
