unit Registro_Notas_Fiscais_Saidas_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Grids, ComCtrls, ImpMat,
  DBCtrls;

type
  TRegistroNotasFiscaisSaidas01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Nota_Base_ICMS: TEdit;
    Nota_Valor_ICMS: TEdit;
    Nota_Base_ICMS_Sub: TEdit;
    Nota_Valor_ICMS_Sub: TEdit;
    Nota_Valor_Produto: TEdit;
    Valor_Frete: TEdit;
    Nota_Valor_Seguro: TEdit;
    Nota_Outras_Despesas: TEdit;
    Valor_IPI: TEdit;
    Valor_Total: TEdit;
    Qtde_Volume: TEdit;
    Especie: TEdit;
    Marca: TEdit;
    Peso_Bruto: TEdit;
    Peso_Liquido: TEdit;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    Label3: TLabel;
    Cliente_Codigo: TEdit;
    Cliente_Nome: TEdit;
    BT_Procurar: TBitBtn;
    GroupBox2: TGroupBox;
    Label29: TLabel;
    Label9: TLabel;
    Label34: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label48: TLabel;
    Label2: TLabel;
    Label28: TLabel;
    Label49: TLabel;
    Label52: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Nota_Numero: TEdit;
    Nota_Emissao: TMaskEdit;
    Cliente_CFOP: TEdit;
    Natureza_Operacao: TComboBox;
    Cliente_Natureza_Operacao: TEdit;
    Cliente_Tipo_Transporte: TComboBox;
    Cliente_Pgto_Frete: TComboBox;
    Cliente_Aliquota_ICMS: TEdit;
    Cliente_Transportadora: TComboBox;
    Cliente_Emite_Lote: TComboBox;
    Observacao_Nota: TMemo;
    Cliente_Observacao: TMemo;
    Observacao_Corpo_Nota: TCheckBox;
    GroupBox3: TGroupBox;
    BT_Adicionar: TBitBtn;
    SGD_Produtos: TStringGrid;
    Nro_Natureza_Operacao: TEdit;
    Cliente_Endereco_Cobranca: TEdit;
    Cliente_Complemento_Cobranca: TEdit;
    Cliente_Bairro_Cobranca: TEdit;
    Cliente_Cidade_Cobranca: TEdit;
    Cliente_Estado_Cobranca: TEdit;
    Cliente_Pais_Cobranca: TEdit;
    Cliente_Cep_Cobranca: TEdit;
    Nro_Tipo_Tabela: TEdit;
    Nro_Transportadora: TEdit;
    Nro_Pgto_Frete: TEdit;
    Cliente_Codigo_Tipo: TEdit;
    Cliente_Tipo_Pessoa: TEdit;
    Cliente_Inscricao_Estadual: TEdit;
    Codigo_Transportadora: TEdit;
    ETP_Resultado: TEdit;
    ETP_Data_Emissao_Nota: TEdit;
    ETP_Numero_Nota: TEdit;
    Cliente_Vendedor: TEdit;
    Cliente_Banco: TEdit;
    Nro_Pedido_Faturado: TEdit;
    Cliente_Suframa: TEdit;
    Valor_Desconto: TEdit;
    Cliente_Estado: TComboBox;
    Cliente_Cep: TMaskEdit;
    Cliente_Pais: TComboBox;
    Cliente_Endereco: TEdit;
    Cliente_Cidade: TEdit;
    Cliente_Contato: TEdit;
    Cliente_Bairro: TEdit;
    Cliente_Email: TEdit;
    Cliente_Fone_Fax: TEdit;
    Cliente_Fone_Comercial: TEdit;
    Cliente_Fone_Celular: TEdit;
    Cliente_Tipo_Faturamento: TComboBox;
    Cliente_Site: TEdit;
    PageControl1: TPageControl;
    Pagina1: TTabSheet;
    Pagina2: TTabSheet;
    Label46: TLabel;
    Cliente_Desconto: TEdit;
    Tipo_Nota_Saida: TRadioButton;
    Label32: TLabel;
    Tipo_Nota_Entrada: TRadioButton;
    Label38: TLabel;
    Cliente_Base_Reduzida: TEdit;
    Label37: TLabel;
    Cliente_Ordem_Compra: TEdit;
    Nota_Consumo: TCheckBox;
    Zera_Base_ICMS: TCheckBox;
    Cliente_Condicao_Pgto_Vlr_1: TEdit;
    Cliente_Condicao_Pgto_1: TMaskEdit;
    Cliente_Condicao_Pgto_2: TMaskEdit;
    Cliente_Condicao_Pgto_3: TMaskEdit;
    Cliente_Condicao_Pgto_4: TMaskEdit;
    Cliente_Condicao_Pgto_Vlr_2: TEdit;
    Cliente_Condicao_Pgto_Vlr_3: TEdit;
    Cliente_Condicao_Pgto_Vlr_4: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label27: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    BT_Adicionar_Fora: TBitBtn;
    Imprimir: TImpMat;
    Cliente_Complemento: TEdit;
    Cliente_DDD: TEdit;
    Cliente_Fone_Residencial: TEdit;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    Programa_Anterior: TEdit;
    Cliente_Fone_Ramal: TEdit;
    IPI_Zerado: TEdit;
    BT_Procurar_Fornecedores: TBitBtn;
    Edit_Tipo_Inclusao: TEdit;
    Imprime_Nota_Tela: TRadioButton;
    Imprime_Nota_Apos: TRadioButton;
    DBG_NF_FB_Faturados_Produto_Descricao_Detalhada: TDBMemo;
    BT_Calcular: TBitBtn;
    DBG_Observacao_Nota: TDBMemo;
    Opcao_Sem_Duplicata: TCheckBox;
    Cliente_Condicao_Pgto_5: TMaskEdit;
    Cliente_Condicao_Pgto_6: TMaskEdit;
    Cliente_Condicao_Pgto_7: TMaskEdit;
    Cliente_Condicao_Pgto_8: TMaskEdit;
    Cliente_Condicao_Pgto_9: TMaskEdit;
    Cliente_Condicao_Pgto_10: TMaskEdit;
    Cliente_Condicao_Pgto_11: TMaskEdit;
    Cliente_Condicao_Pgto_12: TMaskEdit;
    Cliente_Condicao_Pgto_13: TMaskEdit;
    Cliente_Condicao_Pgto_14: TMaskEdit;
    Cliente_Condicao_Pgto_15: TMaskEdit;
    Cliente_Condicao_Pgto_16: TMaskEdit;
    Cliente_Condicao_Pgto_17: TMaskEdit;
    Cliente_Condicao_Pgto_18: TMaskEdit;
    Cliente_Condicao_Pgto_19: TMaskEdit;
    Cliente_Condicao_Pgto_20: TMaskEdit;
    Cliente_Condicao_Pgto_21: TMaskEdit;
    Cliente_Condicao_Pgto_22: TMaskEdit;
    Cliente_Condicao_Pgto_23: TMaskEdit;
    Cliente_Condicao_Pgto_24: TMaskEdit;
    Cliente_Condicao_Pgto_Vlr_5: TEdit;
    Cliente_Condicao_Pgto_Vlr_6: TEdit;
    Cliente_Condicao_Pgto_Vlr_7: TEdit;
    Cliente_Condicao_Pgto_Vlr_8: TEdit;
    Cliente_Condicao_Pgto_Vlr_9: TEdit;
    Cliente_Condicao_Pgto_Vlr_10: TEdit;
    Cliente_Condicao_Pgto_Vlr_11: TEdit;
    Cliente_Condicao_Pgto_Vlr_12: TEdit;
    Cliente_Condicao_Pgto_Vlr_13: TEdit;
    Cliente_Condicao_Pgto_Vlr_14: TEdit;
    Cliente_Condicao_Pgto_Vlr_15: TEdit;
    Cliente_Condicao_Pgto_Vlr_16: TEdit;
    Cliente_Condicao_Pgto_Vlr_17: TEdit;
    Cliente_Condicao_Pgto_Vlr_18: TEdit;
    Cliente_Condicao_Pgto_Vlr_19: TEdit;
    Cliente_Condicao_Pgto_Vlr_20: TEdit;
    Cliente_Condicao_Pgto_Vlr_21: TEdit;
    Cliente_Condicao_Pgto_Vlr_22: TEdit;
    Cliente_Condicao_Pgto_Vlr_23: TEdit;
    Cliente_Condicao_Pgto_Vlr_24: TEdit;
    Total_NF_IPI: TCheckBox;
    Tipo_Nota_Emissao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure Nota_NumeroKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_EmissaoKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_EntradaKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_RecebimentoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_CFOPKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_NaturezaKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Condicao_Pgto_1KeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Condicao_Pgto_2KeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Condicao_Pgto_3KeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Condicao_Pgto_4KeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Aliquota_ISSKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_ISSKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_ServicosKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Base_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Base_ICMS_SubKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_ICMS_SubKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure Valor_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Valor_SeguroKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Outras_DespesasKeyPress(Sender: TObject; var Key: Char);
    procedure Valor_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure Valor_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_CNPJKeyPress(Sender: TObject; var Key: Char);
    procedure Transportadora_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_Pgto_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_VolumeKeyPress(Sender: TObject; var Key: Char);
    procedure EspecieKeyPress(Sender: TObject; var Key: Char);
    procedure MarcaKeyPress(Sender: TObject; var Key: Char);
    procedure Peso_BrutoKeyPress(Sender: TObject; var Key: Char);
    procedure Peso_LiquidoKeyPress(Sender: TObject; var Key: Char);
    procedure Nota_ObsKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Nota_Base_ICMSExit(Sender: TObject);
    procedure Nota_Valor_ICMSExit(Sender: TObject);
    procedure Nota_Base_ICMS_SubExit(Sender: TObject);
    procedure Nota_Valor_ICMS_SubExit(Sender: TObject);
    procedure Nota_Valor_ProdutoExit(Sender: TObject);
    procedure Valor_FreteExit(Sender: TObject);
    procedure Nota_Valor_SeguroExit(Sender: TObject);
    procedure Nota_Outras_DespesasExit(Sender: TObject);
    procedure Valor_IPIExit(Sender: TObject);
    procedure Valor_TotalExit(Sender: TObject);
    procedure Qtde_VolumeExit(Sender: TObject);
    procedure Peso_BrutoExit(Sender: TObject);
    procedure Peso_LiquidoExit(Sender: TObject);
    procedure BT_AdicionarClick(Sender: TObject);
    procedure SGD_ProdutosDblClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cliente_DescontoExit(Sender: TObject);
    procedure Cliente_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Condicao_Pgto_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Condicao_Pgto_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Condicao_Pgto_3KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Condicao_Pgto_4KeyPress(Sender: TObject;
      var Key: Char);
    procedure Natureza_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Natureza_OperacaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Tipo_Nota_SaidaKeyPress(Sender: TObject; var Key: Char);
    procedure Tipo_Nota_EntradaKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Tipo_TransporteKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Pgto_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_TransportadoraKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Emite_LoteKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Aliquota_ICMSKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Aliquota_ICMSExit(Sender: TObject);
    procedure Cliente_Base_ReduzidaExit(Sender: TObject);
    procedure Cliente_Base_ReduzidaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Ordem_CompraKeyPress(Sender: TObject; var Key: Char);
    procedure Natureza_OperacaoChange(Sender: TObject);
    procedure SGD_ProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente_Condicao_Pgto_Vlr_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Condicao_Pgto_Vlr_2KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Condicao_Pgto_Vlr_3KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Condicao_Pgto_Vlr_4KeyPress(Sender: TObject;
      var Key: Char);
    procedure Cliente_Condicao_Pgto_Vlr_1Exit(Sender: TObject);
    procedure Cliente_Condicao_Pgto_Vlr_2Exit(Sender: TObject);
    procedure Cliente_Condicao_Pgto_Vlr_3Exit(Sender: TObject);
    procedure Cliente_Condicao_Pgto_Vlr_4Exit(Sender: TObject);
    procedure BT_Adicionar_ForaClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_Procurar_FornecedoresClick(Sender: TObject);
    procedure BT_CalcularClick(Sender: TObject);
    procedure Opcao_Sem_DuplicataClick(Sender: TObject);
    procedure Imprime_Nota_AposClick(Sender: TObject);
    procedure Imprime_Nota_TelaClick(Sender: TObject);

  private
    { Private declarations }
    function ConversaoRecursiva(N: LongWord): string;
    function Extenso(parmNumero: Real): string;
    function Letra_Maiuscula(Texto: String): string;
    function Prepara_Volume(Posicao_Inicial, Posicao_Final: Integer): string;    

    function Valida_Dados(): Boolean;

    procedure Exibe_Grid_Produtos();
    procedure Carrega_Transportadoras();
    procedure Carrega_Pgto_Frete();
    procedure Totaliza_Pedido();
    procedure Prepara_Condicao();
    procedure Imprime_Nota();
    procedure Imprime_Nota_Ibrasmak(Posicao_Inicial, Posicao_Final: Integer);
    procedure Grava_Nota_Ibrasmak(Posicao_Inicial, Posicao_Final: Integer);
    procedure Totaliza_Nota(Posicao_Inicial, Posicao_Final: Integer);

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
  RegistroNotasFiscaisSaidas01: TRegistroNotasFiscaisSaidas01;

  Nro_Nota_Desd_1, Nro_Nota_Desd_2, Nro_Nota_Desd_3, Nro_Nota_Desd_4, Nro_Nota_Desd_5, Nro_Nota_Desd_6, Nro_Nota_Desd_7, Nro_Nota_Desd_8, Nro_Nota_Desd_9, Nro_Nota_Desd_10, Nro_Nota_Desd_11, Nro_Nota_Desd_12, Nro_Nota_Desd_13, Nro_Nota_Desd_14, Nro_Nota_Desd_15, Nro_Nota_Desd_16, Nro_Nota_Desd_17, Nro_Nota_Desd_18, Nro_Nota_Desd_19, Nro_Nota_Desd_20, Nro_Nota_Desd_21, Nro_Nota_Desd_22, Nro_Nota_Desd_23, Nro_Nota_Desd_24: String;

  Dt_Vcto_Desd_1, Dt_Vcto_Desd_2, Dt_Vcto_Desd_3, Dt_Vcto_Desd_4, Dt_Vcto_Desd_5, Dt_Vcto_Desd_6, Dt_Vcto_Desd_7, Dt_Vcto_Desd_8, Dt_Vcto_Desd_9, Dt_Vcto_Desd_10, Dt_Vcto_Desd_11, Dt_Vcto_Desd_12, Dt_Vcto_Desd_13, Dt_Vcto_Desd_14, Dt_Vcto_Desd_15, Dt_Vcto_Desd_16, Dt_Vcto_Desd_17, Dt_Vcto_Desd_18, Dt_Vcto_Desd_19, Dt_Vcto_Desd_20, Dt_Vcto_Desd_21, Dt_Vcto_Desd_22, Dt_Vcto_Desd_23, Dt_Vcto_Desd_24: String;

  Vlr_Desd_1, Vlr_Desd_2, Vlr_Desd_3, Vlr_Desd_4, Vlr_Desd_5, Vlr_Desd_6, Vlr_Desd_7, Vlr_Desd_8, Vlr_Desd_9, Vlr_Desd_10, Vlr_Desd_11, Vlr_Desd_12, Vlr_Desd_13, Vlr_Desd_14, Vlr_Desd_15, Vlr_Desd_16, Vlr_Desd_17, Vlr_Desd_18, Vlr_Desd_19, Vlr_Desd_20, Vlr_Desd_21, Vlr_Desd_22, Vlr_Desd_23, Vlr_Desd_24: Real;

  Vlr_Str_Desd_1, Vlr_Str_Desd_2, Vlr_Str_Desd_3, Vlr_Str_Desd_4, Vlr_Str_Desd_5, Vlr_Str_Desd_6, Vlr_Str_Desd_7, Vlr_Str_Desd_8, Vlr_Str_Desd_9, Vlr_Str_Desd_10, Vlr_Str_Desd_11, Vlr_Str_Desd_12, Vlr_Str_Desd_13, Vlr_Str_Desd_14, Vlr_Str_Desd_15, Vlr_Str_Desd_16, Vlr_Str_Desd_17, Vlr_Str_Desd_18, Vlr_Str_Desd_19, Vlr_Str_Desd_20, Vlr_Str_Desd_21, Vlr_Str_Desd_22, Vlr_Str_Desd_23, Vlr_Str_Desd_24: String;

  Forma_Desd_1, Forma_Desd_2, Forma_Desd_3, Forma_Desd_4, Forma_Desd_5, Forma_Desd_6, Forma_Desd_7, Forma_Desd_8, Forma_Desd_9, Forma_Desd_10, Forma_Desd_11, Forma_Desd_12, Forma_Desd_13, Forma_Desd_14, Forma_Desd_15, Forma_Desd_16, Forma_Desd_17, Forma_Desd_18, Forma_Desd_19, Forma_Desd_20, Forma_Desd_21, Forma_Desd_22, Forma_Desd_23, Forma_Desd_24: String;

  Volume: String;
  Total_Nota_Str, Total_Desconto_Str, Total_Desconto_Str_Ant, Vlr_Total_Produtos_Str, Vlr_Frete_Str, Vlr_Frete_Produto_Str, Vlr_IPI_Str, Vlr_Desconto_Str, Porcentagem_Desconto_Str: String;
  Total_Nota, Total_Desconto, Vlr_Total_Produtos, Vlr_Frete, Vlr_Frete_Produto, Vlr_IPI, Vlr_Desconto, Porcentagem_Desconto: Real;
  Vlr_Str_ICMS, Vlr_ICMS_Str: String;
  Nro_Nota: Integer;

  CX_1, CX_2, CX_3, CX_Peq, CX_48, CX_100, CX_Exp: Integer;

  Vlr_Total_Produtos_Substituicao_Str: String;
  Vlr_Total_Produtos_Substituicao: Real;

  Dia_Parcela_1, Dia_Parcela_2, Dia_Parcela_3, Dia_Parcela_4, Dia_Parcela_5, Dia_Parcela_6, Dia_Parcela_7, Dia_Parcela_8,
  Dia_Parcela_9, Dia_Parcela_10, Dia_Parcela_11, Dia_Parcela_12, Dia_Parcela_13, Dia_Parcela_14, Dia_Parcela_15, Dia_Parcela_16,
  Dia_Parcela_17, Dia_Parcela_18, Dia_Parcela_19, Dia_Parcela_20, Dia_Parcela_21, Dia_Parcela_22, Dia_Parcela_23, Dia_Parcela_24: String;

  Classificacao_Tributaria: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Clientes_00, Ordem_02,
  Adiciona_Produto_Relacao, Codigo_Produto_Nota_Cliente_00,
  Adiciona_Qtde_Produto, Adiciona_Qtde_Produto_02,
  Registro_Notas_Fiscais_Saidas_00, Fornecedor_00, Notas_Fiscais_Saidas_04;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TRegistroNotasFiscaisSaidas01.ConversaoRecursiva(N: LongWord): string;
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

function TRegistroNotasFiscaisSaidas01.Extenso(parmNumero: Real): string;
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

function TRegistroNotasFiscaisSaidas01.Letra_Maiuscula(Texto: String): string;

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

function TRegistroNotasFiscaisSaidas01.Prepara_Volume(Posicao_Inicial, Posicao_Final: Integer): string;

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

function TRegistroNotasFiscaisSaidas01.Valida_Dados(): Boolean;

var
   Erro, Campo_Retorno, Valor_Inteiro: String;
   Resultado, Qtde_Nao_Preenchida: Boolean;
   Ind: Integer;

begin
     Resultado           := True;
     Campo_Retorno       := '';

     Ampulheta();

     If Trim(Cliente_Codigo.Text) = '' Then
        Begin
        Erro          := 'O Cliente Não foi Selecionado.';
        Campo_Retorno := '';
        End
     Else If (Trim(Nota_Numero.Text) = '') Or (Trim(Nota_Numero.Text) = '0') Then
        Begin
        Erro          := 'O Número da Nota Não Foi Informado.';
        Campo_Retorno := 'Nota_Numero';
        End
     Else If Trim(Nota_Emissao.Text) = '/  /' Then
        Begin
        Erro          := 'A Data de Emissão da Nota Não Foi Informada.';
        Campo_Retorno := 'Nota_Emissao';
        End
     Else If Trim(Cliente_CFOP.Text) = '' Then
        Begin
        Erro          := 'O CFOP da Nota Não Foi Informado.';
        Campo_Retorno := 'Cliente_CFOP';
        End
     Else If Trim(Cliente_Natureza_Operacao.Text) = '' Then
        Begin
        Erro          := 'A Natureza de Operação Não Foi Informada.';
        Campo_Retorno := 'Cliente_Natureza_Operacao';
        End
     Else
        Begin

        If Trim(Programa_Anterior.Text) = '' Then
           Begin
           ConexaoBD.SQL_FB_Nota_Fiscal.Close;
           ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
           ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Trim(Nota_Numero.Text) + ' Order By fb_nota_fiscal_data_emissao Desc');
           ConexaoBD.SQL_FB_Nota_Fiscal.Open;

           If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
              Begin
              Erro          := 'Este Número de Nota Já Existe.';
              Campo_Retorno := 'Nota_Numero';
           End;

           ConexaoBD.SQL_FB_Nota_Fiscal.Close;
        End;
     End;

     Seta();

     If Trim(Erro) <> '' Then
        Begin
        MSG_Erro(Erro);
        Resultado := False;
     End;

     If Campo_Retorno <> '' Then
        Begin

        If Campo_Retorno = 'Cliente_Codigo' Then
           Begin
           Cliente_Codigo.SetFocus;
           End
        Else If Campo_Retorno = 'Nota_Numero' Then
           Begin
           Nota_Numero.SetFocus;
           End
        Else If Campo_Retorno = 'Nota_Emissao' Then
           Begin
           Nota_Emissao.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_CFOP' Then
           Begin
           Cliente_CFOP.SetFocus;
           End
        Else If Campo_Retorno = 'Cliente_Natureza_Operacao' Then
           Begin
           //Cliente_Natureza_Operacao.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure TRegistroNotasFiscaisSaidas01.Carrega_Transportadoras();
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

