unit Rel_OS_Canceladas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelOSCanceladas00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Data_Inicial: TMaskEdit;
    Data_Final: TMaskEdit;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    OS_Tipo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelOSCanceladas00: TRelOSCanceladas00;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_OS_Canceladas_01, Ibrasmak_00;

{$R *.dfm}

procedure TRelOSCanceladas00.FormCreate(Sender: TObject);
begin
//*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TRelOSCanceladas00.FormShow(Sender: TObject);
begin
    // Carrega data atual nos campos de periodo
    Data_Inicial.Text := Trim(DateToStr(Date()));
    Data_Final.Text   := Trim(DateToStr(Date()));
end;

procedure TRelOSCanceladas00.Data_InicialKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelOSCanceladas00.Data_FinalKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelOSCanceladas00.BT_ImprimirClick(Sender: TObject);
var Comando_SQL: string;
begin
  if Trim(Data_Inicial.Text) = '/  /' then begin
    MSG_Erro('Antes de prosseguir favor preencher o campo Data inicial...');
    Data_Inicial.SetFocus;
    end
  else if Trim(Data_Final.Text) = '/  /' then begin
    MSG_Erro('Antes de prosseguir favor preencher o campo Data final...');
    Data_Final.SetFocus;
    end
  else if StrToDate(Data_Inicial.Text) > StrToDate(Data_Final.Text) then begin
    MSG_Erro('Antes de prosseguir favor Verificar as datas Data Final menor que Data Inicial...');
    Data_Final.SetFocus;
    end
  else begin
    Ampulheta();

    Comando_SQL := 'select * ';
    Comando_SQL := Comando_SQL + 'from cancelamento_os ';
    Comando_SQL := Comando_SQL + 'where (cancelamento_os_tipo_os = '+#39+Trim(OS_Tipo.Text)+#39+')';
    Comando_SQL := Comando_SQL + ' and  (cancelamento_os_data_cancelamento >= '+#39+Inverte_Data_Plus(Data_Inicial.Text,'amd','-')+#39+')';
    Comando_SQL := Comando_SQL + ' and  (cancelamento_os_data_cancelamento <= '+#39+Inverte_Data_Plus(Data_Final.Text,'amd','-')+#39+')';
    Comando_SQL := Comando_SQL + ' Order by cancelamento_os_data_criacao Asc, cancelamento_os_cliente_codigo Asc';


    ConexaoBD.SQL_Rel_Cancelamento_OS.SQL.Clear;
    ConexaoBD.SQL_Rel_Cancelamento_OS.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Rel_Cancelamento_OS.Open;

    Application.CreateForm(TRelOSCanceladas01,RelOSCanceladas01);

    RelOSCanceladas01.QR_Topo.Caption     := 'Ibrasmak - ' + OS_Tipo.Text;
    RelOSCanceladas01.QR_Titulo.Caption   := 'Relatório de Cancelamentos - ' + OS_Tipo.Text;
    RelOSCanceladas01.QR_Periodo.Caption  := 'Péríodo de ' + Data_Inicial.Text + ' a ' + Data_Final.Text;

    RelOSCanceladas01.QR_Faturamento.Preview;
    RelOSCanceladas01.Destroy;

    Seta();
  end;
end;

procedure TRelOSCanceladas00.BT_SairClick(Sender: TObject);
begin
    RelOSCanceladas00.Close;
end;

end.
