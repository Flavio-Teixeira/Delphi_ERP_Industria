unit Ordem_Despacho_V_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImpMat;

type
  TOrdemDespachoV00 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    BT_Imprimir: TBitBtn;
    Imprimir: TImpMat;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Linha_Avulsa_5: TEdit;
    Linha_Avulsa_4: TEdit;
    Linha_Avulsa_3: TEdit;
    Linha_Avulsa_2: TEdit;
    Linha_Avulsa_1: TEdit;
    BT_Procurar: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  OrdemDespachoV00: TOrdemDespachoV00;
  Nro_Nota, Nro_Pedido : String;

implementation

uses Conexao_BD, Rotinas_Gerais, Clientes_00;

{$R *.dfm}

procedure TOrdemDespachoV00.BT_SairClick(Sender: TObject);
begin
     OrdemDespachoV00.Close;
end;

procedure TOrdemDespachoV00.BT_ImprimirClick(Sender: TObject);

var
   Linha: Integer;

begin
     If Trim(Linha_Avulsa_1.Text) <> '' Then
        Begin

        Linha := 1;
        Imprimir.PoeStr(Linha,001, #14 + 'DESTINATARIO:');

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,001, #14 + '-------------');

        //*** Linha 1 ***

        Linha := Linha + 2;
        If (Length(Trim(Linha_Avulsa_1.Text)) > 40) Then
           Begin
           Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_1.Text,1,40));

           Linha := Linha + 1;
           Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_1.Text,41,40));
           End
        Else
           Begin
           Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_1.Text);
        End;

        //*** Linha 2 ***

        Linha := Linha + 2;
        If (Length(Trim(Linha_Avulsa_2.Text)) > 40) Then
           Begin
           Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_2.Text,1,40));

           Linha := Linha + 1;
           Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_2.Text,41,40));
           End
        Else
           Begin
           Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_2.Text);
        End;

        //*** Linha 3 ***

        Linha := Linha + 2;
        If (Length(Trim(Linha_Avulsa_3.Text)) > 40) Then
           Begin
           Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_3.Text,1,40));

           Linha := Linha + 1;
           Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_3.Text,41,40));
           End
        Else
           Begin
           Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_3.Text);
        End;

        //*** Linha 4 ***

        Linha := Linha + 2;
        If (Length(Trim(Linha_Avulsa_4.Text)) > 40) Then
           Begin
           Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_4.Text,1,40));

           Linha := Linha + 1;
           Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_4.Text,41,40));
           End
        Else
           Begin
           Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_4.Text);
        End;

        //*** Linha 5 ***

        Linha := Linha + 2;
        If (Length(Trim(Linha_Avulsa_5.Text)) > 40) Then
           Begin
           Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_5.Text,1,40));

           Linha := Linha + 1;
           Imprimir.PoeStr(Linha,001, #14 + Copy(Linha_Avulsa_5.Text,41,40));
           End
        Else
           Begin
           Imprimir.PoeStr(Linha,001, #14 + Linha_Avulsa_5.Text);
        End;

        Linha := Linha + 1;

        Linha := Linha + 3;
        Imprimir.PoeStr(Linha,001, #14 + 'REMETENTE:');

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,001, #14 + '----------');

        Linha := Linha + 2;
        Imprimir.PoeStr(Linha,001, #14 + 'IBRASMAK - IND. BRASILEIRA DE MÁQUINAS LTDA.');

        Linha := Linha + 2;
        Imprimir.PoeStr(Linha,001, #14 + 'ESTRADA DE SAPOPEMBA, 159 KM 45 - RIBEIRÃO PIRES - SP');

        Linha := Linha + 2;
        Imprimir.PoeStr(Linha,001, #14 + 'CEP: 09432-300');

        Imprimir.ImprimeJob;
        Imprimir.LimpaBuffer;

        End
     Else
        Begin
        MSG_Erro('Nro. do Docto não informado...');
     End;
end;

procedure TOrdemDespachoV00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();
     Application.CreateForm(TClientes00,Clientes00);

     Clientes00.Programa_Anterior.Text := 'Etiqueta-Sedex';

     Seta();

     Clientes00.ShowModal;
end;

end.
