unit Desdobramento_Duplicatas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TDesdobramentoDuplicatas00 = class(TForm)
    Panel1: TPanel;
    Desdobramento_Principal: TPanel;
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    Label13: TLabel;
    Numero_Nota: TEdit;
    BT_Procurar: TBitBtn;
    Label47: TLabel;
    Condicao_Pgto_1: TEdit;
    Condicao_Pgto_2: TEdit;
    Condicao_Pgto_3: TEdit;
    Desdobramento_1: TGroupBox;
    BT_Confirmar: TBitBtn;
    Vencto_1: TMaskEdit;
    Label12: TLabel;
    Label15: TLabel;
    Duplicata_1: TEdit;
    Label1: TLabel;
    Valor_1: TEdit;
    Desdobramento_2: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Vencto_2: TMaskEdit;
    Duplicata_2: TEdit;
    Valor_2: TEdit;
    Desdobramento_3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Vencto_3: TMaskEdit;
    Duplicata_3: TEdit;
    Valor_3: TEdit;
    Label10: TLabel;
    SubTotal: TEdit;
    Label11: TLabel;
    Desconto: TEdit;
    Total: TEdit;
    Label14: TLabel;
    Label16: TLabel;
    Data_Emissao: TMaskEdit;
    Forma_1: TEdit;
    Forma_2: TEdit;
    Forma_3: TEdit;
    Desdobramento_4: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Vencto_4: TMaskEdit;
    Duplicata_4: TEdit;
    Valor_4: TEdit;
    Condicao_Pgto_4: TEdit;
    Forma_4: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Numero_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Condicao_Pgto_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure Condicao_Pgto_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure Condicao_Pgto_3KeyPress(Sender: TObject;
      var Key: Char);
    procedure Vencto_1KeyPress(Sender: TObject; var Key: Char);
    procedure Vencto_2KeyPress(Sender: TObject; var Key: Char);
    procedure Vencto_3KeyPress(Sender: TObject; var Key: Char);
    procedure Valor_1KeyPress(Sender: TObject; var Key: Char);
    procedure Valor_2KeyPress(Sender: TObject; var Key: Char);
    procedure Valor_3KeyPress(Sender: TObject; var Key: Char);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_ConfirmarClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Condicao_Pgto_4KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Prepara_Condicao();

  public
    { Public declarations }
  end;

var
  DesdobramentoDuplicatas00: TDesdobramentoDuplicatas00;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************


//******************
//*** Procedures ***
//******************

procedure TDesdobramentoDuplicatas00.Prepara_Condicao();

var
   Calcula_Condicao: Real;
   Vlr_Desd_1, Vlr_Desd_2, Vlr_Desd_3, Vlr_Desd_4: Real;
   Nro_Nota_Desd_1, Nro_Nota_Desd_2, Nro_Nota_Desd_3, Nro_Nota_Desd_4: String;
   Dt_Vcto_Desd_1, Dt_Vcto_Desd_2, Dt_Vcto_Desd_3, Dt_Vcto_Desd_4: String;
   Vlr_Str_Desd_1, Vlr_Str_Desd_2, Vlr_Str_Desd_3, Vlr_Str_Desd_4: String;
   Forma_Desd_1, Forma_Desd_2, Forma_Desd_3, Forma_Desd_4: String;

