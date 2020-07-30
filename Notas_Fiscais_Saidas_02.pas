unit Notas_Fiscais_Saidas_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DBCtrls, Buttons, ExtCtrls, ImpMat,
  ComCtrls;

type
  TNotasFiscaisSaidas02 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    SGD_Produtos: TStringGrid;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label28: TLabel;
    Label35: TLabel;
    Label29: TLabel;
    Label34: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label44: TLabel;
    Cliente_Endereco: TEdit;
    Cliente_Complemento: TEdit;
    Cliente_Bairro: TEdit;
    Cliente_Cidade: TEdit;
    Cliente_Estado: TComboBox;
    Cliente_Cep: TMaskEdit;
    Cliente_Pais: TComboBox;
    Cliente_Nome: TEdit;
    Cliente_Contato: TEdit;
    Cliente_DDD: TEdit;
    Cliente_Fone_Ramal: TEdit;
    Cliente_Fone_Comercial: TEdit;
    Cliente_Fone_Residencial: TEdit;
    Cliente_Fone_Celular: TEdit;
    Cliente_Fone_Fax: TEdit;
    Cliente_Email: TEdit;
    BT_Imprimir: TBitBtn;
    Label12: TLabel;
    Nro_Pedido: TEdit;
    Imprimir: TImpMat;
    Nro_Natureza_Operacao: TEdit;
    Cliente_Endereco_Cobranca: TEdit;
    Cliente_Complemento_Cobranca: TEdit;
    Cliente_Bairro_Cobranca: TEdit;
    Cliente_Cidade_Cobranca: TEdit;
    Cliente_Estado_Cobranca: TEdit;
    Cliente_Cep_Cobranca: TEdit;
    Cliente_Pais_Cobranca: TEdit;
    Nro_Tipo_Tabela: TEdit;
    Nro_Transportadora: TEdit;
    Nro_Pgto_Frete: TEdit;
    Cliente_Codigo: TEdit;
    Cliente_Codigo_Tipo: TEdit;
    Cliente_Tipo_Pessoa: TEdit;
    Cliente_Inscricao_Estadual: TEdit;
    Codigo_Transportadora: TEdit;
    ETP_Resultado: TEdit;
    ETP_Data_Emissao_Nota: TEdit;
    ETP_Numero_Nota: TEdit;
    Cliente_Vendedor: TEdit;
    Cliente_Banco: TEdit;
    Label4: TLabel;
    Data_Entrega: TMaskEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Valor_Desconto: TEdit;
    Valor_Total: TEdit;
    Valor_Pedido: TEdit;
    Valor_Frete: TEdit;
    Valor_IPI: TEdit;
    Label24: TLabel;
    Qtde_Volume: TEdit;
    Label25: TLabel;
    Especie: TEdit;
    Label26: TLabel;
    Marca: TEdit;
    Label27: TLabel;
    Peso_Bruto: TEdit;
    Label36: TLabel;
    Peso_Liquido: TEdit;
    Nro_Pedido_Vendas: TEdit;
    Nota_Consumo: TCheckBox;
    Cliente_Suframa: TEdit;
    Nro_Pedido_Faturado: TEdit;
    Zera_Base_ICMS: TCheckBox;
    Nota_Revenda: TCheckBox;
    Nota_Dados_Complementares: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox7: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label1: TLabel;
    Label39: TLabel;
    Cliente_Tipo_Transporte: TComboBox;
    Cliente_Transportadora: TComboBox;
    Cliente_Tipo_Faturamento: TComboBox;
    Cliente_Emite_Lote: TComboBox;
    Cliente_Pgto_Frete: TComboBox;
    Natureza_Operacao: TComboBox;
    Cliente_Ordem_Compra: TEdit;
    Cliente_Alimentacao: TEdit;
    TabSheet2: TTabSheet;
    Label23: TLabel;
    Label2: TLabel;
    Financiamento_BNDS: TCheckBox;
    Financiamento_Leasing: TCheckBox;
    Financiamento_Monibras: TCheckBox;
    Financiamento_Proger: TCheckBox;
    Pagamento_Vista: TRadioButton;
    Pagamento_Parcelado: TRadioButton;
    Pagamento_Combinar: TRadioButton;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label22: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Parcela_Nro: TEdit;
    Parcela_Vencto: TEdit;
    Parcela_Dias_Vencto: TEdit;
    Parcela_Mes_Subsequente: TCheckBox;
    Parcela_Pedido: TRadioButton;
    Parcela_Faturamento: TRadioButton;
    GroupBox6: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Parcela_Porcentagem_Ato: TEdit;
    Parcela_Vlr_Ato: TEdit;
    Parcela_Prazo_Inicio: TEdit;
    TabSheet3: TTabSheet;
    Label46: TLabel;
    Label47: TLabel;
    Observacao_Nota: TMemo;
    Cliente_Observacao: TMemo;
    TabSheet4: TTabSheet;
    Label48: TLabel;
    Observacao_Fabrica: TMemo;
    Observacao_Corpo_Nota: TCheckBox;
    Label21: TLabel;
    Cliente_Desconto: TEdit;
    Label51: TLabel;
    ComboBox1: TComboBox;
    Label53: TLabel;
    ComboBox2: TComboBox;
    Label52: TLabel;
    Opcao_Natureza_Operacao: TComboBox;
    Label37: TLabel;
    Cliente_Natureza_Operacao: TEdit;
    Label38: TLabel;
    Cliente_CFOP: TEdit;
    Cliente_CFOP_2: TEdit;
    Label54: TLabel;
    Label55: TLabel;
    Cliente_Aliquota_ICMS: TEdit;
    Label56: TLabel;
    Cliente_Base_Reduzida: TEdit;
    Label57: TLabel;
    ComboBox4: TComboBox;
    Cliente_Solicitado: TEdit;
    Label58: TLabel;
    Pedido_Data_Inclusao: TMaskEdit;
    Label59: TLabel;
    Observacao_Faturamento: TMemo;
    DBG_NF_FB_Faturados_Produto_Descricao_Detalhada: TDBMemo;
    Parcela_Descricao: TEdit;
    Empresa: TEdit;
    Total_NF_IPI: TCheckBox;
    Imprimir_Tela: TCheckBox;
    DBG_Observacao_Nota: TDBMemo;
    Registra_OS: TCheckBox;
    Tipo_Nota_Emissao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SGD_ProdutosDblClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure SGD_ProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure Natureza_OperacaoChange(Sender: TObject);
    procedure Cliente_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Tipo_TransporteKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Pgto_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure Natureza_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_CFOPKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Natureza_OperacaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Aliquota_ICMSKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Tipo_FaturamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_TransportadoraKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Emite_LoteKeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_VolumeKeyPress(Sender: TObject; var Key: Char);
    procedure EspecieKeyPress(Sender: TObject; var Key: Char);
    procedure MarcaKeyPress(Sender: TObject; var Key: Char);
    procedure Peso_BrutoKeyPress(Sender: TObject; var Key: Char);
    procedure Peso_LiquidoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Base_ReduzidaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Opcao_Natureza_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_CFOP_2KeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_AlimentacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_SolicitadoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Ordem_CompraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcao_Natureza_OperacaoChange(Sender: TObject);
    procedure Imprimir_TelaClick(Sender: TObject);
    procedure Cliente_DescontoExit(Sender: TObject);
  private
    { Private declarations }
    function ConversaoRecursiva(N: LongWord): string;
    function Extenso(parmNumero: Real): string;
    function Letra_Maiuscula(Texto: String): string;
    function Prepara_Volume(Posicao_Inicial, Posicao_Final: Integer): string;

    procedure Carrega_Transportadoras();
    procedure Carrega_Pgto_Frete();
    procedure Exibe_Grid_Produtos();

    procedure Imprime_Nota();
    procedure Imprime_Nota_Monibras(Posicao_Inicial, Posicao_Final: Integer);
    procedure Grava_Nota_Monibras(Posicao_Inicial, Posicao_Final: Integer);

    procedure Imprime_OS();
    procedure Imprime_OS_Monibras(Posicao_Inicial, Posicao_Final: Integer);
    procedure Grava_OS_Monibras(Posicao_Inicial, Posicao_Final: Integer);

    procedure Prepara_Condicao();
    procedure Altera_Faturado();

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
  NotasFiscaisSaidas02: TNotasFiscaisSaidas02;

  Cliente_Condicao_Pgto_1, Cliente_Condicao_Pgto_2, Cliente_Condicao_Pgto_3, Cliente_Condicao_Pgto_4, Cliente_Condicao_Pgto_5,
  Cliente_Condicao_Pgto_6, Cliente_Condicao_Pgto_7, Cliente_Condicao_Pgto_8, Cliente_Condicao_Pgto_9, Cliente_Condicao_Pgto_10,
  Cliente_Condicao_Pgto_11, Cliente_Condicao_Pgto_12, Cliente_Condicao_Pgto_13, Cliente_Condicao_Pgto_14, Cliente_Condicao_Pgto_15,
  Cliente_Condicao_Pgto_16, Cliente_Condicao_Pgto_17, Cliente_Condicao_Pgto_18, Cliente_Condicao_Pgto_19, Cliente_Condicao_Pgto_20,
  Cliente_Condicao_Pgto_21, Cliente_Condicao_Pgto_22, Cliente_Condicao_Pgto_23, Cliente_Condicao_Pgto_24: String;

  Nro_Nota_Desd_1, Nro_Nota_Desd_2, Nro_Nota_Desd_3, Nro_Nota_Desd_4, Nro_Nota_Desd_5, Nro_Nota_Desd_6, Nro_Nota_Desd_7,
  Nro_Nota_Desd_8, Nro_Nota_Desd_9, Nro_Nota_Desd_10, Nro_Nota_Desd_11, Nro_Nota_Desd_12, Nro_Nota_Desd_13, Nro_Nota_Desd_14,
  Nro_Nota_Desd_15, Nro_Nota_Desd_16, Nro_Nota_Desd_17, Nro_Nota_Desd_18, Nro_Nota_Desd_19, Nro_Nota_Desd_20, Nro_Nota_Desd_21,
  Nro_Nota_Desd_22, Nro_Nota_Desd_23, Nro_Nota_Desd_24: String;

  Forma_Desd_1, Forma_Desd_2, Forma_Desd_3, Forma_Desd_4, Forma_Desd_5, Forma_Desd_6, Forma_Desd_7, Forma_Desd_8, Forma_Desd_9,
  Forma_Desd_10, Forma_Desd_11, Forma_Desd_12, Forma_Desd_13, Forma_Desd_14, Forma_Desd_15, Forma_Desd_16, Forma_Desd_17,
  Forma_Desd_18, Forma_Desd_19, Forma_Desd_20, Forma_Desd_21, Forma_Desd_22, Forma_Desd_23, Forma_Desd_24: String;

  Dt_Vcto_Desd_1, Dt_Vcto_Desd_2, Dt_Vcto_Desd_3, Dt_Vcto_Desd_4, Dt_Vcto_Desd_5, Dt_Vcto_Desd_6, Dt_Vcto_Desd_7, Dt_Vcto_Desd_8,
  Dt_Vcto_Desd_9, Dt_Vcto_Desd_10, Dt_Vcto_Desd_11, Dt_Vcto_Desd_12, Dt_Vcto_Desd_13, Dt_Vcto_Desd_14, Dt_Vcto_Desd_15, Dt_Vcto_Desd_16,
  Dt_Vcto_Desd_17, Dt_Vcto_Desd_18, Dt_Vcto_Desd_19, Dt_Vcto_Desd_20, Dt_Vcto_Desd_21, Dt_Vcto_Desd_22, Dt_Vcto_Desd_23, Dt_Vcto_Desd_24: String;

  Vlr_Desd_1, Vlr_Desd_2, Vlr_Desd_3, Vlr_Desd_4, Vlr_Desd_5, Vlr_Desd_6, Vlr_Desd_7, Vlr_Desd_8, Vlr_Desd_9, Vlr_Desd_10, Vlr_Desd_11,
  Vlr_Desd_12, Vlr_Desd_13, Vlr_Desd_14, Vlr_Desd_15, Vlr_Desd_16, Vlr_Desd_17, Vlr_Desd_18, Vlr_Desd_19, Vlr_Desd_20, Vlr_Desd_21,
  Vlr_Desd_22, Vlr_Desd_23, Vlr_Desd_24: Real;

  Vlr_Str_Desd_1, Vlr_Str_Desd_2, Vlr_Str_Desd_3, Vlr_Str_Desd_4, Vlr_Str_Desd_5, Vlr_Str_Desd_6, Vlr_Str_Desd_7, Vlr_Str_Desd_8,
  Vlr_Str_Desd_9, Vlr_Str_Desd_10, Vlr_Str_Desd_11, Vlr_Str_Desd_12, Vlr_Str_Desd_13, Vlr_Str_Desd_14, Vlr_Str_Desd_15, Vlr_Str_Desd_16,
  Vlr_Str_Desd_17, Vlr_Str_Desd_18, Vlr_Str_Desd_19, Vlr_Str_Desd_20, Vlr_Str_Desd_21, Vlr_Str_Desd_22, Vlr_Str_Desd_23, Vlr_Str_Desd_24: String;

  Dia_Parcela_1, Dia_Parcela_2, Dia_Parcela_3, Dia_Parcela_4, Dia_Parcela_5, Dia_Parcela_6, Dia_Parcela_7, Dia_Parcela_8,
  Dia_Parcela_9, Dia_Parcela_10, Dia_Parcela_11, Dia_Parcela_12, Dia_Parcela_13, Dia_Parcela_14, Dia_Parcela_15, Dia_Parcela_16,
  Dia_Parcela_17, Dia_Parcela_18, Dia_Parcela_19, Dia_Parcela_20, Dia_Parcela_21, Dia_Parcela_22, Dia_Parcela_23, Dia_Parcela_24: String;

  Volume: String;
  Total_Nota_Str, Total_Desconto_Str, Total_Desconto_Str_Ant, Vlr_Total_Produtos_Str, Vlr_Total_Produtos_Substituicao_Str, Vlr_Frete_Str, Vlr_Frete_Produto_Str, Vlr_IPI_Str, Vlr_Desconto_Str, Porcentagem_Desconto_Str: String;
  Total_Nota, Total_Desconto, Vlr_Total_Produtos, Vlr_Total_Produtos_Substituicao, Vlr_Frete, Vlr_Frete_Produto, Vlr_IPI, Vlr_Desconto, Porcentagem_Desconto: Real;
  Vlr_Str_ICMS, Vlr_ICMS_Str: String;
  Nro_Nota: Integer;
  CX_1, CX_2, CX_3, CX_Peq, CX_48, CX_100, CX_Exp: Integer;

  BC_ICMS_Str: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Adiciona_Lote_Produto, MSG_NF_Etapa_01_2,
  MSG_NF_Etapa_02_2, MSG_NF_Etapa_04_2, Ibrasmak_00,
  Codigo_Produto_Nota_Cliente_00, Notas_Fiscais_Saidas_03,
  Notas_Fiscais_Saidas_04, Adiciona_Qtde_Produto;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TNotasFiscaisSaidas02.ConversaoRecursiva(N: LongWord): string;
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

function TNotasFiscaisSaidas02.Extenso(parmNumero: Real): string;
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

function TNotasFiscaisSaidas02.Letra_Maiuscula(Texto: String): string;

var
   Ind: Integer;
   Resultado: String;

begin
     Texto     := UpperCase(Texto);
     Texto     := Trim(Texto);
     Resultado := ' ';

     For Ind := 1 To Length(Texto) Do
         Begin
         If Texto[Ind] = 'á' Then
            Begin
            Resultado := Resultado + 'Á';
            End
         Else If Texto[Ind] = 'á' Then
            Begin
            Resultado := Resultado + 'Á';
            End
         Else If Texto[Ind] = 'à' Then
            Begin
            Resultado := Resultado + 'À';
            End
         Else If Texto[Ind] = 'â' Then
            Begin
            Resultado := Resultado + 'Â';
            End
         Else If Texto[Ind] = 'ã' Then
            Begin
            Resultado := Resultado + 'Ã';
            End
         Else If Texto[Ind] = 'ä' Then
            Begin
            Resultado := Resultado + 'Ä';
            End
         Else If Texto[Ind] = 'é' Then
            Begin
            Resultado := Resultado + 'É';
            End
         Else If Texto[Ind] = 'è' Then
            Begin
            Resultado := Resultado + 'È';
            End
         Else If Texto[Ind] = 'ê' Then
            Begin
            Resultado := Resultado + 'Ê';
            End
         Else If Texto[Ind] = 'ë' Then
            Begin
            Resultado := Resultado + 'Ë';
            End
         Else If Texto[Ind] = 'í' Then
            Begin
            Resultado := Resultado + 'Í';
            End
         Else If Texto[Ind] = 'ì' Then
            Begin
            Resultado := Resultado + 'Ì';
            End
         Else If Texto[Ind] = 'î' Then
            Begin
            Resultado := Resultado + 'Î';
            End
         Else If Texto[Ind] = 'ï' Then
            Begin
            Resultado := Resultado + 'Ï';
            End
         Else If Texto[Ind] = 'ó' Then
            Begin
            Resultado := Resultado + 'Ó';
            End
         Else If Texto[Ind] = 'ò' Then
            Begin
            Resultado := Resultado + 'Ò';
            End
         Else If Texto[Ind] = 'õ' Then
            Begin
            Resultado := Resultado + 'Õ';
            End
         Else If Texto[Ind] = 'ô' Then
            Begin
            Resultado := Resultado + 'Ô';
            End
         Else If Texto[Ind] = 'ö' Then
            Begin
            Resultado := Resultado + 'Ö';
            End
         Else If Texto[Ind] = 'ú' Then
            Begin
            Resultado := Resultado + 'Ú';
            End
         Else If Texto[Ind] = 'ù' Then
            Begin
            Resultado := Resultado + 'Ù';
            End
         Else If Texto[Ind] = 'û' Then
            Begin
            Resultado := Resultado + 'Û';
            End
         Else If Texto[Ind] = 'ü' Then
            Begin
            Resultado := Resultado + 'Ü';
            End
         Else If Texto[Ind] = 'ç' Then
            Begin
            Resultado := Resultado + 'Ç';
            End
         Else
            Begin
            Resultado := Resultado + Texto[Ind];
         End;
     End;

     Letra_Maiuscula := Trim(Resultado);
end;

function TNotasFiscaisSaidas02.Prepara_Volume(Posicao_Inicial, Posicao_Final: Integer): string;

var
   Ind, Erro: Integer;
   Cod_Produto, Qtde_Str: String;
   Qtde_Nro: Integer;
   Volume_Prod, Volume_Total: Real;

begin

//*****************************************
//*  Rotina para o Cálculo do Volume      *
//*                                       *
//*  Caixa com 100 Cáps. - Volume: 427,50 *
//*  Caixa com 40 Cáps.  - Volume: 213,75 *
//*  Caixa Ecomer        - Volume: 260,00 *
//*  Lata                - Volume: 593,75 *
//*****************************************

//********************************************************
//*  Cálculo das Embalagens                              *
//*  Modelo           Volume   Qtde   Qtde  Qtde  Ecomer *
//*                            Cx100  Cx40  Latas        *
//*  Caixa 1          1187,50  3      6     2     4      *
//*  Caixa 2          3562,50  6      13    6     9      *
//*  Caixa 3          7125,00  12     29    12    19     *
//*  Caixa Pequena    14250,00 24     58    24    39     *
//*  Caixa 48         28500,00 54     114   48    88     *
//*  Caixa 100        42750,00 100    200   72    164    *
//*  Caixa Exportação 57000,00 108    228   96    177    *
//********************************************************

     Volume_Prod  := 0;
     Volume_Total := 0;

     For Ind := Posicao_Inicial To Posicao_Final Do
         Begin
         Cod_Produto := Trim(SGD_Produtos.Cells[2,Ind]);

         Qtde_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[1,Ind]));
         Val(Qtde_Str,Qtde_Nro,Erro);

         Volume_Prod := 0;

         ConexaoBD.SQL_FB_Produtos.Close;
         ConexaoBD.SQL_FB_Produtos.SQL.Clear;
         ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' +#39+ Trim(Cod_Produto) + #39);
         ConexaoBD.SQL_FB_Produtos.Open;

         Volume_Prod := 0;

         Volume_Prod  := (Volume_Prod * Qtde_Nro);
         Volume_Total := Volume_Total + Volume_Prod;
     End;

     CX_1   := 0;
     CX_2   := 0;
     CX_3   := 0;
     CX_Peq := 0;
     CX_48  := 0;
     CX_100 := 0;
     CX_Exp := 0;

     While Volume_Total > 0 Do
           Begin
           If (Volume_Total > 0.00) And (Volume_Total <= 1187.50) Then
              Begin
              CX_1   := CX_1 + 1;
              Volume_Total := 0;
              End

           Else If (Volume_Total >= 1187.51) And (Volume_Total <= 3562.50) Then
              Begin
              CX_2   := CX_2 + 1;
              Volume_Total := 0;
              End

           Else If (Volume_Total >= 3562.51) And (Volume_Total <= 7125.00) Then
              Begin
              CX_3   := CX_3 + 1;
              Volume_Total := 0;
              End

           Else If (Volume_Total >= 7125.01) And (Volume_Total <= 14250.00) Then
              Begin
              CX_Peq := CX_Peq + 1;
              Volume_Total := 0;
              End

           Else If (Volume_Total >= 14250.01) And (Volume_Total <= 28500.00) Then
              Begin
              CX_48  := CX_48 + 1;
              Volume_Total := 0;
              End

           Else If (Volume_Total >= 28500.01) Then
              Begin
              CX_100 := CX_100 + 1;
              Volume_Total := Volume_Total - 42750;
           End;

           //Else If (Volume_Total >= 42750.01) Then
           //   Begin
           //   CX_Exp := CX_Exp + 1;
           //   Volume_Total := Volume_Total - 57000;
           //End;
     End;

     Qtde_Nro := CX_1 + CX_2 + CX_3 + CX_Peq + CX_48 + CX_100 + CX_Exp;

     Prepara_Volume := IntToStr(Qtde_Nro);
end;

//******************
//*** Procedures ***
//******************

procedure TNotasFiscaisSaidas02.Carrega_Transportadoras();
begin
     Ampulheta();

     // Obtem as Transportadoras

     ConexaoBD.SQL_Transportadoras.Close;
     ConexaoBD.SQL_Transportadoras.SQL.Clear;
     ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Order By fb_transportadora_nome');
     ConexaoBD.SQL_Transportadoras.Open;

     Cliente_Transportadora.Items.Clear;

     If conexaoBD.SQL_Transportadoras.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Transportadoras.First;

        While Not conexaoBD.SQL_Transportadoras.Eof Do
              begin
              Cliente_Transportadora.Items.Add(IntToStr(conexaoBD.SQL_Transportadorasfb_transportadora_numero.AsInteger)+' - '+conexaoBD.SQL_Transportadorasfb_transportadora_nome.AsString);
              conexaoBD.SQL_Transportadoras.Next;
        End;
     end;

     ConexaoBD.SQL_Transportadoras.Close;

     Cliente_Transportadora.ItemIndex := StrToInt(Nro_Transportadora.Text);

     Seta();
end;

procedure TNotasFiscaisSaidas02.Carrega_Pgto_Frete();
begin
     Cliente_Pgto_Frete.Items.Clear;
     Cliente_Pgto_Frete.Items.Add('Cliente');
     Cliente_Pgto_Frete.Items.Add('Monibras');

     Cliente_Pgto_Frete.ItemIndex := StrToInt(Nro_Pgto_Frete.Text);
end;

procedure TNotasFiscaisSaidas02.Exibe_Grid_Produtos();

var
    Ind, Erro: Integer;
    Vlr_Numero, Peso: Real;
    Vlr_Exibicao, Peso_Str: String;

begin
    Ampulheta();

    //*** Carrega as Demais Opções ***

    Natureza_Operacao.ItemIndex := StrToInt(Nro_Natureza_Operacao.Text);
    Cliente_Natureza_Operacao.Text := Natureza_Operacao.Text;

    Carrega_Transportadoras();
    Carrega_Pgto_Frete();

    //*** Prepara a Exibição dos Produtos para Compra ***

    //*** Zera Grid ***

    For Ind := 0 To SGD_Produtos.RowCount Do
        Begin
        SGD_Produtos.Cells[0,Ind] := '';
        SGD_Produtos.Cells[1,Ind] := '';
        SGD_Produtos.Cells[2,Ind] := '';
        SGD_Produtos.Cells[3,Ind] := '';
        SGD_Produtos.Cells[4,Ind] := '';
        SGD_Produtos.Cells[5,Ind] := '';
        SGD_Produtos.Cells[6,Ind] := '';
        SGD_Produtos.Cells[7,Ind] := '';
        SGD_Produtos.Cells[8,Ind] := '';
        SGD_Produtos.Cells[9,Ind] := '';
        SGD_Produtos.Cells[10,Ind] := '';
    End;

    //*** Continua o Carregamento Normal ***

    ConexaoBD.SQL_NF_FB_Faturados_Produtos.Close;
    ConexaoBD.SQL_NF_FB_Faturados_Produtos.SQL.Clear;
    ConexaoBD.SQL_NF_FB_Faturados_Produtos.SQL.Add('Select * from faturados_produtos Where faturado_produto_numero_faturado = ' + Trim(Nro_Pedido_Faturado.Text) + ' Order By faturado_produto_posicao');
    ConexaoBD.SQL_NF_FB_Faturados_Produtos.Open;

    If ConexaoBD.SQL_NF_FB_Faturados_Produtos.RecordCount > 0 Then
      Begin
      SGD_Produtos.RowCount  := 2;
      SGD_Produtos.Refresh;

      SGD_Produtos.RowCount  := (ConexaoBD.SQL_NF_FB_Faturados_Produtos.RecordCount + 1);
      SGD_Produtos.FixedRows := 1;
      Ind := 0;

      ConexaoBD.SQL_NF_FB_Faturados_Produtos.First;

      Peso := 0;

      While Not ConexaoBD.SQL_NF_FB_Faturados_Produtos.Eof Do
        Begin
        Ind := Ind + 1;

        SGD_Produtos.Cells[1,Ind] := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_quantidade.Text;
        SGD_Produtos.Cells[2,Ind] := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_codigo.Text;
        SGD_Produtos.Cells[3,Ind] := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_referencia.Text;
        SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_descricao.Text;
        SGD_Produtos.Cells[5,Ind] := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_lote.Text;

        //*** Busca o Peso do Produto ***

        ConexaoBD.SQL_Produtos.Close;
        ConexaoBD.SQL_Produtos.SQL.Clear;
        ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' +#39+ Trim(ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_codigo.Text) + #39);
        ConexaoBD.SQL_Produtos.Open;

        If Ind <= 18 Then
          Begin
          Peso  := Peso + ((StrToFloat(Ponto_Virgula(ConexaoBD.SQL_Produtosfb_produto_peso.Text))) * (StrToFloat(Ponto_Virgula(ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_quantidade.Text)) ));
        End;

        //*** Retorna ao Carregamento Normal ***

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_valor_unitario.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        SGD_Produtos.Cells[6,Ind] := Vlr_Exibicao;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_valor_total.Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        SGD_Produtos.Cells[7,Ind] := Vlr_Exibicao;

        SGD_Produtos.Cells[8,Ind]  := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_valor_ipi.Text;
        SGD_Produtos.Cells[9,Ind]  := ConexaoBD.SQL_NF_FB_Faturados_Produtosfaturado_produto_posicao.Text;
        SGD_Produtos.Cells[10,Ind] := DBG_NF_FB_Faturados_Produto_Descricao_Detalhada.Text;

        ConexaoBD.SQL_NF_FB_Faturados_Produtos.Next;
      End;

      If (Trim(Peso_Bruto.Text) = '') Or (Trim(Peso_Bruto.Text) = '0')  Then
         Begin
         Str((Peso + ((Peso * 1.5) / 100)):13:3,Peso_Str);
         Peso_Bruto.Text := Trim(Peso_Str);
      End;

      If (Trim(Peso_liquido.Text) = '') Or (Trim(Peso_liquido.Text) = '0')  Then
         Begin
         Str(Peso:13:3,Peso_Str);
         Peso_liquido.Text := Trim(Peso_Str);
      End;

      End
    Else
      Begin
      SGD_Produtos.RowCount  := 2;
      SGD_Produtos.FixedRows := 1;
    End;

    //*** Preparação do StringGrid ***

    //*** Cod. do Cliene ***
    SGD_Produtos.Cells[0,0]   := 'Cod.Cliente';
    SGD_Produtos.ColWidths[0] := 60;

    //*** Quantidade ***
    SGD_Produtos.Cells[1,0]   := 'Quantidade';
    SGD_Produtos.ColWidths[1] := 60;

    //*** Código do Produto ***
    SGD_Produtos.Cells[2,0]   := 'Cód.Produto';
    SGD_Produtos.ColWidths[2] := 64;

    //*** Referência ***
    SGD_Produtos.Cells[3,0]   := 'Referência';
    SGD_Produtos.ColWidths[3] := 64;

    //*** Descrição do Produto ***
    SGD_Produtos.Cells[4,0]   := 'Descrição';
    SGD_Produtos.ColWidths[4] := 190;

    //*** Lote do Produto ***
    SGD_Produtos.Cells[5,0]   := 'Lote';
    SGD_Produtos.ColWidths[5] := 80;

    //*** Valor Unitário ***
    SGD_Produtos.Cells[6,0]   := 'Vlr.Unitário (R$)';
    SGD_Produtos.ColWidths[6] := 80;

    //*** Valor Total ***
    SGD_Produtos.Cells[7,0]   := 'Vlr.Total (R$)';
    SGD_Produtos.ColWidths[7] := 80;

    //*** Vlr do IPI ***
    SGD_Produtos.Cells[8,0]   := 'Vlr.IPI';
    SGD_Produtos.ColWidths[8] := 0;

    //*** Posicao do Produto ***
    SGD_Produtos.Cells[9,0]   := 'Posição';
    SGD_Produtos.ColWidths[9] := 0;

    //*** Descrição Detalhada ***
    SGD_Produtos.Cells[10,0]   := 'Descrição Detalhada';
    SGD_Produtos.ColWidths[10] := -1;

    Seta();