procedure TRegistroNotasFiscaisSaidas01.Carrega_Pgto_Frete();
begin
     Cliente_Pgto_Frete.Items.Clear;
     Cliente_Pgto_Frete.Items.Add('Cliente');
     Cliente_Pgto_Frete.Items.Add('Ibrasmak');

     Cliente_Pgto_Frete.ItemIndex := StrToInt(Nro_Pgto_Frete.Text);
end;

procedure TRegistroNotasFiscaisSaidas01.BT_SairClick(Sender: TObject);
begin
     RegistroNotasFiscaisSaidas01.Close;
end;

procedure TRegistroNotasFiscaisSaidas01.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();
     Application.CreateForm(TClientes00,Clientes00);

     Clientes00.Programa_Anterior.Text := 'Registro-Notas-Inclusão';

     Seta();

     Clientes00.ShowModal;

     Edit_Tipo_Inclusao.Text := 'Cliente';
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_NumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_EmissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_EntradaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_RecebimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_CFOPKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_NaturezaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Condicao_Pgto_1KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Condicao_Pgto_2KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Condicao_Pgto_3KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Condicao_Pgto_4KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Aliquota_ISSKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Valor_ISSKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Valor_ServicosKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Base_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Valor_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Base_ICMS_SubKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Valor_ICMS_SubKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Valor_ProdutoKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Valor_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Valor_SeguroKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Outras_DespesasKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Valor_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Valor_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Transportadora_CNPJKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Transportadora_NomeKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Pgto_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Qtde_VolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.EspecieKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.MarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Peso_BrutoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Peso_LiquidoKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_ObsKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Exibe_Grid_Produtos();

var
   Ind, Erro: Integer;
   Vlr_Numero, Peso: Real;
   Vlr_Exibicao, Peso_Str: String;

