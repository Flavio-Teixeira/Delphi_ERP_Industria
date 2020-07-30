unit MSG_NF_Etapa_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TMSGNFEtapa01 = class(TForm)
    Label1: TLabel;
    Data_Emissao_Nota: TMaskEdit;
    BT_Continuar: TBitBtn;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ContinuarClick(Sender: TObject);
    procedure Data_Emissao_NotaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MSGNFEtapa01: TMSGNFEtapa01;

implementation

uses Notas_Fiscais_Saidas_01, Rotinas_Gerais, Conexao_BD;

{$R *.dfm}

procedure TMSGNFEtapa01.BT_SairClick(Sender: TObject);
begin
     NotasFiscaisSaidas01.ETP_Resultado.Text         := 'Cancelado';
     NotasFiscaisSaidas01.ETP_Data_Emissao_Nota.Text := '';

     MSGNFEtapa01.Close;
end;

procedure TMSGNFEtapa01.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TMSGNFEtapa01.FormShow(Sender: TObject);
begin
     Data_Emissao_Nota.Text := DateToStr(Date());
end;

procedure TMSGNFEtapa01.BT_ContinuarClick(Sender: TObject);

var
   Data_Comparacao: String;

begin
     //*** Verifica se a Data da Nota Fiscal a Ser Emitida já Existe ***

     ConexaoBD.SQL_FB_NF_Anterior.Close;
     ConexaoBD.SQL_FB_NF_Anterior.SQL.Clear;
     ConexaoBD.SQL_FB_NF_Anterior.SQL.Add('Select * from fb_nf_anterior');
     ConexaoBD.SQL_FB_NF_Anterior.Open;

     If Trim(NotasFiscaisSaidas01.Cliente_Tipo_Faturamento.Text) = 'Nota Fiscal' Then
        Begin
        Data_Comparacao := ConexaoBD.SQL_FB_NF_Anteriorfb_nf_anterior_data.Text;
        End
     Else
        Begin
        Data_Comparacao := ConexaoBD.SQL_FB_NF_Anteriorfb_nf_anterior_data_ped.Text;
     End;

     //If StrToDate(Data_Emissao_Nota.Text) < StrToDate(Data_Comparacao) Then
     //   Begin
     //   MSG_Erro('A Data deve ser maior ou igual a data da última nota emitida.');
     //   End
     //Else
     //   Begin
        NotasFiscaisSaidas01.ETP_Resultado.Text         := 'Etapa_02';
        NotasFiscaisSaidas01.ETP_Data_Emissao_Nota.Text := Data_Emissao_Nota.Text;

        MSGNFEtapa01.Close;
     //End;
end;

procedure TMSGNFEtapa01.Data_Emissao_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