end;

procedure TNotasFiscaisSaidas02.Imprime_Nota();

var
   Impressora: TextFile;
   Ind_Produto, Conta_Produto, Posicao_Inicial, Posicao_Final, Conta_Boleto, Nro_Nota_Boleto_INI, Nro_Nota_Boleto_FIM, Posicao_Nota_Boleto: Integer;
   Boleto_Obs, Boleto_Docto_1, Boleto_Docto_2, Boleto_Docto_3, Boleto_Docto_4, Comando_SQL: String;
   Vlr_Nota_Boleto_1, Vlr_Nota_Boleto_2, Vlr_Nota_Boleto_3, Vlr_Nota_Boleto_4: Real;
   Primeira_Nota: Boolean;

begin
     //*** Posiciona a Nota Fiscal ***

     Primeira_Nota := True;

     If ((Imprimir_Tela.Checked = False) And (Registra_OS.Checked = False)) Then
        Begin
        AssignFile(Impressora,'LPT1');
        Rewrite(Impressora);
        Write(Impressora,#15 + '*' + #8);
        CloseFile(Impressora);

        While Confirma('A Posição está Correta ?') <> 6 Do
              Begin
              AssignFile(Impressora,'LPT1');
              Rewrite(Impressora);
              Write(Impressora,#15 + '*' + #8);
              CloseFile(Impressora);
        End;

        AssignFile(Impressora,'LPT1');
        Rewrite(Impressora);
        Write(Impressora,#15 + '*' + #8);
        CloseFile(Impressora); 
     End;

     Ampulheta();

     Conta_Produto   := 0;
     Conta_Boleto    := 0;
     Posicao_Inicial := 1;
     Nro_Nota        := StrToInt(ETP_Numero_Nota.Text);

     For Ind_Produto := 1 To (SGD_Produtos.RowCount - 1) Do
         Begin

         Conta_Produto := Conta_Produto + 1;

         If Conta_Produto >= 18 Then
            Begin
            Posicao_Final        := Ind_produto;
            ETP_Numero_Nota.Text := IntToStr(Nro_Nota);

            If Not Primeira_Nota Then
               Begin
               Application.CreateForm(TNotasFiscaisSaidas03,NotasFiscaisSaidas03);

               NotasFiscaisSaidas03.Qtde_Volume.Text  := Qtde_Volume.Text;
               NotasFiscaisSaidas03.Especie.Text      := Especie.Text;
               NotasFiscaisSaidas03.Marca.Text        := Marca.Text;
               NotasFiscaisSaidas03.Peso_Bruto.Text   := Peso_Bruto.Text;
               NotasFiscaisSaidas03.Peso_Liquido.Text := Peso_Liquido.Text;
               NotasFiscaisSaidas03.Retorno.Text      := 'Notas_Fiscais_Saidas_02';

               NotasFiscaisSaidas03.ShowModal;
               NotasFiscaisSaidas03.Destroy;
            End;

            Imprime_Nota_Monibras(Posicao_Inicial, Posicao_Final);

            Primeira_Nota := False;

            Conta_Produto   := 0;
            Posicao_Inicial := (Ind_produto + 1);
            Nro_Nota        := (Nro_Nota + 1);

            Conta_Boleto    := Conta_Boleto + 1;
         End;
     End;

     Posicao_Final := (Ind_produto - 1);

     If ((Conta_Produto > 0) And (Conta_Produto <= 18)) Then
        Begin
        ETP_Numero_Nota.Text := IntToStr(Nro_Nota);

        If Not Primeira_Nota Then
           Begin
           Application.CreateForm(TNotasFiscaisSaidas03,NotasFiscaisSaidas03);

           NotasFiscaisSaidas03.Qtde_Volume.Text  := Qtde_Volume.Text;
           NotasFiscaisSaidas03.Especie.Text      := Especie.Text;
           NotasFiscaisSaidas03.Marca.Text        := Marca.Text;
           NotasFiscaisSaidas03.Peso_Bruto.Text   := Peso_Bruto.Text;
           NotasFiscaisSaidas03.Peso_Liquido.Text := Peso_Liquido.Text;
           NotasFiscaisSaidas03.Retorno.Text      := 'Notas_Fiscais_Saidas_02';

           NotasFiscaisSaidas03.ShowModal;
           NotasFiscaisSaidas03.Destroy;
        End;

        Imprime_Nota_Monibras(Posicao_Inicial, Posicao_Final);

        Conta_Boleto := Conta_Boleto + 1;
     End;

     //*** Prepara a Junção dos Boletos - Monibras ***

     Posicao_Nota_Boleto := Conta_Boleto - 1;
     Boleto_Obs          := '';

     Boleto_Docto_1 := '';
     Boleto_Docto_2 := '';
     Boleto_Docto_3 := '';
     Boleto_Docto_4 := '';

     Vlr_Nota_Boleto_1 := 0;
     Vlr_Nota_Boleto_2 := 0;
     Vlr_Nota_Boleto_3 := 0;
     Vlr_Nota_Boleto_4 := 0;

     If Posicao_Nota_Boleto > 0 Then
        Begin

        Boleto_Obs          := 'Ref.Notas: ';
        Nro_Nota_Boleto_FIM := StrToInt(ETP_Numero_Nota.Text);

        For Nro_Nota_Boleto_INI := (StrToInt(ETP_Numero_Nota.Text) - Posicao_Nota_Boleto) To Nro_Nota_Boleto_FIM Do
            Begin
            Comando_SQL := 'select * from mb_notas_fiscais where mb_nota_fiscal_numero = ' + Trim(IntToStr(Nro_Nota_Boleto_INI));

            ConexaoBD.SQL_MB_Nota_Fiscal.Close;
            ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Clear;
            ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_MB_Nota_Fiscal.Open;

            If ConexaoBD.SQL_MB_Nota_Fiscal.RecordCount > 0 Then
               Begin
               Boleto_Docto_1 := Boleto_Docto_1 + ' / ' + ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_nro_1.Text;
               Boleto_Docto_2 := Boleto_Docto_2 + ' / ' + ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_nro_2.Text;
               Boleto_Docto_3 := Boleto_Docto_3 + ' / ' + ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_nro_3.Text;
               Boleto_Docto_4 := Boleto_Docto_4 + ' / ' + ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_nro_4.Text;

               Vlr_Nota_Boleto_1 := Vlr_Nota_Boleto_1 + ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_1.AsFloat;
               Vlr_Nota_Boleto_2 := Vlr_Nota_Boleto_2 + ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_2.AsFloat;
               Vlr_Nota_Boleto_3 := Vlr_Nota_Boleto_3 + ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_3.AsFloat;
               Vlr_Nota_Boleto_4 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_4.AsFloat;

               Boleto_Obs := Boleto_Obs + Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_numero.Text) + ' - R$ ' + Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_1.Text) + ' / ';

               Comando_SQL := 'Update mb_notas_fiscais Set ';
               Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_emissao = ' +#39+ 'N' +#39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_obs = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_docto_1 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_docto_2 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_docto_3 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_docto_4 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_vlr_1 = 0.00, ';
               Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_vlr_2 = 0.00, ';
               Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_vlr_3 = 0.00, ';
               Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_vlr_4 = 0.00 ';
               Comando_SQL := Comando_SQL + 'where mb_nota_fiscal_numero = ' + Trim(IntToStr(Nro_Nota_Boleto_INI));

               ConexaoBD.SQL_Comunitario.Close;
               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Comunitario.ExecSQL;
            End;
        End;
     End;

     Nro_Nota_Boleto_INI := (StrToInt(ETP_Numero_Nota.Text) - Posicao_Nota_Boleto);

     //*** Retira a Barra ***

     If Trim(Boleto_Docto_1) <> '' Then
        Begin
        Boleto_Docto_1 := Trim(Copy(Trim(Boleto_Docto_1),2,(Length(Trim(Boleto_Docto_1)) - 1)));
     End;

     If Trim(Boleto_Docto_2) <> '' Then
        Begin
        Boleto_Docto_2 := Trim(Copy(Trim(Boleto_Docto_2),2,(Length(Trim(Boleto_Docto_2)) - 1)));
     End;

     If Trim(Boleto_Docto_3) <> '' Then
        Begin
        Boleto_Docto_3 := Trim(Copy(Trim(Boleto_Docto_3),2,(Length(Trim(Boleto_Docto_3)) - 1)));
     End;

     If Trim(Boleto_Docto_4) <> '' Then
        Begin
        Boleto_Docto_4 := Trim(Copy(Trim(Boleto_Docto_4),2,(Length(Trim(Boleto_Docto_4)) - 1)));
     End;

     If Trim(Boleto_Obs) <> '' Then
        Begin
        Boleto_Obs := Trim(Copy(Trim(Boleto_Obs),1,(Length(Trim(Boleto_Obs)) - 1)));
     End;

     //*** Retira as Barras Novamente ***

     If Trim(Boleto_Docto_1) = '/' Then
        Begin
        Boleto_Docto_1 := '';
     End;

     If Trim(Boleto_Docto_2) = '/' Then
        Begin
        Boleto_Docto_2 := '';
     End;

     If Trim(Boleto_Docto_3) = '/' Then
        Begin
        Boleto_Docto_3 := '';
     End;

     If Trim(Boleto_Docto_4) = '/' Then
        Begin
        Boleto_Docto_4 := '';
     End;

     If Trim(Boleto_Obs) = '/' Then
        Begin
        Boleto_Obs := '';
     End;

     Comando_SQL := 'Update mb_notas_fiscais Set ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_emissao = ' +#39+ 'S' +#39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_obs = ' +#39 + Trim(Boleto_Obs) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_docto_1 = ' +#39 + Trim(Boleto_Docto_1) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_docto_2 = ' +#39 + Trim(Boleto_Docto_2) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_docto_3 = ' +#39 + Trim(Boleto_Docto_3) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_docto_4 = ' +#39 + Trim(Boleto_Docto_4) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_vlr_1 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_1)) + ', ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_vlr_2 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_2)) + ', ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_vlr_3 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_3)) + ', ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_boleto_vlr_4 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_4)) + ' ';
     Comando_SQL := Comando_SQL + 'where mb_nota_fiscal_numero = ' + Trim(IntToStr(Nro_Nota_Boleto_INI));

     ConexaoBD.SQL_Comunitario.Close;
     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     Seta();
end;

procedure TNotasFiscaisSaidas02.Imprime_OS();

var
   Impressora: TextFile;
   Ind_Produto, Conta_Produto, Posicao_Inicial, Posicao_Final, Conta_Boleto, Nro_Nota_Boleto_INI, Nro_Nota_Boleto_FIM, Posicao_Nota_Boleto: Integer;
   Boleto_Obs, Boleto_Docto_1, Boleto_Docto_2, Boleto_Docto_3, Boleto_Docto_4, Comando_SQL: String;
   Vlr_Nota_Boleto_1, Vlr_Nota_Boleto_2, Vlr_Nota_Boleto_3, Vlr_Nota_Boleto_4: Real;

begin
     Ampulheta();

     Conta_Produto   := 0;
     Conta_Boleto    := 0;
     Posicao_Inicial := 1;
     Nro_Nota        := StrToInt(ETP_Numero_Nota.Text);

     For Ind_Produto := 1 To (SGD_Produtos.RowCount - 1) Do
         Begin

         Conta_produto := Conta_Produto + 1;

         If Conta_Produto >= 14 Then
            Begin
            Posicao_Final        := Ind_produto;
            ETP_Numero_Nota.Text := IntToStr(Nro_Nota);

            Imprime_OS_Monibras(Posicao_Inicial, Posicao_Final);

            Conta_Produto   := 0;
            Posicao_Inicial := (Ind_produto + 1);
            Nro_Nota        := (Nro_Nota + 1);

            Conta_Boleto    := Conta_Boleto + 1;
         End;
     End;

     Posicao_Final := (Ind_produto - 1);

     If ((Conta_Produto > 0) And (Conta_Produto < 14)) Then
        Begin
        ETP_Numero_Nota.Text := IntToStr(Nro_Nota);

        Imprime_OS_Monibras(Posicao_Inicial, Posicao_Final);

        Conta_Boleto := Conta_Boleto + 1;
     End;

     //*** Prepara a Junção dos Boletos - Monibras ***

     Posicao_Nota_Boleto := Conta_Boleto - 1;
     Boleto_Obs          := '';

     Boleto_Docto_1 := '';
     Boleto_Docto_2 := '';
     Boleto_Docto_3 := '';
     Boleto_Docto_4 := '';

     Vlr_Nota_Boleto_1 := 0;
     Vlr_Nota_Boleto_2 := 0;
     Vlr_Nota_Boleto_3 := 0;
     Vlr_Nota_Boleto_4 := 0;

     If Posicao_Nota_Boleto > 0 Then
        Begin

        Boleto_Obs          := 'Ref.Notas: ';
        Nro_Nota_Boleto_FIM := StrToInt(ETP_Numero_Nota.Text);

        For Nro_Nota_Boleto_INI := (StrToInt(ETP_Numero_Nota.Text) - Posicao_Nota_Boleto) To Nro_Nota_Boleto_FIM Do
            Begin
            Comando_SQL := 'select * from mb_papeletas where mb_papeleta_numero = ' + Trim(IntToStr(Nro_Nota_Boleto_INI));

            ConexaoBD.SQL_MB_Papeletas.Close;
            ConexaoBD.SQL_MB_Papeletas.SQL.Clear;
            ConexaoBD.SQL_MB_Papeletas.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_MB_Papeletas.Open;

            If ConexaoBD.SQL_MB_Papeletas.RecordCount > 0 Then
               Begin
               Boleto_Docto_1 := Boleto_Docto_1 + ' / ' + ConexaoBD.SQL_MB_Papeletasmb_papeleta_dup_nro_1.Text;
               Boleto_Docto_2 := Boleto_Docto_2 + ' / ' + ConexaoBD.SQL_MB_Papeletasmb_papeleta_dup_nro_2.Text;
               Boleto_Docto_3 := Boleto_Docto_3 + ' / ' + ConexaoBD.SQL_MB_Papeletasmb_papeleta_dup_nro_3.Text;
               Boleto_Docto_4 := Boleto_Docto_4 + ' / ' + ConexaoBD.SQL_MB_Papeletasmb_papeleta_dup_nro_4.Text;

               Vlr_Nota_Boleto_1 := Vlr_Nota_Boleto_1 + ConexaoBD.SQL_MB_Papeletasmb_papeleta_dup_vlr_1.AsFloat;
               Vlr_Nota_Boleto_2 := Vlr_Nota_Boleto_2 + ConexaoBD.SQL_MB_Papeletasmb_papeleta_dup_vlr_2.AsFloat;
               Vlr_Nota_Boleto_3 := Vlr_Nota_Boleto_3 + ConexaoBD.SQL_MB_Papeletasmb_papeleta_dup_vlr_3.AsFloat;
               Vlr_Nota_Boleto_4 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_MB_Papeletasmb_papeleta_dup_vlr_4.AsFloat;

               Boleto_Obs := Boleto_Obs + Trim(ConexaoBD.SQL_MB_Papeletasmb_papeleta_numero.Text) + ' - R$ ' + Trim(ConexaoBD.SQL_MB_Papeletasmb_papeleta_dup_vlr_1.Text) + ' / ';

               Comando_SQL := 'Update mb_papeletas Set ';
               Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_emissao = ' +#39+ 'N' +#39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_obs = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_docto_1 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_docto_2 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_docto_3 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_docto_4 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_vlr_1 = 0.00, ';
               Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_vlr_2 = 0.00, ';
               Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_vlr_3 = 0.00, ';
               Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_vlr_4 = 0.00 ';
               Comando_SQL := Comando_SQL + 'where mb_papeleta_numero = ' + Trim(IntToStr(Nro_Nota_Boleto_INI));

               ConexaoBD.SQL_Comunitario.Close;
               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Comunitario.ExecSQL;
            End;
        End;
     End;

     Nro_Nota_Boleto_INI := (StrToInt(ETP_Numero_Nota.Text) - Posicao_Nota_Boleto);

     //*** Retira as Barras ***

     If Trim(Boleto_Docto_1) <> '' Then
        Begin
        Boleto_Docto_1 := Trim(Copy(Trim(Boleto_Docto_1),2,(Length(Trim(Boleto_Docto_1)) - 1)));
     End;

     If Trim(Boleto_Docto_2) <> '' Then
        Begin
        Boleto_Docto_2 := Trim(Copy(Trim(Boleto_Docto_2),2,(Length(Trim(Boleto_Docto_2)) - 1)));
     End;

     If Trim(Boleto_Docto_3) <> '' Then
        Begin
        Boleto_Docto_3 := Trim(Copy(Trim(Boleto_Docto_3),2,(Length(Trim(Boleto_Docto_3)) - 1)));
     End;

     If Trim(Boleto_Docto_4) <> '' Then
        Begin
        Boleto_Docto_4 := Trim(Copy(Trim(Boleto_Docto_4),2,(Length(Trim(Boleto_Docto_4)) - 1)));
     End;

     If Trim(Boleto_Obs) <> '' Then
        Begin
        Boleto_Obs := Trim(Copy(Trim(Boleto_Obs),1,(Length(Trim(Boleto_Obs)) - 1)));
     End;

     //*** Retira as Barras Novamente ***

     If Trim(Boleto_Docto_1) = '/' Then
        Begin
        Boleto_Docto_1 := '';
     End;

     If Trim(Boleto_Docto_2) = '/' Then
        Begin
        Boleto_Docto_2 := '';
     End;

     If Trim(Boleto_Docto_3) = '/' Then
        Begin
        Boleto_Docto_3 := '';
     End;

     If Trim(Boleto_Docto_4) = '/' Then
        Begin
        Boleto_Docto_4 := '';
     End;

     If Trim(Boleto_Obs) = '/' Then
        Begin
        Boleto_Obs := '';
     End;

     Comando_SQL := 'Update mb_papeletas Set ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_emissao = ' +#39+ 'S' +#39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_obs = ' +#39 + Trim(Boleto_Obs) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_docto_1 = ' +#39 + Trim(Boleto_Docto_1) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_docto_2 = ' +#39 + Trim(Boleto_Docto_2) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_docto_3 = ' +#39 + Trim(Boleto_Docto_3) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_docto_4 = ' +#39 + Trim(Boleto_Docto_4) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_vlr_1 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_1)) + ', ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_vlr_2 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_2)) + ', ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_vlr_3 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_3)) + ', ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_boleto_vlr_4 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_4)) + ' ';
     Comando_SQL := Comando_SQL + 'where mb_papeleta_numero = ' + Trim(IntToStr(Nro_Nota_Boleto_INI));

     ConexaoBD.SQL_Comunitario.Close;
     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     Seta();
end;

procedure TNotasFiscaisSaidas02.Imprime_Nota_Monibras(Posicao_Inicial, Posicao_Final: Integer);

var
   Linha: Integer;
   Descricao, Observacao_1, Observacao_2, Observacao_3, Observacao_4: String;
   Codigo_CFOP, Codigo_CFOP_2, Endereco_Cobranca, Endereco_Entrega, Valor_Extenso, Comando_SQL: String;
   Base_ICMS_Reduzida, Base_ICMS_Substituicao, Aliquota_ICMS, Aliquota_ICMS_Reducao, Aliquota_ICMS_Substituicao, Vlr_Suframa: Real;
   Ind, Ind_Detalhada, Total_Produtos: Integer;

   Classificacao_Fiscal, Classificacao_Tributaria, Unidade_Produto, VLR_ICMS_Substituicao_Str, VLR_ICMS_Oper_Propria_Str: String;
   BC_ICMS_Reduzida, BC_ICMS_Normal, BC_ICMS_Normal_Sub, BC_ICMS_Substituicao, VLR_ICMS_Reduzida, VLR_ICMS_Normal, VLR_ICMS_Substituicao, BC_IPI_Normal, VLR_IPI_Normal: Real;
   Bonificacao, Peso, Total_Nro, Porcentagem_Nro, Frete_Nro, IPI_Nro: Real;
   Unidade: Real;
   Erro, Conta_produtos, Outros_Produtos: Integer;
   Maiuscula, Total_Str, Porcentagem_Str, Valor_Str, Transportadora: String;

   Produto_Detalhada, Produto_Detalhada_Final, Produto_Detalhada_1, Produto_Detalhada_2, Produto_Detalhada_3, Produto_Detalhada_4, Produto_Detalhada_5, Produto_Detalhada_6,
   Produto_Detalhada_7, Produto_Detalhada_8, Produto_Detalhada_9, Produto_Detalhada_10, Produto_Detalhada_11, Produto_Detalhada_12,
   Produto_Detalhada_13, Produto_Detalhada_14, Produto_Detalhada_15, Produto_Detalhada_16, Produto_Detalhada_17, Produto_Detalhada_18: String; 

begin
     Ampulheta();

     //*** Prepara o Cálculo dos Valores ***

     Comando_SQL := 'Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39;

     ConexaoBD.SQL_Clientes.Close;
     ConexaoBD.SQL_Clientes.SQL.Clear;
     ConexaoBD.SQL_Clientes.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Clientes.Open;

     Total_Nota                      := 0;
     Total_Desconto                  := 0;
     Vlr_Total_Produtos              := 0;
     Vlr_Total_Produtos_Substituicao := 0;
     Vlr_Suframa                     := 0;
     Vlr_Desconto                    := 0;
     Vlr_Frete                       := 0;
     Vlr_Frete_Produto               := 0;
     Porcentagem_Desconto            := 0;
     Conta_Produtos                  := 0;

     BC_ICMS_Reduzida      := 0;
     BC_ICMS_Normal        := 0;
     BC_ICMS_Substituicao  := 0;
     BC_ICMS_Normal_Sub    := 0;
     BC_IPI_Normal         := 0;

     VLR_ICMS_Reduzida     := 0;
     VLR_ICMS_Normal       := 0;
     VLR_ICMS_Substituicao := 0;
     VLR_IPI_Normal        := 0;

     //*** Obtem os CFOPS ***

     Cliente_CFOP_2.Text := '';

     Codigo_CFOP     := Cliente_CFOP.Text;
     Codigo_CFOP_2   := '';
     Outros_Produtos := 0;

     //*** Calcular a Aliquotas ***

     If Trim(Cliente_Aliquota_ICMS.Text) = '' Then
        Begin
        Cliente_Aliquota_ICMS.Text := '0';
     End;

     If Trim(Cliente_Base_Reduzida.Text) = '' Then
        Begin
        Cliente_Base_Reduzida.Text := '0';
     End;

     Base_ICMS_Reduzida := StrToFloat(Ponto_Virgula(Cliente_Base_Reduzida.Text));

     If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        Aliquota_ICMS := 0;
        End
     Else
        Begin
        Aliquota_ICMS := StrToFloat(Ponto_Virgula(Cliente_Aliquota_ICMS.Text));
     End;

     Vlr_IPI_Str := Trim(Virgula_Ponto(Valor_IPI.Text));
     Val(Vlr_IPI_Str,IPI_Nro,Erro);
     Vlr_IPI := Frete_Nro;

     Vlr_Frete_Str := Trim(Virgula_Ponto(Valor_Frete.Text));
     Val(Vlr_Frete_Str,Frete_Nro,Erro);
     Vlr_Frete := Frete_Nro;

     Porcentagem_Str := Trim(Virgula_Ponto(Cliente_Desconto.Text));
     Val(Porcentagem_Str,Porcentagem_Nro,Erro);
     Porcentagem_Desconto := Porcentagem_Nro;

     Vlr_Frete_Produto := Vlr_Frete / Posicao_Final;

     Conta_Produtos                  := Posicao_Inicial;
     Vlr_Total_Produtos_Substituicao := 0;

     For Ind := Posicao_Inicial To Posicao_Final Do
         Begin
         If Trim(SGD_Produtos.Cells[1,Ind]) <> '' Then
            Begin

            ConexaoBD.SQL_Produtos.Close;
            ConexaoBD.SQL_Produtos.SQL.Clear;
            ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' +#39+ Trim(SGD_Produtos.Cells[2,Ind]) + #39);
            ConexaoBD.SQL_Produtos.Open;

            Classificacao_Fiscal     := ConexaoBD.SQL_Produtosfb_produto_classif_fiscal.Text;
            Classificacao_Tributaria := ConexaoBD.SQL_Produtosfb_produto_classif_tributaria.Text;

            If Length(Classificacao_Tributaria) = 1 Then
               Begin
               Classificacao_Tributaria := '00' + Trim(Classificacao_Tributaria);
               End
            Else If Length(Classificacao_Tributaria) = 2 Then
               Begin
               Classificacao_Tributaria := '0' + Trim(Classificacao_Tributaria);
            End;

            If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
               Begin
               Classificacao_Tributaria := '040';
            End;

            BC_ICMS_Normal := BC_ICMS_Normal + StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind]));
            VLR_IPI_Normal := VLR_IPI_Normal + (((StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind])) + Vlr_Frete_Produto) * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[8,Ind]))) / 100);

            Total_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[7,Ind]));
            Val(Total_Str,Total_Nro,Erro);

            Total_Nota     := Total_Nota + Total_Nro;
            Conta_Produtos := Conta_Produtos + 1;
         End;
     End; 

     Total_Nota      := Total_Nota + VLR_IPI_Normal;

     Conta_Produtos := Conta_Produtos - 1;
     Posicao_Final  := Conta_Produtos;

     Total_Desconto := (Total_Nota - ((Total_Nota * Porcentagem_Desconto) / 100));
     Vlr_Desconto   := ((Total_Nota * Porcentagem_Desconto) / 100);

     Vlr_Total_Produtos := (Total_Nota + Vlr_Frete) - VLR_IPI_Normal;
     Total_Desconto     := (Total_Desconto + Vlr_Frete);

     If Total_NF_IPI.Checked Then
        Begin
        Str((Vlr_Total_Produtos + VLR_IPI_Normal):13:2,Vlr_Total_Produtos_Str);
        End
     Else
        Begin
        Str((Vlr_Total_Produtos):13:2,Vlr_Total_Produtos_Str);
     End;

     Valor_Total.Text := Ponto_Virgula(Trim(Vlr_Total_Produtos_Str));

     Str(Total_Nota:13:2,Total_Nota_Str);
     Str(Total_Desconto:13:2,Total_Desconto_Str);
     Str(Vlr_Desconto:13:2,Vlr_Desconto_Str);
     Str(Porcentagem_Desconto:7:3,Porcentagem_Desconto_Str);
     Str(Vlr_Frete:13:2,Vlr_Frete_Str);
     Str(Vlr_Total_Produtos:13:2,Vlr_Total_Produtos_Str);

     //*** Inicializa as Variáveis ***

     Descricao     := '';
     Observacao_1  := '';
     Observacao_2  := '';
     Observacao_3  := '';
     Observacao_4  := '';

     Peso          := 0;
     Unidade       := 0;

     //*** Processo de Preparação para Emissão da Nota ***

     Imprimir.Linhas := 66;

     Linha := 1;
     Imprimir.PoeStr(Linha,001, #15+'.');

     Linha := Linha + 3;
     //*** Coloca o X na Nota Fiscal ***

     If StrToInt(Copy(Retira_Caracter(Trim(Cliente_CFOP.Text),'.'),1,4)) > 5000 Then
        Begin
        Imprimir.PoeStr(Linha,087, 'XXX');
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,103, 'XXX');
     End;     

     Imprimir.PoeStr(Linha,125, Trim(ETP_Numero_Nota.Text));
                          
     Linha := Linha + 5;
     Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Cliente_Natureza_Operacao.Text));

     //*** Prepara a Natureza de Operação ***

     Observacao_1 := '';

     If Trim(Codigo_CFOP_2) <> '' Then
        Begin
        If (Outros_Produtos = 0) And (Trim(Codigo_CFOP_2) <> '') Then
           Begin
           Imprimir.PoeStr(Linha,044, Trim(Codigo_CFOP_2) );
           Codigo_CFOP := Codigo_CFOP_2;
           End
        Else
           Begin
           Imprimir.PoeStr(Linha,044, Trim(Codigo_CFOP) + '/' + Trim(Codigo_CFOP_2) );
        End;

        End
     Else
        Begin
        Imprimir.PoeStr(Linha,044, Codigo_CFOP);
     End;

     Linha := Linha + 3;
     Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Cliente_Nome.Text));
     Imprimir.PoeStr(Linha,083, Trim(Cliente_Codigo.Text));
     Imprimir.PoeStr(Linha,120, Trim(ETP_Data_Emissao_Nota.Text));

     Linha := Linha + 2;
     If Trim(Cliente_Complemento.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Trim(Cliente_Endereco.Text) + ' - ' + Trim(Cliente_Complemento.Text)));
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Cliente_Endereco.Text));
     End;

     Imprimir.PoeStr(Linha,070, Letra_Maiuscula(Cliente_Bairro.Text));

     If Trim(Cliente_Cep.Text) <> '00000-000' Then
        Begin
        Imprimir.PoeStr(Linha,099, Trim(Cliente_Cep.Text));
     End;

     Linha := Linha + 2;
     Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Cliente_Cidade.Text));

     If Trim(Cliente_Fone_Comercial.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,051, Trim(Cliente_Fone_Comercial.Text));
        End
     Else If Trim(Cliente_Fone_Residencial.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,051, Trim(Cliente_Fone_Residencial.Text));
        End
     Else If Trim(Cliente_Fone_Celular.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,051, Trim(Cliente_Fone_Celular.Text));
        End
     Else If Trim(Cliente_Fone_Fax.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,051, Trim(Cliente_Fone_Fax.Text));
     End;

     Imprimir.PoeStr(Linha,075, Letra_Maiuscula(Cliente_Estado.Text));
     Imprimir.PoeStr(Linha,083, Trim(Cliente_Inscricao_Estadual.Text));

     Linha := Linha + 2;

     Total_Desconto_Str_Ant := Total_Desconto_Str;

     If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        Str((Total_Nota - ((Total_Nota * 7) / 100)):13:2,Total_Desconto_Str);
     End;

     If Trim(Codigo_CFOP_2) <> '' Then
        Begin
        Str((StrToFloat(Ponto_Virgula(Total_Desconto_Str)) + ((Vlr_Total_Produtos_Substituicao * 18) / 100) - ((BC_ICMS_Normal_Sub * 18) / 100)):13:2,Total_Desconto_Str);
     End;

     If StrToFloat(Ponto_Virgula(Trim(Total_Desconto_Str))) < 1 Then
        Begin
        Valor_Extenso := '';
        End
     Else
        Begin
        Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Total_Desconto_Str)));
     End;

     Prepara_Condicao();

     Total_Desconto_Str := Total_Desconto_Str_Ant;

     If (Pos('VENDA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) > 0) Then
        Begin
        If ((Trim(Cliente_Condicao_Pgto_1) <> '') And (Trim(Cliente_Condicao_Pgto_1) <> '0') And (Trim(Cliente_Condicao_Pgto_1) <> '1')) Or ((Trim(Dt_Vcto_Desd_1) <> '/  /') And (Trim(Dt_Vcto_Desd_1) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,003, Trim(Nro_Nota_Desd_1));
           Imprimir.PoeStr(Linha,017, Trim(Dt_Vcto_Desd_1));
           Imprimir.PoeStr(Linha,037, Exibe_Nro_Impressao(Vlr_Str_Desd_1,10));
        //   End
        //Else
        //   Begin
        //   Imprimir.PoeStr(Linha,003, Trim(Nro_Nota_Desd_1));
        //   Imprimir.PoeStr(Linha,017, 'À VISTA');
        //   Imprimir.PoeStr(Linha,037, Exibe_Nro_Impressao(Vlr_Str_Desd_1,10));
        End;

        If ((Trim(Cliente_Condicao_Pgto_2) <> '') And (Trim(Cliente_Condicao_Pgto_2) <> '0')) Or ((Trim(Dt_Vcto_Desd_2) <> '/  /') And (Trim(Dt_Vcto_Desd_2) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,051, Trim(Nro_Nota_Desd_2));
           Imprimir.PoeStr(Linha,063, Trim(Dt_Vcto_Desd_2));
           Imprimir.PoeStr(Linha,083, Exibe_Nro_Impressao(Vlr_Str_Desd_2,10));
        End;

        If ((Trim(Cliente_Condicao_Pgto_3) <> '') And (Trim(Cliente_Condicao_Pgto_3) <> '0')) Or ((Trim(Dt_Vcto_Desd_3) <> '/  /') And (Trim(Dt_Vcto_Desd_3) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,097, Trim(Nro_Nota_Desd_3));
           Imprimir.PoeStr(Linha,109, Trim(Dt_Vcto_Desd_3));
           Imprimir.PoeStr(Linha,121, Exibe_Nro_Impressao(Vlr_Str_Desd_3,10));
        End;
     End;

     Linha := Linha + 1;

     If (Pos('VENDA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) > 0) Then
        Begin
        If ((Trim(Cliente_Condicao_Pgto_4) <> '') And (Trim(Cliente_Condicao_Pgto_4) <> '0')) Or ((Trim(Dt_Vcto_Desd_4) <> '/  /') And (Trim(Dt_Vcto_Desd_4) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,003, Trim(Nro_Nota_Desd_4));
           Imprimir.PoeStr(Linha,017, Trim(Dt_Vcto_Desd_4));
           Imprimir.PoeStr(Linha,037, Exibe_Nro_Impressao(Vlr_Str_Desd_4,10));
        End;

        If ((Trim(Cliente_Condicao_Pgto_5) <> '') And (Trim(Cliente_Condicao_Pgto_5) <> '0')) Or ((Trim(Dt_Vcto_Desd_5) <> '/  /') And (Trim(Dt_Vcto_Desd_5) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,051, Trim(Nro_Nota_Desd_5));
           Imprimir.PoeStr(Linha,063, Trim(Dt_Vcto_Desd_5));
           Imprimir.PoeStr(Linha,083, Exibe_Nro_Impressao(Vlr_Str_Desd_5,10));
        End;

        If ((Trim(Cliente_Condicao_Pgto_6) <> '') And (Trim(Cliente_Condicao_Pgto_6) <> '0')) Or ((Trim(Dt_Vcto_Desd_6) <> '/  /') And (Trim(Dt_Vcto_Desd_6) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,097, Trim(Nro_Nota_Desd_6));
           Imprimir.PoeStr(Linha,109, Trim(Dt_Vcto_Desd_6));
           Imprimir.PoeStr(Linha,121, Exibe_Nro_Impressao(Vlr_Str_Desd_6,10));
        End;
     End;

     Linha := Linha + 1;

     If (Pos('VENDA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) > 0) Then
        Begin
        If ((Trim(Cliente_Condicao_Pgto_7) <> '') And (Trim(Cliente_Condicao_Pgto_7) <> '0')) Or ((Trim(Dt_Vcto_Desd_7) <> '/  /') And (Trim(Dt_Vcto_Desd_7) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,003, Trim(Nro_Nota_Desd_7));
           Imprimir.PoeStr(Linha,017, Trim(Dt_Vcto_Desd_7));
           Imprimir.PoeStr(Linha,037, Exibe_Nro_Impressao(Vlr_Str_Desd_7,10));
        End;

        If ((Trim(Cliente_Condicao_Pgto_8) <> '') And (Trim(Cliente_Condicao_Pgto_8) <> '0')) Or ((Trim(Dt_Vcto_Desd_8) <> '/  /') And (Trim(Dt_Vcto_Desd_8) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,051, Trim(Nro_Nota_Desd_8));
           Imprimir.PoeStr(Linha,063, Trim(Dt_Vcto_Desd_8));
           Imprimir.PoeStr(Linha,083, Exibe_Nro_Impressao(Vlr_Str_Desd_8,10));
        End;

        If ((Trim(Cliente_Condicao_Pgto_9) <> '') And (Trim(Cliente_Condicao_Pgto_9) <> '0')) Or ((Trim(Dt_Vcto_Desd_9) <> '/  /') And (Trim(Dt_Vcto_Desd_9) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,097, Trim(Nro_Nota_Desd_9));
           Imprimir.PoeStr(Linha,109, Trim(Dt_Vcto_Desd_9));
           Imprimir.PoeStr(Linha,121, Exibe_Nro_Impressao(Vlr_Str_Desd_9,10));
        End;
     End;

     Linha := Linha + 1;

     If (Pos('VENDA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) > 0) Then
        Begin
        If ((Trim(Cliente_Condicao_Pgto_10) <> '') And (Trim(Cliente_Condicao_Pgto_10) <> '0')) Or ((Trim(Dt_Vcto_Desd_10) <> '/  /') And (Trim(Dt_Vcto_Desd_10) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,003, Trim(Nro_Nota_Desd_10));
           Imprimir.PoeStr(Linha,017, Trim(Dt_Vcto_Desd_10));
           Imprimir.PoeStr(Linha,037, Exibe_Nro_Impressao(Vlr_Str_Desd_10,10));
        End;

        If ((Trim(Cliente_Condicao_Pgto_11) <> '') And (Trim(Cliente_Condicao_Pgto_11) <> '0')) Or ((Trim(Dt_Vcto_Desd_11) <> '/  /') And (Trim(Dt_Vcto_Desd_11) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,051, Trim(Nro_Nota_Desd_11));
           Imprimir.PoeStr(Linha,063, Trim(Dt_Vcto_Desd_11));
           Imprimir.PoeStr(Linha,083, Exibe_Nro_Impressao(Vlr_Str_Desd_11,10));
        End;

        If ((Trim(Cliente_Condicao_Pgto_12) <> '') And (Trim(Cliente_Condicao_Pgto_12) <> '0')) Or ((Trim(Dt_Vcto_Desd_12) <> '/  /') And (Trim(Dt_Vcto_Desd_12) <> '00/00/0000')) Then
           Begin
           Imprimir.PoeStr(Linha,097, Trim(Nro_Nota_Desd_12));
           Imprimir.PoeStr(Linha,109, Trim(Dt_Vcto_Desd_12));
           Imprimir.PoeStr(Linha,121, Exibe_Nro_Impressao(Vlr_Str_Desd_12,10));
        End;
     End;

     BC_ICMS_Reduzida      := 0;
     BC_ICMS_Normal        := 0;
     BC_ICMS_Substituicao  := 0;
     BC_ICMS_Normal_Sub    := 0;
     BC_IPI_Normal         := 0;

     VLR_ICMS_Reduzida     := 0;
     VLR_ICMS_Normal       := 0;
     VLR_ICMS_Substituicao := 0;
     VLR_IPI_Normal        := 0;

     Conta_Produtos        := 0;

     Linha := Linha + 1;

     For Ind := Posicao_Inicial To Posicao_Final Do
         Begin

         If Trim(SGD_Produtos.Cells[1,Ind]) <> '' Then
            Begin

            //*** Busca Algumas Informações do Produto ***

            ConexaoBD.SQL_Produtos.Close;
            ConexaoBD.SQL_Produtos.SQL.Clear;
            ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' +#39+ Trim(SGD_Produtos.Cells[2,Ind]) + #39);
            ConexaoBD.SQL_Produtos.Open;

            Classificacao_Fiscal     := ConexaoBD.SQL_Produtosfb_produto_classif_fiscal.Text;
            Classificacao_Tributaria := ConexaoBD.SQL_Produtosfb_produto_classif_tributaria.Text;

            If Length(Classificacao_Tributaria) = 1 Then
               Begin
               Classificacao_Tributaria := '00' + Trim(Classificacao_Tributaria);
               End
            Else If Length(Classificacao_Tributaria) = 2 Then
               Begin
               Classificacao_Tributaria := '0' + Trim(Classificacao_Tributaria);
            End;

            If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
               Begin
               Classificacao_Tributaria := '040';
            End;

            If ((Pos('OUTRA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('RETORNO',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('REMESSA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('IMPORTA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0)) Then
               Begin
               If ((Classificacao_Fiscal = 'C') Or (Classificacao_Fiscal = 'E')) Then
                  Begin
                  If ((Cliente_Estado.Text = 'AM') Or
                      (Cliente_Estado.Text = 'AP') Or
                      (Cliente_Estado.Text = 'PA') Or
                      (Cliente_Estado.Text = 'RO') Or
                      (Cliente_Estado.Text = 'RR') Or
                      (Cliente_Estado.Text = 'TO') Or
                      (Cliente_Estado.Text = 'AL') Or
                      (Cliente_Estado.Text = 'BA') Or
                      (Cliente_Estado.Text = 'CE') Or
                      (Cliente_Estado.Text = 'MA') Or
                      (Cliente_Estado.Text = 'PB') Or
                      (Cliente_Estado.Text = 'PI') Or
                      (Cliente_Estado.Text = 'PE') Or
                      (Cliente_Estado.Text = 'RN') Or
                      (Cliente_Estado.Text = 'SE') Or
                      (Cliente_Estado.Text = 'MT') Or
                      (Cliente_Estado.Text = 'MS') Or
                      (Cliente_Estado.Text = 'GO') Or
                      (Cliente_Estado.Text = 'DF') Or
                      (Cliente_Estado.Text = 'ES')) Then
                     Begin
                     Aliquota_ICMS := 7;
                     Aliquota_ICMS_Reducao := 26.57;
                     End
                  Else If ((Cliente_Estado.Text = 'MG') Or
                           (Cliente_Estado.Text = 'RJ') Or
                           (Cliente_Estado.Text = 'PR') Or
                           (Cliente_Estado.Text = 'SC') Or
                           (Cliente_Estado.Text = 'RS')) Then
                     Begin
                     Aliquota_ICMS := 12;
                     Aliquota_ICMS_Reducao := 26.66;
                     End
                  Else If ((Cliente_Estado.Text = 'SP')) Then
                     Begin
                     Aliquota_ICMS := 18;
                     Aliquota_ICMS_Reducao := 51.11;
                  End;
                  End
               Else
                  Begin
                  If ((Cliente_Estado.Text = 'AM') Or
                      (Cliente_Estado.Text = 'AP') Or
                      (Cliente_Estado.Text = 'PA') Or
                      (Cliente_Estado.Text = 'RO') Or
                      (Cliente_Estado.Text = 'RR') Or
                      (Cliente_Estado.Text = 'TO') Or
                      (Cliente_Estado.Text = 'AL') Or
                      (Cliente_Estado.Text = 'BA') Or
                      (Cliente_Estado.Text = 'CE') Or
                      (Cliente_Estado.Text = 'MA') Or
                      (Cliente_Estado.Text = 'PB') Or
                      (Cliente_Estado.Text = 'PI') Or
                      (Cliente_Estado.Text = 'PE') Or
                      (Cliente_Estado.Text = 'RN') Or
                      (Cliente_Estado.Text = 'SE') Or
                      (Cliente_Estado.Text = 'MT') Or
                      (Cliente_Estado.Text = 'MS') Or
                      (Cliente_Estado.Text = 'GO') Or
                      (Cliente_Estado.Text = 'DF') Or
                      (Cliente_Estado.Text = 'ES')) Then
                     Begin
                     Aliquota_ICMS := 7;
                     Aliquota_ICMS_Reducao := 0;
                     End
                  Else If ((Cliente_Estado.Text = 'MG') Or
                           (Cliente_Estado.Text = 'RJ') Or
                           (Cliente_Estado.Text = 'PR') Or
                           (Cliente_Estado.Text = 'SC') Or
                           (Cliente_Estado.Text = 'RS')) Then
                     Begin
                     Aliquota_ICMS := 12;
                     Aliquota_ICMS_Reducao := 0;
                     End
                  Else If ((Cliente_Estado.Text = 'SP')) Then
                     Begin
                     Aliquota_ICMS := 18;
                     Aliquota_ICMS_Reducao := 0;
                  End;
               End;
               End
            Else
               Begin
               Aliquota_ICMS := 18;
               Aliquota_ICMS_Reducao := 0;
            End;

            If Zera_Base_ICMS.Checked = True Then
               Begin
               Aliquota_ICMS := 0;
               Aliquota_ICMS_Reducao := 0;
            End;

            //Cliente_Aliquota_ICMS.Text := Trim(FloatToStr(Aliquota_ICMS));
            Aliquota_ICMS := StrToFloat(Ponto_Virgula(Cliente_Aliquota_ICMS.Text));

            If Aliquota_ICMS_Reducao > 0 Then
               Begin
               BC_ICMS_Reduzida := BC_ICMS_Reduzida + StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind]));
               End
            Else
               Begin
               BC_ICMS_Reduzida := 0;
            End;

            BC_ICMS_Normal   := BC_ICMS_Normal + StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind]));

            Unidade_Produto          := ConexaoBD.SQL_Produtosfb_produto_unidade.Text;

            If ConexaoBD.SQL_Produtosfb_produto_peso.AsVariant = Null Then
               Begin
               Peso:= Peso + (0 * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[1,Ind])));
               End
            Else
               Begin
               Peso := Peso + ((ConexaoBD.SQL_Produtosfb_produto_peso.AsVariant) * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[1,Ind])));
            End;

            Unidade                  := Unidade + StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[1,Ind]));

            Imprimir.PoeStr(Linha,002, Letra_Maiuscula(Copy(Trim(SGD_Produtos.Cells[2,Ind]),1,9)) );

            Produto_Detalhada := SGD_Produtos.Cells[10,Ind];

            If Pos('#',Produto_Detalhada) > 0 Then
               Begin
               Produto_Detalhada_1  := Copy(Produto_Detalhada,001,50);
               Produto_Detalhada_2  := Copy(Produto_Detalhada,051,50);
               Produto_Detalhada_3  := Copy(Produto_Detalhada,101,50);
               Produto_Detalhada_4  := Copy(Produto_Detalhada,151,50);
               Produto_Detalhada_5  := Copy(Produto_Detalhada,201,50);
               Produto_Detalhada_6  := Copy(Produto_Detalhada,251,50);
               Produto_Detalhada_7  := Copy(Produto_Detalhada,301,50);
               Produto_Detalhada_8  := Copy(Produto_Detalhada,351,50);
               Produto_Detalhada_9  := Copy(Produto_Detalhada,401,50);
               Produto_Detalhada_10 := Copy(Produto_Detalhada,451,50);
               Produto_Detalhada_11 := Copy(Produto_Detalhada,501,50);
               Produto_Detalhada_12 := Copy(Produto_Detalhada,551,50);
               Produto_Detalhada_13 := Copy(Produto_Detalhada,601,50);
               Produto_Detalhada_14 := Copy(Produto_Detalhada,651,50);
               Produto_Detalhada_15 := Copy(Produto_Detalhada,701,50);
               Produto_Detalhada_16 := Copy(Produto_Detalhada,751,50);
               Produto_Detalhada_17 := Copy(Produto_Detalhada,801,50);
               Produto_Detalhada_18 := Copy(Produto_Detalhada,851,50);

               Produto_Detalhada       := '';
               Produto_Detalhada_Final := '';

               For Ind_Detalhada := 1 To 18 Do
                   Begin
                   If Ind_Detalhada = 1 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_1;
                      End
                   Else If Ind_Detalhada = 2 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_2;
                      End
                   Else If Ind_Detalhada = 3 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_3;
                      End
                   Else If Ind_Detalhada = 4 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_4;
                      End
                   Else If Ind_Detalhada = 5 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_5;
                      End
                   Else If Ind_Detalhada = 6 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_6;
                      End
                   Else If Ind_Detalhada = 7 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_7;
                      End
                   Else If Ind_Detalhada = 8 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_8;
                      End
                   Else If Ind_Detalhada = 9 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_9;
                      End
                   Else If Ind_Detalhada = 10 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_10;
                      End
                   Else If Ind_Detalhada = 11 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_11;
                      End
                   Else If Ind_Detalhada = 12 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_12;
                      End
                   Else If Ind_Detalhada = 13 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_13;
                      End
                   Else If Ind_Detalhada = 14 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_14;
                      End
                   Else If Ind_Detalhada = 15 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_15;
                      End
                   Else If Ind_Detalhada = 16 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_16;
                      End
                   Else If Ind_Detalhada = 17 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_17;
                      End
                   Else If Ind_Detalhada = 18 Then
                      Begin
                      Produto_Detalhada := Produto_Detalhada_18;
                   End;

                   If Pos('#',Produto_Detalhada) > 0 Then
                      Begin
                      Produto_Detalhada := Copy(Produto_Detalhada,001,(Pos('#',Produto_Detalhada) - 1) ) +
                      Espacos( (150 - Length(Copy(Produto_Detalhada,001,(Pos('#',Produto_Detalhada) - 1) )) )) +
                      Copy(Produto_Detalhada,(Pos('#',Produto_Detalhada) + 1),(Length(Produto_Detalhada) - Pos('#',Produto_Detalhada)));
                   End;

                   Produto_Detalhada_Final := Produto_Detalhada_Final + Produto_Detalhada;
               End;

               Produto_Detalhada := Produto_Detalhada_Final;
            End;

            If Length(Trim(SGD_Produtos.Cells[4,Ind])) > 50 Then
               Begin
               Produto_Detalhada_1  := Copy(Trim(SGD_Produtos.Cells[4,Ind]),001,50);
               Produto_Detalhada_2  := Copy(Trim(SGD_Produtos.Cells[4,Ind]),051,50);
               Produto_Detalhada_3  := Copy(Produto_Detalhada,001,50);
               Produto_Detalhada_4  := Copy(Produto_Detalhada,051,50);
               Produto_Detalhada_5  := Copy(Produto_Detalhada,101,50);
               Produto_Detalhada_6  := Copy(Produto_Detalhada,151,50);
               Produto_Detalhada_7  := Copy(Produto_Detalhada,201,50);
               Produto_Detalhada_8  := Copy(Produto_Detalhada,251,50);
               Produto_Detalhada_9  := Copy(Produto_Detalhada,301,50);
               Produto_Detalhada_10 := Copy(Produto_Detalhada,351,50);
               Produto_Detalhada_11 := Copy(Produto_Detalhada,401,50);
               Produto_Detalhada_12 := Copy(Produto_Detalhada,451,50);
               Produto_Detalhada_13 := Copy(Produto_Detalhada,501,50);
               Produto_Detalhada_14 := Copy(Produto_Detalhada,551,50);
               Produto_Detalhada_15 := Copy(Produto_Detalhada,601,50);
               Produto_Detalhada_16 := Copy(Produto_Detalhada,651,50);
               Produto_Detalhada_17 := Copy(Produto_Detalhada,701,50);
               Produto_Detalhada_18 := Copy(Produto_Detalhada,751,50);
               End
            Else
               Begin
               Produto_Detalhada_1  := Copy(Trim(SGD_Produtos.Cells[4,Ind]),001,50);
               Produto_Detalhada_2  := Copy(Produto_Detalhada,001,50);
               Produto_Detalhada_3  := Copy(Produto_Detalhada,051,50);
               Produto_Detalhada_4  := Copy(Produto_Detalhada,101,50);
               Produto_Detalhada_5  := Copy(Produto_Detalhada,151,50);
               Produto_Detalhada_6  := Copy(Produto_Detalhada,201,50);
               Produto_Detalhada_7  := Copy(Produto_Detalhada,251,50);
               Produto_Detalhada_8  := Copy(Produto_Detalhada,301,50);
               Produto_Detalhada_9  := Copy(Produto_Detalhada,351,50);
               Produto_Detalhada_10 := Copy(Produto_Detalhada,401,50);
               Produto_Detalhada_11 := Copy(Produto_Detalhada,451,50);
               Produto_Detalhada_12 := Copy(Produto_Detalhada,501,50);
               Produto_Detalhada_13 := Copy(Produto_Detalhada,551,50);
               Produto_Detalhada_14 := Copy(Produto_Detalhada,601,50);
               Produto_Detalhada_15 := Copy(Produto_Detalhada,651,50);
               Produto_Detalhada_16 := Copy(Produto_Detalhada,701,50);
               Produto_Detalhada_17 := Copy(Produto_Detalhada,751,50);
               Produto_Detalhada_18 := Copy(Produto_Detalhada,801,50);
            End;

            Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Copy(Produto_Detalhada_1,1,46)) );
            Imprimir.PoeStr(Linha,059, Trim(Classificacao_Fiscal));
            Imprimir.PoeStr(Linha,061, Trim(ConexaoBD.SQL_Produtosfb_produto_ncm.Text));
            Imprimir.PoeStr(Linha,070, Trim(Classificacao_Tributaria));
            Imprimir.PoeStr(Linha,076, Trim(Unidade_Produto));
            Imprimir.PoeStr(Linha,082, Exibe_Nro_Impressao(Trim(SGD_Produtos.Cells[1,Ind]),9));
            Imprimir.PoeStr(Linha,095, Exibe_Nro_Impressao(Trim(SGD_Produtos.Cells[6,Ind]),10));
            Imprimir.PoeStr(Linha,109, Exibe_Nro_Impressao(Trim(SGD_Produtos.Cells[7,Ind]),10));
            Imprimir.PoeStr(Linha,120, Trim(FloatToStr(Aliquota_ICMS)) + '%');

            If Trim(Copy(Trim(SGD_Produtos.Cells[8,Ind]),1, (Length(Trim(SGD_Produtos.Cells[8,Ind])) - 4))) <> '' Then
               Begin
               Imprimir.PoeStr(Linha,125, Letra_Maiuscula(Copy(Trim(SGD_Produtos.Cells[8,Ind]),1, (Length(Trim(SGD_Produtos.Cells[8,Ind])) - 4))) + '%');
               End
            Else
               Begin
               Imprimir.PoeStr(Linha,125, Letra_Maiuscula(Trim(SGD_Produtos.Cells[8,Ind])) + '%');
            End;

            Str(((StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind])) * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[8,Ind]))) / 100):13:2,Vlr_IPI_Str);
            Imprimir.PoeStr(Linha,129, Exibe_Nro_Impressao(Trim(Vlr_IPI_Str),7));

            VLR_IPI_Normal := VLR_IPI_Normal + ((StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind])) * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[8,Ind]))) / 100);

            Linha := Linha + 1;
            Conta_Produtos := Conta_Produtos + 1;

            If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
               Begin

               If Produto_Detalhada_2 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_2) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_3 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_3) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_4 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_4) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_5 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_5) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_6 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_6) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_7 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_7) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_8 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_8) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_9 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_9) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_10 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_10) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_11 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_11) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_12 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_12) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_13 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_13) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_14 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_14) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_15 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_15) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_16 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_16) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_17 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_17) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_18 <> '' Then
                  Begin
                  Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_18) );
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

            End;
         End;
     End;

     If Total_NF_IPI.Checked Then
        Begin
        BC_ICMS_Normal := BC_ICMS_Normal + VLR_IPI_Normal;
     End;

     BC_ICMS_Normal := (BC_ICMS_Normal - ((BC_ICMS_Normal * Base_ICMS_Reduzida) / 100));

     If Zera_Base_ICMS.Checked = True Then
        Begin
        BC_ICMS_Normal       := 0;
        BC_ICMS_Reduzida     := 0;
        BC_ICMS_Substituicao := 0;
        Cliente_Aliquota_ICMS.Text := '0';
     End;

     Total_Produtos := (13 - Conta_Produtos);

     If Total_Produtos <= 0 Then
        Begin
        Total_produtos := 0;
     End;

     Linha := Linha + Total_Produtos;

     //*** Início - Observação no Corpo da Nota ***

     If Observacao_Corpo_Nota.Checked = True Then
        Begin
        Observacao_4 := Observacao_Nota.Text;
        End
     Else
        Begin
        Observacao_4 := '';
     End;

     //Linha := Linha + 1;
     //If (Trim(Observacao_4) <> '') Then
     //   Begin
     //   Imprimir.PoeStr(Linha,005, Letra_Maiuscula(Copy(Trim(Observacao_4),1,62)) );
     //End;

     //Linha := Linha + 1;
     //If (Trim(Observacao_4) <> '') Then
     //    Begin
     //    Imprimir.PoeStr(Linha,005, Letra_Maiuscula(Copy(Trim(Observacao_4),63,62)) );
     //End;

     Linha := Linha + 1;
     //If (Trim(Observacao_4) <> '') Then
     //   Begin
     //   Imprimir.PoeStr(Linha,030, Letra_Maiuscula(Copy(Trim(Observacao_4),125,62)) );
     //End;

     //*** Final - Observação no Corpo da Nota ***

     //*** Preparacao para Impressao do ICMS ***

     Bonificacao := StrToFloat(Ponto_Virgula(Cliente_Desconto.Text));

     If Bonificacao > 0 Then
        Begin
        If BC_ICMS_Normal > 0 Then
           Begin
           BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
        End;

        If BC_ICMS_Reduzida > 0 Then
           Begin
           BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
        End;
     End;

     If ((Pos('OUTRA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('RETORNO',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('REMESSA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('IMPORTA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0)) Then
        Begin
        If BC_ICMS_Normal > 0 Then
           Begin
           If Trim(Cliente_Estado.Text) = 'SP' Then
              Begin

              If Nota_Consumo.Checked Then
                 Begin

                 VLR_ICMS_Normal := (((Vlr_Total_Produtos + VLR_IPI_Normal) * 18) / 100);

                 End
              Else
                 Begin

                 If Trim(Codigo_CFOP_2) <> '' Then
                    Begin
                    VLR_ICMS_Normal := (((BC_ICMS_Normal - BC_ICMS_Normal_Sub) * 18) / 100);
                    End
                 Else
                    Begin
                    VLR_ICMS_Normal := ((BC_ICMS_Normal * 18) / 100);
                 End;

              End;

              End
           Else
              Begin

              If Nota_Consumo.Checked Then
                 Begin
                 VLR_ICMS_Normal := (((Vlr_Total_Produtos + VLR_IPI_Normal) * Aliquota_ICMS) / 100);
                 End
              Else
                 Begin
                 VLR_ICMS_Normal := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
              End;

           End;
        End;
        End
     Else
        Begin
        If BC_ICMS_Normal > 0 Then
           Begin

           If Nota_Consumo.Checked Then
              Begin
              VLR_ICMS_Normal := (((Vlr_Total_Produtos + VLR_IPI_Normal) * Aliquota_ICMS) / 100);
              End
           Else
              Begin
              VLR_ICMS_Normal := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
           End;

        End;
     End;

     If ((Pos('OUTRA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('RETORNO',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('REMESSA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('IMPORTA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0)) Then
        Begin
        If BC_ICMS_Reduzida > 0 Then
           Begin
           VLR_ICMS_Reduzida := ((BC_ICMS_Reduzida * Aliquota_ICMS_Reducao) / 100);
        End;
        End
     Else
        Begin
        If BC_ICMS_Reduzida > 0 Then
           Begin
           VLR_ICMS_Reduzida := ((BC_ICMS_Reduzida * Aliquota_ICMS_Reducao) / 100);
        End;
     End;

     BC_ICMS_Normal := BC_ICMS_Normal - VLR_ICMS_Reduzida;

     If ((Pos('OUTRA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('RETORNO',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('REMESSA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0) And (Pos('IMPORTA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) <= 0)) Then
        Begin
        If BC_ICMS_Reduzida > 0 Then
           Begin
           If Trim(Cliente_Estado.Text) = 'SP' Then
              Begin
              Observacao_3 := '';
              End
           Else
              Begin
              Observacao_3 := '';
           End;
           End
        Else
           Begin
           Observacao_3 := '';
        End;
        End
     Else
        Begin
        Observacao_3 := '';
     End;

     Linha := Linha + 1;

     Str((BC_ICMS_Normal):13:2,BC_ICMS_Str);

     VLR_ICMS_Normal := (BC_ICMS_Normal * Aliquota_ICMS) / 100;

     Str((VLR_ICMS_Normal):13:2,Vlr_ICMS_Str);
     Str(VLR_IPI_Normal:13:2,Vlr_IPI_Str);

     Linha := Linha + 3;

     If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        BC_ICMS_Str  := '0.00';
        Vlr_ICMS_Str := '0.00';
     End;

     Imprimir.PoeStr(Linha,017, Exibe_Nro_Impressao(Trim(BC_ICMS_Str),10));
     Imprimir.PoeStr(Linha,045, Exibe_Nro_Impressao(Trim(Vlr_ICMS_Str),10));

     //*** Finalizacao para Impressao do ICMS e IPI ***

     Imprimir.PoeStr(Linha,120, Exibe_Nro_Impressao(Trim(Vlr_Total_Produtos_Str),10));

     Linha := Linha + 2;
     Imprimir.PoeStr(Linha,017, Exibe_Nro_Impressao(Trim(Vlr_Frete_Str),10));
     Imprimir.PoeStr(Linha,099, Exibe_Nro_Impressao(Trim(Vlr_IPI_Str),10));

     If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        Str((Vlr_Suframa):13:2,Vlr_Total_Produtos_Str);
        End
     Else
        Begin
        If Total_NF_IPI.Checked Then
           Begin
           Str((Vlr_Total_Produtos + VLR_IPI_Normal):13:2,Vlr_Total_Produtos_Str);
           End
        Else
           Begin
           Str((Vlr_Total_Produtos):13:2,Vlr_Total_Produtos_Str);
        End;
     End;

     Imprimir.PoeStr(Linha,120, Exibe_Nro_Impressao(Trim(Vlr_Total_Produtos_Str),10));

     Linha := Linha + 3;
     Transportadora := Obtem_Depois_Traco(Cliente_Transportadora.Text);
     Codigo_Transportadora.Text := Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text);

     Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Transportadora));

     If Trim(Cliente_Pgto_Frete.text) = 'Cliente' Then
        Begin
        Imprimir.PoeStr(Linha,082, '2');
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,082, '1');
     End;

     //*** Obtem dados da Transportadora ***

     ConexaoBD.SQL_Transportadoras.Close;
     ConexaoBD.SQL_Transportadoras.SQL.Clear;
     ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_numero = ' + Trim(Codigo_Transportadora.Text) + ' Order By fb_transportadora_nome');
     ConexaoBD.SQL_Transportadoras.Open;

     Imprimir.PoeStr(Linha,114, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_cnpj.Text));

     Linha := Linha + 2;
     If Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_complemento.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,003, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_endereco.Text) + ' - ' + Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_complemento.Text));
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,003, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_endereco.Text));
     End;

     Imprimir.PoeStr(Linha,074, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_cidade.Text));
     Imprimir.PoeStr(Linha,107, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_estado.Text));
     Imprimir.PoeStr(Linha,114, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_insc_est.Text));

     Linha  := Linha + 2;
     Volume := Prepara_Volume(Posicao_Inicial, Posicao_Final);
     Volume := Trim(Qtde_Volume.Text);

     If Trim(Volume) = '' Then
        Begin
        Volume := '0';
     End;

     Imprimir.PoeStr(Linha,003, Exibe_Nro_Impressao(Trim(Qtde_Volume.Text),10) );
     Imprimir.PoeStr(Linha,021, Letra_Maiuscula(Trim(Especie.Text)) );
     Imprimir.PoeStr(Linha,046, Letra_Maiuscula(Trim(Marca.Text)) );

     Imprimir.PoeStr(Linha,102, Exibe_Nro_Impressao(Trim(Peso_Bruto.Text),7)+' Kg');
     Imprimir.PoeStr(Linha,125, Exibe_Nro_Impressao(Trim(Peso_Liquido.Text),7)+' Kg');

     Str((Peso/1000):13:3,Valor_Str);
     Valor_Str := Ponto_Virgula(Trim(Valor_Str));

     //*** Endereço de Entrega ***

     Linha := Linha + 3;
     Endereco_Entrega := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_Cliente_Endereco_Entrega.Text));

     If Trim(ConexaoBD.SQL_Clientesfb_Cliente_Complemento_Entrega.Text) <> '' Then
        Begin
        Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_Cliente_Complemento_Entrega.Text));
     End;

     Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_Cliente_Bairro_Entrega.Text));
     Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_Cliente_Cidade_Entrega.Text));
     Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_Cliente_Estado_Entrega.Text));
     Endereco_Entrega := Endereco_Entrega + ' - CEP:' + Trim(ConexaoBD.SQL_Clientesfb_Cliente_Cep_Entrega.Text);
     Endereco_Entrega := Copy(Endereco_Entrega,1,33);

     { If Trim(Empresa.Text) = 'Monibras' Then
        Begin
        Imprimir.PoeStr(Linha,025, '1-DOCUMENTO EMITIDO POR ME OU EPP OPTANTE');
        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,025, 'PELO SIMPLES NACIONAL.                   ');
        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,025, '2-NAO GERA DIREITO A CREDITO DE ICMS E DE');
        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,025, 'ISS. RESOLUCAO CGSN NO 10 DE 2007.       ');
        Linha := Linha + 1;
        End
     Else
        Begin  }
        If Trim(Cliente_Ordem_Compra.Text) <> '' Then
           Begin
           Observacao_4 := 'NRO.OC: ' + Trim(Cliente_Ordem_Compra.Text) + ' || ' + Observacao_4;
        End;

        If (Trim(Observacao_4) <> '') Then
            Begin
            Imprimir.PoeStr(Linha,025, Letra_Maiuscula(Copy(Trim(Observacao_4),001,042)) );
        End;

        Linha := Linha + 1;
        If (Trim(Observacao_4) <> '') Then
            Begin
            Imprimir.PoeStr(Linha,025, Letra_Maiuscula(Copy(Trim(Observacao_4),043,042)) );
        End;

        Linha := Linha + 1;
        If (Trim(Observacao_4) <> '') Then
            Begin
            Imprimir.PoeStr(Linha,025, Letra_Maiuscula(Copy(Trim(Observacao_4),085,042)) );
        End;

        Linha := Linha + 1;
        If (Trim(Observacao_4) <> '') Then
            Begin
            Imprimir.PoeStr(Linha,025, Letra_Maiuscula(Copy(Trim(Observacao_4),127,042)) );
        End;

        Linha := Linha + 1;
        If (Trim(Observacao_4) <> '') Then
            Begin
            Imprimir.PoeStr(Linha,025, Letra_Maiuscula(Copy(Trim(Observacao_4),169,042)) );
        End;

        Linha := Linha + 1;
        If (Trim(Observacao_4) <> '') Then
            Begin
            Imprimir.PoeStr(Linha,025, Letra_Maiuscula(Copy(Trim(Observacao_4),211,042)) );
        End;

     // End;

     Linha := Linha + 3;
     Imprimir.PoeStr(Linha,120, Exibe_Nro_Impressao(Trim(ETP_Numero_Nota.Text),7));

     Imprimir.ImprimeJob;
     Imprimir.LimpaBuffer;

     Altera_Faturado();

     If Imprimir_Tela.Checked = True Then
        Begin
        Application.CreateForm(TNotasFiscaisSaidas04,NotasFiscaisSaidas04);

        NotasFiscaisSaidas04.Descricao_LPT.Lines.LoadFromFile('C:\Ibrasmak\NF_Tela.TXT');

        Seta();

        NotasFiscaisSaidas04.QR_LPT.Preview;
        NotasFiscaisSaidas04.QR_LPT.Destroy;
        NotasFiscaisSaidas04.Destroy;
        End
     Else
        Begin
        Grava_Nota_Monibras(Posicao_Inicial, Posicao_Final);

        If Tipo_Nota_Emissao.Text = 'NFe' Then
           Begin
           BT_Imprimir.Enabled := False;

           //*** Marca o Pedido como Liberado ***
           Comando_SQL := 'Update faturados Set faturado_status = ' +#39+ 'Faturado' +#39+ ' Where faturado_pedido_numero = ' + Trim(Nro_Pedido.Text);

           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           If Total_NF_IPI.Checked Then
              Begin
              winExec(PChar('C:\Arquivos de Programas\Mozilla Firefox\firefox.exe http://192.168.0.1:8081/sistemas/monibras_nfe/mgt_nfe_emissao.php?mgt_pedido_numero=' + Trim(ETP_Numero_Nota.Text)+'&vol='+Trim(Qtde_Volume.Text)+'&especie='+Trim(Troca_Caracter(' ','+',Especie.Text))+'&natureza='+Trim(Troca_Caracter(' ','+',Cliente_Natureza_Operacao.Text))+'&soma_ipi=S&nro_natureza='+Trim(Obtem_Antes(Opcao_Natureza_Operacao.Text,'_'))+'&cst='+Trim(Classificacao_Tributaria)), SW_MAXIMIZE);
              //Internet Explorer *** winExec(PChar('C:\Arquivos de Programas\Internet Explorer\iexplore.exe http://servidor:8081/sistemas/ibrasmak_nfe/mgt_nfe_gera_xml.php?mgt_pedido_numero=' + Trim(ETP_Numero_Nota.Text)+'&vol='+Trim(Qtde_Volume.Text)+'&especie='+Trim(Troca_Caracter(' ','+',Especie.Text))+'&natureza='+Trim(Troca_Caracter(' ','+',Cliente_Natureza_Operacao.Text))+'&soma_ipi=S&nro_natureza='+Trim(Obtem_Antes(Opcao_Natureza_Operacao.Text,'_'))), SW_MAXIMIZE);
              End
           Else
              Begin
              winExec(PChar('C:\Arquivos de Programas\Mozilla Firefox\firefox.exe http://192.168.0.1:8081/sistemas/monibras_nfe/mgt_nfe_emissao.php?mgt_pedido_numero=' + Trim(ETP_Numero_Nota.Text)+'&vol='+Trim(Qtde_Volume.Text)+'&especie='+Trim(Troca_Caracter(' ','+',Especie.Text))+'&natureza='+Trim(Troca_Caracter(' ','+',Cliente_Natureza_Operacao.Text))+'&nro_natureza='+Trim(Obtem_Antes(Opcao_Natureza_Operacao.Text,'_'))+'&cst='+Trim(Classificacao_Tributaria)), SW_MAXIMIZE);
              //Internet Explorer *** winExec(PChar('C:\Arquivos de Programas\Internet Explorer\iexplore.exe http://servidor:8081/sistemas/ibrasmak_nfe/mgt_nfe_gera_xml.php?mgt_pedido_numero=' + Trim(ETP_Numero_Nota.Text)+'&vol='+Trim(Qtde_Volume.Text)+'&especie='+Trim(Troca_Caracter(' ','+',Especie.Text))+'&natureza='+Trim(Troca_Caracter(' ','+',Cliente_Natureza_Operacao.Text))+'&nro_natureza='+Trim(Obtem_Antes(Opcao_Natureza_Operacao.Text,'_'))), SW_MAXIMIZE);
           End;
        End;

        NotasFiscaisSaidas02.Close;
     End;

     Seta();
