unit Etapas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TEtapas00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Etapas: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Programa_Anterior: TEdit;
    Produto_Codigo: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_EtapasCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Etapas00: TEtapas00;

implementation

uses Conexao_BD, Rotinas_Gerais, Etapas_01, Etapas_02, Ibrasmak_00,
  Adiciona_Estrutura_00;

var Selecionado: string;

{$R *.dfm}

procedure TEtapas00.BT_SairClick(Sender: TObject);
begin
     Etapas00.Close;
end;

procedure TEtapas00.BT_IncluirClick(Sender: TObject);
begin
     Etapas00.Visible := False;

     Application.CreateForm(TEtapas01,Etapas01);
     Etapas01.ShowModal;
     Etapas01.Destroy;

     Etapas00.Visible := True;
end;

procedure TEtapas00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Etapas.SQL.Clear;
    ConexaoBD.SQL_Etapas.SQL.Add('Select * from fb_etapas Order By fb_etapa_codigo');
    ConexaoBD.SQL_Etapas.Open;
end;

procedure TEtapas00.DBGrid_EtapasCellClick(Column: TColumn);
begin
    If DBGrid_Etapas.Fields[0].Text <> '' Then Begin

        If Trim(Programa_Anterior.Text) = '' Then
           Begin
           Selecionado := DBGrid_Etapas.Fields[0].Text;

           Etapas00.Visible := False;

           Ampulheta();
           Application.CreateForm(TEtapas02,Etapas02);

           Etapas02.Etapa_Codigo.Text    := DBGrid_Etapas.Fields[0].Text;
           Etapas02.Etapa_Descricao.Text := DBGrid_Etapas.Fields[1].Text;

           Seta();

           Etapas02.ShowModal;
           Etapas02.Destroy;

           Etapas00.Visible := True;

           ConexaoBD.SQL_Etapas.Locate('fb_etapa_codigo',Trim(Selecionado),[]);
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
           AdicionaEstrutura00.fb_produto_estrutura_item_codigo.Text        := Trim(DBGrid_Etapas.Fields[0].Text);
           AdicionaEstrutura00.fb_produto_estrutura_descricao.Text          := Trim(DBGrid_Etapas.Fields[1].Text);
           AdicionaEstrutura00.fb_produto_estrutura_sequencia.Text          := IntToStr((ConexaoBD.SQL_Produtos_Estruturas.RecordCount + 1));
           AdicionaEstrutura00.fb_produto_estrutura_qtde.Text               := '1';
           AdicionaEstrutura00.fb_produto_estrutura_medida.Text             := '';
           AdicionaEstrutura00.fb_produto_estrutura_tipo.Text               := 'ET';
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

procedure TEtapas00.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Etapas00 := Nil;
end;

end.
