unit Boletos_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, ImpMat, gbCobranca;

type
  TBoletos01 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BT_Sair: TBitBtn;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Dados_Procura: TEdit;
    Label2: TLabel;
    Opcoes_Procura: TComboBox;
    BT_Procurar: TBitBtn;
    Dados_Cliente: TGroupBox;
    Duplicata_1: TGroupBox;
    BT_Imprimir: TBitBtn;
    Label12: TLabel;
    Duplicata_Vencto_1: TMaskEdit;
    Label4: TLabel;
    Duplicata_Emissao_1: TMaskEdit;
    Duplicata_Docto_1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Duplicata_Valor_1: TEdit;
    Duplicata_Referente_1: TEdit;
    Label7: TLabel;
    Duplicata_Emite_1: TCheckBox;
    Duplicata_2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Duplicata_Vencto_2: TMaskEdit;
    Duplicata_Emissao_2: TMaskEdit;
    Duplicata_Docto_2: TEdit;
    Duplicata_Valor_2: TEdit;
    Duplicata_Referente_2: TEdit;
    Duplicata_Emite_2: TCheckBox;
    Duplicata_3: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Duplicata_Vencto_3: TMaskEdit;
    Duplicata_Emissao_3: TMaskEdit;
    Duplicata_Docto_3: TEdit;
    Duplicata_Valor_3: TEdit;
    Duplicata_Referente_3: TEdit;
    Duplicata_Emite_3: TCheckBox;
    Imprimir: TImpMat;
    LBL_Endereco_1: TLabel;
    LBL_Endereco_2: TLabel;
    LBL_Endereco_3: TLabel;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Duplicata_Vencto_4: TMaskEdit;
    Duplicata_Emissao_4: TMaskEdit;
    Duplicata_Docto_4: TEdit;
    Duplicata_Valor_4: TEdit;
    Duplicata_Referente_4: TEdit;
    Duplicata_Emite_4: TCheckBox;
    Label17: TLabel;
    Duplicata_Nro_1: TEdit;
    Label19: TLabel;
    Duplicata_Nro_2: TEdit;
    Label20: TLabel;
    Duplicata_Nro_3: TEdit;
    Label26: TLabel;
    Duplicata_Nro_4: TEdit;
    LBL_Codigo: TLabel;
    LBL_Inscricao: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Duplicata_Emite_1Click(Sender: TObject);
    procedure Duplicata_Emite_2Click(Sender: TObject);
    procedure Duplicata_Emite_3Click(Sender: TObject);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Emite_1KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Vencto_1KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Emissao_1KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Docto_1KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Referente_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure Duplicata_Valor_1KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Emite_2KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Vencto_2KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Emissao_2KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Docto_2KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Referente_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure Duplicata_Valor_2KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Emite_3KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Vencto_3KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Emissao_3KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Docto_3KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Referente_3KeyPress(Sender: TObject;
      var Key: Char);
    procedure Duplicata_Valor_3KeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure Duplicata_Emite_4Click(Sender: TObject);
    procedure Duplicata_Emite_4KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Vencto_4KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Emissao_4KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Docto_4KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Referente_4KeyPress(Sender: TObject;
      var Key: Char);
    procedure Duplicata_Valor_4KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Duplicata_Nro_1KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Nro_2KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Nro_3KeyPress(Sender: TObject; var Key: Char);
    procedure Duplicata_Nro_4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
    procedure Imprime_Boletos();
    procedure Registra_Boleto_Impresso(Nro_Boleto, Posicao: String);

    function Extenso(parmNumero: Real): string;
    function ConversaoRecursiva(N: LongWord): string;    

  public
    { Public declarations }
  end;

  TNumeroStr = string;

const
  Unidades: array[1..19] of TNumeroStr = ('um', 'dois', 'três', 'quatro','cinco', 'seis', 'sete', 'oito', 'nove', 'dez', 'onze', 'doze', 'treze', 'quatorze', 'quinze', 'dezesseis', 'dezessete', 'dezoito','dezenove');
  Dezenas: array[1..9] of TNumeroStr = ('dez', 'vinte', 'trinta', 'quarenta','cinqüenta', 'sessenta', 'setenta', 'oitenta', 'noventa');
  Centenas: array[1..9] of TNumeroStr = ('cem', 'duzentos', 'trezentos','quatrocentos', 'quinhentos', 'seiscentos', 'setecentos', 'oitocentos','novecentos');
  ErrorString = 'Valor fora da faixa';
  Min = 0.01;
  Max = 4294967295.99;
  Moeda = ' real ';
  Moedas = ' reais ';
  Centesimo = ' centavo ';
  Centesimos = ' centavos ';

var
  Boletos01: TBoletos01;
  Codigo_Cliente: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00, DateUtils;

{$R *.dfm}

//*****************
//*** Functions ***
//*****************

function TBoletos01.ConversaoRecursiva(N: LongWord): string;
begin
     case N of
          1..19: Result := Unidades[N];
          20, 30, 40, 50, 60, 70, 80, 90: Result := Dezenas[N div 10] + ' ';
          21..29, 31..39, 41..49, 51..59, 61..69, 71..79, 81..89, 91..99: Result := Dezenas[N div 10] + ' e ' + ConversaoRecursiva(N mod 10);
          100, 200, 300, 400, 500, 600, 700, 800, 900: Result := Centenas[N div 100] + ' ';
          101..199: Result := ' cento e ' + ConversaoRecursiva(N mod 100);
          201..299, 301..399, 401..499, 501..599, 601..699, 701..799, 801..899, 901..999: Result := Centenas[N div 100] + ' e ' + ConversaoRecursiva(N mod 100);
          1000..999999: Result := ConversaoRecursiva(N div 1000) + ' mil ' + ConversaoRecursiva(N mod 1000);
          1000000..1999999: Result := ConversaoRecursiva(N div 1000000) + ' milhão '+ ConversaoRecursiva(N mod 1000000);
          2000000..999999999: Result := ConversaoRecursiva(N div 1000000) + ' milhões '+ ConversaoRecursiva(N mod 1000000);
          1000000000..1999999999: Result := ConversaoRecursiva(N div 1000000000) + ' bilhão ' + ConversaoRecursiva(N mod 1000000000);
          2000000000..4294967295: Result := ConversaoRecursiva(N div 1000000000) + ' bilhões ' + ConversaoRecursiva(N mod 1000000000);
     end;
