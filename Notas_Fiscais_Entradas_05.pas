unit Notas_Fiscais_Entradas_05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TNotasFiscaisEntradas05 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Adiciona_Descricao: TEdit;
    Adiciona_Vlr_Total: TEdit;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Programa_Anterior: TEdit;
    Nro_Fornecedor: TEdit;
    Adiciona_ARow: TEdit;
    Adiciona_Vencimento: TMaskEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Adiciona_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_VencimentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Adiciona_Vlr_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure Adiciona_Vlr_TotalExit(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotasFiscaisEntradas05: TNotasFiscaisEntradas05;

implementation

uses Notas_Fiscais_Entradas_01, Conexao_BD, Rotinas_Gerais,
  Notas_Fiscais_Entradas_02;

{$R *.dfm}

procedure TNotasFiscaisEntradas05.BT_SairClick(Sender: TObject);
begin
     NotasFiscaisEntradas05.Close;
end;

procedure TNotasFiscaisEntradas05.Adiciona_DescricaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas05.Adiciona_VencimentoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas05.Adiciona_Vlr_TotalKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisEntradas05.Adiciona_Vlr_TotalExit(Sender: TObject);
begin
     If Trim(Adiciona_Vlr_Total.Text) = '' Then
        Begin
        Adiciona_Vlr_Total.Text := '0,00';
     End;
end;

procedure TNotasFiscaisEntradas05.BT_IncluirClick(Sender: TObject);

var
   Ind: Integer;

begin

//*** Inclusão ***

     If Trim(Programa_Anterior.Text) = 'Entrada-Inclusao' Then
        Begin
        If Trim(Adiciona_Descricao.Text) = '' Then
           Begin
           Ind := NotasFiscaisEntradas01.SGD_Vencimentos.RowCount;

           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[0, (Ind - 1)]  := '';
           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[1, (Ind - 1)]  := '';
           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[2, (Ind - 1)]  := '';

           Adiciona_Descricao.Text  := '';
           Adiciona_Vencimento.Text := '';
           Adiciona_Vlr_Total.Text  := '0,00';

           NotasFiscaisEntradas01.SGD_Vencimentos.Refresh;
           NotasFiscaisEntradas05.Close;
           End
        Else
           Begin
           Ind := NotasFiscaisEntradas01.SGD_Vencimentos.RowCount;

           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[0, (Ind - 1)] := Adiciona_Descricao.Text;
           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[1, (Ind - 1)] := Adiciona_Vencimento.Text;
           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[2, (Ind - 1)] := Adiciona_Vlr_Total.Text;

           Adiciona_Descricao.Text  := '';
           Adiciona_Vencimento.Text := '';
           Adiciona_Vlr_Total.Text  := '0,00';

           NotasFiscaisEntradas01.SGD_Vencimentos.RowCount := Ind + 1;
           NotasFiscaisEntradas01.SGD_Vencimentos.Row      := Ind - 1;
           NotasFiscaisEntradas01.SGD_Vencimentos.Refresh;

           Adiciona_Descricao.SetFocus;
        End;
        End
     Else If Trim(Programa_Anterior.Text) = 'Entrada-Inclusao-Alteracao' Then
        Begin
        If Trim(Adiciona_Descricao.Text) = '' Then
           Begin
           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[0,StrToInt(Adiciona_ARow.Text)]  := '';
           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[1,StrToInt(Adiciona_ARow.Text)]  := '';
           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[2,StrToInt(Adiciona_ARow.Text)]  := '';

           Adiciona_Descricao.Text  := '';
           Adiciona_Vencimento.Text := '';
           Adiciona_Vlr_Total.Text  := '0,00';

           NotasFiscaisEntradas01.SGD_Vencimentos.Refresh;
           NotasFiscaisEntradas05.Close;
           End
        Else
           Begin
           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[0, StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;
           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[1, StrToInt(Adiciona_ARow.Text)] := Adiciona_Vencimento.Text;
           NotasFiscaisEntradas01.SGD_Vencimentos.Cells[2, StrToInt(Adiciona_ARow.Text)] := Adiciona_Vlr_Total.Text;

           Adiciona_Descricao.Text  := '';
           Adiciona_Vencimento.Text := '';
           Adiciona_Vlr_Total.Text  := '0,00';

           NotasFiscaisEntradas01.SGD_Vencimentos.Refresh;
           NotasFiscaisEntradas05.Close;
        End;
        End

//*** Alteracao ***

     Else If Trim(Programa_Anterior.Text) = 'Entrada-Alteracao' Then
        Begin
        If Trim(Adiciona_Descricao.Text) = '' Then
           Begin
           Ind := NotasFiscaisEntradas02.SGD_Vencimentos.RowCount;

           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[0, (Ind - 1)]  := '';
           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[1, (Ind - 1)]  := '';
           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[2, (Ind - 1)]  := '';

           Adiciona_Descricao.Text  := '';
           Adiciona_Vencimento.Text := '';
           Adiciona_Vlr_Total.Text  := '0,00';

           NotasFiscaisEntradas02.SGD_Vencimentos.Refresh;
           NotasFiscaisEntradas05.Close;
           End
        Else
           Begin
           Ind := NotasFiscaisEntradas02.SGD_Vencimentos.RowCount;

           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[0, (Ind - 1)] := Adiciona_Descricao.Text;
           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[1, (Ind - 1)] := Adiciona_Vencimento.Text;
           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[2, (Ind - 1)] := Adiciona_Vlr_Total.Text;

           Adiciona_Descricao.Text  := '';
           Adiciona_Vencimento.Text := '';
           Adiciona_Vlr_Total.Text  := '0,00';

           NotasFiscaisEntradas02.SGD_Vencimentos.RowCount := Ind + 1;
           NotasFiscaisEntradas02.SGD_Vencimentos.Row      := Ind - 1;
           NotasFiscaisEntradas02.SGD_Vencimentos.Refresh;

           Adiciona_Descricao.SetFocus;
        End;
        End
     Else If Trim(Programa_Anterior.Text) = 'Entrada-Alteracao-Alteracao' Then
        Begin
        If Trim(Adiciona_Descricao.Text) = '' Then
           Begin
           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[0,StrToInt(Adiciona_ARow.Text)]  := '';
           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[1,StrToInt(Adiciona_ARow.Text)]  := '';
           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[2,StrToInt(Adiciona_ARow.Text)]  := '';

           Adiciona_Descricao.Text  := '';
           Adiciona_Vencimento.Text := '';
           Adiciona_Vlr_Total.Text  := '0,00';

           NotasFiscaisEntradas02.SGD_Vencimentos.Refresh;
           NotasFiscaisEntradas05.Close;
           End
        Else
           Begin
           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[0, StrToInt(Adiciona_ARow.Text)] := Adiciona_Descricao.Text;
           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[1, StrToInt(Adiciona_ARow.Text)] := Adiciona_Vencimento.Text;
           NotasFiscaisEntradas02.SGD_Vencimentos.Cells[2, StrToInt(Adiciona_ARow.Text)] := Adiciona_Vlr_Total.Text;

           Adiciona_Descricao.Text  := '';
           Adiciona_Vencimento.Text := '';
           Adiciona_Vlr_Total.Text  := '0,00';

           NotasFiscaisEntradas02.SGD_Vencimentos.Refresh;
           NotasFiscaisEntradas05.Close;
        End;
     End;
end;

procedure TNotasFiscaisEntradas05.FormShow(Sender: TObject);
begin
     Adiciona_Descricao.SetFocus;
end;

end.
