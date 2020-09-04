unit Ibrasmak_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, DBXpress, Grids, DBGrids, FMTBcd, DB,
  DBClient, Provider, SqlExpr, ADODB, StdCtrls, jpeg;

type
  TIbrasmak00 = class(TForm)
    Menu_Principal: TMainMenu;
    Cadastros1: TMenuItem;
    NotasFiscais1: TMenuItem;
    Cobranca1: TMenuItem;
    Estoque1: TMenuItem;
    Etiquetas1: TMenuItem;
    Relatorios1: TMenuItem;
    Opcoes1: TMenuItem;
    Sair1: TMenuItem;
    Mensagens_Rodape: TStatusBar;
    Timer1: TTimer;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Transportadora1: TMenuItem;
    Representantes1: TMenuItem;
    Distribuidor1: TMenuItem;
    Clientes2: TMenuItem;
    Sair2: TMenuItem;
    N1: TMenuItem;
    Bancos1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Tipos1: TMenuItem;
    Familias1: TMenuItem;
    EmissaoNotasFiscais1: TMenuItem;
    ManutencaodeNotaFiscalAnterior1: TMenuItem;
    CancelamentodeNotasFiscais1: TMenuItem;
    SAC1: TMenuItem;
    InformacoesAtendimentoClientes1: TMenuItem;
    Panel1: TPanel;
    Image1: TImage;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    Historico1: TMenuItem;
    EmissaodeTitulos1: TMenuItem;
    Boletos1: TMenuItem;
    Avulsos1: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    HistoricodeNotasFiscaisPapeletas1: TMenuItem;
    Saida1: TMenuItem;
    Entrada1: TMenuItem;
    Sadas1: TMenuItem;
    Entradas1: TMenuItem;
    Papeletas1: TMenuItem;
    Sadas3: TMenuItem;
    Entradas3: TMenuItem;
    Papeletas3: TMenuItem;
    DesdobramentodeDuplicatas1: TMenuItem;
    Manuteno1: TMenuItem;
    Pedidos2: TMenuItem;
    BaixadeCobrana1: TMenuItem;
    Estoque2: TMenuItem;
    Comisses1: TMenuItem;
    Cobrana1: TMenuItem;
    Faturamento2: TMenuItem;
    MovimentodeEstoque1: TMenuItem;
    EstoquedeProdutos1: TMenuItem;
    VendasdosRepresentantes1: TMenuItem;
    NotasFiscais2: TMenuItem;
    NotasFiscais3: TMenuItem;
    Papeletas5: TMenuItem;
    FichasdeVisita1: TMenuItem;
    VendasporEstadosRepresentantes1: TMenuItem;
    Clientes3: TMenuItem;
    Representantes2: TMenuItem;
    Avulsas1: TMenuItem;
    Usurio1: TMenuItem;
    Permisses1: TMenuItem;
    N9: TMenuItem;
    LiberaodeCrdito1: TMenuItem;
    Login: TEdit;
    Tipo_Acesso: TEdit;
    Item_Acesso: TEdit;
    N10: TMenuItem;
    RelatriodeSadas1: TMenuItem;
    N11: TMenuItem;
    Histrico1: TMenuItem;
    HistricodeComprasporProduto1: TMenuItem;
    ImpostosTaxas1: TMenuItem;
    Pis1: TMenuItem;
    Cofins1: TMenuItem;
    ICMS1: TMenuItem;
    Impstos1: TMenuItem;
    Pis2: TMenuItem;
    Cofins2: TMenuItem;
    ICMS2: TMenuItem;
    MaioresClientesPorValorVendido1: TMenuItem;
    ArquivosdeTransmisso1: TMenuItem;
    N13: TMenuItem;
    CancelamentodeBoletoAvulso1: TMenuItem;
    GeraodoArquivodeIntegraoCONTMATIC1: TMenuItem;
    Sadas5: TMenuItem;
    OutrasSadas1: TMenuItem;
    N15: TMenuItem;
    Pedidos3: TMenuItem;
    VendasporPerodo1: TMenuItem;
    Inventrio1: TMenuItem;
    Fornecedores1: TMenuItem;
    Compras1: TMenuItem;
    N6: TMenuItem;
    Cotao1: TMenuItem;
    OrdemdeCompra1: TMenuItem;
    NotadeEntrada1: TMenuItem;
    AlteraodeBanconaCobrana1: TMenuItem;
    PedidosFaturar1: TMenuItem;
    N4: TMenuItem;
    OrdemdeDespachoEtiquetaSEDEX1: TMenuItem;
    ContasaReceber1: TMenuItem;
    ContasaReceber2: TMenuItem;
    ContasaPagar1: TMenuItem;
    ContasBancrias1: TMenuItem;
    Saldos1: TMenuItem;
    tulosFixos1: TMenuItem;
    tulosAvulsos1: TMenuItem;
    CSLL1: TMenuItem;
    IRPJ1: TMenuItem;
    CSLL2: TMenuItem;
    IRPJ2: TMenuItem;
    N12: TMenuItem;
    HistricodeCompras1: TMenuItem;
    HistricodeComprasporProduto2: TMenuItem;
    PedidosEnviadosparaFaturamento1: TMenuItem;
    N14: TMenuItem;
    RelaodeProdutosComprados1: TMenuItem;
    N16: TMenuItem;
    SadasManualmente1: TMenuItem;
    IPI1: TMenuItem;
    IPI2: TMenuItem;
    N17: TMenuItem;
    RelatriodeContasaPagar1: TMenuItem;
    DeptoPessoal1: TMenuItem;
    Funcionrios1: TMenuItem;
    N18: TMenuItem;
    ProdutosdosFornecedores1: TMenuItem;
    N19: TMenuItem;
    MapadeProduo1: TMenuItem;
    PedidosPendentes1: TMenuItem;
    N20: TMenuItem;
    RelatrioComparativoContasaPagarContasaReceber1: TMenuItem;
    N21: TMenuItem;
    RetornarPedidosJFaturados1: TMenuItem;
    EtiquetaSEDEX1: TMenuItem;
    Requisicoes: TMenuItem;
    Ibrasmak1: TMenuItem;
    Monibras1: TMenuItem;
    Cobrana2: TMenuItem;
    Oramentos1: TMenuItem;
    ContasaReceber3: TMenuItem;
    NotasFiscais4: TMenuItem;
    ContasaReceber4: TMenuItem;
    Comisses2: TMenuItem;
    ClculodasComisses1: TMenuItem;
    NotasFiscais5: TMenuItem;
    Faturamento1: TMenuItem;
    VendasporPerodo2: TMenuItem;
    Sadas2: TMenuItem;
    OutrasSadas2: TMenuItem;
    Impostos1: TMenuItem;
    IPI3: TMenuItem;
    IRPJ3: TMenuItem;
    CSLL3: TMenuItem;
    ICMS3: TMenuItem;
    COFINS3: TMenuItem;
    PIS3: TMenuItem;
    Maioresclientesporvalorvendido2: TMenuItem;
    VendasporEstadosRepresentantes2: TMenuItem;
    OrdemdeCompraporPeriodo1: TMenuItem;
    Industrial1: TMenuItem;
    Etapas1: TMenuItem;
    Processos1: TMenuItem;
    SubProcessos1: TMenuItem;
    Cancelamento1: TMenuItem;
    Requisies1: TMenuItem;
    Cotaes1: TMenuItem;
    OrdensdeCompra1: TMenuItem;
    Produo1: TMenuItem;
    FiladeEspera1: TMenuItem;
    FiladeProduo1: TMenuItem;
    Departamentos1: TMenuItem;
    Funcionrios2: TMenuItem;
    ClientesporRepresentante1: TMenuItem;
    Fornecedores2: TMenuItem;
    PedidodeCompra1: TMenuItem;
    RegistrodePapeletasManual1: TMenuItem;
    NaturezasdeOperao1: TMenuItem;
    ExclusodeMovimento1: TMenuItem;
    N22: TMenuItem;
    OSRegistroGeral1: TMenuItem;
    NotaFiscalEletrnicaNFe1: TMenuItem;
    NotaFiscalEletrnicaManualNFe1: TMenuItem;
    N23: TMenuItem;
    OrdensdeServio1: TMenuItem;
    OSOrdensdeServio1: TMenuItem;
    OSOrdensdeServio2: TMenuItem;
    OSOrdensdeServio3: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair2Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure Representantes1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Transportadora1Click(Sender: TObject);
    procedure Tipos1Click(Sender: TObject);
    procedure Familias1Click(Sender: TObject);
    procedure Distribuidor1Click(Sender: TObject);
    procedure ManutencaodeNotaFiscalAnterior1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Boletos1Click(Sender: TObject);
    procedure Avulsos2Click(Sender: TObject);
    procedure Saida1Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure DesdobramentodeDuplicatas1Click(Sender: TObject);
    procedure Manuteno1Click(Sender: TObject);
    procedure Sadas1Click(Sender: TObject);
    procedure Papeletas1Click(Sender: TObject);
    procedure Pedidos2Click(Sender: TObject);
    procedure MovimentodeEstoque1Click(Sender: TObject);
    procedure EstoquedeProdutos1Click(Sender: TObject);
    procedure NotasFiscais2Click(Sender: TObject);
    procedure BaixadeCobrana1Click(Sender: TObject);
    procedure FichasdeVisita1Click(Sender: TObject);
    procedure VendasporEstadosRepresentantes1Click(Sender: TObject);
    procedure Historico1Click(Sender: TObject);
    procedure Clientes3Click(Sender: TObject);
    procedure Representantes2Click(Sender: TObject);
    procedure Avulsas1Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure Permisses1Click(Sender: TObject);
    procedure LiberaodeCrdito1Click(Sender: TObject);
    procedure RelatriodeSadas1Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure HistricodeComprasporProduto1Click(Sender: TObject);
    procedure Pis1Click(Sender: TObject);
    procedure Cofins1Click(Sender: TObject);
    procedure ICMS1Click(Sender: TObject);
    procedure Pis2Click(Sender: TObject);
    procedure Cofins2Click(Sender: TObject);
    procedure MaioresClientesPorValorVendido1Click(Sender: TObject);
    procedure CancelamentodeBoletoAvulso1Click(Sender: TObject);
    procedure GeraodoArquivodeIntegraoCONTMATIC1Click(Sender: TObject);
    procedure Sadas5Click(Sender: TObject);
    procedure OutrasSadas1Click(Sender: TObject);
    procedure InformacoesAtendimentoClientes1Click(Sender: TObject);
    procedure Pedidos3Click(Sender: TObject);
    procedure Sadas6Click(Sender: TObject);
    procedure Entradas2Click(Sender: TObject);
    procedure VendasporPerodo1Click(Sender: TObject);
    procedure Inventrio1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure AlteraodeBanconaCobrana1Click(Sender: TObject);
    procedure Cotao1Click(Sender: TObject);
    procedure OrdemdeCompra1Click(Sender: TObject);
    procedure NotadeEntrada1Click(Sender: TObject);
    procedure PedidosFaturar1Click(Sender: TObject);
    procedure OrdemdeDespachoEtiquetaSEDEX1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure ContasBancrias1Click(Sender: TObject);
    procedure Saldos1Click(Sender: TObject);
    procedure tulosFixos1Click(Sender: TObject);
    procedure tulosAvulsos1Click(Sender: TObject);
    procedure CSLL1Click(Sender: TObject);
    procedure IRPJ1Click(Sender: TObject);
    procedure CSLL2Click(Sender: TObject);
    procedure IRPJ2Click(Sender: TObject);
    procedure HistricodeCompras1Click(Sender: TObject);
    procedure HistricodeComprasporProduto2Click(Sender: TObject);
    procedure ICMS2Click(Sender: TObject);
    procedure PedidosEnviadosparaFaturamento1Click(Sender: TObject);
    procedure IPI1Click(Sender: TObject);
    procedure IPI2Click(Sender: TObject);
    procedure ContasaReceber2Click(Sender: TObject);
    procedure RelatriodeContasaPagar1Click(Sender: TObject);
    procedure RelaodeProdutosComprados1Click(Sender: TObject);
    procedure ProdutosdosFornecedores1Click(Sender: TObject);
    procedure SadasManualmente1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure PedidosPendentes1Click(Sender: TObject);
    procedure MapadeProduo1Click(Sender: TObject);
    procedure RelatrioComparativoContasaPagarContasaReceber1Click(
      Sender: TObject);
    procedure RetornarPedidosJFaturados1Click(Sender: TObject);
    procedure EtiquetaSEDEX1Click(Sender: TObject);
    procedure RequisicoesClick(Sender: TObject);
    procedure ContasaReceber4Click(Sender: TObject);
    procedure ContasaReceber3Click(Sender: TObject);
    procedure NotasFiscais5Click(Sender: TObject);
    procedure OutrasSadas2Click(Sender: TObject);
    procedure Sadas2Click(Sender: TObject);
    procedure VendasporPerodo2Click(Sender: TObject);
    procedure PIS3Click(Sender: TObject);
    procedure COFINS3Click(Sender: TObject);
    procedure ICMS3Click(Sender: TObject);
    procedure CSLL3Click(Sender: TObject);
    procedure IRPJ3Click(Sender: TObject);
    procedure IPI3Click(Sender: TObject);
    procedure Maioresclientesporvalorvendido2Click(Sender: TObject);
    procedure VendasporEstadosRepresentantes2Click(Sender: TObject);
    procedure OrdemdeCompraporPeriodo1Click(Sender: TObject);
    procedure Etapas1Click(Sender: TObject);
    procedure Processos1Click(Sender: TObject);
    procedure SubProcessos1Click(Sender: TObject);
    procedure Requisies1Click(Sender: TObject);
    procedure Cotaes1Click(Sender: TObject);
    procedure OrdensdeCompra1Click(Sender: TObject);
    procedure FiladeEspera1Click(Sender: TObject);
    procedure FiladeProduo1Click(Sender: TObject);
    procedure Departamentos1Click(Sender: TObject);
    procedure Funcionrios2Click(Sender: TObject);
    procedure ClientesporRepresentante1Click(Sender: TObject);
    procedure Fornecedores2Click(Sender: TObject);
    procedure PedidodeCompra1Click(Sender: TObject);
    procedure Papeletas3Click(Sender: TObject);
    procedure Entradas3Click(Sender: TObject);
    procedure Sadas3Click(Sender: TObject);
    procedure RegistrodePapeletasManual1Click(Sender: TObject);
    procedure NaturezasdeOperao1Click(Sender: TObject);
    procedure ExclusodeMovimento1Click(Sender: TObject);
    procedure OSRegistroGeral1Click(Sender: TObject);
    procedure NotaFiscalEletrnicaNFe1Click(Sender: TObject);
    procedure NotaFiscalEletrnicaManualNFe1Click(Sender: TObject);
    procedure OrdensdeServio1Click(Sender: TObject);
    procedure OSOrdensdeServio1Click(Sender: TObject);
    procedure OSOrdensdeServio2Click(Sender: TObject);
    procedure OSOrdensdeServio3Click(Sender: TObject);
  private
    { Private declarations }
    function Valida_Menu(Menu: TMainMenu; Menu_Nome: String; Menu_Status: String): Integer;
    function Bloqueia_Menu(Menu: TMainMenu): Integer;
  public
    { Public declarations }
  end;