end;

function TBoletos01.Extenso(parmNumero: Real): string;
begin
     if (parmNumero >= Min) and (parmNumero <= Max) then
        begin
        Result := ConversaoRecursiva(Round(Int(parmNumero)));

        if Round(Int(parmNumero)) = 1 then

           {Tratar Reais}

           begin
           Result := Result + Moeda
           end
        else
           begin

           {Tratar Reais}

           if Round(Int(parmNumero)) <> 0 then
              begin
              Result := Result + Moedas;
           end;

           {Tratar centavos}

           if not(Frac(parmNumero) = 0.00) then
              begin
              if Round(Int(parmNumero)) <> 0 then
                 begin
                 Result := Result + ' e ';
                 Result := Result + ConversaoRecursiva(Round(Frac(parmNumero) * 100));
                 if (Round(Frac(parmNumero) * 100) = 1) then
                    begin
                    Result := Result + centesimo
                    end
                 else
                    begin
                    Result := Result + centesimos;
                 end;
                 end
              else
                 begin
                 raise ERangeError.CreateFmt('%g ' + ErrorString + ' %g..%g',[parmNumero, Min, Max]);
              end;
           end;
        end;
     end;
end;

function TBoletos01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Duplicata_Emite_1.Checked = True Then
        Begin
        If Trim(Duplicata_Nro_1.Text) = '/  /' Then
           Begin
           Erro          := 'O Número da Nota não foi informado';
           Campo_Retorno := 'Duplicata_Nro_1';
           End
        Else If Trim(Duplicata_Vencto_1.Text) = '/  /' Then
           Begin
           Erro          := 'A Data de Vencimento não foi informada';
           Campo_Retorno := 'Duplicata_Vencto_1';
           End
        Else If Trim(Duplicata_Emissao_1.Text) = '/  /' Then
           Begin
           Erro          := 'A Data de Emissão não foi informada';
           Campo_Retorno := 'Duplicata_Emissao_1';
           End
        Else If Trim(Duplicata_Docto_1.Text) = '' Then
           Begin
           Erro          := 'O Número da Duplicata não foi informado';
           Campo_Retorno := 'Duplicata_Docto_1';
           End
        Else If Trim(Duplicata_Valor_1.Text) = '' Then
           Begin
           Erro          := 'O Valor da Duplicata não foi informado';
           Campo_Retorno := 'Duplicata_Valor_1';
        End;
     End;

     If Duplicata_Emite_2.Checked = True Then
        Begin
        If Trim(Duplicata_Nro_2.Text) = '/  /' Then
           Begin
           Erro          := 'O Número da Nota não foi informado';
           Campo_Retorno := 'Duplicata_Nro_2';
           End
        Else If Trim(Duplicata_Vencto_2.Text) = '/  /' Then
           Begin
           Erro          := 'A Data de Vencimento não foi informada';
           Campo_Retorno := 'Duplicata_Vencto_2';
           End
        Else If Trim(Duplicata_Emissao_2.Text) = '/  /' Then
           Begin
           Erro          := 'A Data de Emissão não foi informada';
           Campo_Retorno := 'Duplicata_Emissao_2';
           End
        Else If Trim(Duplicata_Docto_2.Text) = '' Then
           Begin
           Erro          := 'O Número da Duplicata não foi informado';
           Campo_Retorno := 'Duplicata_Docto_2';
           End
        Else If Trim(Duplicata_Valor_2.Text) = '' Then
           Begin
           Erro          := 'O Valor da Duplicata não foi informado';
           Campo_Retorno := 'Duplicata_Valor_2';
        End;
     End;

     If Duplicata_Emite_3.Checked = True Then
        Begin
        If Trim(Duplicata_Nro_3.Text) = '/  /' Then
           Begin
           Erro          := 'O Número da Nota não foi informado';
           Campo_Retorno := 'Duplicata_Nro_3';
           End
        Else If Trim(Duplicata_Vencto_3.Text) = '/  /' Then
           Begin
           Erro          := 'A Data de Vencimento não foi informada';
           Campo_Retorno := 'Duplicata_Vencto_3';
           End
        Else If Trim(Duplicata_Emissao_3.Text) = '/  /' Then
           Begin
           Erro          := 'A Data de Emissão não foi informada';
           Campo_Retorno := 'Duplicata_Emissao_3';
           End
        Else If Trim(Duplicata_Docto_3.Text) = '' Then
           Begin
           Erro          := 'O Número da Duplicata não foi informado';
           Campo_Retorno := 'Duplicata_Docto_3';
           End
        Else If Trim(Duplicata_Valor_3.Text) = '' Then
           Begin
           Erro          := 'O Valor da Duplicata não foi informado';
           Campo_Retorno := 'Duplicata_Valor_3';
        End;
     End;

     If Duplicata_Emite_4.Checked = True Then
        Begin
        If Trim(Duplicata_Nro_4.Text) = '/  /' Then
           Begin
           Erro          := 'O Número da Nota não foi informado';
           Campo_Retorno := 'Duplicata_Nro_4';
           End
        Else If Trim(Duplicata_Vencto_4.Text) = '/  /' Then
           Begin
           Erro          := 'A Data de Vencimento não foi informada';
           Campo_Retorno := 'Duplicata_Vencto_4';
           End
        Else If Trim(Duplicata_Emissao_4.Text) = '/  /' Then
           Begin
           Erro          := 'A Data de Emissão não foi informada';
           Campo_Retorno := 'Duplicata_Emissao_4';
           End
        Else If Trim(Duplicata_Docto_4.Text) = '' Then
           Begin
           Erro          := 'O Número da Duplicata não foi informado';
           Campo_Retorno := 'Duplicata_Docto_4';
           End
        Else If Trim(Duplicata_Valor_4.Text) = '' Then
           Begin
           Erro          := 'O Valor da Duplicata não foi informado';
           Campo_Retorno := 'Duplicata_Valor_4';
        End;
     End;

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Duplicata_Nro_1' Then
           Begin
           Duplicata_Nro_1.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Vencto_1' Then
           Begin
           Duplicata_Vencto_1.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Emissao_1' Then
           Begin
           Duplicata_Emissao_1.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Docto_1' Then
           Begin
           Duplicata_Docto_1.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Valor_1' Then
           Begin
           Duplicata_Valor_1.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Nro_2' Then
           Begin
           Duplicata_Nro_1.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Vencto_2' Then
           Begin
           Duplicata_Vencto_2.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Emissao_2' Then
           Begin
           Duplicata_Emissao_2.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Docto_2' Then
           Begin
           Duplicata_Docto_2.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Valor_2' Then
           Begin
           Duplicata_Valor_2.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Nro_3' Then
           Begin
           Duplicata_Nro_1.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Vencto_3' Then
           Begin
           Duplicata_Vencto_3.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Emissao_3' Then
           Begin
           Duplicata_Emissao_3.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Docto_3' Then
           Begin
           Duplicata_Docto_3.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Valor_3' Then
           Begin
           Duplicata_Valor_3.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Nro_4' Then
           Begin
           Duplicata_Nro_1.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Vencto_4' Then
           Begin
           Duplicata_Vencto_4.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Emissao_4' Then
           Begin
           Duplicata_Emissao_4.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Docto_4' Then
           Begin
           Duplicata_Docto_4.SetFocus;
           End
        Else If Campo_Retorno = 'Duplicata_Valor_4' Then
           Begin
           Duplicata_Valor_4.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TBoletos01.Imprime_Boletos();

