unit Historicos_Registro_Notas_Fiscais_Saidas_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Grids, ComCtrls, ImpMat;

type
  THistoricosRegistroNotasFiscaisSaidas01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Imprime_Nota_Apos: TCheckBox;
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
  HistoricosRegistroNotasFiscaisSaidas01: THistoricosRegistroNotasFiscaisSaidas01;

  Nro_Nota_Desd_1, Nro_Nota_Desd_2, Nro_Nota_Desd_3, Nro_Nota_Desd_4, Forma_Desd_1, Forma_Desd_2, Forma_Desd_3, Forma_Desd_4, Volume: String;
  Dt_Vcto_Desd_1, Dt_Vcto_Desd_2, Dt_Vcto_Desd_3, Dt_Vcto_Desd_4, Total_Nota_Str, Total_Desconto_Str, Total_Desconto_Str_Ant, Vlr_Total_Produtos_Str, Vlr_Frete_Str, Vlr_IPI_Str, Vlr_Desconto_Str, Porcentagem_Desconto_Str: String;
  Vlr_Desd_1, Vlr_Desd_2, Vlr_Desd_3, Vlr_Desd_4, Total_Nota, Total_Desconto, Vlr_Total_Produtos, Vlr_Frete, Vlr_IPI, Vlr_Desconto, Porcentagem_Desconto: Real;
  Vlr_Str_Desd_1, Vlr_Str_Desd_2, Vlr_Str_Desd_3, Vlr_Str_Desd_4, Vlr_Str_ICMS, Vlr_ICMS_Str: String;
  Nro_Nota: Integer;

  CX_1, CX_2, CX_3, CX_Peq, CX_48, CX_100, CX_Exp: Integer;

implementation

uses Conexao_BD, Rotinas_Gerais, Clientes_00, Ordem_02,
  Adiciona_Produto_Relacao, Codigo_Produto_Nota_Cliente_00,
  Adiciona_Qtde_Produto, Adiciona_Qtde_Produto_02,
  Registro_Notas_Fiscais_Saidas_00, Fornecedor_00,
  Registro_Notas_Fiscais_Saidas_01,
  Historicos_Registro_Notas_Fiscais_Saidas_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function THistoricosRegistroNotasFiscaisSaidas01.ConversaoRecursiva(N: LongWord): string;
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

function THistoricosRegistroNotasFiscaisSaidas01.Extenso(parmNumero: Real): string;
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

function THistoricosRegistroNotasFiscaisSaidas01.Letra_Maiuscula(Texto: String): string;

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

function THistoricosRegistroNotasFiscaisSaidas01.Prepara_Volume(Posicao_Inicial, Posicao_Final: Integer): string;

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

function THistoricosRegistroNotasFiscaisSaidas01.Valida_Dados(): Boolean;

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
           Cliente_Natureza_Operacao.SetFocus;
        End;
     End;

     Result := Resultado;
end;

//******************
//*** Procedures ***
//******************

procedure THistoricosRegistroNotasFiscaisSaidas01.Carrega_Transportadoras();
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