end;

procedure TNotasFiscaisSaidas02.Imprime_OS_Monibras(Posicao_Inicial, Posicao_Final: Integer);

var
   Linha: Integer;
   Descricao, Observacao_4: String;
   Endereco_Entrega, Fone_Entrega: String;
   Ind, Total_Produtos, Total_Papeleta: Integer;

   Peso, Total_Nro, Porcentagem_Nro, Frete_Nro, IPI_Nro, Vlr_IPI: Real;
   Unidade: Real;
   Erro, Conta_produtos: Integer;
   Total_Str, Porcentagem_Str, Valor_Str: String;

begin
     Ampulheta();

     For Total_Papeleta := 1 To 1 Do
         Begin

     //*** Prepara o Cálculo dos Valores ***

     Total_Nota           := 0;
     Total_Desconto       := 0;
     Vlr_Desconto         := 0;
     Vlr_Frete            := 0;
     Porcentagem_Desconto := 0;
     Conta_Produtos       := 0;

     Vlr_IPI_Str := Trim(Virgula_Ponto(Valor_IPI.Text));
     Val(Vlr_IPI_Str,IPI_Nro,Erro);
     Vlr_IPI := IPI_Nro;

     Vlr_Frete_Str := Trim(Virgula_Ponto(Valor_Frete.Text));
     Val(Vlr_Frete_Str,Frete_Nro,Erro);
     Vlr_Frete := Frete_Nro;

     Porcentagem_Str := Trim(Virgula_Ponto(Cliente_Desconto.Text));
     Val(Porcentagem_Str,Porcentagem_Nro,Erro);
     Porcentagem_Desconto := Porcentagem_Nro;

     Conta_Produtos := Posicao_Inicial;

     For Ind := Posicao_Inicial To Posicao_Final Do
         Begin
         If Trim(SGD_Produtos.Cells[6,Ind]) <> '' Then
            Begin
            Total_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[7,Ind]));
            Val(Total_Str,Total_Nro,Erro);

            Total_Nota     := Total_Nota + Total_Nro;
            Conta_Produtos := Conta_Produtos + 1;
         End;
     End;

     Conta_Produtos := Conta_Produtos - 1;
     Posicao_Final  := Conta_Produtos;

     Total_Desconto := (Total_Nota - ((Total_Nota * Porcentagem_Desconto) / 100));
     Vlr_Desconto   := ((Total_Nota * Porcentagem_Desconto) / 100);
     Total_Desconto := (Total_Desconto + Vlr_Frete);

     Str(Total_Nota:13:2,Total_Nota_Str);
     Str(Total_Desconto:13:2,Total_Desconto_Str);
     Str(Vlr_Desconto:13:2,Vlr_Desconto_Str);
     Str(Porcentagem_Desconto:7:3,Porcentagem_Desconto_Str);
     Str(Vlr_Frete:13:2,Vlr_Frete_Str);

     //*** Inicializa as Variáveis ***

     Descricao     := '';
     Observacao_4  := '';

     Peso          := 0;
     Unidade       := 0;

     //*** Processo de Preparação para Emissão do Orçamento ***

     Imprimir.Linhas := 66;

     Linha := 1;
     Imprimir.PoeStr(Linha,001, #15 + '************************************************************************************************************************************');

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,001, '* Monibras');
     Imprimir.PoeStr(Linha,115, 'Data:');
     Imprimir.PoeStr(Linha,121, DateToStr(Date()));
     Imprimir.PoeStr(Linha,132, '*');

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,001, '*');
     Imprimir.PoeStr(Linha,048, 'CARTA DE COBRANCA');
     Imprimir.PoeStr(Linha,115, 'Hora:');
     Imprimir.PoeStr(Linha,121, TimeToStr(Time()));
     Imprimir.PoeStr(Linha,132, '*');

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,001, '*');
     Imprimir.PoeStr(Linha,066, 'Natureza de Operação:');
     Imprimir.PoeStr(Linha,088, Trim(Cliente_Natureza_Operacao.Text));
     Imprimir.PoeStr(Linha,106, 'Cobranca.Nro.:');
     Imprimir.PoeStr(Linha,121, Trim(ETP_Numero_Nota.Text));
     Imprimir.PoeStr(Linha,132, '*');

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,001, '************************************************************************************************************************************');

     Linha := Linha + 2;
     Imprimir.PoeStr(Linha,001, 'Cliente');

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,001, '-------');

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,001, 'Código..: ' + Trim(Cliente_Codigo.Text));

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,001, 'Nome....: ' + Letra_Maiuscula(Cliente_Nome.Text));

     Linha := Linha + 1;
     Endereco_Entrega := UpperCase(Trim(Cliente_Endereco.Text));

     If Trim(Cliente_Complemento.Text) <> '' Then
        Begin
        Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(Cliente_Complemento.Text));
     End;

     Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(Cliente_Bairro.Text));
     Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(Cliente_Cidade.Text));
     Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(Cliente_Estado.Text));
     Endereco_Entrega := Endereco_Entrega + ' - CEP:' + Trim(Cliente_Cep.Text);
     Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(Cliente_Pais.Text));

     Imprimir.PoeStr(Linha,001, 'Endereço: ' + Letra_Maiuscula(Endereco_Entrega));

     Linha := Linha + 1;
     Fone_Entrega := ' ';

     If Trim(Cliente_DDD.Text) <> '' Then
        Begin
        Fone_Entrega := Fone_Entrega + 'DDD: ' + UpperCase(Trim(Cliente_DDD.Text)) + ' / ';
     End;

     If Trim(Cliente_Fone_Ramal.Text) <> '' Then
        Begin
        Fone_Entrega := Fone_Entrega + 'Ramal: ' + UpperCase(Trim(Cliente_Fone_Ramal.Text)) + ' / ';
     End;

     If Trim(Cliente_Fone_Comercial.Text) <> '' Then
        Begin
        Fone_Entrega := Fone_Entrega + 'Comercial: ' + UpperCase(Trim(Cliente_Fone_Comercial.Text)) + ' / ';
     End;

     If Trim(Cliente_Fone_Residencial.Text) <> '' Then
        Begin
        Fone_Entrega := Fone_Entrega + 'Residencial: ' + UpperCase(Trim(Cliente_Fone_Residencial.Text)) + ' / ';
     End;

     If Trim(Cliente_Fone_Celular.Text) <> '' Then
        Begin
        Fone_Entrega := Fone_Entrega + 'Celular: ' + UpperCase(Trim(Cliente_Fone_Celular.Text)) + ' / ';
     End;

     If Trim(Cliente_Fone_Fax.Text) <> '' Then
        Begin
        Fone_Entrega := Fone_Entrega + 'FAX: ' + UpperCase(Trim(Cliente_Fone_Fax.Text)) + ' / ';
     End;

     If Trim(Cliente_Email.Text) <> '' Then
        Begin
        Fone_Entrega := Fone_Entrega + 'E-Mail: ' + UpperCase(Trim(Cliente_Email.Text));
     End;

     Imprimir.PoeStr(Linha,001, 'Telefone:');
     Imprimir.PoeStr(Linha,011, Letra_Maiuscula(Fone_Entrega) );

     Linha := Linha + 1;
     Observacao_4 := Observacao_Nota.Text;
     If Trim(Observacao_4) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,001, 'OBS.....:');
        Imprimir.PoeStr(Linha,011, Letra_Maiuscula(Copy(Trim(Observacao_4),1,70)) );
     End;

     Linha := Linha + 2;
     Imprimir.PoeStr(Linha,001, 'Nro.Cobranca  Nro.OS      Data        Cond.Pgto / Vencto   Bonificação');

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,001, '------------  ----------  ----------  ------------------   -----------');

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,001, Trim(ETP_Numero_Nota.Text));
     Imprimir.PoeStr(Linha,015, Trim(Nro_Pedido.Text));
     Imprimir.PoeStr(Linha,027, Trim(ETP_Data_Emissao_Nota.Text));

