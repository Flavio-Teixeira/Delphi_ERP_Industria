unit Rel_Comparativo_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelComparativo00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Data_Inicial: TMaskEdit;
    Data_Final: TMaskEdit;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Opcao_Soma_Dia: TRadioButton;
    Opcao_Dia_Normal: TRadioButton;
    Label2: TLabel;
    Panel4: TPanel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Conta_Padrao: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelComparativo00: TRelComparativo00;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Comparativo_01;

{$R *.dfm}

procedure TRelComparativo00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRelComparativo00.FormShow(Sender: TObject);
begin
    //*** Carrega data atual nos campos de periodo ***

    Data_Final.Text   := DateToStr(Date());
    Data_Inicial.Text := '01/' + Trim(Copy(Data_Final.Text,4,2)) + '/' + Trim(Copy(Data_Final.Text,7,4));

    //*** Obtem as Contas Padrão ***

    If Trim(Conta_Padrao.Text) = '' Then
       Begin
       ConexaoBD.SQL_FB_Conta_Bancaria.Close;
       ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Clear;
       ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Add('Select * from fb_contas_bancarias Order By fb_conta_bancaria_banco, fb_conta_bancaria_nro');
       ConexaoBD.SQL_FB_Conta_Bancaria.Open;

       Conta_Padrao.Items.Clear;
       Conta_Padrao.Items.Add('--- TODAS AS CONTAS ---');

       If ConexaoBD.SQL_FB_Conta_Bancaria.RecordCount > 0 Then
          Begin
          ConexaoBD.SQL_FB_Conta_Bancaria.First;

          While Not ConexaoBD.SQL_FB_Conta_Bancaria.Eof Do
                begin
                Conta_Padrao.Items.Add(Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_banco.Text) + ' - AG: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_agencia.Text) + ' - CC: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_conta.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_titular.Text));

                ConexaoBD.SQL_FB_Conta_Bancaria.Next;
          End;
       End;

       ConexaoBD.SQL_FB_Conta_Bancaria.Close;

       Conta_Padrao.ItemIndex := 0;
    End;

end;

procedure TRelComparativo00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     RelComparativo00 := Nil;
end;

procedure TRelComparativo00.BT_SairClick(Sender: TObject);
begin
     RelComparativo00.Close;
end;

procedure TRelComparativo00.BT_ImprimirClick(Sender: TObject);

var
   Comando_SQL, Nome_Tabela_Comparativa: String;
   Valor_Saldo: Real;
   STR_Data, STR_Historico, STR_Debito, STR_Credito, STR_D_C, STR_Saldo: String;
   Ind: Integer;

