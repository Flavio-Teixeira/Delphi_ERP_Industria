unit Notas_Fiscais_Saidas_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TNotasFiscaisSaidas03 = class(TForm)
    Panel1: TPanel;
    Label24: TLabel;
    Qtde_Volume: TEdit;
    Label25: TLabel;
    Especie: TEdit;
    Label26: TLabel;
    Marca: TEdit;
    Label27: TLabel;
    Peso_Bruto: TEdit;
    Peso_Liquido: TEdit;
    Label36: TLabel;
    Label1: TLabel;
    BT_Ok: TBitBtn;
    Retorno: TEdit;
    procedure Qtde_VolumeKeyPress(Sender: TObject; var Key: Char);
    procedure EspecieKeyPress(Sender: TObject; var Key: Char);
    procedure MarcaKeyPress(Sender: TObject; var Key: Char);
    procedure Peso_BrutoKeyPress(Sender: TObject; var Key: Char);
    procedure Peso_LiquidoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotasFiscaisSaidas03: TNotasFiscaisSaidas03;

implementation

uses Conexao_BD, Rotinas_Gerais, Notas_Fiscais_Saidas_01,
  Notas_Fiscais_Saidas_02;

{$R *.dfm}

procedure TNotasFiscaisSaidas03.Qtde_VolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas03.EspecieKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas03.MarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas03.Peso_BrutoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas03.Peso_LiquidoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas03.BT_OkClick(Sender: TObject);
begin
    if Retorno.Text = 'Notas_Fiscais_Saidas_02' Then begin

        NotasFiscaisSaidas02.Qtde_Volume.Text  := Qtde_Volume.Text;
        NotasFiscaisSaidas02.Especie.Text      := Especie.Text;
        NotasFiscaisSaidas02.Marca.Text        := Marca.Text;
        NotasFiscaisSaidas02.Peso_Bruto.Text   := Peso_Bruto.Text;
        NotasFiscaisSaidas02.Peso_Liquido.Text := Peso_Liquido.Text;

        NotasFiscaisSaidas03.Close;
        end
    Else begin
        NotasFiscaisSaidas01.Qtde_Volume.Text  := Qtde_Volume.Text;
        NotasFiscaisSaidas01.Especie.Text      := Especie.Text;
        NotasFiscaisSaidas01.Marca.Text        := Marca.Text;
        NotasFiscaisSaidas01.Peso_Bruto.Text   := Peso_Bruto.Text;
        NotasFiscaisSaidas01.Peso_Liquido.Text := Peso_Liquido.Text;

        NotasFiscaisSaidas03.Close;
    End;
end;

end.