var
   Impressora: TextFile;
   Linha, Ind, Posicao_Total: Integer;
   Numero_Nota, Numero_Nota_8, Numero_Nota_4, Banco_Cliente, Comando_SQL, Observacao_1: String;
   Nro_Duplicata, DT_Emissao_Duplicata, DT_Vecto_Duplicata, Vlr_Duplicata_Str, Mora_Dia_Str: String;
   Valor_Extenso, Endereco_1, Endereco_2, Endereco_3: String;
   Mora_Dia_Nro, Vlr_Duplicata_Nro: Real;
   Pessoa_Juridica: Boolean;
   Zeros_Antes, Boleto_Banco: String;

begin
     If ((Duplicata_Emite_1.Checked = True) Or (Duplicata_Emite_2.Checked = True) Or (Duplicata_Emite_3.Checked = True) Or (Duplicata_Emite_4.Checked = True) ) Then
        Begin

        Ampulheta();

              Endereco_1 := Letra_Maiuscula(LBL_Endereco_1.Caption);
              Endereco_2 := Letra_Maiuscula(LBL_Endereco_2.Caption);
              Endereco_3 := Letra_Maiuscula(LBL_Endereco_3.Caption);

              If Duplicata_Emite_1.Checked Then
                 Begin
                 Numero_Nota          := Duplicata_Nro_1.Text;
                 Observacao_1         := Duplicata_Referente_1.Text;

                 Nro_Duplicata        := Duplicata_Docto_1.Text;
                 DT_Emissao_Duplicata := Duplicata_Emissao_1.Text;
                 DT_Vecto_Duplicata   := Duplicata_Vencto_1.Text;
                 Vlr_Duplicata_Str    := Duplicata_Valor_1.Text;

                 //*** Impressao do Boleto na Matricial ***

                 Linha := 7;
                 Imprimir.PoeStr(Linha,001, #15+'.');
                 Imprimir.PoeStr(Linha,076, Trim(DT_Emissao_Duplicata));

                 Linha := Linha + 4;
                 //Imprimir.PoeStr(Linha,015, 'R$ ' + Trim(Vlr_Duplicata_Str));
                 Imprimir.PoeStr(Linha,019, Numero_Nota);
                 Imprimir.PoeStr(Linha,039, 'R$ ' + Trim(Vlr_Duplicata_Str));
                 Imprimir.PoeStr(Linha,064, Nro_Duplicata);
                 Imprimir.PoeStr(Linha,085, DT_Vecto_Duplicata);

                 If (Trim(Observacao_1) <> '') Then
                    Begin
                   Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),1,20)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),21,40)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),41,60)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),61,80)) );
                 End;

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_1)) );

                 Linha := Linha + 2;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_2)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_3)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula( Copy(Trim(Endereco_2)+ ' - ' +Trim(Endereco_3),1,85)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(LBL_Codigo.Caption)) );
                 Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(LBL_Inscricao.Caption)) );

                 Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                 Linha := Linha + 3;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                 If Confirma('Nro.: '+Trim(Numero_Nota)+' - 1a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em Ok para Imprimir.') = 6 Then
                    Begin
                    Imprimir.ImprimeJob;
                 End;

                 Imprimir.LimpaBuffer;
              End;

              If Duplicata_Emite_2.Checked Then
                 Begin
                 Numero_Nota          := Duplicata_Nro_2.Text;
                 Observacao_1         := Duplicata_Referente_2.Text;

                 Nro_Duplicata        := Duplicata_Docto_2.Text;
                 DT_Emissao_Duplicata := Duplicata_Emissao_2.Text;
                 DT_Vecto_Duplicata   := Duplicata_Vencto_2.Text;
                 Vlr_Duplicata_Str    := Duplicata_Valor_2.Text;

                 //*** Impressao do Boleto na Matricial ***

                 Linha := 7;
                 Imprimir.PoeStr(Linha,001, #15+'.');
                 Imprimir.PoeStr(Linha,076, Trim(DT_Emissao_Duplicata));

                 Linha := Linha + 4;
                 //Imprimir.PoeStr(Linha,015, 'R$ ' + Trim(Vlr_Duplicata_Str));
                 Imprimir.PoeStr(Linha,019, Numero_Nota);
                 Imprimir.PoeStr(Linha,039, 'R$ ' + Trim(Vlr_Duplicata_Str));
                 Imprimir.PoeStr(Linha,064, Nro_Duplicata);
                 Imprimir.PoeStr(Linha,085, DT_Vecto_Duplicata);

                 If (Trim(Observacao_1) <> '') Then
                    Begin
                   Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),1,20)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),21,40)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),41,60)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),61,80)) );
                 End;

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_1)) );

                 Linha := Linha + 2;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_2)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_3)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula( Copy(Trim(Endereco_2)+ ' - ' +Trim(Endereco_3),1,85)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(LBL_Codigo.Caption)) );
                 Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(LBL_Inscricao.Caption)) );

                 Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                 Linha := Linha + 3;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                 If Confirma('Nro.: '+Trim(Numero_Nota)+' - 2a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em Ok para Imprimir.') = 6 Then
                    Begin
                    Imprimir.ImprimeJob;
                 End;

                 Imprimir.LimpaBuffer;
              End;

              If Duplicata_Emite_3.Checked Then
                 Begin
                 Numero_Nota          := Duplicata_Nro_3.Text;
                 Observacao_1         := Duplicata_Referente_3.Text;

                 Nro_Duplicata        := Duplicata_Docto_3.Text;
                 DT_Emissao_Duplicata := Duplicata_Emissao_3.Text;
                 DT_Vecto_Duplicata   := Duplicata_Vencto_3.Text;
                 Vlr_Duplicata_Str    := Duplicata_Valor_3.Text;

                 //*** Impressao do Boleto na Matricial ***

                 Linha := 7;
                 Imprimir.PoeStr(Linha,001, #15+'.');
                 Imprimir.PoeStr(Linha,076, Trim(DT_Emissao_Duplicata));

                 Linha := Linha + 4;
                 //Imprimir.PoeStr(Linha,015, 'R$ ' + Trim(Vlr_Duplicata_Str));
                 Imprimir.PoeStr(Linha,019, Numero_Nota);
                 Imprimir.PoeStr(Linha,039, 'R$ ' + Trim(Vlr_Duplicata_Str));
                 Imprimir.PoeStr(Linha,064, Nro_Duplicata);
                 Imprimir.PoeStr(Linha,085, DT_Vecto_Duplicata);

                 If (Trim(Observacao_1) <> '') Then
                    Begin
                   Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),1,20)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),21,40)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),41,60)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),61,80)) );
                 End;

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_1)) );

                 Linha := Linha + 2;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_2)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_3)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula( Copy(Trim(Endereco_2)+ ' - ' +Trim(Endereco_3),1,85)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(LBL_Codigo.Caption)) );
                 Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(LBL_Inscricao.Caption)) );

                 Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                 Linha := Linha + 3;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                 If Confirma('Nro.: '+Trim(Numero_Nota)+' - 3a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em Ok para Imprimir.') = 6 Then
                    Begin
                    Imprimir.ImprimeJob;
                 End;

                 Imprimir.LimpaBuffer;
              End;

              If Duplicata_Emite_4.Checked Then
                 Begin
                 Numero_Nota          := Duplicata_Nro_4.Text;
                 Observacao_1         := Duplicata_Referente_4.Text;

                 Nro_Duplicata        := Duplicata_Docto_4.Text;
                 DT_Emissao_Duplicata := Duplicata_Emissao_4.Text;
                 DT_Vecto_Duplicata   := Duplicata_Vencto_4.Text;
                 Vlr_Duplicata_Str    := Duplicata_Valor_4.Text;

                 //*** Impressao do Boleto na Matricial ***

                 Linha := 7;
                 Imprimir.PoeStr(Linha,001, #15+'.');
                 Imprimir.PoeStr(Linha,076, Trim(DT_Emissao_Duplicata));

                 Linha := Linha + 4;
                 //Imprimir.PoeStr(Linha,015, 'R$ ' + Trim(Vlr_Duplicata_Str));
                 Imprimir.PoeStr(Linha,019, Numero_Nota);
                 Imprimir.PoeStr(Linha,039, 'R$ ' + Trim(Vlr_Duplicata_Str));
                 Imprimir.PoeStr(Linha,064, Nro_Duplicata);
                 Imprimir.PoeStr(Linha,085, DT_Vecto_Duplicata);

                 If (Trim(Observacao_1) <> '') Then
                    Begin
                   Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),1,20)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),21,40)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),41,60)) );
                 End;

                 Linha := Linha + 1;
                 If (Trim(Observacao_1) <> '') Then
                    Begin
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),61,80)) );
                 End;

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_1)) );

                 Linha := Linha + 2;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_2)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(Endereco_3)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula( Copy(Trim(Endereco_2)+ ' - ' +Trim(Endereco_3),1,85)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(LBL_Codigo.Caption)) );
                 Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(LBL_Inscricao.Caption)) );

                 Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                 Linha := Linha + 3;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                 Linha := Linha + 1;
                 Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                 If Confirma('Nro.: '+Trim(Numero_Nota)+' - 4a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em Ok para Imprimir.') = 6 Then
                    Begin
                    Imprimir.ImprimeJob;
                 End;

                 Imprimir.LimpaBuffer;
              End;

        Seta();

        MSG_Erro('Impressão Finalizada.');

        End
     Else
        Begin
        MSG_Erro('Nenhum Boleto foi selecionado');
     End;
