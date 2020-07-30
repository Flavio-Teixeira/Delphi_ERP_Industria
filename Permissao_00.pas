unit Permissao_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TPermissoes00 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Alterar: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CB_Usuarios: TComboBox;
    Padrao: TEdit;
    SGD_Permissoes: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure CB_UsuariosChange(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure SGD_PermissoesDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Carrega_Grid();
  public
    { Public declarations }
  end;

var
  Permissoes00: TPermissoes00;

implementation

uses Conexao_BD, Rotinas_Gerais, Math, Ibrasmak_00;

{$R *.dfm}

procedure TPermissoes00.Carrega_Grid();

var
   Ind, Posicao_Acesso: Integer;
   Nome_Acesso: String;

begin
     Ampulheta();

     //*** Prepara a Exibi��o dos Itens de Bloqueio ***

     //*** Zera Grid ***

     For Ind := 0 To SGD_Permissoes.RowCount Do
         Begin
         SGD_Permissoes.Cells[0,Ind] := '';
         SGD_Permissoes.Cells[1,Ind] := '';
         SGD_Permissoes.Cells[2,Ind] := '';
     End;

     SGD_Permissoes.RowCount  := 301;
     SGD_Permissoes.FixedRows := 1;

     //*** Prepara��o do StringGrid ***

     //*** Item do Menu ***
     SGD_Permissoes.Cells[0,0]   := 'Item do Menu';
     SGD_Permissoes.ColWidths[0] := 350;

     //*** C�digo do Produto ***
     SGD_Permissoes.Cells[1,0]   := 'Permitido';
     SGD_Permissoes.ColWidths[1] := 50;

     //*** Nome do Item ***
     SGD_Permissoes.Cells[2,0]   := 'Nome do Item';
     SGD_Permissoes.ColWidths[2] := 0;

     //*** Preapara o Restante do Grid **

     If Trim(CB_Usuarios.Text) <> '--------- Selecione um Usu�rio ---------' Then
        Begin

        //*** Carrega o Item do Menu, Nome do Item e o Status ***
        SGD_Permissoes.Cells[0,1]   := '/---Cadastros                                                   '; SGD_Permissoes.Cells[2,1]   := 'Cadastros1                                    '; SGD_Permissoes.Cells[1,1]   := 'N�O';
        SGD_Permissoes.Cells[0,2]   := '+-----Clientes                                                  '; SGD_Permissoes.Cells[2,2]   := 'Clientes1                                     '; SGD_Permissoes.Cells[1,2]   := 'N�O';
        SGD_Permissoes.Cells[0,3]   := '+-------Clientes                                                '; SGD_Permissoes.Cells[2,3]   := 'Clientes2                                     '; SGD_Permissoes.Cells[1,3]   := 'N�O';
        SGD_Permissoes.Cells[0,4]   := '+-------Hist�rico de Compras                                    '; SGD_Permissoes.Cells[2,4]   := 'Historico1                                    '; SGD_Permissoes.Cells[1,4]   := 'N�O';
        SGD_Permissoes.Cells[0,5]   := '+-------Hist�rico de Compras por Produto                        '; SGD_Permissoes.Cells[2,5]   := 'HistricodeComprasporProduto1                  '; SGD_Permissoes.Cells[1,5]   := 'N�O';
        SGD_Permissoes.Cells[0,6]   := '+-----Fornecedores                                              '; SGD_Permissoes.Cells[2,6]   := 'Fornecedores1                                 '; SGD_Permissoes.Cells[1,6]   := 'N�O';
        SGD_Permissoes.Cells[0,7]   := '+-----Produtos                                                  '; SGD_Permissoes.Cells[2,7]   := 'Produtos1                                     '; SGD_Permissoes.Cells[1,7]   := 'N�O';
        SGD_Permissoes.Cells[0,8]   := '+-------Produtos                                                '; SGD_Permissoes.Cells[2,8]   := 'Distribuidor1                                 '; SGD_Permissoes.Cells[1,8]   := 'N�O';
        SGD_Permissoes.Cells[0,9]   := '+-------Tipos                                                   '; SGD_Permissoes.Cells[2,9]   := 'Tipos1                                        '; SGD_Permissoes.Cells[1,9]   := 'N�O';
        SGD_Permissoes.Cells[0,10]  := '+-------Fam�lias                                                '; SGD_Permissoes.Cells[2,10]  := 'Familias1                                     '; SGD_Permissoes.Cells[1,10]  := 'N�O';
        SGD_Permissoes.Cells[0,11]  := '+-------Hist�rico de Sa�da e Entrada por Produto                '; SGD_Permissoes.Cells[2,11]  := 'Histrico1                                     '; SGD_Permissoes.Cells[1,11]  := 'N�O';
        SGD_Permissoes.Cells[0,12]  := '+-----Impostos / Taxas                                          '; SGD_Permissoes.Cells[2,12]  := 'ImpostosTaxas1                                '; SGD_Permissoes.Cells[1,12]  := 'N�O';
        SGD_Permissoes.Cells[0,13]  := '+-------PIS                                                     '; SGD_Permissoes.Cells[2,13]  := 'Pis1                                          '; SGD_Permissoes.Cells[1,13]  := 'N�O';
        SGD_Permissoes.Cells[0,14]  := '+-------COFINS                                                  '; SGD_Permissoes.Cells[2,14]  := 'Cofins1                                       '; SGD_Permissoes.Cells[1,14]  := 'N�O';
        SGD_Permissoes.Cells[0,15]  := '+-------ICMS                                                    '; SGD_Permissoes.Cells[2,15]  := 'ICMS1                                         '; SGD_Permissoes.Cells[1,15]  := 'N�O';
        SGD_Permissoes.Cells[0,16]  := '+-------CSLL                                                    '; SGD_Permissoes.Cells[2,16]  := 'CSLL1                                         '; SGD_Permissoes.Cells[1,16]  := 'N�O';
        SGD_Permissoes.Cells[0,17]  := '+-------IRPJ                                                    '; SGD_Permissoes.Cells[2,17]  := 'IRPJ1                                         '; SGD_Permissoes.Cells[1,17]  := 'N�O';
        SGD_Permissoes.Cells[0,18]  := '+-------IPI                                                     '; SGD_Permissoes.Cells[2,18]  := 'IPI1                                          '; SGD_Permissoes.Cells[1,18]  := 'N�O';
        SGD_Permissoes.Cells[0,19]  := '+-----Transportadoras                                           '; SGD_Permissoes.Cells[2,19]  := 'Transportadora1                               '; SGD_Permissoes.Cells[1,19]  := 'N�O';
        SGD_Permissoes.Cells[0,20]  := '+-----Representantes                                            '; SGD_Permissoes.Cells[2,20]  := 'Representantes1                               '; SGD_Permissoes.Cells[1,20]  := 'N�O';
        SGD_Permissoes.Cells[0,21]  := '+-----Bancos                                                    '; SGD_Permissoes.Cells[2,21]  := 'Bancos1                                       '; SGD_Permissoes.Cells[1,21]  := 'N�O';
        SGD_Permissoes.Cells[0,22]  := '+-----Industrial                                                '; SGD_Permissoes.Cells[2,22]  := 'Industrial1                                   '; SGD_Permissoes.Cells[1,22]  := 'N�O';
        SGD_Permissoes.Cells[0,23]  := '+-------Etapas                                                  '; SGD_Permissoes.Cells[2,23]  := 'Etapas1                                       '; SGD_Permissoes.Cells[1,23]  := 'N�O';
        SGD_Permissoes.Cells[0,24]  := '+-------Processos                                               '; SGD_Permissoes.Cells[2,24]  := 'Processos1                                    '; SGD_Permissoes.Cells[1,24]  := 'N�O';
        SGD_Permissoes.Cells[0,25]  := '+-------Sub-Processos                                           '; SGD_Permissoes.Cells[2,25]  := 'SubProcessos1                                 '; SGD_Permissoes.Cells[1,25]  := 'N�O';
        SGD_Permissoes.Cells[0,26]  := '+-----Departamentos                                             '; SGD_Permissoes.Cells[2,26]  := 'Departamentos1                                '; SGD_Permissoes.Cells[1,26]  := 'N�O';
        SGD_Permissoes.Cells[0,27]  := '+-----Naturezas de Opera��o                                     '; SGD_Permissoes.Cells[2,27]  := 'NaturezasdeOperao1                            '; SGD_Permissoes.Cells[1,27]  := 'N�O';
        SGD_Permissoes.Cells[0,28]  := '\---Sair                                                        '; SGD_Permissoes.Cells[2,28]  := 'Sair2                                         '; SGD_Permissoes.Cells[1,28]  := 'N�O';
        SGD_Permissoes.Cells[0,29]  := '/---Depto.Pessoal                                               '; SGD_Permissoes.Cells[2,29]  := 'DeptoPessoal1                                 '; SGD_Permissoes.Cells[1,29]  := 'N�O';
        SGD_Permissoes.Cells[0,30]  := '\-----Funcion�rios                                              '; SGD_Permissoes.Cells[2,30]  := 'Funcionrios1                                  '; SGD_Permissoes.Cells[1,30]  := 'N�O';
        SGD_Permissoes.Cells[0,31]  := '/---Vendas                                                      '; SGD_Permissoes.Cells[2,31]  := 'SAC1                                          '; SGD_Permissoes.Cells[1,31]  := 'N�O';
        SGD_Permissoes.Cells[0,32]  := '+-----Registro de Liga��es                                      '; SGD_Permissoes.Cells[2,32]  := 'InformacoesAtendimentoClientes1               '; SGD_Permissoes.Cells[1,32]  := 'N�O';
        SGD_Permissoes.Cells[0,33]  := '+-----OS (Ordem de Servi�o)                                     '; SGD_Permissoes.Cells[2,33]  := 'Pedidos3                                      '; SGD_Permissoes.Cells[1,33]  := 'N�O';
        SGD_Permissoes.Cells[0,34]  := '+-----OS Enviados para Faturamento                              '; SGD_Permissoes.Cells[2,34]  := 'PedidosEnviadosparaFaturamento1               '; SGD_Permissoes.Cells[1,34]  := 'N�O';
        SGD_Permissoes.Cells[0,35]  := '+-----Hist�rico de Compras                                      '; SGD_Permissoes.Cells[2,35]  := 'HistricodeCompras1                            '; SGD_Permissoes.Cells[1,35]  := 'N�O';
        SGD_Permissoes.Cells[0,36]  := '+-----Hist�rico de Compras por Produto                          '; SGD_Permissoes.Cells[2,36]  := 'HistricodeComprasporProduto2                  '; SGD_Permissoes.Cells[1,36]  := 'N�O';
        SGD_Permissoes.Cells[0,37]  := '+-----Mapa de Produ��o                                          '; SGD_Permissoes.Cells[2,37]  := 'MapadeProduo1                                 '; SGD_Permissoes.Cells[1,37]  := 'N�O';
        SGD_Permissoes.Cells[0,38]  := '+-----OS Pendentes                                              '; SGD_Permissoes.Cells[2,38]  := 'PedidosPendentes1                             '; SGD_Permissoes.Cells[1,38]  := 'N�O';
        SGD_Permissoes.Cells[0,39]  := '\-----OS Registro Geral                                         '; SGD_Permissoes.Cells[2,39]  := 'OSRegistroGeral1                              '; SGD_Permissoes.Cells[1,39]  := 'N�O';
        SGD_Permissoes.Cells[0,40]  := '/---Produ��o                                                    '; SGD_Permissoes.Cells[2,40]  := 'Produo1                                       '; SGD_Permissoes.Cells[1,40]  := 'N�O';
        SGD_Permissoes.Cells[0,41]  := '+-----(PCP) Fila de Espera                                      '; SGD_Permissoes.Cells[2,41]  := 'FiladeEspera1                                 '; SGD_Permissoes.Cells[1,41]  := 'N�O';
        SGD_Permissoes.Cells[0,42]  := '\-----Fila de Produ��o                                          '; SGD_Permissoes.Cells[2,42]  := 'FiladeProduo1                                 '; SGD_Permissoes.Cells[1,42]  := 'N�O';
        SGD_Permissoes.Cells[0,43]  := '/---Notas Fiscais                                               '; SGD_Permissoes.Cells[2,43]  := 'NotasFiscais1                                 '; SGD_Permissoes.Cells[1,43]  := 'N�O';
        SGD_Permissoes.Cells[0,44]  := '+-----Emiss�o de Notas Fiscais                                  '; SGD_Permissoes.Cells[2,44]  := 'EmissaoNotasFiscais1                          '; SGD_Permissoes.Cells[1,44]  := 'N�O';
        SGD_Permissoes.Cells[0,45]  := '+-------Nota Fiscal Eletr�nica (NFe)                            '; SGD_Permissoes.Cells[2,45]  := 'NotaFiscalEletrnicaNFe1                       '; SGD_Permissoes.Cells[1,45]  := 'N�O';
        SGD_Permissoes.Cells[0,46]  := '+-------Nota Fiscal Eletr�nica (Manual) (NFe)                   '; SGD_Permissoes.Cells[2,46]  := 'NotaFiscalEletrnicaManualNFe1                 '; SGD_Permissoes.Cells[1,46]  := 'N�O';
        SGD_Permissoes.Cells[0,47]  := '+-------Sa�das                                                  '; SGD_Permissoes.Cells[2,47]  := 'Saida1                                        '; SGD_Permissoes.Cells[1,47]  := 'N�O';
        SGD_Permissoes.Cells[0,48]  := '+-------Entradas (Somente Registro das NFs dos Fornecedores)    '; SGD_Permissoes.Cells[2,48]  := 'Entrada1                                      '; SGD_Permissoes.Cells[1,48]  := 'N�O';
        SGD_Permissoes.Cells[0,49]  := '+-------Registro de Notas Fiscais (Manual-Sa�da/Entrada Empresa)'; SGD_Permissoes.Cells[2,49]  := 'SadasManualmente1                             '; SGD_Permissoes.Cells[1,49]  := 'N�O';
        SGD_Permissoes.Cells[0,50]  := '+-------Registro de Papeletas (Manual)                          '; SGD_Permissoes.Cells[2,50]  := 'RegistrodePapeletasManual1                    '; SGD_Permissoes.Cells[1,50]  := 'N�O';
        SGD_Permissoes.Cells[0,51]  := '+-----Manuten��o de Nota Fiscal Anterior                        '; SGD_Permissoes.Cells[2,51]  := 'ManutencaodeNotaFiscalAnterior1               '; SGD_Permissoes.Cells[1,51]  := 'N�O';
        SGD_Permissoes.Cells[0,52]  := '+-----Cancelamento de Notas Fiscais                             '; SGD_Permissoes.Cells[2,52]  := 'CancelamentodeNotasFiscais1                   '; SGD_Permissoes.Cells[1,52]  := 'N�O';
        SGD_Permissoes.Cells[0,53]  := '+-------Sa�das                                                  '; SGD_Permissoes.Cells[2,53]  := 'Sadas1                                        '; SGD_Permissoes.Cells[1,53]  := 'N�O';
        SGD_Permissoes.Cells[0,54]  := '+-------Entradas                                                '; SGD_Permissoes.Cells[2,54]  := 'Entradas1                                     '; SGD_Permissoes.Cells[1,54]  := 'N�O';
        SGD_Permissoes.Cells[0,55]  := '+-------Ordens de Servi�o                                       '; SGD_Permissoes.Cells[2,55]  := 'Papeletas1                                    '; SGD_Permissoes.Cells[1,55]  := 'N�O';
        SGD_Permissoes.Cells[0,56]  := '+-------Pedidos                                                 '; SGD_Permissoes.Cells[2,56]  := 'Pedidos2                                      '; SGD_Permissoes.Cells[1,56]  := 'N�O';
        SGD_Permissoes.Cells[0,57]  := '+-------Pedidos � Faturar                                       '; SGD_Permissoes.Cells[2,57]  := 'PedidosFaturar1                               '; SGD_Permissoes.Cells[1,57]  := 'N�O';
        SGD_Permissoes.Cells[0,58]  := '+-------Retornar Pedidos J� Faturados                           '; SGD_Permissoes.Cells[2,58]  := 'RetornarPedidosJFaturados1                    '; SGD_Permissoes.Cells[1,58]  := 'N�O';
        SGD_Permissoes.Cells[0,59]  := '+-----Ordem de Despacho / Etiqueta SEDEX                        '; SGD_Permissoes.Cells[2,59]  := 'OrdemdeDespachoEtiquetaSEDEX1                 '; SGD_Permissoes.Cells[1,59]  := 'N�O';
        SGD_Permissoes.Cells[0,60]  := '+-----Hist�rico de Notas Fiscais                                '; SGD_Permissoes.Cells[2,60]  := 'HistoricodeNotasFiscaisPapeletas1             '; SGD_Permissoes.Cells[1,60]  := 'N�O';
        SGD_Permissoes.Cells[0,61]  := '+-------Sa�das                                                  '; SGD_Permissoes.Cells[2,61]  := 'Sadas3                                        '; SGD_Permissoes.Cells[1,61]  := 'N�O';
        SGD_Permissoes.Cells[0,62]  := '+-------Entradas                                                '; SGD_Permissoes.Cells[2,62]  := 'Entradas3                                     '; SGD_Permissoes.Cells[1,62]  := 'N�O';
        SGD_Permissoes.Cells[0,63]  := '+-------Ordens de Servi�o                                       '; SGD_Permissoes.Cells[2,63]  := 'Papeletas3                                    '; SGD_Permissoes.Cells[1,63]  := 'N�O';
        SGD_Permissoes.Cells[0,64]  := '\-----Controle de Sa�da de Mercadorias                          '; SGD_Permissoes.Cells[2,64]  := 'RelatriodeSadas1                              '; SGD_Permissoes.Cells[1,64]  := 'N�O';
        SGD_Permissoes.Cells[0,65]  := '/---Cobran�a                                                    '; SGD_Permissoes.Cells[2,65]  := 'Cobranca1                                     '; SGD_Permissoes.Cells[1,65]  := 'N�O';
        SGD_Permissoes.Cells[0,66]  := '+-----Emiss�o de Duplicatas                                     '; SGD_Permissoes.Cells[2,66]  := 'EmissaodeTitulos1                             '; SGD_Permissoes.Cells[1,66]  := 'N�O';
        SGD_Permissoes.Cells[0,67]  := '+-------Autom�tica                                              '; SGD_Permissoes.Cells[2,67]  := 'Boletos1                                      '; SGD_Permissoes.Cells[1,67]  := 'N�O';
        SGD_Permissoes.Cells[0,68]  := '+-------Manual                                                  '; SGD_Permissoes.Cells[2,68]  := 'Avulsos1                                      '; SGD_Permissoes.Cells[1,68]  := 'N�O';
        SGD_Permissoes.Cells[0,69]  := '+-------Cancelamento de Duplicata Manual                        '; SGD_Permissoes.Cells[2,69]  := 'CancelamentodeBoletoAvulso1                   '; SGD_Permissoes.Cells[1,69]  := 'N�O';
        SGD_Permissoes.Cells[0,70]  := '+-----Baixa de Cobran�a                                         '; SGD_Permissoes.Cells[2,70]  := 'BaixadeCobrana1                               '; SGD_Permissoes.Cells[1,70]  := 'N�O';
        SGD_Permissoes.Cells[0,71]  := '+-----Altera��o de Banco na Duplicata                           '; SGD_Permissoes.Cells[2,71]  := 'AlteraodeBanconaCobrana1                      '; SGD_Permissoes.Cells[1,71]  := 'N�O';
        SGD_Permissoes.Cells[0,72]  := '+-----Desdobramento de Duplicatas                               '; SGD_Permissoes.Cells[2,72]  := 'DesdobramentodeDuplicatas1                    '; SGD_Permissoes.Cells[1,72]  := 'N�O';
        SGD_Permissoes.Cells[0,73]  := '+-----Libera��o de Cr�dito                                      '; SGD_Permissoes.Cells[2,73]  := 'LiberaodeCrdito1                              '; SGD_Permissoes.Cells[1,73]  := 'N�O';
        SGD_Permissoes.Cells[0,74]  := '+-----Arquivos de Transmiss�o                                   '; SGD_Permissoes.Cells[2,74]  := 'ArquivosdeTransmisso1                         '; SGD_Permissoes.Cells[1,74]  := 'N�O';
        SGD_Permissoes.Cells[0,75]  := '\-------Gera��o do Arquivo de Integra��o - CONTMATIC            '; SGD_Permissoes.Cells[2,75]  := 'GeraodoArquivodeIntegraoCONTMATIC1            '; SGD_Permissoes.Cells[1,75]  := 'N�O';
        SGD_Permissoes.Cells[0,76]  := '/---Contas a Pagar                                              '; SGD_Permissoes.Cells[2,76]  := 'ContasaPagar1                                 '; SGD_Permissoes.Cells[1,76]  := 'N�O';
        SGD_Permissoes.Cells[0,77]  := '+-----Contas Banc�rias                                          '; SGD_Permissoes.Cells[2,77]  := 'ContasBancrias1                               '; SGD_Permissoes.Cells[1,77]  := 'N�O';
        SGD_Permissoes.Cells[0,78]  := '+-----Saldos                                                    '; SGD_Permissoes.Cells[2,78]  := 'Saldos1                                       '; SGD_Permissoes.Cells[1,78]  := 'N�O';
        SGD_Permissoes.Cells[0,79]  := '+-----T�tulos Fixos                                             '; SGD_Permissoes.Cells[2,79]  := 'tulosFixos1                                   '; SGD_Permissoes.Cells[1,79]  := 'N�O';
        SGD_Permissoes.Cells[0,80]  := '+-----T�tulos Avulsos (Contas a Pagar)                          '; SGD_Permissoes.Cells[2,80]  := 'tulosAvulsos1                                 '; SGD_Permissoes.Cells[1,80]  := 'N�O';
        SGD_Permissoes.Cells[0,81]  := '+-----Relat�rio de Contas a Pagar                               '; SGD_Permissoes.Cells[2,81]  := 'RelatriodeContasaPagar1                       '; SGD_Permissoes.Cells[1,81]  := 'N�O';
        SGD_Permissoes.Cells[0,82]  := '\-----Relat�rio Comparativo - Contas a Pagar / Contas a Receber '; SGD_Permissoes.Cells[2,82]  := 'RelatrioComparativoContasaPagarContasaReceber1'; SGD_Permissoes.Cells[1,82]  := 'N�O';
        SGD_Permissoes.Cells[0,83]  := '/---Compras                                                     '; SGD_Permissoes.Cells[2,83]  := 'Compras1                                      '; SGD_Permissoes.Cells[1,83]  := 'N�O';
        SGD_Permissoes.Cells[0,84]  := '+-----Requisi��es                                               '; SGD_Permissoes.Cells[2,84]  := 'Requisicoes                                   '; SGD_Permissoes.Cells[1,84]  := 'N�O';
        SGD_Permissoes.Cells[0,85]  := '+-----Cota��o                                                   '; SGD_Permissoes.Cells[2,85]  := 'Cotao1                                        '; SGD_Permissoes.Cells[1,85]  := 'N�O';
        SGD_Permissoes.Cells[0,86]  := '+-----Ordem de Compra                                           '; SGD_Permissoes.Cells[2,86]  := 'OrdemdeCompra1                                '; SGD_Permissoes.Cells[1,86]  := 'N�O';
        SGD_Permissoes.Cells[0,87]  := '+-----Nota de Entrada                                           '; SGD_Permissoes.Cells[2,87]  := 'NotadeEntrada1                                '; SGD_Permissoes.Cells[1,87]  := 'N�O';
        SGD_Permissoes.Cells[0,88]  := '+-----Rela��o de Produtos Comprados                             '; SGD_Permissoes.Cells[2,88]  := 'RelaodeProdutosComprados1                     '; SGD_Permissoes.Cells[1,88]  := 'N�O';
        SGD_Permissoes.Cells[0,89]  := '\-----Produtos dos Fornecedores                                 '; SGD_Permissoes.Cells[2,89]  := 'ProdutosdosFornecedores1                      '; SGD_Permissoes.Cells[1,89]  := 'N�O';
        SGD_Permissoes.Cells[0,90]  := '\-----Ordens de Compra Finalizadas                              '; SGD_Permissoes.Cells[2,90]  := 'OrdemdeCompraporPeriodo1                      '; SGD_Permissoes.Cells[1,90]  := 'N�O';
        SGD_Permissoes.Cells[0,91]  := '/---Estoque                                                     '; SGD_Permissoes.Cells[2,91]  := 'Estoque1                                      '; SGD_Permissoes.Cells[1,91]  := 'N�O';
        SGD_Permissoes.Cells[0,92]  := '+-----Manuten��o                                                '; SGD_Permissoes.Cells[2,92]  := 'Manuteno1                                     '; SGD_Permissoes.Cells[1,92]  := 'N�O';
        SGD_Permissoes.Cells[0,93]  := '\-----Exclus�o de Movimento                                     '; SGD_Permissoes.Cells[2,93]  := 'ExclusodeMovimento1                           '; SGD_Permissoes.Cells[1,93]  := 'N�O';
        SGD_Permissoes.Cells[0,94]  := '/---Etiquetas                                                   '; SGD_Permissoes.Cells[2,94]  := 'Etiquetas1                                    '; SGD_Permissoes.Cells[1,94]  := 'N�O';
        SGD_Permissoes.Cells[0,95]  := '+-----Clientes                                                  '; SGD_Permissoes.Cells[2,95]  := 'Clientes3                                     '; SGD_Permissoes.Cells[1,95]  := 'N�O';
        SGD_Permissoes.Cells[0,96]  := '+-----Representantes                                            '; SGD_Permissoes.Cells[2,96]  := 'Representantes2                               '; SGD_Permissoes.Cells[1,96]  := 'N�O';
        SGD_Permissoes.Cells[0,97]  := '+-----Avulsas                                                   '; SGD_Permissoes.Cells[2,97]  := 'Avulsas1                                      '; SGD_Permissoes.Cells[1,97]  := 'N�O';
        SGD_Permissoes.Cells[0,98]  := '\-----Etiquetas SEDEX                                           '; SGD_Permissoes.Cells[2,98]  := 'EtiquetaSEDEX1                                '; SGD_Permissoes.Cells[1,98]  := 'N�O';
        SGD_Permissoes.Cells[0,99]  := '/---Relat�rios                                                  '; SGD_Permissoes.Cells[2,99]  := 'Relatorios1                                   '; SGD_Permissoes.Cells[1,99]  := 'N�O';
        SGD_Permissoes.Cells[0,100] := '+-----Estoque                                                   '; SGD_Permissoes.Cells[2,100] := 'Estoque2                                      '; SGD_Permissoes.Cells[1,100] := 'N�O';
        SGD_Permissoes.Cells[0,101] := '+-------Movimento de Estoque                                    '; SGD_Permissoes.Cells[2,101] := 'MovimentodeEstoque1                           '; SGD_Permissoes.Cells[1,101] := 'N�O';
        SGD_Permissoes.Cells[0,102] := '+-------Estoque de Produtos                                     '; SGD_Permissoes.Cells[2,102] := 'EstoquedeProdutos1                            '; SGD_Permissoes.Cells[1,102] := 'N�O';
        SGD_Permissoes.Cells[0,103] := '+-------Invent�rio                                              '; SGD_Permissoes.Cells[2,103] := 'Inventrio1                                    '; SGD_Permissoes.Cells[1,103] := 'N�O';
        SGD_Permissoes.Cells[0,104] := '+-------Pedido de Compra                                        '; SGD_Permissoes.Cells[2,104] := 'PedidodeCompra1                               '; SGD_Permissoes.Cells[1,104] := 'N�O';
        SGD_Permissoes.Cells[0,105] := '+-----Ibrasmak                                                  '; SGD_Permissoes.Cells[2,105] := 'Ibrasmak1                                     '; SGD_Permissoes.Cells[1,105] := 'N�O';
        SGD_Permissoes.Cells[0,106] := '+-------Cobran�a                                                '; SGD_Permissoes.Cells[2,106] := 'Cobrana1                                      '; SGD_Permissoes.Cells[1,106] := 'N�O';
        SGD_Permissoes.Cells[0,107] := '+---------Notas Fiscais                                         '; SGD_Permissoes.Cells[2,107] := 'NotasFiscais3                                 '; SGD_Permissoes.Cells[1,107] := 'N�O';
        SGD_Permissoes.Cells[0,108] := '+-----------Contas a Receber                                    '; SGD_Permissoes.Cells[2,108] := 'ContasaReceber1                               '; SGD_Permissoes.Cells[1,108] := 'N�O';
        SGD_Permissoes.Cells[0,109] := '+---------Or�amentos                                            '; SGD_Permissoes.Cells[2,109] := 'Papeletas5                                    '; SGD_Permissoes.Cells[1,109] := 'N�O';
        SGD_Permissoes.Cells[0,110] := '+-----------Contas a Receber                                    '; SGD_Permissoes.Cells[2,110] := 'ContasaReceber2                               '; SGD_Permissoes.Cells[1,110] := 'N�O';
        SGD_Permissoes.Cells[0,111] := '+-------Comiss�es                                               '; SGD_Permissoes.Cells[2,111] := 'Comisses1                                     '; SGD_Permissoes.Cells[1,111] := 'N�O';
        SGD_Permissoes.Cells[0,112] := '+---------C�lculo das Comiss�es                                 '; SGD_Permissoes.Cells[2,112] := 'VendasdosRepresentantes1                      '; SGD_Permissoes.Cells[1,112] := 'N�O';
        SGD_Permissoes.Cells[0,113] := '+-----------Notas Fiscais                                       '; SGD_Permissoes.Cells[2,113] := 'NotasFiscais2                                 '; SGD_Permissoes.Cells[1,113] := 'N�O';
        SGD_Permissoes.Cells[0,114] := '+-----------OS (Ordens de Servi�o)                              '; SGD_Permissoes.Cells[2,114] := 'OrdensdeServio1                               '; SGD_Permissoes.Cells[1,114] := 'N�O';
        SGD_Permissoes.Cells[0,115] := '+-------Faturamento                                             '; SGD_Permissoes.Cells[2,115] := 'Faturamento2                                  '; SGD_Permissoes.Cells[1,115] := 'N�O';
        SGD_Permissoes.Cells[0,116] := '+---------Outras Sa�das                                         '; SGD_Permissoes.Cells[2,116] := 'OutrasSadas1                                  '; SGD_Permissoes.Cells[1,116] := 'N�O';
        SGD_Permissoes.Cells[0,117] := '+---------Sa�das                                                '; SGD_Permissoes.Cells[2,117] := 'Sadas5                                        '; SGD_Permissoes.Cells[1,117] := 'N�O';
        SGD_Permissoes.Cells[0,118] := '+---------Vendas por Per�odo                                    '; SGD_Permissoes.Cells[2,118] := 'VendasporPerodo1                              '; SGD_Permissoes.Cells[1,118] := 'N�O';
        SGD_Permissoes.Cells[0,119] := '+---------OS (Ordens de Servi�o)                                '; SGD_Permissoes.Cells[2,119] := 'OSOrdensdeServio2                             '; SGD_Permissoes.Cells[1,119] := 'N�O';
        SGD_Permissoes.Cells[0,120] := '+-------Impostos                                                '; SGD_Permissoes.Cells[2,120] := 'Impstos1                                      '; SGD_Permissoes.Cells[1,120] := 'N�O';
        SGD_Permissoes.Cells[0,121] := '+---------PIS                                                   '; SGD_Permissoes.Cells[2,121] := 'Pis2                                          '; SGD_Permissoes.Cells[1,121] := 'N�O';
        SGD_Permissoes.Cells[0,122] := '+---------COFINS                                                '; SGD_Permissoes.Cells[2,122] := 'Cofins2                                       '; SGD_Permissoes.Cells[1,122] := 'N�O';
        SGD_Permissoes.Cells[0,123] := '+---------ICMS                                                  '; SGD_Permissoes.Cells[2,123] := 'ICMS2                                         '; SGD_Permissoes.Cells[1,123] := 'N�O';
        SGD_Permissoes.Cells[0,124] := '+---------CSLL                                                  '; SGD_Permissoes.Cells[2,124] := 'CSLL2                                         '; SGD_Permissoes.Cells[1,124] := 'N�O';
        SGD_Permissoes.Cells[0,125] := '+---------IRPJ                                                  '; SGD_Permissoes.Cells[2,125] := 'IRPJ2                                         '; SGD_Permissoes.Cells[1,125] := 'N�O';
        SGD_Permissoes.Cells[0,126] := '+---------IPI                                                   '; SGD_Permissoes.Cells[2,126] := 'IPI2                                          '; SGD_Permissoes.Cells[1,126] := 'N�O';
        SGD_Permissoes.Cells[0,127] := '+-------Maiores clientes por valor vendido                      '; SGD_Permissoes.Cells[2,127] := 'MaioresClientesPorValorVendido1               '; SGD_Permissoes.Cells[1,127] := 'N�O';
        SGD_Permissoes.Cells[0,128] := '+-------Vendas por Estados/Representantes                       '; SGD_Permissoes.Cells[2,128] := 'VendasporEstadosRepresentantes1               '; SGD_Permissoes.Cells[1,128] := 'N�O';
        SGD_Permissoes.Cells[0,129] := '+-----Monibras                                                  '; SGD_Permissoes.Cells[2,129] := 'Monibras1                                     '; SGD_Permissoes.Cells[1,129] := 'N�O';
        SGD_Permissoes.Cells[0,130] := '+-------Cobran�a                                                '; SGD_Permissoes.Cells[2,130] := 'Cobrana2                                      '; SGD_Permissoes.Cells[1,130] := 'N�O';
        SGD_Permissoes.Cells[0,131] := '+---------Notas Fiscais                                         '; SGD_Permissoes.Cells[2,131] := 'NotasFiscais4                                 '; SGD_Permissoes.Cells[1,131] := 'N�O';
        SGD_Permissoes.Cells[0,132] := '+-----------Contas a Receber                                    '; SGD_Permissoes.Cells[2,132] := 'ContasaReceber4                               '; SGD_Permissoes.Cells[1,132] := 'N�O';
        SGD_Permissoes.Cells[0,133] := '+---------Or�amentos                                            '; SGD_Permissoes.Cells[2,133] := 'Oramentos1                                    '; SGD_Permissoes.Cells[1,133] := 'N�O';
        SGD_Permissoes.Cells[0,134] := '+-----------Contas a Receber                                    '; SGD_Permissoes.Cells[2,134] := 'ContasaReceber3                               '; SGD_Permissoes.Cells[1,134] := 'N�O';
        SGD_Permissoes.Cells[0,135] := '+-------Comiss�es                                               '; SGD_Permissoes.Cells[2,135] := 'Comisses2                                     '; SGD_Permissoes.Cells[1,135] := 'N�O';
        SGD_Permissoes.Cells[0,136] := '+---------C�lculo das Comiss�es                                 '; SGD_Permissoes.Cells[2,136] := 'ClculodasComisses1                            '; SGD_Permissoes.Cells[1,136] := 'N�O';
        SGD_Permissoes.Cells[0,137] := '+-----------Notas Fiscais                                       '; SGD_Permissoes.Cells[2,137] := 'NotasFiscais5                                 '; SGD_Permissoes.Cells[1,137] := 'N�O';
        SGD_Permissoes.Cells[0,138] := '+-----------OS (Ordens de Servi�o)                              '; SGD_Permissoes.Cells[2,138] := 'OSOrdensdeServio1                             '; SGD_Permissoes.Cells[1,138] := 'N�O';
        SGD_Permissoes.Cells[0,139] := '+-------Faturamento                                             '; SGD_Permissoes.Cells[2,139] := 'Faturamento1                                  '; SGD_Permissoes.Cells[1,139] := 'N�O';
        SGD_Permissoes.Cells[0,140] := '+---------Outras Sa�das                                         '; SGD_Permissoes.Cells[2,140] := 'OutrasSadas2                                  '; SGD_Permissoes.Cells[1,140] := 'N�O';
        SGD_Permissoes.Cells[0,141] := '+---------Sa�das                                                '; SGD_Permissoes.Cells[2,141] := 'Sadas2                                        '; SGD_Permissoes.Cells[1,141] := 'N�O';
        SGD_Permissoes.Cells[0,142] := '+---------Vendas por Per�odo                                    '; SGD_Permissoes.Cells[2,142] := 'VendasporPerodo2                              '; SGD_Permissoes.Cells[1,142] := 'N�O';
        SGD_Permissoes.Cells[0,143] := '+---------OS (Ordens de Servi�o)                                '; SGD_Permissoes.Cells[2,143] := 'OSOrdensdeServio3                             '; SGD_Permissoes.Cells[1,143] := 'N�O';
        SGD_Permissoes.Cells[0,144] := '+-------Impostos                                                '; SGD_Permissoes.Cells[2,144] := 'Impostos1                                     '; SGD_Permissoes.Cells[1,144] := 'N�O';
        SGD_Permissoes.Cells[0,145] := '+---------PIS                                                   '; SGD_Permissoes.Cells[2,145] := 'PIS3                                          '; SGD_Permissoes.Cells[1,145] := 'N�O';
        SGD_Permissoes.Cells[0,146] := '+---------COFINS                                                '; SGD_Permissoes.Cells[2,146] := 'COFINS3                                       '; SGD_Permissoes.Cells[1,146] := 'N�O';
        SGD_Permissoes.Cells[0,147] := '+---------ICMS                                                  '; SGD_Permissoes.Cells[2,147] := 'ICMS3                                         '; SGD_Permissoes.Cells[1,147] := 'N�O';
        SGD_Permissoes.Cells[0,148] := '+---------CSLL                                                  '; SGD_Permissoes.Cells[2,148] := 'CSLL3                                         '; SGD_Permissoes.Cells[1,148] := 'N�O';
        SGD_Permissoes.Cells[0,149] := '+---------IRPJ                                                  '; SGD_Permissoes.Cells[2,149] := 'IRPJ3                                         '; SGD_Permissoes.Cells[1,149] := 'N�O';
        SGD_Permissoes.Cells[0,150] := '+---------IPI                                                   '; SGD_Permissoes.Cells[2,150] := 'IPI3                                          '; SGD_Permissoes.Cells[1,150] := 'N�O';
        SGD_Permissoes.Cells[0,151] := '+-------Maiores clientes por valor vendido                      '; SGD_Permissoes.Cells[2,151] := 'Maioresclientesporvalorvendido2               '; SGD_Permissoes.Cells[1,151] := 'N�O';
        SGD_Permissoes.Cells[0,152] := '+-------Vendas por Estados/Representantes                       '; SGD_Permissoes.Cells[2,152] := 'VendasporEstadosRepresentantes2               '; SGD_Permissoes.Cells[1,152] := 'N�O';
        SGD_Permissoes.Cells[0,153] := '\-------Fichas de Visita                                        '; SGD_Permissoes.Cells[2,153] := 'FichasdeVisita1                               '; SGD_Permissoes.Cells[1,153] := 'N�O';
        SGD_Permissoes.Cells[0,154] := '/---Cancelamentos                                               '; SGD_Permissoes.Cells[2,154] := 'Cancelamento1                                 '; SGD_Permissoes.Cells[1,154] := 'N�O';
        SGD_Permissoes.Cells[0,155] := '+-----Requisi��es                                               '; SGD_Permissoes.Cells[2,155] := 'Requisies1                                    '; SGD_Permissoes.Cells[1,155] := 'N�O';
        SGD_Permissoes.Cells[0,156] := '+-----Cota��es                                                  '; SGD_Permissoes.Cells[2,156] := 'Cotaes1                                       '; SGD_Permissoes.Cells[1,156] := 'N�O';
        SGD_Permissoes.Cells[0,157] := '\-----Ordens de Compra                                          '; SGD_Permissoes.Cells[2,157] := 'OrdensdeCompra1                               '; SGD_Permissoes.Cells[1,157] := 'N�O';
        SGD_Permissoes.Cells[0,158] := '+-----Funcion�rios                                              '; SGD_Permissoes.Cells[2,158] := 'Funcionrios2                                  '; SGD_Permissoes.Cells[1,158] := 'N�O';
        SGD_Permissoes.Cells[0,159] := '+-----Clientes por Representante                                '; SGD_Permissoes.Cells[2,159] := 'ClientesporRepresentante1                     '; SGD_Permissoes.Cells[1,159] := 'N�O';
        SGD_Permissoes.Cells[0,160] := '+-----Fornecedores                                              '; SGD_Permissoes.Cells[2,160] := 'Fornecedores2                                 '; SGD_Permissoes.Cells[1,160] := 'N�O';
        SGD_Permissoes.Cells[0,161] := '/---Op��es                                                      '; SGD_Permissoes.Cells[2,161] := 'Opcoes1                                       '; SGD_Permissoes.Cells[1,161] := 'N�O';
        SGD_Permissoes.Cells[0,162] := '+-----Usu�rio                                                   '; SGD_Permissoes.Cells[2,162] := 'Usurio1                                       '; SGD_Permissoes.Cells[1,162] := 'N�O';
        SGD_Permissoes.Cells[0,163] := '\-----Permiss�es                                                '; SGD_Permissoes.Cells[2,163] := 'Permisses1                                    '; SGD_Permissoes.Cells[1,163] := 'N�O';
        SGD_Permissoes.Cells[0,164] := '/---Ajuda                                                       '; SGD_Permissoes.Cells[2,164] := 'Ajuda1                                        '; SGD_Permissoes.Cells[1,164] := 'N�O';
        SGD_Permissoes.Cells[0,165] := '\-----Sobre...                                                  '; SGD_Permissoes.Cells[2,165] := 'Sobre1                                        '; SGD_Permissoes.Cells[1,165] := 'N�O';
        SGD_Permissoes.Cells[0,166] := 'Sair                                                            '; SGD_Permissoes.Cells[2,166] := 'Sair1                                         '; SGD_Permissoes.Cells[1,166] := 'N�O';

        //*** Carrega o Permitido ***

        ConexaoBD.SQL_FB_Permissoes_Acesso.Close;
        ConexaoBD.SQL_FB_Permissoes_Acesso.SQL.Clear;
        ConexaoBD.SQL_FB_Permissoes_Acesso.SQL.Add('Select * from fb_permissoes_acesso Where fb_permissao_acesso_login = ' +#39+ Trim(CB_Usuarios.Text) +#39+ ' Order By fb_permissao_acesso_login, fb_permissao_acesso_posicao');
        ConexaoBD.SQL_FB_Permissoes_Acesso.Open;

        If ConexaoBD.SQL_FB_Permissoes_Acesso.RecordCount > 0 Then
           Begin

           ConexaoBD.SQL_FB_Permissoes_Acesso.First;

           While Not ConexaoBD.SQL_FB_Permissoes_Acesso.Eof Do
                 Begin

                 Nome_Acesso    := Trim(ConexaoBD.SQL_FB_Permissoes_Acesso.FieldByName('fb_permissao_acesso_nome').Text);
                 Posicao_Acesso := 0;

                 For Ind := 1 To SGD_Permissoes.RowCount Do
                     Begin

                     If Trim(SGD_Permissoes.Cells[2,Ind]) = Nome_Acesso Then
                        Begin
                        Posicao_Acesso := Ind;
                     End;
                 End;

                 If Posicao_Acesso > 0 Then
                    Begin

                    If ((Trim(ConexaoBD.SQL_FB_Permissoes_Acesso.FieldByName('fb_permissao_acesso_status').Text) = '0') Or (Trim(ConexaoBD.SQL_FB_Permissoes_Acesso.FieldByName('fb_permissao_acesso_status').Text) = '')) Then
                       Begin
                       SGD_Permissoes.Cells[1,Posicao_Acesso] := 'N�O'
                       End
                    Else
                       Begin
                       SGD_Permissoes.Cells[1,Posicao_Acesso] := 'SIM';
                    End;

                 End;

                 ConexaoBD.SQL_FB_Permissoes_Acesso.Next;
           End;
        End;

        ConexaoBD.SQL_FB_Permissoes_Acesso.Close;
     End;

     Seta();
end;

procedure TPermissoes00.FormShow(Sender: TObject);
begin
     //*** Seleciona os Usu�rios ***

     ConexaoBD.SQL_Senhas.Close;
     ConexaoBD.SQL_Senhas.SQL.Clear;
     ConexaoBD.SQL_Senhas.SQL.Add('Select * from senhas Order By senha_usuario');
     ConexaoBD.SQL_Senhas.Open;

     CB_Usuarios.Items.Clear;
     CB_Usuarios.Items.Add('--------- Selecione um Usu�rio ---------');

     If ConexaoBD.SQL_Senhas.RecordCount > 0 Then
        Begin

        ConexaoBD.SQL_Senhas.First;

        While Not ConexaoBD.SQL_Senhas.Eof Do
              Begin
              CB_Usuarios.Items.Add(Trim(ConexaoBD.SQL_Senhassenha_usuario.Text));
              ConexaoBD.SQL_Senhas.Next;
        End;

        CB_Usuarios.ItemIndex := 0;
     End;

     ConexaoBD.SQL_Senhas.Close;

     Carrega_Grid();
end;

procedure TPermissoes00.CB_UsuariosChange(Sender: TObject);
begin
    Carrega_Grid();
end;

procedure TPermissoes00.BT_SairClick(Sender: TObject);
begin
  Permissoes00.Close;
end;

procedure TPermissoes00.BT_AlterarClick(Sender: TObject);

var
   Comando_SQL, Campo, Conteudo, Nome_Acesso: String;
   Ind: Integer;

begin
     If Trim(CB_Usuarios.Text) <> '--------- Selecione um Usu�rio ---------' Then
        Begin

        Ampulheta();

        For Ind := 1 To SGD_Permissoes.RowCount Do
            Begin

            Nome_Acesso := Trim(SGD_Permissoes.Cells[2,Ind]);

            ConexaoBD.SQL_FB_Permissoes_Acesso.Close;
            ConexaoBD.SQL_FB_Permissoes_Acesso.SQL.Clear;
            ConexaoBD.SQL_FB_Permissoes_Acesso.SQL.Add('Select * from fb_permissoes_acesso Where fb_permissao_acesso_login = ' +#39+ Trim(CB_Usuarios.Text) +#39+ ' And fb_permissao_acesso_nome = ' + #39 + Trim(Nome_Acesso) +#39);
            ConexaoBD.SQL_FB_Permissoes_Acesso.Open;

            If ConexaoBD.SQL_FB_Permissoes_Acesso.RecordCount > 0 Then
               Begin

               Comando_SQL := 'Update fb_permissoes_acesso Set ';

               If Trim(SGD_Permissoes.Cells[1,Ind]) = 'N�O' Then
                  Begin
                  Comando_SQL := Comando_SQL + 'fb_permissao_acesso_status = ' +#39+ '0' +#39+ ' ';
                  End
               Else
                  Begin
                  Comando_SQL := Comando_SQL + 'fb_permissao_acesso_status = ' +#39+ '1' +#39+ ' ';
               End;

               Comando_SQL := Comando_SQL + ' Where fb_permissao_acesso_login = ' +#39+ Trim(CB_Usuarios.Text) +#39+ ' And fb_permissao_acesso_nome = ' + #39 + Trim(Nome_Acesso) +#39;

               End
           Else
               Begin

               Comando_SQL := 'Insert into fb_permissoes_acesso(fb_permissao_acesso_login, fb_permissao_acesso_nome, fb_permissao_acesso_status) ';
               Comando_SQL := Comando_SQL + 'Values(';
               Comando_SQL := Comando_SQL + #39+ Trim(CB_Usuarios.Text) +#39+ ', ';
               Comando_SQL := Comando_SQL + #39+ Trim(Nome_Acesso) +#39+ ', ';

               If Trim(SGD_Permissoes.Cells[1,Ind]) = 'N�O' Then
                  Begin
                  Comando_SQL := Comando_SQL +#39+ '0' +#39+ ')';
                  End
               Else
                  Begin
                  Comando_SQL := Comando_SQL +#39+ '1' +#39+ ')';
               End;

           End;

           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Comunitario.ExecSQL;

        End;

        Seta();

        MSG_Erro('Altera��es efetuadas para o Login: ' + Trim(CB_Usuarios.Text));

     End;
end;

procedure TPermissoes00.SGD_PermissoesDblClick(Sender: TObject);
begin
     If Trim(SGD_Permissoes.Cells[1,SGD_Permissoes.Row]) = 'SIM' Then
        Begin
        SGD_Permissoes.Cells[1,SGD_Permissoes.Row] := 'N�O';
        End
     Else
        Begin
        SGD_Permissoes.Cells[1,SGD_Permissoes.Row] := 'SIM';
     End;
end;

end.
