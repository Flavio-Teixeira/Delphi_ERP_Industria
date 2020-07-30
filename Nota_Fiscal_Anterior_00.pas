unit Nota_Fiscal_Anterior_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Buttons;

type
  TNotaFiscalAnterior00 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    NF_Data_Nota: TMaskEdit;
    Label10: TLabel;
    Label34: TLabel;
    NF_Nro_Nota: TEdit;
    Label1: TLabel;
    NF_Nro_Duplicata: TEdit;
    Label2: TLabel;
    NF_Dia_Mudanca: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Ped_Data_Nota: TMaskEdit;
    Ped_Nro_Nota: TEdit;
    Ped_Nro_Duplicata: TEdit;
    Ped_Dia_Mudanca: TEdit;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    Label7: TLabel;
    OPC_Ibrasmak: TRadioButton;
    OPC_Monibras: TRadioButton;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NF_Nro_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure NF_Nro_DuplicataKeyPress(Sender: TObject; var Key: Char);
    procedure NF_Dia_MudancaKeyPress(Sender: TObject; var Key: Char);
    procedure Ped_Nro_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Ped_Nro_DuplicataKeyPress(Sender: TObject; var Key: Char);
    procedure Ped_Dia_MudancaKeyPress(Sender: TObject; var Key: Char);
    procedure NF_Data_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Ped_Data_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure BT_AlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OPC_IbrasmakClick(Sender: TObject);
    procedure OPC_MonibrasClick(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  NotaFiscalAnterior00: TNotaFiscalAnterior00;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TNotaFiscalAnterior00.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     Ampulheta();

     If Trim(NF_Data_Nota.Text) = '/  /' Then
        Begin
        Erro          := 'A Data da Última Nota Fiscal não foi informada';
        Campo_Retorno := 'NF_Data_Nota';
        End
     Else If Trim(NF_Nro_Nota.Text) = '' Then
        Begin
        Erro          := 'O Número da Última Nota Fiscal não foi informado';
        Campo_Retorno := 'NF_Nro_Nota';
        End
     Else If Trim(NF_Nro_Duplicata.Text) = '' Then
        Begin
        Erro          := 'O Número da Última Duplica da Nota Fiscal não foi informado';
        Campo_Retorno := 'NF_Nro_Duplicata';
        End
     Else If Trim(NF_Dia_Mudanca.Text) = '' Then
        Begin
        Erro          := 'O Dia de Mudança da Tabela da Nota Fiscal não foi informado';
        Campo_Retorno := 'NF_Dia_Mudanca';
        End
     Else If Trim(Ped_Data_Nota.Text) = '/  /' Then
        Begin
        Erro          := 'A Data do Último Pedido não foi informado';
        Campo_Retorno := 'Ped_Data_Nota';
        End
     Else If Trim(Ped_Nro_Nota.Text) = '' Then
        Begin
        Erro          := 'O Número do Último Pedido não foi informado';
        Campo_Retorno := 'Ped_Nro_Nota';
        End
     Else If Trim(Ped_Nro_Duplicata.Text) = '' Then
        Begin
        Erro          := 'O Número da Última Duplica do Pedido não foi informado';
        Campo_Retorno := 'Ped_Nro_Duplicata';
        End
     Else If Trim(Ped_Dia_Mudanca.Text) = '' Then
        Begin
        Erro          := 'O Dia de Mudança da Tabela do Pedido não foi informado';
        Campo_Retorno := 'Ped_Dia_Mudanca';
     End;

     Seta();

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'NF_Data_Nota' Then
           Begin
           NF_Data_Nota.SetFocus;
           End
        Else If Campo_Retorno = 'NF_Nro_Nota' Then
           Begin
           NF_Nro_Nota.SetFocus;
           End
        Else If Campo_Retorno = 'NF_Nro_Duplicata' Then
           Begin
           NF_Nro_Duplicata.SetFocus;
           End
        Else If Campo_Retorno = 'NF_Dia_Mudanca' Then
           Begin
           NF_Dia_Mudanca.SetFocus;
           End
        Else If Campo_Retorno = 'Ped_Data_Nota' Then
           Begin
           Ped_Data_Nota.SetFocus;
           End
        Else If Campo_Retorno = 'Ped_Nro_Nota' Then
           Begin
           Ped_Nro_Nota.SetFocus;
           End
        Else If Campo_Retorno = 'Ped_Nro_Duplicata' Then
           Begin
           Ped_Nro_Duplicata.SetFocus;
           End
        Else If Campo_Retorno = 'Ped_Dia_Mudanca' Then
           Begin
           Ped_Dia_Mudanca.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TNotaFiscalAnterior00.BT_SairClick(Sender: TObject);
begin
     NotaFiscalAnterior00.Close;
end;

procedure TNotaFiscalAnterior00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TNotaFiscalAnterior00.NF_Nro_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);
     
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotaFiscalAnterior00.NF_Nro_DuplicataKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);
     
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotaFiscalAnterior00.NF_Dia_MudancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);
     
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotaFiscalAnterior00.Ped_Nro_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);
     
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotaFiscalAnterior00.Ped_Nro_DuplicataKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);
     
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotaFiscalAnterior00.Ped_Dia_MudancaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);
     
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotaFiscalAnterior00.NF_Data_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotaFiscalAnterior00.Ped_Data_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotaFiscalAnterior00.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL, Nota_Anterior: String;
   NF_Nro_NF, NF_Nro_Dup, NF_Dia: String;
   Ped_Nro_NF, Ped_Nro_Dup, Ped_Dia: String;
   Existe_Nota: Boolean;

