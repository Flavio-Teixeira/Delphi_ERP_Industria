unit Usuario_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TUsuario00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Usuarios: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_UsuariosCellClick(Column: TColumn);
    procedure BT_IncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Usuario00: TUsuario00;

implementation

uses Conexao_BD, Rotinas_Gerais, Usuario_01, Usuario_02, Ibrasmak_00;

var Selecionado: string;

{$R *.dfm}

procedure TUsuario00.BT_SairClick(Sender: TObject);
begin
  Usuario00.Close;
end;

procedure TUsuario00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Senhas.Close;
    ConexaoBD.SQL_Senhas.SQL.Clear;
    ConexaoBD.SQL_Senhas.SQL.Add('Select * from senhas');
    ConexaoBD.SQL_Senhas.Open;

    DBGrid_Usuarios.Refresh;
end;

procedure TUsuario00.DBGrid_UsuariosCellClick(Column: TColumn);

begin
  if Trim(DBGrid_Usuarios.Fields[0].Text) <> '' Then begin
    Selecionado := DBGrid_Usuarios.Fields[0].Text;

    Application.CreateForm(TUsuario02,Usuario02);

    Usuario02.Login.Text := Trim(DBGrid_Usuarios.Fields[0].Text);               

    Usuario00.Visible := False;
    Usuario02.ShowModal;
    Usuario02.Destroy;
    Usuario00.Visible := True;     

    ConexaoBD.SQL_Senhas.Locate('senha_usuario',Trim(Selecionado),[]);
  end;
end;

procedure TUsuario00.BT_IncluirClick(Sender: TObject);
begin
  Application.CreateForm(TUsuario01, Usuario01);
  Usuario00.Visible := False;
  Usuario01.ShowModal;
  Usuario01.Destroy;
  Usuario00.Visible := True;
end;

end.