//******************************************************************************************

     If Trim(Cliente_Condicao_Pgto_1) = 'À VISTA' Then
          Cliente_Condicao_Pgto_1 := '0';

     If Trim(Cliente_Condicao_Pgto_2) = 'À VISTA' Then
          Cliente_Condicao_Pgto_1 := '0';

     If Trim(Cliente_Condicao_Pgto_3) = 'À VISTA' Then
          Cliente_Condicao_Pgto_1 := '0';

     If Trim(Cliente_Condicao_Pgto_4) = 'À VISTA' Then
          Cliente_Condicao_Pgto_1 := '0';

//******************************************************************************************

     If (Trim(Cliente_Condicao_Pgto_4) <> '') And (Trim(Cliente_Condicao_Pgto_4) <> '0')  Then
        Begin
        Imprimir.PoeStr(Linha,039, Trim(Cliente_Condicao_Pgto_1) + ' / ' + Trim(Cliente_Condicao_Pgto_2) + ' / ' + Trim(Cliente_Condicao_Pgto_3) + ' / ' +  Trim(Cliente_Condicao_Pgto_4) + ' D.D.');
        End
     Else If (Trim(Cliente_Condicao_Pgto_3) <> '') And (Trim(Cliente_Condicao_Pgto_3) <> '0')  Then
        Begin
        Imprimir.PoeStr(Linha,039, Trim(Cliente_Condicao_Pgto_1) + ' / ' + Trim(Cliente_Condicao_Pgto_2) + ' / ' + Trim(Cliente_Condicao_Pgto_3) + ' D.D.');
        End
     Else If (Trim(Cliente_Condicao_Pgto_2) <> '') And (Trim(Cliente_Condicao_Pgto_2) <> '0') Then
        Begin
        Imprimir.PoeStr(Linha,039, Trim(Cliente_Condicao_Pgto_1) + ' / ' + Trim(Cliente_Condicao_Pgto_2) + ' D.D.');
        End
     Else If (Trim(Cliente_Condicao_Pgto_1) <> '') And (Trim(Cliente_Condicao_Pgto_1) <> '0') Then
        Begin
        Imprimir.PoeStr(Linha,039, DateToStr((StrToDate(Trim(ETP_Data_Emissao_Nota.Text)) + StrToInt(Cliente_Condicao_Pgto_1))));
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,039, 'À VISTA');
     End;

     Imprimir.PoeStr(Linha,065, Trim(Porcentagem_Str) + ' %');

     Prepara_Condicao();

     Linha := Linha + 1;

     If (((Trim(Cliente_Condicao_Pgto_1) <> '') And (Trim(Cliente_Condicao_Pgto_1) <> '0')) And ((Trim(Cliente_Condicao_Pgto_2) <> '') And (Trim(Cliente_Condicao_Pgto_2) <> '0')) And ((Trim(Cliente_Condicao_Pgto_3) <> '') And (Trim(Cliente_Condicao_Pgto_3) <> '0')) And ((Trim(Cliente_Condicao_Pgto_4) <> '') And (Trim(Cliente_Condicao_Pgto_4) <> '0'))) Then
        Begin
        Imprimir.PoeStr(Linha,039, Trim(Nro_Nota_Desd_1) + ' - ' + Trim(Dt_Vcto_Desd_1) + ' - R$ ' + Trim(Vlr_Str_Desd_1));

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,039, Trim(Nro_Nota_Desd_2) + ' - ' + Trim(Dt_Vcto_Desd_2) + ' - R$ ' + Trim(Vlr_Str_Desd_2));

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,039, Trim(Nro_Nota_Desd_3) + ' - ' + Trim(Dt_Vcto_Desd_3) + ' - R$ ' + Trim(Vlr_Str_Desd_3));

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,039, Trim(Nro_Nota_Desd_4) + ' - ' + Trim(Dt_Vcto_Desd_4) + ' - R$ ' + Trim(Vlr_Str_Desd_4));
        End
     Else If (((Trim(Cliente_Condicao_Pgto_1) <> '') And (Trim(Cliente_Condicao_Pgto_1) <> '0')) And ((Trim(Cliente_Condicao_Pgto_2) <> '') And (Trim(Cliente_Condicao_Pgto_2) <> '0')) And ((Trim(Cliente_Condicao_Pgto_3) <> '') And (Trim(Cliente_Condicao_Pgto_3) <> '0'))) Then
        Begin
        Imprimir.PoeStr(Linha,039, Trim(Nro_Nota_Desd_1) + ' - ' + Trim(Dt_Vcto_Desd_1) + ' - R$ ' + Trim(Vlr_Str_Desd_1));

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,039, Trim(Nro_Nota_Desd_2) + ' - ' + Trim(Dt_Vcto_Desd_2) + ' - R$ ' + Trim(Vlr_Str_Desd_2));

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,039, Trim(Nro_Nota_Desd_3) + ' - ' + Trim(Dt_Vcto_Desd_3) + ' - R$ ' + Trim(Vlr_Str_Desd_3));
        End
     Else If (((Trim(Cliente_Condicao_Pgto_1) <> '') And (Trim(Cliente_Condicao_Pgto_1) <> '0')) And ((Trim(Cliente_Condicao_Pgto_2) <> '') And (Trim(Cliente_Condicao_Pgto_2) <> '0'))) Then
        Begin
        Imprimir.PoeStr(Linha,039, Trim(Nro_Nota_Desd_1) + ' - ' + Trim(Dt_Vcto_Desd_1) + ' - R$ ' + Trim(Vlr_Str_Desd_1));

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,039, Trim(Nro_Nota_Desd_2) + ' - ' + Trim(Dt_Vcto_Desd_2) + ' - R$ ' + Trim(Vlr_Str_Desd_2));
     End;

     Linha := Linha + 1;
     If Trim(Cliente_Emite_Lote.Text) = 'Sim' Then
        Begin
        Imprimir.PoeStr(Linha,001, 'Produto                                                                                  Lote    Qtde  Vlr.Unitário     Vlr.Total');

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,001, '--------------------------------------------------------------------------------- ----------- ------- ------------- -------------');
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,001, 'Produto                                                                                          Qtde  Vlr.Unitário     Vlr.Total');

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,001, '--------------------------------------------------------------------------------------------- ------- ------------- -------------');
     End;

     Linha := Linha + 1;

     Conta_Produtos := 0;

     For Ind := Posicao_Inicial To Posicao_Final Do
         Begin
         Imprimir.PoeStr(Linha,001, Letra_Maiuscula(Trim(SGD_Produtos.Cells[4,Ind])) );

         If Trim(Cliente_Emite_Lote.Text) = 'Sim' Then
            Begin
            Imprimir.PoeStr(Linha,083, Exibe_Nro_Impressao(Trim(SGD_Produtos.Cells[5,Ind]),11) );
         End;

         //*** Busca Algumas Informações do Produto ***

         ConexaoBD.SQL_FB_Produtos.Close;
         ConexaoBD.SQL_FB_Produtos.SQL.Clear;
         ConexaoBD.SQL_FB_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' +#39+ Trim(SGD_Produtos.Cells[2,Ind]) + #39);
         ConexaoBD.SQL_FB_Produtos.Open;

         Peso    := Peso + ((ConexaoBD.SQL_FB_Produtosfb_produto_peso.AsVariant) * (StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[1,Ind])) / 100));
         Unidade := Unidade + StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[1,Ind]));

         //*** Continua o Processo de Impressao ***

         Imprimir.PoeStr(Linha,095, Exibe_Nro_Impressao(Trim(SGD_Produtos.Cells[1,Ind]),7));
         Imprimir.PoeStr(Linha,103, Exibe_Nro_Impressao(Trim(SGD_Produtos.Cells[6,Ind]),13));
         Imprimir.PoeStr(Linha,117, Exibe_Nro_Impressao(Trim(SGD_Produtos.Cells[7,Ind]),13));

         Linha          := Linha + 1;
         Conta_Produtos := Conta_Produtos + 1;
     End;

     Total_Produtos := (14 - Conta_Produtos);

     If Total_Produtos <= 0 Then
        Begin
        Total_produtos := 0;
     End;

     //Linha := Linha + Total_Produtos;
     Imprimir.PoeStr(Linha,001, '---------------------------------------------------------------------------------------------------------------------------------');

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,053, 'Sub-Total');
     Imprimir.PoeStr(Linha,075, Exibe_Nro_Impressao(Trim(Total_Nota_Str),13));

     Linha := Linha + 1;
     If (Trim(Total_Desconto_Str) <> '') And (Trim(Total_Desconto_Str) <> '0,00') Then
        Begin
        Imprimir.PoeStr(Linha,053, 'Desconto de ');
        Imprimir.PoeStr(Linha,065, Trim(Porcentagem_Str) + '%' );
        Imprimir.PoeStr(Linha,075, Exibe_Nro_Impressao(Trim(Vlr_Desconto_Str),13));
     End;

     If (Trim(Vlr_Frete_Str) <> '') And (Trim(Vlr_Frete_Str) <> '0,00') Then
        Begin
        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,053, '-----------------------------------');

        Linha := Linha + 1;
        Imprimir.PoeStr(Linha,053, 'Frete');
        Imprimir.PoeStr(Linha,075, Exibe_Nro_Impressao(Trim(Vlr_Frete_Str),13));
     End;

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,053, '-----------------------------------');

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,053, 'Total');
     Imprimir.PoeStr(Linha,075, Exibe_Nro_Impressao(Trim(Total_Desconto_Str),13));

     //Linha  := Linha + 1;
     Volume := Prepara_Volume(Posicao_Inicial, Posicao_Final);
     Volume := Trim(Qtde_Volume.Text);

     If Trim(Volume) = '' Then
        Begin
        Volume := '0';
     End;

     //Imprimir.PoeStr(Linha,001, 'Volume: ' + Trim(Volume));

     Str((Peso/1000):13:3,Valor_Str);
     Valor_Str := Ponto_Virgula(Trim(Valor_Str));

     //Imprimir.PoeStr(Linha,020, 'Peso:');
     //Imprimir.PoeStr(Linha,025, Exibe_Nro_Impressao(Valor_Str,9));
     //Imprimir.PoeStr(Linha,034, 'Kg');

     If Registra_OS.Checked = True Then
        Begin
        Imprimir.ArqDestino := 'C:\Ibrasmak\NF_Tela.TXT';
        Imprimir.Acentuacao := acNenhum;
     End;

     Imprimir.ImprimeJob;
     Imprimir.LimpaBuffer;

     End;

     If Imprimir_Tela.Checked = True Then
        Begin
        Application.CreateForm(TNotasFiscaisSaidas04,NotasFiscaisSaidas04);

        Seta();

        NotasFiscaisSaidas04.Descricao_LPT.Lines.LoadFromFile('C:\Ibrasmak\NF_Tela.TXT');

        NotasFiscaisSaidas04.QR_LPT.Preview;
        NotasFiscaisSaidas04.QR_LPT.Destroy;
        NotasFiscaisSaidas04.Destroy;
        End
     Else
        Begin
        Grava_OS_Monibras(Posicao_Inicial, Posicao_Final);
     End;

     Seta();