begin
     If Valida_Dados() Then
        Begin

        //*** Obtem os Valores da Nota ***

        NF_Nro_NF  := Trim(Virgula_Ponto(NF_Nro_Nota.Text));
        NF_Nro_Dup := Trim(Virgula_Ponto(NF_Nro_Duplicata.Text));
        NF_Dia     := Trim(Virgula_Ponto(NF_Dia_Mudanca.Text));

        If Trim(NF_Nro_NF) = '' Then
           Begin
           NF_Nro_NF := '0';
        End;

        If Trim(NF_Nro_Dup) = '' Then
           Begin
           NF_Nro_Dup := '0';
        End;

        If Trim(NF_Dia) = '' Then
           Begin
           NF_Dia := '0';
        End;

        //*** Obtem os Valores do Pedido ***

        Ped_Nro_NF  := Trim(Virgula_Ponto(Ped_Nro_Nota.Text));
        Ped_Nro_Dup := Trim(Virgula_Ponto(Ped_Nro_Duplicata.Text));
        Ped_Dia     := Trim(Virgula_Ponto(Ped_Dia_Mudanca.Text));

        If Trim(Ped_Nro_NF) = '' Then
           Begin
           Ped_Nro_NF := '0';
        End;

        If Trim(Ped_Nro_Dup) = '' Then
           Begin
           Ped_Nro_Dup := '0';
        End;

        If Trim(Ped_Dia) = '' Then
           Begin
           Ped_Dia := '0';
        End;

        //*** Efetua a Inserção ***

        Existe_Nota   := False;
        Nota_Anterior := '';

        If OPC_Ibrasmak.Checked Then
           Begin
           ConexaoBD.SQL_FB_NF_Anterior.Close;
           ConexaoBD.SQL_FB_NF_Anterior.SQL.Clear;
           ConexaoBD.SQL_FB_NF_Anterior.SQL.Add('Select * from fb_nf_anterior');
           ConexaoBD.SQL_FB_NF_Anterior.Open;

           If conexaoBD.SQL_FB_NF_Anterior.RecordCount > 0 Then
              Begin
              Existe_Nota   := True;
              Nota_Anterior := conexaoBD.SQL_FB_NF_Anteriorfb_nf_anterior_numero.Text;
           End;

           If Existe_Nota Then
              Begin
              Comando_SQL := 'Update fb_nf_anterior Set ';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_data = ' + #39 + Inverte_Data_Plus(Trim(NF_Data_Nota.Text),'amd','/') + #39 + ',';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_numero = ' + Trim(NF_Nro_NF) + ',';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_duplicata = ' + Trim(NF_Nro_Dup) + ',';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_dia_mudanca = ' + Trim(NF_Dia) + ',';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_data_ped = ' + #39 + Inverte_Data_Plus(Trim(Ped_Data_Nota.Text),'amd','/') + #39 + ',';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_numero_ped = ' + Trim(Ped_Nro_NF) + ',';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_duplicata_ped = ' + Trim(Ped_Nro_Dup) + ',';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_dia_mudanca_ped = ' + Trim(Ped_Dia);
              End
           Else
              Begin
              Comando_SQL := 'Insert Into fb_nf_anterior(';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_data,';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_numero,';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_duplicata,';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_dia_mudanca,';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_data_ped,';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_numero_ped,';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_duplicata_ped,';
              Comando_SQL := Comando_SQL + 'fb_nf_anterior_dia_mudanca_ped) ';
              Comando_SQL := Comando_SQL + 'Values(';
              Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(NF_Data_Nota.Text),'amd','/') + #39 + ',';
              Comando_SQL := Comando_SQL + Trim(NF_Nro_NF) + ',';
              Comando_SQL := Comando_SQL + Trim(NF_Nro_Dup) + ',';
              Comando_SQL := Comando_SQL + Trim(NF_Dia) + ',';
              Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Ped_Data_Nota.Text),'amd','/') + #39 + ',';
              Comando_SQL := Comando_SQL + Trim(Ped_Nro_NF) + ',';
              Comando_SQL := Comando_SQL + Trim(Ped_Nro_Dup) + ',';
              Comando_SQL := Comando_SQL + Trim(Ped_Dia) + ')';
           End;

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           End
        Else
           Begin
           ConexaoBD.SQL_MB_NF_Anterior.Close;
           ConexaoBD.SQL_MB_NF_Anterior.SQL.Clear;
           ConexaoBD.SQL_MB_NF_Anterior.SQL.Add('Select * from mb_nf_anterior');
           ConexaoBD.SQL_MB_NF_Anterior.Open;

           If conexaoBD.SQL_MB_NF_Anterior.RecordCount > 0 Then
              Begin
              Existe_Nota   := True;
              Nota_Anterior := conexaoBD.SQL_MB_NF_Anteriormb_nf_anterior_numero.Text;
           End;

           If Existe_Nota Then
              Begin
              Comando_SQL := 'Update mb_nf_anterior Set ';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_data = ' + #39 + Inverte_Data_Plus(Trim(NF_Data_Nota.Text),'amd','/') + #39 + ',';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_numero = ' + Trim(NF_Nro_NF) + ',';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_duplicata = ' + Trim(NF_Nro_Dup) + ',';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_dia_mudanca = ' + Trim(NF_Dia) + ',';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_data_ped = ' + #39 + Inverte_Data_Plus(Trim(Ped_Data_Nota.Text),'amd','/') + #39 + ',';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_numero_ped = ' + Trim(Ped_Nro_NF) + ',';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_duplicata_ped = ' + Trim(Ped_Nro_Dup) + ',';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_dia_mudanca_ped = ' + Trim(Ped_Dia);
              End
           Else
              Begin
              Comando_SQL := 'Insert Into mb_nf_anterior(';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_data,';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_numero,';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_duplicata,';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_dia_mudanca,';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_data_ped,';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_numero_ped,';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_duplicata_ped,';
              Comando_SQL := Comando_SQL + 'mb_nf_anterior_dia_mudanca_ped) ';
              Comando_SQL := Comando_SQL + 'Values(';
              Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(NF_Data_Nota.Text),'amd','/') + #39 + ',';
              Comando_SQL := Comando_SQL + Trim(NF_Nro_NF) + ',';
              Comando_SQL := Comando_SQL + Trim(NF_Nro_Dup) + ',';
              Comando_SQL := Comando_SQL + Trim(NF_Dia) + ',';
              Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Ped_Data_Nota.Text),'amd','/') + #39 + ',';
              Comando_SQL := Comando_SQL + Trim(Ped_Nro_NF) + ',';
              Comando_SQL := Comando_SQL + Trim(Ped_Nro_Dup) + ',';
              Comando_SQL := Comando_SQL + Trim(Ped_Dia) + ')';
           End;

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;
        End;

        MSG_Erro('Alteração Efetuada...');

        NotaFiscalAnterior00.Close;
     End;
