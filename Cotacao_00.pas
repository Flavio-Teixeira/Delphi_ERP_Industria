unit Cotacao_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TCotacao00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Grupos: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBGrid_GruposCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cotacao00: TCotacao00;

implementation

uses Conexao_BD, Rotinas_Gerais, Cotacao_01, Cotacao_02;

{$R *.dfm}

procedure TCotacao00.BT_SairClick(Sender: TObject);
begin
     Cotacao00.Close;
end;

procedure TCotacao00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TCotacao00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Grupo_Cotacao.Close;
    ConexaoBD.SQL_Grupo_Cotacao.SQL.Clear;
    ConexaoBD.SQL_Grupo_Cotacao.SQL.Add('Select * from fb_grupos_cotacoes Order By fb_grupo_cotacao_data Desc, fb_grupo_cotacao_nro Desc');
    ConexaoBD.SQL_Grupo_Cotacao.Open;
end;

procedure TCotacao00.BT_IncluirClick(Sender: TObject);
begin
     Cotacao00.Visible := False;

     Application.CreateForm(TCotacao01,Cotacao01);
     Cotacao01.ShowModal;
     Cotacao01.Destroy;

     Cotacao00.Visible := True;
end;

procedure TCotacao00.DBGrid_GruposCellClick(Column: TColumn);
var Selecionado: string;
begin
    If DBGrid_Grupos.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Grupos.Fields[0].Text;

      Cotacao00.Visible := False;

      Application.CreateForm(TCotacao02,Cotacao02);

      Cotacao02.ShowModal;
      Cotacao02.Destroy;

      Cotacao00.Visible := True;   

      ConexaoBD.SQL_Grupo_Cotacao.Locate('fb_grupo_cotacao_nro',Trim(Selecionado),[]);
    End;
end;

end.