end;

procedure TNotasFiscaisSaidas02.Prepara_Condicao();

var
   Calcula_Condicao: Real;
   Data_Base_Calculo, Data_Base_Calculo_Original, Dia_Vencto: String;
   Parcelas, Posicao_Parcela, Intervalo_Dias,  Intervalo_Dias_Soma_Data, Ind: Integer;
   Primeira_Parcela: Boolean;
   cont: Integer;

begin
     //*** INICIO - Obtem os Dias de Pagamento ***

     Dia_Parcela_1   := '';
     Dia_Parcela_2   := '';
     Dia_Parcela_3   := '';
     Dia_Parcela_4   := '';
     Dia_Parcela_5   := '';
     Dia_Parcela_6   := '';
     Dia_Parcela_7   := '';
     Dia_Parcela_8   := '';
     Dia_Parcela_9   := '';
     Dia_Parcela_10  := '';
     Dia_Parcela_11  := '';
     Dia_Parcela_12  := '';
     Dia_Parcela_13  := '';
     Dia_Parcela_14  := '';
     Dia_Parcela_15  := '';
     Dia_Parcela_16  := '';
     Dia_Parcela_17  := '';
     Dia_Parcela_18  := '';
     Dia_Parcela_19  := '';
     Dia_Parcela_20  := '';
     Dia_Parcela_21  := '';
     Dia_Parcela_22  := '';
     Dia_Parcela_23  := '';
     Dia_Parcela_24  := '';

     cont := 1;

     For Ind := 1 To length(Parcela_Descricao.Text) + 1 Do
         Begin

         If (cont = 1) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 1) then
             Begin
             Dia_Parcela_1 := Dia_Parcela_1 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_1 := UpperCase(Dia_Parcela_1);
           End

           Else If (Dia_Parcela_1 = 'ATO') then
             Begin
             Dia_Parcela_1 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;

         End

         Else If (cont = 2) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 2) then
             Begin
             Dia_Parcela_2 := Dia_Parcela_2 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_2 := UpperCase(Dia_Parcela_2);
           End

           Else If (Dia_Parcela_2 = 'ATO') then
             Begin
             Dia_Parcela_2 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;

         End

         Else If (cont = 3) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 3) then
             Begin
             Dia_Parcela_3 := Dia_Parcela_3 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_3 := UpperCase(Dia_Parcela_3);
           End

           Else If (Dia_Parcela_3 = 'ATO') then
             Begin
             Dia_Parcela_3 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;

         End

         Else If (cont = 4) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 4) then
             Begin
             Dia_Parcela_4 := Dia_Parcela_4 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_4 := UpperCase(Dia_Parcela_4);
           End

           Else If (Dia_Parcela_4 = 'ATO') then
             Begin
             Dia_Parcela_4 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 5) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 5) then
             Begin
             Dia_Parcela_5 := Dia_Parcela_5 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_5 := UpperCase(Dia_Parcela_5);
           End

           Else If (Dia_Parcela_5 = 'ATO') then
             Begin
             Dia_Parcela_5 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 6) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 6) then
             Begin
             Dia_Parcela_6 := Dia_Parcela_6 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_6 := UpperCase(Dia_Parcela_6);
           End

           Else If (Dia_Parcela_6 = 'ATO') then
             Begin
             Dia_Parcela_6 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 7) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 7) then
             Begin
             Dia_Parcela_7 := Dia_Parcela_7 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_7 := UpperCase(Dia_Parcela_7);
           End

           Else If (Dia_Parcela_7 = 'ATO') then
             Begin
             Dia_Parcela_7 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 8) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 8) then
             Begin
             Dia_Parcela_8 := Dia_Parcela_8 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_8 := UpperCase(Dia_Parcela_8);
           End

           Else If (Dia_Parcela_8 = 'ATO') then
             Begin
             Dia_Parcela_8 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 9) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 9) then
             Begin
             Dia_Parcela_9 := Dia_Parcela_9 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_9 := UpperCase(Dia_Parcela_9);
           End

           Else If (Dia_Parcela_9 = 'ATO') then
             Begin
             Dia_Parcela_9 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 10) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 10) then
             Begin
             Dia_Parcela_10 := Dia_Parcela_10 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_10 := UpperCase(Dia_Parcela_10);
           End

           Else If (Dia_Parcela_10 = 'ATO') then
             Begin
             Dia_Parcela_10 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 11) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 11) then
             Begin
             Dia_Parcela_11 := Dia_Parcela_11 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_11 := UpperCase(Dia_Parcela_11);
           End

           Else If (Dia_Parcela_11 = 'ATO') then
             Begin
             Dia_Parcela_11 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 12) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 12) then
             Begin
             Dia_Parcela_12 := Dia_Parcela_12 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_12 := UpperCase(Dia_Parcela_12);
           End

           Else If (Dia_Parcela_12 = 'ATO') then
             Begin
             Dia_Parcela_12 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 13) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 13) then
             Begin
             Dia_Parcela_13 := Dia_Parcela_13 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_13 := UpperCase(Dia_Parcela_13);
           End

           Else If (Dia_Parcela_13 = 'ATO') then
             Begin
             Dia_Parcela_13 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 14) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 14) then
             Begin
             Dia_Parcela_14 := Dia_Parcela_14 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_14 := UpperCase(Dia_Parcela_14);
           End

           Else If (Dia_Parcela_14 = 'ATO') then
             Begin
             Dia_Parcela_14 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 15) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 15) then
             Begin
             Dia_Parcela_15 := Dia_Parcela_15 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_15 := UpperCase(Dia_Parcela_15);
           End

           Else If (Dia_Parcela_15 = 'ATO') then
             Begin
             Dia_Parcela_15 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 16) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 16) then
             Begin
             Dia_Parcela_16 := Dia_Parcela_16 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_16 := UpperCase(Dia_Parcela_16);
           End

           Else If (Dia_Parcela_16 = 'ATO') then
             Begin
             Dia_Parcela_16 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 17) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 17) then
             Begin
             Dia_Parcela_17 := Dia_Parcela_17 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_17 := UpperCase(Dia_Parcela_17);
           End

           Else If (Dia_Parcela_17 = 'ATO') then
             Begin
             Dia_Parcela_17 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 18) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 18) then
             Begin
             Dia_Parcela_18 := Dia_Parcela_18 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_18 := UpperCase(Dia_Parcela_18);
           End

           Else If (Dia_Parcela_18 = 'ATO') then
             Begin
             Dia_Parcela_18 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 19) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 19) then
             Begin
             Dia_Parcela_19 := Dia_Parcela_19 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_19 := UpperCase(Dia_Parcela_19);
           End

           Else If (Dia_Parcela_19 = 'ATO') then
             Begin
             Dia_Parcela_19 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 20) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 20) then
             Begin
             Dia_Parcela_20 := Dia_Parcela_20 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_20 := UpperCase(Dia_Parcela_20);
           End

           Else If (Dia_Parcela_20 = 'ATO') then
             Begin
             Dia_Parcela_20 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 21) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 21) then
             Begin
             Dia_Parcela_21 := Dia_Parcela_21 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_21 := UpperCase(Dia_Parcela_21);
           End

           Else If (Dia_Parcela_21 = 'ATO') then
             Begin
             Dia_Parcela_21 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 22) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 22) then
             Begin
             Dia_Parcela_22 := Dia_Parcela_22 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_22 := UpperCase(Dia_Parcela_22);
           End

           Else If (Dia_Parcela_22 = 'ATO') then
             Begin
             Dia_Parcela_22 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 23) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 23) then
             Begin
             Dia_Parcela_23 := Dia_Parcela_23 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_23 := UpperCase(Dia_Parcela_23);
           End

           Else If (Dia_Parcela_23 = 'ATO') then
             Begin
             Dia_Parcela_23 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End

         Else If (cont = 24) then
           Begin

           If (Copy(Parcela_Descricao.Text,Ind,1) <> '/') And (Copy(Parcela_Descricao.Text,Ind,1) <> '') And (cont = 24) then
             Begin
             Dia_Parcela_24 := Dia_Parcela_24 + Copy(Parcela_Descricao.Text,Ind,1);
             Dia_Parcela_24 := UpperCase(Dia_Parcela_24);
           End

           Else If (Dia_Parcela_24 = 'ATO') then
             Begin
             Dia_Parcela_24 := '0';
             cont := cont + 1;
           End

           Else
             Begin
             cont := cont + 1;
           End;
         End
     End;

     //*** FINAL - Obtem os Dias de Pagamento ***

     //*** Prepara as Condições de Pagamento ***

     Nro_Nota_Desd_1  := '';
     Nro_Nota_Desd_2  := '';
     Nro_Nota_Desd_3  := '';
     Nro_Nota_Desd_4  := '';
     Nro_Nota_Desd_5  := '';
     Nro_Nota_Desd_6  := '';
     Nro_Nota_Desd_7  := '';
     Nro_Nota_Desd_8  := '';
     Nro_Nota_Desd_9  := '';
     Nro_Nota_Desd_10 := '';
     Nro_Nota_Desd_11 := '';
     Nro_Nota_Desd_12 := '';
     Nro_Nota_Desd_13 := '';
     Nro_Nota_Desd_14 := '';
     Nro_Nota_Desd_15 := '';
     Nro_Nota_Desd_16 := '';
     Nro_Nota_Desd_17 := '';
     Nro_Nota_Desd_18 := '';
     Nro_Nota_Desd_19 := '';
     Nro_Nota_Desd_20 := '';
     Nro_Nota_Desd_21 := '';
     Nro_Nota_Desd_22 := '';
     Nro_Nota_Desd_23 := '';
     Nro_Nota_Desd_24 := '';

     Dt_Vcto_Desd_1  := '';
     Dt_Vcto_Desd_2  := '';
     Dt_Vcto_Desd_3  := '';
     Dt_Vcto_Desd_4  := '';
     Dt_Vcto_Desd_5  := '';
     Dt_Vcto_Desd_6  := '';
     Dt_Vcto_Desd_7  := '';
     Dt_Vcto_Desd_8  := '';
     Dt_Vcto_Desd_9  := '';
     Dt_Vcto_Desd_10 := '';
     Dt_Vcto_Desd_11 := '';
     Dt_Vcto_Desd_12 := '';
     Dt_Vcto_Desd_13 := '';
     Dt_Vcto_Desd_14 := '';
     Dt_Vcto_Desd_15 := '';
     Dt_Vcto_Desd_16 := '';
     Dt_Vcto_Desd_17 := '';
     Dt_Vcto_Desd_18 := '';
     Dt_Vcto_Desd_19 := '';
     Dt_Vcto_Desd_20 := '';
     Dt_Vcto_Desd_21 := '';
     Dt_Vcto_Desd_22 := '';
     Dt_Vcto_Desd_23 := '';
     Dt_Vcto_Desd_24 := '';

     Vlr_Desd_1      := 0;
     Vlr_Desd_2      := 0;
     Vlr_Desd_3      := 0;
     Vlr_Desd_4      := 0;
     Vlr_Desd_5      := 0;
     Vlr_Desd_6      := 0;
     Vlr_Desd_7      := 0;
     Vlr_Desd_8      := 0;
     Vlr_Desd_9      := 0;
     Vlr_Desd_10     := 0;
     Vlr_Desd_11     := 0;
     Vlr_Desd_12     := 0;
     Vlr_Desd_13     := 0;
     Vlr_Desd_14     := 0;
     Vlr_Desd_15     := 0;
     Vlr_Desd_16     := 0;
     Vlr_Desd_17     := 0;
     Vlr_Desd_18     := 0;
     Vlr_Desd_19     := 0;
     Vlr_Desd_20     := 0;
     Vlr_Desd_21     := 0;
     Vlr_Desd_22     := 0;
     Vlr_Desd_23     := 0;
     Vlr_Desd_24     := 0;

     Vlr_Str_Desd_1  := '';
     Vlr_Str_Desd_2  := '';
     Vlr_Str_Desd_3  := '';
     Vlr_Str_Desd_4  := '';
     Vlr_Str_Desd_5  := '';
     Vlr_Str_Desd_6  := '';
     Vlr_Str_Desd_7  := '';
     Vlr_Str_Desd_8  := '';
     Vlr_Str_Desd_9  := '';
     Vlr_Str_Desd_10 := '';
     Vlr_Str_Desd_11 := '';
     Vlr_Str_Desd_12 := '';
     Vlr_Str_Desd_13 := '';
     Vlr_Str_Desd_14 := '';
     Vlr_Str_Desd_15 := '';
     Vlr_Str_Desd_16 := '';
     Vlr_Str_Desd_17 := '';
     Vlr_Str_Desd_18 := '';
     Vlr_Str_Desd_19 := '';
     Vlr_Str_Desd_20 := '';
     Vlr_Str_Desd_21 := '';
     Vlr_Str_Desd_22 := '';
     Vlr_Str_Desd_23 := '';
     Vlr_Str_Desd_24 := '';

     Forma_Desd_1    := '';
     Forma_Desd_2    := '';
     Forma_Desd_3    := '';
     Forma_Desd_4    := '';
     Forma_Desd_5    := '';
     Forma_Desd_6    := '';
     Forma_Desd_7    := '';
     Forma_Desd_8    := '';
     Forma_Desd_9    := '';
     Forma_Desd_10   := '';
     Forma_Desd_11   := '';
     Forma_Desd_12   := '';
     Forma_Desd_13   := '';
     Forma_Desd_14   := '';
     Forma_Desd_15   := '';
     Forma_Desd_16   := '';
     Forma_Desd_17   := '';
     Forma_Desd_18   := '';
     Forma_Desd_19   := '';
     Forma_Desd_20   := '';
     Forma_Desd_21   := '';
     Forma_Desd_22   := '';
     Forma_Desd_23   := '';
     Forma_Desd_24   := '';



     If Pagamento_Vista.Checked Then
        Begin
        Cliente_Condicao_Pgto_1 := 'À VISTA';
        Forma_Desd_1            := 'À VISTA';
        Nro_Nota_Desd_1         := Trim(ETP_Numero_Nota.Text);
        Dt_Vcto_Desd_1          := DateToStr(Date());
        Vlr_Desd_1              := StrToFloat(Valor_Total.Text);
        Vlr_Str_Desd_1          := Trim(Valor_Total.Text);
        End
     Else
        Begin

        If Parcela_Pedido.Checked Then
           Begin
           Data_Base_Calculo := Pedido_Data_Inclusao.Text;
           End
        Else
           Begin
           Data_Base_Calculo := DateToStr(Date());
        End;

        If Parcela_Mes_Subsequente.Checked Then
           Begin
           Data_Base_Calculo := DateToStr(StrToDate(Data_Base_Calculo) + 30);
        End;

        If (Parcela_Vencto.Text <> '0') And (Parcela_Vencto.Text <> '') Then
           Begin
           Dia_Vencto        := Trim(Parcela_Vencto.Text);

           If Length(Dia_Vencto) <= 1 Then
              Begin
              Dia_Vencto := '0' + Trim(Dia_Vencto);
           End;

           Data_Base_Calculo := Trim(Dia_Vencto)+ Copy(Data_Base_Calculo,3,8);

           End
        Else
           Begin
           Dia_Vencto := '0';
        End;

        If StrToInt(Trim(Parcela_Prazo_Inicio.Text)) > 0 Then
           Begin
           Data_Base_Calculo := DateToStr(Date() + StrToInt(Trim(Parcela_Prazo_Inicio.Text)));
        End;

        Parcelas                 := Gera_Str_To_Nro_Int(Parcela_Nro.Text);
        Intervalo_Dias           := Gera_Str_To_Nro_Int(Parcela_Dias_Vencto.Text);
        Intervalo_Dias_Soma_Data := Gera_Str_To_Nro_Int(Parcela_Dias_Vencto.Text);

        If StrToFloat(Parcela_Vlr_Ato.Text) > 0 Then
           Begin

           If (Parcelas - 1) <= 0 Then
              Begin
              Calcula_Condicao := StrToFloat(Valor_Total.Text) - StrToFloat(Parcela_Vlr_Ato.Text);
              Calcula_Condicao := (Calcula_Condicao / 1);
              End
           Else
              Begin
              Calcula_Condicao := StrToFloat(Valor_Total.Text) - StrToFloat(Parcela_Vlr_Ato.Text);
              Calcula_Condicao := (Calcula_Condicao / (Parcelas - 1));
           End;

           End
        Else
           Begin

           If Parcelas <= 0 Then
              Begin
              Calcula_Condicao := StrToFloat(Valor_Total.Text);
              Calcula_Condicao := (Calcula_Condicao / 1);
              End
           Else
              Begin
              Calcula_Condicao := StrToFloat(Valor_Total.Text);
              Calcula_Condicao := (Calcula_Condicao / Parcelas);
           End;

        End;

        If Trim(Parcela_Descricao.Text) = '' Then
           Begin

           Primeira_Parcela := True;

           For Posicao_Parcela := 1 To Parcelas Do
               Begin

               If Posicao_Parcela = 1 Then
                  Begin

                  If StrToInt(Trim(Parcela_Prazo_Inicio.Text)) > 0 Then
                     Begin
                     Cliente_Condicao_Pgto_1 := Trim(Parcela_Prazo_Inicio.Text);
                     Forma_Desd_1            := Trim(Parcela_Prazo_Inicio.Text);
                     End
                  Else
                     Begin
                     Cliente_Condicao_Pgto_1 := IntToStr(Intervalo_Dias);
                     Forma_Desd_1            := IntToStr(Intervalo_Dias);
                  End;

                  Nro_Nota_Desd_1         := Trim(ETP_Numero_Nota.Text) + 'A';
                  Dt_Vcto_Desd_1          := Data_Base_Calculo;

                  If StrToFloat(Parcela_Vlr_Ato.Text) > 0 Then
                     Begin
                     Vlr_Desd_1 := StrToFloat(Parcela_Vlr_Ato.Text);
                     Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
                     End
                  Else
                     Begin
                     Vlr_Desd_1 := Calcula_Condicao;
                     Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
                  End;

                  End
               Else If Posicao_Parcela = 2 Then
                  Begin
                  Cliente_Condicao_Pgto_2 := IntToStr(Intervalo_Dias);
                  Forma_Desd_2            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_2         := Trim(ETP_Numero_Nota.Text) + 'B';
                  Dt_Vcto_Desd_2          := Data_Base_Calculo;
                  Vlr_Desd_2              := Calcula_Condicao;
                  Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
                  End
               Else If Posicao_Parcela = 3 Then
                  Begin
                  Cliente_Condicao_Pgto_3 := IntToStr(Intervalo_Dias);
                  Forma_Desd_3            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_3         := Trim(ETP_Numero_Nota.Text) + 'C';
                  Dt_Vcto_Desd_3          := Data_Base_Calculo;
                  Vlr_Desd_3              := Calcula_Condicao;
                  Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
                  End
               Else If Posicao_Parcela = 4 Then
                  Begin
                  Cliente_Condicao_Pgto_4 := IntToStr(Intervalo_Dias);
                  Forma_Desd_4            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_4         := Trim(ETP_Numero_Nota.Text) + 'D';
                  Dt_Vcto_Desd_4          := Data_Base_Calculo;
                  Vlr_Desd_4              := Calcula_Condicao;
                  Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
                  End
               Else If Posicao_Parcela = 5 Then
                  Begin
                  Cliente_Condicao_Pgto_5 := IntToStr(Intervalo_Dias);
                  Forma_Desd_5            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_5         := Trim(ETP_Numero_Nota.Text) + 'E';
                  Dt_Vcto_Desd_5          := Data_Base_Calculo;
                  Vlr_Desd_5              := Calcula_Condicao;
                  Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
                  End
               Else If Posicao_Parcela = 6 Then
                  Begin
                  Cliente_Condicao_Pgto_6 := IntToStr(Intervalo_Dias);
                  Forma_Desd_6            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_6         := Trim(ETP_Numero_Nota.Text) + 'F';
                  Dt_Vcto_Desd_6          := Data_Base_Calculo;
                  Vlr_Desd_6              := Calcula_Condicao;
                  Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
                  End
               Else If Posicao_Parcela = 7 Then
                  Begin
                  Cliente_Condicao_Pgto_7 := IntToStr(Intervalo_Dias);
                  Forma_Desd_7            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_7         := Trim(ETP_Numero_Nota.Text) + 'G';
                  Dt_Vcto_Desd_7          := Data_Base_Calculo;
                  Vlr_Desd_7              := Calcula_Condicao;
                  Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
                  End
               Else If Posicao_Parcela = 8 Then
                  Begin
                  Cliente_Condicao_Pgto_8 := IntToStr(Intervalo_Dias);
                  Forma_Desd_8            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_8         := Trim(ETP_Numero_Nota.Text) + 'H';
                  Dt_Vcto_Desd_8          := Data_Base_Calculo;
                  Vlr_Desd_8              := Calcula_Condicao;
                  Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
                  End
               Else If Posicao_Parcela = 9 Then
                  Begin
                  Cliente_Condicao_Pgto_9 := IntToStr(Intervalo_Dias);
                  Forma_Desd_9            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_9         := Trim(ETP_Numero_Nota.Text) + 'I';
                  Dt_Vcto_Desd_9          := Data_Base_Calculo;
                  Vlr_Desd_9              := Calcula_Condicao;
                  Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
                  End
               Else If Posicao_Parcela = 10 Then
                  Begin
                  Cliente_Condicao_Pgto_10 := IntToStr(Intervalo_Dias);
                  Forma_Desd_10            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_10         := Trim(ETP_Numero_Nota.Text) + 'J';
                  Dt_Vcto_Desd_10          := Data_Base_Calculo;
                  Vlr_Desd_10              := Calcula_Condicao;
                  Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
                  End
               Else If Posicao_Parcela = 11 Then
                  Begin
                  Cliente_Condicao_Pgto_11 := IntToStr(Intervalo_Dias);
                  Forma_Desd_11            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_11         := Trim(ETP_Numero_Nota.Text) + 'K';
                  Dt_Vcto_Desd_11          := Data_Base_Calculo;
                  Vlr_Desd_11              := Calcula_Condicao;
                  Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
                  End
               Else If Posicao_Parcela = 12 Then
                  Begin
                  Cliente_Condicao_Pgto_12 := IntToStr(Intervalo_Dias);
                  Forma_Desd_12            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_12         := Trim(ETP_Numero_Nota.Text) + 'L';
                  Dt_Vcto_Desd_12          := Data_Base_Calculo;
                  Vlr_Desd_12              := Calcula_Condicao;
                  Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
                  End
               Else If Posicao_Parcela = 13 Then
                  Begin
                  Cliente_Condicao_Pgto_13 := IntToStr(Intervalo_Dias);
                  Forma_Desd_13            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_13         := Trim(ETP_Numero_Nota.Text) + 'M';
                  Dt_Vcto_Desd_13          := Data_Base_Calculo;
                  Vlr_Desd_13              := Calcula_Condicao;
                  Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
                  End
               Else If Posicao_Parcela = 14 Then
                  Begin
                  Cliente_Condicao_Pgto_14 := IntToStr(Intervalo_Dias);
                  Forma_Desd_14            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_14         := Trim(ETP_Numero_Nota.Text) + 'N';
                  Dt_Vcto_Desd_14          := Data_Base_Calculo;
                  Vlr_Desd_14              := Calcula_Condicao;
                  Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
                  End
               Else If Posicao_Parcela = 15 Then
                  Begin
                  Cliente_Condicao_Pgto_15 := IntToStr(Intervalo_Dias);
                  Forma_Desd_15            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_15         := Trim(ETP_Numero_Nota.Text) + 'O';
                  Dt_Vcto_Desd_15          := Data_Base_Calculo;
                  Vlr_Desd_15              := Calcula_Condicao;
                  Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
                  End
               Else If Posicao_Parcela = 16 Then
                  Begin
                  Cliente_Condicao_Pgto_16 := IntToStr(Intervalo_Dias);
                  Forma_Desd_16            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_16         := Trim(ETP_Numero_Nota.Text) + 'P';
                  Dt_Vcto_Desd_16          := Data_Base_Calculo;
                  Vlr_Desd_16              := Calcula_Condicao;
                  Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
                  End
               Else If Posicao_Parcela = 17 Then
                  Begin
                  Cliente_Condicao_Pgto_17 := IntToStr(Intervalo_Dias);
                  Forma_Desd_17            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_17         := Trim(ETP_Numero_Nota.Text) + 'Q';
                  Dt_Vcto_Desd_17          := Data_Base_Calculo;
                  Vlr_Desd_17              := Calcula_Condicao;
                  Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
                  End
               Else If Posicao_Parcela = 18 Then
                  Begin
                  Cliente_Condicao_Pgto_18 := IntToStr(Intervalo_Dias);
                  Forma_Desd_18            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_18         := Trim(ETP_Numero_Nota.Text) + 'R';
                  Dt_Vcto_Desd_18          := Data_Base_Calculo;
                  Vlr_Desd_18              := Calcula_Condicao;
                  Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
                  End
               Else If Posicao_Parcela = 19 Then
                  Begin
                  Cliente_Condicao_Pgto_19 := IntToStr(Intervalo_Dias);
                  Forma_Desd_19            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_19         := Trim(ETP_Numero_Nota.Text) + 'S';
                  Dt_Vcto_Desd_19          := Data_Base_Calculo;
                  Vlr_Desd_19              := Calcula_Condicao;
                  Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
                  End
               Else If Posicao_Parcela = 20 Then
                  Begin
                  Cliente_Condicao_Pgto_20 := IntToStr(Intervalo_Dias);
                  Forma_Desd_20            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_20         := Trim(ETP_Numero_Nota.Text) + 'T';
                  Dt_Vcto_Desd_20          := Data_Base_Calculo;
                  Vlr_Desd_20              := Calcula_Condicao;
                  Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
                  End
               Else If Posicao_Parcela = 21 Then
                  Begin
                  Cliente_Condicao_Pgto_21 := IntToStr(Intervalo_Dias);
                  Forma_Desd_21            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_21         := Trim(ETP_Numero_Nota.Text) + 'U';
                  Dt_Vcto_Desd_21          := Data_Base_Calculo;
                  Vlr_Desd_21              := Calcula_Condicao;
                  Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
                  End
               Else If Posicao_Parcela = 22 Then
                  Begin
                  Cliente_Condicao_Pgto_22 := IntToStr(Intervalo_Dias);
                  Forma_Desd_22            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_22         := Trim(ETP_Numero_Nota.Text) + 'V';
                  Dt_Vcto_Desd_22          := Data_Base_Calculo;
                  Vlr_Desd_22              := Calcula_Condicao;
                  Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
                  End
               Else If Posicao_Parcela = 23 Then
                  Begin
                  Cliente_Condicao_Pgto_23 := IntToStr(Intervalo_Dias);
                  Forma_Desd_23            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_23         := Trim(ETP_Numero_Nota.Text) + 'X';
                  Dt_Vcto_Desd_23          := Data_Base_Calculo;
                  Vlr_Desd_23              := Calcula_Condicao;
                  Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
                  End
               Else If Posicao_Parcela = 24 Then
                  Begin
                  Cliente_Condicao_Pgto_24 := IntToStr(Intervalo_Dias);
                  Forma_Desd_24            := IntToStr(Intervalo_Dias);
                  Nro_Nota_Desd_24         := Trim(ETP_Numero_Nota.Text) + 'Z';
                  Dt_Vcto_Desd_24          := Data_Base_Calculo;
                  Vlr_Desd_24              := Calcula_Condicao;
                  Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);
               End;

               Data_Base_Calculo := DateToStr(StrToDate(Data_Base_Calculo) + Intervalo_Dias_Soma_Data);

               If Trim(Parcela_Dias_Vencto.Text) = '30' Then
                  Begin
                  If (Trim(Parcela_Vencto.Text) <> '') And (Trim(Parcela_Vencto.Text) <> '0') And (Trim(Parcela_Vencto.Text) <> '00') Then
                     Begin

                     If Length(Parcela_Vencto.Text) <= 1 Then
                        Begin
                        Parcela_Vencto.Text := '0' + Trim(Parcela_Vencto.Text);
                     End;

                     Data_Base_Calculo := Trim(Parcela_Vencto.Text) + Copy(Data_Base_Calculo,3,8);
                  End;
               End;

               If Primeira_Parcela Then
                  Begin

                  If StrToInt(Trim(Parcela_Prazo_Inicio.Text)) > 0 Then
                     Begin
                     Intervalo_Dias := Intervalo_Dias + StrToInt(Trim(Parcela_Prazo_Inicio.Text));
                     End
                  Else
                     Begin
                     Intervalo_Dias := Intervalo_Dias + Intervalo_Dias;
                  End;

                  End
               Else
                  Begin
                  Intervalo_Dias := Intervalo_Dias + Intervalo_Dias;
               End;

               Primeira_Parcela := False;
           End;

           End
        Else
           Begin

           Primeira_Parcela := True;

           For Posicao_Parcela := 1 To Parcelas Do
               Begin

               Data_Base_Calculo_Original := Data_Base_Calculo;

               If Posicao_Parcela = 1 Then
                  Begin
                  Data_Base_Calculo_Original  := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_1));
                  Cliente_Condicao_Pgto_1     := Trim(Dia_Parcela_1);
                  Forma_Desd_1                := Trim(Dia_Parcela_1);
                  Nro_Nota_Desd_1             := Trim(ETP_Numero_Nota.Text) + 'A';
                  Dt_Vcto_Desd_1              := Data_Base_Calculo_Original;

                  If StrToFloat(Parcela_Vlr_Ato.Text) > 0 Then
                     Begin
                     Vlr_Desd_1 := StrToFloat(Parcela_Vlr_Ato.Text);
                     Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
                     End
                  Else
                     Begin
                     Vlr_Desd_1 := Calcula_Condicao;
                     Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
                  End;
                  End
               Else If Posicao_Parcela = 2 Then
                  Begin
                  Data_Base_Calculo_Original  := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_2));
                  Cliente_Condicao_Pgto_2     := Trim(Dia_Parcela_2);
                  Forma_Desd_2                := Trim(Dia_Parcela_2);
                  Nro_Nota_Desd_2             := Trim(ETP_Numero_Nota.Text) + 'B';
                  Dt_Vcto_Desd_2              := Data_Base_Calculo_Original;
                  Vlr_Desd_2                  := Calcula_Condicao;
                  Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
                  End
               Else If Posicao_Parcela = 3 Then
                  Begin
                  Data_Base_Calculo_Original       := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_3));
                  Cliente_Condicao_Pgto_3 := Trim(Dia_Parcela_3);
                  Forma_Desd_3            := Trim(Dia_Parcela_3);
                  Nro_Nota_Desd_3         := Trim(ETP_Numero_Nota.Text) + 'C';
                  Dt_Vcto_Desd_3          := Data_Base_Calculo_Original;
                  Vlr_Desd_3              := Calcula_Condicao;
                  Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
                  End
               Else If Posicao_Parcela = 4 Then
                  Begin
                  Data_Base_Calculo_Original       := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_4));
                  Cliente_Condicao_Pgto_4 := Trim(Dia_Parcela_4);
                  Forma_Desd_4            := Trim(Dia_Parcela_4);
                  Nro_Nota_Desd_4         := Trim(ETP_Numero_Nota.Text) + 'D';
                  Dt_Vcto_Desd_4          := Data_Base_Calculo_Original;
                  Vlr_Desd_4              := Calcula_Condicao;
                  Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
                  End
               Else If Posicao_Parcela = 5 Then
                  Begin
                  Data_Base_Calculo_Original       := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_5));
                  Cliente_Condicao_Pgto_5 := Trim(Dia_Parcela_5);
                  Forma_Desd_5            := Trim(Dia_Parcela_5);
                  Nro_Nota_Desd_5         := Trim(ETP_Numero_Nota.Text) + 'E';
                  Dt_Vcto_Desd_5          := Data_Base_Calculo_Original;
                  Vlr_Desd_5              := Calcula_Condicao;
                  Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
                  End
               Else If Posicao_Parcela = 6 Then
                  Begin
                  Data_Base_Calculo_Original       := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_6));
                  Cliente_Condicao_Pgto_6 := Trim(Dia_Parcela_6);
                  Forma_Desd_6            := Trim(Dia_Parcela_6);
                  Nro_Nota_Desd_6         := Trim(ETP_Numero_Nota.Text) + 'F';
                  Dt_Vcto_Desd_6          := Data_Base_Calculo_Original;
                  Vlr_Desd_6              := Calcula_Condicao;
                  Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
                  End
               Else If Posicao_Parcela = 7 Then
                  Begin
                  Data_Base_Calculo_Original       := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_7));
                  Cliente_Condicao_Pgto_7 := Trim(Dia_Parcela_7);
                  Forma_Desd_7            := Trim(Dia_Parcela_7);
                  Nro_Nota_Desd_7         := Trim(ETP_Numero_Nota.Text) + 'G';
                  Dt_Vcto_Desd_7          := Data_Base_Calculo_Original;
                  Vlr_Desd_7              := Calcula_Condicao;
                  Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
                  End
               Else If Posicao_Parcela = 8 Then
                  Begin
                  Data_Base_Calculo_Original       := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_8));
                  Cliente_Condicao_Pgto_8 := Trim(Dia_Parcela_8);
                  Forma_Desd_8            := Trim(Dia_Parcela_8);
                  Nro_Nota_Desd_8         := Trim(ETP_Numero_Nota.Text) + 'H';
                  Dt_Vcto_Desd_8          := Data_Base_Calculo_Original;
                  Vlr_Desd_8              := Calcula_Condicao;
                  Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
                  End
               Else If Posicao_Parcela = 9 Then
                  Begin
                  Data_Base_Calculo_Original       := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_9));
                  Cliente_Condicao_Pgto_9 := Trim(Dia_Parcela_9);
                  Forma_Desd_9            := Trim(Dia_Parcela_9);
                  Nro_Nota_Desd_9         := Trim(ETP_Numero_Nota.Text) + 'I';
                  Dt_Vcto_Desd_9          := Data_Base_Calculo_Original;
                  Vlr_Desd_9              := Calcula_Condicao;
                  Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
                  End
               Else If Posicao_Parcela = 10 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_10));
                  Cliente_Condicao_Pgto_10 := Trim(Dia_Parcela_10);
                  Forma_Desd_10            := Trim(Dia_Parcela_10);
                  Nro_Nota_Desd_10         := Trim(ETP_Numero_Nota.Text) + 'J';
                  Dt_Vcto_Desd_10          := Data_Base_Calculo_Original;
                  Vlr_Desd_10              := Calcula_Condicao;
                  Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
                  End
               Else If Posicao_Parcela = 11 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_11));
                  Cliente_Condicao_Pgto_11 := Trim(Dia_Parcela_11);
                  Forma_Desd_11            := Trim(Dia_Parcela_11);
                  Nro_Nota_Desd_11         := Trim(ETP_Numero_Nota.Text) + 'K';
                  Dt_Vcto_Desd_11          := Data_Base_Calculo_Original;
                  Vlr_Desd_11              := Calcula_Condicao;
                  Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
                  End
               Else If Posicao_Parcela = 12 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_12));
                  Cliente_Condicao_Pgto_12 := Trim(Dia_Parcela_12);
                  Forma_Desd_12            := Trim(Dia_Parcela_12);
                  Nro_Nota_Desd_12         := Trim(ETP_Numero_Nota.Text) + 'L';
                  Dt_Vcto_Desd_12          := Data_Base_Calculo_Original;
                  Vlr_Desd_12              := Calcula_Condicao;
                  Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
                  End
               Else If Posicao_Parcela = 13 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_13));
                  Cliente_Condicao_Pgto_13 := Trim(Dia_Parcela_13);
                  Forma_Desd_13            := Trim(Dia_Parcela_13);
                  Nro_Nota_Desd_13         := Trim(ETP_Numero_Nota.Text) + 'M';
                  Dt_Vcto_Desd_13          := Data_Base_Calculo_Original;
                  Vlr_Desd_13              := Calcula_Condicao;
                  Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
                  End
               Else If Posicao_Parcela = 14 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_14));
                  Cliente_Condicao_Pgto_14 := Trim(Dia_Parcela_14);
                  Forma_Desd_14            := Trim(Dia_Parcela_14);
                  Nro_Nota_Desd_14         := Trim(ETP_Numero_Nota.Text) + 'N';
                  Dt_Vcto_Desd_14          := Data_Base_Calculo_Original;
                  Vlr_Desd_14              := Calcula_Condicao;
                  Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
                  End
               Else If Posicao_Parcela = 15 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_15));
                  Cliente_Condicao_Pgto_15 := Trim(Dia_Parcela_15);
                  Forma_Desd_15            := Trim(Dia_Parcela_15);
                  Nro_Nota_Desd_15         := Trim(ETP_Numero_Nota.Text) + 'O';
                  Dt_Vcto_Desd_15          := Data_Base_Calculo_Original;
                  Vlr_Desd_15              := Calcula_Condicao;
                  Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
                  End
               Else If Posicao_Parcela = 16 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_16));
                  Cliente_Condicao_Pgto_16 := Trim(Dia_Parcela_16);
                  Forma_Desd_16            := Trim(Dia_Parcela_16);
                  Nro_Nota_Desd_16         := Trim(ETP_Numero_Nota.Text) + 'P';
                  Dt_Vcto_Desd_16          := Data_Base_Calculo_Original;
                  Vlr_Desd_16              := Calcula_Condicao;
                  Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
                  End
               Else If Posicao_Parcela = 17 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_17));
                  Cliente_Condicao_Pgto_17 := Trim(Dia_Parcela_17);
                  Forma_Desd_17            := Trim(Dia_Parcela_17);
                  Nro_Nota_Desd_17         := Trim(ETP_Numero_Nota.Text) + 'Q';
                  Dt_Vcto_Desd_17          := Data_Base_Calculo_Original;
                  Vlr_Desd_17              := Calcula_Condicao;
                  Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
                  End
               Else If Posicao_Parcela = 18 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_18));
                  Cliente_Condicao_Pgto_18 := Trim(Dia_Parcela_18);
                  Forma_Desd_18            := Trim(Dia_Parcela_18);
                  Nro_Nota_Desd_18         := Trim(ETP_Numero_Nota.Text) + 'R';
                  Dt_Vcto_Desd_18          := Data_Base_Calculo_Original;
                  Vlr_Desd_18              := Calcula_Condicao;
                  Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
                  End
               Else If Posicao_Parcela = 19 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_19));
                  Cliente_Condicao_Pgto_19 := Trim(Dia_Parcela_19);
                  Forma_Desd_19            := Trim(Dia_Parcela_19);
                  Nro_Nota_Desd_19         := Trim(ETP_Numero_Nota.Text) + 'S';
                  Dt_Vcto_Desd_19          := Data_Base_Calculo_Original;
                  Vlr_Desd_19              := Calcula_Condicao;
                  Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
                  End
               Else If Posicao_Parcela = 20 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_20));
                  Cliente_Condicao_Pgto_20 := Trim(Dia_Parcela_20);
                  Forma_Desd_20            := Trim(Dia_Parcela_20);
                  Nro_Nota_Desd_20         := Trim(ETP_Numero_Nota.Text) + 'T';
                  Dt_Vcto_Desd_20          := Data_Base_Calculo_Original;
                  Vlr_Desd_20              := Calcula_Condicao;
                  Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
                  End
               Else If Posicao_Parcela = 21 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_21));
                  Cliente_Condicao_Pgto_21 := Trim(Dia_Parcela_21);
                  Forma_Desd_21            := Trim(Dia_Parcela_21);
                  Nro_Nota_Desd_21         := Trim(ETP_Numero_Nota.Text) + 'U';
                  Dt_Vcto_Desd_21          := Data_Base_Calculo_Original;
                  Vlr_Desd_21              := Calcula_Condicao;
                  Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
                  End
               Else If Posicao_Parcela = 22 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_22));
                  Cliente_Condicao_Pgto_22 := Trim(Dia_Parcela_22);
                  Forma_Desd_22            := Trim(Dia_Parcela_22);
                  Nro_Nota_Desd_22         := Trim(ETP_Numero_Nota.Text) + 'V';
                  Dt_Vcto_Desd_22          := Data_Base_Calculo_Original;
                  Vlr_Desd_22              := Calcula_Condicao;
                  Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
                  End
               Else If Posicao_Parcela = 23 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_23));
                  Cliente_Condicao_Pgto_23 := Trim(Dia_Parcela_23);
                  Forma_Desd_23            := Trim(Dia_Parcela_23);
                  Nro_Nota_Desd_23         := Trim(ETP_Numero_Nota.Text) + 'X';
                  Dt_Vcto_Desd_23          := Data_Base_Calculo_Original;
                  Vlr_Desd_23              := Calcula_Condicao;
                  Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
                  End
               Else If Posicao_Parcela = 24 Then
                  Begin
                  Data_Base_Calculo_Original        := DateToStr(StrToDate(Data_Base_Calculo_Original) + StrToInt(Dia_Parcela_24));
                  Cliente_Condicao_Pgto_24 := Trim(Dia_Parcela_24);
                  Forma_Desd_24            := Trim(Dia_Parcela_24);
                  Nro_Nota_Desd_24         := Trim(ETP_Numero_Nota.Text) + 'Z';
                  Dt_Vcto_Desd_24          := Data_Base_Calculo_Original;
                  Vlr_Desd_24              := Calcula_Condicao;
                  Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);
               End;

               Primeira_Parcela := False;
           End;

        End;
     End;