begin
     Nro_Nota_Desd_1 := '';
     Nro_Nota_Desd_2 := '';
     Nro_Nota_Desd_3 := '';
     Nro_Nota_Desd_4 := '';

     Dt_Vcto_Desd_1  := '';
     Dt_Vcto_Desd_2  := '';
     Dt_Vcto_Desd_3  := '';
     Dt_Vcto_Desd_4  := '';

     Vlr_Desd_1      := 0;
     Vlr_Desd_2      := 0;
     Vlr_Desd_3      := 0;
     Vlr_Desd_4      := 0;

     Vlr_Str_Desd_1  := '';
     Vlr_Str_Desd_2  := '';
     Vlr_Str_Desd_3  := '';
     Vlr_Str_Desd_4  := '';

     Forma_Desd_1    := '';
     Forma_Desd_2    := '';
     Forma_Desd_3    := '';
     Forma_Desd_4    := '';

     If (((Trim(Condicao_pgto_1.Text) <> '') And (Trim(Condicao_pgto_1.Text) <> '0')) And ((Trim(Condicao_pgto_2.Text) <> '') And (Trim(Condicao_pgto_2.Text) <> '0')) And ((Trim(Condicao_pgto_3.Text) <> '') And (Trim(Condicao_pgto_3.Text) <> '0')) And ((Trim(Condicao_pgto_4.Text) <> '') And (Trim(Condicao_pgto_4.Text) <> '0'))) Then
        Begin
        Nro_Nota_Desd_1 := Trim(Numero_Nota.Text) + 'A';
        Nro_Nota_Desd_2 := Trim(Numero_Nota.Text) + 'B';
        Nro_Nota_Desd_3 := Trim(Numero_Nota.Text) + 'C';
        Nro_Nota_Desd_4 := Trim(Numero_Nota.Text) + 'D';

        Dt_Vcto_Desd_1  := DateToStr((StrToDate(Trim(Data_Emissao.Text)) + StrToInt(Condicao_pgto_1.Text)));
        Dt_Vcto_Desd_2  := DateToStr((StrToDate(Trim(Data_Emissao.Text)) + StrToInt(Condicao_pgto_2.Text)));
        Dt_Vcto_Desd_3  := DateToStr((StrToDate(Trim(Data_Emissao.Text)) + StrToInt(Condicao_pgto_3.Text)));
        Dt_Vcto_Desd_4  := DateToStr((StrToDate(Trim(Data_Emissao.Text)) + StrToInt(Condicao_pgto_4.Text)));

        Calcula_Condicao := StrToFloat(Ponto_Virgula(Total.Text));
        Vlr_Desd_1       := (Calcula_Condicao / 4);
        Vlr_Desd_2       := Vlr_Desd_1;
        Vlr_Desd_3       := Vlr_Desd_1;
        Vlr_Desd_4       := (Calcula_Condicao - Vlr_Desd_1 - Vlr_Desd_2 - Vlr_Desd_3);

        Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
        Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
        Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
        Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);

        Forma_Desd_1     := Trim(Condicao_pgto_1.Text);
        Forma_Desd_2     := Trim(Condicao_pgto_2.Text);
        Forma_Desd_3     := Trim(Condicao_pgto_3.Text);
        Forma_Desd_4     := Trim(Condicao_pgto_4.Text);
        End
     Else If (((Trim(Condicao_pgto_1.Text) <> '') And (Trim(Condicao_pgto_1.Text) <> '0')) And ((Trim(Condicao_pgto_2.Text) <> '') And (Trim(Condicao_pgto_2.Text) <> '0')) And ((Trim(Condicao_pgto_3.Text) <> '') And (Trim(Condicao_pgto_3.Text) <> '0'))) Then
        Begin
        Nro_Nota_Desd_1 := Trim(Numero_Nota.Text) + 'A';
        Nro_Nota_Desd_2 := Trim(Numero_Nota.Text) + 'B';
        Nro_Nota_Desd_3 := Trim(Numero_Nota.Text) + 'C';
        Nro_Nota_Desd_4 := '';

        Dt_Vcto_Desd_1  := DateToStr((StrToDate(Trim(Data_Emissao.Text)) + StrToInt(Condicao_pgto_1.Text)));
        Dt_Vcto_Desd_2  := DateToStr((StrToDate(Trim(Data_Emissao.Text)) + StrToInt(Condicao_pgto_2.Text)));
        Dt_Vcto_Desd_3  := DateToStr((StrToDate(Trim(Data_Emissao.Text)) + StrToInt(Condicao_pgto_3.Text)));
        Dt_Vcto_Desd_4  := ''; 

        Calcula_Condicao := StrToFloat(Ponto_Virgula(Total.Text));
        Vlr_Desd_1       := (Calcula_Condicao / 3);
        Vlr_Desd_2       := Vlr_Desd_1;
        Vlr_Desd_3       := (Calcula_Condicao - Vlr_Desd_1 - Vlr_Desd_2);
        Vlr_Desd_4       := 0; 

        Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
        Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
        Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
        Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);

        Forma_Desd_1     := Trim(Condicao_pgto_1.Text);
        Forma_Desd_2     := Trim(Condicao_pgto_2.Text);
        Forma_Desd_3     := Trim(Condicao_pgto_3.Text);
        Forma_Desd_4     := ''; 
        End
     Else If (((Trim(Condicao_pgto_1.Text) <> '') And (Trim(Condicao_pgto_1.Text) <> '0')) And ((Trim(Condicao_pgto_2.Text) <> '') And (Trim(Condicao_pgto_2.Text) <> '0'))) Then
        Begin
        Nro_Nota_Desd_1 := Trim(Numero_Nota.Text) + 'A';
        Nro_Nota_Desd_2 := Trim(Numero_Nota.Text) + 'B';
        Nro_Nota_Desd_3 := '';
        Nro_Nota_Desd_4 := '';

        Dt_Vcto_Desd_1  := DateToStr((StrToDate(Trim(Data_Emissao.Text)) + StrToInt(Condicao_pgto_1.Text)));
        Dt_Vcto_Desd_2  := DateToStr((StrToDate(Trim(Data_Emissao.Text)) + StrToInt(Condicao_pgto_2.Text)));
        Dt_Vcto_Desd_3  := '';
        Dt_Vcto_Desd_4  := '';

        Calcula_Condicao := StrToFloat(Ponto_Virgula(Total.Text));
        Vlr_Desd_1       := (Calcula_Condicao / 2);
        Vlr_Desd_2       := (Calcula_Condicao - Vlr_Desd_1);
        Vlr_Desd_3       := 0;
        Vlr_Desd_4       := 0;

        Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
        Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
        Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
        Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);

        Forma_Desd_1     := Trim(Condicao_pgto_1.Text);
        Forma_Desd_2     := Trim(Condicao_pgto_2.Text);
        Forma_Desd_3     := '';
        Forma_Desd_4     := '';
        End
     Else If ((Trim(Condicao_pgto_1.Text) <> '') And (Trim(Condicao_pgto_1.Text) <> '0')) Then
        Begin
        Nro_Nota_Desd_1 := Trim(Numero_Nota.Text);
        Nro_Nota_Desd_2 := '';
        Nro_Nota_Desd_3 := '';
        Nro_Nota_Desd_4 := '';

        Dt_Vcto_Desd_1  := DateToStr((StrToDate(Trim(Data_Emissao.Text)) + StrToInt(Condicao_pgto_1.Text)));
        Dt_Vcto_Desd_2  := '';
        Dt_Vcto_Desd_3  := '';
        Dt_Vcto_Desd_4  := '';

        Calcula_Condicao := StrToFloat(Ponto_Virgula(Total.Text));
        Vlr_Desd_1       := Calcula_Condicao;
        Vlr_Desd_2       := 0;
        Vlr_Desd_3       := 0;
        Vlr_Desd_4       := 0;

        Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
        Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
        Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
        Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);

        Forma_Desd_1     := Trim(Condicao_pgto_1.Text);
        Forma_Desd_2     := '';
        Forma_Desd_3     := '';
        Forma_Desd_4     := '';
        End
     Else If ((Trim(Condicao_pgto_1.Text) = '') Or (Trim(Condicao_pgto_1.Text) = '0')) Then
        Begin
        Nro_Nota_Desd_1 := Trim(Numero_Nota.Text);
        Nro_Nota_Desd_2 := '';
        Nro_Nota_Desd_3 := '';
        Nro_Nota_Desd_4 := '';

        Dt_Vcto_Desd_1  := DateToStr(StrToDate(Trim(Data_Emissao.Text)));
        Dt_Vcto_Desd_2  := '';
        Dt_Vcto_Desd_3  := '';
        Dt_Vcto_Desd_4  := '';

        Calcula_Condicao := StrToFloat(Ponto_Virgula(Total.Text));
        Vlr_Desd_1       := Calcula_Condicao;
        Vlr_Desd_2       := 0;
        Vlr_Desd_3       := 0;
        Vlr_Desd_4       := 0;

        Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
        Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
        Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
        Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);

        Forma_Desd_1     := 'À VISTA';
        Forma_Desd_2     := '';
        Forma_Desd_3     := '';
        Forma_Desd_4     := '';
     End;

     Duplicata_1.Text := Trim(Nro_Nota_Desd_1);
     Duplicata_2.Text := Trim(Nro_Nota_Desd_2);
     Duplicata_3.Text := Trim(Nro_Nota_Desd_3);
     Duplicata_4.Text := Trim(Nro_Nota_Desd_4);

     Vencto_1.Text := Dt_Vcto_Desd_1;
     Vencto_2.Text := Dt_Vcto_Desd_2;
     Vencto_3.Text := Dt_Vcto_Desd_3;
     Vencto_4.Text := Dt_Vcto_Desd_4;

     Valor_1.Text := Trim(Vlr_Str_Desd_1);
     Valor_2.Text := Trim(Vlr_Str_Desd_2);
     Valor_3.Text := Trim(Vlr_Str_Desd_3);
     Valor_4.Text := Trim(Vlr_Str_Desd_4);

     Forma_1.Text := Forma_Desd_1;
     Forma_2.Text := Forma_Desd_2;
     Forma_3.Text := Forma_Desd_3;
     Forma_4.Text := Forma_Desd_4;