var
  Ibrasmak00: TIbrasmak00;

implementation

uses Conexao_BD, Rotinas_Gerais, Bancos_00,
  Representantes_00, Clientes_00, Transportadoras_00,
  Tipo_Produto_00, Familia_Produto_00, Produtos_00,
  Splash_Screen, Notas_Fiscais_Saidas_00, Nota_Fiscal_Anterior_00,
  Pedidos_00, Sobre_00, Boletos_00, Boletos_01, 
  Notas_Fiscais_Entradas_00, Desdobramento_Duplicatas_00, Estoque_00,
  Cancelamento_Saidas_00, Cancelamento_Papeletas_00, Cancelamento_Pedidos_00,
  Alteracao_Notas_Fiscais_Saidas_00, Alteracao_Papeletas_Saidas_00,
  Rel_Movimento_Estoque_00, Rel_Estoque_Produtos_00,
  Rel_Vendas_Representantes_00, Rel_Vendas_Representantes_02,
  Baixa_Cobranca_00, Rel_Vencidos_Nota_00, Rel_Vencidos_Papeleta_00, Rel_Faturamento_00,
  Rel_Fichas_Visitas_00, Rel_Venda_Estado_Representante_00,
  Historico_Clientes_00, Etiquetas_Clientes_00,
  Etiquetas_Representantes_00, Etiquetas_Avulsas_00, Login_00, Usuario_00,
  Permissao_00, Rel_Estoque_Produtos_01, Liberacao_Credito_00,
  Rel_Ctrl_Saida_Mercadoria_00, Historico_Produtos_00, Taxas_Impostos_00,
  Rel_Impostos_Pis_Cofins_00, Rel_Clientes_Valor_Vendido_00,
  Arquivo_Remessa_00, Arquivo_Retorno_00, Cancelamento_Boleto_Avulso_00,
  Arquivo_Integracao_00, Rel_Faturamento_Outras_Saidas_00,
  SAC_Historico_00, Rel_Vendas_Periodo_00, Rel_Estoque_Inventario_00,
  Fornecedor_00, Altera_Banco_Cobranca_00, Cotacao_00, Ordem_00,
  Cancelamento_Faturados_00, Ordem_Despacho_00, Contas_Receber_00,
  Avulso_00, Conta_Bancaria_00, Fixo_00, Saldo_00, V_Historico_Clientes_00,
  V_Historico_Produtos_00, Faturamento_00, Cotacao_02,
  Contas_Receber_Orcamento_00, Rel_Contas_Pagar_00,
  Relacao_Produto_Comprado_00, Produtos_Fornecedores_00,
  Registro_Notas_Fiscais_Saidas_00, Funcionarios_00, Pedidos_Pendentes_00,
  Mapa_Producao_00, Rel_Comparativo_00, Retornar_Pedidos_Faturados_00,
  Ordem_Despacho_V_00, Requisicao_00, Requisicao_02,
  Rel_Impostos_Pis_Cofins_02, OrdemPeriodo_00, Etapas_00, Processos_00,
  SubProcessos_00, Rel_OS_Canceladas_00, Fila_Espera_00, Fila_Producao_00,
  Depto_00, Rel_Funcionarios_00, Rel_Cliente_Representante_00,
  Rel_Fornecedores_00, Rel_Pedido_Compra_00, Historicos_Pedidos_00,
  Historicos_Notas_Fiscais_Entradas_00,
  Historicos_Registro_Notas_Fiscais_Saidas_00,
  Registro_Papeletas_Saidas_00, Natureza_Operacao_00, Estoque_Exclusao_00,
  Registro_OS_00, Rel_Vendas_Representantes_06, Rel_Faturamento_02;

