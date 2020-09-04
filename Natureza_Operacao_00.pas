unit Natureza_Operacao_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TNaturezaOperacao00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Natureza: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Natureza_Operacao_Observacao_Nota: TDBMemo;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_NaturezaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NaturezaOperacao00: TNaturezaOperacao00;

implementation

uses Conexao_BD, Rotinas_Gerais, Depto_01, Depto_02, Ibrasmak_00, Depto_00,
  Natureza_Operacao_01, Natureza_Operacao_02;

var Selecionado: string;

{$R *.dfm}

procedure TNaturezaOperacao00.BT_SairClick(Sender: TObject);
begin
     NaturezaOperacao00.Close;
end;

procedure TNaturezaOperacao00.BT_IncluirClick(Sender: TObject);
begin
     NaturezaOperacao00.Visible := False;

     Application.CreateForm(TNaturezaOperacao01,NaturezaOperacao01);
     NaturezaOperacao01.ShowModal;
     NaturezaOperacao01.Destroy;

     NaturezaOperacao00.Visible := True;
end;

procedure TNaturezaOperacao00.FormShow(Sender: TObject);
begin
    ConexaoBD.SQL_Natureza_Operacao.SQL.Clear;
    ConexaoBD.SQL_Natureza_Operacao.SQL.Add('Select * from fb_naturezas_operacao Order By fb_natureza_operacao_nro');
    ConexaoBD.SQL_Natureza_Operacao.Open;
end;

procedure TNaturezaOperacao00.DBGrid_NaturezaCellClick(Column: TColumn);
begin
    If DBGrid_Natureza.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Natureza.Fields[0].Text;

      NaturezaOperacao00.Visible := False;

      Ampulheta();
      Application.CreateForm(TNaturezaOperacao02,NaturezaOperacao02);

      NaturezaOperacao02.Natureza_Operacao_Numero.Text          := DBGrid_Natureza.Fields[0].Text;
      NaturezaOperacao02.Natureza_Operacao_Descricao_Curta.Text := DBGrid_Natureza.Fields[1].Text;
      NaturezaOperacao02.Natureza_Operacao_CFOP.Text            := DBGrid_Natureza.Fields[2].Text;
      NaturezaOperacao02.Natureza_Operacao_Descricao_Longa.Text := DBGrid_Natureza.Fields[3].Text;
      NaturezaOperacao02.Natureza_Operacao_Revenda.Checked      := StrToBool(DBGrid_Natureza.Fields[5].Text);

      NaturezaOperacao02.Natureza_Operacao_Observacao_Nota.Lines.Clear;
      NaturezaOperacao02.Natureza_Operacao_Observacao_Nota.Lines.Add(Natureza_Operacao_Observacao_Nota.Text);

      Seta();

      NaturezaOperacao02.ShowModal;
      NaturezaOperacao02.Destroy;

      NaturezaOperacao00.Visible := True;     

      ConexaoBD.SQL_Natureza_Operacao.Locate('fb_natureza_operacao_nro',Trim(Selecionado),[]);
    End;
end;

end.