end;

procedure TNotasFiscaisSaidas02.Grava_Nota_Monibras(Posicao_Inicial, Posicao_Final: Integer);

var
   Comando_SQL: String;
   Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4, Cond_Pgto_5, Cond_Pgto_6, Cond_Pgto_7, Cond_Pgto_8, Cond_Pgto_9, Cond_Pgto_10, Cond_Pgto_11, Cond_Pgto_12, Cond_Pgto_13, Cond_Pgto_14, Cond_Pgto_15, Cond_Pgto_16, Cond_Pgto_17, Cond_Pgto_18, Cond_Pgto_19, Cond_Pgto_20, Cond_Pgto_21, Cond_Pgto_22, Cond_Pgto_23, Cond_Pgto_24, Transportadora, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Vlr_Frete, Vlr_IPI, Representante, Banco: String;
   Valor_Inteiro: String;
   Ind: Integer;

begin
     //*** Prepara Variáveis ***

     Desconto := Trim(Virgula_Ponto(Cliente_Desconto.Text));

     If Trim(Cliente_Condicao_Pgto_1) = 'À VISTA' Then
        Begin
        Cond_Pgto_1 := '0';
        End
     Else
        Begin
        Cond_Pgto_1 := Trim(Cliente_Condicao_Pgto_1);
     End;

     If Trim(Cliente_Condicao_Pgto_2) = 'À VISTA' Then
        Begin
        Cond_Pgto_2 := '0';
        End
     Else
        Begin
        Cond_Pgto_2 := Trim(Cliente_Condicao_Pgto_2);
     End;

     If Trim(Cliente_Condicao_Pgto_3) = 'À VISTA' Then
        Begin
        Cond_Pgto_3 := '0';
        End
     Else
        Begin
        Cond_Pgto_3 := Trim(Cliente_Condicao_Pgto_3);
     End;

     If Trim(Cliente_Condicao_Pgto_4) = 'À VISTA' Then
        Begin
        Cond_Pgto_4 := '0';
        End
     Else
        Begin
        Cond_Pgto_4 := Trim(Cliente_Condicao_Pgto_4);
     End;

     If Trim(Cliente_Condicao_Pgto_5) = 'À VISTA' Then
        Begin
        Cond_Pgto_5 := '0';
        End
     Else
        Begin
        Cond_Pgto_5 := Trim(Cliente_Condicao_Pgto_5);
     End;

     If Trim(Cliente_Condicao_Pgto_6) = 'À VISTA' Then
        Begin
        Cond_Pgto_6 := '0';
        End
     Else
        Begin
        Cond_Pgto_6 := Trim(Cliente_Condicao_Pgto_6);
     End;

     If Trim(Cliente_Condicao_Pgto_7) = 'À VISTA' Then
        Begin
        Cond_Pgto_7 := '0';
        End
     Else
        Begin
        Cond_Pgto_7 := Trim(Cliente_Condicao_Pgto_7);
     End;

     If Trim(Cliente_Condicao_Pgto_8) = 'À VISTA' Then
        Begin
        Cond_Pgto_8 := '0';
        End
     Else
        Begin
        Cond_Pgto_8 := Trim(Cliente_Condicao_Pgto_8);
     End;

     If Trim(Cliente_Condicao_Pgto_9) = 'À VISTA' Then
        Begin
        Cond_Pgto_9 := '0';
        End
     Else
        Begin
        Cond_Pgto_9 := Trim(Cliente_Condicao_Pgto_9);
     End;

     If Trim(Cliente_Condicao_Pgto_10) = 'À VISTA' Then
        Begin
        Cond_Pgto_10 := '0';
        End
     Else
        Begin
        Cond_Pgto_10 := Trim(Cliente_Condicao_Pgto_10);
     End;

     If Trim(Cliente_Condicao_Pgto_11) = 'À VISTA' Then
        Begin
        Cond_Pgto_11 := '0';
        End
     Else
        Begin
        Cond_Pgto_11 := Trim(Cliente_Condicao_Pgto_11);
     End;

     If Trim(Cliente_Condicao_Pgto_12) = 'À VISTA' Then
        Begin
        Cond_Pgto_12 := '0';
        End
     Else
        Begin
        Cond_Pgto_12 := Trim(Cliente_Condicao_Pgto_12);
     End;

     If Trim(Cliente_Condicao_Pgto_13) = 'À VISTA' Then
        Begin
        Cond_Pgto_13 := '0';
        End
     Else
        Begin
        Cond_Pgto_13 := Trim(Cliente_Condicao_Pgto_13);
     End;

     If Trim(Cliente_Condicao_Pgto_14) = 'À VISTA' Then
        Begin
        Cond_Pgto_14 := '0';
        End
     Else
        Begin
        Cond_Pgto_14 := Trim(Cliente_Condicao_Pgto_14);
     End;

     If Trim(Cliente_Condicao_Pgto_15) = 'À VISTA' Then
        Begin
        Cond_Pgto_15 := '0';
        End
     Else
        Begin
        Cond_Pgto_15 := Trim(Cliente_Condicao_Pgto_15);
     End;

     If Trim(Cliente_Condicao_Pgto_16) = 'À VISTA' Then
        Begin
        Cond_Pgto_16 := '0';
        End
     Else
        Begin
        Cond_Pgto_16 := Trim(Cliente_Condicao_Pgto_16);
     End;

     If Trim(Cliente_Condicao_Pgto_17) = 'À VISTA' Then
        Begin
        Cond_Pgto_17 := '0';
        End
     Else
        Begin
        Cond_Pgto_17 := Trim(Cliente_Condicao_Pgto_17);
     End;

     If Trim(Cliente_Condicao_Pgto_18) = 'À VISTA' Then
        Begin
        Cond_Pgto_18 := '0';
        End
     Else
        Begin
        Cond_Pgto_18 := Trim(Cliente_Condicao_Pgto_18);
     End;

     If Trim(Cliente_Condicao_Pgto_19) = 'À VISTA' Then
        Begin
        Cond_Pgto_19 := '0';
        End
     Else
        Begin
        Cond_Pgto_19 := Trim(Cliente_Condicao_Pgto_19);
     End;

     If Trim(Cliente_Condicao_Pgto_20) = 'À VISTA' Then
        Begin
        Cond_Pgto_20 := '0';
        End
     Else
        Begin
        Cond_Pgto_20 := Trim(Cliente_Condicao_Pgto_20);
     End;

     If Trim(Cliente_Condicao_Pgto_21) = 'À VISTA' Then
        Begin
        Cond_Pgto_21 := '0';
        End
     Else
        Begin
        Cond_Pgto_21 := Trim(Cliente_Condicao_Pgto_21);
     End;

     If Trim(Cliente_Condicao_Pgto_22) = 'À VISTA' Then
        Begin
        Cond_Pgto_22 := '0';
        End
     Else
        Begin
        Cond_Pgto_22 := Trim(Cliente_Condicao_Pgto_22);
     End;

     If Trim(Cliente_Condicao_Pgto_23) = 'À VISTA' Then
        Begin
        Cond_Pgto_23 := '0';
        End
     Else
        Begin
        Cond_Pgto_23 := Trim(Cliente_Condicao_Pgto_23);
     End;

     If Trim(Cliente_Condicao_Pgto_24) = 'À VISTA' Then
        Begin
        Cond_Pgto_24 := '0';
        End
     Else
        Begin
        Cond_Pgto_24 := Trim(Cliente_Condicao_Pgto_24);
     End;

     Vlr_Desconto      := Trim(Virgula_Ponto(Vlr_Desconto_Str));
     Vlr_Pedido        := Trim(Virgula_Ponto(Total_Nota_Str));

     If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        Str((Total_Nota - ((Total_Nota * 7) / 100)):13:2,Total_Desconto_Str);
        Vlr_Total := Trim(Virgula_Ponto(Total_Desconto_Str));
        End
     Else
        Begin
        Vlr_Total := Trim(Virgula_Ponto(Total_Desconto_Str));
     End;

     Vlr_Frete         := Trim(Virgula_Ponto(Vlr_Frete_Str));
     Vlr_IPI           := Trim(Virgula_Ponto(Vlr_IPI_Str));

     Vlr_Str_Desd_1    := Trim(Virgula_Ponto(Vlr_Str_Desd_1));
     Vlr_Str_Desd_2    := Trim(Virgula_Ponto(Vlr_Str_Desd_2));
     Vlr_Str_Desd_3    := Trim(Virgula_Ponto(Vlr_Str_Desd_3));
     Vlr_Str_Desd_4    := Trim(Virgula_Ponto(Vlr_Str_Desd_4));
     Vlr_Str_Desd_5    := Trim(Virgula_Ponto(Vlr_Str_Desd_5));
     Vlr_Str_Desd_6    := Trim(Virgula_Ponto(Vlr_Str_Desd_6));
     Vlr_Str_Desd_7    := Trim(Virgula_Ponto(Vlr_Str_Desd_7));
     Vlr_Str_Desd_8    := Trim(Virgula_Ponto(Vlr_Str_Desd_8));
     Vlr_Str_Desd_9    := Trim(Virgula_Ponto(Vlr_Str_Desd_9));
     Vlr_Str_Desd_10    := Trim(Virgula_Ponto(Vlr_Str_Desd_10));
     Vlr_Str_Desd_11    := Trim(Virgula_Ponto(Vlr_Str_Desd_11));
     Vlr_Str_Desd_12    := Trim(Virgula_Ponto(Vlr_Str_Desd_12));
     Vlr_Str_Desd_13    := Trim(Virgula_Ponto(Vlr_Str_Desd_13));
     Vlr_Str_Desd_14    := Trim(Virgula_Ponto(Vlr_Str_Desd_14));
     Vlr_Str_Desd_15    := Trim(Virgula_Ponto(Vlr_Str_Desd_15));
     Vlr_Str_Desd_16    := Trim(Virgula_Ponto(Vlr_Str_Desd_16));
     Vlr_Str_Desd_17    := Trim(Virgula_Ponto(Vlr_Str_Desd_17));
     Vlr_Str_Desd_18    := Trim(Virgula_Ponto(Vlr_Str_Desd_18));
     Vlr_Str_Desd_19    := Trim(Virgula_Ponto(Vlr_Str_Desd_19));
     Vlr_Str_Desd_20    := Trim(Virgula_Ponto(Vlr_Str_Desd_20));
     Vlr_Str_Desd_21    := Trim(Virgula_Ponto(Vlr_Str_Desd_21));
     Vlr_Str_Desd_22    := Trim(Virgula_Ponto(Vlr_Str_Desd_22));
     Vlr_Str_Desd_23    := Trim(Virgula_Ponto(Vlr_Str_Desd_23));
     Vlr_Str_Desd_24    := Trim(Virgula_Ponto(Vlr_Str_Desd_24));

     Vlr_Str_ICMS      := Trim(Virgula_Ponto(Vlr_ICMS_Str));

     If Trim(Desconto) = '' Then
        Begin
        Desconto := '0';
     End;

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

     If ((Trim(Cond_Pgto_5) = '') Or (Trim(Cond_Pgto_5) = 'À VISTA')) Then
        Begin
        Cond_Pgto_5 := '0';
     End;

     If ((Trim(Cond_Pgto_6) = '') Or (Trim(Cond_Pgto_6) = 'À VISTA')) Then
        Begin
        Cond_Pgto_6 := '0';
     End;

     If ((Trim(Cond_Pgto_7) = '') Or (Trim(Cond_Pgto_7) = 'À VISTA')) Then
        Begin
        Cond_Pgto_7 := '0';
     End;

     If ((Trim(Cond_Pgto_8) = '') Or (Trim(Cond_Pgto_8) = 'À VISTA')) Then
        Begin
        Cond_Pgto_8 := '0';
     End;

     If ((Trim(Cond_Pgto_9) = '') Or (Trim(Cond_Pgto_9) = 'À VISTA')) Then
        Begin
        Cond_Pgto_9 := '0';
     End;

     If ((Trim(Cond_Pgto_10) = '') Or (Trim(Cond_Pgto_10) = 'À VISTA')) Then
        Begin
        Cond_Pgto_10 := '0';
     End;

     If ((Trim(Cond_Pgto_11) = '') Or (Trim(Cond_Pgto_11) = 'À VISTA')) Then
        Begin
        Cond_Pgto_11 := '0';
     End;

     If ((Trim(Cond_Pgto_12) = '') Or (Trim(Cond_Pgto_12) = 'À VISTA')) Then
        Begin
        Cond_Pgto_12 := '0';
     End;

     If ((Trim(Cond_Pgto_13) = '') Or (Trim(Cond_Pgto_13) = 'À VISTA')) Then
        Begin
        Cond_Pgto_13 := '0';
     End;

     If ((Trim(Cond_Pgto_14) = '') Or (Trim(Cond_Pgto_14) = 'À VISTA')) Then
        Begin
        Cond_Pgto_14 := '0';
     End;

     If ((Trim(Cond_Pgto_15) = '') Or (Trim(Cond_Pgto_15) = 'À VISTA')) Then
        Begin
        Cond_Pgto_15 := '0';
     End;

     If ((Trim(Cond_Pgto_16) = '') Or (Trim(Cond_Pgto_16) = 'À VISTA')) Then
        Begin
        Cond_Pgto_16 := '0';
     End;

     If ((Trim(Cond_Pgto_17) = '') Or (Trim(Cond_Pgto_17) = 'À VISTA')) Then
        Begin
        Cond_Pgto_17 := '0';
     End;

     If ((Trim(Cond_Pgto_18) = '') Or (Trim(Cond_Pgto_18) = 'À VISTA')) Then
        Begin
        Cond_Pgto_18 := '0';
     End;

     If ((Trim(Cond_Pgto_19) = '') Or (Trim(Cond_Pgto_19) = 'À VISTA')) Then
        Begin
        Cond_Pgto_19 := '0';
     End;

     If ((Trim(Cond_Pgto_20) = '') Or (Trim(Cond_Pgto_20) = 'À VISTA')) Then
        Begin
        Cond_Pgto_20 := '0';
     End;

     If ((Trim(Cond_Pgto_21) = '') Or (Trim(Cond_Pgto_21) = 'À VISTA')) Then
        Begin
        Cond_Pgto_21 := '0';
     End;

     If ((Trim(Cond_Pgto_22) = '') Or (Trim(Cond_Pgto_22) = 'À VISTA')) Then
        Begin
        Cond_Pgto_22 := '0';
     End;

     If ((Trim(Cond_Pgto_23) = '') Or (Trim(Cond_Pgto_23) = 'À VISTA')) Then
        Begin
        Cond_Pgto_23 := '0';
     End;

     If ((Trim(Cond_Pgto_24) = '') Or (Trim(Cond_Pgto_24) = 'À VISTA')) Then
        Begin
        Cond_Pgto_24 := '0';
     End;  


     If Trim(Vlr_Desconto) = '' Then
        Begin
        Vlr_Desconto := '0';
     End;

     If Trim(Vlr_Pedido) = '' Then
        Begin
        Vlr_Pedido := '0';
     End;

     If Trim(Vlr_Total) = '' Then
        Begin
        Vlr_Total := '0';
     End;

     If Trim(Vlr_Frete) = '' Then
        Begin
        Vlr_Frete := '0';
     End;

     If Trim(Vlr_Str_Desd_1) = '' Then
        Begin
        Vlr_Str_Desd_1 := '0';
     End;

     If Trim(Vlr_Str_Desd_2) = '' Then
        Begin
        Vlr_Str_Desd_2 := '0';
     End;

     If Trim(Vlr_Str_Desd_3) = '' Then
        Begin
        Vlr_Str_Desd_3 := '0';
     End;

     If Trim(Vlr_Str_Desd_4) = '' Then
        Begin
        Vlr_Str_Desd_4 := '0';
     End;

     If Trim(Vlr_Str_Desd_5) = '' Then
        Begin
        Vlr_Str_Desd_5 := '0';
     End;

     If Trim(Vlr_Str_Desd_6) = '' Then
        Begin
        Vlr_Str_Desd_6 := '0';
     End;

     If Trim(Vlr_Str_Desd_7) = '' Then
        Begin
        Vlr_Str_Desd_7 := '0';
     End;

     If Trim(Vlr_Str_Desd_8) = '' Then
        Begin
        Vlr_Str_Desd_8 := '0';
     End;

     If Trim(Vlr_Str_Desd_9) = '' Then
        Begin
        Vlr_Str_Desd_9 := '0';
     End;

     If Trim(Vlr_Str_Desd_10) = '' Then
        Begin
        Vlr_Str_Desd_10 := '0';
     End;

     If Trim(Vlr_Str_Desd_11) = '' Then
        Begin
        Vlr_Str_Desd_11 := '0';
     End;

     If Trim(Vlr_Str_Desd_12) = '' Then
        Begin
        Vlr_Str_Desd_12 := '0';
     End;

     If Trim(Vlr_Str_Desd_13) = '' Then
        Begin
        Vlr_Str_Desd_13 := '0';
     End;

     If Trim(Vlr_Str_Desd_14) = '' Then
        Begin
        Vlr_Str_Desd_14 := '0';
     End;

     If Trim(Vlr_Str_Desd_15) = '' Then
        Begin
        Vlr_Str_Desd_15 := '0';
     End;

     If Trim(Vlr_Str_Desd_16) = '' Then
        Begin
        Vlr_Str_Desd_16 := '0';
     End;

     If Trim(Vlr_Str_Desd_17) = '' Then
        Begin
        Vlr_Str_Desd_17 := '0';
     End;

     If Trim(Vlr_Str_Desd_18) = '' Then
        Begin
        Vlr_Str_Desd_18 := '0';
     End;

     If Trim(Vlr_Str_Desd_19) = '' Then
        Begin
        Vlr_Str_Desd_19 := '0';
     End;

     If Trim(Vlr_Str_Desd_20) = '' Then
        Begin
        Vlr_Str_Desd_20 := '0';
     End;

     If Trim(Vlr_Str_Desd_21) = '' Then
        Begin
        Vlr_Str_Desd_21 := '0';
     End;

     If Trim(Vlr_Str_Desd_22) = '' Then
        Begin
        Vlr_Str_Desd_22 := '0';
     End;

     If Trim(Vlr_Str_Desd_23) = '' Then
        Begin
        Vlr_Str_Desd_23 := '0';
     End;

     If Trim(Vlr_Str_Desd_24) = '' Then
        Begin
        Vlr_Str_Desd_24 := '0';
     End;

     If Trim(Vlr_Str_ICMS) = '' Then
        Begin
        Vlr_Str_ICMS := '0';
     End;

     //*** Registra o Número da Nota Fiscal Anterior ***

     Comando_SQL := 'Update mb_nf_anterior Set ';
     Comando_SQL := Comando_SQL + 'mb_nf_anterior_data = ' +#39+ Trim(Inverte_Data_Plus(ETP_Data_Emissao_Nota.Text,'amd','/')) +#39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_nf_anterior_numero = ' + Trim(ETP_Numero_Nota.Text);

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Registra a Data da Última Compra no Cliente ***

     Comando_SQL := 'Update fb_clientes Set ';
     Comando_SQL := Comando_SQL + 'fb_cliente_data_ultima_compra = ' +#39+ Trim(Inverte_Data_Plus(ETP_Data_Emissao_Nota.Text,'amd','/')) +#39+',';
     Comando_SQL := Comando_SQL + 'fb_cliente_ultimo_valor = ' + Trim(Vlr_Total);
     Comando_SQL := Comando_SQL + ' Where fb_cliente_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Registra a Nota Fiscal ***

     Transportadora    := Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text);
     Representante     := Obtem_Nro_Antes_Traco(Cliente_Vendedor.Text);
     Banco             := Obtem_Nro_Antes_Traco(Cliente_Banco.Text);

     Comando_SQL := 'Insert into mb_notas_fiscais(';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_numero, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_codigo_tipo, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_codigo, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_nome, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_desconto, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_1, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_2, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_3, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_4, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_5, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_6, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_7, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_8, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_9, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_10, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_11, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_12, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_13, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_14, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_15, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_16, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_17, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_18, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_19, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_20, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_21, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_22, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_23, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cond_pgto_24, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_tipo_fatura, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_tipo_tabela, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_emite_lote, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_tipo_transp, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_transporta, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_valor_desc, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_valor_pedido, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_valor_total, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_observacao, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_observacao_log, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_pgto_frete, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_natureza_oper, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_natureza_oper_desc, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_natureza_oper_nro, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_data_emissao, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_estado, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_faturado, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_vendedor, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_banco, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_1, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_1, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_1, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_1, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_2, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_2, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_2, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_2, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_3, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_3, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_3, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_3, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_4, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_4, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_4, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_4, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_5, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_5, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_5, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_5, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_6, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_6, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_6, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_6, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_7, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_7, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_7, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_7, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_8, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_8, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_8, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_8, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_9, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_9, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_9, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_9, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_10, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_10, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_10, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_10, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_11, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_11, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_11, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_11, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_12, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_12, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_12, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_12, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_13, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_13, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_13, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_13, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_14, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_14, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_14, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_14, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_15, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_15, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_15, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_15, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_16, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_16, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_16, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_16, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_17, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_17, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_17, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_17, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_18, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_18, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_18, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_18, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_19, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_19, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_19, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_19, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_20, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_20, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_20, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_20, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_21, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_21, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_21, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_21, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_22, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_22, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_22, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_22, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_23, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_23, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_23, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_23, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_nro_24, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_forma_24, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_dt_vcto_24, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_dup_vlr_24, ';

     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_volume, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_valor_frete, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_forma_pagamento, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_nro_pedido, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cfop, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_icms, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_ordem_compra, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_valor_ipi, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_cfop_2, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_revenda, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_observacao_fatura, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_aliquota_icms, ';
     Comando_SQL := Comando_SQL + 'faturado_base_icms, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_especie, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_marca, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_peso_bruto, ';
     Comando_SQL := Comando_SQL + 'mb_nota_fiscal_peso_liquido) ';

     Comando_SQL := Comando_SQL + 'Values(';
     Comando_SQL := Comando_SQL + Trim(ETP_Numero_Nota.Text) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo_Tipo.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Nome.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Desconto) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_1) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_2) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_3) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_4) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_5) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_6) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_7) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_8) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_9) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_10) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_11) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_12) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_13) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_14) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_15) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_16) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_17) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_18) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_19) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_20) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_21) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_22) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_23) + ',';
     Comando_SQL := Comando_SQL + Trim(Cond_Pgto_24) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Tipo_Faturamento.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + '' + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Emite_Lote.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Tipo_Transporte.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Transportadora) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Desconto) + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Pedido) + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Total) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Observacao_Nota.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Observacao.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Pgto_Frete.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Obtem_Depois_Traco(Opcao_Natureza_Operacao.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Natureza_Operacao.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Obtem_Antes(Trim(Opcao_Natureza_Operacao.Text),'_') + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(ETP_Data_Emissao_Nota.Text,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Estado.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + '0,';
     Comando_SQL := Comando_SQL + Trim(Representante) + ',';
     Comando_SQL := Comando_SQL + Trim(Banco) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_1,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_1) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_2,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_2) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_3,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_3) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_4,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_4) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_5) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_5) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_5,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_5) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_6) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_6) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_6,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_6) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_7) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_7) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_7,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_7) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_8) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_8) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_8,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_8) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_9) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_9) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_9,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_9) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_10) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_10) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_10,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_10) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_11) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_11) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_11,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_11) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_12) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_12) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_12,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_12) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_13) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_13) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_13,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_13) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_14) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_14) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_14,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_14) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_15) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_15) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_15,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_15) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_16) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_16) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_16,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_16) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_17) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_17) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_17,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_17) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_18) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_18) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_18,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_18) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_19) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_19) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_19,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_19) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_20) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_20) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_20,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_20) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_21) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_21) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_21,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_21) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_22) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_22) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_22,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_22) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_23) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_23) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_23,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_23) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_24) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_24) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_24,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_24) + ',';

     Comando_SQL := Comando_SQL + Trim(Volume) + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Frete) + ',';
     Comando_SQL := Comando_SQL + #39 + '' + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Nro_Pedido.Text) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_CFOP.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_ICMS) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Ordem_Compra.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_IPI) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_CFOP_2.Text) + #39 + ',';

     If Nota_Revenda.Checked = True Then
        Begin
        Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + #39 + Trim(Observacao_Faturamento.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Cliente_Aliquota_ICMS.Text) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(BC_ICMS_Str) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Especie.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Marca.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Peso_Bruto.Text) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Peso_Liquido.Text) + ')';

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Registra os Produtos da Nota ***

     For Ind := Posicao_Inicial To Posicao_Final Do
         Begin

         Valor_Inteiro := Trim(SGD_Produtos.Cells[1,Ind]);

         If Trim(Valor_Inteiro) = '' Then
            Begin
            Valor_Inteiro := '0';
         End;

         If StrToFloat(Valor_Inteiro) > 0 Then
            Begin

            //*** Ajusta a Posição do Pedido ***

            If Trim(SGD_Produtos.Cells[9,Ind]) = '' Then
               Begin
               SGD_Produtos.Cells[9,Ind] := IntToStr(Ind);
            End;

            //*** Insere os Produtos Adquiridos ***

            Comando_SQL := 'Insert into mb_notas_fiscais_produtos(';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_numero,';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_codigo,';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_qtde,';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_desc,';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_descricao_detalhada,';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_vlr_uni,';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_vlr_tot,';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_lote, ';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_posicao,';
            Comando_SQL := Comando_SQL + 'mb_nota_fiscal_produto_vlr_ipi)';
            Comando_SQL := Comando_SQL + ' Values(';
            Comando_SQL := Comando_SQL + Trim(ETP_Numero_Nota.Text) + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + ',';
            Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[1,Ind])) + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[4,Ind]) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[10,Ind]) + #39 + ',';
            Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[6,Ind])) + ',';
            Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[7,Ind])) + ',';
            Comando_SQL := Comando_SQL + Trim(SGD_Produtos.Cells[5,Ind]) + ',';
            Comando_SQL := Comando_SQL + Trim(SGD_Produtos.Cells[9,Ind]) + ',';

            If Trim(SGD_Produtos.Cells[8,Ind]) <> '' Then
               Begin
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind])) + ')';
               End
            Else
               Begin
               Comando_SQL := Comando_SQL + '0.00)';
            End;

            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            { //*** Insere o Movimento de Estoque Para a Nota Relacionda ao Pedido ***

            Comando_SQL := 'Update fb_movto_estoque Set ';
            Comando_SQL := Comando_SQL + 'fb_movto_estoque_nota = ' + Trim(ETP_Numero_Nota.Text) + ',';
            Comando_SQL := Comando_SQL + 'fb_movto_estoque_lote = ' + Trim(SGD_Produtos.Cells[5,Ind]);
            Comando_SQL := Comando_SQL + ' Where ';
            Comando_SQL := Comando_SQL + '((fb_movto_estoque_cod_registro = 51) And ';
            Comando_SQL := Comando_SQL + '(fb_movto_estoque_pedido = ' + Trim(Nro_Pedido.Text) + ') And ';
            Comando_SQL := Comando_SQL + '(fb_movto_estoque_codigo = ' + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + '))';

            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL; }
         End;
     End;

     //*** Registra o Histórico do Cliente ***

     Comando_SQL := 'Insert into mb_historicos(';
     Comando_SQL := Comando_SQL + 'mb_historico_codigo_cliente,';
     Comando_SQL := Comando_SQL + 'mb_historico_tipo_faturamento,';
     Comando_SQL := Comando_SQL + 'mb_historico_nro_nota,';
     Comando_SQL := Comando_SQL + 'mb_historico_data_emissao,';
     Comando_SQL := Comando_SQL + 'mb_historico_valor_desc,';
     Comando_SQL := Comando_SQL + 'mb_historico_valor_pedido,';
     Comando_SQL := Comando_SQL + 'mb_historico_valor_total,';
     Comando_SQL := Comando_SQL + 'mb_historico_porc_desc,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_nro_1,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_forma_1,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_dt_vcto_1,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_vlr_1,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_nro_2,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_forma_2,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_dt_vcto_2,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_vlr_2,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_nro_3,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_forma_3,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_dt_vcto_3,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_vlr_3,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_nro_4,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_forma_4,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_dt_vcto_4,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_vlr_4,';
     Comando_SQL := Comando_SQL + 'mb_historico_cfop,';
     Comando_SQL := Comando_SQL + 'mb_historico_icms,';
     Comando_SQL := Comando_SQL + 'mb_historico_cfop_2,';
     Comando_SQL := Comando_SQL + 'mb_historico_revenda)';
     Comando_SQL := Comando_SQL + ' Values(';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Tipo_Faturamento.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(ETP_Numero_Nota.Text) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(ETP_Data_Emissao_Nota.Text,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Desconto) + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Pedido) + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Total) + ',';
     Comando_SQL := Comando_SQL + Trim(Desconto) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_1,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_1) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_2,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_2) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_3,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_3) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_4,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_4) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_CFOP.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_ICMS) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_CFOP_2.Text) + #39 + ',';

     If Nota_Revenda.Checked = True Then
        Begin
        Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ')';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ')';
     End;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Marca o Pedido como Faturado ***

     If Trim(Tipo_Nota_Emissao.Text) <> 'NFe' Then
        Begin
        Comando_SQL := 'Update faturados Set ';
        Comando_SQL := Comando_SQL + 'faturado_status = ' +#39+ 'Faturado' +#39;
        Comando_SQL := Comando_SQL + ' Where faturado_numero = ' + Trim(Nro_Pedido_Faturado.Text);

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
     End;
