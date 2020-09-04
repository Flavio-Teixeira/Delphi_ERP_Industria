unit Boletos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImpMat, gbCobranca;

type
  TBoletos00 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Nota_Inicial: TEdit;
    Nota_Final: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BT_Imprimir: TBitBtn;
    Imprimir: TImpMat;
    Label5: TLabel;
    Nota_OBS: TEdit;
    Opc_Ibrasmak: TRadioButton;
    Opc_Monibras: TRadioButton;
    Label6: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure Nota_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Nota_OBSKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
    function Extenso(parmNumero: Real): string;
    function ConversaoRecursiva(N: LongWord): string;    

    procedure Imprime_Boletos();

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
  Boletos00: TBoletos00;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

//*****************
//*** Functions ***
//*****************

function TBoletos00.ConversaoRecursiva(N: LongWord): string;
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

function TBoletos00.Extenso(parmNumero: Real): string;
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

function TBoletos00.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno: String;
   Resultado: Boolean;

begin
     Resultado     := True;
     Campo_Retorno := '';

     If Trim(Nota_Inicial.Text) = '' Then
        Begin
        Erro          := 'Nota Fiscal Inicial não foi informada';
        Campo_Retorno := 'Nota_Inicial';
        End
     Else If Trim(Nota_Final.Text) = '' Then
        Begin
        Erro          := 'Nota Fiscal Final não foi informada';
        Campo_Retorno := 'Nota_Final';
        End
     Else If (StrToInt(Nota_Inicial.Text) > StrToInt(Nota_Final.Text)) Then
        Begin
        Erro          := 'Nota Fiscal Inicial deve ser menor ou igual a Nota Fiscal Final';
        Campo_Retorno := 'Nota_Inicial';
     End;

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin
        If Campo_Retorno = 'Nota_Inicial' Then
           Begin
           Nota_Inicial.SetFocus;
           End
        Else If Campo_Retorno = 'Nota_Final' Then
           Begin
           Nota_Final.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TBoletos00.Imprime_Boletos();

var
   Impressora: TextFile;
   Linha, Ind, Posicao_Total, Duplicata_Nro: Integer;
   Numero_Nota, Numero_Nota_8, Numero_Nota_4, Codigo_Cliente, Banco_Cliente, Comando_SQL, Observacao_1: String;
   Nro_Duplicata, DT_Emissao_Duplicata, DT_Vecto_Duplicata, Vlr_Duplicata_Str, Mora_Dia_Str, Forma_Duplicata: String;
   Valor_Extenso, Endereco_1, Endereco_2, Endereco_3: String;
   Mora_Dia_Nro, Vlr_Duplicata_Nro: Real;
   Pessoa_Juridica: Boolean;
   Zeros_Antes, Boleto_Banco: String;

