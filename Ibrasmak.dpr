program Ibrasmak;

uses
  Forms,
  Dialogs,
  SysUtils,
  Windows,
  Ibrasmak_00 in 'Ibrasmak_00.pas' {Ibrasmak00},
  Rotinas_Gerais in 'Rotinas_Gerais.pas',
  Conexao_BD in 'Conexao_BD.pas' {ConexaoBD: TDataModule},
  SubProcessos_00 in 'SubProcessos_00.pas' {SubProcessos00},
  SubProcessos_01 in 'SubProcessos_01.pas' {SubProcessos01},
  SubProcessos_02 in 'SubProcessos_02.pas' {SubProcessos02},
  Representantes_00 in 'Representantes_00.pas' {Representantes00},
  Representantes_01 in 'Representantes_01.pas' {Representantes01},
  Representantes_02 in 'Representantes_02.pas' {Representantes02},
  Clientes_00 in 'Clientes_00.pas' {Clientes00},
  Clientes_01 in 'Clientes_01.pas' {Clientes01},
  Clientes_02 in 'Clientes_02.pas' {Clientes02},
  Transportadoras_00 in 'Transportadoras_00.pas' {Transportadoras00},
  Transportadoras_01 in 'Transportadoras_01.pas' {Transportadoras01},
  Transportadoras_02 in 'Transportadoras_02.pas' {Transportadoras02},
  Tipo_Produto_00 in 'Tipo_Produto_00.pas' {TipoProduto00},
  Tipo_Produto_01 in 'Tipo_Produto_01.pas' {TipoProduto01},
  Tipo_Produto_02 in 'Tipo_Produto_02.pas' {TipoProduto02},
  Familia_Produto_00 in 'Familia_Produto_00.pas' {FamiliaProduto00},
  Familia_Produto_01 in 'Familia_Produto_01.pas' {FamiliaProduto01},
  Familia_Produto_02 in 'Familia_Produto_02.pas' {FamiliaProduto02},
  Produtos_00 in 'Produtos_00.pas' {Produtos00},
  Produtos_01 in 'Produtos_01.pas' {Produtos01},
  Produtos_02 in 'Produtos_02.pas' {Produtos02},
  Splash_Screen in 'Splash_Screen.pas' {SplashScreen},
  Notas_Fiscais_Saidas_00 in 'Notas_Fiscais_Saidas_00.pas' {NotasFiscaisSaidas00},
  Notas_Fiscais_Saidas_01 in 'Notas_Fiscais_Saidas_01.pas' {NotasFiscaisSaidas01},
  Adiciona_Lote_Produto in 'Adiciona_Lote_Produto.pas' {AdicionaLoteProduto},
  MSG_NF_Etapa_01 in 'MSG_NF_Etapa_01.pas' {MSGNFEtapa01},
  MSG_NF_Etapa_02 in 'MSG_NF_Etapa_02.pas' {MSGNFEtapa02},
  MSG_NF_Etapa_03 in 'MSG_NF_Etapa_03.pas' {MSGNFEtapa03},
  MSG_NF_Etapa_04 in 'MSG_NF_Etapa_04.pas' {MSGNFEtapa04},
  Nota_Fiscal_Anterior_00 in 'Nota_Fiscal_Anterior_00.pas' {NotaFiscalAnterior00},
  Pedidos_00 in 'Pedidos_00.pas' {Pedidos00},
  Pedidos_01 in 'Pedidos_01.pas' {Pedidos01},
  Adiciona_Qtde_Produto in 'Adiciona_Qtde_Produto.pas' {AdicionaQtdeProduto},
  Adiciona_Produto_Relacao in 'Adiciona_Produto_Relacao.pas' {AdicionaProdutoRelacao},
  Pedidos_02 in 'Pedidos_02.pas' {Pedidos02},
  MSG_Adiciona_Cliente_Pedido in 'MSG_Adiciona_Cliente_Pedido.pas' {MSGAdicionaClientePedido},
  Sobre_00 in 'Sobre_00.pas' {Sobre00},
  Boletos_00 in 'Boletos_00.pas' {Boletos00},
  Boletos_01 in 'Boletos_01.pas' {Boletos01},
  Notas_Fiscais_Entradas_00 in 'Notas_Fiscais_Entradas_00.pas' {NotasFiscaisEntradas00},
  Desdobramento_Duplicatas_00 in 'Desdobramento_Duplicatas_00.pas' {DesdobramentoDuplicatas00},
  Estoque_00 in 'Estoque_00.pas' {Estoque00},
  Estoque_01 in 'Estoque_01.pas' {Estoque01},
  Login_00 in 'Login_00.pas' {Login00},
  Cancelamento_Saidas_00 in 'Cancelamento_Saidas_00.pas' {CancelamentoSaidas00},
  Cancelamento_Papeletas_00 in 'Cancelamento_Papeletas_00.pas' {CancelamentoPapeletas00},
  Cancelamento_Pedidos_00 in 'Cancelamento_Pedidos_00.pas' {CancelamentosPedidos00},
  Rel_Movimento_Estoque_01 in 'Rel_Movimento_Estoque_01.pas' {RelMovimentoEstoque01},
  Rel_Movimento_Estoque_00 in 'Rel_Movimento_Estoque_00.pas' {RelMovimentoEstoque00},
  Rel_Estoque_Produtos_00 in 'Rel_Estoque_Produtos_00.pas' {RelEstoqueProdutos00},
  Rel_Vendas_Representantes_01 in 'Rel_Vendas_Representantes_01.pas' {RelVendasRepresentantes01},
  Rel_Vendas_Representantes_00 in 'Rel_Vendas_Representantes_00.pas' {RelVendasRepresentantes00},
  Baixa_Cobranca_00 in 'Baixa_Cobranca_00.pas' {BaixaCobranca00},
  Rel_Vencidos_Papeleta_01 in 'Rel_Vencidos_Papeleta_01.pas' {RelVencidosPapeleta01},
  Rel_Vencidos_Nota_01 in 'Rel_Vencidos_Nota_01.pas' {RelVencidosNota01},
  Rel_Vencidos_Papeleta_00 in 'Rel_Vencidos_Papeleta_00.pas' {RelVencidosPapeleta00},
  Rel_Vencidos_Nota_00 in 'Rel_Vencidos_Nota_00.pas' {RelVencidosNota00},
  Rel_Faturamento_00 in 'Rel_Faturamento_00.pas' {RelFaturamento00},
  Rel_Faturamento_01 in 'Rel_Faturamento_01.pas' {RelFaturamento01},
  Rel_Fichas_Visitas_00 in 'Rel_Fichas_Visitas_00.pas' {RelFichasVisitas00},
  Rel_Fichas_Visitas_01 in 'Rel_Fichas_Visitas_01.pas' {RelFichasVisitas01},
  Rel_Venda_Estado_Representante_00 in 'Rel_Venda_Estado_Representante_00.pas' {RelVendaEstadoRepresentante00},
  Rel_Venda_Estado_Representante_01 in 'Rel_Venda_Estado_Representante_01.pas' {RelVendaEstadoRepresentante01},
  Historico_Clientes_00 in 'Historico_Clientes_00.pas' {HistoricoClientes00},
  Historico_Clientes_01 in 'Historico_Clientes_01.pas' {HistoricoClientes01},
  Historico_Clientes_02 in 'Historico_Clientes_02.pas' {HistoricoClientes02},
  Etiquetas_Clientes_00 in 'Etiquetas_Clientes_00.pas' {EtiquetasClientes00},
  Etiquetas_Representantes_00 in 'Etiquetas_Representantes_00.pas' {EtiquetasRepresentantes00},
  Etiquetas_Avulsas_00 in 'Etiquetas_Avulsas_00.pas' {EtiquetasAvulsas00},
  Usuario_00 in 'Usuario_00.pas' {Usuario00},
  Usuario_01 in 'Usuario_01.pas' {Usuario01},
  Usuario_02 in 'Usuario_02.pas' {Usuario02},
  Permissao_00 in 'Permissao_00.pas' {Permissoes00},
  Rel_Estoque_Produtos_01 in 'Rel_Estoque_Produtos_01.pas' {RelEstoqueProdutos01},
  Liberacao_Credito_00 in 'Liberacao_Credito_00.pas' {LiberacaoCredito00},
  Liberacao_Credito_01 in 'Liberacao_Credito_01.pas' {LiberacaoCredito01},
  Rel_Ctrl_Saida_Mercadoria_00 in 'Rel_Ctrl_Saida_Mercadoria_00.pas' {RelCtrlSaidaMercadoria00},
  Rel_Ctrl_Saida_Mercadoria_01 in 'Rel_Ctrl_Saida_Mercadoria_01.pas' {RelCtrlSaidaMercadoria01},
  Historico_Produtos_00 in 'Historico_Produtos_00.pas' {HistoricoProdutos00},
  Historico_Produtos_01 in 'Historico_Produtos_01.pas' {HistoricoProdutos01},
  Historico_Produtos_02 in 'Historico_Produtos_02.pas' {HistoricoProdutos02},
  Historico_Produtos_03 in 'Historico_Produtos_03.pas' {HistoricoProdutos03},
  Historico_Clientes_03 in 'Historico_Clientes_03.pas' {HistoricoClientes03},
  Taxas_Impostos_00 in 'Taxas_Impostos_00.pas' {TaxasImpostos00},
  Rel_Impostos_Pis_Cofins_00 in 'Rel_Impostos_Pis_Cofins_00.pas' {RelImpostosPisCofins00},
  Rel_Impostos_Pis_Cofins_01 in 'Rel_Impostos_Pis_Cofins_01.pas' {RelImpostosPisCofins01},
  Rel_Clientes_Valor_Vendido_00 in 'Rel_Clientes_Valor_Vendido_00.pas' {RelClientesValorVendido00},
  Rel_Clientes_Valor_Vendido_01 in 'Rel_Clientes_Valor_Vendido_01.pas' {RelClientesValorVendido01},
  Cancelamento_Boleto_Avulso_00 in 'Cancelamento_Boleto_Avulso_00.pas' {CancelamentoBoletoAvulso00},
  Arquivo_Integracao_00 in 'Arquivo_Integracao_00.pas' {ArquivoIntegracao00},
  Rel_Faturamento_Outras_Saidas_00 in 'Rel_Faturamento_Outras_Saidas_00.pas' {RelFaturamentoOutrasSaidas00},
  Rel_Faturamento_Outras_Saidas_01 in 'Rel_Faturamento_Outras_Saidas_01.pas' {RelFaturamentoOutrasSaidas01},
  Informacao_01 in 'Informacao_01.pas' {Informacao01},
  SAC_Historico_00 in 'SAC_Historico_00.pas' {SACHistorico00},
  Rel_Vendas_Periodo_00 in 'Rel_Vendas_Periodo_00.pas' {RelVendasPeriodo00},
  Rel_Vendas_Periodo_01 in 'Rel_Vendas_Periodo_01.pas' {RelVendasPeriodo01},
  Rel_Estoque_Inventario_00 in 'Rel_Estoque_Inventario_00.pas' {RelEstoqueInventario00},
  Rel_Estoque_Inventario_01 in 'Rel_Estoque_Inventario_01.pas' {RelEstoqueInventario01},
  Fornecedor_00 in 'Fornecedor_00.pas' {Fornecedor00},
  Fornecedor_01 in 'Fornecedor_01.pas' {Fornecedor01},
  Fornecedor_02 in 'Fornecedor_02.pas' {Fornecedor02},
  Pedido_03 in 'Pedido_03.pas' {Pedido03},
  Pedidos_04 in 'Pedidos_04.pas' {Pedidos04},
  Adiciona_Qtde_Produto_02 in 'Adiciona_Qtde_Produto_02.pas' {AdicionaQtdeProduto02},
  Altera_Banco_Cobranca_00 in 'Altera_Banco_Cobranca_00.pas' {AlteraBancoCobranca00},
  Cotacao_00 in 'Cotacao_00.pas' {Cotacao00},
  Cotacao_01 in 'Cotacao_01.pas' {Cotacao01},
  Cotacao_02 in 'Cotacao_02.pas' {Cotacao02},
  Cotacao_03 in 'Cotacao_03.pas' {Cotacao03},
  Adiciona_Fornecedor_Pedido in 'Adiciona_Fornecedor_Pedido.pas' {AdicionaFornecedorPedido},
  Cotacao_04 in 'Cotacao_04.pas' {Cotacao04},
  OrdemPeriodo_00 in 'OrdemPeriodo_00.pas' {OrdemPeriodo00},
  Ordem_01 in 'Ordem_01.pas' {Ordem01},
  Ordem_02 in 'Ordem_02.pas' {Ordem02},
  Cancelamento_Faturados_00 in 'Cancelamento_Faturados_00.pas' {CancelamentoFaturados00},
  Codigo_Produto_Nota_Cliente_00 in 'Codigo_Produto_Nota_Cliente_00.pas' {CodigoProdutoNotaCliente00},
  Cria_PDF in 'Cria_PDF.pas' {CriaPDF},
  Cria_OC_PDF in 'Cria_OC_PDF.pas' {CriaOCPDF},
  Ordem_Despacho_00 in 'Ordem_Despacho_00.pas' {OrdemDespacho00},
  Contas_Receber_00 in 'Contas_Receber_00.pas' {ContasReceber00},
  Contas_Receber_01 in 'Contas_Receber_01.pas' {ContasReceber01},
  Novo_Produto_Fornecedor_00 in 'Novo_Produto_Fornecedor_00.pas' {NovoProdutoFornecedor00},
  Conta_Bancaria_02 in 'Conta_Bancaria_02.pas' {ContaBancaria02},
  Fixo_00 in 'Fixo_00.pas' {Fixo00},
  Fixo_01 in 'Fixo_01.pas' {Fixo01},
  Fixo_02 in 'Fixo_02.pas' {Fixo02},
  Saldo_00 in 'Saldo_00.pas' {Saldo00},
  Saldo_01 in 'Saldo_01.pas' {Saldo01},
  Saldo_02 in 'Saldo_02.pas' {Saldo02},
  Avulso_00 in 'Avulso_00.pas' {Avulso00},
  Avulso_01 in 'Avulso_01.pas' {Avulso01},
  Avulso_02 in 'Avulso_02.pas' {Avulso02},
  Conta_Bancaria_00 in 'Conta_Bancaria_00.pas' {ContaBancaria00},
  Conta_Bancaria_01 in 'Conta_Bancaria_01.pas' {ContaBancaria01},
  V_Historico_Produtos_03 in 'V_Historico_Produtos_03.pas' {VHistoricoProdutos03},
  V_Historico_Clientes_00 in 'V_Historico_Clientes_00.pas' {VHistoricoClientes00},
  V_Historico_Clientes_01 in 'V_Historico_Clientes_01.pas' {VHistoricoClientes01},
  V_Historico_Clientes_02 in 'V_Historico_Clientes_02.pas' {VHistoricoClientes02},
  V_Historico_Clientes_03 in 'V_Historico_Clientes_03.pas' {VHistoricoClientes03},
  V_Historico_Produtos_00 in 'V_Historico_Produtos_00.pas' {VHistoricoProdutos00},
  V_Historico_Produtos_01 in 'V_Historico_Produtos_01.pas' {VHistoricoProdutos01},
  V_Historico_Produtos_02 in 'V_Historico_Produtos_02.pas' {VHistoricoProdutos02},
  Faturamento_00 in 'Faturamento_00.pas' {Faturamento00},
  Faturamento_01 in 'Faturamento_01.pas' {Faturamento01},
  Notas_Fiscais_Entradas_05 in 'Notas_Fiscais_Entradas_05.pas' {NotasFiscaisEntradas05},
  Notas_Fiscais_Entradas_01 in 'Notas_Fiscais_Entradas_01.pas' {NotasFiscaisEntradas01},
  Notas_Fiscais_Entradas_02 in 'Notas_Fiscais_Entradas_02.pas' {NotasFiscaisEntradas02},
  Notas_Fiscais_Entradas_03 in 'Notas_Fiscais_Entradas_03.pas' {NotasFiscaisEntradas03},
  Notas_Fiscais_Entradas_04 in 'Notas_Fiscais_Entradas_04.pas' {NotasFiscaisEntradas04},
  Contas_Receber_Orcamento_01 in 'Contas_Receber_Orcamento_01.pas' {ContasReceberOrcamento01},
  Contas_Receber_Orcamento_00 in 'Contas_Receber_Orcamento_00.pas' {ContasReceberOrcamento00},
  Rel_Contas_Pagar_01 in 'Rel_Contas_Pagar_01.pas' {RelContasPagar01},
  Rel_Contas_Pagar_00 in 'Rel_Contas_Pagar_00.pas' {RelContasPagar00},
  Relacao_Produto_Comprado_00 in 'Relacao_Produto_Comprado_00.pas' {RelacaoProdutoComprado00},
  Notas_Fiscais_Entradas_06 in 'Notas_Fiscais_Entradas_06.pas' {NotasFiscaisEntradas06},
  Produtos_Fornecedores_00 in 'Produtos_Fornecedores_00.pas' {ProdutosFornecedores00},
  Registro_Notas_Fiscais_Saidas_00 in 'Registro_Notas_Fiscais_Saidas_00.pas' {RegistroNotasFiscaisSaidas00},
  Funcionarios_Ferias_Concedidas_00 in 'Funcionarios_Ferias_Concedidas_00.pas' {FuncionariosFeriasConcedidas00},
  Funcionarios_00 in 'Funcionarios_00.pas' {Funcionarios00},
  Funcionarios_01 in 'Funcionarios_01.pas' {Funcionarios01},
  Funcionarios_02 in 'Funcionarios_02.pas' {Funcionarios02},
  Funcionarios_Acidentes_Doencas_Profissionais_00 in 'Funcionarios_Acidentes_Doencas_Profissionais_00.pas' {FuncionariosAcidentesDoencasProfissionais00},
  Funcionarios_Alteracao_Cargo_00 in 'Funcionarios_Alteracao_Cargo_00.pas' {FuncionariosAlteracaoCargo00},
  Funcionarios_Alteracao_Salario_00 in 'Funcionarios_Alteracao_Salario_00.pas' {FuncionariosAlteracaoSalario00},
  Funcionarios_Contribuicoes_Sindicais_00 in 'Funcionarios_Contribuicoes_Sindicais_00.pas' {FuncionariosContribuicoesSindicais00},
  Registro_Notas_Fiscais_Saidas_01 in 'Registro_Notas_Fiscais_Saidas_01.pas' {RegistroNotasFiscaisSaidas01},
  Rel_Clientes_00 in 'Rel_Clientes_00.pas' {RelClientes00},
  Pedidos_Pendentes_00 in 'Pedidos_Pendentes_00.pas' {PedidosPendentes00},
  Pedidos_Pendentes_01 in 'Pedidos_Pendentes_01.pas' {PedidosPendentes01},
  Pedidos_Pendentes_02 in 'Pedidos_Pendentes_02.pas' {PedidosPendentes02},
  Mapa_Producao_00 in 'Mapa_Producao_00.pas' {MapaProducao00},
  Mapa_Producao_01 in 'Mapa_Producao_01.pas' {MapaProducao01},
  Notas_Fiscais_Saidas_03 in 'Notas_Fiscais_Saidas_03.pas' {NotasFiscaisSaidas03},
  Rel_Comparativo_00 in 'Rel_Comparativo_00.pas' {RelComparativo00},
  Rel_Comparativo_01 in 'Rel_Comparativo_01.pas' {RelComparativo01},
  Retornar_Pedidos_Faturados_00 in 'Retornar_Pedidos_Faturados_00.pas' {RetornarPedidosFaturados00},
  Ordem_Despacho_V_00 in 'Ordem_Despacho_V_00.pas' {OrdemDespachoV00},
  Pedidos_03 in 'Pedidos_03.pas' {Pedidos03},
  Requisicao_00 in 'Requisicao_00.pas' {Requisicao00},
  Requisicao_01 in 'Requisicao_01.pas' {Requisicao01},
  Requisicao_02 in 'Requisicao_02.pas' {Requisicao02},
  Requisicao_03 in 'Requisicao_03.pas' {Requisicao03},
  Requisicao_04 in 'Requisicao_04.pas' {Requisicao04},
  Cria_PDF_02 in 'Cria_PDF_02.pas' {CriaPDF02},
  Notas_Fiscais_Saidas_02 in 'Notas_Fiscais_Saidas_02.pas' {NotasFiscaisSaidas02},
  MSG_NF_Etapa_01_2 in 'MSG_NF_Etapa_01_2.pas' {MSGNFEtapa01_2},
  MSG_NF_Etapa_02_2 in 'MSG_NF_Etapa_02_2.pas' {MSGNFEtapa02_2},
  MSG_NF_Etapa_03_2 in 'MSG_NF_Etapa_03_2.pas' {MSGNFEtapa03_2},
  MSG_NF_Etapa_04_2 in 'MSG_NF_Etapa_04_2.pas' {MSGNFEtapa04_2},
  Rel_Impostos_Pis_Cofins_02 in 'Rel_Impostos_Pis_Cofins_02.pas' {RelImpostosPisCofins02},
  Rel_Impostos_Pis_Cofins_03 in 'Rel_Impostos_Pis_Cofins_03.pas' {RelImpostosPisCofins03},
  Rel_Vendas_Representantes_03 in 'Rel_Vendas_Representantes_03.pas' {RelVendasRepresentantes03},
  Rel_Vendas_Representantes_02 in 'Rel_Vendas_Representantes_02.pas' {RelVendasRepresentantes02},
  Rel_Vendas_Representantes_04 in 'Rel_Vendas_Representantes_04.pas' {RelVendasRepresentantes04},
  Rel_Vendas_Representantes_05 in 'Rel_Vendas_Representantes_05.pas' {RelVendasRepresentantes05},
  Qtde_Fornecedores in 'Qtde_Fornecedores.pas' {QtdeFornecedores},
  Adiciona_Produto_Relacao_02 in 'Adiciona_Produto_Relacao_02.pas' {AdicionaProdutoRelacao02},
  Adiciona_Produto_01 in 'Adiciona_Produto_01.pas' {AdicionaProduto01},
  Tabulacao_PDF in 'Tabulacao_PDF.pas' {TabulacaoPDF},
  Relacao_Produto_Comprado_01 in 'Relacao_Produto_Comprado_01.pas' {RelacaoProdutoComprado01},
  OrdemPeriodo_01 in 'OrdemPeriodo_01.pas' {OrdemPeriodo01},
  Ordem_03 in 'Ordem_03.pas' {Ordem03},
  Ordem_00 in 'Ordem_00.pas' {Ordem00},
  Motivo_Cancelamento_00 in 'Motivo_Cancelamento_00.pas' {MotivoCancelamento00},
  Motivo_Cancelamento_01 in 'Motivo_Cancelamento_01.pas' {MotivoCancelamento01},
  Etapas_00 in 'Etapas_00.pas' {Etapas00},
  Etapas_01 in 'Etapas_01.pas' {Etapas01},
  Etapas_02 in 'Etapas_02.pas' {Etapas02},
  Processos_00 in 'Processos_00.pas' {Processos00},
  Processos_01 in 'Processos_01.pas' {Processos01},
  Processos_02 in 'Processos_02.pas' {Processos02},
  Adiciona_Estrutura_00 in 'Adiciona_Estrutura_00.pas' {AdicionaEstrutura00},
  Produtos_03 in 'Produtos_03.pas' {Produtos03},
  Rel_OS_Canceladas_00 in 'Rel_OS_Canceladas_00.pas' {RelOSCanceladas00},
  Rel_OS_Canceladas_01 in 'Rel_OS_Canceladas_01.pas' {RelOSCanceladas01},
  Fila_Espera_00 in 'Fila_Espera_00.pas' {FilaEspera00},
  Fila_Espera_01 in 'Fila_Espera_01.pas' {FilaEspera01},
  Fila_Producao_00 in 'Fila_Producao_00.pas' {FilaProducao00},
  Depto_00 in 'Depto_00.pas' {Depto00},
  Depto_01 in 'Depto_01.pas' {Depto01},
  Depto_02 in 'Depto_02.pas' {Depto02},
  Notas_Fiscais_Saidas_04 in 'Notas_Fiscais_Saidas_04.pas' {NotasFiscaisSaidas04},
  Rel_Funcionarios_00 in 'Rel_Funcionarios_00.pas' {RelFuncionarios00},
  Rel_Funcionarios_01 in 'Rel_Funcionarios_01.pas' {RelFuncionarios01},
  Rel_Cliente_Representante_00 in 'Rel_Cliente_Representante_00.pas' {RelClienteRepresentante00},
  Rel_Cliente_Representante_01 in 'Rel_Cliente_Representante_01.pas' {RelClienteRepresentante01},
  Rel_Fornecedores_00 in 'Rel_Fornecedores_00.pas' {RelFornecedores00},
  Rel_Fornecedores_01 in 'Rel_Fornecedores_01.pas' {RelFornecedores01},
  Rel_Pedido_Compra_00 in 'Rel_Pedido_Compra_00.pas' {RelPedidoCompra00},
  Rel_Pedido_Compra_01 in 'Rel_Pedido_Compra_01.pas' {RelPedidoCompra01},
  Historicos_Pedidos_00 in 'Historicos_Pedidos_00.pas' {HistoricosPedidos00},
  Historicos_Pedidos_01 in 'Historicos_Pedidos_01.pas' {HistoricosPedidos01},
  Historicos_Notas_Fiscais_Entradas_00 in 'Historicos_Notas_Fiscais_Entradas_00.pas' {HistoricosNotasFiscaisEntradas00},
  Historicos_Notas_Fiscais_Entradas_01 in 'Historicos_Notas_Fiscais_Entradas_01.pas' {HistoricosNotasFiscaisEntradas01},
  Historicos_Registro_Notas_Fiscais_Saidas_00 in 'Historicos_Registro_Notas_Fiscais_Saidas_00.pas' {HistoricosRegistroNotasFiscaisSaidas00},
  Historicos_Registro_Notas_Fiscais_Saidas_01 in 'Historicos_Registro_Notas_Fiscais_Saidas_01.pas' {HistoricosRegistroNotasFiscaisSaidas01},
  Natureza_Operacao_00 in 'Natureza_Operacao_00.pas' {NaturezaOperacao00},
  Natureza_Operacao_01 in 'Natureza_Operacao_01.pas' {NaturezaOperacao01},
  Natureza_Operacao_02 in 'Natureza_Operacao_02.pas' {NaturezaOperacao02},
  Registro_Papeletas_Saidas_00 in 'Registro_Papeletas_Saidas_00.pas' {RegistroPapeletasSaidas00},
  Registro_Papeletas_Saidas_01 in 'Registro_Papeletas_Saidas_01.pas' {RegistroPapeletasSaidas01},
  Rel_Pedido_Compra_02 in 'Rel_Pedido_Compra_02.pas' {RelPedidoCompra02},
  Estoque_Exclusao_00 in 'Estoque_Exclusao_00.pas' {EstoqueExclusao00},
  Bancos_00 in 'Bancos_00.pas' {Bancos00},
  Bancos_01 in 'Bancos_01.pas' {Bancos01},
  Bancos_02 in 'Bancos_02.pas' {Bancos02},
  Registro_Notas_Fiscais_Saidas_02 in 'Registro_Notas_Fiscais_Saidas_02.pas' {RegistroNotasFiscaisSaidas02},
  Registro_OS_00 in 'Registro_OS_00.pas' {RegistroOS00},
  MSG_Adiciona_Transportadora_Pedido in 'MSG_Adiciona_Transportadora_Pedido.pas' {MSGAdicionaTransportadoraPedido},
  Rel_Vendas_Representantes_06 in 'Rel_Vendas_Representantes_06.pas' {RelVendasRepresentantes06},
  Rel_Vendas_Representantes_07 in 'Rel_Vendas_Representantes_07.pas' {RelVendasRepresentantes07},
  Rel_Vendas_Representantes_08 in 'Rel_Vendas_Representantes_08.pas' {RelVendasRepresentantes08},
  Rel_Faturamento_02 in 'Rel_Faturamento_02.pas' {RelFaturamento02},
  Rel_Faturamento_03 in 'Rel_Faturamento_03.pas' {RelFaturamento03};

{$R *.res}

begin

  //*** Permite Apenas Uma Inst�ncia do Aplicativo ***

  CreateMutex(nil, false, 'ManagerTEX-Ibrasmak');

  If GetLastError = ERROR_ALREADY_EXISTS Then
     Begin
     SendMessage(HWND_BROADCAST, RegisterWindowMessage('ManagerTEX-Ibrasmak'), 0, 0);
     MessageDlg('O sistema da Ibrasmak j� est� sendo executado !!!', mtInformation, [mbOk], 0);
     End
  Else
     Begin
     Application.Initialize;
     Application.Title := 'Ibrasmak';
     Application.CreateForm(TLogin00, Login00);
  Application.CreateForm(TConexaoBD, ConexaoBD);
  Application.Run;
  End;

end.