{$R *.dfm}

function TIbrasmak00.Valida_Menu(Menu: TMainMenu; Menu_Nome: String; Menu_Status: String): Integer;

  function ContaItens(MenuItem: TMenuItem; Menu_Nome: String; Menu_Status: String): Integer;

  var
    I: Integer;

  begin
    Result := MenuItem.Count;

    for I := 0 to MenuItem.Count-1 do begin

      If Trim(MenuItem.Items[I].Name) = Trim(Menu_Nome) Then
         Begin

         If Trim(Menu_Status) = '1' Then
            Begin
            MenuItem.Items[I].Enabled := True;
         End

      End;

      Result := Result + ContaItens(MenuItem.Items[I], Menu_Nome, Menu_Status);
    end;

  end;

begin
  Result := ContaItens(Menu.Items, Menu_Nome, Menu_Status);
end;

function TIbrasmak00.Bloqueia_Menu(Menu: TMainMenu): Integer;

  var
     Total_Menu: Integer;

  function ContaItens(MenuItem: TMenuItem): Integer;

  var
    I: Integer;

  begin
    Result := MenuItem.Count;

    for I := 0 to MenuItem.Count-1 do begin
      //Grava_Linha := MenuItem.Items[I].Caption + ' - ' + MenuItem.Items[I].Name;
      //WriteLn(Arq_Remessa,Grava_Linha);

      MenuItem.Items[I].Enabled := False;

      Result := Result + ContaItens(MenuItem.Items[I]);
    end;
  end;

begin
  //AssignFile(Arq_Remessa,'C:\Ibrasmak\FAX\MENU.txt');
  //Rewrite(Arq_Remessa);

  //Total_Menu := ContaItens(Menu.Items);

  //Grava_Linha := '---';
  //WriteLn(Arq_Remessa,Grava_Linha);
  //CloseFile(Arq_Remessa);

  Result := ContaItens(Menu.Items);
end;

procedure TIbrasmak00.Sair1Click(Sender: TObject);
begin
     Fecha_Conexao();
     Ibrasmak00.Close
end;

procedure TIbrasmak00.Timer1Timer(Sender: TObject);
begin
     Mensagens_Rodape.Panels[1].Text := TimeToStr(Time);
end;

procedure TIbrasmak00.ShowHint(Sender: TObject);
begin
     Mensagens_Rodape.Panels[2].Text := Application.Hint;
end;


procedure TIbrasmak00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';

     Application.OnHint := ShowHint;
end;

procedure TIbrasmak00.FormShow(Sender: TObject);

var
   Menu, Data_Dolar: String;