begin
     Ampulheta();

     //*** Carrega as Demais Opções ***

     Natureza_Operacao.ItemIndex := StrToInt(Nro_Natureza_Operacao.Text);
     //Cliente_Natureza_Operacao.Text := Natureza_Operacao.Text;

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
         SGD_Produtos.Cells[11,Ind] := '';
         SGD_Produtos.Cells[12,Ind] := '';
         SGD_Produtos.Cells[13,Ind] := '';
     End;

     //*** Continua o Carregamento Normal ***

     If Trim(Programa_Anterior.Text) = 'Alteração-Exclusão' Then
        Begin

        ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
        ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
        ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add('Select * from fb_notas_fiscais_produtos Where fb_nota_fiscal_produto_numero = ' + Trim(Nota_Numero.Text) + ' Order By fb_nota_fiscal_produto_posicao');
        ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

        If ConexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount > 0 Then
           Begin
           SGD_Produtos.RowCount  := 2;
           SGD_Produtos.Refresh;

           SGD_Produtos.RowCount  := (ConexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount + 2);
           SGD_Produtos.FixedRows := 1;
           Ind := 0;

           ConexaoBD.SQL_FB_Nota_Fiscal_Produto.First;

           Peso := 0;

           While Not ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof Do
                 Begin
                 Ind := Ind + 1;

                 SGD_Produtos.Cells[1,Ind]  := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_qtde.Text;
                 SGD_Produtos.Cells[2,Ind]  := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text;
                 SGD_Produtos.Cells[4,Ind]  := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_desc.Text;
                 SGD_Produtos.Cells[5,Ind]  := IntToStr(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_lote.AsInteger);
                 SGD_Produtos.Cells[13,Ind] := DBG_NF_FB_Faturados_Produto_Descricao_Detalhada.Text;

                 //*** Busca o Peso do Produto ***

                 If Trim(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text) <> '' Then
                    Begin
                    ConexaoBD.SQL_Produtos.Close;
                    ConexaoBD.SQL_Produtos.SQL.Clear;
                    ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' +#39+ Trim(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text) + #39);
                    ConexaoBD.SQL_Produtos.Open;

                    If Not ConexaoBD.SQL_Produtos.Eof Then
                       Begin
                       SGD_Produtos.Cells[3,Ind] := ConexaoBD.SQL_Produtosfb_produto_referencia.Text;

                       Peso  := Peso + ((ConexaoBD.SQL_Produtosfb_produto_peso.AsVariant) * (StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_qtde.Text)) ));

                       //*** Retorna ao Carregamento Normal ***

                       Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_uni.Text));
                       Val(Vlr_Exibicao,Vlr_Numero,Erro);
                       Str(Vlr_Numero:13:2,Vlr_Exibicao);
                       Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

                       SGD_Produtos.Cells[6,Ind] := Vlr_Exibicao;

                       Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));
                       Val(Vlr_Exibicao,Vlr_Numero,Erro);
                       Str(Vlr_Numero:13:2,Vlr_Exibicao);
                       Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

                       SGD_Produtos.Cells[7,Ind] := Vlr_Exibicao;

                       If Trim(IPI_Zerado.Text) = 'S' Then
                          Begin
                          SGD_Produtos.Cells[8,Ind]  := '0';
                          End
                       Else
                          Begin
                          SGD_Produtos.Cells[8,Ind]  := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.Text;
                       End;
                       SGD_Produtos.Cells[9,Ind]  := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_posicao.Text;

                       SGD_Produtos.Cells[10,Ind] := ConexaoBD.SQL_Produtosfb_produto_classif_fiscal.Text;
                       SGD_Produtos.Cells[11,Ind] := ConexaoBD.SQL_Produtosfb_produto_classif_tributaria.Text;
                       SGD_Produtos.Cells[12,Ind] := ConexaoBD.SQL_Produtosfb_produto_unidade.Text;
                       End
                    Else
                       Begin
                       SGD_Produtos.Cells[3,Ind] := '';

                       Peso  := Peso + ((0) * (StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_qtde.Text)) ));

                       //*** Retorna ao Carregamento Normal ***

                       Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_uni.Text));
                       Val(Vlr_Exibicao,Vlr_Numero,Erro);
                       Str(Vlr_Numero:13:2,Vlr_Exibicao);
                       Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

                       SGD_Produtos.Cells[6,Ind] := Vlr_Exibicao;

                       Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));
                       Val(Vlr_Exibicao,Vlr_Numero,Erro);
                       Str(Vlr_Numero:13:2,Vlr_Exibicao);
                       Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

                       SGD_Produtos.Cells[7,Ind] := Vlr_Exibicao;

                       SGD_Produtos.Cells[8,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.Text;
                       SGD_Produtos.Cells[9,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_posicao.Text;

                       SGD_Produtos.Cells[10,Ind] := '';
                       SGD_Produtos.Cells[11,Ind] := '';
                       SGD_Produtos.Cells[12,Ind] := '';
                    End;

                    End
                 Else
                    Begin
                    SGD_Produtos.Cells[3,Ind] := '';

                    Peso  := Peso + ((0) * (StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_qtde.Text)) ));

                    //*** Retorna ao Carregamento Normal ***

                    Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_uni.Text));
                    Val(Vlr_Exibicao,Vlr_Numero,Erro);
                    Str(Vlr_Numero:13:2,Vlr_Exibicao);
                    Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

                    SGD_Produtos.Cells[6,Ind] := Vlr_Exibicao;

                    Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));
                    Val(Vlr_Exibicao,Vlr_Numero,Erro);
                    Str(Vlr_Numero:13:2,Vlr_Exibicao);
                    Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

                    SGD_Produtos.Cells[7,Ind] := Vlr_Exibicao;

                    SGD_Produtos.Cells[8,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.Text;
                    SGD_Produtos.Cells[9,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_posicao.Text;

                    SGD_Produtos.Cells[10,Ind] := '';
                    SGD_Produtos.Cells[11,Ind] := '';
                    SGD_Produtos.Cells[12,Ind] := '';
                 End;

                 ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
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

        //Totaliza_Pedido();

        End
     Else
        Begin
        SGD_Produtos.RowCount  := 2;
        SGD_Produtos.FixedRows := 1;
     End;

     //*** Preparação do StringGrid ***

     //*** Cod. do Cliene ***
     SGD_Produtos.Cells[0,0]   := 'Cod.Cliente';
     SGD_Produtos.ColWidths[0] := 90;

     //*** Quantidade ***
     SGD_Produtos.Cells[1,0]   := 'Quantidade';
     SGD_Produtos.ColWidths[1] := 60;

     //*** Código do Produto ***
     SGD_Produtos.Cells[2,0]   := 'Cód.Produto';
     SGD_Produtos.ColWidths[2] := 100;

     //*** Referência ***
     SGD_Produtos.Cells[3,0]   := 'Referência';
     SGD_Produtos.ColWidths[3] := 100;

     //*** Descrição do Produto ***
     SGD_Produtos.Cells[4,0]   := 'Descrição';
     SGD_Produtos.ColWidths[4] := 190;

     //*** Lote do Produto ***
     SGD_Produtos.Cells[5,0]   := 'Lote';
     SGD_Produtos.ColWidths[5] := -1;

     //*** Valor Unitário ***
     SGD_Produtos.Cells[6,0]   := 'Vlr.Unitário (R$)';
     SGD_Produtos.ColWidths[6] := 80;

     //*** Valor Total ***
     SGD_Produtos.Cells[7,0]   := 'Vlr.Total (R$)';
     SGD_Produtos.ColWidths[7] := 80;

     //*** Vlr do IPI ***
     SGD_Produtos.Cells[8,0]   := 'Vlr.IPI';
     SGD_Produtos.ColWidths[8] := -1;

     //*** Posicao do Produto ***
     SGD_Produtos.Cells[9,0]   := 'Posição';
     SGD_Produtos.ColWidths[9] := -1;

     //*** Classificação Fiscal ***
     SGD_Produtos.Cells[10,0]   := 'CF';
     SGD_Produtos.ColWidths[10] := -1;

     //*** Situação Tributária ***
     SGD_Produtos.Cells[11,0]   := 'ST';
     SGD_Produtos.ColWidths[11] := -1;

     //*** Unidade ***
     SGD_Produtos.Cells[12,0]   := 'Unidade';
     SGD_Produtos.ColWidths[12] := -1;

     //*** Descrição Detalhada ***
     SGD_Produtos.Cells[13,0]   := 'Detalhada';
     SGD_Produtos.ColWidths[13] := -1;

     Seta();
end;

procedure TRegistroNotasFiscaisSaidas01.FormShow(Sender: TObject);
begin
     If Trim(Programa_Anterior.Text) = '' Then
        Begin
        Nota_Emissao.Text := DateToStr(Date());
     End;

     Exibe_Grid_Produtos();

      Ampulheta();

      // Obtem as Naturezas de Operacao
      ConexaoBD.SQL_Natureza_Operacao.Close;
      ConexaoBD.SQL_Natureza_Operacao.SQL.Clear;
      ConexaoBD.SQL_Natureza_Operacao.SQL.Add('Select * from fb_naturezas_operacao Order By fb_natureza_operacao_descricao_longa');
      ConexaoBD.SQL_Natureza_Operacao.Open;

      Natureza_Operacao.Items.Clear;

      If ConexaoBD.SQL_Natureza_Operacao.RecordCount > 0 Then
        begin
        ConexaoBD.SQL_Natureza_Operacao.First;

        While Not ConexaoBD.SQL_Natureza_Operacao.Eof Do
          begin
          Natureza_Operacao.Items.Add(Trim(ConexaoBD.SQL_Natureza_Operacaofb_natureza_operacao_nro.Text) + ' _ ' + Trim(ConexaoBD.SQL_Natureza_Operacaofb_natureza_operacao_cfop.Text)+' - '+ConexaoBD.SQL_Natureza_Operacaofb_natureza_operacao_descricao_longa.Text);
          ConexaoBD.SQL_Natureza_Operacao.Next;
        End;
      end;

      ConexaoBD.SQL_Natureza_Operacao.Close;

      Natureza_Operacao.ItemIndex := StrToInt(Nro_Natureza_Operacao.Text);

      If Imprime_Nota_Tela.Checked = True Then
         Begin
         Imprimir.ArqDestino := 'C:\Ibrasmak\NF_Tela.TXT';
         Imprimir.Acentuacao := acNenhum;
         End
      Else
         Begin

         If Tipo_Nota_Emissao.Text = 'NFe' Then
            Begin
            Imprimir.ArqDestino := 'C:\Ibrasmak\NF_Tela.TXT';
            Imprimir.Acentuacao := acNenhum;
            End
         Else
            Begin
            Imprimir.ArqDestino := 'LPT1';
            Imprimir.Acentuacao := acANSI;
         End;
         
      End;

      Seta();
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Base_ICMSExit(Sender: TObject);
begin
     If Trim(Nota_Base_ICMS.Text) = '' Then
        Begin
        Nota_Base_ICMS.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Valor_ICMSExit(Sender: TObject);
begin
     If Trim(Nota_Valor_ICMS.Text) = '' Then
        Begin
        Nota_Valor_ICMS.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Base_ICMS_SubExit(Sender: TObject);
begin
     If Trim(Nota_Base_ICMS_Sub.Text) = '' Then
        Begin
        Nota_Base_ICMS_Sub.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Valor_ICMS_SubExit(Sender: TObject);
begin
     If Trim(Nota_Valor_ICMS_Sub.Text) = '' Then
        Begin
        Nota_Valor_ICMS_Sub.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Valor_ProdutoExit(Sender: TObject);
begin
     If Trim(Nota_Valor_Produto.Text) = '' Then
        Begin
        Nota_Valor_Produto.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Valor_FreteExit(Sender: TObject);
begin
     If Trim(Valor_Frete.Text) = '' Then
        Begin
        Valor_Frete.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Valor_SeguroExit(Sender: TObject);
begin
     If Trim(Nota_Valor_Seguro.Text) = '' Then
        Begin
        Nota_Valor_Seguro.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Nota_Outras_DespesasExit(
  Sender: TObject);
begin
     If Trim(Nota_Outras_Despesas.Text) = '' Then
        Begin
        Nota_Outras_Despesas.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Valor_IPIExit(Sender: TObject);
begin
     If Trim(Valor_IPI.Text) = '' Then
        Begin
        Valor_IPI.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Valor_TotalExit(Sender: TObject);
begin
     If Trim(Valor_Total.Text) = '' Then
        Begin
        Valor_Total.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Qtde_VolumeExit(Sender: TObject);
begin
     If Trim(Qtde_Volume.Text) = '' Then
        Begin
        Qtde_Volume.Text := '0';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Peso_BrutoExit(Sender: TObject);
begin
     If Trim(Peso_Bruto.Text) = '' Then
        Begin
        Peso_Bruto.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Peso_LiquidoExit(Sender: TObject);
begin
     If Trim(Peso_Liquido.Text) = '' Then
        Begin
        Peso_Liquido.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.BT_AdicionarClick(Sender: TObject);
begin
     If Trim(Cliente_Codigo.Text) <> '' Then
        Begin
        Ampulheta();

        SGD_Produtos.Refresh;

        Application.CreateForm(TAdicionaProdutoRelacao,AdicionaProdutoRelacao);

        AdicionaProdutoRelacao.Programa_Anterior.Text    := 'Registro-Notas-Inclusão';

        Seta();
        AdicionaProdutoRelacao.ShowModal;
        AdicionaProdutoRelacao.Destroy;

        SGD_Produtos.Refresh;

        //Totaliza_Pedido();
        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Cliente');
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.SGD_ProdutosDblClick(Sender: TObject);
begin
     Application.CreateForm(TAdicionaQtdeProduto,AdicionaQtdeProduto);

     AdicionaQtdeProduto.Adiciona_CF.Enabled          := True;
     AdicionaQtdeProduto.Adiciona_ST.Enabled          := True;
     AdicionaQtdeProduto.Adiciona_Unidade.Enabled     := True;

     AdicionaQtdeProduto.Programa_Anterior.Text       := 'Registro-Notas-Inclusão';
     AdicionaQtdeProduto.Adiciona_ACol.Text           := IntToStr(SGD_Produtos.Col);
     AdicionaQtdeProduto.Adiciona_ARow.Text           := IntToStr(SGD_Produtos.Row);
     AdicionaQtdeProduto.Adiciona_Codigo_Produto.Text := SGD_Produtos.Cells[2,SGD_Produtos.Row];
     AdicionaQtdeProduto.Adiciona_Referencia.Text     := SGD_Produtos.Cells[3,SGD_Produtos.Row];
     AdicionaQtdeProduto.Adiciona_Descricao.Text      := SGD_Produtos.Cells[4,SGD_Produtos.Row];
     AdicionaQtdeProduto.Adiciona_Valor_Unitario.Text := SGD_Produtos.Cells[6,SGD_Produtos.Row];
     AdicionaQtdeProduto.Adiciona_Quantidade.Text     := SGD_Produtos.Cells[1,SGD_Produtos.Row];
     AdicionaQtdeProduto.Adiciona_Quantidade_ANT.Text := SGD_Produtos.Cells[1,SGD_Produtos.Row];
     AdicionaQtdeProduto.Adiciona_IPI.Text            := SGD_Produtos.Cells[8,SGD_Produtos.Row];

     AdicionaQtdeProduto.Adiciona_CF.Text             := SGD_Produtos.Cells[10,SGD_Produtos.Row];
     AdicionaQtdeProduto.Adiciona_ST.Text             := SGD_Produtos.Cells[11,SGD_Produtos.Row];
     AdicionaQtdeProduto.Adiciona_Unidade.Text        := SGD_Produtos.Cells[12,SGD_Produtos.Row];

     AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Lines.Clear;
     AdicionaQtdeProduto.Adiciona_Descricao_Detalhada.Lines.Add(SGD_Produtos.Cells[13,SGD_Produtos.Row]);

     AdicionaQtdeProduto.Adiciona_Nro_Ctrl_Estoque.Text := Trim(Nro_Ctrl_Estoque);
     AdicionaQtdeProduto.Adiciona_Nro_Nota_Estoque.Text := '0';
     AdicionaQtdeProduto.Adiciona_Lote_Estoque.Text     := '0';
     AdicionaQtdeProduto.Adiciona_Tipo_Faturamento.Text := Trim(Cliente_Tipo_Faturamento.Text);

     AdicionaQtdeProduto.Adiciona_IPI.Enabled     := True;
     AdicionaQtdeProduto.Adiciona_CF.Enabled      := True;
     AdicionaQtdeProduto.Adiciona_ST.Enabled      := True;
     AdicionaQtdeProduto.Adiciona_Unidade.Enabled := True;

     AdicionaQtdeProduto.ShowModal;
     AdicionaQtdeProduto.Destroy;

     //Totaliza_Pedido();
     SGD_Produtos.Refresh;
end;

procedure TRegistroNotasFiscaisSaidas01.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL, Posicao_Nota, Nro_Conta, Busca_Duplicata: String;
   Ind, Parcela_INI, Parcela_FIM: Integer;

begin
     If Valida_Dados() Then
        Begin

        Ampulheta();

        If Imprime_Nota_Tela.Checked Then
            Begin
            Imprimir.ArqDestino := 'C:\Ibrasmak\NF_Tela.TXT';
            Imprimir.Acentuacao := acNenhum;

            Imprimir.Linhas := 66;
            Imprime_Nota();

            Application.CreateForm(TNotasFiscaisSaidas04,NotasFiscaisSaidas04);

            NotasFiscaisSaidas04.Descricao_LPT.Lines.LoadFromFile('C:\Ibrasmak\NF_Tela.TXT');

            Seta();

            NotasFiscaisSaidas04.QR_LPT.Preview;
            NotasFiscaisSaidas04.QR_LPT.Destroy;
            NotasFiscaisSaidas04.Destroy;
            End
        Else If Imprime_Nota_Apos.Checked Then
            Begin
            Imprimir.ArqDestino := 'LPT1';
            Imprimir.Acentuacao := acANSI;
            Imprimir.Linhas := 66;
            Imprime_Nota();
        End;

        Grava_Nota_Ibrasmak(1,(SGD_Produtos.RowCount - 1));

        //*** Registra o Número da Nota Fiscal Anterior ***

        Comando_SQL := 'Update fb_nf_anterior Set ';
        Comando_SQL := Comando_SQL + 'fb_nf_anterior_data = ' +#39+ Trim(Inverte_Data_Plus(Nota_Emissao.Text,'amd','/')) +#39+ ', ';
        Comando_SQL := Comando_SQL + 'fb_nf_anterior_numero = ' + Trim(Nota_Numero.Text);

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        RegistroNotasFiscaisSaidas01.Close;
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //*** Prepara a Busca de Retorno das Notas-Fiscais ***

     Ampulheta();

     ConexaoBD.SQL_FB_Nota_Fiscal.Close;
     ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;

     If Trim(RegistroNotasFiscaisSaidas00.Numero_Nota.Text) <> '' Then
        Begin
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Trim(RegistroNotasFiscaisSaidas00.Numero_Nota.Text) + ' Order By fb_nota_fiscal_data_emissao Desc, fb_nota_fiscal_numero Desc');
        End
     Else
        Begin
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where (fb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(RegistroNotasFiscaisSaidas00.Data_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(RegistroNotasFiscaisSaidas00.Data_Final.Text),'amd','/')+#39+') Order By fb_nota_fiscal_data_emissao Desc, fb_nota_fiscal_numero Desc');
     End;

     ConexaoBD.SQL_FB_Nota_Fiscal.Open;

     RegistroNotasFiscaisSaidas00.Total_Pedidos_Ibrasmak.Caption := IntToStr(ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount);

     If Trim(Programa_Anterior.Text) = 'Alteração-Exclusão' Then
        Begin
        ConexaoBD.SQL_FB_Nota_Fiscal.Locate('fb_nota_fiscal_numero',Trim(Selecionado),[]);
     End;   

     Seta();

     //*** Fecha o Programa ***

     Action := caFree;
     Release;
     RegistroNotasFiscaisSaidas01 := Nil;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_DescontoExit(
  Sender: TObject);
begin
     If Trim(Cliente_Desconto.Text) = '' Then
        Begin
        Cliente_Desconto.Text := '0';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_DescontoKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_1KeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_2KeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_3KeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_4KeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Natureza_OperacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Natureza_OperacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Tipo_Nota_SaidaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Tipo_Nota_EntradaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Tipo_TransporteKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Pgto_FreteKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_TransportadoraKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Emite_LoteKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Aliquota_ICMSKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Aliquota_ICMSExit(
  Sender: TObject);
begin
     If Trim(Cliente_Aliquota_ICMS.Text) = '' Then
        Begin
        Cliente_Aliquota_ICMS.Text := '0';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Base_ReduzidaExit(
  Sender: TObject);
begin
     If Trim(Cliente_Base_Reduzida.Text) = '' Then
        Begin
        Cliente_Base_Reduzida.Text := '0';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Base_ReduzidaKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Ordem_CompraKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Natureza_OperacaoChange(
  Sender: TObject);
var
  Nro_Natureza : string;

begin
     Nro_Natureza := Obtem_Antes(Natureza_Operacao.Text,'_');

     ConexaoBD.SQL_Natureza_Operacao.Close;
     ConexaoBD.SQL_Natureza_Operacao.SQL.Clear;
     ConexaoBD.SQL_Natureza_Operacao.SQL.Add('Select * from fb_naturezas_operacao where fb_natureza_operacao_nro = '+#39+Trim(Nro_Natureza)+#39);
     ConexaoBD.SQL_Natureza_Operacao.Open;

     If ConexaoBD.SQL_Natureza_Operacao.RecordCount > 0 Then
     begin
        Cliente_CFOP.Text := ConexaoBD.SQL_Natureza_Operacaofb_natureza_operacao_cfop.Text;
        Cliente_Natureza_Operacao.Text := ConexaoBD.SQL_Natureza_Operacaofb_natureza_operacao_descricao_curta.Text;

        If Trim(DBG_Observacao_Nota.Text) <> '' Then
           Begin
           Observacao_Nota.Lines.Clear;
           Observacao_Nota.Lines.Add(DBG_Observacao_Nota.Text);
        End;
     end;
end;

procedure TRegistroNotasFiscaisSaidas01.SGD_ProdutosKeyPress(
  Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
     Begin
      If Trim(Cliente_Codigo.Text) <> '' Then
        Begin

        If (Trim(SGD_Produtos.Cells[1, SGD_Produtos.Row]) <> '') Then
           Begin

           Ampulheta();

           SGD_Produtos.Refresh;

           Application.CreateForm(TCodigoProdutoNotaCliente00,CodigoProdutoNotaCliente00);

           CodigoProdutoNotaCliente00.Programa_Anterior.Text       := 'Registro-Notas-Inclusão';
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

           SGD_Produtos.Refresh;

           Seta();
        End;

        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Cliente');
     End;
     End
  Else If Key = '-' Then
     Begin

     If Confirma('Remove este Produto da Relação?') = 6 Then
        Begin
        Ampulheta();

        SGD_Produtos.Cells[0,SGD_Produtos.Row]  := '';
        SGD_Produtos.Cells[1,SGD_Produtos.Row]  := '';
        SGD_Produtos.Cells[2,SGD_Produtos.Row]  := '';
        SGD_Produtos.Cells[3,SGD_Produtos.Row]  := '';
        SGD_Produtos.Cells[4,SGD_Produtos.Row]  := '';
        SGD_Produtos.Cells[5,SGD_Produtos.Row]  := '';
        SGD_Produtos.Cells[6,SGD_Produtos.Row]  := '';
        SGD_Produtos.Cells[7,SGD_Produtos.Row]  := '';
        SGD_Produtos.Cells[8,SGD_Produtos.Row]  := '';
        SGD_Produtos.Cells[9,SGD_Produtos.Row]  := '';
        SGD_Produtos.Cells[10,SGD_Produtos.Row] := '';
        SGD_Produtos.Cells[11,SGD_Produtos.Row] := '';
        SGD_Produtos.Cells[12,SGD_Produtos.Row] := '';
        SGD_Produtos.Cells[13,SGD_Produtos.Row] := '';

        Seta();
     End;     

  End;

end;

procedure TRegistroNotasFiscaisSaidas01.Totaliza_Pedido();

var
   Ind, Erro: Integer;
   Vlr_Centavos_Nro, Qtde_Nro, Vlr_Unitario_Nro, Vlr_Total_Nro, Porc_Desconto_Nro, Vlr_Frete_Nro, Vlr_Desconto_Nro, Vlr_Pedido_Nro, Vlr_Geral_Nro, Vlr_IPI_Nro, Vlr_Total_IPI_Nro: Real;
   Vlr_Centavos_Str, Qtde_Str, Vlr_Unitario_Str, Vlr_Total_Str, Porc_Desconto_Str, Vlr_Frete_Str, Vlr_Desconto_Str, Vlr_Pedido_Str, Vlr_Geral_Str, Vlr_IPI_Str, Vlr_Total_IPI_Str, Vlr_Str: String;

   Aliquota_ICMS, BC_ICMS_Normal: Real;

begin
     Ampulheta();

     //*** Zera as Variáveis de Cáculo ***

     Vlr_Desconto_Nro := 0;
     Vlr_Pedido_Nro   := 0;
     Vlr_Geral_Nro    := 0;
     Vlr_Frete_Nro    := 0;

     //*** Aliquota do ICMS ***

     If Trim(Cliente_Aliquota_ICMS.Text) = '' Then
        Begin
        Cliente_Aliquota_ICMS.Text := '0';
     End;

     Aliquota_ICMS := StrToFloat(Ponto_Virgula(Cliente_Aliquota_ICMS.Text));

     //*** Obtem o Valor de Desconto ***

     If Trim(Cliente_Desconto.Text) = '' Then
        Begin
        Porc_Desconto_Nro := 0;
        End
     Else
        Begin
        Porc_Desconto_Str := Trim(Virgula_Ponto(Cliente_Desconto.Text));
        Val(Porc_Desconto_Str,Porc_Desconto_Nro,Erro);
     End;

     //*** Obtem os Valores do Grid ***

     Qtde_Produtos_Selecionados := 0;
     BC_ICMS_Normal             := 0;

     For Ind := 1 To SGD_Produtos.RowCount Do
         Begin
         //*** Calcula a Quantidade do Grid ***

         Qtde_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[1,Ind]));
         Val(Qtde_Str,Qtde_Nro,Erro);

         Vlr_Unitario_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[6,Ind]));
         Val(Vlr_Unitario_Str,Vlr_Unitario_Nro,Erro);

         Vlr_Total_Nro := Vlr_Unitario_Nro * (Qtde_Nro);
         Str(Vlr_Total_Nro:13:2,Vlr_Total_Str);
         Vlr_Total_Str := Ponto_Virgula(Trim(Vlr_Total_Str));

         SGD_Produtos.Cells[7,Ind] := Vlr_Total_Str;

         //*** Calcula os Valores Totais ***

         Vlr_Pedido_Nro   := (Vlr_Pedido_Nro + Vlr_Total_Nro);

         Vlr_Desconto_Nro := ((Vlr_Pedido_Nro * Porc_Desconto_Nro) / 100);
         Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
         Val(Vlr_Desconto_Str,Vlr_Desconto_Nro,Erro);

         Vlr_Geral_Nro    := (Vlr_Pedido_Nro - Vlr_Desconto_Nro);

         //*** Calcula o Valor do IPI ***

         Vlr_IPI_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind]));
         Val(Vlr_IPI_Str,Vlr_IPI_Nro,Erro);

         If Trim(Cliente_Suframa.Text) <> '' Then
            Begin
            Vlr_Total_IPI_Nro := 0;
            End
         Else
            Begin
            Vlr_Total_IPI_Nro := Vlr_Total_IPI_Nro + ((Vlr_Total_Nro * Vlr_IPI_Nro) / 100);
         End;

         BC_ICMS_Normal := BC_ICMS_Normal + StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind]));

         //*** Registra o Total de Produtos Selecionados ***

         If Qtde_Nro > 0 Then
            Begin
            Qtde_Produtos_Selecionados := Qtde_Produtos_Selecionados + 1;
         End;
     End;

     //*** Joga os Valores Totais no Pedido ***

     Str(Vlr_Total_IPI_Nro:13:2,Vlr_Total_IPI_Str);
     Vlr_Total_IPI_Str := Ponto_Virgula(Trim(Vlr_Total_IPI_Str));
     //Valor_IPI.Text := Vlr_Total_IPI_Str;

     Str(Vlr_Pedido_Nro:13:2,Vlr_Pedido_Str);
     Vlr_Pedido_Str    := Ponto_Virgula(Trim(Vlr_Pedido_Str));
     Nota_Valor_Produto.Text := Vlr_Pedido_Str;

     Str(Vlr_Desconto_Nro:13:2,Vlr_Desconto_Str);
     Vlr_Desconto_Str    := Ponto_Virgula(Trim(Vlr_Desconto_Str));
     Valor_Desconto.Text := Vlr_Desconto_Str;

     Vlr_Frete_Str := Trim(Valor_Frete.Text);

     If Trim(Vlr_Frete_Str) = '' Then
        Begin
        Vlr_Frete_Str := '0';
     End;

     Vlr_Frete_Nro := StrToFloat(Vlr_Frete_Str);

     Str(Vlr_Frete_Nro:13:2,Vlr_Frete_Str);
     Vlr_Frete_Str    := Ponto_Virgula(Trim(Vlr_Frete_Str));
     Valor_Frete.Text := Vlr_Frete_Str;

     If Total_NF_IPI.Checked Then
        Begin
        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro + Vlr_Total_IPI_Nro);
        End
     Else
        Begin
        Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro);
     End;

     If (Trim(Cliente_Suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        Vlr_Geral_Nro := Vlr_Geral_Nro - ((Vlr_Geral_Nro * 7) / 100);
     End;

     Str(Vlr_Geral_Nro:13:2,Vlr_Geral_Str);
     Vlr_Geral_Str    := Ponto_Virgula(Trim(Vlr_Geral_Str));
     Valor_Total.Text := Vlr_Geral_Str;

     If BC_ICMS_Normal > 0 Then
        Begin

        If Nota_Consumo.Checked Then
           Begin
           Nota_Base_ICMS.Text  := Trim(FloatToStr(StrToFloat(Ponto_Virgula(Nota_Valor_Produto.Text)) + StrToFloat(Ponto_Virgula(Valor_IPI.Text))));
           Nota_Valor_ICMS.Text := Trim(FloatToStr(((( StrToFloat(Ponto_Virgula(Nota_Valor_Produto.Text)) + StrToFloat(Ponto_Virgula(Valor_IPI.Text)) ) * Aliquota_ICMS) / 100)));
           End
        Else
           Begin
           Nota_Base_ICMS.Text  := Trim(FloatToStr(StrToFloat(Ponto_Virgula(Nota_Valor_Produto.Text))));
           Nota_Valor_ICMS.Text := Trim(FloatToStr(((StrToFloat(Ponto_Virgula(Nota_Valor_Produto.Text)) * Aliquota_ICMS) / 100)));
        End;
     End;

     Str(StrToFloat(Nota_Base_ICMS.Text):13:2,Vlr_Str);
     Vlr_Str             := Ponto_Virgula(Trim(Vlr_Str));
     Nota_Base_ICMS.Text := Vlr_Str;

     Str(StrToFloat(Nota_Valor_ICMS.Text):13:2,Vlr_Str);
     Vlr_Str              := Ponto_Virgula(Trim(Vlr_Str));
     Nota_Valor_ICMS.Text := Vlr_Str;

     Prepara_Condicao();

     //*********************************************
     //*** Coloca os Centavos nos Campos da Nota ***
     //*********************************************

     Vlr_Centavos_Str := Trim(Virgula_Ponto(Nota_Base_ICMS.Text));
     Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
     Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
     Nota_Base_ICMS.Text := Ponto_Virgula(Vlr_Centavos_Str);

     Vlr_Centavos_Str := Trim(Virgula_Ponto(Nota_Valor_ICMS.Text));
     Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
     Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
     Nota_Valor_ICMS.Text := Ponto_Virgula(Vlr_Centavos_Str);

     Vlr_Centavos_Str := Trim(Virgula_Ponto(Nota_Base_ICMS_Sub.Text));
     Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
     Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
     Nota_Base_ICMS_Sub.Text := Ponto_Virgula(Vlr_Centavos_Str);

     Vlr_Centavos_Str := Trim(Virgula_Ponto(Nota_Valor_ICMS_Sub.Text));
     Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
     Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
     Nota_Valor_ICMS_Sub.Text := Ponto_Virgula(Vlr_Centavos_Str);

     Vlr_Centavos_Str := Trim(Virgula_Ponto(Nota_Valor_Produto.Text));
     Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
     Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
     Nota_Valor_Produto.Text := Ponto_Virgula(Vlr_Centavos_Str);

     Vlr_Centavos_Str := Trim(Virgula_Ponto(Valor_Frete.Text));
     Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
     Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
     Valor_Frete.Text := Ponto_Virgula(Vlr_Centavos_Str);

     Vlr_Centavos_Str := Trim(Virgula_Ponto(Nota_Valor_Seguro.Text));
     Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
     Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
     Nota_Valor_Seguro.Text := Ponto_Virgula(Vlr_Centavos_Str);

     Vlr_Centavos_Str := Trim(Virgula_Ponto(Nota_Outras_Despesas.Text));
     Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
     Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
     Nota_Outras_Despesas.Text := Ponto_Virgula(Vlr_Centavos_Str);

     Vlr_Centavos_Str := Trim(Virgula_Ponto(Valor_IPI.Text));
     Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
     Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
     Valor_IPI.Text := Ponto_Virgula(Vlr_Centavos_Str);

     Vlr_Centavos_Str := Trim(Virgula_Ponto(Valor_Total.Text));
     Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
     Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
     Valor_Total.Text := Ponto_Virgula(Vlr_Centavos_Str);

     Seta();
end;

procedure TRegistroNotasFiscaisSaidas01.Prepara_Condicao();

var
   Calcula_Condicao: Real;

begin
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

     Vlr_Str_Desd_1   := '';
     Vlr_Str_Desd_2   := '';
     Vlr_Str_Desd_3   := '';
     Vlr_Str_Desd_4   := '';
     Vlr_Str_Desd_5   := '';
     Vlr_Str_Desd_6   := '';
     Vlr_Str_Desd_7   := '';
     Vlr_Str_Desd_8   := '';
     Vlr_Str_Desd_9   := '';
     Vlr_Str_Desd_10  := '';
     Vlr_Str_Desd_11  := '';
     Vlr_Str_Desd_12  := '';
     Vlr_Str_Desd_13  := '';
     Vlr_Str_Desd_14  := '';
     Vlr_Str_Desd_15  := '';
     Vlr_Str_Desd_16  := '';
     Vlr_Str_Desd_17  := '';
     Vlr_Str_Desd_18  := '';
     Vlr_Str_Desd_19  := '';
     Vlr_Str_Desd_20  := '';
     Vlr_Str_Desd_21  := '';
     Vlr_Str_Desd_22  := '';
     Vlr_Str_Desd_23  := '';
     Vlr_Str_Desd_24  := '';

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

     If Not Opcao_Sem_Duplicata.Checked Then
        Begin

        If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_24.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
           Nro_Nota_Desd_14 := Trim(Nota_Numero.Text) + 'N';
           Nro_Nota_Desd_15 := Trim(Nota_Numero.Text) + 'O';
           Nro_Nota_Desd_16 := Trim(Nota_Numero.Text) + 'P';
           Nro_Nota_Desd_17 := Trim(Nota_Numero.Text) + 'Q';
           Nro_Nota_Desd_18 := Trim(Nota_Numero.Text) + 'R';
           Nro_Nota_Desd_19 := Trim(Nota_Numero.Text) + 'S';
           Nro_Nota_Desd_20 := Trim(Nota_Numero.Text) + 'T';
           Nro_Nota_Desd_21 := Trim(Nota_Numero.Text) + 'U';
           Nro_Nota_Desd_22 := Trim(Nota_Numero.Text) + 'V';
           Nro_Nota_Desd_23 := Trim(Nota_Numero.Text) + 'X';
           Nro_Nota_Desd_24 := Trim(Nota_Numero.Text) + 'Z';

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := Trim(Cliente_Condicao_pgto_14.Text);
           Dt_Vcto_Desd_15  := Trim(Cliente_Condicao_pgto_15.Text);
           Dt_Vcto_Desd_16  := Trim(Cliente_Condicao_pgto_16.Text);
           Dt_Vcto_Desd_17  := Trim(Cliente_Condicao_pgto_17.Text);
           Dt_Vcto_Desd_18  := Trim(Cliente_Condicao_pgto_18.Text);
           Dt_Vcto_Desd_19  := Trim(Cliente_Condicao_pgto_19.Text);
           Dt_Vcto_Desd_20  := Trim(Cliente_Condicao_pgto_20.Text);
           Dt_Vcto_Desd_21  := Trim(Cliente_Condicao_pgto_21.Text);
           Dt_Vcto_Desd_22  := Trim(Cliente_Condicao_pgto_22.Text);
           Dt_Vcto_Desd_23  := Trim(Cliente_Condicao_pgto_23.Text);
           Dt_Vcto_Desd_24  := Trim(Cliente_Condicao_pgto_24.Text);

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 23);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := Vlr_Desd_2;
           Vlr_Desd_15      := Vlr_Desd_2;
           Vlr_Desd_16      := Vlr_Desd_2;
           Vlr_Desd_17      := Vlr_Desd_2;
           Vlr_Desd_18      := Vlr_Desd_2;
           Vlr_Desd_19      := Vlr_Desd_2;
           Vlr_Desd_20      := Vlr_Desd_2;
           Vlr_Desd_21      := Vlr_Desd_2;
           Vlr_Desd_22      := Vlr_Desd_2;
           Vlr_Desd_23      := Vlr_Desd_2;
           Vlr_Desd_24      := Vlr_Desd_2;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);

           End
        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_23.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
           Nro_Nota_Desd_14 := Trim(Nota_Numero.Text) + 'N';
           Nro_Nota_Desd_15 := Trim(Nota_Numero.Text) + 'O';
           Nro_Nota_Desd_16 := Trim(Nota_Numero.Text) + 'P';
           Nro_Nota_Desd_17 := Trim(Nota_Numero.Text) + 'Q';
           Nro_Nota_Desd_18 := Trim(Nota_Numero.Text) + 'R';
           Nro_Nota_Desd_19 := Trim(Nota_Numero.Text) + 'S';
           Nro_Nota_Desd_20 := Trim(Nota_Numero.Text) + 'T';
           Nro_Nota_Desd_21 := Trim(Nota_Numero.Text) + 'U';
           Nro_Nota_Desd_22 := Trim(Nota_Numero.Text) + 'V';
           Nro_Nota_Desd_23 := Trim(Nota_Numero.Text) + 'X';
           Nro_Nota_Desd_24 := '';

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := Trim(Cliente_Condicao_pgto_14.Text);
           Dt_Vcto_Desd_15  := Trim(Cliente_Condicao_pgto_15.Text);
           Dt_Vcto_Desd_16  := Trim(Cliente_Condicao_pgto_16.Text);
           Dt_Vcto_Desd_17  := Trim(Cliente_Condicao_pgto_17.Text);
           Dt_Vcto_Desd_18  := Trim(Cliente_Condicao_pgto_18.Text);
           Dt_Vcto_Desd_19  := Trim(Cliente_Condicao_pgto_19.Text);
           Dt_Vcto_Desd_20  := Trim(Cliente_Condicao_pgto_20.Text);
           Dt_Vcto_Desd_21  := Trim(Cliente_Condicao_pgto_21.Text);
           Dt_Vcto_Desd_22  := Trim(Cliente_Condicao_pgto_22.Text);
           Dt_Vcto_Desd_23  := Trim(Cliente_Condicao_pgto_23.Text);
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 22);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := Vlr_Desd_2;
           Vlr_Desd_15      := Vlr_Desd_2;
           Vlr_Desd_16      := Vlr_Desd_2;
           Vlr_Desd_17      := Vlr_Desd_2;
           Vlr_Desd_18      := Vlr_Desd_2;
           Vlr_Desd_19      := Vlr_Desd_2;
           Vlr_Desd_20      := Vlr_Desd_2;
           Vlr_Desd_21      := Vlr_Desd_2;
           Vlr_Desd_22      := Vlr_Desd_2;
           Vlr_Desd_23      := Vlr_Desd_2;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_22.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
           Nro_Nota_Desd_14 := Trim(Nota_Numero.Text) + 'N';
           Nro_Nota_Desd_15 := Trim(Nota_Numero.Text) + 'O';
           Nro_Nota_Desd_16 := Trim(Nota_Numero.Text) + 'P';
           Nro_Nota_Desd_17 := Trim(Nota_Numero.Text) + 'Q';
           Nro_Nota_Desd_18 := Trim(Nota_Numero.Text) + 'R';
           Nro_Nota_Desd_19 := Trim(Nota_Numero.Text) + 'S';
           Nro_Nota_Desd_20 := Trim(Nota_Numero.Text) + 'T';
           Nro_Nota_Desd_21 := Trim(Nota_Numero.Text) + 'U';
           Nro_Nota_Desd_22 := Trim(Nota_Numero.Text) + 'V';
           Nro_Nota_Desd_23 := '';
           Nro_Nota_Desd_24 := '';

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := Trim(Cliente_Condicao_pgto_14.Text);
           Dt_Vcto_Desd_15  := Trim(Cliente_Condicao_pgto_15.Text);
           Dt_Vcto_Desd_16  := Trim(Cliente_Condicao_pgto_16.Text);
           Dt_Vcto_Desd_17  := Trim(Cliente_Condicao_pgto_17.Text);
           Dt_Vcto_Desd_18  := Trim(Cliente_Condicao_pgto_18.Text);
           Dt_Vcto_Desd_19  := Trim(Cliente_Condicao_pgto_19.Text);
           Dt_Vcto_Desd_20  := Trim(Cliente_Condicao_pgto_20.Text);
           Dt_Vcto_Desd_21  := Trim(Cliente_Condicao_pgto_21.Text);
           Dt_Vcto_Desd_22  := Trim(Cliente_Condicao_pgto_22.Text);
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 21);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := Vlr_Desd_2;
           Vlr_Desd_15      := Vlr_Desd_2;
           Vlr_Desd_16      := Vlr_Desd_2;
           Vlr_Desd_17      := Vlr_Desd_2;
           Vlr_Desd_18      := Vlr_Desd_2;
           Vlr_Desd_19      := Vlr_Desd_2;
           Vlr_Desd_20      := Vlr_Desd_2;
           Vlr_Desd_21      := Vlr_Desd_2;
           Vlr_Desd_22      := Vlr_Desd_2;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_21.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
           Nro_Nota_Desd_14 := Trim(Nota_Numero.Text) + 'N';
           Nro_Nota_Desd_15 := Trim(Nota_Numero.Text) + 'O';
           Nro_Nota_Desd_16 := Trim(Nota_Numero.Text) + 'P';
           Nro_Nota_Desd_17 := Trim(Nota_Numero.Text) + 'Q';
           Nro_Nota_Desd_18 := Trim(Nota_Numero.Text) + 'R';
           Nro_Nota_Desd_19 := Trim(Nota_Numero.Text) + 'S';
           Nro_Nota_Desd_20 := Trim(Nota_Numero.Text) + 'T';
           Nro_Nota_Desd_21 := Trim(Nota_Numero.Text) + 'U';
           Nro_Nota_Desd_22 := '';
           Nro_Nota_Desd_23 := '';
           Nro_Nota_Desd_24 := '';

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := Trim(Cliente_Condicao_pgto_14.Text);
           Dt_Vcto_Desd_15  := Trim(Cliente_Condicao_pgto_15.Text);
           Dt_Vcto_Desd_16  := Trim(Cliente_Condicao_pgto_16.Text);
           Dt_Vcto_Desd_17  := Trim(Cliente_Condicao_pgto_17.Text);
           Dt_Vcto_Desd_18  := Trim(Cliente_Condicao_pgto_18.Text);
           Dt_Vcto_Desd_19  := Trim(Cliente_Condicao_pgto_19.Text);
           Dt_Vcto_Desd_20  := Trim(Cliente_Condicao_pgto_20.Text);
           Dt_Vcto_Desd_21  := Trim(Cliente_Condicao_pgto_21.Text);
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 20);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := Vlr_Desd_2;
           Vlr_Desd_15      := Vlr_Desd_2;
           Vlr_Desd_16      := Vlr_Desd_2;
           Vlr_Desd_17      := Vlr_Desd_2;
           Vlr_Desd_18      := Vlr_Desd_2;
           Vlr_Desd_19      := Vlr_Desd_2;
           Vlr_Desd_20      := Vlr_Desd_2;
           Vlr_Desd_21      := Vlr_Desd_2;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_20.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
           Nro_Nota_Desd_14 := Trim(Nota_Numero.Text) + 'N';
           Nro_Nota_Desd_15 := Trim(Nota_Numero.Text) + 'O';
           Nro_Nota_Desd_16 := Trim(Nota_Numero.Text) + 'P';
           Nro_Nota_Desd_17 := Trim(Nota_Numero.Text) + 'Q';
           Nro_Nota_Desd_18 := Trim(Nota_Numero.Text) + 'R';
           Nro_Nota_Desd_19 := Trim(Nota_Numero.Text) + 'S';
           Nro_Nota_Desd_20 := Trim(Nota_Numero.Text) + 'T';
           Nro_Nota_Desd_21 := '';
           Nro_Nota_Desd_22 := '';
           Nro_Nota_Desd_23 := '';
           Nro_Nota_Desd_24 := '';

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := Trim(Cliente_Condicao_pgto_14.Text);
           Dt_Vcto_Desd_15  := Trim(Cliente_Condicao_pgto_15.Text);
           Dt_Vcto_Desd_16  := Trim(Cliente_Condicao_pgto_16.Text);
           Dt_Vcto_Desd_17  := Trim(Cliente_Condicao_pgto_17.Text);
           Dt_Vcto_Desd_18  := Trim(Cliente_Condicao_pgto_18.Text);
           Dt_Vcto_Desd_19  := Trim(Cliente_Condicao_pgto_19.Text);
           Dt_Vcto_Desd_20  := Trim(Cliente_Condicao_pgto_20.Text);
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 19);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := Vlr_Desd_2;
           Vlr_Desd_15      := Vlr_Desd_2;
           Vlr_Desd_16      := Vlr_Desd_2;
           Vlr_Desd_17      := Vlr_Desd_2;
           Vlr_Desd_18      := Vlr_Desd_2;
           Vlr_Desd_19      := Vlr_Desd_2;
           Vlr_Desd_20      := Vlr_Desd_2;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_19.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
           Nro_Nota_Desd_14 := Trim(Nota_Numero.Text) + 'N';
           Nro_Nota_Desd_15 := Trim(Nota_Numero.Text) + 'O';
           Nro_Nota_Desd_16 := Trim(Nota_Numero.Text) + 'P';
           Nro_Nota_Desd_17 := Trim(Nota_Numero.Text) + 'Q';
           Nro_Nota_Desd_18 := Trim(Nota_Numero.Text) + 'R';
           Nro_Nota_Desd_19 := Trim(Nota_Numero.Text) + 'S';
           Nro_Nota_Desd_20 := '';
           Nro_Nota_Desd_21 := '';
           Nro_Nota_Desd_22 := '';
           Nro_Nota_Desd_23 := '';
           Nro_Nota_Desd_24 := '';

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := Trim(Cliente_Condicao_pgto_14.Text);
           Dt_Vcto_Desd_15  := Trim(Cliente_Condicao_pgto_15.Text);
           Dt_Vcto_Desd_16  := Trim(Cliente_Condicao_pgto_16.Text);
           Dt_Vcto_Desd_17  := Trim(Cliente_Condicao_pgto_17.Text);
           Dt_Vcto_Desd_18  := Trim(Cliente_Condicao_pgto_18.Text);
           Dt_Vcto_Desd_19  := Trim(Cliente_Condicao_pgto_19.Text);
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 18);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := Vlr_Desd_2;
           Vlr_Desd_15      := Vlr_Desd_2;
           Vlr_Desd_16      := Vlr_Desd_2;
           Vlr_Desd_17      := Vlr_Desd_2;
           Vlr_Desd_18      := Vlr_Desd_2;
           Vlr_Desd_19      := Vlr_Desd_2;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_18.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
           Nro_Nota_Desd_14 := Trim(Nota_Numero.Text) + 'N';
           Nro_Nota_Desd_15 := Trim(Nota_Numero.Text) + 'O';
           Nro_Nota_Desd_16 := Trim(Nota_Numero.Text) + 'P';
           Nro_Nota_Desd_17 := Trim(Nota_Numero.Text) + 'Q';
           Nro_Nota_Desd_18 := Trim(Nota_Numero.Text) + 'R';
           Nro_Nota_Desd_19 := '';
           Nro_Nota_Desd_20 := '';
           Nro_Nota_Desd_21 := '';
           Nro_Nota_Desd_22 := '';
           Nro_Nota_Desd_23 := '';
           Nro_Nota_Desd_24 := '';

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := Trim(Cliente_Condicao_pgto_14.Text);
           Dt_Vcto_Desd_15  := Trim(Cliente_Condicao_pgto_15.Text);
           Dt_Vcto_Desd_16  := Trim(Cliente_Condicao_pgto_16.Text);
           Dt_Vcto_Desd_17  := Trim(Cliente_Condicao_pgto_17.Text);
           Dt_Vcto_Desd_18  := Trim(Cliente_Condicao_pgto_18.Text);
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 17);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := Vlr_Desd_2;
           Vlr_Desd_15      := Vlr_Desd_2;
           Vlr_Desd_16      := Vlr_Desd_2;
           Vlr_Desd_17      := Vlr_Desd_2;
           Vlr_Desd_18      := Vlr_Desd_2;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_17.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
           Nro_Nota_Desd_14 := Trim(Nota_Numero.Text) + 'N';
           Nro_Nota_Desd_15 := Trim(Nota_Numero.Text) + 'O';
           Nro_Nota_Desd_16 := Trim(Nota_Numero.Text) + 'P';
           Nro_Nota_Desd_17 := Trim(Nota_Numero.Text) + 'Q';
           Nro_Nota_Desd_18 := '';
           Nro_Nota_Desd_19 := '';
           Nro_Nota_Desd_20 := '';
           Nro_Nota_Desd_21 := '';
           Nro_Nota_Desd_22 := '';
           Nro_Nota_Desd_23 := '';
           Nro_Nota_Desd_24 := '';

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := Trim(Cliente_Condicao_pgto_14.Text);
           Dt_Vcto_Desd_15  := Trim(Cliente_Condicao_pgto_15.Text);
           Dt_Vcto_Desd_16  := Trim(Cliente_Condicao_pgto_16.Text);
           Dt_Vcto_Desd_17  := Trim(Cliente_Condicao_pgto_17.Text);
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 16);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := Vlr_Desd_2;
           Vlr_Desd_15      := Vlr_Desd_2;
           Vlr_Desd_16      := Vlr_Desd_2;
           Vlr_Desd_17      := Vlr_Desd_2;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_16.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
           Nro_Nota_Desd_14 := Trim(Nota_Numero.Text) + 'N';
           Nro_Nota_Desd_15 := Trim(Nota_Numero.Text) + 'O';
           Nro_Nota_Desd_16 := Trim(Nota_Numero.Text) + 'P';
           Nro_Nota_Desd_17 := '';
           Nro_Nota_Desd_18 := '';
           Nro_Nota_Desd_19 := '';
           Nro_Nota_Desd_20 := '';
           Nro_Nota_Desd_21 := '';
           Nro_Nota_Desd_22 := '';
           Nro_Nota_Desd_23 := '';
           Nro_Nota_Desd_24 := '';

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := Trim(Cliente_Condicao_pgto_14.Text);
           Dt_Vcto_Desd_15  := Trim(Cliente_Condicao_pgto_15.Text);
           Dt_Vcto_Desd_16  := Trim(Cliente_Condicao_pgto_16.Text);
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 15);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := Vlr_Desd_2;
           Vlr_Desd_15      := Vlr_Desd_2;
           Vlr_Desd_16      := Vlr_Desd_2;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_15.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
           Nro_Nota_Desd_14 := Trim(Nota_Numero.Text) + 'N';
           Nro_Nota_Desd_15 := Trim(Nota_Numero.Text) + 'O';
           Nro_Nota_Desd_16 := '';
           Nro_Nota_Desd_17 := '';
           Nro_Nota_Desd_18 := '';
           Nro_Nota_Desd_19 := '';
           Nro_Nota_Desd_20 := '';
           Nro_Nota_Desd_21 := '';
           Nro_Nota_Desd_22 := '';
           Nro_Nota_Desd_23 := '';
           Nro_Nota_Desd_24 := '';

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := Trim(Cliente_Condicao_pgto_14.Text);
           Dt_Vcto_Desd_15  := Trim(Cliente_Condicao_pgto_15.Text);
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 14);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := Vlr_Desd_2;
           Vlr_Desd_15      := Vlr_Desd_2;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_14.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
           Nro_Nota_Desd_14 := Trim(Nota_Numero.Text) + 'N';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := Trim(Cliente_Condicao_pgto_14.Text);
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 13);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := Vlr_Desd_2;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_13.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
           Nro_Nota_Desd_13 := Trim(Nota_Numero.Text) + 'M';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := Trim(Cliente_Condicao_pgto_13.Text);
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 12);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := Vlr_Desd_2;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_12.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
           Nro_Nota_Desd_12 := Trim(Nota_Numero.Text) + 'L';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := Trim(Cliente_Condicao_pgto_12.Text);
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 11);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := Vlr_Desd_2;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_11.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
           Nro_Nota_Desd_11 := Trim(Nota_Numero.Text) + 'K';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := Trim(Cliente_Condicao_pgto_11.Text);
           Dt_Vcto_Desd_12  := '';
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 10);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := Vlr_Desd_2;
           Vlr_Desd_12      := 0;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_10.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
           Nro_Nota_Desd_10 := Trim(Nota_Numero.Text) + 'J';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := Trim(Cliente_Condicao_pgto_10.Text);
           Dt_Vcto_Desd_11  := '';
           Dt_Vcto_Desd_12  := '';
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 9);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := Vlr_Desd_2;
           Vlr_Desd_11      := 0;
           Vlr_Desd_12      := 0;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_9.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
           Nro_Nota_Desd_9  := Trim(Nota_Numero.Text) + 'I';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := Trim(Cliente_Condicao_pgto_9.Text);
           Dt_Vcto_Desd_10  := '';
           Dt_Vcto_Desd_11  := '';
           Dt_Vcto_Desd_12  := '';
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 8);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := Vlr_Desd_2;
           Vlr_Desd_10      := 0;
           Vlr_Desd_11      := 0;
           Vlr_Desd_12      := 0;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_8.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
           Nro_Nota_Desd_8  := Trim(Nota_Numero.Text) + 'H';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := Trim(Cliente_Condicao_pgto_8.Text);
           Dt_Vcto_Desd_9   := '';
           Dt_Vcto_Desd_10  := '';
           Dt_Vcto_Desd_11  := '';
           Dt_Vcto_Desd_12  := '';
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 7);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := Vlr_Desd_2;
           Vlr_Desd_9       := 0;
           Vlr_Desd_10      := 0;
           Vlr_Desd_11      := 0;
           Vlr_Desd_12      := 0;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_7.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
           Nro_Nota_Desd_7  := Trim(Nota_Numero.Text) + 'G';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := Trim(Cliente_Condicao_pgto_7.Text);
           Dt_Vcto_Desd_8   := '';
           Dt_Vcto_Desd_9   := '';
           Dt_Vcto_Desd_10  := '';
           Dt_Vcto_Desd_11  := '';
           Dt_Vcto_Desd_12  := '';
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 6);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := Vlr_Desd_2;
           Vlr_Desd_8       := 0;
           Vlr_Desd_9       := 0;
           Vlr_Desd_10      := 0;
           Vlr_Desd_11      := 0;
           Vlr_Desd_12      := 0;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_6.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
           Nro_Nota_Desd_6  := Trim(Nota_Numero.Text) + 'F';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := Trim(Cliente_Condicao_pgto_6.Text);
           Dt_Vcto_Desd_7   := '';
           Dt_Vcto_Desd_8   := '';
           Dt_Vcto_Desd_9   := '';
           Dt_Vcto_Desd_10  := '';
           Dt_Vcto_Desd_11  := '';
           Dt_Vcto_Desd_12  := '';
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 5);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := Vlr_Desd_2;
           Vlr_Desd_7       := 0;
           Vlr_Desd_8       := 0;
           Vlr_Desd_9       := 0;
           Vlr_Desd_10      := 0;
           Vlr_Desd_11      := 0;
           Vlr_Desd_12      := 0;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_5.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
           Nro_Nota_Desd_5  := Trim(Nota_Numero.Text) + 'E';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := Trim(Cliente_Condicao_pgto_5.Text);
           Dt_Vcto_Desd_6   := '';
           Dt_Vcto_Desd_7   := '';
           Dt_Vcto_Desd_8   := '';
           Dt_Vcto_Desd_9   := '';
           Dt_Vcto_Desd_10  := '';
           Dt_Vcto_Desd_11  := '';
           Dt_Vcto_Desd_12  := '';
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 4);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := Vlr_Desd_2;
           Vlr_Desd_6       := 0;
           Vlr_Desd_7       := 0;
           Vlr_Desd_8       := 0;
           Vlr_Desd_9       := 0;
           Vlr_Desd_10      := 0;
           Vlr_Desd_11      := 0;
           Vlr_Desd_12      := 0;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_4.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
           Nro_Nota_Desd_4  := Trim(Nota_Numero.Text) + 'D';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := Trim(Cliente_Condicao_pgto_4.Text);
           Dt_Vcto_Desd_5   := '';
           Dt_Vcto_Desd_6   := '';
           Dt_Vcto_Desd_7   := '';
           Dt_Vcto_Desd_8   := '';
           Dt_Vcto_Desd_9   := '';
           Dt_Vcto_Desd_10  := '';
           Dt_Vcto_Desd_11  := '';
           Dt_Vcto_Desd_12  := '';
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 3);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := Vlr_Desd_2;
           Vlr_Desd_5       := 0;
           Vlr_Desd_6       := 0;
           Vlr_Desd_7       := 0;
           Vlr_Desd_8       := 0;
           Vlr_Desd_9       := 0;
           Vlr_Desd_10      := 0;
           Vlr_Desd_11      := 0;
           Vlr_Desd_12      := 0;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_3.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
           Nro_Nota_Desd_3  := Trim(Nota_Numero.Text) + 'C';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := Trim(Cliente_Condicao_pgto_3.Text);
           Dt_Vcto_Desd_4   := '';
           Dt_Vcto_Desd_5   := '';
           Dt_Vcto_Desd_6   := '';
           Dt_Vcto_Desd_7   := '';
           Dt_Vcto_Desd_8   := '';
           Dt_Vcto_Desd_9   := '';
           Dt_Vcto_Desd_10  := '';
           Dt_Vcto_Desd_11  := '';
           Dt_Vcto_Desd_12  := '';
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 2);
           Vlr_Desd_3       := Vlr_Desd_2;
           Vlr_Desd_4       := 0;
           Vlr_Desd_5       := 0;
           Vlr_Desd_6       := 0;
           Vlr_Desd_7       := 0;
           Vlr_Desd_8       := 0;
           Vlr_Desd_9       := 0;
           Vlr_Desd_10      := 0;
           Vlr_Desd_11      := 0;
           Vlr_Desd_12      := 0;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_2.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text) + 'A';
           Nro_Nota_Desd_2  := Trim(Nota_Numero.Text) + 'B';
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := Trim(Cliente_Condicao_pgto_2.Text);
           Dt_Vcto_Desd_3   := '';
           Dt_Vcto_Desd_4   := '';
           Dt_Vcto_Desd_5   := '';
           Dt_Vcto_Desd_6   := '';
           Dt_Vcto_Desd_7   := '';
           Dt_Vcto_Desd_8   := '';
           Dt_Vcto_Desd_9   := '';
           Dt_Vcto_Desd_10  := '';
           Dt_Vcto_Desd_11  := '';
           Dt_Vcto_Desd_12  := '';
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text)) - StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_1       := StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text));
           Vlr_Desd_2       := (Calcula_Condicao / 1);
           Vlr_Desd_3       := 0;
           Vlr_Desd_4       := 0;
           Vlr_Desd_5       := 0;
           Vlr_Desd_6       := 0;
           Vlr_Desd_7       := 0;
           Vlr_Desd_8       := 0;
           Vlr_Desd_9       := 0;
           Vlr_Desd_10      := 0;
           Vlr_Desd_11      := 0;
           Vlr_Desd_12      := 0;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
           Forma_Desd_2      := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
           Forma_Desd_3      := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
           Forma_Desd_4      := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
           Forma_Desd_5      := Subtrai_Data(Cliente_Condicao_pgto_5.Text,Nota_Emissao.Text);
           Forma_Desd_6      := Subtrai_Data(Cliente_Condicao_pgto_6.Text,Nota_Emissao.Text);
           Forma_Desd_7      := Subtrai_Data(Cliente_Condicao_pgto_7.Text,Nota_Emissao.Text);
           Forma_Desd_8      := Subtrai_Data(Cliente_Condicao_pgto_8.Text,Nota_Emissao.Text);
           Forma_Desd_9      := Subtrai_Data(Cliente_Condicao_pgto_9.Text,Nota_Emissao.Text);
           Forma_Desd_10     := Subtrai_Data(Cliente_Condicao_pgto_10.Text,Nota_Emissao.Text);
           Forma_Desd_11     := Subtrai_Data(Cliente_Condicao_pgto_11.Text,Nota_Emissao.Text);
           Forma_Desd_12     := Subtrai_Data(Cliente_Condicao_pgto_12.Text,Nota_Emissao.Text);
           Forma_Desd_13     := Subtrai_Data(Cliente_Condicao_pgto_13.Text,Nota_Emissao.Text);
           Forma_Desd_14     := Subtrai_Data(Cliente_Condicao_pgto_14.Text,Nota_Emissao.Text);
           Forma_Desd_15     := Subtrai_Data(Cliente_Condicao_pgto_15.Text,Nota_Emissao.Text);
           Forma_Desd_16     := Subtrai_Data(Cliente_Condicao_pgto_16.Text,Nota_Emissao.Text);
           Forma_Desd_17     := Subtrai_Data(Cliente_Condicao_pgto_17.Text,Nota_Emissao.Text);
           Forma_Desd_18     := Subtrai_Data(Cliente_Condicao_pgto_18.Text,Nota_Emissao.Text);
           Forma_Desd_19     := Subtrai_Data(Cliente_Condicao_pgto_19.Text,Nota_Emissao.Text);
           Forma_Desd_20     := Subtrai_Data(Cliente_Condicao_pgto_20.Text,Nota_Emissao.Text);
           Forma_Desd_21     := Subtrai_Data(Cliente_Condicao_pgto_21.Text,Nota_Emissao.Text);
           Forma_Desd_22     := Subtrai_Data(Cliente_Condicao_pgto_22.Text,Nota_Emissao.Text);
           Forma_Desd_23     := Subtrai_Data(Cliente_Condicao_pgto_23.Text,Nota_Emissao.Text);
           Forma_Desd_24     := Subtrai_Data(Cliente_Condicao_pgto_24.Text,Nota_Emissao.Text);
           End

        Else If StrToFloat(Ponto_Virgula(Cliente_Condicao_Pgto_Vlr_1.Text)) > 0 Then
           Begin
           Nro_Nota_Desd_1  := Trim(Nota_Numero.Text);
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

           Dt_Vcto_Desd_1   := Trim(Cliente_Condicao_pgto_1.Text);
           Dt_Vcto_Desd_2   := '';
           Dt_Vcto_Desd_3   := '';
           Dt_Vcto_Desd_4   := '';
           Dt_Vcto_Desd_5   := '';
           Dt_Vcto_Desd_6   := '';
           Dt_Vcto_Desd_7   := '';
           Dt_Vcto_Desd_8   := '';
           Dt_Vcto_Desd_9   := '';
           Dt_Vcto_Desd_10  := '';
           Dt_Vcto_Desd_11  := '';
           Dt_Vcto_Desd_12  := '';
           Dt_Vcto_Desd_13  := '';
           Dt_Vcto_Desd_14  := '';
           Dt_Vcto_Desd_15  := '';
           Dt_Vcto_Desd_16  := '';
           Dt_Vcto_Desd_17  := '';
           Dt_Vcto_Desd_18  := '';
           Dt_Vcto_Desd_19  := '';
           Dt_Vcto_Desd_20  := '';
           Dt_Vcto_Desd_21  := '';
           Dt_Vcto_Desd_22  := '';
           Dt_Vcto_Desd_23  := '';
           Dt_Vcto_Desd_24  := '';

           Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text));
           Vlr_Desd_1       := Calcula_Condicao;
           Vlr_Desd_2       := 0;
           Vlr_Desd_3       := 0;
           Vlr_Desd_4       := 0;
           Vlr_Desd_5       := 0;
           Vlr_Desd_6       := 0;
           Vlr_Desd_7       := 0;
           Vlr_Desd_8       := 0;
           Vlr_Desd_9       := 0;
           Vlr_Desd_10      := 0;
           Vlr_Desd_11      := 0;
           Vlr_Desd_12      := 0;
           Vlr_Desd_13      := 0;
           Vlr_Desd_14      := 0;
           Vlr_Desd_15      := 0;
           Vlr_Desd_16      := 0;
           Vlr_Desd_17      := 0;
           Vlr_Desd_18      := 0;
           Vlr_Desd_19      := 0;
           Vlr_Desd_20      := 0;
           Vlr_Desd_21      := 0;
           Vlr_Desd_22      := 0;
           Vlr_Desd_23      := 0;
           Vlr_Desd_24      := 0;

           Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
           Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
           Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
           Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);
           Str(Vlr_Desd_5:13:2,Vlr_Str_Desd_5);
           Str(Vlr_Desd_6:13:2,Vlr_Str_Desd_6);
           Str(Vlr_Desd_7:13:2,Vlr_Str_Desd_7);
           Str(Vlr_Desd_8:13:2,Vlr_Str_Desd_8);
           Str(Vlr_Desd_9:13:2,Vlr_Str_Desd_9);
           Str(Vlr_Desd_10:13:2,Vlr_Str_Desd_10);
           Str(Vlr_Desd_11:13:2,Vlr_Str_Desd_11);
           Str(Vlr_Desd_12:13:2,Vlr_Str_Desd_12);
           Str(Vlr_Desd_13:13:2,Vlr_Str_Desd_13);
           Str(Vlr_Desd_14:13:2,Vlr_Str_Desd_14);
           Str(Vlr_Desd_15:13:2,Vlr_Str_Desd_15);
           Str(Vlr_Desd_16:13:2,Vlr_Str_Desd_16);
           Str(Vlr_Desd_17:13:2,Vlr_Str_Desd_17);
           Str(Vlr_Desd_18:13:2,Vlr_Str_Desd_18);
           Str(Vlr_Desd_19:13:2,Vlr_Str_Desd_19);
           Str(Vlr_Desd_20:13:2,Vlr_Str_Desd_20);
           Str(Vlr_Desd_21:13:2,Vlr_Str_Desd_21);
           Str(Vlr_Desd_22:13:2,Vlr_Str_Desd_22);
           Str(Vlr_Desd_23:13:2,Vlr_Str_Desd_23);
           Str(Vlr_Desd_24:13:2,Vlr_Str_Desd_24);

           Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
           Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
           Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
           Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);
           Cliente_Condicao_Pgto_Vlr_5.Text := Trim(Vlr_Str_Desd_5);
           Cliente_Condicao_Pgto_Vlr_6.Text := Trim(Vlr_Str_Desd_6);
           Cliente_Condicao_Pgto_Vlr_7.Text := Trim(Vlr_Str_Desd_7);
           Cliente_Condicao_Pgto_Vlr_8.Text := Trim(Vlr_Str_Desd_8);
           Cliente_Condicao_Pgto_Vlr_9.Text := Trim(Vlr_Str_Desd_9);
           Cliente_Condicao_Pgto_Vlr_10.Text := Trim(Vlr_Str_Desd_10);
           Cliente_Condicao_Pgto_Vlr_11.Text := Trim(Vlr_Str_Desd_11);
           Cliente_Condicao_Pgto_Vlr_12.Text := Trim(Vlr_Str_Desd_12);
           Cliente_Condicao_Pgto_Vlr_13.Text := Trim(Vlr_Str_Desd_13);
           Cliente_Condicao_Pgto_Vlr_14.Text := Trim(Vlr_Str_Desd_14);
           Cliente_Condicao_Pgto_Vlr_15.Text := Trim(Vlr_Str_Desd_15);
           Cliente_Condicao_Pgto_Vlr_16.Text := Trim(Vlr_Str_Desd_16);
           Cliente_Condicao_Pgto_Vlr_17.Text := Trim(Vlr_Str_Desd_17);
           Cliente_Condicao_Pgto_Vlr_18.Text := Trim(Vlr_Str_Desd_18);
           Cliente_Condicao_Pgto_Vlr_19.Text := Trim(Vlr_Str_Desd_19);
           Cliente_Condicao_Pgto_Vlr_20.Text := Trim(Vlr_Str_Desd_20);
           Cliente_Condicao_Pgto_Vlr_21.Text := Trim(Vlr_Str_Desd_21);
           Cliente_Condicao_Pgto_Vlr_22.Text := Trim(Vlr_Str_Desd_22);
           Cliente_Condicao_Pgto_Vlr_23.Text := Trim(Vlr_Str_Desd_23);
           Cliente_Condicao_Pgto_Vlr_24.Text := Trim(Vlr_Str_Desd_24);

           Forma_Desd_1      := 'À VISTA';
           Forma_Desd_2      := '';
           Forma_Desd_3      := '';
           Forma_Desd_4      := '';
           Forma_Desd_5      := '';
           Forma_Desd_6      := '';
           Forma_Desd_7      := '';
           Forma_Desd_8      := '';
           Forma_Desd_9      := '';
           Forma_Desd_10     := '';
           Forma_Desd_11     := '';
           Forma_Desd_12     := '';
           Forma_Desd_13     := '';
           Forma_Desd_14     := '';
           Forma_Desd_15     := '';
           Forma_Desd_16     := '';
           Forma_Desd_17     := '';
           Forma_Desd_18     := '';
           Forma_Desd_19     := '';
           Forma_Desd_20     := '';
           Forma_Desd_21     := '';
           Forma_Desd_22     := '';
           Forma_Desd_23     := '';
           Forma_Desd_24     := '';
        End;

     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_1KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_2KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_3KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_4KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_1Exit(
  Sender: TObject);
