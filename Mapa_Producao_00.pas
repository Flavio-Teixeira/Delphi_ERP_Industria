unit Mapa_Producao_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TMapaProducao00 = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Calculo_Periodo_Inicial: TMaskEdit;
    Calculo_Periodo_Final: TMaskEdit;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    Cliente_Codigo: TEdit;
    Cliente_Nome: TEdit;
    Label3: TLabel;
    BT_Procurar: TBitBtn;
    GroupBox3: TGroupBox;
    BT_Procurar_Produto: TBitBtn;
    Label1: TLabel;
    Adiciona_Codigo_Produto: TEdit;
    Adiciona_Referencia: TEdit;
    Label2: TLabel;
    Adiciona_Descricao: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_Procurar_ProdutoClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure Calculo_Periodo_InicialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Calculo_Periodo_FinalKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MapaProducao00: TMapaProducao00;

implementation

uses Clientes_00, Conexao_BD, Rotinas_Gerais, Adiciona_Produto_Relacao,
  Mapa_Producao_01;

{$R *.dfm}

procedure TMapaProducao00.BT_SairClick(Sender: TObject);
begin
     MapaProducao00.Close;
end;

procedure TMapaProducao00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TMapaProducao00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     MapaProducao00 := Nil;
end;

procedure TMapaProducao00.FormShow(Sender: TObject);
begin
    //*** Carrega data atual nos campos de periodo ***

    Calculo_Periodo_Final.Text   := DateToStr(Date());
    Calculo_Periodo_Inicial.Text := '01/01/' + Trim(Copy(Calculo_Periodo_Final.Text,7,4));
end;

procedure TMapaProducao00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();
     Application.CreateForm(TClientes00,Clientes00);

     Adiciona_Codigo_Produto.Text := '';
     Adiciona_Referencia.Text     := '';
     Adiciona_Descricao.Text      := '';

     Clientes00.Programa_Anterior.Text := 'Mapa-Produção';

     Seta();

     Clientes00.ShowModal;
end;

procedure TMapaProducao00.BT_Procurar_ProdutoClick(Sender: TObject);
begin
     Ampulheta();

     Application.CreateForm(TAdicionaProdutoRelacao,AdicionaProdutoRelacao);

     Cliente_Codigo.Text := '';
     Cliente_Nome.Text   := '';

     AdicionaProdutoRelacao.Programa_Anterior.Text    := 'Mapa-Produção';

     Seta();
     AdicionaProdutoRelacao.ShowModal;
     AdicionaProdutoRelacao.Destroy;
end;

procedure TMapaProducao00.BT_ImprimirClick(Sender: TObject);

var
   Comando_SQL: String;