begin
     If Opc_Ibrasmak.Checked Then
        Begin

        Comando_SQL := 'Select * from fb_notas_fiscais Where ';
        Comando_SQL := Comando_SQL + '(fb_nota_fiscal_numero >= ' + Trim(Nota_Inicial.Text) + ' And';
        Comando_SQL := Comando_SQL + ' fb_nota_fiscal_numero <= ' + Trim(Nota_Final.Text) + ') ';
        Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_numero, fb_nota_fiscal_data_emissao, fb_nota_fiscal_dup_dt_vcto_1, fb_nota_fiscal_dup_dt_vcto_2, fb_nota_fiscal_dup_dt_vcto_3, fb_nota_fiscal_dup_dt_vcto_4';

        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_FB_Nota_Fiscal.Open;

        If conexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
           Begin

           Ampulheta();

           //*** Processo de Preparação para Emissão do Boleto ***

           Duplicata_Nro := 0;

           conexaoBD.SQL_FB_Nota_Fiscal.First;

           While Not conexaoBD.SQL_FB_Nota_Fiscal.Eof Do
                 Begin
                 Numero_Nota    := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;
                 Codigo_Cliente := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;
                 Banco_Cliente  := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text);

                 Observacao_1   := Nota_OBS.Text;

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

                 //******************************
                 //*** Emissão da Duplicata_1 ***
                 //******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //******************************
                 //*** Emissão da Duplicata_2 ***
                 //******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //******************************
                 //*** Emissão da Duplicata_3 ***
                 //******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //******************************
                 //*** Emissão da Duplicata_4 ***
                 //******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_4.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_4.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_4.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_4.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_4.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //******************************
                 //*** Emissão da Duplicata_5 ***
                 //******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_5.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_5.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_5.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_5.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_5.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_5.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_5.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //******************************
                 //*** Emissão da Duplicata_6 ***
                 //******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_6.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_6.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_6.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_6.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_6.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_6.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_6.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //******************************
                 //*** Emissão da Duplicata_7 ***
                 //******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_7.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_7.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_7.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_7.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_7.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_7.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_7.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //******************************
                 //*** Emissão da Duplicata_8 ***
                 //******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_8.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_8.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_8.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_8.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_8.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_8.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_8.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //******************************
                 //*** Emissão da Duplicata_9 ***
                 //******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_9.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_9.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_9.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_9.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_9.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_9.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_9.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_10 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_10.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_10.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_10.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_10.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_10.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_10.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_10.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_11 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_11.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_11.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_11.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_11.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_11.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_11.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_11.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_12 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_12.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_12.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_12.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_12.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_12.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_12.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_12.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_13 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_13.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_13.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_13.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_13.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_13.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_13.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_13.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_14 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_14.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_14.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_14.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_14.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_14.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_14.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_14.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_15 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_15.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_15.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_15.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_15.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_15.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_15.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_15.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_16 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_16.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_16.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_16.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_16.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_16.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_16.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_16.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_17 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_17.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_17.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_17.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_17.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_17.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_17.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_17.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_18 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_18.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_18.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_18.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_18.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_18.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_18.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_18.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_19 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_19.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_19.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_19.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_19.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_19.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_19.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_19.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_20 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_20.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_20.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_20.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_20.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_20.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_20.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_20.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_21 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_21.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_21.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_21.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_21.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_21.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_21.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_21.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_22 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_22.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_22.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_22.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_22.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_22.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_22.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_22.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_23 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_23.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_23.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_23.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_23.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_23.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_23.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_23.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 //*******************************
                 //*** Emissão da Duplicata_24 ***
                 //*******************************

                 If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_24.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_24.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_24.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_24.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_24.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_24.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_24.Text;

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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,106, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 3;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    Duplicata_Nro := Duplicata_Nro + 1;
                    If Confirma('Nro.: '+Trim(Numero_Nota)+' - ' + IntToStr(Duplicata_Nro) + 'a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em SIM para Imprimir.') = 6 Then
                       Begin
                       Imprimir.ImprimeJob;
                    End;

                    Imprimir.LimpaBuffer;

                 End;

                 ConexaoBD.SQL_Clientes.Close;

                 conexaoBD.SQL_FB_Nota_Fiscal.Next;
           End;

           Seta();

           MSG_Erro('Impressão Finalizada.');

           Boletos00.Close;
           End
        Else
           Begin
           MSG_Erro('Nenhuma Nota Fiscal foi encontrada com a numeração informada');
        End;

        End
     Else
        Begin


        Comando_SQL := 'Select * from mb_notas_fiscais Where ';
        Comando_SQL := Comando_SQL + '(mb_nota_fiscal_numero >= ' + Trim(Nota_Inicial.Text) + ' And';
        Comando_SQL := Comando_SQL + ' mb_nota_fiscal_numero <= ' + Trim(Nota_Final.Text) + ') ';
        Comando_SQL := Comando_SQL + ' Order By mb_nota_fiscal_numero, mb_nota_fiscal_data_emissao, mb_nota_fiscal_dup_dt_vcto_1, mb_nota_fiscal_dup_dt_vcto_2, mb_nota_fiscal_dup_dt_vcto_3, mb_nota_fiscal_dup_dt_vcto_4';

        ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Clear;
        ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_MB_Nota_Fiscal.Open;

        If conexaoBD.SQL_MB_Nota_Fiscal.RecordCount > 0 Then
           Begin

           Ampulheta();

           //*** Processo de Preparação para Emissão do Boleto ***

           conexaoBD.SQL_MB_Nota_Fiscal.First;

           While Not conexaoBD.SQL_MB_Nota_Fiscal.Eof Do
                 Begin
                 Numero_Nota    := conexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_numero.Text;
                 Codigo_Cliente := conexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_codigo.Text;
                 Banco_Cliente  := Trim(conexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_banco.Text);

                 Observacao_1   := Nota_OBS.Text;

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

                 If ((Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_1.Text) <> '0') And (Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_1.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_1.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_nro_1.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_1.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_1.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_1.Text;

                    //*** Impressao do Boleto na Matricial ***

                    Linha := 7;
                    Imprimir.PoeStr(Linha,001, #15+'.');
                    Imprimir.PoeStr(Linha,076, Trim(DT_Emissao_Duplicata));

                    Linha := Linha + 5;
                    //Imprimir.PoeStr(Linha,015, 'R$ ' + Trim(Vlr_Duplicata_Str));
                    Imprimir.PoeStr(Linha,019, Numero_Nota);
                    Imprimir.PoeStr(Linha,039, 'R$ ' + Trim(Vlr_Duplicata_Str));
                    Imprimir.PoeStr(Linha,064, Nro_Duplicata);
                    Imprimir.PoeStr(Linha,085, DT_Vecto_Duplicata);

                    If (Trim(Observacao_1) <> '') Then
                       Begin
                      Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),1,20)) );
                    End;

                    Linha := Linha + 2;
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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade.Text)) );
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    MSG_Erro('Nro.: '+Trim(Numero_Nota)+' - 1a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em Ok para Imprimir.');

                    Imprimir.ImprimeJob;
                    Imprimir.LimpaBuffer;

                    //*** Efetua Pausa de 5 Segundos ***
                    //Sleep(5000);

                 End;

                 If ((Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_2.Text) <> '0') And (Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_2.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_2.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_nro_2.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_2.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_2.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_2.Text;

                    //*** Impressao do Boleto na Matricial ***

                    Linha := 7;
                    Imprimir.PoeStr(Linha,001, #15+'.');
                    Imprimir.PoeStr(Linha,076, Trim(DT_Emissao_Duplicata));

                    Linha := Linha + 5;
                    //Imprimir.PoeStr(Linha,015, 'R$ ' + Trim(Vlr_Duplicata_Str));
                    Imprimir.PoeStr(Linha,019, Numero_Nota);
                    Imprimir.PoeStr(Linha,039, 'R$ ' + Trim(Vlr_Duplicata_Str));
                    Imprimir.PoeStr(Linha,064, Nro_Duplicata);
                    Imprimir.PoeStr(Linha,085, DT_Vecto_Duplicata);

                    If (Trim(Observacao_1) <> '') Then
                       Begin
                      Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),1,20)) );
                    End;

                    Linha := Linha + 2;
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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text)) );
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    MSG_Erro('Nro.: '+Trim(Numero_Nota)+' - 2a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em Ok para Imprimir.');

                    Imprimir.ImprimeJob;
                    Imprimir.LimpaBuffer;

                    //*** Efetua Pausa de 5 Segundos ***
                    //Sleep(5000);
                 End;

                 If ((Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_3.Text) <> '0') And (Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_3.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_3.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_nro_3.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_3.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_3.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_3.Text;

                    //*** Impressao do Boleto na Matricial ***

                    Linha := 7;
                    Imprimir.PoeStr(Linha,001, #15+'.');
                    Imprimir.PoeStr(Linha,076, Trim(DT_Emissao_Duplicata));

                    Linha := Linha + 5;
                    //Imprimir.PoeStr(Linha,015, 'R$ ' + Trim(Vlr_Duplicata_Str));
                    Imprimir.PoeStr(Linha,019, Numero_Nota);
                    Imprimir.PoeStr(Linha,039, 'R$ ' + Trim(Vlr_Duplicata_Str));
                    Imprimir.PoeStr(Linha,064, Nro_Duplicata);
                    Imprimir.PoeStr(Linha,085, DT_Vecto_Duplicata);

                    If (Trim(Observacao_1) <> '') Then
                       Begin
                      Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),1,20)) );
                    End;

                    Linha := Linha + 2;
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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text)) );
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    MSG_Erro('Nro.: '+Trim(Numero_Nota)+' - 3a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em Ok para Imprimir.');

                    Imprimir.ImprimeJob;
                    Imprimir.LimpaBuffer;

                    //*** Efetua Pausa de 5 Segundos ***
                    //Sleep(5000);
                 End;

                 If ((Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_4.Text) <> '0') And (Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_4.Text) <> '')) Then
                    Begin

                    Vlr_Duplicata_Nro := StrToFloat(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_4.Text);
                    Str(Vlr_Duplicata_Nro:13:2,Vlr_Duplicata_Str);
                    Vlr_Duplicata_Str  := Ponto_Virgula(Trim(Vlr_Duplicata_Str));

                    Nro_Duplicata     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_nro_4.Text;
                    //Vlr_Duplicata_Str := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_4.Text;

                    DT_Emissao_Duplicata := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_data_emissao.Text;
                    DT_Vecto_Duplicata   := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_4.Text;
                    Forma_Duplicata      := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_forma_4.Text;

                    //*** Impressao do Boleto na Matricial ***

                    Linha := 7;
                    Imprimir.PoeStr(Linha,001, #15+'.');
                    Imprimir.PoeStr(Linha,076, Trim(DT_Emissao_Duplicata));

                    Linha := Linha + 5;
                    //Imprimir.PoeStr(Linha,015, 'R$ ' + Trim(Vlr_Duplicata_Str));
                    Imprimir.PoeStr(Linha,019, Numero_Nota);
                    Imprimir.PoeStr(Linha,039, 'R$ ' + Trim(Vlr_Duplicata_Str));
                    Imprimir.PoeStr(Linha,064, Nro_Duplicata);
                    Imprimir.PoeStr(Linha,085, DT_Vecto_Duplicata);

                    If (Trim(Observacao_1) <> '') Then
                       Begin
                      Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Copy(Trim(Observacao_1),1,20)) );
                    End;

                    Linha := Linha + 2;
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
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text)) );

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text)) );
                    Imprimir.PoeStr(Linha,101, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' / CEP: ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text) + ' / ' + Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text)) );
                    Imprimir.PoeStr(Linha,086, Letra_Maiuscula(Trim(ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text)) );

                    Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str)));

                    Linha := Linha + 2;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),1,85)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),86,170)) );

                    Linha := Linha + 1;
                    Imprimir.PoeStr(Linha,031, Letra_Maiuscula(Copy(Trim(Valor_Extenso),171,255)) );

                    MSG_Erro('Nro.: '+Trim(Numero_Nota)+' - 4a. Duplicata - Posicione Corretamente a Duplicata na Matricial e Clique em Ok para Imprimir.');

                    Imprimir.ImprimeJob;
                    Imprimir.LimpaBuffer;

                    //*** Efetua Pausa de 5 Segundos ***
                    //Sleep(5000);
                 End;

                 ConexaoBD.SQL_Clientes.Close;

                 conexaoBD.SQL_MB_Nota_Fiscal.Next;
           End;

           Seta();

           MSG_Erro('Impressão Finalizada.');

           Boletos00.Close;
           End
        Else
           Begin
           MSG_Erro('Nenhuma Nota Fiscal foi encontrada com a numeração informada');
        End;

     End;
end;

procedure TBoletos00.BT_SairClick(Sender: TObject);
begin
     Boletos00.Close;
end;

procedure TBoletos00.Nota_InicialKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos00.Nota_FinalKeyPress(Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos00.BT_ImprimirClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        Imprime_Boletos();
     End;
end;

procedure TBoletos00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TBoletos00.Nota_OBSKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TBoletos00.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Boletos00 := Nil;
end;

end.