end;

procedure TDesdobramentoDuplicatas00.BT_SairClick(Sender: TObject);
begin
     DesdobramentoDuplicatas00.Close;
end;

procedure TDesdobramentoDuplicatas00.Numero_NotaKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);
     BT_Alterar.Enabled := False; 
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDesdobramentoDuplicatas00.Condicao_Pgto_1KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDesdobramentoDuplicatas00.Condicao_Pgto_2KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDesdobramentoDuplicatas00.Condicao_Pgto_3KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDesdobramentoDuplicatas00.Vencto_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDesdobramentoDuplicatas00.Vencto_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDesdobramentoDuplicatas00.Vencto_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDesdobramentoDuplicatas00.Valor_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDesdobramentoDuplicatas00.Valor_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDesdobramentoDuplicatas00.Valor_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDesdobramentoDuplicatas00.BT_ProcurarClick(Sender: TObject);
begin
    BT_Alterar.Enabled := False;
    If Trim(Numero_Nota.Text) <> '' Then
      Begin
      ConexaoBD.SQL_FB_Nota_Fiscal.Close;
      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = '+Trim(Numero_Nota.Text)+' And fb_nota_fiscal_tipo_fatura = '+#39+'Nota Fiscal'+#39);
      ConexaoBD.SQL_FB_Nota_Fiscal.Open;

      If conexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
        Begin
        If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_1.Text) <> '') Or (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_2.Text) <> '') Or (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_3.Text) <> '') Or (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_4.Text) <> '') ) Then
          Begin
          MSG_Erro('Esta nota possui alguns itens já pagos');
          End
        Else
          Begin
          Numero_Nota.Enabled             := False;
          BT_Procurar.Enabled             := False;
          Desdobramento_Principal.Enabled := True;

          Condicao_Pgto_1.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_1.Text;
          Condicao_Pgto_2.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_2.Text;
          Condicao_Pgto_3.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_3.Text;
          Condicao_Pgto_4.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cond_pgto_4.Text;

          Duplicata_1.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text;
          Vencto_1.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;
          Valor_1.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text;

          Duplicata_2.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text;
          Vencto_2.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;
          Valor_2.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text;

          Duplicata_3.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text;
          Vencto_3.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;
          Valor_3.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text;

          Duplicata_4.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_4.Text;
          Vencto_4.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_4.Text;
          Valor_4.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.Text;

          SubTotal.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_pedido.Text;
          Desconto.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_desc.Text;
          Total.Text       := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;

          Data_Emissao.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;

          Condicao_Pgto_1.SetFocus;
          BT_Alterar.Enabled :=True;
        End;
        End
      Else
        Begin
        MSG_Erro('Nota Fiscal informada não existe');
        Numero_Nota.SetFocus;
      End;
      End
    Else
      Begin
      MSG_Erro('Favor informar o Número da Nota Fiscal');
      Numero_Nota.SetFocus;
    End;
