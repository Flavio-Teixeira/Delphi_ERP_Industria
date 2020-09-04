unit Fixo_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFixo01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label37: TLabel;
    Fixo_Valor: TEdit;
    Label1: TLabel;
    Fixo_Conta: TLabel;
    Label2: TLabel;
    Fixo_Dia: TEdit;
    Label3: TLabel;
    Fixo_Descricao: TEdit;
    Opcao_Indeterminada: TRadioButton;
    Opcao_Determinada: TRadioButton;
    Data_Determinada: TMaskEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Fixo_Fornecedor_Numero: TEdit;
    Fixo_Fornecedor_Nome: TEdit;
    Label5: TLabel;
    BT_Procurar: TBitBtn;
    BT_Excluir: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure Fixo_ValorKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Fixo_DiaKeyPress(Sender: TObject; var Key: Char);
    procedure Fixo_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Opcao_DeterminadaClick(Sender: TObject);
    procedure Opcao_IndeterminadaClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
  public
    { Public declarations }
  end;

var
  Fixo01: TFixo01;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00, DateUtils, Fornecedor_00;

{$R *.dfm}

function TFixo01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Fixo_Dia.Text) = '' Then
        Begin
        Erro          := 'O Dia não foi informado';
        Campo_Retorno := 'Fixo_Dia';
        End
     Else If Trim(Fixo_Descricao.Text) = '' Then
        Begin
        Erro          := 'A Descrição não foi informada';
        Campo_Retorno := 'Fixo_Descricao';
        End
     Else If Trim(Fixo_Valor.Text) = '' Then
        Begin
        Erro          := 'O Valor não foi informado';
        Campo_Retorno := 'Fixo_Valor';
        End
     Else If ((Opcao_Determinada.Checked) And (Trim(Data_Determinada.Text) = '/  /')) Then
        Begin
        Erro          := 'A Data não foi informada';
        Campo_Retorno := 'Data_Determinada';
        End
     Else
        Begin
        ConexaoBD.SQL_FB_Titulo_Fixo.SQL.Clear;
        ConexaoBD.SQL_FB_Titulo_Fixo.SQL.Add('Select * from fb_titulos_fixos Where fb_titulo_fixo_descricao = ' +#39+ Trim(Fixo_Descricao.Text) +#39);
        ConexaoBD.SQL_FB_Titulo_Fixo.Open;

        If ConexaoBD.SQL_FB_Titulo_Fixo.RecordCount > 0 Then
           Begin
           Erro          := 'A Descrição do Título Já existe';
           Campo_Retorno := 'Fixo_Descricao';
        End;
     End;

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Fixo_Dia' Then
           Begin
           Fixo_Dia.SetFocus;
           End
        Else If Campo_Retorno = 'Fixo_Descricao' Then
           Begin
           Fixo_Descricao.SetFocus;
           End
        Else If Campo_Retorno = 'Data_Determinada' Then
           Begin
           Data_Determinada.SetFocus;
           End             
        Else If Campo_Retorno = 'Fixo_Valor' Then
           Begin
           Fixo_Valor.SetFocus;
        End;
     End;

     Result := Resultado;
end;

procedure TFixo01.BT_SairClick(Sender: TObject);
begin
     Fixo01.Close;
end;

procedure TFixo01.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL, Nro_Conta, Data_Sistema: String;
   Ano_Inicio, Ano_Final, Proximo_Mes: Integer;

begin
     If Valida_Dados() Then
        Begin
        Nro_Conta := Obtem_Nro_Antes_Traco(Fixo_Conta.Caption);

        Comando_SQL := 'Insert into fb_titulos_fixos(';
        Comando_SQL := Comando_SQL + 'fb_titulo_fixo_dia, ';
        Comando_SQL := Comando_SQL + 'fb_titulo_fixo_descricao, ';
        Comando_SQL := Comando_SQL + 'fb_titulo_fixo_valor, ';
        Comando_SQL := Comando_SQL + 'fb_titulo_fixo_conta, ';
        Comando_SQL := Comando_SQL + 'fb_titulo_fixo_tipo, ';
        Comando_SQL := Comando_SQL + 'fb_titulo_fixo_data, ';
        Comando_SQL := Comando_SQL + 'fb_titulo_fixo_fornecedor_numero, ';
        Comando_SQL := Comando_SQL + 'fb_titulo_fixo_fornecedor_nome) ';
        Comando_SQL := Comando_SQL + 'Values(';
        Comando_SQL := Comando_SQL + Trim(Fixo_Dia.Text) + ', ';
        Comando_SQL := Comando_SQL + #39 + Trim(Fixo_Descricao.Text) + #39 + ', ';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Fixo_Valor.Text) + ', ';
        Comando_SQL := Comando_SQL + Trim(Nro_Conta) + ',';

        If Opcao_Indeterminada.Checked Then
           Begin
           Comando_SQL := Comando_SQL + #39 + 'I' + #39 + ', ';
           Data_Determinada.Text := '';
           End
        Else
           Begin
           Comando_SQL := Comando_SQL + #39 + 'D' + #39 + ', ';
        End;

        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Data_Determinada.Text),'amd','/') + #39 + ', ';
        Comando_SQL := Comando_SQL + Trim(Fixo_Fornecedor_Numero.Text) + ', ';
        Comando_SQL := Comando_SQL + #39 + Trim(Fixo_Fornecedor_Nome.Text) + #39 + ')';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Gera os Títulos Fixos ***

        If Length(Trim(Fixo_Dia.Text)) <= 1 Then
           Begin
           Fixo_Dia.Text := '0' + Trim(Fixo_Dia.Text);
        End;

        Data_Sistema := DateToStr(Date());
        Data_Sistema := Trim(Fixo_Dia.Text) + Copy(Data_Sistema,3,8);

        If Copy(Data_Sistema,4,2) = '02' Then
           Begin
           If StrToInt(Trim(Fixo_Dia.Text)) > 28 Then
              Begin
              Data_Sistema := '28' + Copy(Data_Sistema,3,8);
           End;
        End;
        
        Ano_Inicio   := StrToInt(Copy(Data_Sistema,7,4));

        If Opcao_Indeterminada.Checked Then
           Begin
           Ano_Final := Ano_Inicio + 5;
           End
        Else
           Begin
           Ano_Final := StrToInt(Copy(Data_Determinada.Text,7,4));
        End;

        While StrToInt(Copy(Data_Sistema,7,4)) <= Ano_Final Do
              Begin

              If StrToDate(Data_Sistema) >= Date() Then
                 Begin
                 Comando_SQL := 'Insert into fb_contas_pagar(';
                 Comando_SQL := Comando_SQL + 'fb_conta_pagar_data, ';
                 Comando_SQL := Comando_SQL + 'fb_conta_pagar_descricao, ';
                 Comando_SQL := Comando_SQL + 'fb_conta_pagar_valor_ser_pago, ';
                 Comando_SQL := Comando_SQL + 'fb_conta_pagar_conta, ';
                 Comando_SQL := Comando_SQL + 'fb_conta_pagar_status, ';
                 Comando_SQL := Comando_SQL + 'fb_conta_pagar_posicao, ';
                 Comando_SQL := Comando_SQL + 'fb_conta_pagar_fixo, ';
                 Comando_SQL := Comando_SQL + 'fb_conta_pagar_fornecedor_numero, ';
                 Comando_SQL := Comando_SQL + 'fb_conta_pagar_fornecedor_nome) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Data_Sistema),'amd','/') + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(Fixo_Descricao.Text) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Virgula_Ponto(Fixo_Valor.Text) + ', ';
                 Comando_SQL := Comando_SQL + Trim(Nro_Conta) + ',';
                 Comando_SQL := Comando_SQL + #39 + 'Em Aberto' + #39 + ', ';
                 Comando_SQL := Comando_SQL + '2' + ',';
                 Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(Fixo_Fornecedor_Numero.Text) + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(Fixo_Fornecedor_Nome.Text) + #39 + ')';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;
              End;

              If (StrToInt(Copy(Data_Sistema,4,2)) = 1) Or
                 (StrToInt(Copy(Data_Sistema,4,2)) = 3) Or
                 (StrToInt(Copy(Data_Sistema,4,2)) = 5) Or
                 (StrToInt(Copy(Data_Sistema,4,2)) = 7) Or
                 (StrToInt(Copy(Data_Sistema,4,2)) = 8) Or
                 (StrToInt(Copy(Data_Sistema,4,2)) = 10) Or
                 (StrToInt(Copy(Data_Sistema,4,2)) = 12) Then
                 Begin
                 Proximo_Mes := 31;
                 End
              Else If (StrToInt(Copy(Data_Sistema,4,2)) = 4) Or
                 (StrToInt(Copy(Data_Sistema,4,2)) = 6) Or
                 (StrToInt(Copy(Data_Sistema,4,2)) = 9) Or
                 (StrToInt(Copy(Data_Sistema,4,2)) = 11) Then
                 Begin
                 Proximo_Mes := 30;
                 End
              Else
                 Begin
                 Proximo_Mes := 28;
              End;

              If Opcao_Indeterminada.Checked Then
                 Begin
                 Data_Sistema := DateToStr(StrToDate(Data_Sistema) + Proximo_Mes);
                 End
              Else
                 Begin

                 If (Trim(Copy(Data_Sistema,4,2)) + Trim(Copy(Data_Sistema,7,4))) = (Trim(Copy(Data_Determinada.Text,4,2)) + Trim(Copy(Data_Determinada.Text,7,4))) Then
                    Begin
                    Data_Sistema := '01/01/2300';
                    End
                 Else
                    Begin
                    Data_Sistema := DateToStr(StrToDate(Data_Sistema) + Proximo_Mes);
                 End;
                 
              End;   
        End;

        MSG_Erro('Inclusão Efetuada...');

        Fixo01.Close;
     End;