end;

procedure TNotaFiscalAnterior00.FormShow(Sender: TObject);
begin
     OPC_IbrasmakClick(Sender);
end;

procedure TNotaFiscalAnterior00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     NotaFiscalAnterior00 := Nil;
end;

procedure TNotaFiscalAnterior00.OPC_IbrasmakClick(Sender: TObject);
begin
    If OPC_Ibrasmak.Checked Then
       Begin
       ConexaoBD.SQL_FB_NF_Anterior.Close;
       ConexaoBD.SQL_FB_NF_Anterior.SQL.Clear;
       ConexaoBD.SQL_FB_NF_Anterior.SQL.Add('Select * from fb_nf_anterior');
       ConexaoBD.SQL_FB_NF_Anterior.Open;

       If conexaoBD.SQL_FB_NF_Anterior.RecordCount > 0 Then
         Begin
         //*** Carrega Nota Fiscal ***
         NF_Data_Nota.Text     := ConexaoBD.SQL_FB_NF_Anteriorfb_nf_anterior_data.Text;
         NF_Dia_Mudanca.Text   := ConexaoBD.SQL_FB_NF_Anteriorfb_nf_anterior_dia_mudanca.Text;
         NF_Nro_Duplicata.Text := ConexaoBD.SQL_FB_NF_Anteriorfb_nf_anterior_duplicata.Text;
         NF_Nro_Nota.Text      := ConexaoBD.SQL_FB_NF_Anteriorfb_nf_anterior_numero.Text;

         //*** Carrega Pedido ***
         Ped_Data_Nota.Text     := ConexaoBD.SQL_FB_NF_Anteriorfb_nf_anterior_data_ped.Text;
         Ped_Dia_Mudanca.Text   := ConexaoBD.SQL_FB_NF_Anteriorfb_nf_anterior_dia_mudanca_ped.Text;
         Ped_Nro_Duplicata.Text := ConexaoBD.SQL_FB_NF_Anteriorfb_nf_anterior_duplicata_ped.Text;
         Ped_Nro_Nota.Text      := ConexaoBD.SQL_FB_NF_Anteriorfb_nf_anterior_numero_ped.Text;
         End
       Else
         Begin
         //*** Carrega Nota Fiscal ***
         NF_Data_Nota.Text     := '';
         NF_Dia_Mudanca.Text   := '';
         NF_Nro_Duplicata.Text := '';
         NF_Nro_Nota.Text      := '';

         //*** Carrega Pedido ***
         Ped_Data_Nota.Text     := '';
         Ped_Dia_Mudanca.Text   := '';
         Ped_Nro_Duplicata.Text := '';
         Ped_Nro_Nota.Text      := '';
       End;

       End
    Else
       Begin

       ConexaoBD.SQL_MB_NF_Anterior.Close;
       ConexaoBD.SQL_MB_NF_Anterior.SQL.Clear;
       ConexaoBD.SQL_MB_NF_Anterior.SQL.Add('Select * from mb_nf_anterior');
       ConexaoBD.SQL_MB_NF_Anterior.Open;

       If conexaoBD.SQL_MB_NF_Anterior.RecordCount > 0 Then
         Begin
         //*** Carrega Nota Fiscal ***
         NF_Data_Nota.Text     := ConexaoBD.SQL_MB_NF_Anteriormb_nf_anterior_data.Text;
         NF_Dia_Mudanca.Text   := ConexaoBD.SQL_MB_NF_Anteriormb_nf_anterior_dia_mudanca.Text;
         NF_Nro_Duplicata.Text := ConexaoBD.SQL_MB_NF_Anteriormb_nf_anterior_duplicata.Text;
         NF_Nro_Nota.Text      := ConexaoBD.SQL_MB_NF_Anteriormb_nf_anterior_numero.Text;

         //*** Carrega Pedido ***
         Ped_Data_Nota.Text     := ConexaoBD.SQL_MB_NF_Anteriormb_nf_anterior_data_ped.Text;
         Ped_Dia_Mudanca.Text   := ConexaoBD.SQL_MB_NF_Anteriormb_nf_anterior_dia_mudanca_ped.Text;
         Ped_Nro_Duplicata.Text := ConexaoBD.SQL_MB_NF_Anteriormb_nf_anterior_duplicata_ped.Text;
         Ped_Nro_Nota.Text      := ConexaoBD.SQL_MB_NF_Anteriormb_nf_anterior_numero_ped.Text;
         End
       Else
         Begin
         //*** Carrega Nota Fiscal ***
         NF_Data_Nota.Text     := '';
         NF_Dia_Mudanca.Text   := '';
         NF_Nro_Duplicata.Text := '';
         NF_Nro_Nota.Text      := '';

         //*** Carrega Pedido ***
         Ped_Data_Nota.Text     := '';
         Ped_Dia_Mudanca.Text   := '';
         Ped_Nro_Duplicata.Text := '';
         Ped_Nro_Nota.Text      := '';
       End;

    End;
end;

procedure TNotaFiscalAnterior00.OPC_MonibrasClick(Sender: TObject);
begin
     OPC_IbrasmakClick(Sender);
end;

end.
