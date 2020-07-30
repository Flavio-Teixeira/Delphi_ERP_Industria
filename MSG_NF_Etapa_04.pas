unit MSG_NF_Etapa_04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TMSGNFEtapa04 = class(TForm)
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
  MSGNFEtapa04: TMSGNFEtapa04;

implementation

uses Rotinas_Gerais, Notas_Fiscais_Saidas_01;

{$R *.dfm}

procedure TMSGNFEtapa04.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss'; 
end;

procedure TMSGNFEtapa04.BitBtn1Click(Sender: TObject);
begin
     NotasFiscaisSaidas01.ETP_Resultado.Text   := 'Cancelado';
     NotasFiscaisSaidas01.ETP_Numero_Nota.Text := '';

     MSGNFEtapa04.Close;
end;

procedure TMSGNFEtapa04.BT_IncluirClick(Sender: TObject);
begin
     NotasFiscaisSaidas01.ETP_Resultado.Text := 'Impressao';

     MSGNFEtapa04.Close;
end;

end.