end;

procedure TBoletos01.BT_SairClick(Sender: TObject);
begin
     Boletos01.Close;
end;

procedure TBoletos01.BT_ProcurarClick(Sender: TObject);
var Endereco_1, Endereco_2, Endereco_3: String;
begin
    If Trim(Opcoes_Procura.Text) = 'Nro. da Nota' Then
      Begin
      Ampulheta();

      ConexaoBD.SQL_FB_Nota_Fiscal.Close;
      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Trim(Dados_Procura.Text) + ' Order By fb_nota_fiscal_numero, fb_nota_fiscal_data_emissao, fb_nota_fiscal_dup_dt_vcto_1, fb_nota_fiscal_dup_dt_vcto_2, fb_nota_fiscal_dup_dt_vcto_3, fb_nota_fiscal_dup_dt_vcto_4');
      ConexaoBD.SQL_FB_Nota_Fiscal.Open;

      If conexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
        Begin

        Codigo_Cliente := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;

        ConexaoBD.SQL_Clientes.Close;
        ConexaoBD.SQL_Clientes.SQL.Clear;
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39 );
        ConexaoBD.SQL_Clientes.Open;

        Endereco_1 := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text));
        Endereco_1 := Endereco_1 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text)) + ': ';
        Endereco_1 := Endereco_1 + Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text);

        Endereco_2 := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text));

        If Trim(ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text) <> '' Then
          Begin
          Endereco_2 := Endereco_2 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text));
        End;

        Endereco_2 := Endereco_2 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text));

        Endereco_3 := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text));
        Endereco_3 := Endereco_3 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text));
        Endereco_3 := Endereco_3 + ' - CEP:' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text);
        Endereco_3 := Endereco_3 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_pais_cobranca.Text));

        Endereco_1 := Letra_Maiuscula(Endereco_1);
        Endereco_2 := Letra_Maiuscula(Endereco_2);
        Endereco_3 := Letra_Maiuscula(Endereco_3);

        LBL_Endereco_1.Caption := Endereco_1;
        LBL_Endereco_2.Caption := Endereco_2;
        LBL_Endereco_3.Caption := Endereco_3;

        LBL_Codigo.Caption     := Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text);
        LBL_Inscricao.Caption  := Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text);

        If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text) <> '' Then
          Begin
          Duplicata_Emite_1.Checked  := True;

          Duplicata_Nro_1.Enabled       := True;
          Duplicata_Vencto_1.Enabled    := True;
          Duplicata_Emissao_1.Enabled   := True;
          Duplicata_Docto_1.Enabled     := True;
          Duplicata_Referente_1.Enabled := True;
          Duplicata_Valor_1.Enabled     := True;

          Duplicata_Nro_1.Text       := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;
          Duplicata_Vencto_1.Text    := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;
          Duplicata_Emissao_1.Text   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
          Duplicata_Docto_1.Text     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text;
          Duplicata_Referente_1.Text := '';
          Duplicata_Valor_1.Text     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text;
          End
        Else
          Begin
          Duplicata_Emite_1.Checked  := False;

          Duplicata_Nro_1.Enabled       := False;
          Duplicata_Vencto_1.Enabled    := False;
          Duplicata_Emissao_1.Enabled   := False;
          Duplicata_Docto_1.Enabled     := False;
          Duplicata_Referente_1.Enabled := False;
          Duplicata_Valor_1.Enabled     := False;

          Duplicata_Nro_1.Text       := '';
          Duplicata_Vencto_1.Text    := '';
          Duplicata_Emissao_1.Text   := '';
          Duplicata_Docto_1.Text     := '';
          Duplicata_Referente_1.Text := '';
          Duplicata_Valor_1.Text     := '';
        End;

        If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text) <> '' Then
          Begin
          Duplicata_Emite_2.Checked  := True;

          Duplicata_Nro_2.Enabled       := True;
          Duplicata_Vencto_2.Enabled    := True;
          Duplicata_Emissao_2.Enabled   := True;
          Duplicata_Docto_2.Enabled     := True;
          Duplicata_Referente_2.Enabled := True;
          Duplicata_Valor_2.Enabled     := True;

          Duplicata_Nro_2.Text       := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;
          Duplicata_Vencto_2.Text    := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;
          Duplicata_Emissao_2.Text   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
          Duplicata_Docto_2.Text     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text;
          Duplicata_Referente_2.Text := '';
          Duplicata_Valor_2.Text     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text;
          End
        Else
          Begin
          Duplicata_Emite_2.Checked  := False;

          Duplicata_Nro_2.Enabled       := False;
          Duplicata_Vencto_2.Enabled    := False;
          Duplicata_Emissao_2.Enabled   := False;
          Duplicata_Docto_2.Enabled     := False;
          Duplicata_Referente_2.Enabled := False;
          Duplicata_Valor_2.Enabled     := False;

          Duplicata_Nro_2.Text       := '';
          Duplicata_Vencto_2.Text    := '';
          Duplicata_Emissao_2.Text   := '';
          Duplicata_Docto_2.Text     := '';
          Duplicata_Referente_2.Text := '';
          Duplicata_Valor_2.Text     := '';
        End;

        If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text) <> '' Then
          Begin
          Duplicata_Emite_3.Checked  := True;

          Duplicata_Nro_3.Enabled       := True;
          Duplicata_Vencto_3.Enabled    := True;
          Duplicata_Emissao_3.Enabled   := True;
          Duplicata_Docto_3.Enabled     := True;
          Duplicata_Referente_3.Enabled := True;
          Duplicata_Valor_3.Enabled     := True;

          Duplicata_Nro_3.Text       := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;
          Duplicata_Vencto_3.Text    := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;
          Duplicata_Emissao_3.Text   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
          Duplicata_Docto_3.Text     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text;
          Duplicata_Referente_3.Text := '';
          Duplicata_Valor_3.Text     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text;
          End
        Else
          Begin
          Duplicata_Emite_3.Checked  := False;

          Duplicata_Nro_3.Enabled       := False;
          Duplicata_Vencto_3.Enabled    := False;
          Duplicata_Emissao_3.Enabled   := False;
          Duplicata_Docto_3.Enabled     := False;
          Duplicata_Referente_3.Enabled := False;
          Duplicata_Valor_3.Enabled     := False;

          Duplicata_Nro_3.Text       := '';
          Duplicata_Vencto_3.Text    := '';
          Duplicata_Emissao_3.Text   := '';
          Duplicata_Docto_3.Text     := '';
          Duplicata_Referente_3.Text := '';
          Duplicata_Valor_3.Text     := '';
        End;

        If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_4.Text) <> '' Then
          Begin
          Duplicata_Emite_4.Checked  := True;

          Duplicata_Nro_4.Enabled       := True;
          Duplicata_Vencto_4.Enabled    := True;
          Duplicata_Emissao_4.Enabled   := True;
          Duplicata_Docto_4.Enabled     := True;
          Duplicata_Referente_4.Enabled := True;
          Duplicata_Valor_4.Enabled     := True;

          Duplicata_Nro_4.Text       := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;
          Duplicata_Vencto_4.Text    := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_4.Text;
          Duplicata_Emissao_4.Text   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
          Duplicata_Docto_4.Text     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_4.Text;
          Duplicata_Referente_4.Text := '';
          Duplicata_Valor_4.Text     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.Text;
          End
        Else
          Begin
          Duplicata_Emite_4.Checked  := False;

          Duplicata_Nro_4.Enabled       := False;
          Duplicata_Vencto_4.Enabled    := False;
          Duplicata_Emissao_4.Enabled   := False;
          Duplicata_Docto_4.Enabled     := False;
          Duplicata_Referente_4.Enabled := False;
          Duplicata_Valor_4.Enabled     := False;

          Duplicata_Nro_4.Text       := '';
          Duplicata_Vencto_4.Text    := '';
          Duplicata_Emissao_4.Text   := '';
          Duplicata_Docto_4.Text     := '';
          Duplicata_Referente_4.Text := '';
          Duplicata_Valor_4.Text     := '';
        End;

        End
      Else
        Begin
        Seta();
        MSG_Erro('Nota Fiscal informada não existe');
        Dados_Procura.SetFocus;
      End;
      End
    Else If Trim(Opcoes_Procura.Text) = 'Código' Then
      Begin
      ConexaoBD.SQL_Clientes.Close;
      ConexaoBD.SQL_Clientes.SQL.Clear;
      ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Dados_Procura.Text) +#39 );
      ConexaoBD.SQL_Clientes.Open;

      If conexaoBD.SQL_Clientes.RecordCount > 0 Then
        Begin
        Codigo_Cliente := Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text);

        Endereco_1 := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text));
        Endereco_1 := Endereco_1 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text)) + ': ';
        Endereco_1 := Endereco_1 + Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text);

        Endereco_2 := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text));

        If Trim(ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text) <> '' Then
          Begin
          Endereco_2 := Endereco_2 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text));
        End;

        Endereco_2 := Endereco_2 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text));

        Endereco_3 := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text));
        Endereco_3 := Endereco_3 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text));
        Endereco_3 := Endereco_3 + ' - CEP:' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text);
        Endereco_3 := Endereco_3 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_pais_cobranca.Text));

        Endereco_1 := Letra_Maiuscula(Endereco_1);
        Endereco_2 := Letra_Maiuscula(Endereco_2);
        Endereco_3 := Letra_Maiuscula(Endereco_3);

        LBL_Endereco_1.Caption := Endereco_1;
        LBL_Endereco_2.Caption := Endereco_2;
        LBL_Endereco_3.Caption := Endereco_3;

        LBL_Codigo.Caption     := Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text);
        LBL_Inscricao.Caption  := Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text);

        Duplicata_Emite_1.Checked  := False;

        Duplicata_Nro_1.Enabled       := False;
        Duplicata_Vencto_1.Enabled    := False;
        Duplicata_Emissao_1.Enabled   := False;
        Duplicata_Docto_1.Enabled     := False;
        Duplicata_Referente_1.Enabled := False;
        Duplicata_Valor_1.Enabled     := False;

        Duplicata_Nro_1.Text       := '';
        Duplicata_Vencto_1.Text    := '';
        Duplicata_Emissao_1.Text   := '';
        Duplicata_Docto_1.Text     := '';
        Duplicata_Referente_1.Text := '';
        Duplicata_Valor_1.Text     := '';

        Duplicata_Emite_2.Checked  := False;

        Duplicata_Nro_2.Enabled       := False;
        Duplicata_Vencto_2.Enabled    := False;
        Duplicata_Emissao_2.Enabled   := False;
        Duplicata_Docto_2.Enabled     := False;
        Duplicata_Referente_2.Enabled := False;
        Duplicata_Valor_2.Enabled     := False;

        Duplicata_Nro_2.Text       := '';
        Duplicata_Vencto_2.Text    := '';
        Duplicata_Emissao_2.Text   := '';
        Duplicata_Docto_2.Text     := '';
        Duplicata_Referente_2.Text := '';
        Duplicata_Valor_2.Text     := '';

        Duplicata_Emite_3.Checked  := False;

        Duplicata_Nro_3.Enabled       := False;
        Duplicata_Vencto_3.Enabled    := False;
        Duplicata_Emissao_3.Enabled   := False;
        Duplicata_Docto_3.Enabled     := False;
        Duplicata_Referente_3.Enabled := False;
        Duplicata_Valor_3.Enabled     := False;

        Duplicata_Nro_3.Text       := '';
        Duplicata_Vencto_3.Text    := '';
        Duplicata_Emissao_3.Text   := '';
        Duplicata_Docto_3.Text     := '';
        Duplicata_Referente_3.Text := '';
        Duplicata_Valor_3.Text     := '';

        Duplicata_Emite_4.Checked  := False;

        Duplicata_Nro_4.Enabled       := False;
        Duplicata_Vencto_4.Enabled    := False;
        Duplicata_Emissao_4.Enabled   := False;
        Duplicata_Docto_4.Enabled     := False;
        Duplicata_Referente_4.Enabled := False;
        Duplicata_Valor_4.Enabled     := False;

        Duplicata_Nro_4.Text       := '';
        Duplicata_Vencto_4.Text    := '';
        Duplicata_Emissao_4.Text   := '';
        Duplicata_Docto_4.Text     := '';
        Duplicata_Referente_4.Text := '';
        Duplicata_Valor_4.Text     := '';
        End
      Else
        Begin
        Seta();
        MSG_Erro('Código do Cliente não existe');
        Dados_Procura.SetFocus;
      End;
    End;

    Seta();
