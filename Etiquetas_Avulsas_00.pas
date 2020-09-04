unit Etiquetas_Avulsas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImpMat, Buttons, ExtCtrls;

type
  TEtiquetasAvulsas00 = class(TForm)
    Panel3: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Imprimir: TImpMat;
    Panel6: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    Linha_Avulsa_1: TEdit;
    Linha_Avulsa_2: TEdit;
    Linha_Avulsa_3: TEdit;
    Linha_Avulsa_4: TEdit;
    Linha_Avulsa_5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label9: TLabel;
    Avulsas_Qtde: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure Avulsas_QtdeKeyPress(Sender: TObject; var Key: Char);
    procedure Linha_Avulsa_1KeyPress(Sender: TObject; var Key: Char);
    procedure Linha_Avulsa_2KeyPress(Sender: TObject; var Key: Char);
    procedure Linha_Avulsa_3KeyPress(Sender: TObject; var Key: Char);
    procedure Linha_Avulsa_4KeyPress(Sender: TObject; var Key: Char);
    procedure Linha_Avulsa_5KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EtiquetasAvulsas00: TEtiquetasAvulsas00;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TEtiquetasAvulsas00.BT_SairClick(Sender: TObject);
begin
     EtiquetasAvulsas00.Close;
end;

procedure TEtiquetasAvulsas00.BT_ImprimirClick(Sender: TObject);

var
   Linha, Posicao_Inicial, Posicao_Final: Integer;

begin
     If ((Trim(Linha_Avulsa_1.Text) <> '') Or (Trim(Linha_Avulsa_2.Text) <> '') Or (Trim(Linha_Avulsa_3.Text) <> '') Or (Trim(Linha_Avulsa_4.Text) <> '') Or (Trim(Linha_Avulsa_5.Text) <> '')) And (Trim(Avulsas_Qtde.Text) <> '') Then
        Begin

        //*** Posiciona da Etiqueta ***

        Ampulheta();

        Linha := 1;
        Imprimir.PoeStr(Linha,001, #27#15 + '***********************************************************************');

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,001, '**********************************************************************');

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,001, '**********************************************************************');

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,001, '**********************************************************************');

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,001, '**********************************************************************');

        Imprimir.ImprimeJob;
        Imprimir.LimpaBuffer;

        Seta();

        While Confirma('A Posição está Correta ?') <> 6 Do
              Begin
              Ampulheta();

              Linha := 1;
              Imprimir.PoeStr(Linha,001, #27#15 + '***********************************************************************');

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, '**********************************************************************');

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, '**********************************************************************');

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, '**********************************************************************');

              Linha := Linha + 1;
              Imprimir.PoeStr(Linha,001, '**********************************************************************');

              Imprimir.ImprimeJob;
              Imprimir.LimpaBuffer;

              Seta();
        End;

        Ampulheta();

        //*** Impressão da Etiqueta ***

        Posicao_Final := StrToInt(Avulsas_Qtde.Text);

        For Posicao_Inicial := 1 To Posicao_Final do
            Begin
            Linha := 1;
            Imprimir.PoeStr(Linha,001, Copy(Linha_Avulsa_1.Text,1,70) );

            Linha := Linha + 1;
            Imprimir.PoeStr(Linha,001, Copy(Linha_Avulsa_2.Text,1,70) );

            Linha := Linha + 1;
            Imprimir.PoeStr(Linha,001, Copy(Linha_Avulsa_3.Text,1,70) );

            Linha := Linha + 1;
            Imprimir.PoeStr(Linha,001, Copy(Linha_Avulsa_4.Text,1,70) );

            Linha := Linha + 1;
            Imprimir.PoeStr(Linha,001, Copy(Linha_Avulsa_5.Text,1,70) );

            Imprimir.ImprimeJob;
            Imprimir.LimpaBuffer;
        End;

        Seta();

        End
     Else
        Begin
        MSG_Erro('Dados para impressão não foram preenchidos');

        Linha_Avulsa_1.SetFocus;
     End;
end;

procedure TEtiquetasAvulsas00.Avulsas_QtdeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtiquetasAvulsas00.Linha_Avulsa_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtiquetasAvulsas00.Linha_Avulsa_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtiquetasAvulsas00.Linha_Avulsa_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtiquetasAvulsas00.Linha_Avulsa_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtiquetasAvulsas00.Linha_Avulsa_5KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TEtiquetasAvulsas00.FormShow(Sender: TObject);
begin
    Linha_Avulsa_1.Text := '';
    Linha_Avulsa_2.Text := '';
    Linha_Avulsa_3.Text := '';
    Linha_Avulsa_4.Text := '';
    Linha_Avulsa_5.Text := '';

    Linha_Avulsa_1.SetFocus;
end;

procedure TEtiquetasAvulsas00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

end.