end;

procedure TNotasFiscaisSaidas02.Grava_OS_Monibras(Posicao_Inicial, Posicao_Final: Integer);

var
   Comando_SQL: String;
   Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4, Transportadora, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Vlr_Frete, Representante, Banco: String;
   Valor_Inteiro: String;
   Ind: Integer;

begin
     //*** Prepara Variáveis ***

     Desconto          := Trim(Virgula_Ponto(Cliente_Desconto.Text));
     Cond_Pgto_1       := Trim(Cliente_Condicao_Pgto_1);
     Cond_Pgto_2       := Trim(Cliente_Condicao_Pgto_2);
     Cond_Pgto_3       := Trim(Cliente_Condicao_Pgto_3);
     Cond_Pgto_4       := Trim(Cliente_Condicao_Pgto_4);
     Vlr_Desconto      := Trim(Virgula_Ponto(Vlr_Desconto_Str));
     Vlr_Pedido        := Trim(Virgula_Ponto(Total_Nota_Str));
     Vlr_Total         := Trim(Virgula_Ponto(Total_Desconto_Str));
     Vlr_Frete         := Trim(Virgula_Ponto(Vlr_Frete_Str));

     Vlr_Str_Desd_1    := Trim(Virgula_Ponto(Vlr_Str_Desd_1));
     Vlr_Str_Desd_2    := Trim(Virgula_Ponto(Vlr_Str_Desd_2));
     Vlr_Str_Desd_3    := Trim(Virgula_Ponto(Vlr_Str_Desd_3));
     Vlr_Str_Desd_4    := Trim(Virgula_Ponto(Vlr_Str_Desd_4));

     Vlr_Str_ICMS      := Trim(Virgula_Ponto(Vlr_Str_ICMS));

     If Trim(Desconto) = '' Then
        Begin
        Desconto := '0';
     End;

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

     If Trim(Vlr_Desconto) = '' Then
        Begin
        Vlr_Desconto := '0';
     End;

     If Trim(Vlr_Pedido) = '' Then
        Begin
        Vlr_Pedido := '0';
     End;

     If Trim(Vlr_Total) = '' Then
        Begin
        Vlr_Total := '0';
     End;

     If Trim(Vlr_Frete) = '' Then
        Begin
        Vlr_Frete := '0';
     End;

     If Trim(Vlr_Str_Desd_1) = '' Then
        Begin
        Vlr_Str_Desd_1 := '0';
     End;

     If Trim(Vlr_Str_Desd_2) = '' Then
        Begin
        Vlr_Str_Desd_2 := '0';
     End;

     If Trim(Vlr_Str_Desd_3) = '' Then
        Begin
        Vlr_Str_Desd_3 := '0';
     End;

     If Trim(Vlr_Str_Desd_4) = '' Then
        Begin
        Vlr_Str_Desd_4 := '0';
     End;

     If Trim(Vlr_Str_ICMS) = '' Then
        Begin
        Vlr_Str_ICMS := '0';
     End;

     //*** Registra o Número da Nota Fiscal Anterior ***

     Comando_SQL := 'Update mb_nf_anterior Set ';
     Comando_SQL := Comando_SQL + 'mb_nf_anterior_data_ped = ' +#39+ Trim(Inverte_Data_Plus(ETP_Data_Emissao_Nota.Text,'amd','/')) +#39+ ', ';
     Comando_SQL := Comando_SQL + 'mb_nf_anterior_numero_ped = ' + Trim(ETP_Numero_Nota.Text);

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Registra a Data da Última Compra no Cliente ***

     Comando_SQL := 'Update fb_clientes Set ';
     Comando_SQL := Comando_SQL + 'fb_cliente_data_ultima_compra = ' +#39+ Trim(Inverte_Data_Plus(ETP_Data_Emissao_Nota.Text,'amd','/')) +#39+',';
     Comando_SQL := Comando_SQL + 'fb_cliente_ultimo_valor = ' + Trim(Vlr_Total);
     Comando_SQL := Comando_SQL + ' Where fb_cliente_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Registra a Nota Fiscal ***

     Transportadora    := Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text);
     Representante     := Obtem_Nro_Antes_Traco(Cliente_Vendedor.Text);
     Banco             := Obtem_Nro_Antes_Traco(Cliente_Banco.Text);

     Comando_SQL := 'Insert into mb_papeletas(';
     Comando_SQL := Comando_SQL + 'mb_papeleta_numero, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_codigo_tipo, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_codigo, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_nome, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_desconto, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_cond_pgto_1, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_cond_pgto_2, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_cond_pgto_3, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_cond_pgto_4, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_tipo_fatura, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_tipo_tabela, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_emite_lote, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_tipo_transp, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_transporta, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_valor_desc, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_valor_pedido, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_valor_total, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_observacao, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_observacao_log, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_pgto_frete, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_natureza_oper, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_data_emissao, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_estado, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_faturado, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_vendedor, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_banco, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_nro_1, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_forma_1, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_dt_vcto_1, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_vlr_1, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_nro_2, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_forma_2, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_dt_vcto_2, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_vlr_2, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_nro_3, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_forma_3, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_dt_vcto_3, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_vlr_3, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_nro_4, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_forma_4, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_dt_vcto_4, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_dup_vlr_4, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_volume, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_valor_frete, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_nro_pedido, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_cfop, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_icms, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_ordem_compra, ';
     Comando_SQL := Comando_SQL + 'mb_papeleta_observacao_fatura) ';
     Comando_SQL := Comando_SQL + 'Values(';
     Comando_SQL := Comando_SQL + #39 + Trim(ETP_Numero_Nota.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo_Tipo.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Nome.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Desconto) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cond_Pgto_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cond_Pgto_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cond_Pgto_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cond_Pgto_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Tipo_Faturamento.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + '' + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Emite_Lote.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Tipo_Transporte.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Transportadora) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Desconto) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Pedido) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Total) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Observacao_Nota.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Observacao.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Pgto_Frete.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Obtem_Depois_Traco(Opcao_Natureza_Operacao.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(ETP_Data_Emissao_Nota.Text,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Estado.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + '0' + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Representante) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Banco) + #39 + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_1,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Str_Desd_1) + #39 + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_2,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Str_Desd_2) + #39 + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_3,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Str_Desd_3) + #39 + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_4,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Str_Desd_4) + #39 + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Volume) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Frete) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Pedido.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_CFOP.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Str_ICMS) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Ordem_Compra.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Observacao_Faturamento.Text) + #39 + ')';

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Verifica se a Papeleta Já Existe ***

     Comando_SQL := 'select * from mb_papeletas_produtos where mb_papeleta_produto_numero = ' + Trim(ETP_Numero_Nota.Text);

     ConexaoBD.SQL_MB_Papeletas_Produtos.Close;
     ConexaoBD.SQL_MB_Papeletas_Produtos.SQL.Clear;
     ConexaoBD.SQL_MB_Papeletas_Produtos.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_MB_Papeletas_Produtos.Open;

     //*** Apaga as Papeletas Antigas se Existir ***

     If ConexaoBD.SQL_MB_Papeletas_Produtos.RecordCount > 0 Then
        Begin
        Comando_SQL := 'delete from mb_papeletas_produtos where mb_papeleta_produto_numero = ' + Trim(ETP_Numero_Nota.Text);

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;
     End;

     ConexaoBD.SQL_MB_Papeletas_Produtos.Close;

     //*** Registra os Produtos da Nota ***

     For Ind := Posicao_Inicial To Posicao_Final Do
         Begin

         Valor_Inteiro := Trim(SGD_Produtos.Cells[1,Ind]);

         If Trim(Valor_Inteiro) = '' Then
            Begin
            Valor_Inteiro := '0';
         End;

         If StrToFloat(Valor_Inteiro) > 0 Then
            Begin

            //*** Insere os Produtos Adquiridos ***

            Comando_SQL := 'Insert into mb_papeletas_produtos(';
            Comando_SQL := Comando_SQL + 'mb_papeleta_produto_numero,';
            Comando_SQL := Comando_SQL + 'mb_papeleta_produto_codigo,';
            Comando_SQL := Comando_SQL + 'mb_papeleta_produto_qtde,';
            Comando_SQL := Comando_SQL + 'mb_papeleta_produto_desc,';
            Comando_SQL := Comando_SQL + 'mb_papeleta_produto_vlr_uni,';
            Comando_SQL := Comando_SQL + 'mb_papeleta_produto_vlr_tot,';
            Comando_SQL := Comando_SQL + 'mb_papeleta_produto_lote, ';
            Comando_SQL := Comando_SQL + 'mb_papeleta_produto_posicao) ';
            Comando_SQL := Comando_SQL + ' Values(';
            Comando_SQL := Comando_SQL + #39 + Trim(ETP_Numero_Nota.Text) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[1,Ind])) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[4,Ind]) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[6,Ind])) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(Virgula_Ponto(SGD_Produtos.Cells[7,Ind])) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[5,Ind]) + #39 + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[9,Ind]) + #39 + ')';

            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            { //*** Insere o Movimento de Estoque Para a Nota Relacionda ao Pedido ***

            Comando_SQL := 'Update fb_movto_estoque Set ';
            Comando_SQL := Comando_SQL + 'fb_movto_estoque_nota = ' + Trim(ETP_Numero_Nota.Text) + ',';
            Comando_SQL := Comando_SQL + 'fb_movto_estoque_lote = ' + Trim(SGD_Produtos.Cells[5,Ind]);
            Comando_SQL := Comando_SQL + ' Where ';
            Comando_SQL := Comando_SQL + '((fb_movto_estoque_cod_registro = 52) And ';
            Comando_SQL := Comando_SQL + '(fb_movto_estoque_pedido = ' + Trim(Nro_Pedido.Text) + ') And ';
            Comando_SQL := Comando_SQL + '(fb_movto_estoque_codigo = ' + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + '))';

            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL; }
         End;
     End;

     //*** Registra o Histórico do Cliente ***

     Comando_SQL := 'Insert into mb_historicos(';
     Comando_SQL := Comando_SQL + 'mb_historico_codigo_cliente,';
     Comando_SQL := Comando_SQL + 'mb_historico_tipo_faturamento,';
     Comando_SQL := Comando_SQL + 'mb_historico_nro_nota,';
     Comando_SQL := Comando_SQL + 'mb_historico_data_emissao,';
     Comando_SQL := Comando_SQL + 'mb_historico_valor_desc,';
     Comando_SQL := Comando_SQL + 'mb_historico_valor_pedido,';
     Comando_SQL := Comando_SQL + 'mb_historico_valor_total,';
     Comando_SQL := Comando_SQL + 'mb_historico_porc_desc,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_nro_1,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_forma_1,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_dt_vcto_1,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_vlr_1,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_nro_2,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_forma_2,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_dt_vcto_2,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_vlr_2,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_nro_3,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_forma_3,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_dt_vcto_3,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_vlr_3,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_nro_4,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_forma_4,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_dt_vcto_4,';
     Comando_SQL := Comando_SQL + 'mb_historico_dup_vlr_4,';
     Comando_SQL := Comando_SQL + 'mb_historico_cfop,';
     Comando_SQL := Comando_SQL + 'mb_historico_icms)';
     Comando_SQL := Comando_SQL + ' Values(';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Tipo_Faturamento.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(ETP_Numero_Nota.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(ETP_Data_Emissao_Nota.Text,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Desconto) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Pedido) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Total) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Desconto) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_1,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Str_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_2,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Str_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_3,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Str_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Dt_Vcto_Desd_4,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Str_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_CFOP.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Vlr_Str_ICMS) + #39 + ')';

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     //*** Marca o Pedido como Faturado ***

     If ((Trim(Tipo_Nota_Emissao.Text) <> 'NFe') Or (Cliente_Tipo_Faturamento.ItemIndex = 1)) Then
        Begin
        Comando_SQL := 'Update faturados Set ';
        Comando_SQL := Comando_SQL + 'faturado_status = ' +#39+ 'Faturado' +#39;
        Comando_SQL := Comando_SQL + ' Where faturado_numero = ' + Trim(Nro_Pedido_Faturado.Text);

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
       ConexaoBD.SQL_Comunitario.ExecSQL;
     End;