end;

procedure TBoletos01.FormCreate(Sender: TObject);
begin
    //*** Trabalha com o Ano de 4 Dígitos ***
    ShortDateFormat := 'dd/mm/yyyy';
    //*** Formata da Data conforme o Padrão Desejado ***
    ShortTimeFormat := 'hh:mm:ss';
end;

procedure TBoletos01.FormShow(Sender: TObject);
begin
    Duplicata_Emite_1.Checked  := False;

    Duplicata_Nro_1.Enabled       := False;
    Duplicata_Vencto_1.Enabled    := False;
    Duplicata_Emissao_1.Enabled   := False;
    Duplicata_Docto_1.Enabled     := False;
    Duplicata_Referente_1.Enabled := False;
    Duplicata_Valor_1.Enabled     := False;

    Duplicata_Emite_2.Checked     := False;

    Duplicata_Nro_2.Enabled       := False;
    Duplicata_Vencto_2.Enabled    := False;
    Duplicata_Emissao_2.Enabled   := False;
    Duplicata_Docto_2.Enabled     := False;
    Duplicata_Referente_2.Enabled := False;
    Duplicata_Valor_2.Enabled     := False;

    Duplicata_Emite_3.Checked     := False;

    Duplicata_Nro_3.Enabled       := False;
    Duplicata_Vencto_3.Enabled    := False;
    Duplicata_Emissao_3.Enabled   := False;
    Duplicata_Docto_3.Enabled     := False;
    Duplicata_Referente_3.Enabled := False;
    Duplicata_Valor_3.Enabled     := False;

    Duplicata_Emite_4.Checked     := False;

    Duplicata_Nro_4.Enabled       := False;
    Duplicata_Vencto_4.Enabled    := False;
    Duplicata_Emissao_4.Enabled   := False;
    Duplicata_Docto_4.Enabled     := False;
    Duplicata_Referente_4.Enabled := False;
    Duplicata_Valor_4.Enabled     := False;