end;

procedure TDesdobramentoDuplicatas00.BT_ConfirmarClick(Sender: TObject);
begin
     If (((Trim(Condicao_pgto_1.Text) <> '') And (Trim(Condicao_pgto_1.Text) <> '0')) Or ((Trim(Condicao_pgto_2.Text) <> '') And (Trim(Condicao_pgto_2.Text) <> '0')) Or ((Trim(Condicao_pgto_3.Text) <> '') And (Trim(Condicao_pgto_3.Text) <> '0')) Or ((Trim(Condicao_pgto_4.Text) <> '') And (Trim(Condicao_pgto_4.Text) <> '0')) ) Then
        Begin
        Prepara_Condicao();

        If Trim(Condicao_Pgto_1.Text) <> '' Then
           Begin
           Vencto_1.Enabled        := True;
           Valor_1.Enabled         := True;
           Desdobramento_1.Enabled := True;
           End
        Else
           Begin
           Vencto_1.Enabled        := False;
           Valor_1.Enabled         := False;
           Desdobramento_1.Enabled := False;
        End;

        If Trim(Condicao_Pgto_2.Text) <> '' Then
           Begin
           Vencto_2.Enabled        := True;
           Valor_2.Enabled         := True;
           Desdobramento_2.Enabled := True;
           End
        Else
           Begin
           Vencto_2.Enabled        := False;
           Valor_2.Enabled         := False;
           Desdobramento_2.Enabled := False;
        End;

        If Trim(Condicao_Pgto_3.Text) <> '' Then
           Begin
           Vencto_3.Enabled        := True;
           Valor_3.Enabled         := True;
           Desdobramento_3.Enabled := True;
           End
        Else
           Begin
           Vencto_3.Enabled        := False;
           Valor_3.Enabled         := False;
           Desdobramento_3.Enabled := False;
        End;

        If Trim(Condicao_Pgto_4.Text) <> '' Then
           Begin
           Vencto_4.Enabled        := True;
           Valor_4.Enabled         := True;
           Desdobramento_4.Enabled := True;
           End
        Else
           Begin
           Vencto_4.Enabled        := False;
           Valor_4.Enabled         := False;
           Desdobramento_4.Enabled := False;
        End;

        If Trim(Condicao_Pgto_1.Text) <> '' Then
           Begin
           Vencto_1.SetFocus;
           End
        Else If Trim(Condicao_Pgto_2.Text) <> '' Then
           Begin
           Vencto_2.SetFocus;
           End
        Else If Trim(Condicao_Pgto_3.Text) <> '' Then
           Begin
           Vencto_3.SetFocus;
           End
        Else If Trim(Condicao_Pgto_4.Text) <> '' Then
           Begin
           Vencto_4.SetFocus;
        End;

        End
     Else
        Begin
        MSG_Erro('Favor informar pelo menos uma condição de Pagamento');
     End;
