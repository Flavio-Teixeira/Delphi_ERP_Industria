unit Conta_Bancaria_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TContaBancaria00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Conta: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_ContaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContaBancaria00: TContaBancaria00;

implementation

uses Conexao_BD, Rotinas_Gerais, Conta_Bancaria_01, Conta_Bancaria_02, Ibrasmak_00;

var Selecionado: string;

{$R *.dfm}

procedure TContaBancaria00.BT_SairClick(Sender: TObject);
begin
     ContaBancaria00.Close;
end;

procedure TContaBancaria00.BT_IncluirClick(Sender: TObject);
begin
     ContaBancaria00.Visible := False;

     Application.CreateForm(TContaBancaria01,ContaBancaria01);
     ContaBancaria01.ShowModal;
     ContaBancaria01.Destroy;

     ContaBancaria00.Visible := True;
end;

procedure TContaBancaria00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Clear;
    ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Add('Select * from fb_contas_bancarias Order By fb_conta_bancaria_banco, fb_conta_bancaria_nro');
    ConexaoBD.SQL_FB_Conta_Bancaria.Open;
end;

procedure TContaBancaria00.DBGrid_ContaCellClick(Column: TColumn);
begin
    If DBGrid_Conta.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Conta.Fields[0].Text;

      ContaBancaria00.Visible := False;

      Ampulheta();   
      Application.CreateForm(TContaBancaria02,ContaBancaria02);

      ContaBancaria02.Conta_Bancaria_Nro.Text     := DBGrid_Conta.Fields[0].Text;
      ContaBancaria02.Conta_Bancaria_Banco.Text   := DBGrid_Conta.Fields[1].Text;
      ContaBancaria02.Conta_Bancaria_Agencia.Text := DBGrid_Conta.Fields[2].Text;
      ContaBancaria02.Conta_Bancaria_Conta.Text   := DBGrid_Conta.Fields[3].Text;
      ContaBancaria02.Conta_Bancaria_Titular.Text := DBGrid_Conta.Fields[4].Text;

      Seta();

      ContaBancaria02.ShowModal;
      ContaBancaria02.Destroy;

      ContaBancaria00.Visible := True;

      ConexaoBD.SQL_FB_Conta_Bancaria.Locate('fb_conta_bancaria_nro',Trim(Selecionado),[]);
    End;
end;

end.