end;

procedure TBoletos01.Duplicata_Emite_1Click(Sender: TObject);
begin
    If Duplicata_Emite_1.Checked = True Then
      Begin
      Duplicata_Nro_1.Enabled       := True;
      Duplicata_Vencto_1.Enabled    := True;
      Duplicata_Emissao_1.Enabled   := True;
      Duplicata_Docto_1.Enabled     := True;
      Duplicata_Referente_1.Enabled := True;
      Duplicata_Valor_1.Enabled     := True;
      End
    Else
      Begin
      Duplicata_Nro_1.Enabled       := False;
      Duplicata_Vencto_1.Enabled    := False;
      Duplicata_Emissao_1.Enabled   := False;
      Duplicata_Docto_1.Enabled     := False;
      Duplicata_Referente_1.Enabled := False;
      Duplicata_Valor_1.Enabled     := False;

      Duplicata_Nro_1.Text       := '';
      Duplicata_Vencto_1.Text    := '';
      Duplicata_Emissao_1.Text   := '';
      Duplicata_Docto_1.Text     := '';
      Duplicata_Referente_1.Text := '';
      Duplicata_Valor_1.Text     := '';
    End;
end;

procedure TBoletos01.Duplicata_Emite_2Click(Sender: TObject);
begin
     If Duplicata_Emite_2.Checked = True Then
        Begin
        Duplicata_Nro_2.Enabled       := True;
        Duplicata_Vencto_2.Enabled    := True;
        Duplicata_Emissao_2.Enabled   := True;
        Duplicata_Docto_2.Enabled     := True;
        Duplicata_Referente_2.Enabled := True;
        Duplicata_Valor_2.Enabled     := True;
        End
     Else
        Begin
        Duplicata_Nro_2.Enabled       := False;
        Duplicata_Vencto_2.Enabled    := False;
        Duplicata_Emissao_2.Enabled   := False;
        Duplicata_Docto_2.Enabled     := False;
        Duplicata_Referente_2.Enabled := False;
        Duplicata_Valor_2.Enabled     := False;

        Duplicata_Nro_2.Text       := '';
        Duplicata_Vencto_2.Text    := '';
        Duplicata_Emissao_2.Text   := '';
        Duplicata_Docto_2.Text     := '';
        Duplicata_Referente_2.Text := '';
        Duplicata_Valor_2.Text     := '';
     End;
