unit Requisicao_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TRequisicao00 = class(TForm)
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
  Requisicao00: TRequisicao00;

implementation

uses Conexao_BD, Rotinas_Gerais, Requisicao_01, Requisicao_02;

{$R *.dfm}

procedure TRequisicao00.BT_SairClick(Sender: TObject);
begin
     Requisicao00.Close;
end;

procedure TRequisicao00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRequisicao00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Grupo_Requisicao.Close;
    ConexaoBD.SQL_Grupo_Requisicao.SQL.Clear;
    ConexaoBD.SQL_Grupo_Requisicao.SQL.Add('Select * from fb_grupos_requisicoes Order By fb_grupo_requisicao_data Desc, fb_grupo_requisicao_nro Desc');
    ConexaoBD.SQL_Grupo_Requisicao.Open;
end;

procedure TRequisicao00.BT_IncluirClick(Sender: TObject);
begin
     Requisicao00.Visible := False;

     Application.CreateForm(TRequisicao01,Requisicao01);
     Requisicao01.ShowModal;
     Requisicao01.Destroy;

     Requisicao00.Visible := True;
end;

procedure TRequisicao00.DBGrid_GruposCellClick(Column: TColumn);
var Selecionado: string;
begin
    If DBGrid_Grupos.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Grupos.Fields[0].Text;

      Requisicao00.Visible := False;

      Application.CreateForm(TRequisicao02,Requisicao02);

      Requisicao02.ShowModal;
      Requisicao02.Destroy;

      Requisicao00.Visible := True;   

      ConexaoBD.SQL_Grupo_Requisicao.Locate('fb_grupo_requisicao_nro',Trim(Selecionado),[]);
    End;
end;

end.
