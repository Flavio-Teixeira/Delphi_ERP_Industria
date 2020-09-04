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

     //*** Prepara a Exibição dos Itens de Bloqueio ***

     //*** Zera Grid ***

     For Ind := 0 To SGD_Permissoes.RowCount Do
         Begin
         SGD_Permissoes.Cells[0,Ind] := '';
         SGD_Permissoes.Cells[1,Ind] := '';
         SGD_Permissoes.Cells[2,Ind] := '';
     End;

     SGD_Permissoes.RowCount  := 301;
     SGD_Permissoes.FixedRows := 1;

     //*** Preparação do StringGrid ***

     //*** Item do Menu ***
     SGD_Permissoes.Cells[0,0]   := 'Item do Menu';
     SGD_Permissoes.ColWidths[0] := 350;

     //*** Código do Produto ***
     SGD_Permissoes.Cells[1,0]   := 'Permitido';
     SGD_Permissoes.ColWidths[1] := 50;

     //*** Nome do Item ***
     SGD_Permissoes.Cells[2,0]   := 'Nome do Item';
     SGD_Permissoes.ColWidths[2] := 0;

     //*** Preapara o Restante do Grid **

     If Trim(CB_Usuarios.Text) <> '--------- Selecione um Usuário ---------' Then
        Begin

        //*** Carrega o Item do Menu, Nome do Item e o Status ***
        SGD_Permissoes.Cells[0,1]   := '/---Cadastros                                                   '; SGD_Permissoes.Cells[2,1]   := 'Cadastros1                                    '; SGD_Permissoes.Cells[1,1]   := 'NÃO';
        SGD_Permissoes.Cells[0,2]   := '+-----Clientes                                                  '; SGD_Permissoes.Cells[2,2]   := 'Clientes1                                     '; SGD_Permissoes.Cells[1,2]   := 'NÃO';
        SGD_Permissoes.Cells[0,3]   := '+-------Clientes                                                '; SGD_Permissoes.Cells[2,3]   := 'Clientes2                                     '; SGD_Permissoes.Cells[1,3]   := 'NÃO';
        SGD_Permissoes.Cells[0,4]   := '+-------Histórico de Compras                                    '; SGD_Permissoes.Cells[2,4]   := 'Historico1                                    '; SGD_Permissoes.Cells[1,4]   := 'NÃO';
        SGD_Permissoes.Cells[0,5]   := '+-------Histórico de Compras por Produto                        '; SGD_Permissoes.Cells[2,5]   := 'HistricodeComprasporProduto1                  '; SGD_Permissoes.Cells[1,5]   := 'NÃO';
        SGD_Permissoes.Cells[0,6]   := '+-----Fornecedores                                              '; SGD_Permissoes.Cells[2,6]   := 'Fornecedores1                                 '; SGD_Permissoes.Cells[1,6]   := 'NÃO';
        SGD_Permissoes.Cells[0,7]   := '+-----Produtos                                                  '; SGD_Permissoes.Cells[2,7]   := 'Produtos1                                     '; SGD_Permissoes.Cells[1,7]   := 'NÃO';
        SGD_Permissoes.Cells[0,8]   := '+-------Produtos                                                '; SGD_Permissoes.Cells[2,8]   := 'Distribuidor1                                 '; SGD_Permissoes.Cells[1,8]   := 'NÃO';
        SGD_Permissoes.Cells[0,9]   := '+-------Tipos                                                   '; SGD_Permissoes.Cells[2,9]   := 'Tipos1                                        '; SGD_Permissoes.Cells[1,9]   := 'NÃO';
        SGD_Permissoes.Cells[0,10]  := '+-------Famílias                                                '; SGD_Permissoes.Cells[2,10]  := 'Familias1                                     '; SGD_Permissoes.Cells[1,10]  := 'NÃO';
        SGD_Permissoes.Cells[0,11]  := '+-------Histórico de Saída e Entrada por Produto                '; SGD_Permissoes.Cells[2,11]  := 'Histrico1                                     '; SGD_Permissoes.Cells[1,11]  := 'NÃO';
        SGD_Permissoes.Cells[0,12]  := '+-----Impostos / Taxas                                          '; SGD_Permissoes.Cells[2,12]  := 'ImpostosTaxas1                                '; SGD_Permissoes.Cells[1,12]  := 'NÃO';
        SGD_Permissoes.Cells[0,13]  := '+-------PIS                                                     '; SGD_Permissoes.Cells[2,13]  := 'Pis1                                          '; SGD_Permissoes.Cells[1,13]  := 'NÃO';
        SGD_Permissoes.Cells[0,14]  := '+-------COFINS                                                  '; SGD_Permissoes.Cells[2,14]  := 'Cofins1                                       '; SGD_Permissoes.Cells[1,14]  := 'NÃO';
        SGD_Permissoes.Cells[0,15]  := '+-------ICMS                                                    '; SGD_Permissoes.Cells[2,15]  := 'ICMS1                                         '; SGD_Permissoes.Cells[1,15]  := 'NÃO';
        SGD_Permissoes.Cells[0,16]  := '+-------CSLL                                                    '; SGD_Permissoes.Cells[2,16]  := 'CSLL1                                         '; SGD_Permissoes.Cells[1,16]  := 'NÃO';
        SGD_Permissoes.Cells[0,17]  := '+-------IRPJ                                                    '; SGD_Permissoes.Cells[2,17]  := 'IRPJ1                                         '; SGD_Permissoes.Cells[1,17]  := 'NÃO';
        SGD_Permissoes.Cells[0,18]  := '+-------IPI                                                     '; SGD_Permissoes.Cells[2,18]  := 'IPI1                                          '; SGD_Permissoes.Cells[1,18]  := 'NÃO';
        SGD_Permissoes.Cells[0,19]  := '+-----Transportadoras                                           '; SGD_Permissoes.Cells[2,19]  := 'Transportadora1                               '; SGD_Permissoes.Cells[1,19]  := 'NÃO';
        SGD_Permissoes.Cells[0,20]  := '+-----Representantes                                            '; SGD_Permissoes.Cells[2,20]  := 'Representantes1                               '; SGD_Permissoes.Cells[1,20]  := 'NÃO';
        SGD_Permissoes.Cells[0,21]  := '+-----Bancos                                                    '; SGD_Permissoes.Cells[2,21]  := 'Bancos1                                       '; SGD_Permissoes.Cells[1,21]  := 'NÃO';
        SGD_Permissoes.Cells[0,22]  := '+-----Industrial                                                '; SGD_Permissoes.Cells[2,22]  := 'Industrial1                                   '; SGD_Permissoes.Cells[1,22]  := 'NÃO';
        SGD_Permissoes.Cells[0,23]  := '+-------Etapas                                                  '; SGD_Permissoes.Cells[2,23]  := 'Etapas1                                       '; SGD_Permissoes.Cells[1,23]  := 'NÃO';
        SGD_Permissoes.Cells[0,24]  := '+-------Processos                                               '; SGD_Permissoes.Cells[2,24]  := 'Processos1                                    '; SGD_Permissoes.Cells[1,24]  := 'NÃO';
        SGD_Permissoes.Cells[0,25]  := '+-------Sub-Processos                                           '; SGD_Permissoes.Cells[2,25]  := 'SubProcessos1                                 '; SGD_Permissoes.Cells[1,25]  := 'NÃO';
        SGD_Permissoes.Cells[0,26]  := '+-----Departamentos                                             '; SGD_Permissoes.Cells[2,26]  := 'Departamentos1                                '; SGD_Permissoes.Cells[1,26]  := 'NÃO';
        SGD_Permissoes.Cells[0,27]  := '+-----Naturezas de Operação                                     '; SGD_Permissoes.Cells[2,27]  := 'NaturezasdeOperao1                            '; SGD_Permissoes.Cells[1,27]  := 'NÃO';
        SGD_Permissoes.Cells[0,28]  := '\---Sair                                                        '; SGD_Permissoes.Cells[2,28]  := 'Sair2                                         '; SGD_Permissoes.Cells[1,28]  := 'NÃO';
        SGD_Permissoes.Cells[0,29]  := '/---Depto.Pessoal                                               '; SGD_Permissoes.Cells[2,29]  := 'DeptoPessoal1                                 '; SGD_Permissoes.Cells[1,29]  := 'NÃO';
        SGD_Permissoes.Cells[0,30]  := '\-----Funcionários                                              '; SGD_Permissoes.Cells[2,30]  := 'Funcionrios1                                  '; SGD_Permissoes.Cells[1,30]  := 'NÃO';
        SGD_Permissoes.Cells[0,31]  := '/---Vendas                                                      '; SGD_Permissoes.Cells[2,31]  := 'SAC1                                          '; SGD_Permissoes.Cells[1,31]  := 'NÃO';
        SGD_Permissoes.Cells[0,32]  := '+-----Registro de Ligações                                      '; SGD_Permissoes.Cells[2,32]  := 'InformacoesAtendimentoClientes1               '; SGD_Permissoes.Cells[1,32]  := 'NÃO';
        SGD_Permissoes.Cells[0,33]  := '+-----OS (Ordem de Serviço)                                     '; SGD_Permissoes.Cells[2,33]  := 'Pedidos3                                      '; SGD_Permissoes.Cells[1,33]  := 'NÃO';
        SGD_Permissoes.Cells[0,34]  := '+-----OS Enviados para Faturamento                              '; SGD_Permissoes.Cells[2,34]  := 'PedidosEnviadosparaFaturamento1               '; SGD_Permissoes.Cells[1,34]  := 'NÃO';
        SGD_Permissoes.Cells[0,35]  := '+-----Histórico de Compras                                      '; SGD_Permissoes.Cells[2,35]  := 'HistricodeCompras1                            '; SGD_Permissoes.Cells[1,35]  := 'NÃO';
        SGD_Permissoes.Cells[0,36]  := '+-----Histórico de Compras por Produto                          '; SGD_Permissoes.Cells[2,36]  := 'HistricodeComprasporProduto2                  '; SGD_Permissoes.Cells[1,36]  := 'NÃO';
        SGD_Permissoes.Cells[0,37]  := '+-----Mapa de Produção                                          '; SGD_Permissoes.Cells[2,37]  := 'MapadeProduo1                                 '; SGD_Permissoes.Cells[1,37]  := 'NÃO';
        SGD_Permissoes.Cells[0,38]  := '+-----OS Pendentes                                              '; SGD_Permissoes.Cells[2,38]  := 'PedidosPendentes1                             '; SGD_Permissoes.Cells[1,38]  := 'NÃO';
        SGD_Permissoes.Cells[0,39]  := '\-----OS Registro Geral                                         '; SGD_Permissoes.Cells[2,39]  := 'OSRegistroGeral1                              '; SGD_Permissoes.Cells[1,39]  := 'NÃO';
        SGD_Permissoes.Cells[0,40]  := '/---Produção                                                    '; SGD_Permissoes.Cells[2,40]  := 'Produo1                                       '; SGD_Permissoes.Cells[1,40]  := 'NÃO';
        SGD_Permissoes.Cells[0,41]  := '+-----(PCP) Fila de Espera                                      '; SGD_Permissoes.Cells[2,41]  := 'FiladeEspera1                                 '; SGD_Permissoes.Cells[1,41]  := 'NÃO';
        SGD_Permissoes.Cells[0,42]  := '\-----Fila de Produção                                          '; SGD_Permissoes.Cells[2,42]  := 'FiladeProduo1                                 '; SGD_Permissoes.Cells[1,42]  := 'NÃO';
        SGD_Permissoes.Cells[0,43]  := '/---Notas Fiscais                                               '; SGD_Permissoes.Cells[2,43]  := 'NotasFiscais1                                 '; SGD_Permissoes.Cells[1,43]  := 'NÃO';
        SGD_Permissoes.Cells[0,44]  := '+-----Emissão de Notas Fiscais                                  '; SGD_Permissoes.Cells[2,44]  := 'EmissaoNotasFiscais1                          '; SGD_Permissoes.Cells[1,44]  := 'NÃO';
        SGD_Permissoes.Cells[0,45]  := '+-------Nota Fiscal Eletrônica (NFe)                            '; SGD_Permissoes.Cells[2,45]  := 'NotaFiscalEletrnicaNFe1                       '; SGD_Permissoes.Cells[1,45]  := 'NÃO';
        SGD_Permissoes.Cells[0,46]  := '+-------Nota Fiscal Eletrônica (Manual) (NFe)                   '; SGD_Permissoes.Cells[2,46]  := 'NotaFiscalEletrnicaManualNFe1                 '; SGD_Permissoes.Cells[1,46]  := 'NÃO';
        SGD_Permissoes.Cells[0,47]  := '+-------Saídas                                                  '; SGD_Permissoes.Cells[2,47]  := 'Saida1                                        '; SGD_Permissoes.Cells[1,47]  := 'NÃO';
        SGD_Permissoes.Cells[0,48]  := '+-------Entradas (Somente Registro das NFs dos Fornecedores)    '; SGD_Permissoes.Cells[2,48]  := 'Entrada1                                      '; SGD_Permissoes.Cells[1,48]  := 'NÃO';
        SGD_Permissoes.Cells[0,49]  := '+-------Registro de Notas Fiscais (Manual-Saída/Entrada Empresa)'; SGD_Permissoes.Cells[2,49]  := 'SadasManualmente1                             '; SGD_Permissoes.Cells[1,49]  := 'NÃO';
        SGD_Permissoes.Cells[0,50]  := '+-------Registro de Papeletas (Manual)                          '; SGD_Permissoes.Cells[2,50]  := 'RegistrodePapeletasManual1                    '; SGD_Permissoes.Cells[1,50]  := 'NÃO';
        SGD_Permissoes.Cells[0,51]  := '+-----Manutenção de Nota Fiscal Anterior                        '; SGD_Permissoes.Cells[2,51]  := 'ManutencaodeNotaFiscalAnterior1               '; SGD_Permissoes.Cells[1,51]  := 'NÃO';
        SGD_Permissoes.Cells[0,52]  := '+-----Cancelamento de Notas Fiscais                             '; SGD_Permissoes.Cells[2,52]  := 'CancelamentodeNotasFiscais1                   '; SGD_Permissoes.Cells[1,52]  := 'NÃO';
        SGD_Permissoes.Cells[0,53]  := '+-------Saídas                                                  '; SGD_Permissoes.Cells[2,53]  := 'Sadas1                                        '; SGD_Permissoes.Cells[1,53]  := 'NÃO';
        SGD_Permissoes.Cells[0,54]  := '+-------Entradas                                                '; SGD_Permissoes.Cells[2,54]  := 'Entradas1                                     '; SGD_Permissoes.Cells[1,54]  := 'NÃO';
        SGD_Permissoes.Cells[0,55]  := '+-------Ordens de Serviço                                       '; SGD_Permissoes.Cells[2,55]  := 'Papeletas1                                    '; SGD_Permissoes.Cells[1,55]  := 'NÃO';
        SGD_Permissoes.Cells[0,56]  := '+-------Pedidos                                                 '; SGD_Permissoes.Cells[2,56]  := 'Pedidos2                                      '; SGD_Permissoes.Cells[1,56]  := 'NÃO';
        SGD_Permissoes.Cells[0,57]  := '+-------Pedidos à Faturar                                       '; SGD_Permissoes.Cells[2,57]  := 'PedidosFaturar1                               '; SGD_Permissoes.Cells[1,57]  := 'NÃO';
        SGD_Permissoes.Cells[0,58]  := '+-------Retornar Pedidos Já Faturados                           '; SGD_Permissoes.Cells[2,58]  := 'RetornarPedidosJFaturados1                    '; SGD_Permissoes.Cells[1,58]  := 'NÃO';
        SGD_Permissoes.Cells[0,59]  := '+-----Ordem de Despacho / Etiqueta SEDEX                        '; SGD_Permissoes.Cells[2,59]  := 'OrdemdeDespachoEtiquetaSEDEX1                 '; SGD_Permissoes.Cells[1,59]  := 'NÃO';
        SGD_Permissoes.Cells[0,60]  := '+-----Histórico de Notas Fiscais                                '; SGD_Permissoes.Cells[2,60]  := 'HistoricodeNotasFiscaisPapeletas1             '; SGD_Permissoes.Cells[1,60]  := 'NÃO';
        SGD_Permissoes.Cells[0,61]  := '+-------Saídas                                                  '; SGD_Permissoes.Cells[2,61]  := 'Sadas3                                        '; SGD_Permissoes.Cells[1,61]  := 'NÃO';
        SGD_Permissoes.Cells[0,62]  := '+-------Entradas                                                '; SGD_Permissoes.Cells[2,62]  := 'Entradas3                                     '; SGD_Permissoes.Cells[1,62]  := 'NÃO';
        SGD_Permissoes.Cells[0,63]  := '+-------Ordens de Serviço                                       '; SGD_Permissoes.Cells[2,63]  := 'Papeletas3                                    '; SGD_Permissoes.Cells[1,63]  := 'NÃO';
        SGD_Permissoes.Cells[0,64]  := '\-----Controle de Saída de Mercadorias                          '; SGD_Permissoes.Cells[2,64]  := 'RelatriodeSadas1                              '; SGD_Permissoes.Cells[1,64]  := 'NÃO';
        SGD_Permissoes.Cells[0,65]  := '/---Cobrança                                                    '; SGD_Permissoes.Cells[2,65]  := 'Cobranca1                                     '; SGD_Permissoes.Cells[1,65]  := 'NÃO';
        SGD_Permissoes.Cells[0,66]  := '+-----Emissão de Duplicatas                                     '; SGD_Permissoes.Cells[2,66]  := 'EmissaodeTitulos1                             '; SGD_Permissoes.Cells[1,66]  := 'NÃO';
        SGD_Permissoes.Cells[0,67]  := '+-------Automática                                              '; SGD_Permissoes.Cells[2,67]  := 'Boletos1                                      '; SGD_Permissoes.Cells[1,67]  := 'NÃO';
        SGD_Permissoes.Cells[0,68]  := '+-------Manual                                                  '; SGD_Permissoes.Cells[2,68]  := 'Avulsos1                                      '; SGD_Permissoes.Cells[1,68]  := 'NÃO';
        SGD_Permissoes.Cells[0,69]  := '+-------Cancelamento de Duplicata Manual                        '; SGD_Permissoes.Cells[2,69]  := 'CancelamentodeBoletoAvulso1                   '; SGD_Permissoes.Cells[1,69]  := 'NÃO';
        SGD_Permissoes.Cells[0,70]  := '+-----Baixa de Cobrança                                         '; SGD_Permissoes.Cells[2,70]  := 'BaixadeCobrana1                               '; SGD_Permissoes.Cells[1,70]  := 'NÃO';
        SGD_Permissoes.Cells[0,71]  := '+-----Alteração de Banco na Duplicata                           '; SGD_Permissoes.Cells[2,71]  := 'AlteraodeBanconaCobrana1                      '; SGD_Permissoes.Cells[1,71]  := 'NÃO';
        SGD_Permissoes.Cells[0,72]  := '+-----Desdobramento de Duplicatas                               '; SGD_Permissoes.Cells[2,72]  := 'DesdobramentodeDuplicatas1                    '; SGD_Permissoes.Cells[1,72]  := 'NÃO';
        SGD_Permissoes.Cells[0,73]  := '+-----Liberação de Crédito                                      '; SGD_Permissoes.Cells[2,73]  := 'LiberaodeCrdito1                              '; SGD_Permissoes.Cells[1,73]  := 'NÃO';
        SGD_Permissoes.Cells[0,74]  := '+-----Arquivos de Transmissão                                   '; SGD_Permissoes.Cells[2,74]  := 'ArquivosdeTransmisso1                         '; SGD_Permissoes.Cells[1,74]  := 'NÃO';
        SGD_Permissoes.Cells[0,75]  := '\-------Geração do Arquivo de Integração - CONTMATIC            '; SGD_Permissoes.Cells[2,75]  := 'GeraodoArquivodeIntegraoCONTMATIC1            '; SGD_Permissoes.Cells[1,75]  := 'NÃO';
        SGD_Permissoes.Cells[0,76]  := '/---Contas a Pagar                                              '; SGD_Permissoes.Cells[2,76]  := 'ContasaPagar1                                 '; SGD_Permissoes.Cells[1,76]  := 'NÃO';
        SGD_Permissoes.Cells[0,77]  := '+-----Contas Bancárias                                          '; SGD_Permissoes.Cells[2,77]  := 'ContasBancrias1                               '; SGD_Permissoes.Cells[1,77]  := 'NÃO';
        SGD_Permissoes.Cells[0,78]  := '+-----Saldos                                                    '; SGD_Permissoes.Cells[2,78]  := 'Saldos1                                       '; SGD_Permissoes.Cells[1,78]  := 'NÃO';
        SGD_Permissoes.Cells[0,79]  := '+-----Títulos Fixos                                             '; SGD_Permissoes.Cells[2,79]  := 'tulosFixos1                                   '; SGD_Permissoes.Cells[1,79]  := 'NÃO';
        SGD_Permissoes.Cells[0,80]  := '+-----Títulos Avulsos (Contas a Pagar)                          '; SGD_Permissoes.Cells[2,80]  := 'tulosAvulsos1                                 '; SGD_Permissoes.Cells[1,80]  := 'NÃO';
        SGD_Permissoes.Cells[0,81]  := '+-----Relatório de Contas a Pagar                               '; SGD_Permissoes.Cells[2,81]  := 'RelatriodeContasaPagar1                       '; SGD_Permissoes.Cells[1,81]  := 'NÃO';
        SGD_Permissoes.Cells[0,82]  := '\-----Relatório Comparativo - Contas a Pagar / Contas a Receber '; SGD_Permissoes.Cells[2,82]  := 'RelatrioComparativoContasaPagarContasaReceber1'; SGD_Permissoes.Cells[1,82]  := 'NÃO';
        SGD_Permissoes.Cells[0,83]  := '/---Compras                                                     '; SGD_Permissoes.Cells[2,83]  := 'Compras1                                      '; SGD_Permissoes.Cells[1,83]  := 'NÃO';
        SGD_Permissoes.Cells[0,84]  := '+-----Requisições                                               '; SGD_Permissoes.Cells[2,84]  := 'Requisicoes                                   '; SGD_Permissoes.Cells[1,84]  := 'NÃO';
        SGD_Permissoes.Cells[0,85]  := '+-----Cotação                                                   '; SGD_Permissoes.Cells[2,85]  := 'Cotao1                                        '; SGD_Permissoes.Cells[1,85]  := 'NÃO';
        SGD_Permissoes.Cells[0,86]  := '+-----Ordem de Compra                                           '; SGD_Permissoes.Cells[2,86]  := 'OrdemdeCompra1                                '; SGD_Permissoes.Cells[1,86]  := 'NÃO';
        SGD_Permissoes.Cells[0,87]  := '+-----Nota de Entrada                                           '; SGD_Permissoes.Cells[2,87]  := 'NotadeEntrada1                                '; SGD_Permissoes.Cells[1,87]  := 'NÃO';
        SGD_Permissoes.Cells[0,88]  := '+-----Relação de Produtos Comprados                             '; SGD_Permissoes.Cells[2,88]  := 'RelaodeProdutosComprados1                     '; SGD_Permissoes.Cells[1,88]  := 'NÃO';
        SGD_Permissoes.Cells[0,89]  := '\-----Produtos dos Fornecedores                                 '; SGD_Permissoes.Cells[2,89]  := 'ProdutosdosFornecedores1                      '; SGD_Permissoes.Cells[1,89]  := 'NÃO';
        SGD_Permissoes.Cells[0,90]  := '\-----Ordens de Compra Finalizadas                              '; SGD_Permissoes.Cells[2,90]  := 'OrdemdeCompraporPeriodo1                      '; SGD_Permissoes.Cells[1,90]  := 'NÃO';
        SGD_Permissoes.Cells[0,91]  := '/---Estoque                                                     '; SGD_Permissoes.Cells[2,91]  := 'Estoque1                                      '; SGD_Permissoes.Cells[1,91]  := 'NÃO';
        SGD_Permissoes.Cells[0,92]  := '+-----Manutenção                                                '; SGD_Permissoes.Cells[2,92]  := 'Manuteno1                                     '; SGD_Permissoes.Cells[1,92]  := 'NÃO';
        SGD_Permissoes.Cells[0,93]  := '\-----Exclusão de Movimento                                     '; SGD_Permissoes.Cells[2,93]  := 'ExclusodeMovimento1                           '; SGD_Permissoes.Cells[1,93]  := 'NÃO';
        SGD_Permissoes.Cells[0,94]  := '/---Etiquetas                                                   '; SGD_Permissoes.Cells[2,94]  := 'Etiquetas1                                    '; SGD_Permissoes.Cells[1,94]  := 'NÃO';
        SGD_Permissoes.Cells[0,95]  := '+-----Clientes                                                  '; SGD_Permissoes.Cells[2,95]  := 'Clientes3                                     '; SGD_Permissoes.Cells[1,95]  := 'NÃO';
        SGD_Permissoes.Cells[0,96]  := '+-----Representantes                                            '; SGD_Permissoes.Cells[2,96]  := 'Representantes2                               '; SGD_Permissoes.Cells[1,96]  := 'NÃO';
        SGD_Permissoes.Cells[0,97]  := '+-----Avulsas                                                   '; SGD_Permissoes.Cells[2,97]  := 'Avulsas1                                      '; SGD_Permissoes.Cells[1,97]  := 'NÃO';
        SGD_Permissoes.Cells[0,98]  := '\-----Etiquetas SEDEX                                           '; SGD_Permissoes.Cells[2,98]  := 'EtiquetaSEDEX1                                '; SGD_Permissoes.Cells[1,98]  := 'NÃO';
        SGD_Permissoes.Cells[0,99]  := '/---Relatórios                                                  '; SGD_Permissoes.Cells[2,99]  := 'Relatorios1                                   '; SGD_Permissoes.Cells[1,99]  := 'NÃO';
        SGD_Permissoes.Cells[0,100] := '+-----Estoque                                                   '; SGD_Permissoes.Cells[2,100] := 'Estoque2                                      '; SGD_Permissoes.Cells[1,100] := 'NÃO';
        SGD_Permissoes.Cells[0,101] := '+-------Movimento de Estoque                                    '; SGD_Permissoes.Cells[2,101] := 'MovimentodeEstoque1                           '; SGD_Permissoes.Cells[1,101] := 'NÃO';
        SGD_Permissoes.Cells[0,102] := '+-------Estoque de Produtos                                     '; SGD_Permissoes.Cells[2,102] := 'EstoquedeProdutos1                            '; SGD_Permissoes.Cells[1,102] := 'NÃO';
        SGD_Permissoes.Cells[0,103] := '+-------Inventário                                              '; SGD_Permissoes.Cells[2,103] := 'Inventrio1                                    '; SGD_Permissoes.Cells[1,103] := 'NÃO';
        SGD_Permissoes.Cells[0,104] := '+-------Pedido de Compra                                        '; SGD_Permissoes.Cells[2,104] := 'PedidodeCompra1                               '; SGD_Permissoes.Cells[1,104] := 'NÃO';
        SGD_Permissoes.Cells[0,105] := '+-----Ibrasmak                                                  '; SGD_Permissoes.Cells[2,105] := 'Ibrasmak1                                     '; SGD_Permissoes.Cells[1,105] := 'NÃO';
        SGD_Permissoes.Cells[0,106] := '+-------Cobrança                                                '; SGD_Permissoes.Cells[2,106] := 'Cobrana1                                      '; SGD_Permissoes.Cells[1,106] := 'NÃO';
        SGD_Permissoes.Cells[0,107] := '+---------Notas Fiscais                                         '; SGD_Permissoes.Cells[2,107] := 'NotasFiscais3                                 '; SGD_Permissoes.Cells[1,107] := 'NÃO';
        SGD_Permissoes.Cells[0,108] := '+-----------Contas a Receber                                    '; SGD_Permissoes.Cells[2,108] := 'ContasaReceber1                               '; SGD_Permissoes.Cells[1,108] := 'NÃO';
        SGD_Permissoes.Cells[0,109] := '+---------Orçamentos                                            '; SGD_Permissoes.Cells[2,109] := 'Papeletas5                                    '; SGD_Permissoes.Cells[1,109] := 'NÃO';
        SGD_Permissoes.Cells[0,110] := '+-----------Contas a Receber                                    '; SGD_Permissoes.Cells[2,110] := 'ContasaReceber2                               '; SGD_Permissoes.Cells[1,110] := 'NÃO';
        SGD_Permissoes.Cells[0,111] := '+-------Comissões                                               '; SGD_Permissoes.Cells[2,111] := 'Comisses1                                     '; SGD_Permissoes.Cells[1,111] := 'NÃO';
        SGD_Permissoes.Cells[0,112] := '+---------Cálculo das Comissões                                 '; SGD_Permissoes.Cells[2,112] := 'VendasdosRepresentantes1                      '; SGD_Permissoes.Cells[1,112] := 'NÃO';
        SGD_Permissoes.Cells[0,113] := '+-----------Notas Fiscais                                       '; SGD_Permissoes.Cells[2,113] := 'NotasFiscais2                                 '; SGD_Permissoes.Cells[1,113] := 'NÃO';
        SGD_Permissoes.Cells[0,114] := '+-----------OS (Ordens de Serviço)                              '; SGD_Permissoes.Cells[2,114] := 'OrdensdeServio1                               '; SGD_Permissoes.Cells[1,114] := 'NÃO';
        SGD_Permissoes.Cells[0,115] := '+-------Faturamento                                             '; SGD_Permissoes.Cells[2,115] := 'Faturamento2                                  '; SGD_Permissoes.Cells[1,115] := 'NÃO';
        SGD_Permissoes.Cells[0,116] := '+---------Outras Saídas                                         '; SGD_Permissoes.Cells[2,116] := 'OutrasSadas1                                  '; SGD_Permissoes.Cells[1,116] := 'NÃO';
        SGD_Permissoes.Cells[0,117] := '+---------Saídas                                                '; SGD_Permissoes.Cells[2,117] := 'Sadas5                                        '; SGD_Permissoes.Cells[1,117] := 'NÃO';
        SGD_Permissoes.Cells[0,118] := '+---------Vendas por Período                                    '; SGD_Permissoes.Cells[2,118] := 'VendasporPerodo1                              '; SGD_Permissoes.Cells[1,118] := 'NÃO';
        SGD_Permissoes.Cells[0,119] := '+---------OS (Ordens de Serviço)                                '; SGD_Permissoes.Cells[2,119] := 'OSOrdensdeServio2                             '; SGD_Permissoes.Cells[1,119] := 'NÃO';
        SGD_Permissoes.Cells[0,120] := '+-------Impostos                                                '; SGD_Permissoes.Cells[2,120] := 'Impstos1                                      '; SGD_Permissoes.Cells[1,120] := 'NÃO';
        SGD_Permissoes.Cells[0,121] := '+---------PIS                                                   '; SGD_Permissoes.Cells[2,121] := 'Pis2                                          '; SGD_Permissoes.Cells[1,121] := 'NÃO';
        SGD_Permissoes.Cells[0,122] := '+---------COFINS                                                '; SGD_Permissoes.Cells[2,122] := 'Cofins2                                       '; SGD_Permissoes.Cells[1,122] := 'NÃO';
        SGD_Permissoes.Cells[0,123] := '+---------ICMS                                                  '; SGD_Permissoes.Cells[2,123] := 'ICMS2                                         '; SGD_Permissoes.Cells[1,123] := 'NÃO';
        SGD_Permissoes.Cells[0,124] := '+---------CSLL                                                  '; SGD_Permissoes.Cells[2,124] := 'CSLL2                                         '; SGD_Permissoes.Cells[1,124] := 'NÃO';
        SGD_Permissoes.Cells[0,125] := '+---------IRPJ                                                  '; SGD_Permissoes.Cells[2,125] := 'IRPJ2                                         '; SGD_Permissoes.Cells[1,125] := 'NÃO';
        SGD_Permissoes.Cells[0,126] := '+---------IPI                                                   '; SGD_Permissoes.Cells[2,126] := 'IPI2                                          '; SGD_Permissoes.Cells[1,126] := 'NÃO';
        SGD_Permissoes.Cells[0,127] := '+-------Maiores clientes por valor vendido                      '; SGD_Permissoes.Cells[2,127] := 'MaioresClientesPorValorVendido1               '; SGD_Permissoes.Cells[1,127] := 'NÃO';
        SGD_Permissoes.Cells[0,128] := '+-------Vendas por Estados/Representantes                       '; SGD_Permissoes.Cells[2,128] := 'VendasporEstadosRepresentantes1               '; SGD_Permissoes.Cells[1,128] := 'NÃO';
        SGD_Permissoes.Cells[0,129] := '+-----Monibras                                                  '; SGD_Permissoes.Cells[2,129] := 'Monibras1                                     '; SGD_Permissoes.Cells[1,129] := 'NÃO';
        SGD_Permissoes.Cells[0,130] := '+-------Cobrança                                                '; SGD_Permissoes.Cells[2,130] := 'Cobrana2                                      '; SGD_Permissoes.Cells[1,130] := 'NÃO';
        SGD_Permissoes.Cells[0,131] := '+---------Notas Fiscais                                         '; SGD_Permissoes.Cells[2,131] := 'NotasFiscais4                                 '; SGD_Permissoes.Cells[1,131] := 'NÃO';
        SGD_Permissoes.Cells[0,132] := '+-----------Contas a Receber                                    '; SGD_Permissoes.Cells[2,132] := 'ContasaReceber4                               '; SGD_Permissoes.Cells[1,132] := 'NÃO';
        SGD_Permissoes.Cells[0,133] := '+---------Orçamentos                                            '; SGD_Permissoes.Cells[2,133] := 'Oramentos1                                    '; SGD_Permissoes.Cells[1,133] := 'NÃO';
        SGD_Permissoes.Cells[0,134] := '+-----------Contas a Receber                                    '; SGD_Permissoes.Cells[2,134] := 'ContasaReceber3                               '; SGD_Permissoes.Cells[1,134] := 'NÃO';
        SGD_Permissoes.Cells[0,135] := '+-------Comissões                                               '; SGD_Permissoes.Cells[2,135] := 'Comisses2                                     '; SGD_Permissoes.Cells[1,135] := 'NÃO';
        SGD_Permissoes.Cells[0,136] := '+---------Cálculo das Comissões                                 '; SGD_Permissoes.Cells[2,136] := 'ClculodasComisses1                            '; SGD_Permissoes.Cells[1,136] := 'NÃO';
        SGD_Permissoes.Cells[0,137] := '+-----------Notas Fiscais                                       '; SGD_Permissoes.Cells[2,137] := 'NotasFiscais5                                 '; SGD_Permissoes.Cells[1,137] := 'NÃO';
        SGD_Permissoes.Cells[0,138] := '+-----------OS (Ordens de Serviço)                              '; SGD_Permissoes.Cells[2,138] := 'OSOrdensdeServio1                             '; SGD_Permissoes.Cells[1,138] := 'NÃO';
        SGD_Permissoes.Cells[0,139] := '+-------Faturamento                                             '; SGD_Permissoes.Cells[2,139] := 'Faturamento1                                  '; SGD_Permissoes.Cells[1,139] := 'NÃO';
        SGD_Permissoes.Cells[0,140] := '+---------Outras Saídas                                         '; SGD_Permissoes.Cells[2,140] := 'OutrasSadas2                                  '; SGD_Permissoes.Cells[1,140] := 'NÃO';
        SGD_Permissoes.Cells[0,141] := '+---------Saídas                                                '; SGD_Permissoes.Cells[2,141] := 'Sadas2                                        '; SGD_Permissoes.Cells[1,141] := 'NÃO';
        SGD_Permissoes.Cells[0,142] := '+---------Vendas por Período                                    '; SGD_Permissoes.Cells[2,142] := 'VendasporPerodo2                              '; SGD_Permissoes.Cells[1,142] := 'NÃO';
        SGD_Permissoes.Cells[0,143] := '+---------OS (Ordens de Serviço)                                '; SGD_Permissoes.Cells[2,143] := 'OSOrdensdeServio3                             '; SGD_Permissoes.Cells[1,143] := 'NÃO';
        SGD_Permissoes.Cells[0,144] := '+-------Impostos                                                '; SGD_Permissoes.Cells[2,144] := 'Impostos1                                     '; SGD_Permissoes.Cells[1,144] := 'NÃO';
        SGD_Permissoes.Cells[0,145] := '+---------PIS                                                   '; SGD_Permissoes.Cells[2,145] := 'PIS3                                          '; SGD_Permissoes.Cells[1,145] := 'NÃO';
        SGD_Permissoes.Cells[0,146] := '+---------COFINS                                                '; SGD_Permissoes.Cells[2,146] := 'COFINS3                                       '; SGD_Permissoes.Cells[1,146] := 'NÃO';
        SGD_Permissoes.Cells[0,147] := '+---------ICMS                                                  '; SGD_Permissoes.Cells[2,147] := 'ICMS3                                         '; SGD_Permissoes.Cells[1,147] := 'NÃO';
        SGD_Permissoes.Cells[0,148] := '+---------CSLL                                                  '; SGD_Permissoes.Cells[2,148] := 'CSLL3                                         '; SGD_Permissoes.Cells[1,148] := 'NÃO';
        SGD_Permissoes.Cells[0,149] := '+---------IRPJ                                                  '; SGD_Permissoes.Cells[2,149] := 'IRPJ3                                         '; SGD_Permissoes.Cells[1,149] := 'NÃO';
        SGD_Permissoes.Cells[0,150] := '+---------IPI                                                   '; SGD_Permissoes.Cells[2,150] := 'IPI3                                          '; SGD_Permissoes.Cells[1,150] := 'NÃO';
        SGD_Permissoes.Cells[0,151] := '+-------Maiores clientes por valor vendido                      '; SGD_Permissoes.Cells[2,151] := 'Maioresclientesporvalorvendido2               '; SGD_Permissoes.Cells[1,151] := 'NÃO';
        SGD_Permissoes.Cells[0,152] := '+-------Vendas por Estados/Representantes                       '; SGD_Permissoes.Cells[2,152] := 'VendasporEstadosRepresentantes2               '; SGD_Permissoes.Cells[1,152] := 'NÃO';
        SGD_Permissoes.Cells[0,153] := '\-------Fichas de Visita                                        '; SGD_Permissoes.Cells[2,153] := 'FichasdeVisita1                               '; SGD_Permissoes.Cells[1,153] := 'NÃO';
        SGD_Permissoes.Cells[0,154] := '/---Cancelamentos                                               '; SGD_Permissoes.Cells[2,154] := 'Cancelamento1                                 '; SGD_Permissoes.Cells[1,154] := 'NÃO';
        SGD_Permissoes.Cells[0,155] := '+-----Requisições                                               '; SGD_Permissoes.Cells[2,155] := 'Requisies1                                    '; SGD_Permissoes.Cells[1,155] := 'NÃO';
        SGD_Permissoes.Cells[0,156] := '+-----Cotações                                                  '; SGD_Permissoes.Cells[2,156] := 'Cotaes1                                       '; SGD_Permissoes.Cells[1,156] := 'NÃO';
        SGD_Permissoes.Cells[0,157] := '\-----Ordens de Compra                                          '; SGD_Permissoes.Cells[2,157] := 'OrdensdeCompra1                               '; SGD_Permissoes.Cells[1,157] := 'NÃO';
        SGD_Permissoes.Cells[0,158] := '+-----Funcionários                                              '; SGD_Permissoes.Cells[2,158] := 'Funcionrios2                                  '; SGD_Permissoes.Cells[1,158] := 'NÃO';
        SGD_Permissoes.Cells[0,159] := '+-----Clientes por Representante                                '; SGD_Permissoes.Cells[2,159] := 'ClientesporRepresentante1                     '; SGD_Permissoes.Cells[1,159] := 'NÃO';
        SGD_Permissoes.Cells[0,160] := '+-----Fornecedores                                              '; SGD_Permissoes.Cells[2,160] := 'Fornecedores2                                 '; SGD_Permissoes.Cells[1,160] := 'NÃO';
        SGD_Permissoes.Cells[0,161] := '/---Opções                                                      '; SGD_Permissoes.Cells[2,161] := 'Opcoes1                                       '; SGD_Permissoes.Cells[1,161] := 'NÃO';
        SGD_Permissoes.Cells[0,162] := '+-----Usuário                                                   '; SGD_Permissoes.Cells[2,162] := 'Usurio1                                       '; SGD_Permissoes.Cells[1,162] := 'NÃO';
        SGD_Permissoes.Cells[0,163] := '\-----Permissões                                                '; SGD_Permissoes.Cells[2,163] := 'Permisses1                                    '; SGD_Permissoes.Cells[1,163] := 'NÃO';
        SGD_Permissoes.Cells[0,164] := '/---Ajuda                                                       '; SGD_Permissoes.Cells[2,164] := 'Ajuda1                                        '; SGD_Permissoes.Cells[1,164] := 'NÃO';
        SGD_Permissoes.Cells[0,165] := '\-----Sobre...                                                  '; SGD_Permissoes.Cells[2,165] := 'Sobre1                                        '; SGD_Permissoes.Cells[1,165] := 'NÃO';
        SGD_Permissoes.Cells[0,166] := 'Sair                                                            '; SGD_Permissoes.Cells[2,166] := 'Sair1                                         '; SGD_Permissoes.Cells[1,166] := 'NÃO';

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
                       SGD_Permissoes.Cells[1,Posicao_Acesso] := 'NÃO'
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
     //*** Seleciona os Usuários ***

     ConexaoBD.SQL_Senhas.Close;
     ConexaoBD.SQL_Senhas.SQL.Clear;
     ConexaoBD.SQL_Senhas.SQL.Add('Select * from senhas Order By senha_usuario');
     ConexaoBD.SQL_Senhas.Open;

     CB_Usuarios.Items.Clear;
     CB_Usuarios.Items.Add('--------- Selecione um Usuário ---------');

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
     If Trim(CB_Usuarios.Text) <> '--------- Selecione um Usuário ---------' Then
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

               If Trim(SGD_Permissoes.Cells[1,Ind]) = 'NÃO' Then
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

               If Trim(SGD_Permissoes.Cells[1,Ind]) = 'NÃO' Then
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

        MSG_Erro('Alterações efetuadas para o Login: ' + Trim(CB_Usuarios.Text));

     End;
end;

procedure TPermissoes00.SGD_PermissoesDblClick(Sender: TObject);
begin
     If Trim(SGD_Permissoes.Cells[1,SGD_Permissoes.Row]) = 'SIM' Then
        Begin
        SGD_Permissoes.Cells[1,SGD_Permissoes.Row] := 'NÃO';
        End
     Else
        Begin
        SGD_Permissoes.Cells[1,SGD_Permissoes.Row] := 'SIM';
     End;
end;

end.