begin
     If Trim(Cliente_Condicao_Pgto_Vlr_1.Text) = '' Then
        Begin
        Cliente_Condicao_Pgto_Vlr_1.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_2Exit(
  Sender: TObject);
begin
     If Trim(Cliente_Condicao_Pgto_Vlr_2.Text) = '' Then
        Begin
        Cliente_Condicao_Pgto_Vlr_2.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_3Exit(
  Sender: TObject);
begin
     If Trim(Cliente_Condicao_Pgto_Vlr_3.Text) = '' Then
        Begin
        Cliente_Condicao_Pgto_Vlr_3.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_4Exit(
  Sender: TObject);
begin
     If Trim(Cliente_Condicao_Pgto_Vlr_4.Text) = '' Then
        Begin
        Cliente_Condicao_Pgto_Vlr_4.Text := '0,00';
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.BT_Adicionar_ForaClick(
  Sender: TObject);
begin
     If Trim(Cliente_Codigo.Text) <> '' Then
        Begin
        Ampulheta();

        SGD_Produtos.Refresh;

        Application.CreateForm(TAdicionaQtdeProduto02,AdicionaQtdeProduto02);

        AdicionaQtdeProduto02.Programa_Anterior.Text          := 'Registro-Notas-Inclusão';
        AdicionaQtdeProduto02.Adiciona_Codigo_Produto.Enabled := True;
        AdicionaQtdeProduto02.Adiciona_Referencia.Enabled     := True;
        AdicionaQtdeProduto02.Adiciona_Descricao.Enabled      := True;
        AdicionaQtdeProduto02.Adiciona_Quantidade.Enabled     := True;
        AdicionaQtdeProduto02.Adiciona_Unidade.Enabled        := True;
        AdicionaQtdeProduto02.Adiciona_IPI.Enabled            := True;
        AdicionaQtdeProduto02.Adiciona_Valor_Unitario.Enabled := True;
        AdicionaQtdeProduto02.Adiciona_CF.Enabled             := True;
        AdicionaQtdeProduto02.Adiciona_ST.Enabled             := True;

        AdicionaQtdeProduto02.Adiciona_ACol.Text              := IntToStr(SGD_Produtos.Col);
        AdicionaQtdeProduto02.Adiciona_ARow.Text              := IntToStr(SGD_Produtos.RowCount - 1);

        Seta();
        AdicionaQtdeProduto02.ShowModal;
        AdicionaQtdeProduto02.Destroy;

        SGD_Produtos.Refresh;

        //Totaliza_Pedido();
        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Cliente');
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.Imprime_Nota();

