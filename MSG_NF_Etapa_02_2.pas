unit MSG_NF_Etapa_02_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TMSGNFEtapa02_2 = class(TForm)
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
  MSGNFEtapa02_2: TMSGNFEtapa02_2;

implementation

uses Rotinas_Gerais, Conexao_BD, Notas_Fiscais_Saidas_02, MSG_NF_Etapa_03_2;

{$R *.dfm}

procedure TMSGNFEtapa02_2.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TMSGNFEtapa02_2.BT_SairClick(Sender: TObject);
begin
     NotasFiscaisSaidas02.ETP_Resultado.Text   := 'Cancelado';
     NotasFiscaisSaidas02.ETP_Numero_Nota.Text := '';

     MSGNFEtapa02_2.Close;
end;

procedure TMSGNFEtapa02_2.BT_SimClick(Sender: TObject);
begin
     //*** Verifica se a Próxima Nota Fiscal a Ser Emitida já Existe ***

     If Trim(NotasFiscaisSaidas02.Cliente_Tipo_Faturamento.Text) = 'Nota Fiscal' Then
        Begin
        ConexaoBD.SQL_MB_Nota_Fiscal.Close;
        ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Clear;
        ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Add('Select * from mb_notas_fiscais Where mb_nota_fiscal_numero = ' + Trim(Numero_Nota.Text));
        ConexaoBD.SQL_MB_Nota_Fiscal.Open;

        If conexaoBD.SQL_MB_Nota_Fiscal.RecordCount > 0 Then
           Begin
           MSG_Erro('Esta Nota Fiscal já existe.');
           End
        Else
           Begin
           NotasFiscaisSaidas02.ETP_Resultado.Text   := 'Etapa_04';
           NotasFiscaisSaidas02.ETP_Numero_Nota.Text := Numero_Nota.Text;

           MSGNFEtapa02_2.Close;
        End;
        End
     Else
        Begin
        ConexaoBD.SQL_MB_Papeletas.Close;
        ConexaoBD.SQL_MB_Papeletas.SQL.Clear;
        ConexaoBD.SQL_MB_Papeletas.SQL.Add('Select * from mb_papeletas Where mb_papeleta_numero = ' + Trim(Numero_Nota.Text));
        ConexaoBD.SQL_MB_Papeletas.Open;

        If conexaoBD.SQL_MB_Papeletas.RecordCount > 0 Then
           Begin
           MSG_Erro('Esta Papeleta já existe.');
           End
        Else
           Begin
           NotasFiscaisSaidas02.ETP_Resultado.Text   := 'Etapa_04';
           NotasFiscaisSaidas02.ETP_Numero_Nota.Text := Numero_Nota.Text;

           MSGNFEtapa02_2.Close;
        End;
     End;
end;

procedure TMSGNFEtapa02_2.BT_NaoClick(Sender: TObject);

var
   Nro_Nota: Integer;

begin
     MSGNFEtapa02_2.Visible := False;

     //*** Etapa 03 - Numero da Última Nota Fiscal ***

     Application.CreateForm(TMSGNFEtapa03_2,MSGNFEtapa03_2);

     Nro_Nota := StrToInt(Numero_Nota.Text);

     If Nro_Nota <= 0 Then
        Begin
        Nro_Nota := 0;
        End
     Else
        Begin
        Nro_Nota := Nro_Nota - 1;
     End;

     MSGNFEtapa03_2.Ultima_Nota.Text := IntToStr(Nro_Nota);

     MSGNFEtapa03_2.ShowModal;
     MSGNFEtapa03_2.Destroy;

     MSGNFEtapa02_2.Visible := True;
end;

procedure TMSGNFEtapa02_2.Numero_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TMSGNFEtapa02_2.FormShow(Sender: TObject);

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

        ConexaoBD.SQL_MB_NF_Anterior.Close;
        ConexaoBD.SQL_MB_NF_Anterior.SQL.Clear;
        ConexaoBD.SQL_MB_NF_Anterior.SQL.Add('Select * from mb_nf_anterior');
        ConexaoBD.SQL_MB_NF_Anterior.Open;

        If conexaoBD.SQL_MB_NF_Anterior.RecordCount > 0 Then
           Begin
           If NotasFiscaisSaidas02.Cliente_Tipo_Faturamento.Text = 'Nota Fiscal' Then
              Begin
              Nro_Nota := StrToInt(ConexaoBD.SQL_MB_NF_AnteriorMB_NF_Anterior_Numero.Text);
              End
           Else
              Begin
              Nro_Nota := StrToInt(ConexaoBD.SQL_MB_NF_AnteriorMB_NF_Anterior_Numero_Ped.Text);
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