begin
    If Trim(Calculo_Periodo_Inicial.Text) = '/  /' Then
       Begin
       MSG_Erro('Antes de prosseguir favor preencher o campo Data inicial...');
       Calculo_Periodo_Inicial.SetFocus;
       End
    Else If Trim(Calculo_Periodo_Final.Text) = '/  /' then
       Begin
       MSG_Erro('Antes de prosseguir favor preencher o campo Data final...');
       Calculo_Periodo_Final.SetFocus;
       End
    Else If StrToDate(Calculo_Periodo_Inicial.Text) > StrToDate(Calculo_Periodo_Final.Text) then
       Begin
       MSG_Erro('Antes de prosseguir favor Verificar as datas Data Final menor que Data Inicial...');
       Calculo_Periodo_Final.SetFocus;
       End
    Else
       Begin

        If Trim(Cliente_Codigo.Text) <> '' Then
           Begin
           Ampulheta();

           Comando_SQL := 'Select ';
           Comando_SQL := Comando_SQL + 'pedido_numero, ';
           Comando_SQL := Comando_SQL + 'pedido_cliente_codigo, ';
           Comando_SQL := Comando_SQL + 'pedido_cliente_nome, ';
           Comando_SQL := Comando_SQL + 'pedido_status, ';
           Comando_SQL := Comando_SQL + 'pedido_data_entrega, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_numero_pedido, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_codigo, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_referencia, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_descricao, ';
           Comando_SQL := Comando_SQL + 'SUM(pedido_produto_quantidade) AS pedido_produto_quantidade ';
           Comando_SQL := Comando_SQL + 'From pedidos, pedidos_produtos Where ';
           Comando_SQL := Comando_SQL + 'pedido_cliente_codigo = '+#39+Trim(Cliente_Codigo.Text)+#39+' And ';
           Comando_SQL := Comando_SQL + '(pedido_data_entrega >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' And pedido_data_entrega <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') And ';
           Comando_SQL := Comando_SQL + 'pedido_status <> '+#39+'Faturado'+#39+' And pedido_produto_numero_pedido = pedido_numero ';
           Comando_SQL := Comando_SQL + 'Group By pedido_produto_codigo Order By pedido_produto_codigo Asc';

           ConexaoBD.SQL_Mapa_Producao_Cliente.Close;
           ConexaoBD.SQL_Mapa_Producao_Cliente.SQL.Clear;
           ConexaoBD.SQL_Mapa_Producao_Cliente.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Mapa_Producao_Cliente.Open;

           Application.CreateForm(TMapaProducao01,MapaProducao01);

           MapaProducao01.QR_Periodo.Caption := 'Período de Previsão de Entrega de ' + Trim(Calculo_Periodo_Inicial.Text) + ' a ' + Trim(Calculo_Periodo_Final.Text) + ' - Por Cliente: ' + Trim(Cliente_Codigo.Text) + ' - ' + Trim(Cliente_Nome.Text);

           Seta();

           MapaProducao01.QR_Relatorio.Preview;
           MapaProducao01.Destroy;
           End
        Else If Trim(Adiciona_Codigo_Produto.Text) <> '' Then
           Begin
           Ampulheta();

           Comando_SQL := 'Select ';
           Comando_SQL := Comando_SQL + 'pedido_numero, ';
           Comando_SQL := Comando_SQL + 'pedido_cliente_codigo, ';
           Comando_SQL := Comando_SQL + 'pedido_cliente_nome, ';
           Comando_SQL := Comando_SQL + 'pedido_status, ';
           Comando_SQL := Comando_SQL + 'pedido_data_entrega, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_numero_pedido, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_codigo, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_referencia, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_descricao, ';
           Comando_SQL := Comando_SQL + 'SUM(pedido_produto_quantidade) AS pedido_produto_quantidade ';
           Comando_SQL := Comando_SQL + 'From pedidos, pedidos_produtos Where ';
           Comando_SQL := Comando_SQL + 'pedido_status <> '+#39+'Faturado'+#39+' And pedido_produto_numero_pedido = pedido_numero And ';
           Comando_SQL := Comando_SQL + 'pedido_produto_codigo = '+#39+Trim(Adiciona_Codigo_Produto.Text)+#39+' And ';
           Comando_SQL := Comando_SQL + '(pedido_data_entrega >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' And pedido_data_entrega <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') ';
           Comando_SQL := Comando_SQL + 'Group By pedido_produto_codigo Order By pedido_produto_codigo Asc';

           ConexaoBD.SQL_Mapa_Producao_Cliente.Close;
           ConexaoBD.SQL_Mapa_Producao_Cliente.SQL.Clear;
           ConexaoBD.SQL_Mapa_Producao_Cliente.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Mapa_Producao_Cliente.Open;

           Application.CreateForm(TMapaProducao01,MapaProducao01);

           MapaProducao01.QR_Periodo.Caption := 'Período de Previsão de Entrega de ' + Trim(Calculo_Periodo_Inicial.Text) + ' a ' + Trim(Calculo_Periodo_Final.Text) + ' - Por Produto - Código: ' + Trim(Adiciona_Codigo_Produto.Text) + ' - Referência: ' + Trim(Adiciona_Referencia.Text) +  ' - Descrição: ' + Trim(Adiciona_Descricao.Text);

           Seta();

           MapaProducao01.QR_Relatorio.Preview;
           MapaProducao01.Destroy;
           End
        Else
           Begin
           Ampulheta();

           Comando_SQL := 'Select ';
           Comando_SQL := Comando_SQL + 'pedido_numero, ';
           Comando_SQL := Comando_SQL + 'pedido_cliente_codigo, ';
           Comando_SQL := Comando_SQL + 'pedido_cliente_nome, ';
           Comando_SQL := Comando_SQL + 'pedido_status, ';
           Comando_SQL := Comando_SQL + 'pedido_data_entrega, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_numero_pedido, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_codigo, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_referencia, ';
           Comando_SQL := Comando_SQL + 'pedido_produto_descricao, ';
           Comando_SQL := Comando_SQL + 'SUM(pedido_produto_quantidade) AS pedido_produto_quantidade ';
           Comando_SQL := Comando_SQL + 'From pedidos, pedidos_produtos Where ';
           Comando_SQL := Comando_SQL + 'pedido_status <> '+#39+'Faturado'+#39+' And pedido_produto_numero_pedido = pedido_numero And ';
           Comando_SQL := Comando_SQL + '(pedido_data_entrega >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+' And pedido_data_entrega <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+') ';
           Comando_SQL := Comando_SQL + 'Group By pedido_produto_codigo Order By pedido_produto_codigo Asc';

           ConexaoBD.SQL_Mapa_Producao_Cliente.Close;
           ConexaoBD.SQL_Mapa_Producao_Cliente.SQL.Clear;
           ConexaoBD.SQL_Mapa_Producao_Cliente.SQL.Add(Comando_SQL);
           ConexaoBD.SQL_Mapa_Producao_Cliente.Open;

           Application.CreateForm(TMapaProducao01,MapaProducao01);

           MapaProducao01.QR_Periodo.Caption := 'Período de Previsão de Entrega de ' + Trim(Calculo_Periodo_Inicial.Text) + ' a ' + Trim(Calculo_Periodo_Final.Text) + ' - Por Produto - Geral';

           Seta();

           MapaProducao01.QR_Relatorio.Preview;
           MapaProducao01.Destroy;
        End;

    End;
end;

procedure TMapaProducao00.Calculo_Periodo_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TMapaProducao00.Calculo_Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