var
   Impressora: TextFile;
   Ind_Produto, Conta_Produto, Posicao_Inicial, Posicao_Final, Conta_Boleto, Nro_Nota_Boleto_INI, Nro_Nota_Boleto_FIM, Posicao_Nota_Boleto: Integer;
   Boleto_Obs, Comando_SQL: String;

   Boleto_Docto_1,Boleto_Docto_2,Boleto_Docto_3,Boleto_Docto_4,Boleto_Docto_5,Boleto_Docto_6,Boleto_Docto_7,Boleto_Docto_8,Boleto_Docto_9,Boleto_Docto_10,Boleto_Docto_11,Boleto_Docto_12,Boleto_Docto_13,Boleto_Docto_14,Boleto_Docto_15,Boleto_Docto_16,Boleto_Docto_17,Boleto_Docto_18,Boleto_Docto_19,Boleto_Docto_20,Boleto_Docto_21,Boleto_Docto_22,Boleto_Docto_23,Boleto_Docto_24: String;

   Vlr_Nota_Boleto_1,Vlr_Nota_Boleto_2,Vlr_Nota_Boleto_3,Vlr_Nota_Boleto_4,Vlr_Nota_Boleto_5,Vlr_Nota_Boleto_6,Vlr_Nota_Boleto_7,Vlr_Nota_Boleto_8,Vlr_Nota_Boleto_9,Vlr_Nota_Boleto_10,Vlr_Nota_Boleto_11,Vlr_Nota_Boleto_12,Vlr_Nota_Boleto_13,Vlr_Nota_Boleto_14,Vlr_Nota_Boleto_15,Vlr_Nota_Boleto_16,Vlr_Nota_Boleto_17,Vlr_Nota_Boleto_18,Vlr_Nota_Boleto_19,Vlr_Nota_Boleto_20,Vlr_Nota_Boleto_21,Vlr_Nota_Boleto_22,Vlr_Nota_Boleto_23,Vlr_Nota_Boleto_24: Real;