procedure THistoricosRegistroNotasFiscaisSaidas01.Carrega_Pgto_Frete();
begin
     Cliente_Pgto_Frete.Items.Clear;
     Cliente_Pgto_Frete.Items.Add('Cliente');
     Cliente_Pgto_Frete.Items.Add('Ibrasmak');

     Cliente_Pgto_Frete.ItemIndex := StrToInt(Nro_Pgto_Frete.Text);
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.BT_SairClick(Sender: TObject);
begin
     HistoricosRegistroNotasFiscaisSaidas01.Close;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();
     Application.CreateForm(TClientes00,Clientes00);

     Clientes00.Programa_Anterior.Text := 'Registro-Notas-Inclusão';

     Seta();

     Clientes00.ShowModal;

     Edit_Tipo_Inclusao.Text := 'Cliente';
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_NumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_EmissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_EntradaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_RecebimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_CFOPKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_NaturezaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Condicao_Pgto_1KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Condicao_Pgto_2KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Condicao_Pgto_3KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Condicao_Pgto_4KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Aliquota_ISSKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_ISSKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_ServicosKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Base_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Base_ICMS_SubKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_ICMS_SubKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_ProdutoKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Valor_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_SeguroKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Outras_DespesasKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Valor_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Valor_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Transportadora_CNPJKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Transportadora_NomeKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Pgto_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Qtde_VolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.EspecieKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.MarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Peso_BrutoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Peso_LiquidoKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_ObsKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Exibe_Grid_Produtos();

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

           SGD_Produtos.RowCount  := (ConexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount + 1);
           SGD_Produtos.FixedRows := 1;
           Ind := 0;

           ConexaoBD.SQL_FB_Nota_Fiscal_Produto.First;

           Peso := 0;

           While Not ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof Do
                 Begin
                 Ind := Ind + 1;

                 SGD_Produtos.Cells[1,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_qtde.Text;
                 SGD_Produtos.Cells[2,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text;
                 SGD_Produtos.Cells[4,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_desc.Text;
                 SGD_Produtos.Cells[5,Ind] := IntToStr(ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_lote.AsInteger);

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
                          SGD_Produtos.Cells[8,Ind]  := ConexaoBD.SQL_Produtosfb_produto_ipi.Text;
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

                       SGD_Produtos.Cells[8,Ind] := '0';
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

                    SGD_Produtos.Cells[8,Ind] := '0';
                    SGD_Produtos.Cells[9,Ind] := ConexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_posicao.Text;

                    SGD_Produtos.Cells[10,Ind] := '';
                    SGD_Produtos.Cells[11,Ind] := '';
                    SGD_Produtos.Cells[12,Ind] := '';
                 End;

                 ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
           End;

           Str((Peso + ((Peso * 1.5) / 100)):13:3,Peso_Str);
           Peso_Bruto.Text := Trim(Peso_Str);

           Str(Peso:13:3,Peso_Str);
           Peso_liquido.Text := Trim(Peso_Str);

           End
        Else
           Begin
           SGD_Produtos.RowCount  := 2;
           SGD_Produtos.FixedRows := 1;
        End;

        Totaliza_Pedido();

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

     Seta();
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.FormShow(Sender: TObject);
begin
     If Trim(Programa_Anterior.Text) = '' Then
        Begin
        Nota_Emissao.Text := DateToStr(Date());
     End;

     Exibe_Grid_Produtos();
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Base_ICMSExit(Sender: TObject);
begin
     If Trim(Nota_Base_ICMS.Text) = '' Then
        Begin
        Nota_Base_ICMS.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_ICMSExit(Sender: TObject);
begin
     If Trim(Nota_Valor_ICMS.Text) = '' Then
        Begin
        Nota_Valor_ICMS.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Base_ICMS_SubExit(Sender: TObject);
begin
     If Trim(Nota_Base_ICMS_Sub.Text) = '' Then
        Begin
        Nota_Base_ICMS_Sub.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_ICMS_SubExit(Sender: TObject);
begin
     If Trim(Nota_Valor_ICMS_Sub.Text) = '' Then
        Begin
        Nota_Valor_ICMS_Sub.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_ProdutoExit(Sender: TObject);
begin
     If Trim(Nota_Valor_Produto.Text) = '' Then
        Begin
        Nota_Valor_Produto.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Valor_FreteExit(Sender: TObject);
begin
     If Trim(Valor_Frete.Text) = '' Then
        Begin
        Valor_Frete.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Valor_SeguroExit(Sender: TObject);
begin
     If Trim(Nota_Valor_Seguro.Text) = '' Then
        Begin
        Nota_Valor_Seguro.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Nota_Outras_DespesasExit(
  Sender: TObject);
begin
     If Trim(Nota_Outras_Despesas.Text) = '' Then
        Begin
        Nota_Outras_Despesas.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Valor_IPIExit(Sender: TObject);
begin
     If Trim(Valor_IPI.Text) = '' Then
        Begin
        Valor_IPI.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Valor_TotalExit(Sender: TObject);
begin
     If Trim(Valor_Total.Text) = '' Then
        Begin
        Valor_Total.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Qtde_VolumeExit(Sender: TObject);
begin
     If Trim(Qtde_Volume.Text) = '' Then
        Begin
        Qtde_Volume.Text := '0';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Peso_BrutoExit(Sender: TObject);
begin
     If Trim(Peso_Bruto.Text) = '' Then
        Begin
        Peso_Bruto.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Peso_LiquidoExit(Sender: TObject);
begin
     If Trim(Peso_Liquido.Text) = '' Then
        Begin
        Peso_Liquido.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.BT_AdicionarClick(Sender: TObject);
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

        Totaliza_Pedido();
        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Cliente');
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.SGD_ProdutosDblClick(Sender: TObject);
begin
        Application.CreateForm(TAdicionaQtdeProduto,AdicionaQtdeProduto);

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

        Totaliza_Pedido();
        SGD_Produtos.Refresh;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.BT_IncluirClick(Sender: TObject);

var
   Comando_SQL, Posicao_Nota, Nro_Conta, Busca_Duplicata: String;
   Ind, Parcela_INI, Parcela_FIM: Integer;

begin
     If Valida_Dados() Then
        Begin

        Ampulheta();

        //*** Informa o Nro de Linhas para a Nota Fiscal ***

        If Imprime_Nota_Apos.Checked Then
           Begin
           Imprimir.Linhas := 72;
           Imprime_Nota();
        End;

        Grava_Nota_Ibrasmak(1,(SGD_Produtos.RowCount - 1));

        Seta();

        RegistroNotasFiscaisSaidas01.Close;
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //*** Prepara a Busca de Retorno das Notas-Fiscais ***

     Ampulheta();

     ConexaoBD.SQL_FB_Nota_Fiscal.Close;
     ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;

     If Trim(HistoricosRegistroNotasFiscaisSaidas00.Numero_Nota.Text) <> '' Then
        Begin
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Trim(HistoricosRegistroNotasFiscaisSaidas00.Numero_Nota.Text) + ' Order By fb_nota_fiscal_data_emissao Desc, fb_nota_fiscal_numero Desc');
        End
     Else
        Begin
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where (fb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(HistoricosRegistroNotasFiscaisSaidas00.Data_Inicial.Text),'amd','/')+#39+' and fb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(HistoricosRegistroNotasFiscaisSaidas00.Data_Final.Text),'amd','/')+#39+') Order By fb_nota_fiscal_data_emissao Desc, fb_nota_fiscal_numero Desc');
     End;

     ConexaoBD.SQL_FB_Nota_Fiscal.Open;

     HistoricosRegistroNotasFiscaisSaidas00.Total_Pedidos_Ibrasmak.Caption := IntToStr(ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount);

     If Trim(Programa_Anterior.Text) = 'Alteração-Exclusão' Then
        Begin
        ConexaoBD.SQL_FB_Nota_Fiscal.Locate('fb_nota_fiscal_numero',Trim(Selecionado),[]);
     End;   

     Seta();

     //*** Fecha o Programa ***

     Action := caFree;
     Release;
     HistoricosRegistroNotasFiscaisSaidas01 := Nil;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_DescontoExit(
  Sender: TObject);
begin
     If Trim(Cliente_Desconto.Text) = '' Then
        Begin
        Cliente_Desconto.Text := '0';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_DescontoKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_1KeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_2KeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_3KeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_4KeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Natureza_OperacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Natureza_OperacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Tipo_Nota_SaidaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Tipo_Nota_EntradaKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Tipo_TransporteKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Pgto_FreteKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_TransportadoraKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Emite_LoteKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Aliquota_ICMSKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Aliquota_ICMSExit(
  Sender: TObject);
begin
     If Trim(Cliente_Aliquota_ICMS.Text) = '' Then
        Begin
        Cliente_Aliquota_ICMS.Text := '0';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Base_ReduzidaExit(
  Sender: TObject);
begin
     If Trim(Cliente_Base_Reduzida.Text) = '' Then
        Begin
        Cliente_Base_Reduzida.Text := '0';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Base_ReduzidaKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Ordem_CompraKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Natureza_OperacaoChange(
  Sender: TObject);
begin
     Cliente_Natureza_Operacao.Text := Natureza_Operacao.Text;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.SGD_ProdutosKeyPress(
  Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
      If Trim(Cliente_Codigo.Text) <> '' Then
        Begin

        If (Trim(SGD_Produtos.Cells[1, SGD_Produtos.Row]) <> '') And (Trim(SGD_Produtos.Cells[1, SGD_Produtos.Row]) <> '0') Then
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
  End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Totaliza_Pedido();

var
   Ind, Erro: Integer;
   Qtde_Nro, Vlr_Unitario_Nro, Vlr_Total_Nro, Porc_Desconto_Nro, Vlr_Frete_Nro, Vlr_Desconto_Nro, Vlr_Pedido_Nro, Vlr_Geral_Nro, Vlr_IPI_Nro, Vlr_Total_IPI_Nro: Real;
   Qtde_Str, Vlr_Unitario_Str, Vlr_Total_Str, Porc_Desconto_Str, Vlr_Frete_Str, Vlr_Desconto_Str, Vlr_Pedido_Str, Vlr_Geral_Str, Vlr_IPI_Str, Vlr_Total_IPI_Str, Vlr_Str: String;

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
     Valor_IPI.Text := Vlr_Total_IPI_Str;

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

     Vlr_Geral_Nro := (Vlr_Geral_Nro + Vlr_Frete_Nro + Vlr_Total_IPI_Nro);

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

     Seta();
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Prepara_Condicao();

var
   Calcula_Condicao: Real;

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

     If (((Trim(Cliente_Condicao_pgto_1.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_1.Text) <> '00/00/0000')) And ((Trim(Cliente_Condicao_pgto_2.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_2.Text) <> '00/00/0000')) And ((Trim(Cliente_Condicao_pgto_3.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_3.Text) <> '00/00/0000')) And ((Trim(Cliente_Condicao_pgto_4.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_4.Text) <> '00/00/0000'))) Then
        Begin
        Nro_Nota_Desd_1 := Trim(Nota_Numero.Text) + 'A';
        Nro_Nota_Desd_2 := Trim(Nota_Numero.Text) + 'B';
        Nro_Nota_Desd_3 := Trim(Nota_Numero.Text) + 'C';
        Nro_Nota_Desd_4 := Trim(Nota_Numero.Text) + 'D';

        Dt_Vcto_Desd_1  := Trim(Cliente_Condicao_pgto_1.Text);
        Dt_Vcto_Desd_2  := Trim(Cliente_Condicao_pgto_2.Text);
        Dt_Vcto_Desd_3  := Trim(Cliente_Condicao_pgto_3.Text);
        Dt_Vcto_Desd_4  := Trim(Cliente_Condicao_pgto_4.Text);

        Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text));
        Vlr_Desd_1       := (Calcula_Condicao / 4);
        Vlr_Desd_2       := Vlr_Desd_1;
        Vlr_Desd_3       := Vlr_Desd_2;
        Vlr_Desd_4       := (Calcula_Condicao - Vlr_Desd_1 - Vlr_Desd_2 - Vlr_Desd_3);

        Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
        Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
        Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
        Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);

        Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
        Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
        Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
        Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);

        Forma_Desd_1     := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
        Forma_Desd_2     := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
        Forma_Desd_3     := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
        Forma_Desd_4     := Subtrai_Data(Cliente_Condicao_pgto_4.Text,Nota_Emissao.Text);
        End
     Else If (((Trim(Cliente_Condicao_pgto_1.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_1.Text) <> '00/00/0000')) And ((Trim(Cliente_Condicao_pgto_2.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_2.Text) <> '00/00/0000')) And ((Trim(Cliente_Condicao_pgto_3.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_3.Text) <> '00/00/0000'))) Then
        Begin
        Nro_Nota_Desd_1 := Trim(Nota_Numero.Text) + 'A';
        Nro_Nota_Desd_2 := Trim(Nota_Numero.Text) + 'B';
        Nro_Nota_Desd_3 := Trim(Nota_Numero.Text) + 'C';
        Nro_Nota_Desd_4 := '';

        Dt_Vcto_Desd_1  := Trim(Cliente_Condicao_pgto_1.Text);
        Dt_Vcto_Desd_2  := Trim(Cliente_Condicao_pgto_2.Text);
        Dt_Vcto_Desd_3  := Trim(Cliente_Condicao_pgto_3.Text);
        Dt_Vcto_Desd_4  := '';

        Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text));
        Vlr_Desd_1       := (Calcula_Condicao / 3);
        Vlr_Desd_2       := Vlr_Desd_1;
        Vlr_Desd_3       := (Calcula_Condicao - Vlr_Desd_1 - Vlr_Desd_2);
        Vlr_Desd_4       := 0;

        Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
        Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
        Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
        Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);

        Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
        Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
        Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
        Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);

        Forma_Desd_1     := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
        Forma_Desd_2     := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
        Forma_Desd_3     := Subtrai_Data(Cliente_Condicao_pgto_3.Text,Nota_Emissao.Text);
        Forma_Desd_4     := '0';
        End
     Else If (((Trim(Cliente_Condicao_pgto_1.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_1.Text) <> '00/00/0000')) And ((Trim(Cliente_Condicao_pgto_2.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_2.Text) <> '00/00/0000'))) Then
        Begin
        Nro_Nota_Desd_1 := Trim(Nota_Numero.Text) + 'A';
        Nro_Nota_Desd_2 := Trim(Nota_Numero.Text) + 'B';
        Nro_Nota_Desd_3 := '';
        Nro_Nota_Desd_4 := '';

        Dt_Vcto_Desd_1  := Trim(Cliente_Condicao_pgto_1.Text);
        Dt_Vcto_Desd_2  := Trim(Cliente_Condicao_pgto_2.Text);
        Dt_Vcto_Desd_3  := '';
        Dt_Vcto_Desd_4  := '';

        Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text));
        Vlr_Desd_1       := (Calcula_Condicao / 2);
        Vlr_Desd_2       := (Calcula_Condicao - Vlr_Desd_1);
        Vlr_Desd_3       := 0;
        Vlr_Desd_4       := 0;

        Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
        Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
        Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
        Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);

        Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
        Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
        Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
        Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);

        Forma_Desd_1     := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
        Forma_Desd_2     := Subtrai_Data(Cliente_Condicao_pgto_2.Text,Nota_Emissao.Text);
        Forma_Desd_3     := '0';
        Forma_Desd_4     := '0';
        End
     Else If ((Trim(Cliente_Condicao_pgto_1.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_1.Text) <> '00/00/0000')) Then
        Begin
        Nro_Nota_Desd_1 := Trim(Nota_Numero.Text);
        Nro_Nota_Desd_2 := '';
        Nro_Nota_Desd_3 := '';
        Nro_Nota_Desd_4 := '';

        Dt_Vcto_Desd_1  := Trim(Cliente_Condicao_pgto_1.Text);
        Dt_Vcto_Desd_2  := '';
        Dt_Vcto_Desd_3  := '';
        Dt_Vcto_Desd_4  := '';

        Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text));
        Vlr_Desd_1       := Calcula_Condicao;
        Vlr_Desd_2       := 0;
        Vlr_Desd_3       := 0;
        Vlr_Desd_4       := 0;

        Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
        Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
        Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
        Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);

        Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
        Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
        Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
        Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);

        Forma_Desd_1     := Subtrai_Data(Cliente_Condicao_pgto_1.Text,Nota_Emissao.Text);
        Forma_Desd_2     := '0';
        Forma_Desd_3     := '0';
        Forma_Desd_4     := '0';
        End
     Else If ((Trim(Cliente_Condicao_pgto_1.Text) = '/  /') Or (Trim(Cliente_Condicao_pgto_1.Text) = '00/00/0000')) Then
        Begin
        Nro_Nota_Desd_1 := Trim(Nota_Numero.Text);
        Nro_Nota_Desd_2 := '';
        Nro_Nota_Desd_3 := '';
        Nro_Nota_Desd_4 := '';

        Cliente_Condicao_pgto_1.Text := Trim(Nota_Emissao.Text);
        Dt_Vcto_Desd_1  := DateToStr(StrToDate(Trim(Nota_Emissao.Text)));
        Dt_Vcto_Desd_2  := '';
        Dt_Vcto_Desd_3  := '';
        Dt_Vcto_Desd_4  := '';

        Calcula_Condicao := StrToFloat(Ponto_Virgula(Valor_Total.Text));
        Vlr_Desd_1       := Calcula_Condicao;
        Vlr_Desd_2       := 0;
        Vlr_Desd_3       := 0;
        Vlr_Desd_4       := 0;

        Str(Vlr_Desd_1:13:2,Vlr_Str_Desd_1);
        Str(Vlr_Desd_2:13:2,Vlr_Str_Desd_2);
        Str(Vlr_Desd_3:13:2,Vlr_Str_Desd_3);
        Str(Vlr_Desd_4:13:2,Vlr_Str_Desd_4);

        Cliente_Condicao_Pgto_Vlr_1.Text := Trim(Vlr_Str_Desd_1);
        Cliente_Condicao_Pgto_Vlr_2.Text := Trim(Vlr_Str_Desd_2);
        Cliente_Condicao_Pgto_Vlr_3.Text := Trim(Vlr_Str_Desd_3);
        Cliente_Condicao_Pgto_Vlr_4.Text := Trim(Vlr_Str_Desd_4);

        Forma_Desd_1     := 'À VISTA';
        Forma_Desd_2     := '';
        Forma_Desd_3     := '';
        Forma_Desd_4     := '';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_1KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_2KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_3KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_4KeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_1Exit(
  Sender: TObject);
