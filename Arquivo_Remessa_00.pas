unit Arquivo_Remessa_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComOBJ;

type
  TArquivoRemessa00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Nota_Inicial: TEdit;
    Nota_Final: TEdit;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Gerar: TBitBtn;
    procedure Nota_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_GerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function Valida_Dados(): Boolean;
    function Calcula_Digito_HSBC(Valor: String; Base: Integer; Resto : Boolean = False): String;
    function Calcula_Digito_Bradesco(Valor: String; Base: Integer; Resto : Boolean = False): String;

    procedure Gera_Remessa();
  public
    { Public declarations }
  end;

var
  ArquivoRemessa00: TArquivoRemessa00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

//*****************
//*** Functions ***
//*****************

function TArquivoRemessa00.Calcula_Digito_HSBC(Valor: String; Base: Integer; Resto : boolean = false) : string;

var
   Soma : integer;
   Contador, Peso, Digito : integer;

begin
   Soma := 0;
   Peso := 2;

   For Contador := Length(Valor) downto 1 do
       Begin
       Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
       If Peso < Base Then
          Begin
          Peso := Peso + 1
          End
       Else
          Begin
          Peso := 2;
       End;
   End;

   If Resto Then
      Begin
      Result := IntToStr(Soma mod 11)
      End
   Else
      Begin
      Digito := 11 - (Soma mod 11);
      If (Digito > 9) Then
         Begin
         Digito := 0;
      End;
      Result := IntToStr(Digito);
   End;
end;

function TArquivoRemessa00.Calcula_Digito_Bradesco(Valor: String; Base: Integer; Resto : boolean = false) : string;

var
   Soma : integer;
   Contador, Peso, Digito : integer;

begin
   Soma := 0;
   Peso := 2;

   For Contador := Length(Valor) downto 1 do
       Begin
       Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
       If Peso < Base Then
          Begin
          Peso := Peso + 1
          End
       Else
          Begin
          Peso := 2;
       End;
   End;

   If Resto Then
      Begin
      Digito := Soma mod 11
      End
   Else
      Begin
      Digito := 11 - (Soma mod 11);
      If (Digito > 9) Then
         Begin
         Digito := 0;
      End;
   End;

   If Digito = 10 Then
      Begin
      Result := 'P';
      End
   Else If Digito > 1 Then
      Begin
      Result := IntToStr(11 - Digito);
      End
   Else
      Begin
      Result := IntToStr(Digito);
   End;
end;

function TArquivoRemessa00.Valida_Dados(): Boolean;

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

procedure TArquivoRemessa00.Gera_Remessa();

var
   Impressora: TextFile;
   Linha, Ind: Integer;
   Numero_Nota, Numero_Nota_8, Codigo_Cliente, Banco_Cliente, Comando_SQL: String;
   Nro_Duplicata, DT_Vecto_Duplicata, Vlr_Duplicata_Str, Mora_Dia_Str, Forma_Duplicata: String;
   Endereco_1, Endereco_2, Endereco_3: String;
   Mora_Dia_Nro, Vlr_Duplicata_Nro: Real;
   Pessoa_Juridica: Boolean;
   Zeros_Antes: String;
   Nome_Arq_Remessa, DT_Juros_Mora, DT_Emissao_Docto, DT_Arquivo, HR_Arquivo, Grava_Linha: String;
   Arq_Remessa: TextFile;
   Nro_Detalhe, Qtde_Registros_Lote, Nro_Sequencial: Integer;

   Gera_Linha: Boolean;

   B_Carteira: String;

   B_Cedente_Nome: String;
   B_Cedente_TipoInscricao: String;
   B_Cedente_NumeroCPFCGC: String;

   B_Cedente_CodigoCedente: String;
   B_Cedente_DigitoCodigoCedente: String;

   B_Cedente_ContaBancaria_Banco_Codigo: String;
   B_Cedente_ContaBancaria_CodigoAgencia: String;
   B_Cedente_ContaBancaria_DigitoAgencia: String;
   B_Cedente_ContaBancaria_NumeroConta: String;
   B_Cedente_ContaBancaria_DigitoConta: String;
   B_Cedente_ContaBancaria_NomeCliente: String;

   B_Cedente_Endereco_Rua: String;
   B_Cedente_Endereco_Numero: String;
   B_Cedente_Endereco_Complemento: String;
   B_Cedente_Endereco_Bairro: String;
   B_Cedente_Endereco_Cidade: String;
   B_Cedente_Endereco_CEP: String;
   B_Cedente_Endereco_Estado: String;
   B_Cedente_Endereco_EMail: String;

   B_Sacado_Nome: String;
   B_Sacado_TipoInscricao: String;
   B_Sacado_NumeroCPFCGC: String;

   B_Sacado_Endereco_Rua: String;
   B_Sacado_Endereco_Bairro: String;
   B_Sacado_Endereco_Cidade: String;
   B_Sacado_Endereco_CEP: String;
   B_Sacado_Endereco_Estado: String;
   B_Sacado_Endereco_EMail: String;

   B_DataProcessamento: String;
   B_DataDocumento: String;
   B_DataVencimento: String;
   B_DataMoraJuros: String;
   B_DataProtesto: String;

   B_NossoNumero: String;
   B_NumeroDocumento: String;
   B_SeuNumero: String;

   B_ValorDocumento: String;
   B_ValorMoraJuros: String;

   Boleto_Banco: String;

