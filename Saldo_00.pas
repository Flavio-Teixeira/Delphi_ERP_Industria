unit Saldo_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TSaldo00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Saldos: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Label41: TLabel;
    Saldo_Conta: TComboBox;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_SaldosCellClick(Column: TColumn);
    procedure Saldo_ContaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Saldo00: TSaldo00;

implementation

uses Conexao_BD, Rotinas_Gerais, Saldo_01, Saldo_02, Ibrasmak_00;

{$R *.dfm}

procedure TSaldo00.BT_SairClick(Sender: TObject);
begin
     Saldo00.Close;
end;

procedure TSaldo00.BT_IncluirClick(Sender: TObject);
begin
     Saldo00.Visible := False;

     Application.CreateForm(TSaldo01,Saldo01);

     Saldo01.Saldo_Conta.Caption := Trim(Saldo_Conta.Text);

     Saldo01.ShowModal;
     Saldo01.Destroy;

     Saldo00.Visible := True;
end;

procedure TSaldo00.FormShow(Sender: TObject);

var
   Nro_Conta: String;

begin
    If Trim(Saldo_Conta.Text) = '' Then
       Begin
       ConexaoBD.SQL_FB_Conta_Bancaria.Close;
       ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Clear;
       ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Add('Select * from fb_contas_bancarias Order By fb_conta_bancaria_banco, fb_conta_bancaria_nro');
       ConexaoBD.SQL_FB_Conta_Bancaria.Open;

       Saldo_Conta.Items.Clear;

       If ConexaoBD.SQL_FB_Conta_Bancaria.RecordCount > 0 Then
          Begin
          ConexaoBD.SQL_FB_Conta_Bancaria.First;

          While Not ConexaoBD.SQL_FB_Conta_Bancaria.Eof Do
                begin
                Saldo_Conta.Items.Add(Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_banco.Text) + ' - AG: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_agencia.Text) + ' - CC: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_conta.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_titular.Text));

                ConexaoBD.SQL_FB_Conta_Bancaria.Next;
          End;
       End;

       ConexaoBD.SQL_FB_Conta_Bancaria.Close;

       Saldo_Conta.ItemIndex := 0;
    End;

    Nro_Conta := Obtem_Nro_Antes_Traco(Saldo_Conta.Text);

    ConexaoBD.SQL_FB_Saldo.Close;
    ConexaoBD.SQL_FB_Saldo.SQL.Clear;
    ConexaoBD.SQL_FB_Saldo.SQL.Add('Select * from fb_saldos Where fb_saldo_conta = ' + Trim(Nro_Conta) + ' Order By fb_saldo_data Desc, fb_saldo_nro Desc');
    ConexaoBD.SQL_FB_Saldo.Open;
end;

procedure TSaldo00.DBGrid_SaldosCellClick(Column: TColumn);
var Selecionado: string;
begin
    If DBGrid_Saldos.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Saldos.Fields[2].Text;

      Saldo00.Visible := False;

      Ampulheta();
      Application.CreateForm(TSaldo02,Saldo02);

      Saldo02.Saldo_Conta.Caption := Trim(Saldo_Conta.Text);
      Saldo02.Saldo_Nro.Text      := DBGrid_Saldos.Fields[2].Text;
      Saldo02.Saldo_Data.Text     := DBGrid_Saldos.Fields[0].Text;
      Saldo02.Saldo_Valor.Text    := DBGrid_Saldos.Fields[1].Text;

      Seta();

      Saldo02.ShowModal;
      Saldo02.Destroy;

      Saldo00.Visible := True; 

      ConexaoBD.SQL_FB_Saldo.Locate('fb_saldo_nro',Trim(Selecionado),[]);
    End;
end;

procedure TSaldo00.Saldo_ContaChange(Sender: TObject);

var
   Nro_Conta: String;

begin
     Nro_Conta := Obtem_Nro_Antes_Traco(Saldo_Conta.Text);

     ConexaoBD.SQL_FB_Saldo.Close;
     ConexaoBD.SQL_FB_Saldo.SQL.Clear;
     ConexaoBD.SQL_FB_Saldo.SQL.Add('Select * from fb_saldos Where fb_saldo_conta = ' + Trim(Nro_Conta) + ' Order By fb_saldo_data Desc, fb_saldo_nro Desc');
     ConexaoBD.SQL_FB_Saldo.Open;
end;

end.