begin
     If Trim(Cliente_Condicao_Pgto_Vlr_1.Text) = '' Then
        Begin
        Cliente_Condicao_Pgto_Vlr_1.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_2Exit(
  Sender: TObject);
begin
     If Trim(Cliente_Condicao_Pgto_Vlr_2.Text) = '' Then
        Begin
        Cliente_Condicao_Pgto_Vlr_2.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_3Exit(
  Sender: TObject);
begin
     If Trim(Cliente_Condicao_Pgto_Vlr_3.Text) = '' Then
        Begin
        Cliente_Condicao_Pgto_Vlr_3.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_4Exit(
  Sender: TObject);
begin
     If Trim(Cliente_Condicao_Pgto_Vlr_4.Text) = '' Then
        Begin
        Cliente_Condicao_Pgto_Vlr_4.Text := '0,00';
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.BT_Adicionar_ForaClick(
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

        Totaliza_Pedido();
        End
     Else
        Begin
        MSG_Erro('Selecione Primeiramente o Cliente');
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Imprime_Nota();

var
   Impressora: TextFile;
   Ind_Produto, Conta_Produto, Posicao_Inicial, Posicao_Final, Conta_Boleto, Nro_Nota_Boleto_INI, Nro_Nota_Boleto_FIM, Posicao_Nota_Boleto: Integer;
   Boleto_Obs, Boleto_Docto_1, Boleto_Docto_2, Boleto_Docto_3, Boleto_Docto_4, Comando_SQL: String;
   Vlr_Nota_Boleto_1, Vlr_Nota_Boleto_2, Vlr_Nota_Boleto_3, Vlr_Nota_Boleto_4: Real;

begin
     //*** Posiciona a Nota Fiscal ***

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

               Vlr_Nota_Boleto_1 := Vlr_Nota_Boleto_1 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.AsFloat;
               Vlr_Nota_Boleto_2 := Vlr_Nota_Boleto_2 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.AsFloat;
               Vlr_Nota_Boleto_3 := Vlr_Nota_Boleto_3 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.AsFloat;
               Vlr_Nota_Boleto_4 := Vlr_Nota_Boleto_4 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.AsFloat;

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

procedure THistoricosRegistroNotasFiscaisSaidas01.Imprime_Nota_Ibrasmak(Posicao_Inicial, Posicao_Final: Integer);

var
   Linha: Integer;
   Descricao, Observacao_1, Observacao_2, Observacao_3, Observacao_4: String;
   Codigo_CFOP, Endereco_Cobranca, Endereco_Entrega, Valor_Extenso, Comando_SQL: String;
   Base_ICMS_Reduzida, Aliquota_ICMS, Vlr_Suframa: Real;
   Ind, Total_Produtos: Integer;

   Classificacao_Fiscal, Classificacao_Tributaria, Unidade_Produto: String;
   BC_ICMS_Reduzida, BC_ICMS_Normal, VLR_ICMS_Reduzida, VLR_ICMS_Normal, BC_IPI_Normal, VLR_IPI_Normal: Real;
   Bonificacao, Peso, Total_Nro, Porcentagem_Nro, Frete_Nro, IPI_Nro: Real;
   Unidade: Real;
   Erro, Conta_produtos: Integer;
   Maiuscula, Total_Str, Porcentagem_Str, Valor_Str, BC_ICMS_Str, Transportadora: String;

begin
     Ampulheta();

     //*** Prepara o Cálculo dos Valores ***

     Comando_SQL := 'Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39;

     ConexaoBD.SQL_Clientes.Close;
     ConexaoBD.SQL_Clientes.SQL.Clear;
     ConexaoBD.SQL_Clientes.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Clientes.Open;

     Total_Nota           := 0;
     Total_Desconto       := 0;
     Vlr_Total_Produtos   := 0;
     Vlr_Suframa          := 0;
     Vlr_Desconto         := 0;
     Vlr_Frete            := 0;
     Porcentagem_Desconto := 0;
     Conta_Produtos       := 0;

     BC_ICMS_Reduzida  := 0;
     BC_ICMS_Normal    := 0;
     BC_IPI_Normal     := 0;

     VLR_ICMS_Reduzida := 0;
     VLR_ICMS_Normal   := 0;
     VLR_IPI_Normal    := 0;

     Codigo_CFOP   := Cliente_CFOP.Text;

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
         If Trim(SGD_Produtos.Cells[1,Ind]) <> '' Then
            Begin
            Conta_Produtos := Conta_Produtos + 1;
         End;
     End;

     Total_Nota      := StrToFloat(Ponto_Virgula(Valor_Total.Text));

     Conta_Produtos := Conta_Produtos - 1;
     Posicao_Final  := Conta_Produtos;

     Total_Desconto := (Total_Nota - ((Total_Nota * Porcentagem_Desconto) / 100));
     Vlr_Desconto   := ((Total_Nota * Porcentagem_Desconto) / 100);

     Vlr_Total_Produtos := StrToFloat(Ponto_Virgula(Nota_Valor_Produto.Text));
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

     Imprimir.Linhas := 72;

     Linha := 1;
     Imprimir.PoeStr(Linha,001, #18+'.');

     Linha := Linha + 1;
     //*** Coloca o X na Nota Fiscal ***

     If Tipo_Nota_Saida.Checked Then
        Begin
        Imprimir.PoeStr(Linha,083, 'X');
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,091, 'X');
     End;

     Linha := Linha + 4;
     Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Cliente_Natureza_Operacao.Text));

     //*** Prepara a Natureza de Operação ***

     Observacao_1 := '';
     Imprimir.PoeStr(Linha,052, Codigo_CFOP);

     Linha := Linha + 3;
     Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Cliente_Nome.Text));
     Imprimir.PoeStr(Linha,078, Trim(Cliente_Codigo.Text));
     Imprimir.PoeStr(Linha,101, Trim(Nota_Emissao.Text));

     Linha := Linha + 2;
     If Trim(Cliente_Complemento.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Trim(Cliente_Endereco.Text) + ' - ' + Trim(Cliente_Complemento.Text)));
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Cliente_Endereco.Text));
     End;

     Imprimir.PoeStr(Linha,069, Letra_Maiuscula(Cliente_Bairro.Text));

     If Trim(Cliente_Cep.Text) <> '00000-000' Then
        Begin
        Imprimir.PoeStr(Linha,089, Trim(Cliente_Cep.Text));
     End;

     Linha := Linha + 2;
     Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Cliente_Cidade.Text));

     If Trim(Cliente_Fone_Comercial.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,062, Trim(Cliente_Fone_Comercial.Text));
        End
     Else If Trim(Cliente_Fone_Residencial.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,062, Trim(Cliente_Fone_Residencial.Text));
        End
     Else If Trim(Cliente_Fone_Celular.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,062, Trim(Cliente_Fone_Celular.Text));
        End
     Else If Trim(Cliente_Fone_Fax.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,062, Trim(Cliente_Fone_Fax.Text));
     End;

     Imprimir.PoeStr(Linha,079, Letra_Maiuscula(Cliente_Estado.Text));
     Imprimir.PoeStr(Linha,082, Trim(Cliente_Inscricao_Estadual.Text));

     Linha := Linha + 3;

     Total_Desconto_Str_Ant := Total_Desconto_Str;

     If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        Str((Total_Nota - ((Total_Nota * 7) / 100)):13:2,Total_Desconto_Str);
     End;

     If StrToFloat(Ponto_Virgula(Trim(Total_Desconto_Str))) < 1 Then
        Begin
        Valor_Extenso := '';
        End
     Else
        Begin
        Valor_Extenso := Extenso(StrToFloat(Ponto_Virgula(Trim(Total_Desconto_Str))));
     End;

     Total_Desconto_Str := Total_Desconto_Str_Ant;

     Imprimir.PoeStr(Linha,003, Trim(Nota_Numero.Text));

     If Trim(Natureza_Operacao.Text) = 'Vendas' Then
        Begin
        If (Trim(Cliente_Condicao_pgto_1.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_1.Text) <> '00/00/0000') Then
           Begin
           Imprimir.PoeStr(Linha,030, Trim(Cliente_Condicao_pgto_1.Text));
           Imprimir.PoeStr(Linha,044, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_1.Text,10));
           End
        Else
           Begin
           Imprimir.PoeStr(Linha,030, 'À VISTA');
           Imprimir.PoeStr(Linha,044, Exibe_Nro_Impressao(Trim(Total_Desconto_Str),10));
        End;

        If (Trim(Cliente_Condicao_pgto_2.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_2.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,058, Trim(Cliente_Condicao_pgto_2.Text));
           Imprimir.PoeStr(Linha,074, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_2.Text,10));
        End;

        If (Trim(Cliente_Condicao_pgto_3.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_3.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,087, Trim(Cliente_Condicao_pgto_3.Text));
           Imprimir.PoeStr(Linha,100, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_3.Text,10));
        End;
     End;

     Linha := Linha + 1;

     If Trim(Natureza_Operacao.Text) = 'Vendas' Then
        Begin
        If (Trim(Cliente_Condicao_pgto_4.Text) <> '/  /') And (Trim(Cliente_Condicao_pgto_4.Text) <> '00/00/0000')  Then
           Begin
           Imprimir.PoeStr(Linha,087, Trim(Cliente_Condicao_pgto_4.Text));
           Imprimir.PoeStr(Linha,100, Exibe_Nro_Impressao(Cliente_Condicao_Pgto_Vlr_4.Text,10));
        End;
     End;

     Linha := Linha + 1;
     Endereco_Cobranca := UpperCase(Trim(Cliente_Endereco_Cobranca.Text));

     If Trim(Cliente_Complemento_Cobranca.Text) <> '' Then
        Begin
        Endereco_Cobranca := Endereco_Cobranca + ' - ' + UpperCase(Trim(Cliente_Complemento_Cobranca.Text));
     End;

     Endereco_Cobranca := Endereco_Cobranca + ' - ' + UpperCase(Trim(Cliente_Bairro_Cobranca.Text));
     Endereco_Cobranca := Endereco_Cobranca + ' - ' + UpperCase(Trim(Cliente_Cidade_Cobranca.Text));
     Endereco_Cobranca := Endereco_Cobranca + ' - ' + UpperCase(Trim(Cliente_Estado_Cobranca.Text));
     Endereco_Cobranca := Endereco_Cobranca + ' - CEP:' + Trim(Cliente_Cep_Cobranca.Text);
     Endereco_Cobranca := Endereco_Cobranca + ' - ' + UpperCase(Trim(Cliente_Pais_Cobranca.Text));
     Endereco_Cobranca := Copy(Endereco_Cobranca,1,85);

     Imprimir.PoeStr(Linha,003, Letra_Maiuscula(Endereco_Cobranca));

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,001, #15 + '.');

     BC_ICMS_Reduzida  := 0;
     BC_ICMS_Normal    := 0;
     BC_IPI_Normal     := 0;

     VLR_ICMS_Reduzida := 0;
     VLR_ICMS_Normal   := 0;
     VLR_IPI_Normal    := 0;

     Conta_Produtos    := 0;

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,147, 'XXX');

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,141, #15 + 'p/ cento');

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

            If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
               Begin
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

               Unidade_Produto          := ConexaoBD.SQL_Produtosfb_produto_unidade.Text;
               Peso                     := Peso + ((ConexaoBD.SQL_Produtosfb_produto_peso.AsVariant) * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[1,Ind])));
               Unidade                  := Unidade + StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[1,Ind]));
               End
            Else
               Begin
               Classificacao_Fiscal     := Trim(SGD_Produtos.Cells[10,Ind]);
               Classificacao_Tributaria := Trim(SGD_Produtos.Cells[11,Ind]);
               Unidade_Produto          := Trim(SGD_Produtos.Cells[12,Ind]);
               Peso                     := Peso + 0;
               Unidade                  := Unidade + 0;
            End;

            Imprimir.PoeStr(Linha,005, #15 + Letra_Maiuscula(Copy(Trim(SGD_Produtos.Cells[2,Ind]),1,14)) );

            If Trim(SGD_Produtos.Cells[0,Ind]) <> '' Then
               Begin
               Imprimir.PoeStr(Linha,022, Trim(SGD_Produtos.Cells[3,Ind]) + ' ' + Letra_Maiuscula(Copy(Trim(SGD_Produtos.Cells[4,Ind]),1,89)) + ' ' + Letra_Maiuscula(Trim(SGD_Produtos.Cells[0,Ind])) );
               End
            Else
               Begin
               Imprimir.PoeStr(Linha,022, Trim(SGD_Produtos.Cells[3,Ind]) + ' ' + Letra_Maiuscula(Copy(Trim(SGD_Produtos.Cells[4,Ind]),1,89)) );
            End;

            Imprimir.PoeStr(Linha,115, Trim(Classificacao_Fiscal));

            If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
               Begin
               Imprimir.PoeStr(Linha,118, '040');
               End
            Else
               Begin
               Imprimir.PoeStr(Linha,118, Trim(Classificacao_Tributaria));
            End;

            Imprimir.PoeStr(Linha,123, Trim(Unidade_Produto));
            Imprimir.PoeStr(Linha,129, Exibe_Nro_Impressao(Trim(SGD_Produtos.Cells[1,Ind]),6));
            Imprimir.PoeStr(Linha,143, Exibe_Nro_Impressao(Trim(SGD_Produtos.Cells[6,Ind]),8));
            Imprimir.PoeStr(Linha,155, Exibe_Nro_Impressao(Trim(SGD_Produtos.Cells[7,Ind]),13));
            Imprimir.PoeStr(Linha,170, Trim(FloatToStr(Aliquota_ICMS)) + '%');
            Imprimir.PoeStr(Linha,176, Letra_Maiuscula(Copy(Trim(SGD_Produtos.Cells[8,Ind]),1, (Length(Trim(SGD_Produtos.Cells[8,Ind])) - 4))) + '%');

            Str(((StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind])) * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[8,Ind]))) / 100):13:2,Vlr_IPI_Str);
            Imprimir.PoeStr(Linha,181, Exibe_Nro_Impressao(Trim(Vlr_IPI_Str),10));

            BC_ICMS_Normal := BC_ICMS_Normal + StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind]));
            VLR_IPI_Normal := VLR_IPI_Normal + ((StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[7,Ind])) * StrToFloat(Ponto_Virgula(SGD_Produtos.Cells[8,Ind]))) / 100);

            Linha          := Linha + 1;
            Conta_Produtos := Conta_Produtos + 1;
         End;
     End;

     BC_ICMS_Normal := StrToFloat(Ponto_Virgula(Nota_Base_ICMS.Text));

     If Zera_Base_ICMS.Checked = True Then
        Begin
        BC_ICMS_Normal   := 0;
        BC_ICMS_Reduzida := 0;
     End;

     If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        Imprimir.PoeStr(Linha,155, '-------------');

        Linha := Linha + 1;
        Conta_Produtos := Conta_Produtos + 1;

        Imprimir.PoeStr(Linha,040, 'DESCONTO DE 7%');

        Str(BC_ICMS_Normal:13:2,BC_ICMS_Str);
        Imprimir.PoeStr(Linha,155, Exibe_Nro_Impressao(Trim(BC_ICMS_Str),13));

        Linha := Linha + 1;
        Conta_Produtos := Conta_Produtos + 1;

        Str(((BC_ICMS_Normal * 7) / 100):13:2,BC_ICMS_Str);
        Imprimir.PoeStr(Linha,155, Exibe_Nro_Impressao(Trim(BC_ICMS_Str),13));

        Linha := Linha + 1;
        Conta_Produtos := Conta_Produtos + 1;

        Str((BC_ICMS_Normal - ((BC_ICMS_Normal * 7) / 100)):13:2,BC_ICMS_Str);
        Imprimir.PoeStr(Linha,155, Exibe_Nro_Impressao(Trim(BC_ICMS_Str),13));

        Linha := Linha + 1;
        Conta_Produtos := Conta_Produtos + 1;

        Vlr_Suframa := (BC_ICMS_Normal - ((BC_ICMS_Normal * 7) / 100));
     End;

     Total_Produtos := (18 - Conta_Produtos);

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
     If (Trim(Observacao_4) <> '') Then
        Begin
        Imprimir.PoeStr(Linha,005, Letra_Maiuscula(Copy(Trim(Observacao_4),1,110)) );
     End;

     Linha := Linha + 1;
     If (Trim(Observacao_4) <> '') Then
        Begin
        Imprimir.PoeStr(Linha,005, Letra_Maiuscula(Copy(Trim(Observacao_4),111,110)) );
     End;

     Linha := Linha + 1;
     If (Trim(Observacao_4) <> '') Then
        Begin
        Imprimir.PoeStr(Linha,030, Letra_Maiuscula(Copy(Trim(Observacao_4),221,110)) );
     End;

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

     If ((Trim(Natureza_Operacao.Text) <> 'Remessa') And (Trim(Natureza_Operacao.Text) <> 'Importação')) Then
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
                 VLR_ICMS_Normal := ((BC_ICMS_Normal * 18) / 100);
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

     If ((Trim(Natureza_Operacao.Text) <> 'Remessa') And (Trim(Natureza_Operacao.Text) <> 'Importação')) Then
        Begin
        If BC_ICMS_Reduzida > 0 Then
           Begin
           VLR_ICMS_Reduzida := (((BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * 33.33) / 100)) * Aliquota_ICMS) / 100);
        End;
        End
     Else
        Begin
        If BC_ICMS_Reduzida > 0 Then
           Begin
           VLR_ICMS_Reduzida := (((BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * 33.33) / 100)) * Aliquota_ICMS) / 100);
        End;
     End;

     If ((Trim(Natureza_Operacao.Text) <> 'Remessa') And (Trim(Natureza_Operacao.Text) <> 'Importação')) Then
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
     Imprimir.PoeStr(Linha,001, #18 + '.');

     BC_ICMS_Reduzida := (BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * 33.33) / 100));

     If Nota_Consumo.Checked Then
        Begin
        Str(((Vlr_Total_Produtos + VLR_IPI_Normal) + BC_ICMS_Reduzida):13:2,BC_ICMS_Str);
        End
     Else
        Begin
        Str((BC_ICMS_Normal + BC_ICMS_Reduzida):13:2,BC_ICMS_Str);
     End;

     Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);
     Vlr_ICMS_Str := Trim(Nota_Valor_ICMS.Text);

     Str(VLR_IPI_Normal:13:2,Vlr_IPI_Str);
     Vlr_IPI_Str := Valor_IPI.Text;

     Linha := Linha + 1;

     If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        BC_ICMS_Str  := '0.00';
        Vlr_ICMS_Str := '0.00';
     End;

     Imprimir.PoeStr(Linha,013, #18 + Exibe_Nro_Impressao(Trim(BC_ICMS_Str),10));
     Imprimir.PoeStr(Linha,034, Exibe_Nro_Impressao(Trim(Vlr_ICMS_Str),10));

     //*** Finalizacao para Impressao do ICMS e IPI ***

     Vlr_Total_Produtos_Str := Nota_Valor_Produto.Text;
     Imprimir.PoeStr(Linha,101, Exibe_Nro_Impressao(Trim(Vlr_Total_Produtos_Str),10));

     Linha := Linha + 2;
     Imprimir.PoeStr(Linha,013, Exibe_Nro_Impressao(Trim(Vlr_Frete_Str),10));
     Imprimir.PoeStr(Linha,077, Exibe_Nro_Impressao(Trim(Vlr_IPI_Str),10));

     //Str((Vlr_Total_Produtos + VLR_ICMS_Normal + VLR_IPI_Normal):13:2,Vlr_Total_Produtos_Str);
     If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        Str((Vlr_Suframa):13:2,Vlr_Total_Produtos_Str);
        End
     Else
        Begin
        Str((Vlr_Total_Produtos + VLR_IPI_Normal):13:2,Vlr_Total_Produtos_Str);
     End;

     Imprimir.PoeStr(Linha,100, Exibe_Nro_Impressao(Trim(Valor_Total.Text),10));

     Linha := Linha + 3;
     Transportadora := Obtem_Depois_Traco(Cliente_Transportadora.Text);

     Imprimir.PoeStr(Linha,005, Letra_Maiuscula(Transportadora));

     If Trim(Cliente_Pgto_Frete.text) = 'Cliente' Then
        Begin
        Imprimir.PoeStr(Linha,077, '2');
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,077, '1');
     End;

     //*** Obtem dados da Transportadora ***

     ConexaoBD.SQL_Transportadoras.Close;
     ConexaoBD.SQL_Transportadoras.SQL.Clear;
     ConexaoBD.SQL_Transportadoras.SQL.Add('Select * from fb_transportadoras Where fb_transportadora_numero = ' + Obtem_Nro_Antes_Traco(Cliente_Transportadora.Text) + ' Order By fb_transportadora_nome');
     ConexaoBD.SQL_Transportadoras.Open;

     Imprimir.PoeStr(Linha,107, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_cnpj.Text));

     Linha := Linha + 2;
     If Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_complemento.Text) <> '' Then
        Begin
        Imprimir.PoeStr(Linha,005, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_endereco.Text) + ' - ' + Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_complemento.Text));
        End
     Else
        Begin
        Imprimir.PoeStr(Linha,005, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_endereco.Text));
     End;

     Imprimir.PoeStr(Linha,065, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_cidade.Text));
     Imprimir.PoeStr(Linha,101, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_estado.Text));
     Imprimir.PoeStr(Linha,107, Trim(ConexaoBD.SQL_Transportadorasfb_transportadora_insc_est.Text));

     Linha  := Linha + 2;
     Volume := Prepara_Volume(Posicao_Inicial, Posicao_Final);
     Volume := Trim(Qtde_Volume.Text);

     Imprimir.PoeStr(Linha,001, Exibe_Nro_Impressao(Trim(Qtde_Volume.Text),10) );
     Imprimir.PoeStr(Linha,015, Letra_Maiuscula(Trim(Especie.Text)) );
     Imprimir.PoeStr(Linha,040, Letra_Maiuscula(Trim(Marca.Text)) );

     Imprimir.PoeStr(Linha,085, Exibe_Nro_Impressao(Trim(Peso_Bruto.Text),10));
     Imprimir.PoeStr(Linha,100, Exibe_Nro_Impressao(Trim(Peso_Liquido.Text),10));

     Str((Peso/1000):13:3,Valor_Str);
     Valor_Str := Ponto_Virgula(Trim(Valor_Str));

     Linha := Linha + 2;
     Imprimir.PoeStr(Linha,001, #15 + '.');

     //*** Endereço de Entrega ***

     Linha := Linha + 1;
     Endereco_Entrega := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_Cliente_Endereco_Entrega.Text));

     If Trim(ConexaoBD.SQL_Clientesfb_Cliente_Complemento_Entrega.Text) <> '' Then
        Begin
        Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_Cliente_Complemento_Entrega.Text));
     End;

     Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_Cliente_Bairro_Entrega.Text));
     Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_Cliente_Cidade_Entrega.Text));
     Endereco_Entrega := Endereco_Entrega + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_Cliente_Estado_Entrega.Text));
     Endereco_Entrega := Endereco_Entrega + ' - CEP:' + Trim(ConexaoBD.SQL_Clientesfb_Cliente_Cep_Entrega.Text);
     Endereco_Entrega := Copy(Endereco_Entrega,1,85);

     Imprimir.PoeStr(Linha,005, 'ENTREGA: ' + Letra_Maiuscula(Endereco_Entrega));

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,005, 'OC.: ' + Letra_Maiuscula(Cliente_Ordem_Compra.Text));

     Linha := Linha + 1;
     Imprimir.PoeStr(Linha,005, 'CODIGO DE AREA: ' + Letra_Maiuscula(ConexaoBD.SQL_Clientesfb_cliente_vendedor.Text) );

     If Observacao_Corpo_Nota.Checked = True Then
        Begin
        Observacao_4 := '';
        End
     Else
        Begin
        Observacao_4 := Observacao_Nota.Text;
     End;

     //*** Observação do Suframa ***

     If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        Observacao_4 := 'REMESSA PARA ZONA FRANCA DE MANAUS PARA INDUSTRIALIZAÇÃO, ISENÇÃO DE ICMS CONFORME ARTIGO 84 DO ANEXO I DO DECRETO 48.024/03. | SUSPENCAO DO IPI CONFORME ARTIGO69, INCISO III ARTIGO 22 DO DECRETO 4.544/02.CODIGO DA REPART. FISCAL 010.010.34';
     End;

     Linha := Linha + 1;
     If (Trim(Observacao_4) <> '') Then
        Begin
        Imprimir.PoeStr(Linha,005, Letra_Maiuscula(Copy(Trim(Observacao_4),1,80)) );
     End;

     Linha := Linha + 1;
     If (Trim(Observacao_4) <> '') Then
        Begin
        Imprimir.PoeStr(Linha,005, Letra_Maiuscula(Copy(Trim(Observacao_4),81,80)) );
     End;

     Linha := Linha + 1;
     If (Trim(Observacao_4) <> '') Then
        Begin
        Imprimir.PoeStr(Linha,005, Letra_Maiuscula(Copy(Trim(Observacao_4),161,80)) );
     End;

     Linha := Linha + 1;
     If (Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) <> '') And (Nota_Consumo.Checked = False) Then
        Begin
        Imprimir.PoeStr(Linha,005, Trim(ConexaoBD.SQL_Clientesfb_cliente_suframa.Text) );
     End;

     Linha := Linha + 1;

     Imprimir.ImprimeJob;
     Imprimir.LimpaBuffer;

     Seta();
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.Grava_Nota_Ibrasmak(Posicao_Inicial, Posicao_Final: Integer);