begin
     //*** Posiciona a Nota Fiscal ***

     If (Imprime_Nota_Apos.Checked = True) And (Trim(Tipo_Nota_Emissao.Text) = '') Then
         Begin

         If Confirma('Você deseja realmente Imprimir esta Nota Fiscal?') = 6 Then
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

            End
         Else
            Begin
            Imprimir.ArqDestino := 'C:\Ibrasmak\NF_Tela.TXT';
            Imprimir.Acentuacao := acNenhum;
         End;
     End;

     Ampulheta();

     Conta_Produto   := 0;
     Conta_Boleto    := 0;
     Posicao_Inicial := 1;
     Nro_Nota        := StrToInt(Nota_Numero.Text);

     For Ind_Produto := 1 To (SGD_Produtos.RowCount - 1) Do
         Begin

         Conta_Produto := Conta_Produto + 1;

         If Conta_Produto >= 18 Then
            Begin
            Posicao_Final        := Ind_produto;
            Nota_Numero.Text := IntToStr(Nro_Nota);

            Imprime_Nota_Ibrasmak(Posicao_Inicial, Posicao_Final);

            Conta_Produto   := 0;
            Posicao_Inicial := (Ind_produto + 1);
            Nro_Nota        := (Nro_Nota + 1);

            Conta_Boleto    := Conta_Boleto + 1;
         End;
     End;

     Posicao_Final := (Ind_produto - 1);

     If ((Conta_Produto > 0) And (Conta_Produto <= 18)) Then
        Begin
        Nota_Numero.Text := IntToStr(Nro_Nota);

        Imprime_Nota_Ibrasmak(Posicao_Inicial, Posicao_Final);

        Conta_Boleto := Conta_Boleto + 1;
     End;

     //*** Prepara a Junção dos Boletos - Ibrasmak ***

     Posicao_Nota_Boleto := Conta_Boleto - 1;
     Boleto_Obs          := '';

     Boleto_Docto_1  := '';
     Boleto_Docto_2  := '';
     Boleto_Docto_3  := '';
     Boleto_Docto_4  := '';
     Boleto_Docto_5  := '';
     Boleto_Docto_6  := '';
     Boleto_Docto_7  := '';
     Boleto_Docto_8  := '';
     Boleto_Docto_9  := '';
     Boleto_Docto_10 := '';
     Boleto_Docto_11 := '';
     Boleto_Docto_12 := '';
     Boleto_Docto_13 := '';
     Boleto_Docto_14 := '';
     Boleto_Docto_15 := '';
     Boleto_Docto_16 := '';
     Boleto_Docto_17 := '';
     Boleto_Docto_18 := '';
     Boleto_Docto_19 := '';
     Boleto_Docto_20 := '';
     Boleto_Docto_21 := '';
     Boleto_Docto_22 := '';
     Boleto_Docto_23 := '';
     Boleto_Docto_24 := '';

     Vlr_Nota_Boleto_1  := 0;
     Vlr_Nota_Boleto_2  := 0;
     Vlr_Nota_Boleto_3  := 0;
     Vlr_Nota_Boleto_4  := 0;
     Vlr_Nota_Boleto_5  := 0;
     Vlr_Nota_Boleto_6  := 0;
     Vlr_Nota_Boleto_7  := 0;
     Vlr_Nota_Boleto_8  := 0;
     Vlr_Nota_Boleto_9  := 0;
     Vlr_Nota_Boleto_10 := 0;
     Vlr_Nota_Boleto_11 := 0;
     Vlr_Nota_Boleto_12 := 0;
     Vlr_Nota_Boleto_13 := 0;
     Vlr_Nota_Boleto_14 := 0;
     Vlr_Nota_Boleto_15 := 0;
     Vlr_Nota_Boleto_16 := 0;
     Vlr_Nota_Boleto_17 := 0;
     Vlr_Nota_Boleto_18 := 0;
     Vlr_Nota_Boleto_19 := 0;
     Vlr_Nota_Boleto_20 := 0;
     Vlr_Nota_Boleto_21 := 0;
     Vlr_Nota_Boleto_22 := 0;
     Vlr_Nota_Boleto_23 := 0;
     Vlr_Nota_Boleto_24 := 0;

     If Posicao_Nota_Boleto > 0 Then
        Begin

        Boleto_Obs          := 'Ref.Notas: ';
        Nro_Nota_Boleto_FIM := StrToInt(Nota_Numero.Text);

        For Nro_Nota_Boleto_INI := (StrToInt(Nota_Numero.Text) - Posicao_Nota_Boleto) To Nro_Nota_Boleto_FIM Do
            Begin
            Comando_SQL := 'select * from fb_notas_fiscais where fb_nota_fiscal_numero = ' + Trim(IntToStr(Nro_Nota_Boleto_INI));

            ConexaoBD.SQL_FB_Nota_Fiscal.Close;
            ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
            ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_FB_Nota_Fiscal.Open;

            If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
               Begin
               Boleto_Docto_1 := Boleto_Docto_1 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text;
               Boleto_Docto_2 := Boleto_Docto_2 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text;
               Boleto_Docto_3 := Boleto_Docto_3 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text;
               Boleto_Docto_4 := Boleto_Docto_4 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_4.Text;
               Boleto_Docto_5 := Boleto_Docto_5 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_5.Text;
               Boleto_Docto_6 := Boleto_Docto_6 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_6.Text;
               Boleto_Docto_7 := Boleto_Docto_7 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_7.Text;
               Boleto_Docto_8 := Boleto_Docto_8 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_8.Text;
               Boleto_Docto_9 := Boleto_Docto_9 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_9.Text;
               Boleto_Docto_10 := Boleto_Docto_10 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_10.Text;
               Boleto_Docto_11 := Boleto_Docto_11 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_11.Text;
               Boleto_Docto_12 := Boleto_Docto_12 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_12.Text;
               Boleto_Docto_13 := Boleto_Docto_13 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_13.Text;
               Boleto_Docto_14 := Boleto_Docto_14 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_14.Text;
               Boleto_Docto_15 := Boleto_Docto_15 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_15.Text;
               Boleto_Docto_16 := Boleto_Docto_16 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_16.Text;
               Boleto_Docto_17 := Boleto_Docto_17 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_17.Text;
               Boleto_Docto_18 := Boleto_Docto_18 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_18.Text;
               Boleto_Docto_19 := Boleto_Docto_19 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_19.Text;
               Boleto_Docto_20 := Boleto_Docto_20 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_20.Text;
               Boleto_Docto_21 := Boleto_Docto_21 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_21.Text;
               Boleto_Docto_22 := Boleto_Docto_22 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_22.Text;
               Boleto_Docto_23 := Boleto_Docto_23 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_23.Text;
               Boleto_Docto_24 := Boleto_Docto_24 + ' / ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_24.Text;

               Vlr_Nota_Boleto_1 := Vlr_Nota_Boleto_1 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.AsFloat;
               Vlr_Nota_Boleto_2 := Vlr_Nota_Boleto_2 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.AsFloat;
               Vlr_Nota_Boleto_3 := Vlr_Nota_Boleto_3 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.AsFloat;
               Vlr_Nota_Boleto_4 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.AsFloat;
               Vlr_Nota_Boleto_5 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_5.AsFloat;
               Vlr_Nota_Boleto_6 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_6.AsFloat;
               Vlr_Nota_Boleto_7 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_7.AsFloat;
               Vlr_Nota_Boleto_8 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_8.AsFloat;
               Vlr_Nota_Boleto_9 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_9.AsFloat;
               Vlr_Nota_Boleto_10 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_10.AsFloat;
               Vlr_Nota_Boleto_11 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_11.AsFloat;
               Vlr_Nota_Boleto_12 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_12.AsFloat;
               Vlr_Nota_Boleto_13 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_13.AsFloat;
               Vlr_Nota_Boleto_14 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_14.AsFloat;
               Vlr_Nota_Boleto_15 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_15.AsFloat;
               Vlr_Nota_Boleto_16 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_16.AsFloat;
               Vlr_Nota_Boleto_17 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_17.AsFloat;
               Vlr_Nota_Boleto_18 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_18.AsFloat;
               Vlr_Nota_Boleto_19 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_19.AsFloat;
               Vlr_Nota_Boleto_20 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_20.AsFloat;
               Vlr_Nota_Boleto_21 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_21.AsFloat;
               Vlr_Nota_Boleto_22 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_22.AsFloat;
               Vlr_Nota_Boleto_23 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_23.AsFloat;
               Vlr_Nota_Boleto_24 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_24.AsFloat;

               Boleto_Obs := Boleto_Obs + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text) + ' - R$ ' + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text) + ' / ';

               Comando_SQL := 'Update fb_notas_fiscais Set ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_emissao = ' +#39+ 'N' +#39+ ', ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_obs = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_docto_1 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_docto_2 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_docto_3 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_docto_4 = ' +#39 + #39+ ', ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_vlr_1 = 0.00, ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_vlr_2 = 0.00, ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_vlr_3 = 0.00, ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_vlr_4 = 0.00 ';
               Comando_SQL := Comando_SQL + 'where fb_nota_fiscal_numero = ' + Trim(IntToStr(Nro_Nota_Boleto_INI));

               ConexaoBD.SQL_Comunitario.Close;
               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Comunitario.ExecSQL;
            End;
        End;
     End;

     Nro_Nota_Boleto_INI := (StrToInt(Nota_Numero.Text) - Posicao_Nota_Boleto);

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


     If Trim(Boleto_Docto_5) <> '' Then
        Begin
        Boleto_Docto_5 := Trim(Copy(Trim(Boleto_Docto_5),2,(Length(Trim(Boleto_Docto_5)) - 1)));
     End;

     If Trim(Boleto_Docto_6) <> '' Then
        Begin
        Boleto_Docto_6 := Trim(Copy(Trim(Boleto_Docto_6),2,(Length(Trim(Boleto_Docto_6)) - 1)));
     End;

     If Trim(Boleto_Docto_7) <> '' Then
        Begin
        Boleto_Docto_7 := Trim(Copy(Trim(Boleto_Docto_7),2,(Length(Trim(Boleto_Docto_7)) - 1)));
     End;

     If Trim(Boleto_Docto_8) <> '' Then
        Begin
        Boleto_Docto_8 := Trim(Copy(Trim(Boleto_Docto_8),2,(Length(Trim(Boleto_Docto_8)) - 1)));
     End;

     If Trim(Boleto_Docto_9) <> '' Then
        Begin
        Boleto_Docto_9 := Trim(Copy(Trim(Boleto_Docto_9),2,(Length(Trim(Boleto_Docto_9)) - 1)));
     End;

     If Trim(Boleto_Docto_10) <> '' Then
        Begin
        Boleto_Docto_10 := Trim(Copy(Trim(Boleto_Docto_10),2,(Length(Trim(Boleto_Docto_10)) - 1)));
     End;

     If Trim(Boleto_Docto_11) <> '' Then
        Begin
        Boleto_Docto_11 := Trim(Copy(Trim(Boleto_Docto_11),2,(Length(Trim(Boleto_Docto_11)) - 1)));
     End;

     If Trim(Boleto_Docto_12) <> '' Then
        Begin
        Boleto_Docto_12 := Trim(Copy(Trim(Boleto_Docto_12),2,(Length(Trim(Boleto_Docto_12)) - 1)));
     End;

     If Trim(Boleto_Docto_13) <> '' Then
        Begin
        Boleto_Docto_13 := Trim(Copy(Trim(Boleto_Docto_13),2,(Length(Trim(Boleto_Docto_13)) - 1)));
     End;

     If Trim(Boleto_Docto_14) <> '' Then
        Begin
        Boleto_Docto_14 := Trim(Copy(Trim(Boleto_Docto_14),2,(Length(Trim(Boleto_Docto_14)) - 1)));
     End;

     If Trim(Boleto_Docto_15) <> '' Then
        Begin
        Boleto_Docto_15 := Trim(Copy(Trim(Boleto_Docto_15),2,(Length(Trim(Boleto_Docto_15)) - 1)));
     End;

     If Trim(Boleto_Docto_16) <> '' Then
        Begin
        Boleto_Docto_16 := Trim(Copy(Trim(Boleto_Docto_16),2,(Length(Trim(Boleto_Docto_16)) - 1)));
     End;

     If Trim(Boleto_Docto_17) <> '' Then
        Begin
        Boleto_Docto_17 := Trim(Copy(Trim(Boleto_Docto_17),2,(Length(Trim(Boleto_Docto_17)) - 1)));
     End;

     If Trim(Boleto_Docto_18) <> '' Then
        Begin
        Boleto_Docto_18 := Trim(Copy(Trim(Boleto_Docto_18),2,(Length(Trim(Boleto_Docto_18)) - 1)));
     End;

     If Trim(Boleto_Docto_19) <> '' Then
        Begin
        Boleto_Docto_19 := Trim(Copy(Trim(Boleto_Docto_19),2,(Length(Trim(Boleto_Docto_19)) - 1)));
     End;

     If Trim(Boleto_Docto_20) <> '' Then
        Begin
        Boleto_Docto_20 := Trim(Copy(Trim(Boleto_Docto_20),2,(Length(Trim(Boleto_Docto_20)) - 1)));
     End;

     If Trim(Boleto_Docto_21) <> '' Then
        Begin
        Boleto_Docto_21 := Trim(Copy(Trim(Boleto_Docto_21),2,(Length(Trim(Boleto_Docto_21)) - 1)));
     End;

     If Trim(Boleto_Docto_22) <> '' Then
        Begin
        Boleto_Docto_22 := Trim(Copy(Trim(Boleto_Docto_22),2,(Length(Trim(Boleto_Docto_22)) - 1)));
     End;

     If Trim(Boleto_Docto_23) <> '' Then
        Begin
        Boleto_Docto_23 := Trim(Copy(Trim(Boleto_Docto_23),2,(Length(Trim(Boleto_Docto_23)) - 1)));
     End;

     If Trim(Boleto_Docto_24) <> '' Then
        Begin
        Boleto_Docto_24 := Trim(Copy(Trim(Boleto_Docto_24),2,(Length(Trim(Boleto_Docto_24)) - 1)));
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

     If Trim(Boleto_Docto_5) = '/' Then
        Begin
        Boleto_Docto_5 := '';
     End;

     If Trim(Boleto_Docto_6) = '/' Then
        Begin
        Boleto_Docto_6 := '';
     End;

     If Trim(Boleto_Docto_7) = '/' Then
        Begin
        Boleto_Docto_7 := '';
     End;

     If Trim(Boleto_Docto_8) = '/' Then
        Begin
        Boleto_Docto_8 := '';
     End;

     If Trim(Boleto_Docto_9) = '/' Then
        Begin
        Boleto_Docto_9 := '';
     End;

     If Trim(Boleto_Docto_10) = '/' Then
        Begin
        Boleto_Docto_10 := '';
     End;

     If Trim(Boleto_Docto_11) = '/' Then
        Begin
        Boleto_Docto_11 := '';
     End;

     If Trim(Boleto_Docto_12) = '/' Then
        Begin
        Boleto_Docto_12 := '';
     End;

     If Trim(Boleto_Docto_13) = '/' Then
        Begin
        Boleto_Docto_13 := '';
     End;

     If Trim(Boleto_Docto_14) = '/' Then
        Begin
        Boleto_Docto_14 := '';
     End;

     If Trim(Boleto_Docto_15) = '/' Then
        Begin
        Boleto_Docto_15 := '';
     End;

     If Trim(Boleto_Docto_16) = '/' Then
        Begin
        Boleto_Docto_16 := '';
     End;

     If Trim(Boleto_Docto_17) = '/' Then
        Begin
        Boleto_Docto_17 := '';
     End;

     If Trim(Boleto_Docto_18) = '/' Then
        Begin
        Boleto_Docto_18 := '';
     End;

     If Trim(Boleto_Docto_19) = '/' Then
        Begin
        Boleto_Docto_19 := '';
     End;

     If Trim(Boleto_Docto_20) = '/' Then
        Begin
        Boleto_Docto_20 := '';
     End;

     If Trim(Boleto_Docto_21) = '/' Then
        Begin
        Boleto_Docto_21 := '';
     End;

     If Trim(Boleto_Docto_22) = '/' Then
        Begin
        Boleto_Docto_22 := '';
     End;

     If Trim(Boleto_Docto_23) = '/' Then
        Begin
        Boleto_Docto_23 := '';
     End;

     If Trim(Boleto_Docto_24) = '/' Then
        Begin
        Boleto_Docto_24 := '';
     End;

     If Trim(Boleto_Obs) = '/' Then
        Begin
        Boleto_Obs := '';
     End;

     Comando_SQL := 'Update fb_notas_fiscais Set ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_emissao = ' +#39+ 'S' +#39+ ', ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_obs = ' +#39 + Trim(Boleto_Obs) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_docto_1 = ' +#39 + Trim(Boleto_Docto_1) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_docto_2 = ' +#39 + Trim(Boleto_Docto_2) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_docto_3 = ' +#39 + Trim(Boleto_Docto_3) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_docto_4 = ' +#39 + Trim(Boleto_Docto_4) + #39+ ', ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_vlr_1 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_1)) + ', ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_vlr_2 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_2)) + ', ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_vlr_3 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_3)) + ', ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_boleto_vlr_4 = ' + Virgula_Ponto(FloatToStr(Vlr_Nota_Boleto_4)) + ' ';
     Comando_SQL := Comando_SQL + 'where fb_nota_fiscal_numero = ' + Trim(IntToStr(Nro_Nota_Boleto_INI));

     ConexaoBD.SQL_Comunitario.Close;
     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     Seta();
end;

procedure TRegistroNotasFiscaisSaidas01.Imprime_Nota_Ibrasmak(Posicao_Inicial, Posicao_Final: Integer);

var
   Linha: Integer;
   Descricao, Observacao_1, Observacao_2, Observacao_3, Observacao_4: String;
   Codigo_CFOP, Codigo_CFOP_2, Endereco_Cobranca, Endereco_Entrega, Valor_Extenso, Comando_SQL: String;
   Base_ICMS_Reduzida, Base_ICMS_Substituicao, Aliquota_ICMS, Aliquota_ICMS_Reducao, Aliquota_ICMS_Substituicao, Vlr_Suframa: Real;
   Ind, Ind_Detalhada, Total_Produtos: Integer;

   Classificacao_Fiscal, Unidade_Produto, VLR_ICMS_Substituicao_Str, VLR_ICMS_Oper_Propria_Str: String;
   BC_ICMS_Reduzida, BC_ICMS_Normal, BC_ICMS_Normal_Sub, BC_ICMS_Substituicao, VLR_ICMS_Reduzida, VLR_ICMS_Normal, VLR_ICMS_Substituicao, BC_IPI_Normal, VLR_IPI_Normal: Real;
   Bonificacao, Peso, Total_Nro, Porcentagem_Nro, Frete_Nro, IPI_Nro, Valor_Nro: Real;
   Unidade: Real;
   Erro, Conta_produtos, Outros_Produtos: Integer;
   Maiuscula, Total_Str, Porcentagem_Str, Valor_Str, BC_ICMS_Str, Transportadora: String;

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

     //Total_Nota      := Total_Nota + VLR_IPI_Normal;
     Valor_Str := Trim(Virgula_Ponto(Valor_Total.Text));
     Val(Valor_Str,Valor_Nro,Erro);
     Total_Nota := Valor_Nro;

     Conta_Produtos := Conta_Produtos - 1;
     Posicao_Final  := Conta_Produtos;

     Total_Desconto := (Total_Nota - ((Total_Nota * Porcentagem_Desconto) / 100));
     Vlr_Desconto   := ((Total_Nota * Porcentagem_Desconto) / 100);

     //Vlr_Total_Produtos := (Total_Nota + Vlr_Frete) - VLR_IPI_Normal;
     Valor_Str := Trim(Virgula_Ponto(Nota_Valor_Produto.Text));
     Val(Valor_Str,Valor_Nro,Erro);
     Vlr_Total_Produtos := Valor_Nro;

     Total_Desconto     := (Total_Desconto + Vlr_Frete);

     If Total_NF_IPI.Checked Then
        Begin
        Str((Vlr_Total_Produtos + VLR_IPI_Normal):13:2,Vlr_Total_Produtos_Str);
        End
     Else
        Begin
        Str((Vlr_Total_Produtos):13:2,Vlr_Total_Produtos_Str);
     End;
     Vlr_Total_Produtos := Valor_Nro;

     //Valor_Total.Text := Ponto_Virgula(Trim(Vlr_Total_Produtos_Str));

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

     Linha := Linha + 2;
     //*** Coloca o X na Nota Fiscal ***

     If StrToInt(Copy(Retira_Caracter(Trim(Cliente_CFOP.Text),'.'),1,4)) > 5000 Then
        Begin
        Imprimir.PoeStr(Linha,083, 'XXX');
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,098, 'XXX');
     End;     

     Imprimir.PoeStr(Linha,125, Trim(Nota_Numero.Text));
                          
     Linha := Linha + 6;
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
     Imprimir.PoeStr(Linha,120, Trim(Nota_Emissao.Text));

     //*** Seleciona o Cliente ou o Fornecedor ***

     Comando_SQL := 'Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39;

     ConexaoBD.SQL_Clientes.Close;
     ConexaoBD.SQL_Clientes.SQL.Clear;
     ConexaoBD.SQL_Clientes.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Clientes.Open;

     If ConexaoBD.SQL_Clientes.RecordCount > 0 Then
        Begin
        Cliente_Endereco.Text           := ConexaoBD.SQL_Clientesfb_cliente_endereco.Text;
        Cliente_Complemento.Text        := ConexaoBD.SQL_Clientesfb_cliente_complemento.Text;
        Cliente_Bairro.Text             := ConexaoBD.SQL_Clientesfb_cliente_bairro.Text;
        Cliente_Cidade.Text             := ConexaoBD.SQL_Clientesfb_cliente_cidade.Text;
        Cliente_Estado.ItemIndex        := Obtem_Nro_Estado(ConexaoBD.SQL_Clientesfb_cliente_estado.Text);
        Cliente_Cep.Text                := ConexaoBD.SQL_Clientesfb_cliente_cep.Text;

        Cliente_Fone_Comercial.Text     := ConexaoBD.SQL_Clientesfb_cliente_fone_comercial.Text;
        Cliente_Fone_Residencial.Text   := ConexaoBD.SQL_Clientesfb_cliente_fone_residencial.Text;
        Cliente_Fone_Celular.Text       := ConexaoBD.SQL_Clientesfb_cliente_fone_celular.Text;
        Cliente_Fone_Fax.Text           := ConexaoBD.SQL_Clientesfb_cliente_fone_fax.Text;

        Cliente_Inscricao_Estadual.Text := ConexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text;
        End
     Else
        Begin
        Comando_SQL := 'Select * from fb_fornecedores Where fb_fornecedor_codigo Like ' +#39+'%'+ Trim(Cliente_Codigo.Text) +'%'+#39+' Order By fb_fornecedor_codigo';

        ConexaoBD.SQL_Fornecedores.Close;
        ConexaoBD.SQL_Fornecedores.SQL.Clear;
        ConexaoBD.SQL_Fornecedores.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Fornecedores.Open;

        If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
           Begin
           Cliente_Endereco.Text           := ConexaoBD.SQL_Fornecedoresfb_fornecedor_endereco.Text;
           Cliente_Complemento.Text        := '';
           Cliente_Bairro.Text             := ConexaoBD.SQL_Fornecedoresfb_fornecedor_bairro.Text;
           Cliente_Cidade.Text             := ConexaoBD.SQL_Fornecedoresfb_fornecedor_cidade.Text;
           Cliente_Estado.ItemIndex        := Obtem_Nro_Estado(ConexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text);
           Cliente_Cep.Text                := ConexaoBD.SQL_Fornecedoresfb_fornecedor_cep.Text;

           Cliente_Fone_Comercial.Text     := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_comercial.Text;
           Cliente_Fone_Residencial.Text   := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone.Text;
           Cliente_Fone_Celular.Text       := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_celular.Text;
           Cliente_Fone_Fax.Text           := ConexaoBD.SQL_Fornecedoresfb_fornecedor_fone_fax.Text;

           Cliente_Inscricao_Estadual.Text := ConexaoBD.SQL_Fornecedoresfb_fornecedor_inscricao_estadual.Text;
           End
        Else
           Begin
           Cliente_Endereco.Text           := '';
           Cliente_Complemento.Text        := '';
           Cliente_Bairro.Text             := '';
           Cliente_Cidade.Text             := '';
           Cliente_Estado.ItemIndex        := Obtem_Nro_Estado('SP');
           Cliente_Cep.Text                := '';

           Cliente_Fone_Comercial.Text     := '';
           Cliente_Fone_Residencial.Text   := '';
           Cliente_Fone_Celular.Text       := '';
           Cliente_Fone_Fax.Text           := '';

           Cliente_Inscricao_Estadual.Text := '';
        End;
     End;

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

     Linha := Linha + 3;

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
        If (Trim(Cliente_Condicao_Pgto_1.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_1.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,003, Trim(Nro_Nota_Desd_1));
           Imprimir.PoeStr(Linha,017, Trim(Cliente_Condicao_Pgto_1.Text));
           Imprimir.PoeStr(Linha,037, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_1.Text,10));
           End
        Else
           Begin
           Imprimir.PoeStr(Linha,003, Trim(Nro_Nota_Desd_1));
           Imprimir.PoeStr(Linha,017, 'À VISTA');
           Imprimir.PoeStr(Linha,037, Exibe_Nro_Impressao(Vlr_Str_Desd_1,10));
        End;

        If (Trim(Cliente_Condicao_Pgto_2.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_2.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,051, Trim(Nro_Nota_Desd_2));
           Imprimir.PoeStr(Linha,063, Trim(Cliente_Condicao_Pgto_2.Text));
           Imprimir.PoeStr(Linha,083, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_2.Text,10));
        End;

        If (Trim(Cliente_Condicao_Pgto_3.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_3.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,097, Trim(Nro_Nota_Desd_3));
           Imprimir.PoeStr(Linha,109, Trim(Cliente_Condicao_Pgto_3.Text));
           Imprimir.PoeStr(Linha,121, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_3.Text,10));
        End;
     End;

     Linha := Linha + 1;

     If (Pos('VENDA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) > 0) Then
        Begin
        If (Trim(Cliente_Condicao_Pgto_4.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_4.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,003, Trim(Nro_Nota_Desd_4));
           Imprimir.PoeStr(Linha,017, Trim(Cliente_Condicao_Pgto_4.Text));
           Imprimir.PoeStr(Linha,037, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_4.Text,10));
        End;

        If (Trim(Cliente_Condicao_Pgto_5.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_5.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,051, Trim(Nro_Nota_Desd_5));
           Imprimir.PoeStr(Linha,063, Trim(Cliente_Condicao_Pgto_5.Text));
           Imprimir.PoeStr(Linha,083, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_5.Text,10));
        End;

        If (Trim(Cliente_Condicao_Pgto_6.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_6.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,097, Trim(Nro_Nota_Desd_6));
           Imprimir.PoeStr(Linha,109, Trim(Cliente_Condicao_Pgto_6.Text));
           Imprimir.PoeStr(Linha,121, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_6.Text,10));
        End;

     End;

     Linha := Linha + 1;

     If (Pos('VENDA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) > 0) Then
        Begin
        If (Trim(Cliente_Condicao_Pgto_7.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_7.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,003, Trim(Nro_Nota_Desd_7));
           Imprimir.PoeStr(Linha,017, Trim(Cliente_Condicao_Pgto_7.Text));
           Imprimir.PoeStr(Linha,037, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_7.Text,10));
        End;

        If (Trim(Cliente_Condicao_Pgto_8.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_8.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,051, Trim(Nro_Nota_Desd_8));
           Imprimir.PoeStr(Linha,063, Trim(Cliente_Condicao_Pgto_8.Text));
           Imprimir.PoeStr(Linha,083, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_8.Text,10));
        End;

        If (Trim(Cliente_Condicao_Pgto_9.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_9.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,097, Trim(Nro_Nota_Desd_9));
           Imprimir.PoeStr(Linha,109, Trim(Cliente_Condicao_Pgto_9.Text));
           Imprimir.PoeStr(Linha,121, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_9.Text,10));
        End;

     End;

     Linha := Linha + 1;

     If (Pos('VENDA',UpperCase(Trim(Cliente_Natureza_Operacao.Text))) > 0) Then
        Begin
        If (Trim(Cliente_Condicao_Pgto_10.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_10.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,003, Trim(Nro_Nota_Desd_10));
           Imprimir.PoeStr(Linha,017, Trim(Cliente_Condicao_Pgto_10.Text));
           Imprimir.PoeStr(Linha,037, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_10.Text,10));
        End;

        If (Trim(Cliente_Condicao_Pgto_11.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_11.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,051, Trim(Nro_Nota_Desd_11));
           Imprimir.PoeStr(Linha,063, Trim(Cliente_Condicao_Pgto_11.Text));
           Imprimir.PoeStr(Linha,083, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_11.Text,10));
        End;

        If (Trim(Cliente_Condicao_Pgto_12.Text) <> '/  /') And (Trim(Cliente_Condicao_Pgto_12.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,097, Trim(Nro_Nota_Desd_12));
           Imprimir.PoeStr(Linha,109, Trim(Cliente_Condicao_Pgto_12.Text));
           Imprimir.PoeStr(Linha,121, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_12.Text,10));
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

            Produto_Detalhada := SGD_Produtos.Cells[13,Ind];

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

            Imprimir.PoeStr(Linha,012, Letra_Maiuscula(Produto_Detalhada_1) );
            Imprimir.PoeStr(Linha,065, Trim(Classificacao_Fiscal));
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

            If Trim(SGD_Produtos.Cells[13,Ind]) <> '' Then
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
     End;

     Total_Produtos := (13 - Conta_Produtos);

     If Total_Produtos <= 0 Then
        Begin
        Total_produtos := 0;
     End;

     Linha := Linha + Total_Produtos;

     //*** Início - Observação no Corpo da Nota ***

     If Observacao_Corpo_Nota.Checked Then
        Begin
        Observacao_4 := Observacao_Nota.Text;
        End
     Else
        Begin
        Observacao_4 := '';
     End;

     Linha := Linha + 1;
     //If (Trim(Observacao_4) <> '') Then
     //   Begin
     //   Imprimir.PoeStr(Linha,005, Letra_Maiuscula(Copy(Trim(Observacao_4),1,62)) );
     //End;

     Linha := Linha + 1;
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

     BC_ICMS_Str  := Virgula_Ponto(Nota_Base_ICMS.Text);
     Vlr_ICMS_Str := Virgula_Ponto(Nota_Valor_ICMS.Text);

     Imprimir.PoeStr(Linha,017, Exibe_Nro_Impressao(Trim(BC_ICMS_Str),10));
     Imprimir.PoeStr(Linha,045, Exibe_Nro_Impressao(Trim(Vlr_ICMS_Str),10));

     //*** Finalizacao para Impressao do ICMS e IPI ***

     Vlr_Total_Produtos_Str := Virgula_Ponto(Nota_Valor_Produto.Text);

     Imprimir.PoeStr(Linha,120, Exibe_Nro_Impressao(Trim(Vlr_Total_Produtos_Str),10));

     Linha := Linha + 2;

     Vlr_Frete_Str := Virgula_Ponto(Valor_Frete.Text);
     Vlr_IPI_Str   := Virgula_Ponto(Valor_IPI.Text);

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

     Total_Nota_Str := Virgula_Ponto(Valor_Total.Text);
     Imprimir.PoeStr(Linha,120, Exibe_Nro_Impressao(Trim(Total_Nota_Str),10));

     Linha := Linha + 3;
     Transportadora := Obtem_Depois_Traco(Cliente_Transportadora.Text);
     Codigo_Transportadora.Text := Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text);

     Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Transportadora));

     If Trim(Cliente_Pgto_Frete.text) = 'Cliente' Then
        Begin
        Imprimir.PoeStr(Linha,065, '2');
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,065, '1');
     End;

     //*** Obtem dados da Transportadora ***

     ConexaoBD.SQL_Transportadoras.Close;
     ConexaoBD.SQL_Transportadoras.SQL.Clear;
     ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_numero = ' + Trim(Codigo_Transportadora.Text) + ' Order By fb_transportadora_nome');
     ConexaoBD.SQL_Transportadoras.Open;

     Imprimir.PoeStr(Linha,110, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_cnpj.Text));

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
     Imprimir.PoeStr(Linha,103, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_estado.Text));
     Imprimir.PoeStr(Linha,110, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_insc_est.Text));

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

     If Trim(Cliente_Ordem_Compra.Text) <> '' Then
        Begin
        Observacao_4 := 'NRO.OC: ' + Trim(Cliente_Ordem_Compra.Text) + ' || ' + Observacao_4;
     End;

     If (Trim(Observacao_4) <> '') Then
         Begin
         Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Copy(Trim(Observacao_4),001,042)) );
     End;

     Linha := Linha + 1;
     If (Trim(Observacao_4) <> '') Then
         Begin
         Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Copy(Trim(Observacao_4),043,042)) );
     End;

     Linha := Linha + 1;
     If (Trim(Observacao_4) <> '') Then
         Begin
         Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Copy(Trim(Observacao_4),085,042)) );
     End;

     Linha := Linha + 1;
     If (Trim(Observacao_4) <> '') Then
         Begin
         Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Copy(Trim(Observacao_4),127,042)) );
     End;

     Linha := Linha + 1;
     If (Trim(Observacao_4) <> '') Then
         Begin
         Imprimir.PoeStr(Linha,026, Letra_Maiuscula(Copy(Trim(Observacao_4),169,042)) );
     End;

     Linha := Linha + 1;
     If (Trim(Observacao_4) <> '') Then
         Begin
         Imprimir.PoeStr(Linha,025, Letra_Maiuscula(Copy(Trim(Observacao_4),211,042)) );
     End;

     Linha := Linha + 3;
     Imprimir.PoeStr(Linha,010, Trim(Nota_Numero.Text));

     Imprimir.ImprimeJob;
     Imprimir.LimpaBuffer;

     Seta();