end;

procedure TNotasFiscaisSaidas02.BT_SairClick(Sender: TObject);
begin
     NotasFiscaisSaidas02.Close;
end;

procedure TNotasFiscaisSaidas02.FormShow(Sender: TObject);
begin
    If Imprimir_Tela.Checked = True Then
       Begin
       Imprimir.ArqDestino := 'C:\Ibrasmak\NF_Tela.TXT';
       Imprimir.Acentuacao := acNenhum;
       End
    Else
       Begin
       Imprimir.ArqDestino := 'LPT1';
       Imprimir.Acentuacao := acANSI;
    End;

    Exibe_Grid_Produtos();
    //Opcao_Natureza_OperacaoChange(Sender);

    Ampulheta();

      // Obtem as Naturezas de Operacao
      ConexaoBD.SQL_Natureza_Operacao.Close;
      ConexaoBD.SQL_Natureza_Operacao.SQL.Clear;
      ConexaoBD.SQL_Natureza_Operacao.SQL.Add('Select * from fb_naturezas_operacao Order By fb_natureza_operacao_descricao_longa');
      ConexaoBD.SQL_Natureza_Operacao.Open;

      Opcao_Natureza_Operacao.Items.Clear;

      If ConexaoBD.SQL_Natureza_Operacao.RecordCount > 0 Then
        begin
        ConexaoBD.SQL_Natureza_Operacao.First;

        While Not ConexaoBD.SQL_Natureza_Operacao.Eof Do
          begin
          Opcao_Natureza_Operacao.Items.Add(Trim(ConexaoBD.SQL_Natureza_Operacaofb_natureza_operacao_nro.Text) + ' _ ' + Trim(ConexaoBD.SQL_Natureza_Operacaofb_natureza_operacao_cfop.Text)+' - '+ConexaoBD.SQL_Natureza_Operacaofb_natureza_operacao_descricao_longa.Text);
          ConexaoBD.SQL_Natureza_Operacao.Next;
        End;
      end;

      ConexaoBD.SQL_Natureza_Operacao.Close;

      Opcao_Natureza_Operacao.ItemIndex := 0;

      If Tipo_Nota_Emissao.Text = 'NFe' Then
         Begin
         BT_Imprimir.Caption   := 'Transmitir Nota Fiscal';
      End;

      Seta();
end;

procedure TNotasFiscaisSaidas02.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';

     //*** Prepara as Condições de Pagamento ***

     If Pagamento_Parcelado.Checked Then
        Begin
        
        End
     Else
        Begin
        Cliente_Condicao_Pgto_1  := '';
        Cliente_Condicao_Pgto_2  := '';
        Cliente_Condicao_Pgto_3  := '';
        Cliente_Condicao_Pgto_4  := '';
        Cliente_Condicao_Pgto_5  := '';
        Cliente_Condicao_Pgto_6  := '';
        Cliente_Condicao_Pgto_7  := '';
        Cliente_Condicao_Pgto_8  := '';
        Cliente_Condicao_Pgto_9  := '';
        Cliente_Condicao_Pgto_10 := '';
        Cliente_Condicao_Pgto_11 := '';
        Cliente_Condicao_Pgto_12 := '';
        Cliente_Condicao_Pgto_13 := '';
        Cliente_Condicao_Pgto_14 := '';
        Cliente_Condicao_Pgto_15 := '';
        Cliente_Condicao_Pgto_16 := '';
        Cliente_Condicao_Pgto_17 := '';
        Cliente_Condicao_Pgto_18 := '';
        Cliente_Condicao_Pgto_19 := '';
        Cliente_Condicao_Pgto_20 := '';
        Cliente_Condicao_Pgto_21 := '';
        Cliente_Condicao_Pgto_22 := '';
        Cliente_Condicao_Pgto_23 := '';
        Cliente_Condicao_Pgto_24 := '';
     End;
end;

procedure TNotasFiscaisSaidas02.SGD_ProdutosDblClick(Sender: TObject);
begin
        Application.CreateForm(TAdicionaQtdeProduto,AdicionaQtdeProduto);

        AdicionaQtdeProduto.BT_Trocar.Enabled    := False;
        AdicionaQtdeProduto.BT_Adicionar.Enabled := False;

        AdicionaQtdeProduto.Programa_Anterior.Text       := 'Notas-Inclusão';
        AdicionaQtdeProduto.Adiciona_ACol.Text           := IntToStr(SGD_Produtos.Col);
        AdicionaQtdeProduto.Adiciona_ARow.Text           := IntToStr(SGD_Produtos.Row);
        AdicionaQtdeProduto.Adiciona_Codigo_Produto.Text := SGD_Produtos.Cells[2,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Referencia.Text     := SGD_Produtos.Cells[3,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Descricao.Text      := SGD_Produtos.Cells[4,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Valor_Unitario.Text := SGD_Produtos.Cells[6,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Quantidade.Text     := SGD_Produtos.Cells[1,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_Quantidade_ANT.Text := SGD_Produtos.Cells[1,SGD_Produtos.Row];
        AdicionaQtdeProduto.Adiciona_IPI.Text            := SGD_Produtos.Cells[8,SGD_Produtos.Row];

        ConexaoBD.SQL_Produtos.Close;
        ConexaoBD.SQL_Produtos.SQL.Clear;
        ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' +#39+ Trim(SGD_Produtos.Cells[2,SGD_Produtos.Row]) + #39);
        ConexaoBD.SQL_Produtos.Open;

        AdicionaQtdeProduto.Adiciona_CF.Text             := ConexaoBD.SQL_Produtosfb_produto_classif_fiscal.Text;
        AdicionaQtdeProduto.Adiciona_ST.Text             := ConexaoBD.SQL_Produtosfb_produto_classif_tributaria.Text;
        AdicionaQtdeProduto.Adiciona_Unidade.Text        := ConexaoBD.SQL_Produtosfb_produto_unidade.Text;

        AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Lines.Clear;
        AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Lines.Add(SGD_Produtos.Cells[10,SGD_Produtos.Row]);

        AdicionaQtdeProduto.Adiciona_Nro_Ctrl_Estoque.Text := '0';
        AdicionaQtdeProduto.Adiciona_Nro_Nota_Estoque.Text := '0';
        AdicionaQtdeProduto.Adiciona_Lote_Estoque.Text     := '0';
        AdicionaQtdeProduto.Adiciona_Tipo_Faturamento.Text := Trim(Cliente_Tipo_Faturamento.Text);

        AdicionaQtdeProduto.Adiciona_IPI.Enabled     := True;
        AdicionaQtdeProduto.Adiciona_CF.Enabled      := True;
        AdicionaQtdeProduto.Adiciona_ST.Enabled      := True;
        AdicionaQtdeProduto.Adiciona_Unidade.Enabled := True;

        AdicionaQtdeProduto.ShowModal;
        AdicionaQtdeProduto.Destroy;

        SGD_Produtos.Refresh;
end;

procedure TNotasFiscaisSaidas02.BT_ImprimirClick(Sender: TObject);

var
   Faltou_CF: Boolean;
   Ind_Linha_CF: Integer;

begin
     Faltou_CF := False;

     If ((Trim(Cliente_Tipo_Faturamento.Text) = 'Nota Fiscal') And ((Trim(Cliente_CFOP.Text) = '') Or (Trim(Cliente_Natureza_Operacao.Text) = ''))) Then
        Begin
        MSG_Erro('O CFOP ou a Descrição da Natureza de Operação não foram Informados...');
        Cliente_CFOP.SetFocus;
        End
     Else
        Begin

        For Ind_Linha_CF := 1 To (SGD_Produtos.RowCount - 1) Do
            Begin

            If Trim(SGD_Produtos.Cells[2,Ind_Linha_CF]) <> '' Then
               Begin
               ConexaoBD.SQL_Produtos.Close;
               ConexaoBD.SQL_Produtos.SQL.Clear;
               ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' +#39+ Trim(SGD_Produtos.Cells[2,Ind_Linha_CF]) + #39);
               ConexaoBD.SQL_Produtos.Open;

               If Trim(ConexaoBD.SQL_Produtosfb_produto_classif_fiscal.Text) = '' Then
                  Begin
                  Faltou_CF := True;
               End;

               If Trim(ConexaoBD.SQL_Produtosfb_produto_classif_tributaria.Text) = '' Then
                  Begin
                  Faltou_CF := True;
               End;
            End;
        End;

        If Faltou_CF Then
           Begin
           Seta();
           MSG_Erro('Atenção: Existe(m) Produto(s) sem Classificação Fiscal ou Situação Tributária. Por favor, altere e tente imprimir novamente.');
           End
        Else
           Begin

           //*** Etapa 01 - Data da Nota Fiscal ***

           Application.CreateForm(TMSGNFEtapa01_2,MSGNFEtapa01_2);
           MSGNFEtapa01_2.ShowModal;
           MSGNFEtapa01_2.Destroy;

           If ETP_Resultado.Text = 'Etapa_02' Then
              Begin

              //*** Etapa 02 - Numero da Nota Fiscal ***

              Application.CreateForm(TMSGNFEtapa02_2,MSGNFEtapa02_2);
              MSGNFEtapa02_2.ShowModal;
              MSGNFEtapa02_2.Destroy;

              //*** Etapa 04 - Confirmar a Emissão da Nota ***

              If ETP_Resultado.Text = 'Etapa_04' Then
                 Begin
                 Application.CreateForm(TMSGNFEtapa04_2,MSGNFEtapa04_2);
                 MSGNFEtapa04_2.ShowModal;
                 MSGNFEtapa04_2.Destroy;

                 //*** Impressao da Nota ***

                 If ETP_Resultado.Text = 'Impressao' Then
                    Begin
                    If Trim(Cliente_Tipo_Faturamento.Text) = 'Nota Fiscal' Then
                       Begin
                       //*** Informa o Nro de Linhas para a Nota Fiscal ***
                       Imprimir.Linhas := 66;
                       Imprime_Nota();
                       End
                    Else
                       Begin
                       //*** Informa o Nro de Linhas para a Papeleta ***
                       Imprimir.Linhas := 66;
                       Imprime_OS();

                       If Imprimir_Tela.Checked = False Then
                          Begin
                          NotasFiscaisSaidas02.Close;
                       End;

                    End;

                 End;
              End;
           End;
        End;
     End;
end;

procedure TNotasFiscaisSaidas02.SGD_ProdutosKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Application.CreateForm(TCodigoProdutoNotaCliente00,CodigoProdutoNotaCliente00);

        CodigoProdutoNotaCliente00.Programa_Anterior.Text       := 'Nota-Fiscal';
        CodigoProdutoNotaCliente00.Adiciona_ACol.Text           := IntToStr(SGD_Produtos.Col);
        CodigoProdutoNotaCliente00.Adiciona_ARow.Text           := IntToStr(SGD_Produtos.Row);

        CodigoProdutoNotaCliente00.Adiciona_Codigo_Produto.Text := SGD_Produtos.Cells[2,SGD_Produtos.Row];
        CodigoProdutoNotaCliente00.Adiciona_Referencia.Text     := SGD_Produtos.Cells[3,SGD_Produtos.Row];
        CodigoProdutoNotaCliente00.Adiciona_Descricao.Text      := SGD_Produtos.Cells[4,SGD_Produtos.Row];
        CodigoProdutoNotaCliente00.Adiciona_Quantidade.Text     := SGD_Produtos.Cells[1,SGD_Produtos.Row];
        CodigoProdutoNotaCliente00.Adiciona_Valor_Unitario.Text := SGD_Produtos.Cells[6,SGD_Produtos.Row];

        CodigoProdutoNotaCliente00.Adiciona_Codigo_Cliente.Text := SGD_Produtos.Cells[0,SGD_Produtos.Row];

        CodigoProdutoNotaCliente00.ShowModal;
        CodigoProdutoNotaCliente00.Destroy;
     End;
end;

procedure TNotasFiscaisSaidas02.Natureza_OperacaoChange(Sender: TObject);
begin
     Cliente_Natureza_Operacao.Text := Natureza_Operacao.Text;
end;

procedure TNotasFiscaisSaidas02.Cliente_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_Tipo_TransporteKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_Pgto_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Natureza_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_CFOPKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_Natureza_OperacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_Aliquota_ICMSKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_Tipo_FaturamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_TransportadoraKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_Emite_LoteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Qtde_VolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.EspecieKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.MarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Peso_BrutoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Peso_LiquidoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_Base_ReduzidaKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Opcao_Natureza_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_CFOP_2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_AlimentacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_SolicitadoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.ComboBox4KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Cliente_Ordem_CompraKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TNotasFiscaisSaidas02.Opcao_Natureza_OperacaoChange(Sender: TObject);
var
  Nro_Natureza : string;

begin
     {Cliente_Natureza_Operacao.Text := UpperCase( Trim(Opcao_Natureza_Operacao.Text) );

     If Trim(Cliente_Estado.Text) = 'SP' Then
        Begin

        If Trim(Opcao_Natureza_Operacao.Text) = 'Vendas' Then
           Begin
           Cliente_CFOP.Text := '5.101';
           End
        Else
           Begin
           Cliente_CFOP.Text := '5.901';
        End;

        End
     Else
        Begin

        If Trim(Opcao_Natureza_Operacao.Text) = 'Vendas' Then
           Begin
           Cliente_CFOP.Text := '6.101';
           End
        Else
           Begin
           Cliente_CFOP.Text := '6.901';
        End;

     End;}

     Nro_Natureza := Obtem_Nro_Antes_Traco(Opcao_Natureza_Operacao.Text);

     ConexaoBD.SQL_Natureza_Operacao.Close;
     ConexaoBD.SQL_Natureza_Operacao.SQL.Clear;
     ConexaoBD.SQL_Natureza_Operacao.SQL.Add('Select * from fb_naturezas_operacao where fb_natureza_operacao_nro = '+#39+Trim(Nro_Natureza)+#39);
     ConexaoBD.SQL_Natureza_Operacao.Open;

     If ConexaoBD.SQL_Natureza_Operacao.RecordCount > 0 Then
     begin
        Cliente_CFOP.Text := ConexaoBD.SQL_Natureza_Operacaofb_natureza_operacao_cfop.Text;
        Cliente_CFOP_2.Text := ConexaoBD.SQL_Natureza_Operacaofb_natureza_operacao_cfop.Text;
        Cliente_Natureza_Operacao.Text := ConexaoBD.SQL_Natureza_Operacaofb_natureza_operacao_descricao_curta.Text;

        If Trim(DBG_Observacao_Nota.Text) <> '' Then
           Begin
           Observacao_Nota.Lines.Clear;
           Observacao_Nota.Lines.Add(DBG_Observacao_Nota.Text);
        End;
     end;

end;

procedure TNotasFiscaisSaidas02.Imprimir_TelaClick(Sender: TObject);
begin
    If Imprimir_Tela.Checked = True Then
       Begin
       Imprimir.ArqDestino := 'C:\Ibrasmak\NF_Tela.TXT';
       Imprimir.Acentuacao := acNenhum;
       End
    Else
       Begin
       Imprimir.ArqDestino := 'LPT1';
       Imprimir.Acentuacao := acANSI;
    End;
end;

procedure TNotasFiscaisSaidas02.Cliente_DescontoExit(Sender: TObject);
var
  Erro: Integer;
  Porc_Desconto, Vlr_Total, Vlr_Desconto, Vlr_Pedido, Vlr_Frete, Vlr_IPI: Real;
  Porc_Desconto_Str, Vlr_Total_Str, Vlr_Pedido_Str, Vlr_Frete_Str, Vlr_IPI_Str: string;

begin
    //*** Zera as Variáveis de Cáculo ***

    Porc_Desconto := 0;
    Vlr_Pedido    := 0;
    Vlr_Frete     := 0;
    Vlr_IPI       := 0;
    Vlr_Total     := 0;

    //*** Recuperando Valores
    Porc_Desconto_Str := Trim(Virgula_Ponto(Cliente_Desconto.Text));
    Val(Porc_Desconto_Str,Porc_Desconto,Erro);

    Vlr_Pedido_Str := Trim(Virgula_Ponto(Valor_Pedido.Text));
    Val(Vlr_Pedido_Str,Vlr_Pedido,Erro);

    Vlr_Frete_Str := Trim(Virgula_Ponto(Valor_Frete.Text));
    Val(Vlr_Frete_Str,Vlr_Frete,Erro);

    Vlr_IPI_Str := Trim(Virgula_Ponto(Valor_IPI.Text));
    Val(Vlr_IPI_Str,Vlr_IPI,Erro);

    Vlr_Total_Str := Trim(Virgula_Ponto(Valor_Total.Text));
    Val(Vlr_Total_Str,Vlr_Total,Erro);

    //*** Obtendo novo Valor Total
    Vlr_Desconto := ((Vlr_Pedido * Porc_Desconto) / 100);
    Str(Vlr_Desconto:13:2,Vlr_Desconto_Str);
    Val(Vlr_Desconto_Str,Vlr_Desconto,Erro);

    Vlr_Total := (Vlr_Pedido - Vlr_Desconto);

    Str(Vlr_Desconto:13:2,Vlr_Desconto_Str);
    Vlr_Desconto_Str := Ponto_Virgula(Trim(Vlr_Desconto_Str));
    Valor_Desconto.Text := Vlr_Desconto_Str;

    Str(Vlr_Total:13:2,Vlr_Total_Str);
    Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));
    Valor_Total.Text := Vlr_Total_Str;

end;

procedure TNotasFiscaisSaidas02.Altera_Faturado();

var
   Ind, Erro: Integer;
   Qtde_Nro_1, Qtde_Nro_2, Qtde_Res_Nro: Real;
   Qtde_Str_1, Qtde_Str_2, Qtde_Res_Str: String;

   Comando_SQL, Emite_Lote, Transportadora, Valor_Inteiro: String;
   Vlr_Frete, Vlr_Desconto, Vlr_IPI, Vlr_Pedido, Vlr_Total, Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4: String;
   Nro_Faturado, DT_Entrega: String;

begin
     Ampulheta();

     //*** Obtem os Valores ***

     DT_Entrega        := Trim(Data_Entrega.Text);
 
     Vlr_IPI           := Trim(Virgula_Ponto(Valor_IPI.Text));
     Vlr_Frete         := Trim(Virgula_Ponto(Valor_Frete.Text));
     Vlr_Desconto      := Trim(Virgula_Ponto(Valor_Desconto.Text));
     Vlr_Pedido        := Trim(Virgula_Ponto(Valor_Pedido.Text));
     Vlr_Total         := Trim(Virgula_Ponto(Valor_Total.Text));
     Desconto          := Trim(Virgula_Ponto(Cliente_Desconto.Text));

     If Trim(DT_Entrega) = '/  /' Then
        Begin
        DT_Entrega := '00/00/0000';
     End;

     If Trim(Vlr_IPI) = '' Then
        Begin
        Vlr_IPI := '0';
     End;

     If Trim(Vlr_Frete) = '' Then
        Begin
        Vlr_Frete := '0';
     End;

     If Trim(Vlr_Desconto) = '' Then
        Begin
        Vlr_Desconto := '0';
     End;

     If Trim(Vlr_Pedido) = '' Then
        Begin
        Vlr_Pedido := '0';
     End;

     If Trim(Vlr_Total) = '' Then
        Begin
        Vlr_Total := '0';
     End;

     If Trim(Desconto) = '' Then
        Begin
        Desconto := '0';
     End;

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

     //*** Obtem a Emissão do Lote ***

     If Cliente_Emite_Lote.Text = 'Sim' Then
        Begin
        Emite_Lote := 'S';
        End
     Else
        Begin
        Emite_Lote := 'N';
     End;

     //*** Obtem o Nro da Transportadora ***

     Transportadora := Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text);

     //*** Insere o Pedido Principal ***

     Comando_SQL := 'Update faturados Set ';
     Comando_SQL := Comando_SQL + 'faturado_cliente_desconto = ' + Desconto + ',';
     Comando_SQL := Comando_SQL + 'faturado_cliente_condicao_pgto_1 = ' + Cond_Pgto_1 + ',';
     Comando_SQL := Comando_SQL + 'faturado_cliente_condicao_pgto_2 = ' + Cond_Pgto_2 + ',';
     Comando_SQL := Comando_SQL + 'faturado_cliente_condicao_pgto_3 = ' + Cond_Pgto_3 + ',';
     Comando_SQL := Comando_SQL + 'faturado_cliente_condicao_pgto_4 = ' + Cond_Pgto_4 + ',';
     Comando_SQL := Comando_SQL + 'faturado_cliente_tipo_faturamento = ' + #39 + Cliente_Tipo_Faturamento.Text + #39 + ',';
     Comando_SQL := Comando_SQL + 'faturado_cliente_emite_lote = ' + #39 + Emite_Lote + #39 + ',';
     Comando_SQL := Comando_SQL + 'faturado_cliente_tipo_transporte = ' + #39 + Cliente_Tipo_Transporte.Text + #39 + ',';
     Comando_SQL := Comando_SQL + 'faturado_cliente_transportadora = ' + Transportadora + ',';
     Comando_SQL := Comando_SQL + 'faturado_valor_desconto = ' + Vlr_Desconto + ',';
     Comando_SQL := Comando_SQL + 'faturado_valor_pedido = ' + Vlr_Pedido + ',';
     Comando_SQL := Comando_SQL + 'faturado_valor_ipi = ' + Vlr_IPI + ',';
     Comando_SQL := Comando_SQL + 'faturado_numero_nota_fiscal = ' + '0' + ',';
     Comando_SQL := Comando_SQL + 'faturado_cliente_pgto_frete = ' + #39 + Cliente_Pgto_Frete.Text + #39 + ',';
     Comando_SQL := Comando_SQL + 'faturado_data = ' + #39 + Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','/') + #39 + ',';

     If Trim(DT_Entrega) <> '00/00/0000' Then
        Begin
        Comando_SQL := Comando_SQL + 'faturado_data_entrega = ' + #39 + Inverte_Data_Plus(Trim(DT_Entrega),'amd','/') + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + 'faturado_natureza_operacao = ' + #39 + Trim(Natureza_Operacao.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + 'faturado_valor_frete = ' + Vlr_Frete + ',';
     Comando_SQL := Comando_SQL + 'faturado_cliente_observacao = ' + #39 + Cliente_Observacao.Text + #39 + ',';
     Comando_SQL := Comando_SQL + 'faturado_nota_observacao = ' + #39 + Trim(Observacao_Nota.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + 'faturado_pedido_numero = ' + Trim(Nro_Pedido.Text) + ',';
     Comando_SQL := Comando_SQL + 'faturado_ordem_compra = ' + #39 + Cliente_Ordem_Compra.Text + #39 + ', ';
     Comando_SQL := Comando_SQL + 'faturado_status_txt = ' + #39 + 'TXT Gerado' + #39 + ', ';
     Comando_SQL := Comando_SQL + 'faturado_status_nf = ' + #39 + IntToStr(StrToInt(ETP_Numero_Nota.Text)) + #39 + ', ';
     Comando_SQL := Comando_SQL + 'faturado_cfop = ' + #39 + Trim(Cliente_CFOP.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + 'faturado_aliquota_icms = ' + #39 + Virgula_Ponto(Cliente_Aliquota_ICMS.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + 'faturado_base_reduzida = ' + #39 + Virgula_Ponto(Cliente_Base_Reduzida.Text) + #39 + ', ';

     If Nota_Revenda.Checked Then
        Begin
        Comando_SQL := Comando_SQL + 'faturado_revenda = ' + #39 + 'S' + #39 + ', ';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + 'faturado_revenda = ' + #39 + 'N' + #39 + ', ';
     End;

     If Nota_Consumo.Checked Then
        Begin
        Comando_SQL := Comando_SQL + 'faturado_consumo = ' + #39 + 'S' + #39 + ', ';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + 'faturado_consumo = ' + #39 + 'N' + #39 + ', ';
     End;

     If Zera_Base_ICMS.Checked Then
        Begin
        Comando_SQL := Comando_SQL + 'faturado_zera_base = ' + #39 + 'S' + #39 + ', ';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + 'faturado_zera_base = ' + #39 + 'N' + #39 + ', ';
     End;

     If Total_NF_IPI.Checked Then
        Begin
        Comando_SQL := Comando_SQL + 'faturado_total_nf_ipi = ' + #39 + 'S' + #39 + ', ';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + 'faturado_total_nf_ipi = ' + #39 + 'N' + #39 + ', ';
     End;

     Comando_SQL := Comando_SQL + 'faturado_volume = ' + #39 + Virgula_Ponto(Qtde_Volume.Text) + #39 + ', ';
     Comando_SQL := Comando_SQL + 'faturado_peso = ' + #39 + Virgula_Ponto(Peso_liquido.Text) + #39 + ' ';
     Comando_SQL := Comando_SQL + ' Where faturado_numero = ' + Trim(Nro_Pedido_Faturado.Text);

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;
end;

end.


