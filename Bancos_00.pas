unit Bancos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TBancos00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Bancos: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_BancosCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Bancos00: TBancos00;

implementation

uses Conexao_BD, Rotinas_Gerais, Bancos_01, Bancos_02, Ibrasmak_00;

var Selecionado: string;

{$R *.dfm}

procedure TBancos00.BT_SairClick(Sender: TObject);
begin
     Bancos00.Close;
end;

procedure TBancos00.BT_IncluirClick(Sender: TObject);
begin
     Bancos00.Visible := False;

     Application.CreateForm(TBancos01,Bancos01);
     Bancos01.ShowModal;
     Bancos01.Destroy;

     Bancos00.Visible := True;
end;

procedure TBancos00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Bancos.SQL.Clear;
    ConexaoBD.SQL_Bancos.SQL.Add('Select * from fb_bancos Order By fb_banco_codigo');
    ConexaoBD.SQL_Bancos.Open;
end;

procedure TBancos00.DBGrid_BancosCellClick(Column: TColumn);
begin
    If DBGrid_Bancos.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Bancos.Fields[0].Text;
      
      Bancos00.Visible := False;

      Ampulheta();
      Application.CreateForm(TBancos02,Bancos02);

      Bancos02.Banco_Codigo.Text    := DBGrid_Bancos.Fields[0].Text;
      Bancos02.Banco_Descricao.Text := DBGrid_Bancos.Fields[1].Text;

      Seta();

      Bancos02.ShowModal;
      Bancos02.Destroy;

      Bancos00.Visible := True;     

      ConexaoBD.SQL_Bancos.Locate('fb_banco_codigo',Trim(Selecionado),[]);
    End;
end;

procedure TBancos00.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Bancos00 := Nil;
end;

end.