end;

procedure TRegistroNotasFiscaisSaidas01.Grava_Nota_Ibrasmak(Posicao_Inicial, Posicao_Final: Integer);

var
   Comando_SQL: String;
   Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4, Cond_Pgto_5, Cond_Pgto_6, Cond_Pgto_7, Cond_Pgto_8, Cond_Pgto_9, Cond_Pgto_10, Cond_Pgto_11, Cond_Pgto_12, Cond_Pgto_13, Cond_Pgto_14, Cond_Pgto_15, Cond_Pgto_16, Cond_Pgto_17, Cond_Pgto_18, Cond_Pgto_19, Cond_Pgto_20, Cond_Pgto_21, Cond_Pgto_22, Cond_Pgto_23, Cond_Pgto_24, Transportadora, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Vlr_Frete, Vlr_IPI, Representante, Banco: String;
   Valor_Inteiro: String;
   Ind: Integer;

begin
     //*** Prepara Variáveis ***

     Volume            := Trim(Qtde_Volume.Text);

     Desconto          := Trim(Virgula_Ponto(Cliente_Desconto.Text));
     Cond_Pgto_1       := Trim(Forma_Desd_1);
     Cond_Pgto_2       := Trim(Forma_Desd_2);
     Cond_Pgto_3       := Trim(Forma_Desd_3);
     Cond_Pgto_4       := Trim(Forma_Desd_4);
     Cond_Pgto_5       := Trim(Forma_Desd_5);
     Cond_Pgto_6       := Trim(Forma_Desd_6);
     Cond_Pgto_7       := Trim(Forma_Desd_7);
     Cond_Pgto_8       := Trim(Forma_Desd_8);
     Cond_Pgto_9       := Trim(Forma_Desd_9);
     Cond_Pgto_10       := Trim(Forma_Desd_10);
     Cond_Pgto_11       := Trim(Forma_Desd_11);
     Cond_Pgto_12       := Trim(Forma_Desd_12);
     Cond_Pgto_13       := Trim(Forma_Desd_13);
     Cond_Pgto_14       := Trim(Forma_Desd_14);
     Cond_Pgto_15       := Trim(Forma_Desd_15);
     Cond_Pgto_16       := Trim(Forma_Desd_16);
     Cond_Pgto_17       := Trim(Forma_Desd_17);
     Cond_Pgto_18       := Trim(Forma_Desd_18);
     Cond_Pgto_19       := Trim(Forma_Desd_19);
     Cond_Pgto_20       := Trim(Forma_Desd_20);
     Cond_Pgto_21       := Trim(Forma_Desd_21);
     Cond_Pgto_22       := Trim(Forma_Desd_22);
     Cond_Pgto_23       := Trim(Forma_Desd_23);
     Cond_Pgto_24       := Trim(Forma_Desd_24);

     Vlr_Desconto      := Trim(Virgula_Ponto(Valor_Desconto.Text));
     Vlr_Pedido        := Trim(Virgula_Ponto(Nota_Valor_Produto.Text));

     Total_Desconto_Str := Trim(Valor_Total.Text);
     Total_Nota         := StrToFloat(Ponto_Virgula(Valor_Total.Text));

     //If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
     //   Begin
     //   Str((Total_Nota - ((Total_Nota * 7) / 100)):13:2,Total_Desconto_Str);
     //   Vlr_Total := Trim(Virgula_Ponto(Total_Desconto_Str));
     //   End
     //Else
     //   Begin
        Vlr_Total := Trim(Virgula_Ponto(Total_Desconto_Str));
     //End;

     Vlr_Frete         := Trim(Virgula_Ponto(Valor_Frete.Text));
     Vlr_IPI           := Trim(Virgula_Ponto(Valor_IPI.Text));

     Vlr_Str_Desd_1    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_1.Text));
     Vlr_Str_Desd_2    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_2.Text));
     Vlr_Str_Desd_3    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_3.Text));
     Vlr_Str_Desd_4    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_4.Text));
     Vlr_Str_Desd_5    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_5.Text));
     Vlr_Str_Desd_6    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_6.Text));
     Vlr_Str_Desd_7    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_7.Text));
     Vlr_Str_Desd_8    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_8.Text));
     Vlr_Str_Desd_9    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_9.Text));
     Vlr_Str_Desd_10    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_10.Text));
     Vlr_Str_Desd_11    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_11.Text));
     Vlr_Str_Desd_12    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_12.Text));
     Vlr_Str_Desd_13    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_13.Text));
     Vlr_Str_Desd_14    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_14.Text));
     Vlr_Str_Desd_15    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_15.Text));
     Vlr_Str_Desd_16    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_16.Text));
     Vlr_Str_Desd_17    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_17.Text));
     Vlr_Str_Desd_18    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_18.Text));
     Vlr_Str_Desd_19    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_19.Text));
     Vlr_Str_Desd_20    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_20.Text));
     Vlr_Str_Desd_21    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_21.Text));
     Vlr_Str_Desd_22    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_22.Text));
     Vlr_Str_Desd_23    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_23.Text));
     Vlr_Str_Desd_24    := Trim(Virgula_Ponto(Cliente_Condicao_Pgto_Vlr_24.Text));

     Vlr_Str_ICMS      := Trim(Virgula_Ponto(Nota_Valor_ICMS.Text));

     If Trim(Desconto) = '' Then
        Begin
        Desconto := '0';
     End;

     If ((Trim(Cond_Pgto_1) = '') Or (Trim(Cond_Pgto_1) = 'À VISTA')) Then
        Begin
        Cond_Pgto_1 := '0';
     End;

     If ((Trim(Cond_Pgto_2) = '') Or (Trim(Cond_Pgto_2) = 'À VISTA')) Then
        Begin
        Cond_Pgto_2 := '0';
     End;

     If ((Trim(Cond_Pgto_3) = '') Or (Trim(Cond_Pgto_3) = 'À VISTA')) Then
        Begin
        Cond_Pgto_3 := '0';
     End;

     If ((Trim(Cond_Pgto_4) = '') Or (Trim(Cond_Pgto_4) = 'À VISTA')) Then
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

     If Trim(Cliente_Condicao_Pgto_1.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_1.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_2.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_2.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_3.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_3.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_4.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_4.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_5.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_5.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_6.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_6.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_7.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_7.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_8.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_8.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_9.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_9.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_10.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_10.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_11.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_11.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_12.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_12.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_13.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_13.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_14.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_14.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_15.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_15.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_16.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_16.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_17.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_17.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_18.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_18.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_19.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_19.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_20.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_20.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_21.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_21.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_22.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_22.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_23.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_23.Text := '00/00/0000';
     End;

     If Trim(Cliente_Condicao_Pgto_24.Text) = '/  /' Then
        Begin
        Cliente_Condicao_Pgto_24.Text := '00/00/0000';
     End;

     //*** CLIENTE / FORNECEDOR
     If(Edit_Tipo_Inclusao.Text = 'Cliente') Then
     Begin
         //*** Registra a Data da Última Compra no Cliente ***
         Comando_SQL := 'Update fb_clientes Set ';
         Comando_SQL := Comando_SQL + 'fb_cliente_data_ultima_compra = ' +#39+ Trim(Inverte_Data_Plus(Nota_Emissao.Text,'amd','/')) +#39+',';
         Comando_SQL := Comando_SQL + 'fb_cliente_ultimo_valor = ' + Trim(Vlr_Total);
         Comando_SQL := Comando_SQL + ' Where fb_cliente_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39;

         ConexaoBD.SQL_Comunitario.SQL.Clear;
         ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
         ConexaoBD.SQL_Comunitario.ExecSQL;

         Comando_SQL := 'Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39;

         ConexaoBD.SQL_Clientes.Close;
         ConexaoBD.SQL_Clientes.SQL.Clear;
         ConexaoBD.SQL_Clientes.SQL.Add(Comando_SQL);
         ConexaoBD.SQL_Clientes.Open;

         //*** Registra a Nota Fiscal ***
         Transportadora    := Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text);
         Representante     := ConexaoBD.SQL_Clientesfb_cliente_vendedor.Text;
         Banco             := ConexaoBD.SQL_Clientesfb_cliente_banco.Text;
     End
     Else
     Begin
         //*** Registra a Data da Última Compra no Fornecedor ***
         Comando_SQL := 'Update fb_fornecedores Set ';
         Comando_SQL := Comando_SQL + 'fb_fornecedor_data_ultima_compra = ' +#39+ Trim(Inverte_Data_Plus(Nota_Emissao.Text,'amd','/')) +#39+',';
         Comando_SQL := Comando_SQL + 'fb_fornecedor_ultimo_valor = ' + Trim(Vlr_Total);
         Comando_SQL := Comando_SQL + ' Where fb_fornecedor_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39;

         ConexaoBD.SQL_Comunitario.SQL.Clear;
         ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
         ConexaoBD.SQL_Comunitario.ExecSQL;

         Comando_SQL := 'Select * from fb_fornecedores Where fb_fornecedor_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39;

         ConexaoBD.SQL_Fornecedores.Close;
         ConexaoBD.SQL_Fornecedores.SQL.Clear;
         ConexaoBD.SQL_Fornecedores.SQL.Add(Comando_SQL);
         ConexaoBD.SQL_Fornecedores.Open;

         //*** Registra a Nota Fiscal ***
         Transportadora    := Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text);
         Representante     := '0';
         Banco             := '0';
     End;

     Comando_SQL := 'Insert into fb_notas_fiscais(';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_numero, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo_tipo, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_codigo, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_nome, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_desconto, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_1, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_2, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_3, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_4, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_5, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_6, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_7, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_8, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_9, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_10, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_11, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_12, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_13, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_14, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_15, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_16, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_17, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_18, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_19, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_20, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_21, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_22, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_23, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cond_pgto_24, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_fatura, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_tabela, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_emite_lote, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_transp, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_transporta, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_desc, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_pedido, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_total, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_observacao_log, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_pgto_frete, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_natureza_oper, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_natureza_oper_desc, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_natureza_oper_nro, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_data_emissao, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_estado, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_faturado, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_vendedor, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_banco, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_1, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_1, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_1, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_1, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_2, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_2, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_2, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_2, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_3, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_3, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_3, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_3, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_4, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_4, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_4, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_4, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_5, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_5, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_5, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_5, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_6, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_6, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_6, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_6, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_7, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_7, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_7, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_7, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_8, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_8, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_8, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_8, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_9, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_9, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_9, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_9, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_10, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_10, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_10, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_10, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_11, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_11, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_11, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_11, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_12, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_12, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_12, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_12, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_13, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_13, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_13, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_13, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_14, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_14, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_14, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_14, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_15, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_15, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_15, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_15, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_16, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_16, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_16, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_16, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_17, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_17, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_17, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_17, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_18, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_18, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_18, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_18, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_19, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_19, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_19, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_19, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_20, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_20, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_20, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_20, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_21, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_21, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_21, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_21, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_22, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_22, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_22, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_22, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_23, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_23, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_23, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_23, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_nro_24, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_forma_24, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_vcto_24, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_24, ';

     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_volume, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_frete, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_forma_pagamento, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_nro_pedido, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_cfop, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_icms, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_ordem_compra, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_ipi, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_icms_reduzida, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_tipo_nota, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_consumo, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_zerar_icms, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_total_nf_ipi, ';     
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_especie, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_marca, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_peso_bruto, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_peso_liquido, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_base_icms_sub, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_icms_sub, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_valor_seguro, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_outras_despesas, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_aliquota_icms, ';
     Comando_SQL := Comando_SQL + 'faturado_base_icms, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_nao_possui_duplicatas) ';

     Comando_SQL := Comando_SQL + 'Values(';
     Comando_SQL := Comando_SQL + Trim(Nota_Numero.Text) + ',';
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
     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Desconto) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Pedido) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Total) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Observacao_Nota.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Observacao.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Pgto_Frete.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Obtem_Depois_Traco(Natureza_Operacao.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Natureza_Operacao.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Obtem_Antes(Trim(Natureza_Operacao.Text),'_') + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Nota_Emissao.Text,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Estado.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + '0,';
     Comando_SQL := Comando_SQL + Trim(Representante) + ',';
     Comando_SQL := Comando_SQL + Trim(Banco) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_1) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_1.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_1.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_1.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_1) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_2) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_2.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_2.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_2.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_2) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_3) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_3.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_3.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_3.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_3) + ',';

     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_4) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_4.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_4.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_4.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_4) + ',';


     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_5) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_5) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_5.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_5.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_5.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_5) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_6) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_6) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_6.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_6.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_6.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_6) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_7) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_7) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_7.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_7.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_7.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_7) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_8) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_8) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_8.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_8.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_8.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_8) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_9) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_9) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_9.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_9.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_9.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_9) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_10) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_10) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_10.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_10.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_10.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_10) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_11) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_11) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_11.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_11.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_11.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_11) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_12) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_12) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_12.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_12.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_12.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_12) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_13) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_13) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_13.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_13.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_13.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_13) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_14) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_14) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_14.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_14.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_14.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_14) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_15) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_15) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_15.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_15.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_15.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_15) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_16) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_16) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_16.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_16.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_16.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_16) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_17) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_17) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_17.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_17.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_17.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_17) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_18) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_18) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_18.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_18.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_18.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_18) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_19) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_19) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_19.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_19.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_19.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_19) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_20) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_20) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_20.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_20.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_20.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_20) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_21) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_21) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_21.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_21.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_21.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_21) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_22) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_22) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_22.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_22.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_22.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_22) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_23) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_23) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_23.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_23.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_23.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_23) + ',';
     //*** INICIO - Parcela ***

     //*** INICIO - Parcela ***
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_24) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_24) + #39 + ',';

     If (Trim(Cliente_Condicao_Pgto_24.Text) = '/  /') Or (Trim(Cliente_Condicao_Pgto_24.Text) = '00/00/0000') Then
        Begin
        Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ',';
        End
     Else
        Begin
        Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_24.Text,'amd','/')) + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Str_Desd_24) + ',';
     //*** INICIO - Parcela ***

     Comando_SQL := Comando_SQL + Virgula_Ponto(Volume) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Frete) + ',';
     Comando_SQL := Comando_SQL + #39 + '' + #39 + ',';
     Comando_SQL := Comando_SQL + '0' + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_CFOP.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_ICMS) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Ordem_Compra.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Valor_IPI.Text) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Cliente_Base_Reduzida.Text) + ',';

     If(Tipo_Nota_Saida.Checked) Then
     Begin
         Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ',';
     End
     Else
     Begin
        Comando_SQL := Comando_SQL + #39 + 'E' + #39 + ',';
     End;

     If(Nota_Consumo.Checked) Then
     Begin
        Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ',';
     End
     Else
     Begin
        Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ',';
     End;

     If(Zera_Base_ICMS.Checked) Then
     Begin
        Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ',';
     End
     Else
     Begin
        Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ',';
     End;

     If(Total_NF_IPI.Checked) Then
     Begin
        Comando_SQL := Comando_SQL + #39 + 'S' + #39 + ',';
     End
     Else
     Begin
        Comando_SQL := Comando_SQL + #39 + 'N' + #39 + ',';
     End;

     Comando_SQL := Comando_SQL + #39 + Trim(Especie.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Marca.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Peso_Bruto.Text) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Peso_Liquido.Text) + ',';

     Comando_SQL := Comando_SQL + Virgula_Ponto(Nota_Base_ICMS_Sub.Text) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Nota_Valor_ICMS_Sub.Text) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Nota_Valor_Seguro.Text) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Nota_Outras_Despesas.Text) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Cliente_Aliquota_ICMS.Text) + ',';
     Comando_SQL := Comando_SQL + Virgula_Ponto(Nota_Base_ICMS.Text) + ',';

     If Opcao_Sem_Duplicata.Checked Then
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

     //*** Registra os Produtos da Nota ***

     For Ind := Posicao_Inicial To Posicao_Final Do
         Begin

         Valor_Inteiro := Trim(SGD_Produtos.Cells[1,Ind]);

         If Trim(Valor_Inteiro) = '0' Then
            Begin
            Valor_Inteiro := '1';
         End;

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

            Comando_SQL := 'Insert into fb_notas_fiscais_produtos(';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_numero,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_codigo,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_qtde,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_desc,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_vlr_uni,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_vlr_tot,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_lote, ';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_posicao, ';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_vlr_ipi, ';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_descricao_detalhada)';
            Comando_SQL := Comando_SQL + ' Values(';
            Comando_SQL := Comando_SQL + Trim(Nota_Numero.Text) + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + ',';
            Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[1,Ind])) + ',';
            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[4,Ind]) + #39 + ',';
            Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[6,Ind])) + ',';
            Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[7,Ind])) + ',';

            If Trim(SGD_Produtos.Cells[5,Ind]) = '' Then
               Begin
               Comando_SQL := Comando_SQL + '0,';
               End
            Else
               Begin
               Comando_SQL := Comando_SQL + Trim(SGD_Produtos.Cells[5,Ind]) + ',';
            End;

            Comando_SQL := Comando_SQL + Trim(SGD_Produtos.Cells[9,Ind]) + ',';

            If Trim(SGD_Produtos.Cells[8,Ind]) <> '' Then
               Begin
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind])) + ',';
               End
            Else
               Begin
               Comando_SQL := Comando_SQL + '0.00,';
            End;

            Comando_SQL := Comando_SQL + #39 + Trim(SGD_Produtos.Cells[13,Ind]) + #39 + ')';

            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            //*** Insere o Movimento de Estoque Para a Nota Relacionda ao Pedido ***

            Comando_SQL := 'Update fb_movto_estoque Set ';
            Comando_SQL := Comando_SQL + 'fb_movto_estoque_nota = ' + Trim(Nota_Numero.Text) + ',';

            If Trim(SGD_Produtos.Cells[5,Ind]) = '' Then
               Begin
               Comando_SQL := Comando_SQL + 'fb_movto_estoque_lote = 0';
               End
            Else
               Begin
               Comando_SQL := Comando_SQL + 'fb_movto_estoque_lote = ' + Trim(SGD_Produtos.Cells[5,Ind]);
            End;

            Comando_SQL := Comando_SQL + ' Where ';
            Comando_SQL := Comando_SQL + '((fb_movto_estoque_cod_registro = 51) And ';
            Comando_SQL := Comando_SQL + '(fb_movto_estoque_pedido = ' + '0' + ') And ';
            Comando_SQL := Comando_SQL + '(fb_movto_estoque_codigo = ' + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39 + '))';

            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            //*** Atualiza o Cadastro de Produtos ***

            If Trim(SGD_Produtos.Cells[10,Ind]) <> '' Then
               Begin
               Comando_SQL := 'Update fb_produtos Set ';
               Comando_SQL := Comando_SQL + 'fb_produto_classif_fiscal = ' + #39 + Trim(SGD_Produtos.Cells[10,Ind]) + #39 + ' ';

               If Trim(SGD_Produtos.Cells[12,Ind]) <> '' Then
                  Begin
                  Comando_SQL := Comando_SQL + ', fb_produto_unidade = ' + #39 + Trim(SGD_Produtos.Cells[12,Ind]) + #39 + ' ';
               End;

               If Trim(SGD_Produtos.Cells[11,Ind]) <> '' Then
                  Begin
                  Comando_SQL := Comando_SQL + ', fb_produto_classif_tributaria = ' + #39 + Trim(SGD_Produtos.Cells[11,Ind]) + #39 + ' ';
               End;
               
               Comando_SQL := Comando_SQL + ' Where fb_produto_codigo = ' + #39 + Trim(SGD_Produtos.Cells[2,Ind]) + #39;

               ConexaoBD.SQL_Comunitario.SQL.Clear;
               ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Comunitario.ExecSQL;
            End;

         End;
     End;

     //*** Registra o Histórico do Cliente ***

     Comando_SQL := 'Insert into fb_historicos(';
     Comando_SQL := Comando_SQL + 'fb_historico_codigo_cliente,';
     Comando_SQL := Comando_SQL + 'fb_historico_tipo_faturamento,';
     Comando_SQL := Comando_SQL + 'fb_historico_nro_nota,';
     Comando_SQL := Comando_SQL + 'fb_historico_data_emissao,';
     Comando_SQL := Comando_SQL + 'fb_historico_valor_desc,';
     Comando_SQL := Comando_SQL + 'fb_historico_valor_pedido,';
     Comando_SQL := Comando_SQL + 'fb_historico_valor_total,';
     Comando_SQL := Comando_SQL + 'fb_historico_porc_desc,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_nro_1,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_forma_1,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_dt_vcto_1,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_vlr_1,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_nro_2,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_forma_2,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_dt_vcto_2,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_vlr_2,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_nro_3,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_forma_3,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_dt_vcto_3,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_vlr_3,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_nro_4,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_forma_4,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_dt_vcto_4,';
     Comando_SQL := Comando_SQL + 'fb_historico_dup_vlr_4,';
     Comando_SQL := Comando_SQL + 'fb_historico_cfop,';
     Comando_SQL := Comando_SQL + 'fb_historico_icms)';
     Comando_SQL := Comando_SQL + ' Values(';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Codigo.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Tipo_Faturamento.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Nota_Numero.Text) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Nota_Emissao.Text,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Desconto) + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Pedido) + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Total) + ',';
     Comando_SQL := Comando_SQL + Trim(Desconto) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_1) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_1.Text,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_1) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_2) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_2.Text,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_2) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_3) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_3.Text,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_3) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Nro_Nota_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Forma_Desd_4) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Inverte_Data_Plus(Cliente_Condicao_Pgto_4.Text,'amd','/')) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_4) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_CFOP.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_ICMS) + ')';

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;
end;

