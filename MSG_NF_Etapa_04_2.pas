unit MSG_NF_Etapa_04_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TMSGNFEtapa04_2 = class(TForm)
    Label1: TLabel;
    BT_Incluir: TBitBtn;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MSGNFEtapa04_2: TMSGNFEtapa04_2;

implementation

uses Rotinas_Gerais, Notas_Fiscais_Saidas_02;

{$R *.dfm}

procedure TMSGNFEtapa04_2.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss'; 
end;

procedure TMSGNFEtapa04_2.BitBtn1Click(Sender: TObject);
begin
     NotasFiscaisSaidas02.ETP_Resultado.Text   := 'Cancelado';
     NotasFiscaisSaidas02.ETP_Numero_Nota.Text := '';

     MSGNFEtapa04_2.Close;
end;

procedure TMSGNFEtapa04_2.BT_IncluirClick(Sender: TObject);
begin
     NotasFiscaisSaidas02.ETP_Resultado.Text := 'Impressao';

     MSGNFEtapa04_2.Close;
end;

end.