end;

procedure TDesdobramentoDuplicatas00.BT_AlterarClick(Sender: TObject);

var
   Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4: String;
   Vlr_Dup_1, Vlr_Dup_2, Vlr_Dup_3, Vlr_Dup_4: String;
   Comando_SQL: String;

begin
     Cond_Pgto_1 := Trim(Condicao_Pgto_1.Text);
     Cond_Pgto_2 := Trim(Condicao_Pgto_2.Text);
     Cond_Pgto_3 := Trim(Condicao_Pgto_3.Text);
     Cond_Pgto_4 := Trim(Condicao_Pgto_4.Text);

     Vlr_Dup_1   := Trim(Virgula_Ponto(Valor_1.Text));
     Vlr_Dup_2   := Trim(Virgula_Ponto(Valor_2.Text));
     Vlr_Dup_3   := Trim(Virgula_Ponto(Valor_3.Text));
     Vlr_Dup_4   := Trim(Virgula_Ponto(Valor_4.Text));

     If Trim(Cond_Pgto_1) = '' Then
        Begin
        Cond_Pgto_1 := '0';
     End;

     If Trim(Cond_Pgto_2) = '' Then
        Begin
        Cond_Pgto_2 := '0';
     End;

     If Trim(Cond_Pgto_3) = '' Then
        Begin
        Cond_Pgto_3 := '0';
     End;

     If Trim(Cond_Pgto_4) = '' Then
        Begin
        Cond_Pgto_4 := '0';
     End;

     If Trim(Vlr_Dup_1) = '' Then
        Begin
        Vlr_Dup_1 := '0';
     End;

     If Trim(Vlr_Dup_2) = '' Then
        Begin
        Vlr_Dup_2 := '0';
     End;

     If Trim(Vlr_Dup_3) = '' Then
        Begin
        Vlr_Dup_3 := '0';
     End;

     If Trim(Vlr_Dup_4) = '' Then
        Begin
        Vlr_Dup_4 := '0';
     End;

     //*** Efetua a Alteração ***

     Comando_SQL := 'Update fb_notas_fiscais Set ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_1 = ' + Trim(Cond_Pgto_1) + ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_2 = ' + Trim(Cond_Pgto_2) + ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_3 = ' + Trim(Cond_Pgto_3) + ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_4 = ' + Trim(Cond_Pgto_4) + ',';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_1 = ' +#39+ Trim(Duplicata_1.Text) +#39+ ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_2 = ' +#39+ Trim(Duplicata_2.Text) +#39+ ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_3 = ' +#39+ Trim(Duplicata_3.Text) +#39+ ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_4 = ' +#39+ Trim(Duplicata_4.Text) +#39+ ',';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_1 = ' +#39+ Trim(Forma_1.Text) +#39+ ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_2 = ' +#39+ Trim(Forma_2.Text) +#39+ ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_3 = ' +#39+ Trim(Forma_3.Text) +#39+ ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_4 = ' +#39+ Trim(Forma_4.Text) +#39+ ',';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_1 = ' + #39 + Inverte_Data_Plus(Trim(Vencto_1.Text),'amd','/') + #39 + ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_2 = ' + #39 + Inverte_Data_Plus(Trim(Vencto_2.Text),'amd','/') + #39 + ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_3 = ' + #39 + Inverte_Data_Plus(Trim(Vencto_3.Text),'amd','/') + #39 + ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_4 = ' + #39 + Inverte_Data_Plus(Trim(Vencto_4.Text),'amd','/') + #39 + ',';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_1 = ' + Trim(Vlr_Dup_1) + ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_2 = ' + Trim(Vlr_Dup_2) + ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_3 = ' + Trim(Vlr_Dup_3) + ',';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_4 = ' + Trim(Vlr_Dup_4) + ' ';

     Comando_SQL := Comando_SQL + ' Where fb_nota_fiscal_numero = ' + Trim(Numero_Nota.Text);

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     MSG_Erro('Desdobramento Efetuado');
end;

procedure TDesdobramentoDuplicatas00.Condicao_Pgto_4KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TDesdobramentoDuplicatas00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     DesdobramentoDuplicatas00 := Nil;
end;

end.