begin
  Ampulheta();

  If Not ConexaoBD.Conexao_Principal.Connected Then
    Begin
    Application.CreateForm(TSplashScreen,SplashScreen);
    SplashScreen.Show;
    SplashScreen.Update;

    Abre_Conexao();

    SplashScreen.Hide;
    SplashScreen.Free;
  End;

  // Ajusta o Tamanho do Formulário
  { with Ibrasmak00 do begin
     Left := 0;
     Top  := 0;
     Height := Screen.Height - 29;
     Width  := Screen.Width;
  end; }

  Mensagens_Rodape.Panels[2].Text := '';

  // Mostra a data na barra de status
  Mensagens_Rodape.Panels[0].Text := MostraData;

  // Verifica acesso aos itens do menu

  Bloqueia_Menu(Menu_Principal);

  ConexaoBD.SQL_FB_Permissoes_Acesso.Close;
  ConexaoBD.SQL_FB_Permissoes_Acesso.SQL.Clear;
  ConexaoBD.SQL_FB_Permissoes_Acesso.SQL.Add('Select * from fb_permissoes_acesso Where fb_permissao_acesso_login ='+#39+Trim(Login00.Usuario.Text)+#39+ ' Order By fb_permissao_acesso_login, fb_permissao_acesso_posicao');
  ConexaoBD.SQL_FB_Permissoes_Acesso.Open;

  If ConexaoBD.SQL_FB_Permissoes_Acesso.RecordCount > 0 Then
     Begin

     ConexaoBD.SQL_FB_Permissoes_Acesso.First;

     While Not ConexaoBD.SQL_FB_Permissoes_Acesso.Eof Do
           Begin
           Valida_Menu(Menu_Principal,Trim(ConexaoBD.SQL_FB_Permissoes_Acesso.FieldByName('fb_permissao_acesso_nome').Text),Trim(ConexaoBD.SQL_FB_Permissoes_Acesso.FieldByName('fb_permissao_acesso_status').Text));

           ConexaoBD.SQL_FB_Permissoes_Acesso.Next;
     End;

   End;

  Seta();
end;

procedure TIbrasmak00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Fecha_Conexao();
end;

procedure TIbrasmak00.Sair2Click(Sender: TObject);
begin
    Fecha_Conexao();
    Ibrasmak00.Close
end;

procedure TIbrasmak00.Bancos1Click(Sender: TObject);
begin
    If (Bancos00 = Nil) Then
       Begin
       Application.CreateForm(TBancos00,Bancos00);
    End;
    Bancos00.Show;
end;

procedure TIbrasmak00.Representantes1Click(Sender: TObject);
begin
    If (Representantes00 = Nil) Then
       Begin
       Application.CreateForm(TRepresentantes00,Representantes00);
    End;
    Representantes00.Show;
end;

procedure TIbrasmak00.Clientes2Click(Sender: TObject);
begin
    If (Clientes00 = Nil) Then
       Begin
       Application.CreateForm(TClientes00,Clientes00);
     End;
     Clientes00.Show;
end;

procedure TIbrasmak00.Transportadora1Click(Sender: TObject);
begin
    If (Transportadoras00 = Nil) Then
       Begin
       Application.CreateForm(TTransportadoras00,Transportadoras00);
    End;
    Transportadoras00.Show;
end;

procedure TIbrasmak00.Tipos1Click(Sender: TObject);
begin
    If (TipoProduto00 = Nil) Then
       Begin
       Application.CreateForm(TTipoProduto00,TipoProduto00);
    End;
    TipoProduto00.Show;
end;

procedure TIbrasmak00.Familias1Click(Sender: TObject);
begin
    If (FamiliaProduto00 = Nil) Then
       Begin
       Application.CreateForm(TFamiliaProduto00,FamiliaProduto00);
    End;
    FamiliaProduto00.Show;
end;

procedure TIbrasmak00.Distribuidor1Click(Sender: TObject);
begin
    If (Produtos00 = Nil) Then
       Begin
       Application.CreateForm(TProdutos00,Produtos00);
    End;
    Produtos00.Show;
end;

procedure TIbrasmak00.ManutencaodeNotaFiscalAnterior1Click(
  Sender: TObject);
begin
    If (NotaFiscalAnterior00 = Nil) Then
       Begin
       Application.CreateForm(TNotaFiscalAnterior00,NotaFiscalAnterior00);
    End;
    NotaFiscalAnterior00.Show;
end;

procedure TIbrasmak00.Sobre1Click(Sender: TObject);
begin
    Application.CreateForm(TSobre00,Sobre00);
    Sobre00.ShowModal;
    Sobre00.Destroy;
end;

procedure TIbrasmak00.Boletos1Click(Sender: TObject);
begin
    If (Boletos00 = Nil) Then
       Begin
       Application.CreateForm(TBoletos00,Boletos00);
    End;
    Boletos00.Show;
end;

procedure TIbrasmak00.Avulsos2Click(Sender: TObject);
begin
    If (Boletos01 = Nil) Then
       Begin
       Application.CreateForm(TBoletos01,Boletos01);
    End;
    Boletos01.Show;
end;

procedure TIbrasmak00.Saida1Click(Sender: TObject);
begin
   If (NotasFiscaisSaidas00 = Nil) Then
       Begin
       Application.CreateForm(TNotasFiscaisSaidas00,NotasFiscaisSaidas00);
    End;
    //NotasFiscaisSaidas00.DBG_Pedidos_Ibrasmak.Enabled := False;
    NotasFiscaisSaidas00.Tipo_Emissao_Nota.Text       := 'NFe';
    NotasFiscaisSaidas00.Show;
end;

procedure TIbrasmak00.Entrada1Click(Sender: TObject);
begin
    If (NotasFiscaisEntradas00 = Nil) Then
       Begin
       Application.CreateForm(TNotasFiscaisEntradas00,NotasFiscaisEntradas00);
    End;
    NotasFiscaisEntradas00.Show;
end;

procedure TIbrasmak00.DesdobramentodeDuplicatas1Click(Sender: TObject);
begin
    If (DesdobramentoDuplicatas00 = Nil) Then
       Begin
       Application.CreateForm(TDesdobramentoDuplicatas00,DesdobramentoDuplicatas00);
    End;
    DesdobramentoDuplicatas00.Show;
end;

procedure TIbrasmak00.Manuteno1Click(Sender: TObject);
begin
    If (Estoque00 = Nil) Then
       Begin
       Application.CreateForm(TEstoque00,Estoque00);
    End;
    Estoque00.Show;
end;

procedure TIbrasmak00.Sadas1Click(Sender: TObject);
begin
    If (CancelamentoSaidas00 = Nil) Then
       Begin
       Application.CreateForm(TCancelamentoSaidas00,CancelamentoSaidas00);
    End;
    CancelamentoSaidas00.Show;
end;

procedure TIbrasmak00.Papeletas1Click(Sender: TObject);
begin
    If (CancelamentoPapeletas00 = Nil) Then
       Begin
       Application.CreateForm(TCancelamentoPapeletas00,CancelamentoPapeletas00);
    End;
    CancelamentoPapeletas00.Show;
end;

procedure TIbrasmak00.Pedidos2Click(Sender: TObject);
begin
    If (CancelamentosPedidos00 = Nil) Then
       Begin
       Application.CreateForm(TCancelamentosPedidos00,CancelamentosPedidos00);
    End;
    CancelamentosPedidos00.Show;
end;

procedure TIbrasmak00.MovimentodeEstoque1Click(Sender: TObject);
begin
    If (RelMovimentoEstoque00 = Nil) Then
       Begin
       Application.CreateForm(TRelMovimentoEstoque00,RelMovimentoEstoque00);
    End;
    RelMovimentoEstoque00.Show;
end;

procedure TIbrasmak00.EstoquedeProdutos1Click(Sender: TObject);
begin
    If (RelEstoqueProdutos01 = Nil) Then
       Begin
       Application.CreateForm(TRelEstoqueProdutos01,RelEstoqueProdutos01);
    End;
    RelEstoqueProdutos01.Show;
end;

procedure TIbrasmak00.NotasFiscais2Click(Sender: TObject);
begin
    If (RelVendasRepresentantes00 = Nil) Then
       Begin
       Application.CreateForm(TRelVendasRepresentantes00,RelVendasRepresentantes00);
    End;
    RelVendasRepresentantes00.Acc_Empresa.Text := 'Ibrasmak';
    RelVendasRepresentantes00.Show;
end;

procedure TIbrasmak00.BaixadeCobrana1Click(Sender: TObject);
begin
    If (BaixaCobranca00 = Nil) Then
       Begin
       Application.CreateForm(TBaixaCobranca00,BaixaCobranca00);
    End;
    BaixaCobranca00.Show;
end;

procedure TIbrasmak00.FichasdeVisita1Click(Sender: TObject);
begin
    If (RelFichasVisitas00 = Nil) Then
       Begin
       Application.CreateForm(TRelFichasVisitas00,RelFichasVisitas00);
    End;
    RelFichasVisitas00.Show;
end;

procedure TIbrasmak00.VendasporEstadosRepresentantes1Click(
  Sender: TObject);
begin
    If (RelVendaEstadoRepresentante00 = Nil) Then
       Begin
       Application.CreateForm(TRelVendaEstadoRepresentante00,RelVendaEstadoRepresentante00);
    End;
    RelVendaEstadoRepresentante00.Acc_Empresa.Text := 'Ibrasmak';
    RelVendaEstadoRepresentante00.Show;
end;

procedure TIbrasmak00.Historico1Click(Sender: TObject);
begin
    If (HistoricoClientes00 = Nil) Then
       Begin
       Application.CreateForm(THistoricoClientes00,HistoricoClientes00);
    End;
    HistoricoClientes00.Show;
end;

procedure TIbrasmak00.Clientes3Click(Sender: TObject);
begin
    If (EtiquetasClientes00 = Nil) Then
       Begin
       Application.CreateForm(TEtiquetasClientes00,EtiquetasClientes00);
    End;
    EtiquetasClientes00.Show;
end;

procedure TIbrasmak00.Representantes2Click(Sender: TObject);
begin
    If (EtiquetasRepresentantes00 = Nil) Then
       Begin
       Application.CreateForm(TEtiquetasRepresentantes00,EtiquetasRepresentantes00);
    End;
    EtiquetasRepresentantes00.Show;
end;

procedure TIbrasmak00.Avulsas1Click(Sender: TObject);
begin
    If (EtiquetasAvulsas00 = Nil) Then
       Begin
       Application.CreateForm(TEtiquetasAvulsas00,EtiquetasAvulsas00);
    End;
    EtiquetasAvulsas00.Show;
end;

procedure TIbrasmak00.Usurio1Click(Sender: TObject);
begin
    If (Usuario00 = Nil) Then
       Begin
       Application.CreateForm(TUsuario00,Usuario00);
    End;
    Usuario00.Show;
end;

procedure TIbrasmak00.Permisses1Click(Sender: TObject);
begin
    If (Permissoes00 = Nil) Then
       Begin
       Application.CreateForm(TPermissoes00,Permissoes00);
    End;
    Permissoes00.Show;
end;

procedure TIbrasmak00.LiberaodeCrdito1Click(Sender: TObject);
begin
    If (LiberacaoCredito00 = Nil) Then
       Begin
       Application.CreateForm(TLiberacaoCredito00,LiberacaoCredito00);
    End;
    LiberacaoCredito00.Show;
end;

procedure TIbrasmak00.RelatriodeSadas1Click(Sender: TObject);
begin
    If (RelCtrlSaidaMercadoria00 = Nil) Then
       Begin
       Application.CreateForm(TRelCtrlSaidaMercadoria00,RelCtrlSaidaMercadoria00);
    End;
    RelCtrlSaidaMercadoria00.Show;
end;

procedure TIbrasmak00.Histrico1Click(Sender: TObject);
begin
    If (HistoricoProdutos00 = Nil) Then
       Begin
       Application.CreateForm(THistoricoProdutos00,HistoricoProdutos00);
    End;
    HistoricoProdutos00.Tipo_Historico.Text := 'Historico_Produtos';
    HistoricoProdutos00.Show;
end;

procedure TIbrasmak00.HistricodeComprasporProduto1Click(Sender: TObject);
begin
    If (HistoricoProdutos00 = Nil) Then
       Begin
       Application.CreateForm(THistoricoProdutos00,HistoricoProdutos00);
    End;
    HistoricoProdutos00.Tipo_Historico.Text := 'Historico_Clientes';
    HistoricoProdutos00.Show;
end;

procedure TIbrasmak00.Pis1Click(Sender: TObject);
begin
    If (TaxasImpostos00 = Nil) Then
       Begin
       Application.CreateForm(TTaxasImpostos00,TaxasImpostos00);
    End;
    TaxasImpostos00.edtTipo.Text := 'PIS';
    TaxasImpostos00.Show;
end;

procedure TIbrasmak00.Cofins1Click(Sender: TObject);
begin
    If (TaxasImpostos00 = Nil) Then
       Begin
       Application.CreateForm(TTaxasImpostos00,TaxasImpostos00);
    End;
    TaxasImpostos00.edtTipo.Text := 'COFINS';
    TaxasImpostos00.Show;
end;

procedure TIbrasmak00.ICMS1Click(Sender: TObject);
begin
    If (TaxasImpostos00 = Nil) Then
       Begin
       Application.CreateForm(TTaxasImpostos00,TaxasImpostos00);
    End;
    TaxasImpostos00.edtTipo.Text := 'ICMS';
    TaxasImpostos00.Show;
end;

procedure TIbrasmak00.Pis2Click(Sender: TObject);
begin
    If (RelImpostosPisCofins00 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins00,RelImpostosPisCofins00);
    End;
    RelImpostosPisCofins00.Acc_Empresa.Text := 'Ibrasmak';
    RelImpostosPisCofins00.edtImposto.Text := 'PIS';
    RelImpostosPisCofins00.Show;
end;

procedure TIbrasmak00.Cofins2Click(Sender: TObject);
begin
    If (RelImpostosPisCofins00 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins00,RelImpostosPisCofins00);
    End;
    RelImpostosPisCofins00.Acc_Empresa.Text := 'Ibrasmak';
    RelImpostosPisCofins00.edtImposto.Text := 'COFINS';
    RelImpostosPisCofins00.Show;
end;

procedure TIbrasmak00.MaioresClientesPorValorVendido1Click(
  Sender: TObject);
begin
    If (RelClientesValorVendido00 = Nil) Then
       Begin
       Application.CreateForm(TRelClientesValorVendido00,RelClientesValorVendido00);
    End;

    RelClientesValorVendido00.Acc_Empresa.Text := 'Ibrasmak';
    RelClientesValorVendido00.Show;
end;

procedure TIbrasmak00.CancelamentodeBoletoAvulso1Click(Sender: TObject);
begin
    If (CancelamentoBoletoAvulso00 = Nil) Then
       Begin
       Application.CreateForm(TCancelamentoBoletoAvulso00,CancelamentoBoletoAvulso00);
     End;
     CancelamentoBoletoAvulso00.Show;
end;

procedure TIbrasmak00.GeraodoArquivodeIntegraoCONTMATIC1Click(
  Sender: TObject);
begin
    MSG_Erro('Você deve enviar os Arquivos XML da Nota Fiscal Eletrônica para o Escritório Contábil.');

    {If (ArquivoIntegracao00 = Nil) Then
       Begin
       Application.CreateForm(TArquivoIntegracao00,ArquivoIntegracao00);
     End;
     ArquivoIntegracao00.Show; }
end;

procedure TIbrasmak00.Sadas5Click(Sender: TObject);
begin
    If (RelFaturamento00 = Nil) Then
       Begin
       Application.CreateForm(TRelFaturamento00,RelFaturamento00);
    End;
    RelFaturamento00.Acc_Empresa.Text := 'Ibrasmak';
    RelFaturamento00.Show;
end;

procedure TIbrasmak00.OutrasSadas1Click(Sender: TObject);
begin
    If (RelFaturamentoOutrasSaidas00 = Nil) Then
       Begin
       Application.CreateForm(TRelFaturamentoOutrasSaidas00,RelFaturamentoOutrasSaidas00);
    End;
    RelFaturamentoOutrasSaidas00.Acc_Empresa.Text := 'Ibrasmak';
    RelFaturamentoOutrasSaidas00.Show;
end;

procedure TIbrasmak00.InformacoesAtendimentoClientes1Click(
  Sender: TObject);
begin
    If (SACHistorico00 = Nil) Then
       Begin
       Application.CreateForm(TSACHistorico00,SACHistorico00);
    End;
    SACHistorico00.Show;
end;

procedure TIbrasmak00.Pedidos3Click(Sender: TObject);
begin
    If (Pedidos00 = Nil) Then
       Begin
       Application.CreateForm(TPedidos00,Pedidos00);
    End;
    Pedidos00.Show;
end;

procedure TIbrasmak00.Sadas6Click(Sender: TObject);
begin
    If (NotasFiscaisSaidas00 = Nil) Then
       Begin
       Application.CreateForm(TNotasFiscaisSaidas00,NotasFiscaisSaidas00);
    End;
    NotasFiscaisSaidas00.Show;
end;

procedure TIbrasmak00.Entradas2Click(Sender: TObject);
begin
    If (NotasFiscaisEntradas00 = Nil) Then
       Begin
       Application.CreateForm(TNotasFiscaisEntradas00,NotasFiscaisEntradas00);
    End;
    NotasFiscaisEntradas00.Show;
end;

procedure TIbrasmak00.VendasporPerodo1Click(Sender: TObject);
begin
    If (RelVendasPeriodo00 = Nil) Then
       Begin
       Application.CreateForm(TRelVendasPeriodo00,RelVendasPeriodo00);
    End;
    RelVendasPeriodo00.Acc_Empresa.Text := 'Ibrasmak';
    RelVendasPeriodo00.Show;
end;

procedure TIbrasmak00.Inventrio1Click(Sender: TObject);
begin
    If (RelEstoqueInventario00 = Nil) Then
       Begin
       Application.CreateForm(TRelEstoqueInventario00,RelEstoqueInventario00);
    End;
    RelEstoqueInventario00.Show;
end;

procedure TIbrasmak00.Fornecedores1Click(Sender: TObject);
begin
    If (Fornecedor00 = Nil) Then
       Begin
       Application.CreateForm(TFornecedor00,Fornecedor00);
     End;
     Fornecedor00.Show;
end;

procedure TIbrasmak00.AlteraodeBanconaCobrana1Click(Sender: TObject);
begin
    If (AlteraBancoCobranca00 = Nil) Then
       Begin
       Application.CreateForm(TAlteraBancoCobranca00,AlteraBancoCobranca00);
    End;
    AlteraBancoCobranca00.Show;
end;

procedure TIbrasmak00.Cotao1Click(Sender: TObject);
begin
    If (Cotacao02 = Nil) Then
       Begin
       Application.CreateForm(TCotacao02,Cotacao02);
    End;
    Cotacao02.Show;
end;

procedure TIbrasmak00.OrdemdeCompra1Click(Sender: TObject);
begin
    If (Ordem00 = Nil) Then
       Begin
       Application.CreateForm(TOrdem00,Ordem00);
    End;
    Ordem00.Show;
end;

procedure TIbrasmak00.NotadeEntrada1Click(Sender: TObject);
begin
    If (NotasFiscaisEntradas00 = Nil) Then
       Begin
       Application.CreateForm(TNotasFiscaisEntradas00,NotasFiscaisEntradas00);
    End;
    NotasFiscaisEntradas00.Show;
end;

procedure TIbrasmak00.PedidosFaturar1Click(Sender: TObject);
begin
    If (CancelamentoFaturados00 = Nil) Then
       Begin
       Application.CreateForm(TCancelamentoFaturados00,CancelamentoFaturados00);
    End;
    CancelamentoFaturados00.Show;
end;

procedure TIbrasmak00.OrdemdeDespachoEtiquetaSEDEX1Click(Sender: TObject);
begin
    If (OrdemDespacho00 = Nil) Then
       Begin
       Application.CreateForm(TOrdemDespacho00,OrdemDespacho00);
    End;
    OrdemDespacho00.Show;
end;

procedure TIbrasmak00.ContasaReceber1Click(Sender: TObject);
begin
    If (ContasReceber00 = Nil) Then
       Begin
       Application.CreateForm(TContasReceber00,ContasReceber00);
    End;
    ContasReceber00.Acc_Empresa.Text := 'Ibrasmak';
    ContasReceber00.Show;
end;

procedure TIbrasmak00.ContasBancrias1Click(Sender: TObject);
begin
    If (ContaBancaria00 = Nil) Then
       Begin
       Application.CreateForm(TContaBancaria00,ContaBancaria00);
    End;
    ContaBancaria00.Show;
end;

procedure TIbrasmak00.Saldos1Click(Sender: TObject);
begin
    If (Saldo00 = Nil) Then
       Begin
       Application.CreateForm(TSaldo00,Saldo00);
    End;
    Saldo00.Show;
end;

procedure TIbrasmak00.tulosFixos1Click(Sender: TObject);
begin
    If (Fixo00 = Nil) Then
       Begin
       Application.CreateForm(TFixo00,Fixo00);
       Fixo00.Fixo_Fornecedor_Numero.Text := '0';
       Fixo00.Fixo_Fornecedor_Nome.Text   := '--- Todos ---';
    End;
    Fixo00.Show;
end;

procedure TIbrasmak00.tulosAvulsos1Click(Sender: TObject);
begin
    If (Avulso00 = Nil) Then
       Begin
       Application.CreateForm(TAvulso00,Avulso00);
       Avulso00.Avulso_Fornecedor_Numero.Text := '0';
       Avulso00.Avulso_Fornecedor_Nome.Text   := '--- Todos ---';
    End;
    Avulso00.Show;
end;

procedure TIbrasmak00.CSLL1Click(Sender: TObject);
begin
    If (TaxasImpostos00 = Nil) Then
       Begin
       Application.CreateForm(TTaxasImpostos00,TaxasImpostos00);
    End;
    TaxasImpostos00.edtTipo.Text := 'CSLL';
    TaxasImpostos00.Show;
end;

procedure TIbrasmak00.IRPJ1Click(Sender: TObject);
begin
    If (TaxasImpostos00 = Nil) Then
       Begin
       Application.CreateForm(TTaxasImpostos00,TaxasImpostos00);
    End;
    TaxasImpostos00.edtTipo.Text := 'IRPJ';
    TaxasImpostos00.Show;
end;

procedure TIbrasmak00.CSLL2Click(Sender: TObject);
begin
    If (RelImpostosPisCofins00 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins00,RelImpostosPisCofins00);
    End;
    RelImpostosPisCofins00.Acc_Empresa.Text := 'Ibrasmak';
    RelImpostosPisCofins00.edtImposto.Text := 'CSLL';
    RelImpostosPisCofins00.Show;
end;

procedure TIbrasmak00.IRPJ2Click(Sender: TObject);
begin
    If (RelImpostosPisCofins00 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins00,RelImpostosPisCofins00);
    End;
    RelImpostosPisCofins00.Acc_Empresa.Text := 'Ibrasmak';
    RelImpostosPisCofins00.edtImposto.Text := 'IRPJ';
    RelImpostosPisCofins00.Show;
end;

procedure TIbrasmak00.HistricodeCompras1Click(Sender: TObject);
begin
    If (VHistoricoClientes00 = Nil) Then
       Begin
       Application.CreateForm(TVHistoricoClientes00,VHistoricoClientes00);
    End;
    VHistoricoClientes00.Show;
end;

procedure TIbrasmak00.HistricodeComprasporProduto2Click(Sender: TObject);
begin
    If (VHistoricoProdutos00 = Nil) Then
       Begin
       Application.CreateForm(TVHistoricoProdutos00,VHistoricoProdutos00);
    End;
    VHistoricoProdutos00.Tipo_Historico.Text := 'Historico_Clientes';
    VHistoricoProdutos00.Show;
end;

procedure TIbrasmak00.ICMS2Click(Sender: TObject);
begin
    If (RelImpostosPisCofins00 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins00,RelImpostosPisCofins00);
    End;
    RelImpostosPisCofins00.Acc_Empresa.Text := 'Ibrasmak';
    RelImpostosPisCofins00.edtImposto.Text := 'ICMS';
    RelImpostosPisCofins00.Show;
end;

procedure TIbrasmak00.PedidosEnviadosparaFaturamento1Click(
  Sender: TObject);
begin
    If (Faturamento00 = Nil) Then
       Begin
       Application.CreateForm(TFaturamento00,Faturamento00);
    End;
    Faturamento00.Show;
end;

procedure TIbrasmak00.IPI1Click(Sender: TObject);
begin
    If (TaxasImpostos00 = Nil) Then
       Begin
       Application.CreateForm(TTaxasImpostos00,TaxasImpostos00);
    End;
    TaxasImpostos00.edtTipo.Text := 'IPI';
    TaxasImpostos00.Show;
end;

procedure TIbrasmak00.IPI2Click(Sender: TObject);
begin
    If (RelImpostosPisCofins00 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins00,RelImpostosPisCofins00);
    End;
    RelImpostosPisCofins00.Acc_Empresa.Text := 'Ibrasmak';
    RelImpostosPisCofins00.edtImposto.Text := 'IPI';
    RelImpostosPisCofins00.Show;
end;

procedure TIbrasmak00.ContasaReceber2Click(Sender: TObject);
begin
    If (ContasReceberOrcamento00 = Nil) Then
       Begin
       Application.CreateForm(TContasReceberOrcamento00,ContasReceberOrcamento00);
    End;
    ContasReceberOrcamento00.Acc_Empresa.Text := 'Ibrasmak';
    ContasReceberOrcamento00.Show;
end;

procedure TIbrasmak00.RelatriodeContasaPagar1Click(Sender: TObject);
begin
    If (RelContasPagar00 = Nil) Then
       Begin
       Application.CreateForm(TRelContasPagar00,RelContasPagar00);
       RelContasPagar00.Avulso_Fornecedor_Numero.Text := '0';
       RelContasPagar00.Avulso_Fornecedor_Nome.Text   := '--- Todos ---';
    End;
    RelContasPagar00.Show;
end;

procedure TIbrasmak00.RelaodeProdutosComprados1Click(Sender: TObject);
begin
    If (RelacaoProdutoComprado00 = Nil) Then
       Begin
       Application.CreateForm(TRelacaoProdutoComprado00,RelacaoProdutoComprado00);
    End;
    RelacaoProdutoComprado00.Show;
end;

procedure TIbrasmak00.ProdutosdosFornecedores1Click(Sender: TObject);
begin
    If (ProdutosFornecedores00 = Nil) Then
       Begin
       Application.CreateForm(TProdutosFornecedores00,ProdutosFornecedores00);
    End;
    ProdutosFornecedores00.Show;
end;

procedure TIbrasmak00.SadasManualmente1Click(Sender: TObject);
begin
    If (RegistroNotasFiscaisSaidas00 = Nil) Then
       Begin
       Application.CreateForm(TRegistroNotasFiscaisSaidas00,RegistroNotasFiscaisSaidas00);
    End;
    RegistroNotasFiscaisSaidas00.Show;
end;

procedure TIbrasmak00.Funcionrios1Click(Sender: TObject);
begin
     If (Funcionarios00 = Nil) Then
       Begin
       Application.CreateForm(TFuncionarios00,Funcionarios00);
     End;
     Funcionarios00.Show;
end;

procedure TIbrasmak00.PedidosPendentes1Click(Sender: TObject);
begin
    If (PedidosPendentes00 = Nil) Then
       Begin
       Application.CreateForm(TPedidosPendentes00,PedidosPendentes00);
    End;
    PedidosPendentes00.Show;
end;

procedure TIbrasmak00.MapadeProduo1Click(Sender: TObject);
begin
    If (MapaProducao00 = Nil) Then
       Begin
       Application.CreateForm(TMapaProducao00,MapaProducao00);
    End;
    MapaProducao00.Show;
end;

procedure TIbrasmak00.RelatrioComparativoContasaPagarContasaReceber1Click(
  Sender: TObject);
begin
    If (RelComparativo00 = Nil) Then
       Begin
       Application.CreateForm(TRelComparativo00,RelComparativo00);
    End;
    RelComparativo00.Show;
end;

procedure TIbrasmak00.RetornarPedidosJFaturados1Click(Sender: TObject);
begin
    If (RetornarPedidosFaturados00 = Nil) Then
       Begin
       Application.CreateForm(TRetornarPedidosFaturados00,RetornarPedidosFaturados00);
    End;
    RetornarPedidosFaturados00.Show;
end;

procedure TIbrasmak00.EtiquetaSEDEX1Click(Sender: TObject);
begin
    If (OrdemDespachoV00 = Nil) Then
       Begin
       Application.CreateForm(TOrdemDespachoV00,OrdemDespachoV00);
    End;
    OrdemDespachoV00.Show;
end;

procedure TIbrasmak00.RequisicoesClick(Sender: TObject);
begin
    If (Requisicao02 = Nil) Then
       Begin
       Application.CreateForm(TRequisicao02,Requisicao02);
    End;
    Requisicao02.Show;
end;

procedure TIbrasmak00.ContasaReceber4Click(Sender: TObject);
begin
    If (ContasReceber00 = Nil) Then
       Begin
       Application.CreateForm(TContasReceber00,ContasReceber00);
    End;
    ContasReceber00.Acc_Empresa.Text := 'Monibras';
    ContasReceber00.Show;
end;

procedure TIbrasmak00.ContasaReceber3Click(Sender: TObject);
begin
    If (ContasReceberOrcamento00 = Nil) Then
       Begin
       Application.CreateForm(TContasReceberOrcamento00,ContasReceberOrcamento00);
    End;
    ContasReceberOrcamento00.Acc_Empresa.Text := 'Monibras';
    ContasReceberOrcamento00.Show;
end;

procedure TIbrasmak00.NotasFiscais5Click(Sender: TObject);
begin
    If (RelVendasRepresentantes00 = Nil) Then
       Begin
       Application.CreateForm(TRelVendasRepresentantes00,RelVendasRepresentantes00);
    End;
    RelVendasRepresentantes00.Acc_Empresa.Text := 'Monibras';
    RelVendasRepresentantes00.Show;
end;

procedure TIbrasmak00.OutrasSadas2Click(Sender: TObject);
begin
    If (RelFaturamentoOutrasSaidas00 = Nil) Then
       Begin
       Application.CreateForm(TRelFaturamentoOutrasSaidas00,RelFaturamentoOutrasSaidas00);
    End;
    RelFaturamentoOutrasSaidas00.Acc_Empresa.Text := 'Monibras';
    RelFaturamentoOutrasSaidas00.Show;
end;

procedure TIbrasmak00.Sadas2Click(Sender: TObject);
begin
    If (RelFaturamento00 = Nil) Then
       Begin
       Application.CreateForm(TRelFaturamento00,RelFaturamento00);
    End;
    RelFaturamento00.Acc_Empresa.Text := 'Monibras';
    RelFaturamento00.Show;
end;

procedure TIbrasmak00.VendasporPerodo2Click(Sender: TObject);
begin
    If (RelVendasPeriodo00 = Nil) Then
       Begin
       Application.CreateForm(TRelVendasPeriodo00,RelVendasPeriodo00);
    End;
    RelVendasPeriodo00.Acc_Empresa.Text := 'Monibras';
    RelVendasPeriodo00.Show;
end;

procedure TIbrasmak00.PIS3Click(Sender: TObject);
begin
    If (RelImpostosPisCofins02 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins02,RelImpostosPisCofins02);
    End;
    RelImpostosPisCofins02.Acc_Empresa.Text := 'Monibras';
    RelImpostosPisCofins02.edtImposto.Text := 'PIS';
    RelImpostosPisCofins02.Show;
end;

procedure TIbrasmak00.COFINS3Click(Sender: TObject);
begin
    If (RelImpostosPisCofins02 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins02,RelImpostosPisCofins02);
    End;
    RelImpostosPisCofins02.Acc_Empresa.Text := 'Monibras';
    RelImpostosPisCofins02.edtImposto.Text := 'COFINS';
    RelImpostosPisCofins02.Show;
end;

procedure TIbrasmak00.ICMS3Click(Sender: TObject);
begin
    If (RelImpostosPisCofins02 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins02,RelImpostosPisCofins02);
    End;
    RelImpostosPisCofins02.Acc_Empresa.Text := 'Monibras';
    RelImpostosPisCofins02.edtImposto.Text := 'ICMS';
    RelImpostosPisCofins02.Show;
end;

procedure TIbrasmak00.CSLL3Click(Sender: TObject);
begin
    If (RelImpostosPisCofins02 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins02,RelImpostosPisCofins02);
    End;
    RelImpostosPisCofins02.Acc_Empresa.Text := 'Monibras';
    RelImpostosPisCofins02.edtImposto.Text := 'CSLL';
    RelImpostosPisCofins02.Show;
end;

procedure TIbrasmak00.IRPJ3Click(Sender: TObject);
begin
    If (RelImpostosPisCofins02 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins00,RelImpostosPisCofins02);
    End;
    RelImpostosPisCofins02.Acc_Empresa.Text := 'Monibras';
    RelImpostosPisCofins02.edtImposto.Text := 'IRPJ';
    RelImpostosPisCofins02.Show;
end;

procedure TIbrasmak00.IPI3Click(Sender: TObject);
begin
    If (RelImpostosPisCofins02 = Nil) Then
       Begin
       Application.CreateForm(TRelImpostosPisCofins02,RelImpostosPisCofins02);
    End;
    RelImpostosPisCofins02.Acc_Empresa.Text := 'Monibras';
    RelImpostosPisCofins02.edtImposto.Text := 'IPI';
    RelImpostosPisCofins02.Show;
end;

procedure TIbrasmak00.Maioresclientesporvalorvendido2Click(
  Sender: TObject);
begin
    If (RelClientesValorVendido00 = Nil) Then
       Begin
       Application.CreateForm(TRelClientesValorVendido00,RelClientesValorVendido00);
    End;

    RelClientesValorVendido00.Acc_Empresa.Text := 'Monibras';
    RelClientesValorVendido00.Show;
end;

procedure TIbrasmak00.VendasporEstadosRepresentantes2Click(
  Sender: TObject);
begin
    If (RelVendaEstadoRepresentante00 = Nil) Then
       Begin
       Application.CreateForm(TRelVendaEstadoRepresentante00,RelVendaEstadoRepresentante00);
    End;
    RelVendaEstadoRepresentante00.Acc_Empresa.Text := 'Monibras';
    RelVendaEstadoRepresentante00.Show;
end;

procedure TIbrasmak00.OrdemdeCompraporPeriodo1Click(Sender: TObject);
begin
    If (OrdemPeriodo00 = Nil) Then
       Begin
       Application.CreateForm(TOrdemPeriodo00,OrdemPeriodo00);
    End;
    OrdemPeriodo00.Show;
end;

procedure TIbrasmak00.Etapas1Click(Sender: TObject);
begin
    If (Etapas00 = Nil) Then
       Begin
       Application.CreateForm(TEtapas00,Etapas00);
    End;
    Etapas00.Show;
end;

procedure TIbrasmak00.Processos1Click(Sender: TObject);
begin
    If (Processos00 = Nil) Then
       Begin
       Application.CreateForm(TProcessos00,Processos00);
    End;
    Processos00.Show;
end;

procedure TIbrasmak00.SubProcessos1Click(Sender: TObject);
begin
    If (SubProcessos00 = Nil) Then
       Begin
       Application.CreateForm(TSubProcessos00,SubProcessos00);
    End;
    SubProcessos00.Show;
end;

procedure TIbrasmak00.Requisies1Click(Sender: TObject);
begin
     Application.CreateForm(TRelOSCanceladas00,RelOSCanceladas00);

     RelOSCanceladas00.Caption      := 'Relatório Cancelamentos - Requisição';
     RelOSCanceladas00.OS_Tipo.Text := 'Requisição';

     RelOSCanceladas00.ShowModal;
     RelOSCanceladas00.Destroy;
end;

procedure TIbrasmak00.Cotaes1Click(Sender: TObject);
begin
     Application.CreateForm(TRelOSCanceladas00,RelOSCanceladas00);

     RelOSCanceladas00.Caption      := 'Relatório Cancelamentos - Cotação';
     RelOSCanceladas00.OS_Tipo.Text := 'Cotação';

     RelOSCanceladas00.ShowModal;
     RelOSCanceladas00.Destroy;
end;

procedure TIbrasmak00.OrdensdeCompra1Click(Sender: TObject);
begin
     Application.CreateForm(TRelOSCanceladas00,RelOSCanceladas00);

     RelOSCanceladas00.Caption      := 'Relatório Cancelamentos - Ordem de Compra';
     RelOSCanceladas00.OS_Tipo.Text := 'Ordem de Compra';

     RelOSCanceladas00.ShowModal;
     RelOSCanceladas00.Destroy;
end;

procedure TIbrasmak00.FiladeEspera1Click(Sender: TObject);
begin
     Application.CreateForm(TFilaEspera00,FilaEspera00);
     FilaEspera00.ShowModal;
     FilaEspera00.Destroy;
end;

procedure TIbrasmak00.FiladeProduo1Click(Sender: TObject);
begin
     Application.CreateForm(TFilaProducao00,FilaProducao00);
     FilaProducao00.ShowModal;
     FilaProducao00.Destroy;
end;

procedure TIbrasmak00.Departamentos1Click(Sender: TObject);
begin
     Application.CreateForm(TDepto00,Depto00);
     Depto00.ShowModal;
     Depto00.Destroy;
end;

procedure TIbrasmak00.Funcionrios2Click(Sender: TObject);
begin
    If (RelFuncionarios00 = Nil) Then
       Begin
       Application.CreateForm(TRelFuncionarios00,RelFuncionarios00);
     End;
     RelFuncionarios00.Show;
end;

procedure TIbrasmak00.ClientesporRepresentante1Click(Sender: TObject);
begin
    If (RelClienteRepresentante00 = Nil) Then
       Begin
       Application.CreateForm(TRelClienteRepresentante00,RelClienteRepresentante00);
     End;
     RelClienteRepresentante00.Show;
end;

procedure TIbrasmak00.Fornecedores2Click(Sender: TObject);
begin
    If (RelFornecedores00 = Nil) Then
       Begin
       Application.CreateForm(TRelFornecedores00,RelFornecedores00);
     End;
     RelFornecedores00.Show;
end;

procedure TIbrasmak00.PedidodeCompra1Click(Sender: TObject);
begin
    If (RelPedidoCompra00 = Nil) Then
       Begin
       Application.CreateForm(TRelPedidoCompra00,RelPedidoCompra00);
    End;
    RelPedidoCompra00.Show;
end;

procedure TIbrasmak00.Papeletas3Click(Sender: TObject);
begin
    If (HistoricosPedidos00 = Nil) Then
       Begin
       Application.CreateForm(THistoricosPedidos00,HistoricosPedidos00);
    End;
    HistoricosPedidos00.Show;
end;

procedure TIbrasmak00.Entradas3Click(Sender: TObject);
begin
    If (HistoricosNotasFiscaisEntradas00 = Nil) Then
       Begin
       Application.CreateForm(THistoricosNotasFiscaisEntradas00,HistoricosNotasFiscaisEntradas00);
    End;
    HistoricosNotasFiscaisEntradas00.Show;
end;

procedure TIbrasmak00.Sadas3Click(Sender: TObject);
begin
    If (HistoricosRegistroNotasFiscaisSaidas00 = Nil) Then
       Begin
       Application.CreateForm(THistoricosRegistroNotasFiscaisSaidas00,HistoricosRegistroNotasFiscaisSaidas00);
    End;
    HistoricosRegistroNotasFiscaisSaidas00.Show;
end;

procedure TIbrasmak00.RegistrodePapeletasManual1Click(Sender: TObject);
begin
    If (RegistroPapeletasSaidas00 = Nil) Then
       Begin
       Application.CreateForm(TRegistroPapeletasSaidas00,RegistroPapeletasSaidas00);
    End;
    RegistroPapeletasSaidas00.Show;
end;

procedure TIbrasmak00.NaturezasdeOperao1Click(Sender: TObject);
begin
  Application.CreateForm(TNaturezaOperacao00,NaturezaOperacao00);
  NaturezaOperacao00.ShowModal;
  NaturezaOperacao00.Destroy;
end;

procedure TIbrasmak00.ExclusodeMovimento1Click(Sender: TObject);
begin
    If (EstoqueExclusao00 = Nil) Then
       Begin
       Application.CreateForm(TEstoqueExclusao00,EstoqueExclusao00);
    End;
    EstoqueExclusao00.Show;
end;

procedure TIbrasmak00.OSRegistroGeral1Click(Sender: TObject);
begin
    Application.CreateForm(TRegistroOS00,RegistroOS00);
    RegistroOS00.ShowModal;
    RegistroOS00.Destroy;
end;

procedure TIbrasmak00.NotaFiscalEletrnicaNFe1Click(Sender: TObject);
begin
   If (NotasFiscaisSaidas00 = Nil) Then
       Begin
       Application.CreateForm(TNotasFiscaisSaidas00,NotasFiscaisSaidas00);
    End;
    //NotasFiscaisSaidas00.DBG_Pedidos_Monibras.Enabled := False;
    NotasFiscaisSaidas00.Tipo_Emissao_Nota.Text       := 'NFe';
    NotasFiscaisSaidas00.Show;
end;

procedure TIbrasmak00.NotaFiscalEletrnicaManualNFe1Click(Sender: TObject);
begin
   If (RegistroNotasFiscaisSaidas00 = Nil) Then
       Begin
       Application.CreateForm(TRegistroNotasFiscaisSaidas00,RegistroNotasFiscaisSaidas00);
    End;
    RegistroNotasFiscaisSaidas00.Tipo_Emissao_Nota.Text := 'NFe';
    RegistroNotasFiscaisSaidas00.Show;
end;

procedure TIbrasmak00.OrdensdeServio1Click(Sender: TObject);
begin
    If (RelVendasRepresentantes06 = Nil) Then
       Begin
       Application.CreateForm(TRelVendasRepresentantes06,RelVendasRepresentantes06);
    End;
    RelVendasRepresentantes06.Acc_Empresa.Text := 'Ibrasmak';
    RelVendasRepresentantes06.Show;
end;

procedure TIbrasmak00.OSOrdensdeServio1Click(Sender: TObject);
begin
    If (RelVendasRepresentantes06 = Nil) Then
       Begin
       Application.CreateForm(TRelVendasRepresentantes06,RelVendasRepresentantes06);
    End;
    RelVendasRepresentantes06.Acc_Empresa.Text := 'Monibras';
    RelVendasRepresentantes06.Show;
end;

procedure TIbrasmak00.OSOrdensdeServio2Click(Sender: TObject);
begin
    If (RelFaturamento02 = Nil) Then
       Begin
       Application.CreateForm(TRelFaturamento02,RelFaturamento02);
    End;
    RelFaturamento02.Acc_Empresa.Text := 'Ibrasmak';
    RelFaturamento02.Show;
end;

procedure TIbrasmak00.OSOrdensdeServio3Click(Sender: TObject);
begin
    If (RelFaturamento02 = Nil) Then
       Begin
       Application.CreateForm(TRelFaturamento02,RelFaturamento02);
    End;
    RelFaturamento02.Acc_Empresa.Text := 'Monibras';
    RelFaturamento02.Show;
end;

end.
