unit MSG_NF_Etapa_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TMSGNFEtapa02 = class(TForm)
    Label1: TLabel;
    BT_Sim: TBitBtn;
    BT_Sair: TBitBtn;
    BT_Nao: TBitBtn;
    Numero_Nota: TEdit;
    Label2: TLabel;
    ETP_Ultima_Nota: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_SimClick(Sender: TObject);
    procedure BT_NaoClick(Sender: TObject);
    procedure Numero_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MSGNFEtapa02: TMSGNFEtapa02;

implementation

uses MSG_NF_Etapa_03, Notas_Fiscais_Saidas_01, Rotinas_Gerais, Conexao_BD;

{$R *.dfm}

procedure TMSGNFEtapa02.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TMSGNFEtapa02.BT_SairClick(Sender: TObject);
begin
     NotasFiscaisSaidas01.ETP_Resultado.Text   := 'Cancelado';
     NotasFiscaisSaidas01.ETP_Numero_Nota.Text := '';

     MSGNFEtapa02.Close;
end;

procedure TMSGNFEtapa02.BT_SimClick(Sender: TObject);
begin
     //*** Verifica se a Próxima Nota Fiscal a Ser Emitida já Existe ***

     If Trim(NotasFiscaisSaidas01.Cliente_Tipo_Faturamento.Text) = 'Nota Fiscal' Then
        Begin
        ConexaoBD.SQL_FB_Nota_Fiscal.Close;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Trim(Numero_Nota.Text));
        ConexaoBD.SQL_FB_Nota_Fiscal.Open;

        If conexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
           Begin
           MSG_Erro('Esta Nota Fiscal já existe.');
           End
        Else
           Begin
           NotasFiscaisSaidas01.ETP_Resultado.Text   := 'Etapa_04';
           NotasFiscaisSaidas01.ETP_Numero_Nota.Text := Numero_Nota.Text;

           MSGNFEtapa02.Close;
        End;
        End
     Else
        Begin
        ConexaoBD.SQL_FB_Papeletas.Close;
        ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
        ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * from fb_papeletas Where fb_papeleta_numero = ' + Trim(Numero_Nota.Text));
        ConexaoBD.SQL_FB_Papeletas.Open;

        If conexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then
           Begin
           MSG_Erro('Esta Papeleta já existe.');
           End
        Else
           Begin
           NotasFiscaisSaidas01.ETP_Resultado.Text   := 'Etapa_04';
           NotasFiscaisSaidas01.ETP_Numero_Nota.Text := Numero_Nota.Text;

           MSGNFEtapa02.Close;
        End;
     End;
end;

procedure TMSGNFEtapa02.BT_NaoClick(Sender: TObject);

var
   Nro_Nota: Integer;

begin
     MSGNFEtapa02.Visible := False;

     //*** Etapa 03 - Numero da Última Nota Fiscal ***

     Application.CreateForm(TMSGNFEtapa03,MSGNFEtapa03);

     Nro_Nota := StrToInt(Numero_Nota.Text);

     If Nro_Nota <= 0 Then
        Begin
        Nro_Nota := 0;
        End
     Else
        Begin
        Nro_Nota := Nro_Nota - 1;
     End;

     MSGNFEtapa03.Ultima_Nota.Text := IntToStr(Nro_Nota);

     MSGNFEtapa03.ShowModal;
     MSGNFEtapa03.Destroy;

     MSGNFEtapa02.Visible := True;
end;

procedure TMSGNFEtapa02.Numero_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TMSGNFEtapa02.FormShow(Sender: TObject);

var
   Nro_Nota: Integer;

begin
     If Trim(ETP_Ultima_Nota.Text) <> '' Then
        Begin
        Nro_Nota := StrToInt(ETP_Ultima_Nota.Text);
        Nro_Nota := Nro_Nota + 1;

        Numero_Nota.Text := IntToStr(Nro_Nota);
        End
     Else
        Begin
        //*** Pega a Numeração da Ibrasmak ***

        ConexaoBD.SQL_FB_NF_Anterior.Close;
        ConexaoBD.SQL_FB_NF_Anterior.SQL.Clear;
        ConexaoBD.SQL_FB_NF_Anterior.SQL.Add('Select * from fb_nf_anterior');
        ConexaoBD.SQL_FB_NF_Anterior.Open;

        If conexaoBD.SQL_FB_NF_Anterior.RecordCount > 0 Then
           Begin
           If NotasFiscaisSaidas01.Cliente_Tipo_Faturamento.Text = 'Nota Fiscal' Then
              Begin
              Nro_Nota := StrToInt(ConexaoBD.SQL_FB_NF_AnteriorFB_NF_Anterior_Numero.Text);
              End
           Else
              Begin
              Nro_Nota := StrToInt(ConexaoBD.SQL_FB_NF_AnteriorFB_NF_Anterior_Numero_Ped.Text);
           End;

           Nro_Nota := Nro_Nota + 1;
           Numero_Nota.Text := IntToStr(Nro_Nota);

           End
        Else
           Begin
           Numero_Nota.Text := '1';
        End;
     End;
end;

end.