end;

procedure TBoletos01.Duplicata_Emite_3Click(Sender: TObject);
begin
     If Duplicata_Emite_3.Checked = True Then
        Begin
        Duplicata_Nro_3.Enabled       := True;
        Duplicata_Vencto_3.Enabled    := True;
        Duplicata_Emissao_3.Enabled   := True;
        Duplicata_Docto_3.Enabled     := True;
        Duplicata_Referente_3.Enabled := True;
        Duplicata_Valor_3.Enabled     := True;
        End
     Else
        Begin
        Duplicata_Nro_3.Enabled       := False;
        Duplicata_Vencto_3.Enabled    := False;
        Duplicata_Emissao_3.Enabled   := False;
        Duplicata_Docto_3.Enabled     := False;
        Duplicata_Referente_3.Enabled := False;
        Duplicata_Valor_3.Enabled     := False;

        Duplicata_Nro_3.Text       := '';
        Duplicata_Vencto_3.Text    := '';
        Duplicata_Emissao_3.Text   := '';
        Duplicata_Docto_3.Text     := '';
        Duplicata_Referente_3.Text := '';
        Duplicata_Valor_3.Text     := '';
     End;
end;

procedure TBoletos01.Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Emite_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Vencto_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Emissao_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Docto_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Referente_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Valor_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Emite_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Vencto_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Emissao_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Docto_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Referente_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Valor_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Emite_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Vencto_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Emissao_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Docto_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Referente_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Valor_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.BT_ImprimirClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        Imprime_Boletos();
     End;
end;

procedure TBoletos01.Registra_Boleto_Impresso(Nro_Boleto, Posicao: String);

var
   Nro_Nota, Comando_SQL: String;