begin
     If Trim(Data_Inicial.Text) = '/  /' Then
        Begin
        MSG_Erro('Antes de prosseguir favor preencher o campo Data inicial...');
        Data_Inicial.SetFocus;
        End
     Else If Trim(Data_Final.Text) = '/  /' Then
        Begin
        MSG_Erro('Antes de prosseguir favor preencher o campo Data final...');
        Data_Final.SetFocus;
        End
     Else If StrToDate(Data_Inicial.Text) > StrToDate(Data_Final.Text) Then
        Begin
        MSG_Erro('Antes de prosseguir favor Verificar as datas Data Final menor que Data Inicial...');
        Data_Final.SetFocus;
        End
     Else
        Begin
        Ampulheta();

        //*** Prepara a Criação de Tabelas Temporárias ***

        Nome_Tabela_Comparativa := 'swap_comparativo_'+Trim(Numero_HD('C'));

        //*** Apaga a Tabela Temporária ***

        Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Comparativa;

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Cria a Tabela Temporária ***

        Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela_Comparativa + ' (';
        Comando_SQL := Comando_SQL + 'swap_comparativo_numero int(11) NOT NULL auto_increment, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_data date default NULL, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_historico varchar(255) default NULL, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_debito double(13,2) default NULL, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_credito double(13,2) default NULL, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_d_c char(1) default NULL, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_saldo double(13,2) default NULL, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_ordem int(11) default NULL, ';
        Comando_SQL := Comando_SQL + 'PRIMARY KEY  (swap_comparativo_numero) ';
        Comando_SQL := Comando_SQL + ') ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //**********************************
        //*** Obtem os Saldos das Contas ***
        //**********************************

        Valor_Saldo := 0;

        If Trim(Conta_Padrao.Text) <> '--- TODAS AS CONTAS ---' Then
           Begin
           Comando_SQL := 'Select * from fb_contas_bancarias Where fb_conta_bancaria_nro = ' + Obtem_Nro_Antes_Traco(Trim(Conta_Padrao.Text)) + ' Order By fb_conta_bancaria_banco, fb_conta_bancaria_nro';
           End
        Else
           Begin
           Comando_SQL := 'Select * from fb_contas_bancarias Order By fb_conta_bancaria_banco, fb_conta_bancaria_nro';
        End;

        ConexaoBD.SQL_FB_Conta_Bancaria.Close;
        ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Clear;
        ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_FB_Conta_Bancaria.Open;

        If ConexaoBD.SQL_FB_Conta_Bancaria.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_FB_Conta_Bancaria.First;

           While Not ConexaoBD.SQL_FB_Conta_Bancaria.Eof Do
                 Begin

                 //*** Obtem o Saldo da Conta ***

                 ConexaoBD.SQL_FB_Saldo.Close;
                 ConexaoBD.SQL_FB_Saldo.SQL.Clear;
                 ConexaoBD.SQL_FB_Saldo.SQL.Add('Select * from fb_saldos Where (fb_saldo_conta = ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ') And ((fb_saldo_data >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') And (fb_saldo_data <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By fb_saldo_data Asc, fb_saldo_nro Asc');
                 ConexaoBD.SQL_FB_Saldo.Open;

                 If ConexaoBD.SQL_FB_Saldo.RecordCount > 0 Then
                    Begin
                    Valor_Saldo := Valor_Saldo + ConexaoBD.SQL_FB_Saldofb_saldo_valor.AsFloat;
                 End;

                 ConexaoBD.SQL_FB_Conta_Bancaria.Next;
           End;

           End
        Else
           Begin
           Valor_Saldo := 0;
        End;

        //*** Registra a Informação no Comparativo ***

        STR_Historico := '--- SALDO INICIAL ---';
        STR_Debito    := '0.00';
        STR_Credito   := '0.00';

        If Valor_Saldo >= 0 Then
           Begin
           STR_D_C    := 'C';
           End
        Else
           Begin
           STR_D_C    := 'D';
        End;

        STR_Saldo     := Virgula_Ponto(FloatToStr(Valor_Saldo));

        Comando_SQL := 'Insert into ' + Nome_Tabela_Comparativa + '(';
        Comando_SQL := Comando_SQL + 'swap_comparativo_data, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_historico, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_debito, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_credito, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_d_c, ';
        Comando_SQL := Comando_SQL + 'swap_comparativo_saldo) ';
        Comando_SQL := Comando_SQL + 'Values(';
        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/') + #39 + ', ';
        Comando_SQL := Comando_SQL + #39 + Trim(STR_Historico) + #39 + ', ';
        Comando_SQL := Comando_SQL + Trim(STR_Debito) + ', ';
        Comando_SQL := Comando_SQL + Trim(STR_Credito) + ', ';
        Comando_SQL := Comando_SQL + #39 + Trim(STR_D_C) + #39 + ', ';
        Comando_SQL := Comando_SQL + Trim(STR_Saldo) + ') ';

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*******************************
        //*** Obtem as Contas a Pagar ***
        //*******************************

        ConexaoBD.SQL_FB_Conta_Pagar.Close;
        ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
        ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By fb_conta_pagar_data ASC, fb_conta_pagar_descricao ASC');
        ConexaoBD.SQL_FB_Conta_Pagar.Open;

        If ConexaoBD.SQL_FB_Conta_Pagar.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_FB_Conta_Pagar.First;

           While Not ConexaoBD.SQL_FB_Conta_Pagar.Eof Do
                 Begin

                 //*** Registra a Informação no Comparativo ***

                 STR_Data      := ConexaoBD.SQL_FB_Conta_Pagarfb_conta_pagar_data.Text;

                 If DayOfWeek(StrToDate(STR_Data)) = 1 Then //Domingo
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                    End
                 Else If DayOfWeek(StrToDate(STR_Data)) = 7 Then //Sábado
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 2);
                 End;

                 STR_Historico := ConexaoBD.SQL_FB_Conta_Pagarfb_conta_pagar_descricao.Text;
                 STR_Credito   := '0.00';

                 If ConexaoBD.SQL_FB_Conta_Pagarfb_conta_pagar_valor_ser_pago.AsFloat > 0 Then
                    Begin
                    STR_Debito  := Virgula_Ponto(ConexaoBD.SQL_FB_Conta_Pagarfb_conta_pagar_valor_ser_pago.Text);
                    End
                 Else
                    Begin
                    STR_Debito  := Virgula_Ponto(ConexaoBD.SQL_FB_Conta_Pagarfb_conta_pagar_valor.Text);
                 End;

                 STR_D_C    := 'D';
                 STR_Saldo  := '0.00';

                 Comando_SQL := 'Insert into ' + Nome_Tabela_Comparativa + '(';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_data, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_historico, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_debito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_credito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_d_c, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_saldo) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(STR_Data),'amd','/') + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_Historico) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Debito) + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Credito) + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_D_C) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Saldo) + ') ';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 ConexaoBD.SQL_FB_Conta_Pagar.Next;
           End;
        End;

        //*********************************
        //*** Obtem as Contas a Receber ***
        //*********************************

        //**********************************
        //*** Nota Fiscal - 1 Vencimento ***
        //**********************************

        ConexaoBD.SQL_FB_Nota_Fiscal.Close;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where ((fb_nota_fiscal_dup_dt_vcto_1 >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') And (fb_nota_fiscal_dup_dt_vcto_1 <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By fb_nota_fiscal_dup_dt_vcto_1 ASC, fb_nota_fiscal_numero ASC');
        ConexaoBD.SQL_FB_Nota_Fiscal.Open;

        If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_FB_Nota_Fiscal.First;

           While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
                 Begin

                 //*** Registra a Informação no Comparativo ***

                 STR_Data      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;

                 If Opcao_Soma_Dia.Checked Then
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                 End;

                 If DayOfWeek(StrToDate(STR_Data)) = 1 Then //Domingo
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                    End
                 Else If DayOfWeek(StrToDate(STR_Data)) = 7 Then //Sábado
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 2);
                 End;

                 STR_Historico := Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text) + ' - CNPJ: ' + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text);
                 STR_Debito    := '0.00';

                 If ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_1.AsFloat > 0 Then
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_1.Text);
                    End
                 Else
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text);
                 End;

                 STR_D_C    := 'C';
                 STR_Saldo  := '0.00';

                 Comando_SQL := 'Insert into ' + Nome_Tabela_Comparativa + '(';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_data, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_historico, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_debito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_credito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_d_c, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_saldo) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(STR_Data),'amd','/') + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_Historico) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Debito) + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Credito) + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_D_C) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Saldo) + ') ';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 ConexaoBD.SQL_FB_Nota_Fiscal.Next;
           End;
        End;

        //**********************************
        //*** Nota Fiscal - 2 Vencimento ***
        //**********************************

        ConexaoBD.SQL_FB_Nota_Fiscal.Close;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where ((fb_nota_fiscal_dup_dt_vcto_2 >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') And (fb_nota_fiscal_dup_dt_vcto_2 <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By fb_nota_fiscal_dup_dt_vcto_2 ASC, fb_nota_fiscal_numero ASC');
        ConexaoBD.SQL_FB_Nota_Fiscal.Open;

        If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_FB_Nota_Fiscal.First;

           While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
                 Begin

                 //*** Registra a Informação no Comparativo ***

                 STR_Data      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;

                 If Opcao_Soma_Dia.Checked Then
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                 End;

                 If DayOfWeek(StrToDate(STR_Data)) = 1 Then //Domingo
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                    End
                 Else If DayOfWeek(StrToDate(STR_Data)) = 7 Then //Sábado
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 2);
                 End;

                 STR_Historico := Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text) + ' - CNPJ: ' + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text);
                 STR_Debito    := '0.00';

                 If ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_2.AsFloat > 0 Then
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_2.Text);
                    End
                 Else
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text);
                 End;

                 STR_D_C    := 'C';
                 STR_Saldo  := '0.00';

                 Comando_SQL := 'Insert into ' + Nome_Tabela_Comparativa + '(';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_data, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_historico, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_debito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_credito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_d_c, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_saldo) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(STR_Data),'amd','/') + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_Historico) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Debito) + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Credito) + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_D_C) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Saldo) + ') ';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 ConexaoBD.SQL_FB_Nota_Fiscal.Next;
           End;
        End;

        //**********************************
        //*** Nota Fiscal - 3 Vencimento ***
        //**********************************

        ConexaoBD.SQL_FB_Nota_Fiscal.Close;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where ((fb_nota_fiscal_dup_dt_vcto_3 >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') And (fb_nota_fiscal_dup_dt_vcto_3 <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By fb_nota_fiscal_dup_dt_vcto_3 ASC, fb_nota_fiscal_numero ASC');
        ConexaoBD.SQL_FB_Nota_Fiscal.Open;

        If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_FB_Nota_Fiscal.First;

           While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
                 Begin

                 //*** Registra a Informação no Comparativo ***

                 STR_Data      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;

                 If Opcao_Soma_Dia.Checked Then
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                 End;

                 If DayOfWeek(StrToDate(STR_Data)) = 1 Then //Domingo
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                    End
                 Else If DayOfWeek(StrToDate(STR_Data)) = 7 Then //Sábado
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 2);
                 End;

                 STR_Historico := Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text) + ' - CNPJ: ' + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text);
                 STR_Debito    := '0.00';

                 If ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_3.AsFloat > 0 Then
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_3.Text);
                    End
                 Else
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text);
                 End;

                 STR_D_C    := 'C';
                 STR_Saldo  := '0.00';

                 Comando_SQL := 'Insert into ' + Nome_Tabela_Comparativa + '(';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_data, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_historico, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_debito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_credito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_d_c, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_saldo) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(STR_Data),'amd','/') + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_Historico) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Debito) + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Credito) + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_D_C) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Saldo) + ') ';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 ConexaoBD.SQL_FB_Nota_Fiscal.Next;
           End;
        End;

        //**********************************
        //*** Nota Fiscal - 4 Vencimento ***
        //**********************************

        ConexaoBD.SQL_FB_Nota_Fiscal.Close;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where ((fb_nota_fiscal_dup_dt_vcto_4 >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') And (fb_nota_fiscal_dup_dt_vcto_4 <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By fb_nota_fiscal_dup_dt_vcto_4 ASC, fb_nota_fiscal_numero ASC');
        ConexaoBD.SQL_FB_Nota_Fiscal.Open;

        If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_FB_Nota_Fiscal.First;

           While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
                 Begin

                 //*** Registra a Informação no Comparativo ***

                 STR_Data      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_4.Text;

                 If Opcao_Soma_Dia.Checked Then
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                 End;

                 If DayOfWeek(StrToDate(STR_Data)) = 1 Then //Domingo
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                    End
                 Else If DayOfWeek(StrToDate(STR_Data)) = 7 Then //Sábado
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 2);
                 End;

                 STR_Historico := Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_4.Text) + ' - CNPJ: ' + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text);
                 STR_Debito    := '0.00';

                 If ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_4.AsFloat > 0 Then
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_pgto_4.Text);
                    End
                 Else
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.Text);
                 End;

                 STR_D_C    := 'C';
                 STR_Saldo  := '0.00';

                 Comando_SQL := 'Insert into ' + Nome_Tabela_Comparativa + '(';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_data, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_historico, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_debito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_credito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_d_c, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_saldo) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(STR_Data),'amd','/') + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_Historico) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Debito) + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Credito) + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_D_C) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Saldo) + ') ';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 ConexaoBD.SQL_FB_Nota_Fiscal.Next;
           End;
        End;

        //*******************************
        //*** Papeleta - 1 Vencimento ***
        //*******************************

        ConexaoBD.SQL_FB_Papeletas.Close;
        ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
        ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * from fb_papeletas Where ((fb_papeleta_dup_dt_vcto_1 >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') And (fb_papeleta_dup_dt_vcto_1 <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By fb_papeleta_dup_dt_vcto_1 ASC, fb_papeleta_numero ASC');
        ConexaoBD.SQL_FB_Papeletas.Open;

        If ConexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_FB_Papeletas.First;

           While Not ConexaoBD.SQL_FB_Papeletas.Eof Do
                 Begin

                 //*** Registra a Informação no Comparativo ***

                 STR_Data      := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_1.Text;

                 If Opcao_Soma_Dia.Checked Then
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                 End;

                 If DayOfWeek(StrToDate(STR_Data)) = 1 Then //Domingo
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                    End
                 Else If DayOfWeek(StrToDate(STR_Data)) = 7 Then //Sábado
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 2);
                 End;

                 STR_Historico := Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_1.Text) + ' - CNPJ: ' + Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_nome.Text);
                 STR_Debito    := '0.00';

                 If ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_1.AsFloat > 0 Then
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_1.Text);
                    End
                 Else
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_1.Text);
                 End;

                 STR_D_C    := 'C';
                 STR_Saldo  := '0.00';

                 Comando_SQL := 'Insert into ' + Nome_Tabela_Comparativa + '(';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_data, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_historico, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_debito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_credito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_d_c, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_saldo) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(STR_Data),'amd','/') + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_Historico) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Debito) + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Credito) + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_D_C) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Saldo) + ') ';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 ConexaoBD.SQL_FB_Papeletas.Next;
           End;
        End;

        //*******************************
        //*** Papeleta - 2 Vencimento ***
        //*******************************

        ConexaoBD.SQL_FB_Papeletas.Close;
        ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
        ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * from fb_papeletas Where ((fb_papeleta_dup_dt_vcto_2 >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') And (fb_papeleta_dup_dt_vcto_2 <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By fb_papeleta_dup_dt_vcto_2 ASC, fb_papeleta_numero ASC');
        ConexaoBD.SQL_FB_Papeletas.Open;

        If ConexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_FB_Papeletas.First;

           While Not ConexaoBD.SQL_FB_Papeletas.Eof Do
                 Begin

                 //*** Registra a Informação no Comparativo ***

                 STR_Data      := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_2.Text;

                 If Opcao_Soma_Dia.Checked Then
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                 End;

                 If DayOfWeek(StrToDate(STR_Data)) = 1 Then //Domingo
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                    End
                 Else If DayOfWeek(StrToDate(STR_Data)) = 7 Then //Sábado
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 2);
                 End;

                 STR_Historico := Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_2.Text) + ' - CNPJ: ' + Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_nome.Text);
                 STR_Debito    := '0.00';

                 If ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_2.AsFloat > 0 Then
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_2.Text);
                    End
                 Else
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_2.Text);
                 End;

                 STR_D_C    := 'C';
                 STR_Saldo  := '0.00';

                 Comando_SQL := 'Insert into ' + Nome_Tabela_Comparativa + '(';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_data, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_historico, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_debito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_credito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_d_c, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_saldo) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(STR_Data),'amd','/') + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_Historico) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Debito) + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Credito) + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_D_C) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Saldo) + ') ';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 ConexaoBD.SQL_FB_Papeletas.Next;
           End;
        End;

        //*******************************
        //*** Papeleta - 3 Vencimento ***
        //*******************************

        ConexaoBD.SQL_FB_Papeletas.Close;
        ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
        ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * from fb_papeletas Where ((fb_papeleta_dup_dt_vcto_3 >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') And (fb_papeleta_dup_dt_vcto_3 <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By fb_papeleta_dup_dt_vcto_3 ASC, fb_papeleta_numero ASC');
        ConexaoBD.SQL_FB_Papeletas.Open;

        If ConexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_FB_Papeletas.First;

           While Not ConexaoBD.SQL_FB_Papeletas.Eof Do
                 Begin

                 //*** Registra a Informação no Comparativo ***

                 STR_Data      := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_3.Text;

                 If Opcao_Soma_Dia.Checked Then
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                 End;

                 If DayOfWeek(StrToDate(STR_Data)) = 1 Then //Domingo
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                    End
                 Else If DayOfWeek(StrToDate(STR_Data)) = 7 Then //Sábado
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 2);
                 End;

                 STR_Historico := Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_3.Text) + ' - CNPJ: ' + Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_nome.Text);
                 STR_Debito    := '0.00';

                 If ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_3.AsFloat > 0 Then
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_3.Text);
                    End
                 Else
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_3.Text);
                 End;

                 STR_D_C    := 'C';
                 STR_Saldo  := '0.00';

                 Comando_SQL := 'Insert into ' + Nome_Tabela_Comparativa + '(';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_data, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_historico, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_debito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_credito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_d_c, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_saldo) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(STR_Data),'amd','/') + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_Historico) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Debito) + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Credito) + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_D_C) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Saldo) + ') ';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 ConexaoBD.SQL_FB_Papeletas.Next;
           End;
        End;

        //*******************************
        //*** Papeleta - 4 Vencimento ***
        //*******************************

        ConexaoBD.SQL_FB_Papeletas.Close;
        ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
        ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * from fb_papeletas Where ((fb_papeleta_dup_dt_vcto_4 >= '+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') And (fb_papeleta_dup_dt_vcto_4 <= '+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By fb_papeleta_dup_dt_vcto_4 ASC, fb_papeleta_numero ASC');
        ConexaoBD.SQL_FB_Papeletas.Open;

        If ConexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_FB_Papeletas.First;

           While Not ConexaoBD.SQL_FB_Papeletas.Eof Do
                 Begin

                 //*** Registra a Informação no Comparativo ***

                 STR_Data      := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_4.Text;

                 If Opcao_Soma_Dia.Checked Then
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                 End;

                 If DayOfWeek(StrToDate(STR_Data)) = 1 Then //Domingo
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 1);
                    End
                 Else If DayOfWeek(StrToDate(STR_Data)) = 7 Then //Sábado
                    Begin
                    STR_Data   := DateToStr(StrToDate(STR_Data) + 2);
                 End;

                 STR_Historico := Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_nro_4.Text) + ' - CNPJ: ' + Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_nome.Text);
                 STR_Debito    := '0.00';

                 If ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_4.AsFloat > 0 Then
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_pgto_4.Text);
                    End
                 Else
                    Begin
                    STR_Credito := Virgula_Ponto(ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_4.Text);
                 End;

                 STR_D_C    := 'C';
                 STR_Saldo  := '0.00';

                 Comando_SQL := 'Insert into ' + Nome_Tabela_Comparativa + '(';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_data, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_historico, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_debito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_credito, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_d_c, ';
                 Comando_SQL := Comando_SQL + 'swap_comparativo_saldo) ';
                 Comando_SQL := Comando_SQL + 'Values(';
                 Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(STR_Data),'amd','/') + #39 + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_Historico) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Debito) + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Credito) + ', ';
                 Comando_SQL := Comando_SQL + #39 + Trim(STR_D_C) + #39 + ', ';
                 Comando_SQL := Comando_SQL + Trim(STR_Saldo) + ') ';

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 ConexaoBD.SQL_FB_Papeletas.Next;
           End;
        End;

        //************************
        //*** Gera o Relatório ***
        //************************

        //*** Ordena o Relatório ***

        Comando_SQL := 'Select * From ' + Nome_Tabela_Comparativa + ' Order By swap_comparativo_data Asc, swap_comparativo_d_c Asc, swap_comparativo_historico Asc';

        ConexaoBD.SQL_Swap_Comparativo.Close;
        ConexaoBD.SQL_Swap_Comparativo.SQL.Clear;
        ConexaoBD.SQL_Swap_Comparativo.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Swap_Comparativo.Open;

        If ConexaoBD.SQL_Swap_Comparativo.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_Swap_Comparativo.First;

           Ind := 0;

           While Not ConexaoBD.SQL_Swap_Comparativo.Eof Do
                 Begin
                 Ind := Ind + 1;

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add('Update ' + Nome_Tabela_Comparativa + ' Set swap_comparativo_ordem = ' + IntToStr(Ind) + ' Where swap_comparativo_numero = ' + Trim(ConexaoBD.SQL_Swap_Comparativoswap_comparativo_numero.Text) );
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 ConexaoBD.SQL_Swap_Comparativo.Next;
           End;
        End;

        //*** Calcula o Saldo ***

        Comando_SQL := 'Select * From ' + Nome_Tabela_Comparativa + ' Order By swap_comparativo_ordem Asc';

        ConexaoBD.SQL_Swap_Comparativo.Close;
        ConexaoBD.SQL_Swap_Comparativo.SQL.Clear;
        ConexaoBD.SQL_Swap_Comparativo.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Swap_Comparativo.Open;

        If ConexaoBD.SQL_Swap_Comparativo.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_Swap_Comparativo.First;

           While Not ConexaoBD.SQL_Swap_Comparativo.Eof Do
                 Begin

                 If ConexaoBD.SQL_Swap_Comparativoswap_comparativo_debito.AsFloat > 0 Then
                    Begin
                    Valor_Saldo := Valor_Saldo - ConexaoBD.SQL_Swap_Comparativoswap_comparativo_debito.AsFloat;
                 End;

                 If ConexaoBD.SQL_Swap_Comparativoswap_comparativo_credito.AsFloat > 0 Then
                    Begin
                    Valor_Saldo := Valor_Saldo + ConexaoBD.SQL_Swap_Comparativoswap_comparativo_credito.AsFloat;
                 End;

                 If Valor_Saldo >= 0 Then
                    Begin
                    STR_D_C    := 'C';
                    End
                 Else
                    Begin
                    STR_D_C    := 'D';
                 End;

                 STR_Saldo     := Virgula_Ponto(FloatToStr(Valor_Saldo));

                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                 ConexaoBD.SQL_Comunitario.SQL.Add('Update ' + Nome_Tabela_Comparativa + ' Set swap_comparativo_d_c = ' +#39+ Trim(STR_D_C) +#39+ ', swap_comparativo_saldo = ' + Trim(STR_Saldo) + ' Where swap_comparativo_numero = ' + Trim(ConexaoBD.SQL_Swap_Comparativoswap_comparativo_numero.Text) );
                 ConexaoBD.SQL_Comunitario.ExecSQL;

                 ConexaoBD.SQL_Swap_Comparativo.Next;
           End;
        End;

        //*** Prepara o Relatório para Exibição ***

        Application.CreateForm(TRelComparativo01,RelComparativo01);

        Comando_SQL := 'Select * From ' + Nome_Tabela_Comparativa + ' Order By swap_comparativo_ordem Asc';

        ConexaoBD.SQL_Swap_Comparativo.Close;
        ConexaoBD.SQL_Swap_Comparativo.SQL.Clear;
        ConexaoBD.SQL_Swap_Comparativo.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Swap_Comparativo.Open;

        RelComparativo01.QR_Periodo.Caption := 'Péríodo de ' + Data_Inicial.Text + ' a ' + Data_Final.Text;

        Seta();

        RelComparativo01.QR_Comparativo.Preview;
        RelComparativo01.QR_Comparativo.Destroy;
        RelComparativo01.Destroy;

        //*** Apaga a Tabela Temporária ***

        ConexaoBD.SQL_Swap_Comparativo.Close;

        Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela_Comparativa;

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
     End;
end;

end.