var
   Comando_SQL: String;
   Desconto, Cond_Pgto_1, Cond_Pgto_2, Cond_Pgto_3, Cond_Pgto_4, Transportadora, Vlr_Desconto, Vlr_Pedido, Vlr_Total, Vlr_Frete, Vlr_IPI, Representante, Banco: String;
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
     Vlr_Desconto      := Trim(Virgula_Ponto(Valor_Desconto.Text));
     Vlr_Pedido        := Trim(Virgula_Ponto(Valor_Total.Text));

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
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_especie, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_marca, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_peso_bruto, ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_peso_liquido) ';

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
     Comando_SQL := Comando_SQL + #39 + Trim(Natureza_Operacao.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Natureza_Operacao.Text) + #39 + ',';
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

     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_1) + ',';

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

     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_2) + ',';

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

     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_3) + ',';

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

     Comando_SQL := Comando_SQL + Trim(Vlr_Str_Desd_4) + ',';

     Comando_SQL := Comando_SQL + Trim(Volume) + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Frete) + ',';
     Comando_SQL := Comando_SQL + #39 + '' + #39 + ',';
     Comando_SQL := Comando_SQL + '0' + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_CFOP.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_Str_ICMS) + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Cliente_Ordem_Compra.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Vlr_IPI) + ',';
     Comando_SQL := Comando_SQL + Trim(Cliente_Base_Reduzida.Text) + ',';

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

     Comando_SQL := Comando_SQL + #39 + Trim(Especie.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + #39 + Trim(Marca.Text) + #39 + ',';
     Comando_SQL := Comando_SQL + Trim(Peso_Bruto.Text) + ',';
     Comando_SQL := Comando_SQL + Trim(Peso_Liquido.Text) + ')';

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

            Comando_SQL := 'Insert into fb_notas_fiscais_produtos(';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_numero,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_codigo,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_qtde,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_desc,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_vlr_uni,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_vlr_tot,';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_lote, ';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_posicao, ';
            Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_vlr_ipi)';
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
               Comando_SQL := Comando_SQL + Trim(Virgula_Ponto(SGD_Produtos.Cells[8,Ind])) + ')';
               End
            Else
               Begin
               Comando_SQL := Comando_SQL + '0.00)';
            End;

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

procedure THistoricosRegistroNotasFiscaisSaidas01.BT_ExcluirClick(Sender: TObject);
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

procedure THistoricosRegistroNotasFiscaisSaidas01.BT_AlterarClick(Sender: TObject);
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

        If Imprime_Nota_Apos.Checked Then
           Begin
           Imprimir.Linhas := 72;
           Imprime_Nota();
        End;

        Grava_Nota_Ibrasmak(1,(SGD_Produtos.RowCount - 1));

        Seta();

        RegistroNotasFiscaisSaidas01.Close;
     End;
end;

procedure THistoricosRegistroNotasFiscaisSaidas01.BT_Procurar_FornecedoresClick(
  Sender: TObject);
begin
    Ampulheta();
    Application.CreateForm(TFornecedor00,Fornecedor00);

    Fornecedor00.Programa_Anterior.Text := 'Registro-Notas-Inclusão';

    Seta();

    Fornecedor00.ShowModal;

    Edit_Tipo_Inclusao.Text := 'Fornecedor';
end;

end.
