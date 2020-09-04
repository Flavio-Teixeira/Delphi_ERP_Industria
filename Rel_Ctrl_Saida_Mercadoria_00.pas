unit Rel_Ctrl_Saida_Mercadoria_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelCtrlSaidaMercadoria00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Nro_Nota_Inicial: TEdit;
    Label2: TLabel;
    Nro_Nota_Final: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Nro_Nota_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Nro_Nota_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelCtrlSaidaMercadoria00: TRelCtrlSaidaMercadoria00;

implementation

uses Rotinas_Gerais, Conexao_BD, Rel_Ctrl_Saida_Mercadoria_01;

{$R *.dfm}

procedure TRelCtrlSaidaMercadoria00.BT_SairClick(Sender: TObject);
begin
     RelCtrlSaidaMercadoria00.Close;
end;

procedure TRelCtrlSaidaMercadoria00.Nro_Nota_InicialKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelCtrlSaidaMercadoria00.Nro_Nota_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelCtrlSaidaMercadoria00.BT_ImprimirClick(Sender: TObject);
begin
     If ((Trim(Nro_Nota_Inicial.Text) <> '') And (Trim(Nro_Nota_Final.Text) <> '')) Then
        Begin

        If StrToInt(Nro_Nota_Inicial.Text) <= StrToInt(Nro_Nota_Final.Text) Then
           Begin
           Ampulheta();

           ConexaoBD.SQL_FB_Rel_Ctrl_Saida.Close;
           ConexaoBD.SQL_FB_Rel_Ctrl_Saida.SQL.Clear;
           ConexaoBD.SQL_FB_Rel_Ctrl_Saida.SQL.Add('Select * from fb_notas_fiscais, fb_transportadoras Where (fb_nota_fiscal_numero >= '+Trim(Nro_Nota_Inicial.Text)+' And fb_nota_fiscal_numero <= '+Trim(Nro_Nota_Final.Text)+') And (fb_nota_fiscal_tipo_fatura = '+#39+'Nota Fiscal'+#39+') And (fb_nota_fiscal_transporta = fb_transportadora_numero)');
           ConexaoBD.SQL_FB_Rel_Ctrl_Saida.Open;

           Seta();

           If conexaoBD.SQL_FB_Rel_Ctrl_Saida.RecordCount > 0 Then
              Begin

              Application.CreateForm(TRelCtrlSaidaMercadoria01,RelCtrlSaidaMercadoria01);
              RelCtrlSaidaMercadoria01.QR_CTRL_Mercadoria.Preview;
              RelCtrlSaidaMercadoria01.Destroy;

              End
           Else
              Begin
              MSG_Erro('Nenhuma Nota Fiscal foi Encontrada...');
              Nro_Nota_Inicial.SetFocus;
           End;

           End
        Else
           Begin
           Msg_Erro('O Número da Nota Final, deve ser, maior ou igual ao Número da Nota Inicial...');
           Nro_Nota_Final.SetFocus;
        End;

        End
     Else
        Begin
        MSG_Erro('É Necessário Informar a Nota Inicial e Final...');
        Nro_Nota_Inicial.SetFocus;
     End;
end;

procedure TRelCtrlSaidaMercadoria00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

end.