begin
     Nro_Nota := Nro_Boleto;
     Nro_Nota := Retira_Caracter(UpperCase(Trim(Nro_Nota)),'A');
     Nro_Nota := Retira_Caracter(UpperCase(Trim(Nro_Nota)),'B');
     Nro_Nota := Retira_Caracter(UpperCase(Trim(Nro_Nota)),'C');
     Nro_Nota := Retira_Caracter(UpperCase(Trim(Nro_Nota)),'D');
     Nro_Nota := Retira_Caracter(UpperCase(Trim(Nro_Nota)),'E');

     If Trim(Posicao) = '1' Then
        Begin
        Comando_SQL := 'Update fb_notas_fiscais Set ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_1 = ' +#39+ Trim(Nro_Boleto) +#39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_1 = ' +#39 + Trim(Inverte_Data_Plus(Duplicata_Vencto_1.Text,'amd','/')) + #39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_1 = ' + Virgula_ponto(Duplicata_Valor_1.Text) + ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_imp_1 = ' +#39 + 'S' + #39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_cart_1 = ' +#39 + 'N' + #39+ ', ';

        If DaysBetween( StrToDate(Duplicata_Emissao_1.Text), StrToDate(Duplicata_Vencto_1.Text) ) <= 0 Then
           Begin
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_1 = ' +#39+ 'À VISTA' +#39+ ', ';
           End
        Else
           Begin
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_1 = ' +#39+ IntToStr( DaysBetween( StrToDate(Duplicata_Emissao_1.Text), StrToDate(Duplicata_Vencto_1.Text) ) ) +#39+ ', ';
        End;

        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_emissao = '+#39+'S'+#39+' ';
        Comando_SQL := Comando_SQL + 'where fb_nota_fiscal_numero = ' + Trim(Nro_Nota);
        End
     Else If Trim(Posicao) = '2' Then
        Begin
        Comando_SQL := 'Update fb_notas_fiscais Set ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_2 = ' +#39+ Trim(Nro_Boleto) +#39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_2 = ' +#39 + Trim(Inverte_Data_Plus(Duplicata_Vencto_2.Text,'amd','/')) + #39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_2 = ' + Virgula_ponto(Duplicata_Valor_2.Text) + ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_imp_2 = ' +#39 + 'S' + #39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_cart_2 = ' +#39 + 'N' + #39+ ', ';

        If DaysBetween( StrToDate(Duplicata_Emissao_2.Text), StrToDate(Duplicata_Vencto_2.Text) ) <= 0 Then
           Begin
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_2 = ' +#39+ 'À VISTA' +#39+ ', ';
           End
        Else
           Begin
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_2 = ' +#39+ IntToStr( DaysBetween( StrToDate(Duplicata_Emissao_2.Text), StrToDate(Duplicata_Vencto_2.Text) ) ) +#39+ ', ';
        End;

        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_emissao = '+#39+'S'+#39+' ';
        Comando_SQL := Comando_SQL + 'where fb_nota_fiscal_numero = ' + Trim(Nro_Nota);
        End
     Else If Trim(Posicao) = '3' Then
        Begin
        Comando_SQL := 'Update fb_notas_fiscais Set ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_3 = ' +#39+ Trim(Nro_Boleto) +#39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_3 = ' +#39 + Trim(Inverte_Data_Plus(Duplicata_Vencto_3.Text,'amd','/')) + #39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_3 = ' + Virgula_ponto(Duplicata_Valor_3.Text) + ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_imp_3 = ' +#39 + 'S' + #39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_cart_3 = ' +#39 + 'N' + #39+ ', ';

        If DaysBetween( StrToDate(Duplicata_Emissao_3.Text), StrToDate(Duplicata_Vencto_3.Text) ) <= 0 Then
           Begin
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_3 = ' +#39+ 'À VISTA' +#39+ ', ';
           End
        Else
           Begin
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_3 = ' +#39+ IntToStr( DaysBetween( StrToDate(Duplicata_Emissao_3.Text), StrToDate(Duplicata_Vencto_3.Text) ) ) +#39+ ', ';
        End;

        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_emissao = '+#39+'S'+#39+' ';
        Comando_SQL := Comando_SQL + 'where fb_nota_fiscal_numero = ' + Trim(Nro_Nota);
        End
     Else If Trim(Posicao) = '4' Then
        Begin
        Comando_SQL := 'Update fb_notas_fiscais Set ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_4 = ' +#39+ Trim(Nro_Boleto) +#39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_4 = ' +#39 + Trim(Inverte_Data_Plus(Duplicata_Vencto_4.Text,'amd','/')) + #39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_4 = ' + Virgula_ponto(Duplicata_Valor_4.Text) + ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_imp_4 = ' +#39 + 'S' + #39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_bol_avul_cart_4 = ' +#39 + 'N' + #39+ ', ';

        If DaysBetween( StrToDate(Duplicata_Emissao_4.Text), StrToDate(Duplicata_Vencto_4.Text) ) <= 0 Then
           Begin
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_4 = ' +#39+ 'À VISTA' +#39+ ', ';
           End
        Else
           Begin
           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_4 = ' +#39+ IntToStr( DaysBetween( StrToDate(Duplicata_Emissao_4.Text), StrToDate(Duplicata_Vencto_4.Text) ) ) +#39+ ', ';
        End;

        Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_emissao = '+#39+'S'+#39+' ';
        Comando_SQL := Comando_SQL + 'where fb_nota_fiscal_numero = ' + Trim(Nro_Nota);
     End;

     ConexaoBD.SQL_Comunitario.Close;
     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TBoletos01.Duplicata_Emite_4Click(Sender: TObject);
begin
     If Duplicata_Emite_4.Checked = True Then
        Begin
        Duplicata_Nro_4.Enabled       := True;
        Duplicata_Vencto_4.Enabled    := True;
        Duplicata_Emissao_4.Enabled   := True;
        Duplicata_Docto_4.Enabled     := True;
        Duplicata_Referente_4.Enabled := True;
        Duplicata_Valor_4.Enabled     := True;
        End
     Else
        Begin
        Duplicata_Nro_4.Enabled       := False;
        Duplicata_Vencto_4.Enabled    := False;
        Duplicata_Emissao_4.Enabled   := False;
        Duplicata_Docto_4.Enabled     := False;
        Duplicata_Referente_4.Enabled := False;
        Duplicata_Valor_4.Enabled     := False;

        Duplicata_Nro_4.Text       := '';
        Duplicata_Vencto_4.Text    := '';
        Duplicata_Emissao_4.Text   := '';
        Duplicata_Docto_4.Text     := '';
        Duplicata_Referente_4.Text := '';
        Duplicata_Valor_4.Text     := '';
     End;
end;

procedure TBoletos01.Duplicata_Emite_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Vencto_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Emissao_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Docto_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Referente_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Valor_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Boletos01 := Nil;
end;

procedure TBoletos01.Duplicata_Nro_1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Nro_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Nro_3KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos01.Duplicata_Nro_4KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