procedure TRegistroNotasFiscaisSaidas01.BT_ExcluirClick(Sender: TObject);
begin
     If Confirma('Confirma a Exclusão desta Nota-Fiscal?') = 6 Then
        Begin
        Ampulheta();

        //*** Deleta a Nota Fiscal ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_notas_fiscais Where fb_nota_fiscal_numero = ' +  Trim(Nota_Numero.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Deleta os Itens do Pedido Principal ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_notas_fiscais_produtos Where fb_nota_fiscal_produto_numero = ' +  Trim(Nota_Numero.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        Seta();

        MSG_Erro('Exclusão Efetuada...');

        RegistroNotasFiscaisSaidas01.Close;
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL: String;
   
begin
     If Valida_Dados() Then
        Begin

        Ampulheta();

        //*** Informa o Nro de Linhas para a Nota Fiscal ***

        //*** Deleta a Nota Fiscal ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_notas_fiscais Where fb_nota_fiscal_numero = ' +  Trim(Nota_Numero.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Deleta os Itens da Nota Fiscal ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_notas_fiscais_produtos Where fb_nota_fiscal_produto_numero = ' +  Trim(Nota_Numero.Text));
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Deleta os Históricos da Nota Fiscal ***

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Delete from fb_historicos Where fb_historico_codigo_cliente = ' +#39+ Trim(Cliente_Codigo.Text) +#39+ ' And fb_historico_tipo_faturamento = ' +#39+ 'Nota Fiscal' +#39+ ' And fb_historico_nro_nota = ' + Trim(Nota_Numero.Text) );
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Imprime a Nota Fiscal ***

        If Imprime_Nota_Tela.Checked Then
           Begin
           Imprimir.ArqDestino := 'C:\Ibrasmak\NF_Tela.TXT';
           Imprimir.Acentuacao := acNenhum;

           Imprimir.Linhas := 66;
           Imprime_Nota();

           Application.CreateForm(TNotasFiscaisSaidas04,NotasFiscaisSaidas04);

           NotasFiscaisSaidas04.Descricao_LPT.Lines.LoadFromFile('C:\Ibrasmak\NF_Tela.TXT');

           NotasFiscaisSaidas04.QR_LPT.Preview;
           NotasFiscaisSaidas04.QR_LPT.Destroy;
           NotasFiscaisSaidas04.Destroy;
           End
        Else If Imprime_Nota_Apos.Checked Then
           Begin
           Imprimir.Linhas := 66;
           Imprime_Nota();
        End;

        Grava_Nota_Ibrasmak(1,(SGD_Produtos.RowCount - 1));

        Seta();

        If (Imprime_Nota_Apos.Checked = True) And (Trim(Tipo_Nota_Emissao.Text) = 'NFe') Then
           Begin
           //*** Registra o Número da Nota Fiscal Anterior ***

           Comando_SQL := 'Update fb_nf_anterior Set ';
           Comando_SQL := Comando_SQL + 'fb_nf_anterior_data = ' +#39+ Trim(Inverte_Data_Plus(Nota_Emissao.Text,'amd','/')) +#39+ ', ';
           Comando_SQL := Comando_SQL + 'fb_nf_anterior_numero = ' + Trim(Nota_Numero.Text);

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

           winExec(PChar('C:\Arquivos de Programas\Mozilla Firefox\firefox.exe http://192.168.0.1:8081/sistemas/ibrasmak_nfe/mgt_nfe_emissao.php?mgt_pedido_numero=' + Trim(Nota_Numero.Text)+'&vol='+Trim(Qtde_Volume.Text)+'&especie='+Trim(Especie.Text)+'&natureza='+Trim(Cliente_Natureza_Operacao.Text)+'&emissao_nfe=manual'+'&cst='+Trim(Classificacao_Tributaria)), sw_shownormal);
           //Internet Explorer *** winExec(PChar('C:\Arquivos de Programas\Internet Explorer\iexplore.exe http://servidor:8081/sistemas/ibrasmak_nfe/mgt_nfe_gera_xml.php?mgt_pedido_numero=' + Trim(Nota_Numero.Text)+'&vol='+Trim(Qtde_Volume.Text)+'&especie='+Trim(Especie.Text)+'&natureza='+Trim(Cliente_Natureza_Operacao.Text)+'&emissao_nfe=manual'), SW_MAXIMIZE);
           RegistroNotasFiscaisSaidas01.Close;
        End;

        If (Imprime_Nota_Apos.Checked = True) And (Trim(Tipo_Nota_Emissao.Text) = '') Then
           Begin
           RegistroNotasFiscaisSaidas01.Close;
        End;
     End;
end;

procedure TRegistroNotasFiscaisSaidas01.BT_Procurar_FornecedoresClick(
  Sender: TObject);
begin
    Ampulheta();
    Application.CreateForm(TFornecedor00,Fornecedor00);

    Fornecedor00.Programa_Anterior.Text := 'Registro-Notas-Inclusão';

    Seta();

    Fornecedor00.ShowModal;

    Edit_Tipo_Inclusao.Text := 'Fornecedor';
end;

procedure TRegistroNotasFiscaisSaidas01.Totaliza_Nota(Posicao_Inicial, Posicao_Final: Integer);

var
   Linha: Integer;
   Descricao, Observacao_1, Observacao_2, Observacao_3, Observacao_4: String;
   Codigo_CFOP, Codigo_CFOP_2, Endereco_Cobranca, Endereco_Entrega, Valor_Extenso, Comando_SQL: String;
   Base_ICMS_Reduzida, Base_ICMS_Substituicao, Aliquota_ICMS, Aliquota_ICMS_Reducao, Aliquota_ICMS_Substituicao, Vlr_Suframa: Real;
   Ind, Total_Produtos: Integer;

   Classificacao_Fiscal, Unidade_Produto, VLR_ICMS_Substituicao_Str, VLR_ICMS_Oper_Propria_Str: String;
   BC_ICMS_Reduzida, BC_ICMS_Normal, BC_ICMS_Normal_Sub, BC_ICMS_Substituicao, VLR_ICMS_Reduzida, VLR_ICMS_Normal, VLR_ICMS_Substituicao, BC_IPI_Normal, VLR_IPI_Normal: Real;
   Bonificacao, Peso, Total_Nro, Porcentagem_Nro, Frete_Nro, IPI_Nro: Real;
   Unidade: Real;
   Erro, Conta_produtos, Outros_Produtos: Integer;
   Maiuscula, Total_Str, Porcentagem_Str, Valor_Str, BC_ICMS_Str, Transportadora: String;

   Produto_Detalhada_1, Produto_Detalhada_2, Produto_Detalhada_3, Produto_Detalhada_4, Produto_Detalhada_5, Produto_Detalhada_6,
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

     //Base_ICMS_Reduzida := StrToFloat(Ponto_Virgula(Cliente_Base_Reduzida.Text));

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

            Classificacao_Fiscal     := SGD_Produtos.Cells[10,Ind];
            Classificacao_Tributaria := SGD_Produtos.Cells[11,Ind];

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
            VLR_IPI_Normal := VLR_IPI_Normal + ((StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind])) * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[8,Ind]))) / 100);

            Total_Str := Trim(Virgula_Ponto(SGD_Produtos.Cells[7,Ind]));
            Val(Total_Str,Total_Nro,Erro);

            Total_Nota     := Total_Nota + Total_Nro;
            Conta_Produtos := Conta_Produtos + 1;
         End;
     End; 

     If Total_NF_IPI.Checked Then
        Begin
        Total_Nota := Total_Nota + VLR_IPI_Normal;
     End;

     Conta_Produtos := Conta_Produtos - 1;
     Posicao_Final  := Conta_Produtos;

     Total_Desconto := (Total_Nota - ((Total_Nota * Porcentagem_Desconto) / 100));
     Vlr_Desconto   := ((Total_Nota * Porcentagem_Desconto) / 100);

     If Total_NF_IPI.Checked Then
        Begin
        Vlr_Total_Produtos := Total_Nota - VLR_IPI_Normal;
        End
     Else
        Begin
        Vlr_Total_Produtos := Total_Nota;
     End;

     Total_Desconto     := (Total_Desconto + Vlr_Frete);

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

     Linha := 1;
     Linha := Linha + 1;
     //*** Coloca o X na Nota Fiscal ***

     Linha := Linha + 5;

     //*** Prepara a Natureza de Operação ***

     Observacao_1 := '';

     If Trim(Codigo_CFOP_2) <> '' Then
        Begin

        If (Outros_Produtos = 0) And (Trim(Codigo_CFOP_2) <> '') Then
           Begin
           Codigo_CFOP := Codigo_CFOP_2;
        End;

     End;

     Linha := Linha + 3;
     Linha := Linha + 2;
     Linha := Linha + 2;
     Linha := Linha + 3;

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

     Linha := Linha + 1;

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

     Linha := Linha + 3;

     For Ind := Posicao_Inicial To Posicao_Final Do
         Begin

         If Trim(SGD_Produtos.Cells[1,Ind]) <> '' Then
            Begin

            //*** Busca Algumas Informações do Produto ***

            ConexaoBD.SQL_Produtos.Close;
            ConexaoBD.SQL_Produtos.SQL.Clear;
            ConexaoBD.SQL_Produtos.SQL.Add('Select * from fb_produtos Where fb_produto_codigo = ' +#39+ Trim(SGD_Produtos.Cells[2,Ind]) + #39);
            ConexaoBD.SQL_Produtos.Open;

            Classificacao_Fiscal     := SGD_Produtos.Cells[10,Ind];
            Classificacao_Tributaria := SGD_Produtos.Cells[11,Ind];

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

            If Aliquota_ICMS_Reducao > 0 Then
               Begin
               BC_ICMS_Reduzida := BC_ICMS_Reduzida + StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind]));
               End
            Else
               Begin
               BC_ICMS_Reduzida := 0;
            End;

            BC_ICMS_Normal   := BC_ICMS_Normal + StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind]));

            //Unidade_Produto := ConexaoBD.SQL_Produtosfb_produto_unidade.Text;
            Unidade_Produto := SGD_Produtos.Cells[12,Ind];

            If ConexaoBD.SQL_Produtosfb_produto_peso.AsVariant = Null Then
               Begin
               Peso:= Peso + (0 * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[1,Ind])));
               End
            Else
               Begin
               Peso := Peso + ((ConexaoBD.SQL_Produtosfb_produto_peso.AsVariant) * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[1,Ind])));
            End;

            Unidade                  := Unidade + StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[1,Ind]));

            Str(((StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind])) * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[8,Ind]))) / 100):13:2,Vlr_IPI_Str);
            VLR_IPI_Normal := VLR_IPI_Normal + ((StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind])) * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[8,Ind]))) / 100);

            Linha := Linha + 1;
            Conta_Produtos := Conta_Produtos + 1;

            If Trim(SGD_Produtos.Cells[13,Ind]) <> '' Then
               Begin

               If Produto_Detalhada_2 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_3 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_4 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_5 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_6 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_7 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_8 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_9 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_10 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_11 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_12 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_13 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_14 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_15 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_16 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_17 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

               If Produto_Detalhada_18 <> '' Then
                  Begin
                  Linha := Linha + 1;
                  Conta_Produtos := Conta_Produtos + 1;
               End;

            End;
         End;
     End;

     If Total_NF_IPI.Checked Then
        Begin
        BC_ICMS_Normal := BC_ICMS_Normal + VLR_IPI_Normal;
        End
     Else
        Begin
        BC_ICMS_Normal := BC_ICMS_Normal;
     End;

     BC_ICMS_Normal := (BC_ICMS_Normal - ((BC_ICMS_Normal * Base_ICMS_Reduzida) / 100));

     If Zera_Base_ICMS.Checked = True Then
        Begin
        BC_ICMS_Normal       := 0;
        BC_ICMS_Reduzida     := 0;
        BC_ICMS_Substituicao := 0;
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

     Linha := Linha + 1;
     Linha := Linha + 1;
     Linha := Linha + 1;

     Observacao_4 := '';

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

     //*** Finalizacao para Impressao do ICMS e IPI ***

     Linha := Linha + 2;

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
        End
     End;

     Linha := Linha + 3;
     Transportadora := Obtem_Depois_Traco(Cliente_Transportadora.Text);
     Codigo_Transportadora.Text := Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text);

     //*** Obtem dados da Transportadora ***

     ConexaoBD.SQL_Transportadoras.Close;
     ConexaoBD.SQL_Transportadoras.SQL.Clear;
     ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_numero = ' + Trim(Codigo_Transportadora.Text) + ' Order By fb_transportadora_nome');
     ConexaoBD.SQL_Transportadoras.Open;

     Linha := Linha + 2;
     Linha  := Linha + 2;
     Volume := Prepara_Volume(Posicao_Inicial, Posicao_Final);

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

     Linha := Linha + 1;
     Linha := Linha + 1;
     Linha := Linha + 1;

     Linha := Linha + 6;

     //*** Coloca os Valores nos Campos ***

     Cliente_Aliquota_ICMS.Text := Trim(FormatFloat('0.00',Aliquota_ICMS));
     Cliente_Base_Reduzida.Text := Trim(FormatFloat('0.00',Aliquota_ICMS_Reducao));

     Nota_Base_ICMS.Text        := Trim(FormatFloat('0.00',StrToFloat(Ponto_Virgula(BC_ICMS_Str))));
     Nota_Valor_ICMS.Text       := Trim(FormatFloat('0.00',StrToFloat(Ponto_Virgula(Vlr_ICMS_Str))));
     Nota_Base_ICMS_Sub.Text    := '0,00';
     Nota_Valor_ICMS_Sub.Text   := '0,00';
     Nota_Valor_Produto.Text    := Trim(FormatFloat('0.00',Vlr_Total_Produtos));

     Valor_Frete.Text           := Trim(FormatFloat('0.00',StrToFloat(Ponto_Virgula(Vlr_Frete_Str))));
     Nota_Valor_Seguro.Text     := '0,00';
     Nota_Outras_Despesas.Text  := '0,00';
     Valor_IPI.Text             := Trim(FormatFloat('0.00',StrToFloat(Ponto_Virgula(Vlr_IPI_Str))));
     Valor_Total.Text           := Trim(FormatFloat('0.00',StrToFloat(Ponto_Virgula(Vlr_Total_Produtos_Str))));

     Seta();
end;

procedure TRegistroNotasFiscaisSaidas01.BT_CalcularClick(Sender: TObject);
begin
     Totaliza_Nota(1,(SGD_Produtos.RowCount - 1));
end;

procedure TRegistroNotasFiscaisSaidas01.Opcao_Sem_DuplicataClick(
  Sender: TObject);
begin
     Cliente_Condicao_Pgto_1.Text := '';
     Cliente_Condicao_Pgto_2.Text := '';
     Cliente_Condicao_Pgto_3.Text := '';
     Cliente_Condicao_Pgto_4.Text := '';
     Cliente_Condicao_Pgto_5.Text := '';
     Cliente_Condicao_Pgto_6.Text := '';
     Cliente_Condicao_Pgto_7.Text := '';
     Cliente_Condicao_Pgto_8.Text := '';
     Cliente_Condicao_Pgto_9.Text := '';
     Cliente_Condicao_Pgto_10.Text := '';
     Cliente_Condicao_Pgto_11.Text := '';
     Cliente_Condicao_Pgto_12.Text := '';
     Cliente_Condicao_Pgto_13.Text := '';
     Cliente_Condicao_Pgto_14.Text := '';
     Cliente_Condicao_Pgto_15.Text := '';
     Cliente_Condicao_Pgto_16.Text := '';
     Cliente_Condicao_Pgto_17.Text := '';
     Cliente_Condicao_Pgto_18.Text := '';
     Cliente_Condicao_Pgto_19.Text := '';
     Cliente_Condicao_Pgto_20.Text := '';
     Cliente_Condicao_Pgto_21.Text := '';
     Cliente_Condicao_Pgto_22.Text := '';
     Cliente_Condicao_Pgto_23.Text := '';
     Cliente_Condicao_Pgto_24.Text := '';

     Cliente_Condicao_Pgto_Vlr_1.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_2.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_3.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_4.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_5.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_6.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_7.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_8.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_9.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_10.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_11.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_12.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_13.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_14.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_15.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_16.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_17.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_18.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_19.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_20.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_21.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_22.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_23.Text := '0,00';
     Cliente_Condicao_Pgto_Vlr_24.Text := '0,00';
end;

procedure TRegistroNotasFiscaisSaidas01.Imprime_Nota_AposClick(
  Sender: TObject);
begin
       If Tipo_Nota_Emissao.Text = 'NFe' Then
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

procedure TRegistroNotasFiscaisSaidas01.Imprime_Nota_TelaClick(
  Sender: TObject);
begin
       Imprimir.ArqDestino := 'C:\Ibrasmak\NF_Tela.TXT';
       Imprimir.Acentuacao := acNenhum;
end;

end.
