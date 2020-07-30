unit MSG_NF_Etapa_01_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TMSGNFEtapa01_2 = class(TForm)
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
  MSGNFEtapa01_2: TMSGNFEtapa01_2;

implementation

uses Rotinas_Gerais, Conexao_BD, Notas_Fiscais_Saidas_02;

{$R *.dfm}

procedure TMSGNFEtapa01_2.BT_SairClick(Sender: TObject);
begin
     NotasFiscaisSaidas02.ETP_Resultado.Text         := 'Cancelado';
     NotasFiscaisSaidas02.ETP_Data_Emissao_Nota.Text := '';

     MSGNFEtapa01_2.Close;
end;

procedure TMSGNFEtapa01_2.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TMSGNFEtapa01_2.FormShow(Sender: TObject);
begin
     Data_Emissao_Nota.Text := DateToStr(Date());
end;

procedure TMSGNFEtapa01_2.BT_ContinuarClick(Sender: TObject);

var
   Data_Comparacao: String;

begin
     //*** Verifica se a Data da Nota Fiscal a Ser Emitida já Existe ***

     ConexaoBD.SQL_MB_NF_Anterior.Close;
     ConexaoBD.SQL_MB_NF_Anterior.SQL.Clear;
     ConexaoBD.SQL_MB_NF_Anterior.SQL.Add('Select * from mb_nf_anterior');
     ConexaoBD.SQL_MB_NF_Anterior.Open;

     If Trim(NotasFiscaisSaidas02.Cliente_Tipo_Faturamento.Text) = 'Nota Fiscal' Then
        Begin
        Data_Comparacao := ConexaoBD.SQL_MB_NF_Anteriormb_nf_anterior_data.Text;
        End
     Else
        Begin
        Data_Comparacao := ConexaoBD.SQL_MB_NF_Anteriormb_nf_anterior_data_ped.Text;
     End;

     //If StrToDate(Data_Emissao_Nota.Text) < StrToDate(Data_Comparacao) Then
     //   Begin
     //   MSG_Erro('A Data deve ser maior ou igual a data da última nota emitida.');
     //   End
     //Else
     //   Begin
        NotasFiscaisSaidas02.ETP_Resultado.Text         := 'Etapa_02';
        NotasFiscaisSaidas02.ETP_Data_Emissao_Nota.Text := Data_Emissao_Nota.Text;

        MSGNFEtapa01_2.Close;
     //End;
end;

procedure TMSGNFEtapa01_2.Data_Emissao_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
