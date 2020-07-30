unit Etiquetas_Representantes_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImpMat, StdCtrls, Buttons, ExtCtrls;

type
  TEtiquetasRepresentantes00 = class(TForm)
    Panel3: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    Imprimir: TImpMat;
    Label2: TLabel;
    Representante: TComboBox;
    Panel6: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Representante_Codigo: TEdit;
    Representante_Nome: TEdit;
    Representante_Qtde: TEdit;
    Verificar_Posicionamento: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure RepresentanteChange(Sender: TObject);
    procedure Representante_QtdeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EtiquetasRepresentantes00: TEtiquetasRepresentantes00;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TEtiquetasRepresentantes00.FormShow(Sender: TObject);
begin
    // Obtem os Representantes

    ConexaoBD.SQL_Representantes.Close;
    ConexaoBD.SQL_Representantes.SQL.Clear;
    ConexaoBD.SQL_Representantes.SQL.Add('Select * from fb_representantes Order By fb_representante_nome');
    ConexaoBD.SQL_Representantes.Open;

    Representante.Items.Clear;

    If conexaoBD.SQL_Representantes.RecordCount > 0 Then
      begin
      conexaoBD.SQL_Representantes.First;

      While Not conexaoBD.SQL_Representantes.Eof Do
        begin
        Representante.Items.Add(IntToStr(conexaoBD.SQL_Representantesfb_representante_codigo.AsInteger)+' - '+conexaoBD.SQL_Representantesfb_representante_nome.AsString);
        conexaoBD.SQL_Representantes.Next;
      End;
    end;

    ConexaoBD.SQL_Representantes.Close;

    Representante.ItemIndex := 0;
    Representante.SetFocus;
end;

procedure TEtiquetasRepresentantes00.BT_ImprimirClick(Sender: TObject);

var
   Linha, Posicao_Inicial, Posicao_Final: Integer;

begin
     If ((Trim(Representante_Codigo.Text) <> '') And (Trim(Representante_Nome.Text) <> '') And (Trim(Representante_Qtde.Text) <> '')) Then
        Begin

        //*** Posiciona da Etiqueta ***

        If Verificar_Posicionamento.Checked = True Then
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
        End;

        Ampulheta();

        //*** Impressão da Etiqueta ***

        ConexaoBD.SQL_Representantes.Close;
        ConexaoBD.SQL_Representantes.SQL.Clear;
        ConexaoBD.SQL_Representantes.SQL.Add('Select * from fb_representantes Where fb_representante_codigo = ' + Trim(Representante_Codigo.Text) );
        ConexaoBD.SQL_Representantes.Open;

        If ConexaoBD.SQL_Representantes.RecordCount > 0 Then
           Begin
           ConexaoBD.SQL_Representantes.First;

           Posicao_Final := StrToInt(Representante_Qtde.Text);

           For Posicao_Inicial := 1 To Posicao_Final do
               Begin
               Linha := 1;
               Imprimir.PoeStr(Linha,001, #27#15 + Letra_Maiuscula(Copy(Trim(ConexaoBD.SQL_Representantesfb_Representante_nome.Text),1,70)) );

               Linha := Linha + 1;

               If Trim(ConexaoBD.SQL_Representantesfb_representante_complemento.Text) <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy(Trim(ConexaoBD.SQL_Representantesfb_representante_endereco.Text) + ' - ' + Trim(ConexaoBD.SQL_Representantesfb_representante_complemento.Text),1,70)) );
                  End
               Else
                  Begin
                  Linha := Linha + 1;
                  Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy(Trim(ConexaoBD.SQL_Representantesfb_representante_endereco.Text),1,70)) );
               End;

               Linha := Linha + 1;
               Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy(Trim(ConexaoBD.SQL_Representantesfb_representante_bairro.Text) + ' - ' + Trim(ConexaoBD.SQL_Representantesfb_representante_cidade.Text) + ' - ' + Trim(ConexaoBD.SQL_Representantesfb_representante_estado.Text),1,70)) );

               Linha := Linha + 1;
               Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Copy('CEP: ' + Trim(ConexaoBD.SQL_Representantesfb_representante_cep.Text),1,70)) );

               Imprimir.ImprimeJob;
               Imprimir.LimpaBuffer;
           End;
        End;

        Seta();

        End
     Else
        Begin
        MSG_Erro('Dados para impressão não foram preenchidos');

        Representante.SetFocus;
     End;
end;

procedure TEtiquetasRepresentantes00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TEtiquetasRepresentantes00.BT_SairClick(Sender: TObject);
begin
     EtiquetasRepresentantes00.Close;
end;

procedure TEtiquetasRepresentantes00.RepresentanteChange(Sender: TObject);
begin
     Representante_Codigo.Text := Obtem_Nro_Antes_Traco(Representante.Text);
     Representante_Nome.Text   := Obtem_Depois_Traco(Representante.Text);
     Representante_Qtde.Text   := '1';

     Representante_Qtde.SetFocus;
end;

procedure TEtiquetasRepresentantes00.Representante_QtdeKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