begin
     Comando_SQL := 'Select * from fb_notas_fiscais Where ';
     Comando_SQL := Comando_SQL + '((fb_nota_fiscal_numero >= ' + Trim(Nota_Inicial.Text) + ' And';
     Comando_SQL := Comando_SQL + ' fb_nota_fiscal_numero <= ' + Trim(Nota_Final.Text) + ') And';
     Comando_SQL := Comando_SQL + ' (fb_nota_fiscal_natureza_oper = '+#39+'Vendas'+#39+') And';
     Comando_SQL := Comando_SQL + ' (((fb_nota_fiscal_dup_forma_1 <> '+#39+'À VISTA'+#39+') And';
     Comando_SQL := Comando_SQL + ' (fb_nota_fiscal_dup_forma_1 <> '+#39+'0'+#39+') And';
     Comando_SQL := Comando_SQL + ' (fb_nota_fiscal_dup_forma_1 <> '+#39+#39+')) Or';
     Comando_SQL := Comando_SQL + ' ((fb_nota_fiscal_dup_forma_2 <> '+#39+'À VISTA'+#39+') And';
     Comando_SQL := Comando_SQL + ' (fb_nota_fiscal_dup_forma_2 <> '+#39+'0'+#39+') And';
     Comando_SQL := Comando_SQL + ' (fb_nota_fiscal_dup_forma_2 <> '+#39+#39+')) Or';
     Comando_SQL := Comando_SQL + ' ((fb_nota_fiscal_dup_forma_3 <> '+#39+'À VISTA'+#39+') And';
     Comando_SQL := Comando_SQL + ' (fb_nota_fiscal_dup_forma_3 <> '+#39+'0'+#39+') And';
     Comando_SQL := Comando_SQL + ' (fb_nota_fiscal_dup_forma_3 <> '+#39+#39+'))) And fb_nota_fiscal_boleto_emissao = '+#39+'S'+#39+')';
     Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_numero, fb_nota_fiscal_data_emissao, fb_nota_fiscal_dup_dt_vcto_1, fb_nota_fiscal_dup_dt_vcto_2, fb_nota_fiscal_dup_dt_vcto_3';

     ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
     ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_FB_Nota_Fiscal.Open;

     If conexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
        Begin

        Ampulheta();

        //*** Obtem a Numeração da Remessa ***

        Comando_SQL := 'insert into remessa(remessa_empresa, ';
        Comando_SQL := Comando_SQL + 'remessa_data, ';
        Comando_SQL := Comando_SQL + 'remessa_hora) ';
        Comando_SQL := Comando_SQL + 'values('+#39+'Ibrasmak'+#39+', ';
        Comando_SQL := Comando_SQL + #39+ Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') +#39+ ', ';
        Comando_SQL := Comando_SQL + #39+ Trim(TimeToStr(Time())) +#39+ ')';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Obtem a Última Numeração ***

        Comando_SQL := 'Select * from remessa Where remessa_empresa = '+#39+'Ibrasmak'+#39+' Order By remessa_data Desc, remessa_hora Desc';

        ConexaoBD.SQL_Remessa.Close;
        ConexaoBD.SQL_Remessa.SQL.Clear;
        ConexaoBD.SQL_Remessa.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Remessa.Open;

        ConexaoBD.SQL_Remessa.First;

        Nro_Sequencial := ConexaoBD.SQL_Remessaremessa_sequencia.AsInteger;

        //*** Processo de Preparação para Geração da Remessa ***

        DT_Arquivo := Trim(DateToStr(Date()));
        DT_Arquivo := DT_Arquivo[1]+DT_Arquivo[2]+DT_Arquivo[4]+DT_Arquivo[5]+DT_Arquivo[7]+DT_Arquivo[8]+DT_Arquivo[9]+DT_Arquivo[10];
        DT_Arquivo := Trim(DT_Arquivo);

        HR_Arquivo := Trim(TimeToStr(Time()));
        HR_Arquivo := HR_Arquivo[1]+HR_Arquivo[2]+HR_Arquivo[4]+HR_Arquivo[5]+HR_Arquivo[7]+HR_Arquivo[8];
        HR_Arquivo := Trim(HR_Arquivo);

        //***
        //***
        //***
        //*** Gera o Arquivo de Remessa para o Banco do Brasil ***
        //***
        //***
        //***

        Nome_Arq_Remessa := 'RM'+ Trim(DT_Arquivo[1]+DT_Arquivo[2]+DT_Arquivo[3]+DT_Arquivo[4]+DT_Arquivo[7]+DT_Arquivo[8]) +'.txt';

        If FileExists('C:\Grupo_Ibrasmak\Ibrasmak\Remessa\BB\'+Nome_Arq_Remessa) Then
           Begin
           DeleteFile('C:\Grupo_Ibrasmak\Ibrasmak\Remessa\BB\'+Nome_Arq_Remessa);
        End;

        AssignFile(Arq_Remessa,'C:\Grupo_Ibrasmak\Ibrasmak\Remessa\BB\'+Nome_Arq_Remessa);

        Rewrite(Arq_Remessa);

        //*** Gera o Linha Header ***

        Grava_Linha := '00100000         230863575000107001252925001417019  0072260000000118486 Ibrasmak NUTRICAO & FARMA LTDBANCO DO BRASIL                         1' + Trim(DT_Arquivo) + Trim(HR_Arquivo) + Gera_Zeros(Nro_Sequencial,6)  + '03000000                                                      000            ';
        WriteLn(Arq_Remessa,Grava_Linha);

        //*** Gera o Header de Lote ***

        Grava_Linha := '00100011R0100020 2030863575000107001252925001417019  0072260000000118486 Ibrasmak NUTRICAO & FARMA LTD                                                                                ' + Gera_Zeros(Nro_Sequencial,8) + Trim(DT_Arquivo) + '00000000' + '                                 ';
        WriteLn(Arq_Remessa,Grava_Linha);

        Nro_Detalhe         := 0;
        Qtde_Registros_Lote := 2;

        conexaoBD.SQL_FB_Nota_Fiscal.First;

        While Not conexaoBD.SQL_FB_Nota_Fiscal.Eof Do
              Begin

              Numero_Nota    := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;
              Codigo_Cliente := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;
              Banco_Cliente  := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text);

              //*** Obtem o Tipo de Boleto a Ser Impresso ***

              If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text) = '1' Then
                 Begin
                 Boleto_Banco := 'BB';
                 End
              Else If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text) = '399' Then
                 Begin
                 Boleto_Banco := 'HSBC';
                 End
              Else If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text) = '237' Then
                 Begin
                 Boleto_Banco := 'BRADESCO';
                 End
              Else
                 Begin
                 Boleto_Banco := 'BB';
              End;

              //*** Começa a Impressão do Boleto ***

              If Trim(Boleto_Banco) = 'BB' Then
                 Begin

                 If (StrToInt(Banco_Cliente) = 1) Then
                    Begin
                    ConexaoBD.SQL_Clientes.Close;
                    ConexaoBD.SQL_Clientes.SQL.Clear;
                    ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39 );
                    ConexaoBD.SQL_Clientes.Open;

                    If ((Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ') Or (Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PF')) Then
                       Begin

                       If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text) <> 'À VISTA') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text) <> '')) Then
                          Begin

                          Gera_Linha := False;

                          If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                             Begin
                             Gera_Linha := True;
                             End
                          Else
                             Begin
                             If ((Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_imp_1.Text) = 'S') And (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_cart_1.Text) = 'N')) Then
                                Begin
                                Gera_Linha := True;
                             End;
                          End;

                          If Gera_Linha Then
                             Begin

                             If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_obs.Text) <> '' Then
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_docto_1.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_vlr_1.Text;
                                End
                             Else
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text;
                             End;

                             //*** Reduz o Nro da Duplicata ao Tamanho Máximo ***

                             Nro_Duplicata := Copy(Nro_Duplicata,1,15);

                             //*** Prepara as Datas de Vencimento ***

                             DT_Vecto_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;
                             Forma_Duplicata    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text;

                             //*** Impressão do Boleto na Jato de Tinta ou Laser ***

                             //*** Dados da Empresa ***

                             B_Carteira := '17019';

                             B_Cedente_Nome          := 'Ibrasmak NUTRICAO & FARMA LTD';
                             B_Cedente_TipoInscricao := '2';
                             B_Cedente_NumeroCPFCGC  := '30863575000107';

                             B_Cedente_CodigoCedente       := '11848';
                             B_Cedente_DigitoCodigoCedente := '6';

                             B_Cedente_ContaBancaria_Banco_Codigo  := Banco_Cliente;
                             B_Cedente_ContaBancaria_CodigoAgencia := '0722';
                             B_Cedente_ContaBancaria_DigitoAgencia := '6';
                             B_Cedente_ContaBancaria_NumeroConta   := '11848';
                             B_Cedente_ContaBancaria_DigitoConta   := '6';
                             B_Cedente_ContaBancaria_NomeCliente   := 'Ibrasmak Nutrição & Farma Ltda';

                             B_Cedente_Endereco_Rua         := 'Rua Gustavo da Silveira';
                             B_Cedente_Endereco_Numero      := '1357';
                             B_Cedente_Endereco_Complemento := 'Térreo';
                             B_Cedente_Endereco_Bairro      := 'Vila Santa Catarina';
                             B_Cedente_Endereco_Cidade      := 'São Paulo';
                             B_Cedente_Endereco_CEP         := '04376000';
                             B_Cedente_Endereco_Estado      := 'SP';
                             B_Cedente_Endereco_EMail       := 'Ibrasmak@Ibrasmak.com.br';

                             //*** Dados do Cliente para Pagamento ***

                             B_Sacado_Nome          := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text));

                             If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                                Begin
                                B_Sacado_TipoInscricao := '2';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                                End
                             Else
                                Begin
                                B_Sacado_TipoInscricao := '1';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                             End;

                             B_Sacado_Endereco_Rua          := Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' ' + ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
                             B_Sacado_Endereco_Bairro       := ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
                             B_Sacado_Endereco_Cidade       := ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
                             B_Sacado_Endereco_CEP          := Obtem_Antes(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-') + Obtem_Depois(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-');
                             B_Sacado_Endereco_Estado       := ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
                             B_Sacado_Endereco_EMail        := ConexaoBD.SQL_Clientesfb_cliente_email.Text;

                             B_DataProcessamento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Processamento
                             B_DataDocumento     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Emissão da Nota-Fiscal
                             B_DataVencimento    := DT_Vecto_Duplicata; // Data de Vencimento do Boleto
                             B_DataMoraJuros     := DateToStr((StrToDate(DT_Vecto_Duplicata) + 1)); // Data de Vencimento do Boleto + 1 Dia;
                             B_DataProtesto      := DateToStr((StrToDate(DT_Vecto_Duplicata) + 5)); // Data de Vencimento do Boleto + 5 Dias;

                             B_NossoNumero       := '1252925' + Gera_Zeros(StrToInt(Numero_Nota),8) + '01'; // Convênio + Número da Nota + Parcela;
                             B_NumeroDocumento   := Nro_Duplicata; //Número do Documento;
                             B_SeuNumero         := Nro_Duplicata; //Número do Documento;

                             Vlr_Duplicata_Nro := StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str));
                             Mora_Dia_Nro      := (Vlr_Duplicata_Nro * 0.004);
                             Str(Mora_Dia_Nro:13:2,Mora_Dia_Str);

                             B_ValorDocumento       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Duplicata_Str),',')),15); // Valor a Ser Cobrado;
                             B_ValorMoraJuros       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Mora_Dia_Str),',')),15); // Valor da Mora e Juros;

                             //*** Prepara o Detalhe ***

                             DT_Vecto_Duplicata := DT_Vecto_Duplicata[1]+DT_Vecto_Duplicata[2]+DT_Vecto_Duplicata[4]+DT_Vecto_Duplicata[5]+DT_Vecto_Duplicata[7]+DT_Vecto_Duplicata[8]+DT_Vecto_Duplicata[9]+DT_Vecto_Duplicata[10];

                             DT_Emissao_Docto   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                             DT_Emissao_Docto   := DT_Emissao_Docto[1]+DT_Emissao_Docto[2]+DT_Emissao_Docto[4]+DT_Emissao_Docto[5]+DT_Emissao_Docto[7]+DT_Emissao_Docto[8]+DT_Emissao_Docto[9]+DT_Emissao_Docto[10];

                             DT_Juros_Mora      := DateToStr((StrToDate(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text) + 1));
                             DT_Juros_Mora      := DT_Juros_Mora[1]+DT_Juros_Mora[2]+DT_Juros_Mora[4]+DT_Juros_Mora[5]+DT_Juros_Mora[7]+DT_Juros_Mora[8]+DT_Juros_Mora[9]+DT_Juros_Mora[10];

                             //*** Gera o Detalhe P do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '00100013' + Gera_Zeros(Nro_Detalhe,5) + 'P 010072260000000118486 ' + Gera_Espacos(Trim(B_NossoNumero),20) + '71222' + Gera_Espacos(Trim(Nro_Duplicata),15) + Trim(DT_Vecto_Duplicata) + B_ValorDocumento + '00000002N' + Trim(DT_Emissao_Docto) + '1' + Trim(DT_Juros_Mora) + B_ValorMoraJuros + '000000000000000000000000000000000000000000000000000000' + Gera_Espacos(Trim(Nro_Duplicata),25) + '1052000090000000000 ';
                             WriteLn(Arq_Remessa,Grava_Linha);

                             //*** Gera o Detalhe Q do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '00100013' + Gera_Zeros(Nro_Detalhe,5) + 'Q 01' + Trim(B_Sacado_TipoInscricao) + Gera_Zeros_Str(B_Sacado_NumeroCPFCGC,15) + Gera_Espacos(Copy(B_Sacado_Nome,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Rua,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Bairro,1,15),15) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,1,5)),5) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,6,3)),3) + Gera_Espacos(Copy(B_Sacado_Endereco_Cidade,1,15),15) + Gera_Espacos(Copy(B_Sacado_Endereco_Estado,1,2),2) + '0000000000000000' + Gera_Espacos(' ',40) + '000                            ';
                             WriteLn(Arq_Remessa,Grava_Linha);
                          End;
                       End;

                       If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text) <> 'À VISTA') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text) <> '')) Then
                          Begin

                          Gera_Linha := False;

                          If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                             Begin
                             Gera_Linha := True;
                             End
                          Else
                             Begin
                             If ((Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_imp_2.Text) = 'S') And (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_cart_2.Text) = 'N')) Then
                                Begin
                                Gera_Linha := True;
                             End;
                          End;

                          If Gera_Linha Then
                             Begin

                             If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_obs.Text) <> '' Then
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_docto_2.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_vlr_2.Text;
                                End
                             Else
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text;
                             End;

                             //*** Reduz o Nro da Duplicata ao Tamanho Máximo ***

                             Nro_Duplicata := Copy(Nro_Duplicata,1,15);

                             //*** Prepara as Datas de Vencimento ***

                             DT_Vecto_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;
                             Forma_Duplicata    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text;

                             //*** Impressão do Boleto na Jato de Tinta ou Laser ***

                             //*** Dados da Empresa ***

                             B_Carteira := '17019';

                             B_Cedente_Nome          := 'Ibrasmak NUTRICAO & FARMA LTD';
                             B_Cedente_TipoInscricao := '2';
                             B_Cedente_NumeroCPFCGC  := '30863575000107';

                             B_Cedente_CodigoCedente       := '11848';
                             B_Cedente_DigitoCodigoCedente := '6';

                             B_Cedente_ContaBancaria_Banco_Codigo  := Banco_Cliente;
                             B_Cedente_ContaBancaria_CodigoAgencia := '0722';
                             B_Cedente_ContaBancaria_DigitoAgencia := '6';
                             B_Cedente_ContaBancaria_NumeroConta   := '11848';
                             B_Cedente_ContaBancaria_DigitoConta   := '6';
                             B_Cedente_ContaBancaria_NomeCliente   := 'Ibrasmak Nutrição & Farma Ltda';

                             B_Cedente_Endereco_Rua         := 'Rua Gustavo da Silveira';
                             B_Cedente_Endereco_Numero      := '1357';
                             B_Cedente_Endereco_Complemento := 'Térreo';
                             B_Cedente_Endereco_Bairro      := 'Vila Santa Catarina';
                             B_Cedente_Endereco_Cidade      := 'São Paulo';
                             B_Cedente_Endereco_CEP         := '04376000';
                             B_Cedente_Endereco_Estado      := 'SP';
                             B_Cedente_Endereco_EMail       := 'Ibrasmak@Ibrasmak.com.br';

                             //*** Dados do Cliente para Pagamento ***

                             B_Sacado_Nome          := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text));

                             If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                                Begin
                                B_Sacado_TipoInscricao := '2';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                                End
                             Else
                                Begin
                                B_Sacado_TipoInscricao := '1';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                             End;

                             B_Sacado_Endereco_Rua          := Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' ' + ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
                             B_Sacado_Endereco_Bairro       := ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
                             B_Sacado_Endereco_Cidade       := ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
                             B_Sacado_Endereco_CEP          := Obtem_Antes(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-') + Obtem_Depois(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-');
                             B_Sacado_Endereco_Estado       := ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
                             B_Sacado_Endereco_EMail        := ConexaoBD.SQL_Clientesfb_cliente_email.Text;

                             B_DataProcessamento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Processamento
                             B_DataDocumento     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Emissão da Nota-Fiscal
                             B_DataVencimento    := DT_Vecto_Duplicata; // Data de Vencimento do Boleto
                             B_DataMoraJuros     := DateToStr((StrToDate(DT_Vecto_Duplicata) + 1)); // Data de Vencimento do Boleto + 1 Dia;
                             B_DataProtesto      := DateToStr((StrToDate(DT_Vecto_Duplicata) + 5)); // Data de Vencimento do Boleto + 5 Dias;

                             B_NossoNumero       := '1252925' + Gera_Zeros(StrToInt(Numero_Nota),8) + '02'; // Convênio + Número da Nota + Parcela;
                             B_NumeroDocumento   := Nro_Duplicata; //Número do Documento;
                             B_SeuNumero         := Nro_Duplicata; //Número do Documento;

                             Vlr_Duplicata_Nro := StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str));
                             Mora_Dia_Nro      := (Vlr_Duplicata_Nro * 0.004);
                             Str(Mora_Dia_Nro:13:2,Mora_Dia_Str);

                             B_ValorDocumento       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Duplicata_Str),',')),15); // Valor a Ser Cobrado;
                             B_ValorMoraJuros       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Mora_Dia_Str),',')),15); // Valor da Mora e Juros;

                             //*** Prepara o Detalhe ***

                             DT_Vecto_Duplicata := DT_Vecto_Duplicata[1]+DT_Vecto_Duplicata[2]+DT_Vecto_Duplicata[4]+DT_Vecto_Duplicata[5]+DT_Vecto_Duplicata[7]+DT_Vecto_Duplicata[8]+DT_Vecto_Duplicata[9]+DT_Vecto_Duplicata[10];

                             DT_Emissao_Docto   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                             DT_Emissao_Docto   := DT_Emissao_Docto[1]+DT_Emissao_Docto[2]+DT_Emissao_Docto[4]+DT_Emissao_Docto[5]+DT_Emissao_Docto[7]+DT_Emissao_Docto[8]+DT_Emissao_Docto[9]+DT_Emissao_Docto[10];

                             DT_Juros_Mora      := DateToStr((StrToDate(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text) + 1));
                             DT_Juros_Mora      := DT_Juros_Mora[1]+DT_Juros_Mora[2]+DT_Juros_Mora[4]+DT_Juros_Mora[5]+DT_Juros_Mora[7]+DT_Juros_Mora[8]+DT_Juros_Mora[9]+DT_Juros_Mora[10];

                             //*** Gera o Detalhe P do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '00100013' + Gera_Zeros(Nro_Detalhe,5) + 'P 010072260000000118486 ' + Gera_Espacos(Trim(B_NossoNumero),20) + '71222' + Gera_Espacos(Trim(Nro_Duplicata),15) + Trim(DT_Vecto_Duplicata) + B_ValorDocumento + '00000002N' + Trim(DT_Emissao_Docto) + '1' + Trim(DT_Juros_Mora) + B_ValorMoraJuros + '000000000000000000000000000000000000000000000000000000' + Gera_Espacos(Trim(Nro_Duplicata),25) + '1052000090000000000 ';
                             WriteLn(Arq_Remessa,Grava_Linha);

                             //*** Gera o Detalhe Q do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '00100013' + Gera_Zeros(Nro_Detalhe,5) + 'Q 01' + Trim(B_Sacado_TipoInscricao) + Gera_Zeros_Str(B_Sacado_NumeroCPFCGC,15) + Gera_Espacos(Copy(B_Sacado_Nome,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Rua,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Bairro,1,15),15) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,1,5)),5) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,6,3)),3) + Gera_Espacos(Copy(B_Sacado_Endereco_Cidade,1,15),15) + Gera_Espacos(Copy(B_Sacado_Endereco_Estado,1,2),2) + '0000000000000000' + Gera_Espacos(' ',40) + '000                            ';
                             WriteLn(Arq_Remessa,Grava_Linha);
                          End;
                       End;

                       If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text) <> 'À VISTA') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text) <> '')) Then
                          Begin

                          Gera_Linha := False;

                          If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                             Begin
                             Gera_Linha := True;
                             End
                          Else
                             Begin
                             If ((Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_imp_3.Text) = 'S') And (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_cart_3.Text) = 'N')) Then
                                Begin
                                Gera_Linha := True;
                             End;
                          End;

                          If Gera_Linha Then
                             Begin
                             If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_obs.Text) <> '' Then
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_docto_3.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_vlr_3.Text;
                                End
                             Else
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text;
                             End;

                             //*** Reduz o Nro da Duplicata ao Tamanho Máximo ***

                             Nro_Duplicata := Copy(Nro_Duplicata,1,15);

                             //*** Prepara as Datas de Vencimento ***

                             DT_Vecto_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;
                             Forma_Duplicata    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text;

                             //*** Impressão do Boleto na Jato de Tinta ou Laser ***

                             //*** Dados da Empresa ***

                             B_Carteira := '17019';

                             B_Cedente_Nome          := 'Ibrasmak NUTRICAO & FARMA LTD';
                             B_Cedente_TipoInscricao := '2';
                             B_Cedente_NumeroCPFCGC  := '30863575000107';

                             B_Cedente_CodigoCedente       := '11848';
                             B_Cedente_DigitoCodigoCedente := '6';

                             B_Cedente_ContaBancaria_Banco_Codigo  := Banco_Cliente;
                             B_Cedente_ContaBancaria_CodigoAgencia := '0722';
                             B_Cedente_ContaBancaria_DigitoAgencia := '6';
                             B_Cedente_ContaBancaria_NumeroConta   := '11848';
                             B_Cedente_ContaBancaria_DigitoConta   := '6';
                             B_Cedente_ContaBancaria_NomeCliente   := 'Ibrasmak Nutrição & Farma Ltda';

                             B_Cedente_Endereco_Rua         := 'Rua Gustavo da Silveira';
                             B_Cedente_Endereco_Numero      := '1357';
                             B_Cedente_Endereco_Complemento := 'Térreo';
                             B_Cedente_Endereco_Bairro      := 'Vila Santa Catarina';
                             B_Cedente_Endereco_Cidade      := 'São Paulo';
                             B_Cedente_Endereco_CEP         := '04376000';
                             B_Cedente_Endereco_Estado      := 'SP';
                             B_Cedente_Endereco_EMail       := 'Ibrasmak@Ibrasmak.com.br';

                             //*** Dados do Cliente para Pagamento ***

                             B_Sacado_Nome          := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text));

                             If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                                Begin
                                B_Sacado_TipoInscricao := '2';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                                End
                             Else
                                Begin
                                B_Sacado_TipoInscricao := '1';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                             End;

                             B_Sacado_Endereco_Rua          := Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' ' + ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
                             B_Sacado_Endereco_Bairro       := ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
                             B_Sacado_Endereco_Cidade       := ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
                             B_Sacado_Endereco_CEP          := Obtem_Antes(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-') + Obtem_Depois(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-');
                             B_Sacado_Endereco_Estado       := ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
                             B_Sacado_Endereco_EMail        := ConexaoBD.SQL_Clientesfb_cliente_email.Text;

                             B_DataProcessamento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Processamento
                             B_DataDocumento     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Emissão da Nota-Fiscal
                             B_DataVencimento    := DT_Vecto_Duplicata; // Data de Vencimento do Boleto
                             B_DataMoraJuros     := DateToStr((StrToDate(DT_Vecto_Duplicata) + 1)); // Data de Vencimento do Boleto + 1 Dia;
                             B_DataProtesto      := DateToStr((StrToDate(DT_Vecto_Duplicata) + 5)); // Data de Vencimento do Boleto + 5 Dias;

                             B_NossoNumero       := '1252925' + Gera_Zeros(StrToInt(Numero_Nota),8) + '03'; // Convênio + Número da Nota + Parcela;
                             B_NumeroDocumento   := Nro_Duplicata; //Número do Documento;
                             B_SeuNumero         := Nro_Duplicata; //Número do Documento;

                             Vlr_Duplicata_Nro := StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str));
                             Mora_Dia_Nro      := (Vlr_Duplicata_Nro * 0.004);
                             Str(Mora_Dia_Nro:13:2,Mora_Dia_Str);

                             B_ValorDocumento       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Duplicata_Str),',')),15); // Valor a Ser Cobrado;
                             B_ValorMoraJuros       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Mora_Dia_Str),',')),15); // Valor da Mora e Juros;

                             //*** Prepara o Detalhe ***

                             DT_Vecto_Duplicata := DT_Vecto_Duplicata[1]+DT_Vecto_Duplicata[2]+DT_Vecto_Duplicata[4]+DT_Vecto_Duplicata[5]+DT_Vecto_Duplicata[7]+DT_Vecto_Duplicata[8]+DT_Vecto_Duplicata[9]+DT_Vecto_Duplicata[10];

                             DT_Emissao_Docto   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                             DT_Emissao_Docto   := DT_Emissao_Docto[1]+DT_Emissao_Docto[2]+DT_Emissao_Docto[4]+DT_Emissao_Docto[5]+DT_Emissao_Docto[7]+DT_Emissao_Docto[8]+DT_Emissao_Docto[9]+DT_Emissao_Docto[10];

                             DT_Juros_Mora      := DateToStr((StrToDate(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text) + 1));
                             DT_Juros_Mora      := DT_Juros_Mora[1]+DT_Juros_Mora[2]+DT_Juros_Mora[4]+DT_Juros_Mora[5]+DT_Juros_Mora[7]+DT_Juros_Mora[8]+DT_Juros_Mora[9]+DT_Juros_Mora[10];

                             //*** Gera o Detalhe P do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '00100013' + Gera_Zeros(Nro_Detalhe,5) + 'P 010072260000000118486 ' + Gera_Espacos(Trim(B_NossoNumero),20) + '71222' + Gera_Espacos(Trim(Nro_Duplicata),15) + Trim(DT_Vecto_Duplicata) + B_ValorDocumento + '00000002N' + Trim(DT_Emissao_Docto) + '1' + Trim(DT_Juros_Mora) + B_ValorMoraJuros + '000000000000000000000000000000000000000000000000000000' + Gera_Espacos(Trim(Nro_Duplicata),25) + '1052000090000000000 ';
                             WriteLn(Arq_Remessa,Grava_Linha);

                             //*** Gera o Detalhe Q do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '00100013' + Gera_Zeros(Nro_Detalhe,5) + 'Q 01' + Trim(B_Sacado_TipoInscricao) + Gera_Zeros_Str(B_Sacado_NumeroCPFCGC,15) + Gera_Espacos(Copy(B_Sacado_Nome,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Rua,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Bairro,1,15),15) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,1,5)),5) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,6,3)),3) + Gera_Espacos(Copy(B_Sacado_Endereco_Cidade,1,15),15) + Gera_Espacos(Copy(B_Sacado_Endereco_Estado,1,2),2) + '0000000000000000' + Gera_Espacos(' ',40) + '000                            ';
                             WriteLn(Arq_Remessa,Grava_Linha);
                          End;
                       End;

                    End;

                    ConexaoBD.SQL_Clientes.Close;

                 End;

              End;

              conexaoBD.SQL_FB_Nota_Fiscal.Next;
        End;

        //*** Gera o Trailer do Lote ***

        Grava_Linha := '00100015         ' + Gera_Zeros(Qtde_Registros_Lote,6) + '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' + Gera_Espacos(' ',125);
        WriteLn(Arq_Remessa,Grava_Linha);

        //*** Gera o Trailer do Header ***

        Grava_Linha := '00199999         000001' + Gera_Zeros((Qtde_Registros_Lote + 2),6) + '000001' + Gera_Espacos(' ',205);
        WriteLn(Arq_Remessa,Grava_Linha);

        //*** Finaliza a Gravação do Arquivo ***

        CloseFile(Arq_Remessa);

        //***
        //***
        //***
        //*** Gera o Arquivo de Remessa para o HSBC ***
        //***
        //***
        //***

        Nome_Arq_Remessa := 'NT'+ Trim(DT_Arquivo[1]+DT_Arquivo[2]+DT_Arquivo[3]+DT_Arquivo[4]+DT_Arquivo[7]+DT_Arquivo[8]) +'.txt';

        If FileExists('C:\Grupo_Ibrasmak\Ibrasmak\Remessa\HSBC\'+Nome_Arq_Remessa) Then
           Begin
           DeleteFile('C:\Grupo_Ibrasmak\Ibrasmak\Remessa\HSBC\'+Nome_Arq_Remessa);
        End;

        AssignFile(Arq_Remessa,'C:\Grupo_Ibrasmak\Ibrasmak\Remessa\HSBC\'+Nome_Arq_Remessa);

        Rewrite(Arq_Remessa);

        //*** Gera o Linha Header ***

        Grava_Linha := '39900000         230863575000107COBCNAB001932062547901932000000062547900Ibrasmak NUTRICAO & FARMA LTDBANCO HSBC BANK BRASIL S.A.             1' + Trim(DT_Arquivo) + Trim(HR_Arquivo) + Gera_Zeros(Nro_Sequencial,6)  + '03000000                                                                     ';
        WriteLn(Arq_Remessa,Grava_Linha);

        //*** Gera o Header de Lote ***

        Grava_Linha := '39900011R0100010 2030863575000107COB    001932062547901932000000062547900Ibrasmak NUTRICAO & FARMA LTD                                                                                ' + Gera_Zeros(Nro_Sequencial,8) + Trim(DT_Arquivo) + '00000000' + '                                 ';
        WriteLn(Arq_Remessa,Grava_Linha);

        Nro_Detalhe         := 0;
        Qtde_Registros_Lote := 2;

        conexaoBD.SQL_FB_Nota_Fiscal.First;

        While Not conexaoBD.SQL_FB_Nota_Fiscal.Eof Do
              Begin

              Numero_Nota    := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;
              Codigo_Cliente := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;
              Banco_Cliente  := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text);

              //*** Obtem o Tipo de Boleto a Ser Impresso ***

              If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text) = '1' Then
                 Begin
                 Boleto_Banco := 'BB';
                 End
              Else If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text) = '399' Then
                 Begin
                 Boleto_Banco := 'HSBC';
                 End
              Else
                 Begin
                 Boleto_Banco := 'BB';
              End;

              //*** Começa a Impressão do Boleto ***

              If Trim(Boleto_Banco) = 'HSBC' Then
                 Begin

                 If ((StrToInt(Banco_Cliente) = 1) Or (StrToInt(Banco_Cliente) = 399) Or (StrToInt(Banco_Cliente) = 237)) Then
                    Begin
                    ConexaoBD.SQL_Clientes.Close;
                    ConexaoBD.SQL_Clientes.SQL.Clear;
                    ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39 );
                    ConexaoBD.SQL_Clientes.Open;

                    If ((Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ') Or (Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PF')) Then
                       Begin

                       If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text) <> 'À VISTA') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text) <> '')) Then
                          Begin

                          Gera_Linha := False;

                          If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                             Begin
                             Gera_Linha := True;
                             End
                          Else
                             Begin
                             If ((Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_imp_1.Text) = 'S') And (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_cart_1.Text) = 'N')) Then
                                Begin
                                Gera_Linha := True;
                             End;
                          End;

                          If Gera_Linha Then
                             Begin

                             If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_obs.Text) <> '' Then
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_docto_1.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_vlr_1.Text;
                                End
                             Else
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text;
                             End;

                             //*** Reduz o Nro da Duplicata ao Tamanho Máximo ***

                             Nro_Duplicata := Copy(Nro_Duplicata,1,15);

                             //*** Prepara as Datas de Vencimento ***

                             DT_Vecto_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;
                             Forma_Duplicata    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text;

                             //*** Impressão do Boleto na Jato de Tinta ou Laser ***

                             //*** Dados da Empresa ***

                             B_Carteira := 'CSB';

                             B_Cedente_Nome          := 'Ibrasmak NUTRICAO & FARMA LTD';
                             B_Cedente_TipoInscricao := '2';
                             B_Cedente_NumeroCPFCGC  := '30863575000107';

                             B_Cedente_CodigoCedente       := '0625479';
                             B_Cedente_DigitoCodigoCedente := '';

                             B_Cedente_ContaBancaria_Banco_Codigo  := Banco_Cliente;
                             B_Cedente_ContaBancaria_CodigoAgencia := '1932';
                             B_Cedente_ContaBancaria_DigitoAgencia := '';
                             B_Cedente_ContaBancaria_NumeroConta   := '06254';
                             B_Cedente_ContaBancaria_DigitoConta   := '79';
                             B_Cedente_ContaBancaria_NomeCliente   := 'Ibrasmak Nutrição & Farma Ltda';

                             B_Cedente_Endereco_Rua         := 'Rua Gustavo da Silveira';
                             B_Cedente_Endereco_Numero      := '1357';
                             B_Cedente_Endereco_Complemento := 'Térreo';
                             B_Cedente_Endereco_Bairro      := 'Vila Santa Catarina';
                             B_Cedente_Endereco_Cidade      := 'São Paulo';
                             B_Cedente_Endereco_CEP         := '04376000';
                             B_Cedente_Endereco_Estado      := 'SP';
                             B_Cedente_Endereco_EMail       := 'Ibrasmak@Ibrasmak.com.br';

                             //*** Dados do Cliente para Pagamento ***

                             B_Sacado_Nome          := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text));

                             If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                                Begin
                                B_Sacado_TipoInscricao := '2';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                                End
                             Else
                                Begin
                                B_Sacado_TipoInscricao := '1';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                             End;

                             B_Sacado_Endereco_Rua          := Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' ' + ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
                             B_Sacado_Endereco_Bairro       := ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
                             B_Sacado_Endereco_Cidade       := ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
                             B_Sacado_Endereco_CEP          := Obtem_Antes(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-') + Obtem_Depois(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-');
                             B_Sacado_Endereco_Estado       := ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
                             B_Sacado_Endereco_EMail        := ConexaoBD.SQL_Clientesfb_cliente_email.Text;

                             B_DataProcessamento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Processamento
                             B_DataDocumento     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Emissão da Nota-Fiscal
                             B_DataVencimento    := DT_Vecto_Duplicata; // Data de Vencimento do Boleto
                             B_DataMoraJuros     := DateToStr((StrToDate(DT_Vecto_Duplicata) + 1)); // Data de Vencimento do Boleto + 1 Dia;
                             B_DataProtesto      := DateToStr((StrToDate(DT_Vecto_Duplicata) + 5)); // Data de Vencimento do Boleto + 5 Dias;

                             B_NossoNumero       := '77665' + Gera_Zeros(StrToInt(Copy(Numero_Nota,2,4)),4) + '1'; // Convênio + Número da Nota + Parcela;
                             B_NumeroDocumento   := Nro_Duplicata; //Número do Documento;
                             B_SeuNumero         := Nro_Duplicata; //Número do Documento;

                             Vlr_Duplicata_Nro := StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str));
                             Mora_Dia_Nro      := (Vlr_Duplicata_Nro * 0.004);
                             Str(Mora_Dia_Nro:13:2,Mora_Dia_Str);

                             B_ValorDocumento       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Duplicata_Str),',')),15); // Valor a Ser Cobrado;
                             B_ValorMoraJuros       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Mora_Dia_Str),',')),15); // Valor da Mora e Juros;

                             //*** Prepara o Detalhe ***

                             DT_Vecto_Duplicata := DT_Vecto_Duplicata[1]+DT_Vecto_Duplicata[2]+DT_Vecto_Duplicata[4]+DT_Vecto_Duplicata[5]+DT_Vecto_Duplicata[7]+DT_Vecto_Duplicata[8]+DT_Vecto_Duplicata[9]+DT_Vecto_Duplicata[10];

                             DT_Emissao_Docto   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                             DT_Emissao_Docto   := DT_Emissao_Docto[1]+DT_Emissao_Docto[2]+DT_Emissao_Docto[4]+DT_Emissao_Docto[5]+DT_Emissao_Docto[7]+DT_Emissao_Docto[8]+DT_Emissao_Docto[9]+DT_Emissao_Docto[10];

                             DT_Juros_Mora      := DateToStr((StrToDate(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text) + 1));
                             DT_Juros_Mora      := DT_Juros_Mora[1]+DT_Juros_Mora[2]+DT_Juros_Mora[4]+DT_Juros_Mora[5]+DT_Juros_Mora[7]+DT_Juros_Mora[8]+DT_Juros_Mora[9]+DT_Juros_Mora[10];

                             //*** Gera o Detalhe P do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '39900013' + Gera_Zeros(Nro_Detalhe,5) + 'P 0101932000000062547900' + Gera_Zeros_Str(Trim(B_NossoNumero) + Trim(Calcula_Digito_HSBC(Trim(B_NossoNumero),7)),11) + '00000000011122' + Gera_Espacos(Trim(Nro_Duplicata),15) + Trim(DT_Vecto_Duplicata) + B_ValorDocumento + '00000002N' + Trim(DT_Emissao_Docto) + '1' + Trim(DT_Juros_Mora) + B_ValorMoraJuros + '000000000000000000000000000000000000000000000000000000' + Gera_Espacos(Trim(Nro_Duplicata),25) + '105200009           ';
                             WriteLn(Arq_Remessa,Grava_Linha);

                             //*** Gera o Detalhe Q do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '39900013' + Gera_Zeros(Nro_Detalhe,5) + 'Q 01' + Trim(B_Sacado_TipoInscricao) + Gera_Zeros_Str(B_Sacado_NumeroCPFCGC,15) + Gera_Espacos(Copy(B_Sacado_Nome,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Rua,1,38),38) + '  ' + Gera_Espacos(Copy(B_Sacado_Endereco_Bairro,1,12),12) + '   ' + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,1,5)),5) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,6,3)),3) + Gera_Espacos(Copy(B_Sacado_Endereco_Cidade,1,15),15) + Gera_Espacos(Copy(B_Sacado_Endereco_Estado,1,2),2) + '0000000000000000' + Gera_Espacos(' ',40) + '                               ';
                             WriteLn(Arq_Remessa,Grava_Linha);
                          End;
                       End;

                       If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text) <> 'À VISTA') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text) <> '')) Then
                          Begin

                          Gera_Linha := False;

                          If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                             Begin
                             Gera_Linha := True;
                             End
                          Else
                             Begin
                             If ((Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_imp_2.Text) = 'S') And (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_cart_2.Text) = 'N')) Then
                                Begin
                                Gera_Linha := True;
                             End;
                          End;

                          If Gera_Linha Then
                             Begin

                             If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_obs.Text) <> '' Then
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_docto_2.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_vlr_2.Text;
                                End
                             Else
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text;
                             End;

                             //*** Reduz o Nro da Duplicata ao Tamanho Máximo ***

                             Nro_Duplicata := Copy(Nro_Duplicata,1,15);

                             //*** Prepara as Datas de Vencimento ***

                             DT_Vecto_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;
                             Forma_Duplicata    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text;

                             //*** Impressão do Boleto na Jato de Tinta ou Laser ***

                             //*** Dados da Empresa ***

                             B_Carteira := 'CSB';

                             B_Cedente_Nome          := 'Ibrasmak NUTRICAO & FARMA LTD';
                             B_Cedente_TipoInscricao := '2';
                             B_Cedente_NumeroCPFCGC  := '30863575000107';

                             B_Cedente_CodigoCedente       := '0625479';
                             B_Cedente_DigitoCodigoCedente := '';

                             B_Cedente_ContaBancaria_Banco_Codigo  := Banco_Cliente;
                             B_Cedente_ContaBancaria_CodigoAgencia := '1932';
                             B_Cedente_ContaBancaria_DigitoAgencia := '';
                             B_Cedente_ContaBancaria_NumeroConta   := '06254';
                             B_Cedente_ContaBancaria_DigitoConta   := '79';
                             B_Cedente_ContaBancaria_NomeCliente   := 'Ibrasmak Nutrição & Farma Ltda';

                             B_Cedente_Endereco_Rua         := 'Rua Gustavo da Silveira';
                             B_Cedente_Endereco_Numero      := '1357';
                             B_Cedente_Endereco_Complemento := 'Térreo';
                             B_Cedente_Endereco_Bairro      := 'Vila Santa Catarina';
                             B_Cedente_Endereco_Cidade      := 'São Paulo';
                             B_Cedente_Endereco_CEP         := '04376000';
                             B_Cedente_Endereco_Estado      := 'SP';
                             B_Cedente_Endereco_EMail       := 'Ibrasmak@Ibrasmak.com.br';

                             //*** Dados do Cliente para Pagamento ***

                             B_Sacado_Nome          := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text));

                             If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                                Begin
                                B_Sacado_TipoInscricao := '2';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                                End
                             Else
                                Begin
                                B_Sacado_TipoInscricao := '1';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                             End;

                             B_Sacado_Endereco_Rua          := Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' ' + ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
                             B_Sacado_Endereco_Bairro       := ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
                             B_Sacado_Endereco_Cidade       := ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
                             B_Sacado_Endereco_CEP          := Obtem_Antes(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-') + Obtem_Depois(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-');
                             B_Sacado_Endereco_Estado       := ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
                             B_Sacado_Endereco_EMail        := ConexaoBD.SQL_Clientesfb_cliente_email.Text;

                             B_DataProcessamento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Processamento
                             B_DataDocumento     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Emissão da Nota-Fiscal
                             B_DataVencimento    := DT_Vecto_Duplicata; // Data de Vencimento do Boleto
                             B_DataMoraJuros     := DateToStr((StrToDate(DT_Vecto_Duplicata) + 1)); // Data de Vencimento do Boleto + 1 Dia;
                             B_DataProtesto      := DateToStr((StrToDate(DT_Vecto_Duplicata) + 5)); // Data de Vencimento do Boleto + 5 Dias;

                             B_NossoNumero       := '77665' + Gera_Zeros(StrToInt(Copy(Numero_Nota,2,4)),4) + '2'; // Convênio + Número da Nota + Parcela;
                             B_NumeroDocumento   := Nro_Duplicata; //Número do Documento;
                             B_SeuNumero         := Nro_Duplicata; //Número do Documento;

                             Vlr_Duplicata_Nro := StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str));
                             Mora_Dia_Nro      := (Vlr_Duplicata_Nro * 0.004);
                             Str(Mora_Dia_Nro:13:2,Mora_Dia_Str);

                             B_ValorDocumento       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Duplicata_Str),',')),15); // Valor a Ser Cobrado;
                             B_ValorMoraJuros       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Mora_Dia_Str),',')),15); // Valor da Mora e Juros;

                             //*** Prepara o Detalhe ***

                             DT_Vecto_Duplicata := DT_Vecto_Duplicata[1]+DT_Vecto_Duplicata[2]+DT_Vecto_Duplicata[4]+DT_Vecto_Duplicata[5]+DT_Vecto_Duplicata[7]+DT_Vecto_Duplicata[8]+DT_Vecto_Duplicata[9]+DT_Vecto_Duplicata[10];

                             DT_Emissao_Docto   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                             DT_Emissao_Docto   := DT_Emissao_Docto[1]+DT_Emissao_Docto[2]+DT_Emissao_Docto[4]+DT_Emissao_Docto[5]+DT_Emissao_Docto[7]+DT_Emissao_Docto[8]+DT_Emissao_Docto[9]+DT_Emissao_Docto[10];

                             DT_Juros_Mora      := DateToStr((StrToDate(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text) + 1));
                             DT_Juros_Mora      := DT_Juros_Mora[1]+DT_Juros_Mora[2]+DT_Juros_Mora[4]+DT_Juros_Mora[5]+DT_Juros_Mora[7]+DT_Juros_Mora[8]+DT_Juros_Mora[9]+DT_Juros_Mora[10];

                             //*** Gera o Detalhe P do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '39900013' + Gera_Zeros(Nro_Detalhe,5) + 'P 0101932000000062547900' + Gera_Zeros_Str(Trim(B_NossoNumero) + Trim(Calcula_Digito_HSBC(Trim(B_NossoNumero),7)),11) + '00000000011122' + Gera_Espacos(Trim(Nro_Duplicata),15) + Trim(DT_Vecto_Duplicata) + B_ValorDocumento + '00000002N' + Trim(DT_Emissao_Docto) + '1' + Trim(DT_Juros_Mora) + B_ValorMoraJuros + '000000000000000000000000000000000000000000000000000000' + Gera_Espacos(Trim(Nro_Duplicata),25) + '105200009           ';
                             WriteLn(Arq_Remessa,Grava_Linha);

                             //*** Gera o Detalhe Q do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '39900013' + Gera_Zeros(Nro_Detalhe,5) + 'Q 01' + Trim(B_Sacado_TipoInscricao) + Gera_Zeros_Str(B_Sacado_NumeroCPFCGC,15) + Gera_Espacos(Copy(B_Sacado_Nome,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Rua,1,38),38) + '  ' + Gera_Espacos(Copy(B_Sacado_Endereco_Bairro,1,12),12) + '   ' + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,1,5)),5) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,6,3)),3) + Gera_Espacos(Copy(B_Sacado_Endereco_Cidade,1,15),15) + Gera_Espacos(Copy(B_Sacado_Endereco_Estado,1,2),2) + '0000000000000000' + Gera_Espacos(' ',40) + '                               ';
                             WriteLn(Arq_Remessa,Grava_Linha);
                          End;
                       End;

                       If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text) <> 'À VISTA') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text) <> '')) Then
                          Begin

                          Gera_Linha := False;

                          If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                             Begin
                             Gera_Linha := True;
                             End
                          Else
                             Begin
                             If ((Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_imp_3.Text) = 'S') And (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_cart_3.Text) = 'N')) Then
                                Begin
                                Gera_Linha := True;
                             End;
                          End;

                          If Gera_Linha Then
                             Begin
                             If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_obs.Text) <> '' Then
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_docto_3.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_vlr_3.Text;
                                End
                             Else
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text;
                             End;

                             //*** Reduz o Nro da Duplicata ao Tamanho Máximo ***

                             Nro_Duplicata := Copy(Nro_Duplicata,1,15);

                             //*** Prepara as Datas de Vencimento ***

                             DT_Vecto_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;
                             Forma_Duplicata    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text;

                             //*** Impressão do Boleto na Jato de Tinta ou Laser ***

                             //*** Dados da Empresa ***

                             B_Carteira := 'CSB';

                             B_Cedente_Nome          := 'Ibrasmak NUTRICAO & FARMA LTD';
                             B_Cedente_TipoInscricao := '2';
                             B_Cedente_NumeroCPFCGC  := '30863575000107';

                             B_Cedente_CodigoCedente       := '0625479';
                             B_Cedente_DigitoCodigoCedente := '';

                             B_Cedente_ContaBancaria_Banco_Codigo  := Banco_Cliente;
                             B_Cedente_ContaBancaria_CodigoAgencia := '1932';
                             B_Cedente_ContaBancaria_DigitoAgencia := '';
                             B_Cedente_ContaBancaria_NumeroConta   := '06254';
                             B_Cedente_ContaBancaria_DigitoConta   := '79';
                             B_Cedente_ContaBancaria_NomeCliente   := 'Ibrasmak Nutrição & Farma Ltda';

                             B_Cedente_Endereco_Rua         := 'Rua Gustavo da Silveira';
                             B_Cedente_Endereco_Numero      := '1357';
                             B_Cedente_Endereco_Complemento := 'Térreo';
                             B_Cedente_Endereco_Bairro      := 'Vila Santa Catarina';
                             B_Cedente_Endereco_Cidade      := 'São Paulo';
                             B_Cedente_Endereco_CEP         := '04376000';
                             B_Cedente_Endereco_Estado      := 'SP';
                             B_Cedente_Endereco_EMail       := 'Ibrasmak@Ibrasmak.com.br';

                             //*** Dados do Cliente para Pagamento ***

                             B_Sacado_Nome          := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text));

                             If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                                Begin
                                B_Sacado_TipoInscricao := '2';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                                End
                             Else
                                Begin
                                B_Sacado_TipoInscricao := '1';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                             End;

                             B_Sacado_Endereco_Rua          := Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' ' + ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
                             B_Sacado_Endereco_Bairro       := ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
                             B_Sacado_Endereco_Cidade       := ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
                             B_Sacado_Endereco_CEP          := Obtem_Antes(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-') + Obtem_Depois(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-');
                             B_Sacado_Endereco_Estado       := ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
                             B_Sacado_Endereco_EMail        := ConexaoBD.SQL_Clientesfb_cliente_email.Text;

                             B_DataProcessamento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Processamento
                             B_DataDocumento     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Emissão da Nota-Fiscal
                             B_DataVencimento    := DT_Vecto_Duplicata; // Data de Vencimento do Boleto
                             B_DataMoraJuros     := DateToStr((StrToDate(DT_Vecto_Duplicata) + 1)); // Data de Vencimento do Boleto + 1 Dia;
                             B_DataProtesto      := DateToStr((StrToDate(DT_Vecto_Duplicata) + 5)); // Data de Vencimento do Boleto + 5 Dias;

                             B_NossoNumero       := '77665' + Gera_Zeros(StrToInt(Copy(Numero_Nota,2,4)),4) + '3'; // Convênio + Número da Nota + Parcela;
                             B_NumeroDocumento   := Nro_Duplicata; //Número do Documento;
                             B_SeuNumero         := Nro_Duplicata; //Número do Documento;

                             Vlr_Duplicata_Nro := StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str));
                             Mora_Dia_Nro      := (Vlr_Duplicata_Nro * 0.004);
                             Str(Mora_Dia_Nro:13:2,Mora_Dia_Str);

                             B_ValorDocumento       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Duplicata_Str),',')),15); // Valor a Ser Cobrado;
                             B_ValorMoraJuros       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Mora_Dia_Str),',')),15); // Valor da Mora e Juros;

                             //*** Prepara o Detalhe ***

                             DT_Vecto_Duplicata := DT_Vecto_Duplicata[1]+DT_Vecto_Duplicata[2]+DT_Vecto_Duplicata[4]+DT_Vecto_Duplicata[5]+DT_Vecto_Duplicata[7]+DT_Vecto_Duplicata[8]+DT_Vecto_Duplicata[9]+DT_Vecto_Duplicata[10];

                             DT_Emissao_Docto   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                             DT_Emissao_Docto   := DT_Emissao_Docto[1]+DT_Emissao_Docto[2]+DT_Emissao_Docto[4]+DT_Emissao_Docto[5]+DT_Emissao_Docto[7]+DT_Emissao_Docto[8]+DT_Emissao_Docto[9]+DT_Emissao_Docto[10];

                             DT_Juros_Mora      := DateToStr((StrToDate(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text) + 1));
                             DT_Juros_Mora      := DT_Juros_Mora[1]+DT_Juros_Mora[2]+DT_Juros_Mora[4]+DT_Juros_Mora[5]+DT_Juros_Mora[7]+DT_Juros_Mora[8]+DT_Juros_Mora[9]+DT_Juros_Mora[10];

                             //*** Gera o Detalhe P do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '39900013' + Gera_Zeros(Nro_Detalhe,5) + 'P 0101932000000062547900' + Gera_Zeros_Str(Trim(B_NossoNumero) + Trim(Calcula_Digito_HSBC(Trim(B_NossoNumero),7)),11) + '00000000011122' + Gera_Espacos(Trim(Nro_Duplicata),15) + Trim(DT_Vecto_Duplicata) + B_ValorDocumento + '00000002N' + Trim(DT_Emissao_Docto) + '1' + Trim(DT_Juros_Mora) + B_ValorMoraJuros + '000000000000000000000000000000000000000000000000000000' + Gera_Espacos(Trim(Nro_Duplicata),25) + '105200009           ';
                             WriteLn(Arq_Remessa,Grava_Linha);

                             //*** Gera o Detalhe Q do Lote ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '39900013' + Gera_Zeros(Nro_Detalhe,5) + 'Q 01' + Trim(B_Sacado_TipoInscricao) + Gera_Zeros_Str(B_Sacado_NumeroCPFCGC,15) + Gera_Espacos(Copy(B_Sacado_Nome,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Rua,1,38),38) + '  ' + Gera_Espacos(Copy(B_Sacado_Endereco_Bairro,1,12),12) + '   ' + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,1,5)),5) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,6,3)),3) + Gera_Espacos(Copy(B_Sacado_Endereco_Cidade,1,15),15) + Gera_Espacos(Copy(B_Sacado_Endereco_Estado,1,2),2) + '0000000000000000' + Gera_Espacos(' ',40) + '                               ';
                             WriteLn(Arq_Remessa,Grava_Linha);
                          End;
                       End;

                    End;

                    ConexaoBD.SQL_Clientes.Close;

                 End;

              End;

              conexaoBD.SQL_FB_Nota_Fiscal.Next;
        End;

        //*** Gera o Trailer do Lote ***

        Grava_Linha := '39900015         ' + Gera_Zeros(Qtde_Registros_Lote,6) + '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' + Gera_Espacos(' ',125);
        WriteLn(Arq_Remessa,Grava_Linha);

        //*** Gera o Trailer do Header ***

        Grava_Linha := '39999999         000001' + Gera_Zeros((Qtde_Registros_Lote + 2),6) + '000001' + Gera_Espacos(' ',205);
        WriteLn(Arq_Remessa,Grava_Linha);

        //*** Finaliza a Gravação do Arquivo ***

        CloseFile(Arq_Remessa);

        //***
        //***
        //***
        //*** Gera o Arquivo de Remessa para o Bradesco ***
        //***
        //***
        //***

        DT_Arquivo := Trim(DateToStr(Date()));
        DT_Arquivo := DT_Arquivo[1]+DT_Arquivo[2]+DT_Arquivo[4]+DT_Arquivo[5]+DT_Arquivo[9]+DT_Arquivo[10];
        DT_Arquivo := Trim(DT_Arquivo);

        HR_Arquivo := Trim(TimeToStr(Time()));
        HR_Arquivo := HR_Arquivo[1]+HR_Arquivo[2]+HR_Arquivo[4]+HR_Arquivo[5]+HR_Arquivo[7]+HR_Arquivo[8];
        HR_Arquivo := Trim(HR_Arquivo);

        Nome_Arq_Remessa := 'CB'+ Trim(DT_Arquivo[1]+DT_Arquivo[2]+DT_Arquivo[3]+DT_Arquivo[4])+'NT.REM';

        If FileExists('C:\Grupo_Ibrasmak\Ibrasmak\Remessa\BRADESCO\'+Nome_Arq_Remessa) Then
           Begin
           DeleteFile('C:\Grupo_Ibrasmak\Ibrasmak\Remessa\BRADESCO\'+Nome_Arq_Remessa);
        End;

        AssignFile(Arq_Remessa,'C:\Grupo_Ibrasmak\Ibrasmak\Remessa\BRADESCO\'+Nome_Arq_Remessa);

        Rewrite(Arq_Remessa);

        //*** Gera o Linha Header ***
        Grava_Linha := '01REMESSA01COBRANCA       00000000000004036057Ibrasmak NUTRICAO & FARMA LTD237BRADESCO       ' + Trim(DT_Arquivo) + '        MX' + Gera_Zeros(Nro_Sequencial,7) + Gera_Espacos(' ',277) + '000001';
        WriteLn(Arq_Remessa,Grava_Linha);

        Nro_Detalhe         := 1;
        Qtde_Registros_Lote := 2;

        conexaoBD.SQL_FB_Nota_Fiscal.First;

        While Not conexaoBD.SQL_FB_Nota_Fiscal.Eof Do
              Begin

              Numero_Nota    := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;
              Codigo_Cliente := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;
              Banco_Cliente  := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text);

              //*** Obtem o Tipo de Boleto a Ser Impresso ***

              If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text) = '1' Then
                 Begin
                 Boleto_Banco := 'BB';
                 End
              Else If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text) = '399' Then
                 Begin
                 Boleto_Banco := 'HSBC';
                 End
              Else If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text) = '237' Then
                 Begin
                 Boleto_Banco := 'BRADESCO';
                 End
              Else
                 Begin
                 Boleto_Banco := 'BB';
              End;

              //*** Começa a Impressão do Boleto ***

              If Trim(Boleto_Banco) = 'BRADESCO' Then
                 Begin

                 If ((StrToInt(Banco_Cliente) = 1) Or (StrToInt(Banco_Cliente) = 399) Or (StrToInt(Banco_Cliente) = 237)) Then
                    Begin
                    ConexaoBD.SQL_Clientes.Close;
                    ConexaoBD.SQL_Clientes.SQL.Clear;
                    ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39 );
                    ConexaoBD.SQL_Clientes.Open;

                    If ((Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ') Or (Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PF')) Then
                       Begin

                       If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text) <> 'À VISTA') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text) <> '')) Then
                          Begin

                          Gera_Linha := False;

                          If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                             Begin
                             Gera_Linha := True;
                             End
                          Else
                             Begin
                             If ((Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_imp_1.Text) = 'S') And (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_cart_1.Text) = 'N')) Then
                                Begin
                                Gera_Linha := True;
                             End;
                          End;

                          If Gera_Linha Then
                             Begin

                             If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_obs.Text) <> '' Then
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_docto_1.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_vlr_1.Text;
                                End
                             Else
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text;
                             End;

                             //*** Reduz o Nro da Duplicata ao Tamanho Máximo ***

                             Nro_Duplicata := Copy(Nro_Duplicata,1,10);

                             //*** Prepara as Datas de Vencimento ***

                             DT_Vecto_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;
                             Forma_Duplicata    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_1.Text;

                             //*** Impressão do Boleto na Jato de Tinta ou Laser ***

                             //*** Dados da Empresa ***

                             B_Carteira := '09';

                             B_Cedente_Nome          := 'Ibrasmak NUTRICAO & FARMA LTD';
                             B_Cedente_TipoInscricao := '2';
                             B_Cedente_NumeroCPFCGC  := '30863575000107';

                             B_Cedente_CodigoCedente       := '34744';
                             B_Cedente_DigitoCodigoCedente := '2';

                             B_Cedente_ContaBancaria_Banco_Codigo  := Banco_Cliente;
                             B_Cedente_ContaBancaria_CodigoAgencia := '1480';
                             B_Cedente_ContaBancaria_DigitoAgencia := '0';
                             B_Cedente_ContaBancaria_NumeroConta   := '34744';
                             B_Cedente_ContaBancaria_DigitoConta   := '2';
                             B_Cedente_ContaBancaria_NomeCliente   := 'Ibrasmak Nutrição & Farma Ltda';

                             B_Cedente_Endereco_Rua         := 'Rua Gustavo da Silveira';
                             B_Cedente_Endereco_Numero      := '1357';
                             B_Cedente_Endereco_Complemento := 'Térreo';
                             B_Cedente_Endereco_Bairro      := 'Vila Santa Catarina';
                             B_Cedente_Endereco_Cidade      := 'São Paulo';
                             B_Cedente_Endereco_CEP         := '04376000';
                             B_Cedente_Endereco_Estado      := 'SP';
                             B_Cedente_Endereco_EMail       := 'Ibrasmak@Ibrasmak.com.br';

                             //*** Dados do Cliente para Pagamento ***

                             B_Sacado_Nome          := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text));

                             If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                                Begin
                                B_Sacado_TipoInscricao := '02';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                                End
                             Else
                                Begin
                                B_Sacado_TipoInscricao := '01';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                             End;

                             B_Sacado_Endereco_Rua          := Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' ' + ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
                             B_Sacado_Endereco_Bairro       := ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
                             B_Sacado_Endereco_Cidade       := ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
                             B_Sacado_Endereco_CEP          := Obtem_Antes(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-') + Obtem_Depois(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-');
                             B_Sacado_Endereco_Estado       := ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
                             B_Sacado_Endereco_EMail        := ConexaoBD.SQL_Clientesfb_cliente_email.Text;

                             B_DataProcessamento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Processamento
                             B_DataDocumento     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Emissão da Nota-Fiscal
                             B_DataVencimento    := DT_Vecto_Duplicata; // Data de Vencimento do Boleto
                             B_DataMoraJuros     := DateToStr((StrToDate(DT_Vecto_Duplicata) + 1)); // Data de Vencimento do Boleto + 1 Dia;
                             B_DataProtesto      := DateToStr((StrToDate(DT_Vecto_Duplicata) + 5)); // Data de Vencimento do Boleto + 5 Dias;

                             B_NossoNumero       := Gera_Zeros_Str(Trim(Numero_Nota),10) + '1' +  Calcula_Digito_Bradesco('09'+Gera_Zeros_Str(Trim(Numero_Nota),10)+'1',7,True); // Número da Nota + Parcela;
                             B_NumeroDocumento   := Nro_Duplicata; //Número do Documento;
                             B_SeuNumero         := Nro_Duplicata; //Número do Documento;

                             Vlr_Duplicata_Nro := StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str));
                             Mora_Dia_Nro      := (Vlr_Duplicata_Nro * 0.004);
                             Str(Mora_Dia_Nro:13:2,Mora_Dia_Str);

                             B_ValorDocumento       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Duplicata_Str),',')),13); // Valor a Ser Cobrado;
                             B_ValorMoraJuros       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Mora_Dia_Str),',')),13); // Valor da Mora e Juros;

                             //*** Prepara o Detalhe ***

                             DT_Vecto_Duplicata := DT_Vecto_Duplicata[1]+DT_Vecto_Duplicata[2]+DT_Vecto_Duplicata[4]+DT_Vecto_Duplicata[5]+DT_Vecto_Duplicata[9]+DT_Vecto_Duplicata[10];

                             DT_Emissao_Docto   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                             DT_Emissao_Docto   := DT_Emissao_Docto[1]+DT_Emissao_Docto[2]+DT_Emissao_Docto[4]+DT_Emissao_Docto[5]+DT_Emissao_Docto[9]+DT_Emissao_Docto[10];

                             DT_Juros_Mora      := DateToStr((StrToDate(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text) + 1));
                             DT_Juros_Mora      := DT_Juros_Mora[1]+DT_Juros_Mora[2]+DT_Juros_Mora[4]+DT_Juros_Mora[5]+DT_Juros_Mora[9]+DT_Juros_Mora[10];

                             //*** Gera a Linha de Detalhe ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '100000 000000000000000090148000347442' + Gera_Zeros_Str(Trim(Numero_Nota),25) + '23700000' + Gera_Zeros_Str(Trim(B_NossoNumero),12) + '00000000002N           1  01' + Gera_Espacos(Trim(Nro_Duplicata),10) + Trim(DT_Vecto_Duplicata) + Gera_Zeros_Str(B_ValorDocumento,13) + '2371480001N' + Trim(DT_Emissao_Docto) + '0605' + Gera_Zeros_Str(B_ValorMoraJuros,13) + '000000000000000000000000000000000000000000000' + Trim(B_Sacado_TipoInscricao) + Gera_Zeros_Str(B_Sacado_NumeroCPFCGC,14) + Gera_Espacos(Copy(B_Sacado_Nome,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Rua,1,40),40) + '            ' + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,1,5)),5) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,6,3)),3) + Gera_Espacos(' ',60) + Gera_Zeros(Nro_Detalhe,6);
                             WriteLn(Arq_Remessa,Grava_Linha);
                          End;
                       End;

                       If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text) <> 'À VISTA') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text) <> '')) Then
                          Begin

                          Gera_Linha := False;

                          If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                             Begin
                             Gera_Linha := True;
                             End
                          Else
                             Begin
                             If ((Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_imp_2.Text) = 'S') And (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_cart_2.Text) = 'N')) Then
                                Begin
                                Gera_Linha := True;
                             End;
                          End;

                          If Gera_Linha Then
                             Begin

                             If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_obs.Text) <> '' Then
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_docto_2.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_vlr_2.Text;
                                End
                             Else
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text;
                             End;

                             //*** Reduz o Nro da Duplicata ao Tamanho Máximo ***

                             Nro_Duplicata := Copy(Nro_Duplicata,1,10);

                             //*** Prepara as Datas de Vencimento ***

                             DT_Vecto_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;
                             Forma_Duplicata    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_2.Text;

                             //*** Impressão do Boleto na Jato de Tinta ou Laser ***

                             //*** Dados da Empresa ***

                             B_Carteira := '09';

                             B_Cedente_Nome          := 'Ibrasmak NUTRICAO & FARMA LTD';
                             B_Cedente_TipoInscricao := '2';
                             B_Cedente_NumeroCPFCGC  := '30863575000107';

                             B_Cedente_CodigoCedente       := '34744';
                             B_Cedente_DigitoCodigoCedente := '2';

                             B_Cedente_ContaBancaria_Banco_Codigo  := Banco_Cliente;
                             B_Cedente_ContaBancaria_CodigoAgencia := '1480';
                             B_Cedente_ContaBancaria_DigitoAgencia := '0';
                             B_Cedente_ContaBancaria_NumeroConta   := '34744';
                             B_Cedente_ContaBancaria_DigitoConta   := '2';
                             B_Cedente_ContaBancaria_NomeCliente   := 'Ibrasmak Nutrição & Farma Ltda';

                             B_Cedente_Endereco_Rua         := 'Rua Gustavo da Silveira';
                             B_Cedente_Endereco_Numero      := '1357';
                             B_Cedente_Endereco_Complemento := 'Térreo';
                             B_Cedente_Endereco_Bairro      := 'Vila Santa Catarina';
                             B_Cedente_Endereco_Cidade      := 'São Paulo';
                             B_Cedente_Endereco_CEP         := '04376000';
                             B_Cedente_Endereco_Estado      := 'SP';
                             B_Cedente_Endereco_EMail       := 'Ibrasmak@Ibrasmak.com.br';

                             //*** Dados do Cliente para Pagamento ***

                             B_Sacado_Nome          := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text));

                             If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                                Begin
                                B_Sacado_TipoInscricao := '02';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                                End
                             Else
                                Begin
                                B_Sacado_TipoInscricao := '01';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                             End;

                             B_Sacado_Endereco_Rua          := Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' ' + ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
                             B_Sacado_Endereco_Bairro       := ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
                             B_Sacado_Endereco_Cidade       := ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
                             B_Sacado_Endereco_CEP          := Obtem_Antes(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-') + Obtem_Depois(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-');
                             B_Sacado_Endereco_Estado       := ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
                             B_Sacado_Endereco_EMail        := ConexaoBD.SQL_Clientesfb_cliente_email.Text;

                             B_DataProcessamento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Processamento
                             B_DataDocumento     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Emissão da Nota-Fiscal
                             B_DataVencimento    := DT_Vecto_Duplicata; // Data de Vencimento do Boleto
                             B_DataMoraJuros     := DateToStr((StrToDate(DT_Vecto_Duplicata) + 1)); // Data de Vencimento do Boleto + 1 Dia;
                             B_DataProtesto      := DateToStr((StrToDate(DT_Vecto_Duplicata) + 5)); // Data de Vencimento do Boleto + 5 Dias;

                             B_NossoNumero       := Gera_Zeros_Str(Trim(Numero_Nota),10) + '2' +  Calcula_Digito_Bradesco('09'+Gera_Zeros_Str(Trim(Numero_Nota),10)+'2',7,True); // Número da Nota + Parcela;
                             B_NumeroDocumento   := Nro_Duplicata; //Número do Documento;
                             B_SeuNumero         := Nro_Duplicata; //Número do Documento;

                             Vlr_Duplicata_Nro := StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str));
                             Mora_Dia_Nro      := (Vlr_Duplicata_Nro * 0.004);
                             Str(Mora_Dia_Nro:13:2,Mora_Dia_Str);

                             B_ValorDocumento       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Duplicata_Str),',')),13); // Valor a Ser Cobrado;
                             B_ValorMoraJuros       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Mora_Dia_Str),',')),13); // Valor da Mora e Juros;

                             //*** Prepara o Detalhe ***

                             DT_Vecto_Duplicata := DT_Vecto_Duplicata[1]+DT_Vecto_Duplicata[2]+DT_Vecto_Duplicata[4]+DT_Vecto_Duplicata[5]+DT_Vecto_Duplicata[9]+DT_Vecto_Duplicata[10];

                             DT_Emissao_Docto   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                             DT_Emissao_Docto   := DT_Emissao_Docto[1]+DT_Emissao_Docto[2]+DT_Emissao_Docto[4]+DT_Emissao_Docto[5]+DT_Emissao_Docto[9]+DT_Emissao_Docto[10];

                             DT_Juros_Mora      := DateToStr((StrToDate(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text) + 1));
                             DT_Juros_Mora      := DT_Juros_Mora[1]+DT_Juros_Mora[2]+DT_Juros_Mora[4]+DT_Juros_Mora[5]+DT_Juros_Mora[9]+DT_Juros_Mora[10];

                             //*** Gera a Linha de Detalhe ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '100000 000000000000000090148000347442' + Gera_Zeros_Str(Trim(Numero_Nota),25) + '23700000' + Gera_Zeros_Str(Trim(B_NossoNumero),12) + '00000000002N           1  01' + Gera_Espacos(Trim(Nro_Duplicata),10) + Trim(DT_Vecto_Duplicata) + Gera_Zeros_Str(B_ValorDocumento,13) + '2371480001N' + Trim(DT_Emissao_Docto) + '0605' + Gera_Zeros_Str(B_ValorMoraJuros,13) + '000000000000000000000000000000000000000000000' + Trim(B_Sacado_TipoInscricao) + Gera_Zeros_Str(B_Sacado_NumeroCPFCGC,14) + Gera_Espacos(Copy(B_Sacado_Nome,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Rua,1,40),40) + '            ' + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,1,5)),5) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,6,3)),3) + Gera_Espacos(' ',60) + Gera_Zeros(Nro_Detalhe,6);
                             WriteLn(Arq_Remessa,Grava_Linha);
                          End;
                       End;

                       If ((Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text) <> 'À VISTA') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text) <> '0') And (Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text) <> '')) Then
                          Begin

                          Gera_Linha := False;

                          If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                             Begin
                             Gera_Linha := True;
                             End
                          Else
                             Begin
                             If ((Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_imp_3.Text) = 'S') And (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_bol_avul_cart_3.Text) = 'N')) Then
                                Begin
                                Gera_Linha := True;
                             End;
                          End;

                          If Gera_Linha Then
                             Begin

                             If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_obs.Text) <> '' Then
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_docto_3.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_boleto_vlr_3.Text;
                                End
                             Else
                                Begin
                                Nro_Duplicata     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text;
                                Vlr_Duplicata_Str := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text;
                             End;

                             //*** Reduz o Nro da Duplicata ao Tamanho Máximo ***

                             Nro_Duplicata := Copy(Nro_Duplicata,1,10);

                             //*** Prepara as Datas de Vencimento ***

                             DT_Vecto_Duplicata := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;
                             Forma_Duplicata    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_forma_3.Text;

                             //*** Impressão do Boleto na Jato de Tinta ou Laser ***

                             //*** Dados da Empresa ***

                             B_Carteira := '09';

                             B_Cedente_Nome          := 'Ibrasmak NUTRICAO & FARMA LTD';
                             B_Cedente_TipoInscricao := '2';
                             B_Cedente_NumeroCPFCGC  := '30863575000107';

                             B_Cedente_CodigoCedente       := '34744';
                             B_Cedente_DigitoCodigoCedente := '2';

                             B_Cedente_ContaBancaria_Banco_Codigo  := Banco_Cliente;
                             B_Cedente_ContaBancaria_CodigoAgencia := '1480';
                             B_Cedente_ContaBancaria_DigitoAgencia := '0';
                             B_Cedente_ContaBancaria_NumeroConta   := '34744';
                             B_Cedente_ContaBancaria_DigitoConta   := '2';
                             B_Cedente_ContaBancaria_NomeCliente   := 'Ibrasmak Nutrição & Farma Ltda';

                             B_Cedente_Endereco_Rua         := 'Rua Gustavo da Silveira';
                             B_Cedente_Endereco_Numero      := '1357';
                             B_Cedente_Endereco_Complemento := 'Térreo';
                             B_Cedente_Endereco_Bairro      := 'Vila Santa Catarina';
                             B_Cedente_Endereco_Cidade      := 'São Paulo';
                             B_Cedente_Endereco_CEP         := '04376000';
                             B_Cedente_Endereco_Estado      := 'SP';
                             B_Cedente_Endereco_EMail       := 'Ibrasmak@Ibrasmak.com.br';

                             //*** Dados do Cliente para Pagamento ***

                             B_Sacado_Nome          := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_nome.Text));

                             If Trim(ConexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text) = 'PJ' Then
                                Begin
                                B_Sacado_TipoInscricao := '02';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                                End
                             Else
                                Begin
                                B_Sacado_TipoInscricao := '01';
                                B_Sacado_NumeroCPFCGC  := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                             End;

                             B_Sacado_Endereco_Rua          := Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text) + ' ' + ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
                             B_Sacado_Endereco_Bairro       := ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
                             B_Sacado_Endereco_Cidade       := ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
                             B_Sacado_Endereco_CEP          := Obtem_Antes(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-') + Obtem_Depois(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text,'-');
                             B_Sacado_Endereco_Estado       := ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
                             B_Sacado_Endereco_EMail        := ConexaoBD.SQL_Clientesfb_cliente_email.Text;

                             B_DataProcessamento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Processamento
                             B_DataDocumento     := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text; // Data de Emissão da Nota-Fiscal
                             B_DataVencimento    := DT_Vecto_Duplicata; // Data de Vencimento do Boleto
                             B_DataMoraJuros     := DateToStr((StrToDate(DT_Vecto_Duplicata) + 1)); // Data de Vencimento do Boleto + 1 Dia;
                             B_DataProtesto      := DateToStr((StrToDate(DT_Vecto_Duplicata) + 5)); // Data de Vencimento do Boleto + 5 Dias;

                             B_NossoNumero       := Gera_Zeros_Str(Trim(Numero_Nota),10) + '3' +  Calcula_Digito_Bradesco('09'+Gera_Zeros_Str(Trim(Numero_Nota),10)+'3',7,True); // Número da Nota + Parcela;
                             B_NumeroDocumento   := Nro_Duplicata; //Número do Documento;
                             B_SeuNumero         := Nro_Duplicata; //Número do Documento;

                             Vlr_Duplicata_Nro := StrToFloat(Ponto_Virgula(Vlr_Duplicata_Str));
                             Mora_Dia_Nro      := (Vlr_Duplicata_Nro * 0.004);
                             Str(Mora_Dia_Nro:13:2,Mora_Dia_Str);

                             B_ValorDocumento       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Duplicata_Str),',')),13); // Valor a Ser Cobrado;
                             B_ValorMoraJuros       := Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Mora_Dia_Str),',')),13); // Valor da Mora e Juros;

                             //*** Prepara o Detalhe ***

                             DT_Vecto_Duplicata := DT_Vecto_Duplicata[1]+DT_Vecto_Duplicata[2]+DT_Vecto_Duplicata[4]+DT_Vecto_Duplicata[5]+DT_Vecto_Duplicata[9]+DT_Vecto_Duplicata[10];

                             DT_Emissao_Docto   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                             DT_Emissao_Docto   := DT_Emissao_Docto[1]+DT_Emissao_Docto[2]+DT_Emissao_Docto[4]+DT_Emissao_Docto[5]+DT_Emissao_Docto[9]+DT_Emissao_Docto[10];

                             DT_Juros_Mora      := DateToStr((StrToDate(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text) + 1));
                             DT_Juros_Mora      := DT_Juros_Mora[1]+DT_Juros_Mora[2]+DT_Juros_Mora[4]+DT_Juros_Mora[5]+DT_Juros_Mora[9]+DT_Juros_Mora[10];

                             //*** Gera a Linha de Detalhe ***

                             Nro_Detalhe         := Nro_Detalhe + 1;
                             Qtde_Registros_Lote := Qtde_Registros_Lote + 1;

                             Grava_Linha := '100000 000000000000000090148000347442' + Gera_Zeros_Str(Trim(Numero_Nota),25) + '23700000' + Gera_Zeros_Str(Trim(B_NossoNumero),12) + '00000000002N           1  01' + Gera_Espacos(Trim(Nro_Duplicata),10) + Trim(DT_Vecto_Duplicata) + Gera_Zeros_Str(B_ValorDocumento,13) + '2371480001N' + Trim(DT_Emissao_Docto) + '0605' + Gera_Zeros_Str(B_ValorMoraJuros,13) + '000000000000000000000000000000000000000000000' + Trim(B_Sacado_TipoInscricao) + Gera_Zeros_Str(B_Sacado_NumeroCPFCGC,14) + Gera_Espacos(Copy(B_Sacado_Nome,1,40),40) + Gera_Espacos(Copy(B_Sacado_Endereco_Rua,1,40),40) + '            ' + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,1,5)),5) + Gera_Zeros(StrToInt(Copy(B_Sacado_Endereco_CEP,6,3)),3) + Gera_Espacos(' ',60) + Gera_Zeros(Nro_Detalhe,6);
                             WriteLn(Arq_Remessa,Grava_Linha);
                          End;
                       End;

                    End;

                    ConexaoBD.SQL_Clientes.Close;

                 End;

              End;

              conexaoBD.SQL_FB_Nota_Fiscal.Next;
        End;

        //*** Gera o Trailer do Lote ***

        Grava_Linha := '9' + Gera_Espacos(' ',393) + Gera_Zeros(Qtde_Registros_Lote,6);
        WriteLn(Arq_Remessa,Grava_Linha);

        //*** Finaliza a Gravação do Arquivo ***

        CloseFile(Arq_Remessa);

        //***
        //***
        //***
        //*** Finalização do Processo ***
        //***
        //***
        //***

        Seta();

        MSG_Erro('Geração do Arquivo de Remessa Finalizada.');

        ArquivoRemessa00.Close;
        End
     Else
        Begin
        MSG_Erro('Nenhuma Nota Fiscal foi encontrada com a numeração informada');
     End;
end;

procedure TArquivoRemessa00.Nota_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TArquivoRemessa00.Nota_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TArquivoRemessa00.BT_SairClick(Sender: TObject);
begin
     ArquivoRemessa00.Close;
end;

procedure TArquivoRemessa00.BT_GerarClick(Sender: TObject);
begin
     If Valida_Dados() Then
        Begin
        Gera_Remessa();
     End;
end;

procedure TArquivoRemessa00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

end.