end;

procedure TFixo01.Fixo_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFixo01.FormShow(Sender: TObject);
begin
     Fixo_Fornecedor_Numero.Text := '0';
     Fixo_Fornecedor_Nome.Text   := '--- Sem Fornecedor ---';

     Fixo_Dia.Text := Copy(DateToStr(Date()),1,2);
     Fixo_Dia.SetFocus;
end;

procedure TFixo01.Fixo_DiaKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFixo01.Fixo_DescricaoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TFixo01.Opcao_DeterminadaClick(Sender: TObject);
begin
     Data_Determinada.SetFocus;
end;

procedure TFixo01.Opcao_IndeterminadaClick(Sender: TObject);
begin
     Data_Determinada.Text := '';
end;

procedure TFixo01.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();
     Application.CreateForm(TFornecedor00,Fornecedor00);

     Fornecedor00.Programa_Anterior.Text := 'Titulo_Fixo_Inclusao';
     Fornecedor00.Fornecedor_Area.ItemIndex := 0;
     Fornecedor00.BT_Procurar.Click;

     Seta();
     Fornecedor00.ShowModal;
end;

procedure TFixo01.BT_ExcluirClick(Sender: TObject);
begin
     Fixo_Fornecedor_Numero.Text := '0';
     Fixo_Fornecedor_Nome.Text   := '--- Sem Fornecedor ---';
end;

end.
