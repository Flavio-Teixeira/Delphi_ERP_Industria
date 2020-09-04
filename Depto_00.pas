unit Depto_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TDepto00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Depto: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_DeptoCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Depto00: TDepto00;

implementation

uses Conexao_BD, Rotinas_Gerais, Depto_01, Depto_02, Ibrasmak_00;

var Selecionado: string;

{$R *.dfm}

procedure TDepto00.BT_SairClick(Sender: TObject);
begin
     Depto00.Close;
end;

procedure TDepto00.BT_IncluirClick(Sender: TObject);
begin
     Depto00.Visible := False;

     Application.CreateForm(TDepto01,Depto01);
     Depto01.ShowModal;
     Depto01.Destroy;

     Depto00.Visible := True;
end;

procedure TDepto00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Depto.SQL.Clear;
    ConexaoBD.SQL_Depto.SQL.Add('Select * from fb_depto Order By fb_depto_numero');
    ConexaoBD.SQL_Depto.Open;
end;

procedure TDepto00.DBGrid_DeptoCellClick(Column: TColumn);
begin
    If DBGrid_Depto.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Depto.Fields[0].Text;
      
      Depto00.Visible := False;

      Ampulheta();
      Application.CreateForm(TDepto02,Depto02);

      Depto02.Depto_Numero.Text    := DBGrid_Depto.Fields[0].Text;
      Depto02.Depto_Descricao.Text := DBGrid_Depto.Fields[1].Text;

      Seta();

      Depto02.ShowModal;
      Depto02.Destroy;

      Depto00.Visible := True;     

      ConexaoBD.SQL_Depto.Locate('fb_depto_numero',Trim(Selecionado),[]);
    End;
end;

end.
