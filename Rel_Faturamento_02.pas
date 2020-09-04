unit Rel_Faturamento_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelFaturamento02 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Data_Inicial: TMaskEdit;
    Data_Final: TMaskEdit;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Acc_Empresa: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelFaturamento02: TRelFaturamento02;

implementation

uses Rel_Faturamento_03, Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TRelFaturamento02.BT_SairClick(Sender: TObject);
begin
    RelFaturamento02.Close;
end;

procedure TRelFaturamento02.Data_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelFaturamento02.Data_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelFaturamento02.FormShow(Sender: TObject);
begin
    // Carrega data atual nos campos de periodo
    Data_Inicial.Text := DateToStr(Date());
    Data_Final.Text   := DateToStr(Date());
end;

procedure TRelFaturamento02.FormCreate(Sender: TObject);
begin
//*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TRelFaturamento02.BT_ImprimirClick(Sender: TObject);

var
  Comando_SQL : String;
  vlr_faturado1, vlr_a_vista1, vlr_total1,
  vlr_faturado2, vlr_a_vista2, vlr_total2,
  vlr_faturado3, vlr_a_vista3, vlr_total3 : real;
  qtde_faturado1, qtde_a_vista1, qtde_total1,
  qtde_faturado2, qtde_a_vista2, qtde_total2,
  qtde_faturado3, qtde_a_vista3, qtde_total3 : integer;
  Nome_Tabela_Nota, Nome_Tabela_Nota_Produto, Nro_Nota: String;

begin
  if Trim(Data_Inicial.Text) = '/  /' Then
    begin
    MSG_Erro('Antes de prosseguir favor preencher o campo Data inicial...');
    Data_Inicial.SetFocus;
    end
  else if Trim(Data_Final.Text) = '/  /' then
    begin
    MSG_Erro('Antes de prosseguir favor preencher o campo Data final...');
    Data_Final.SetFocus;
    end
  else if StrToDate(Data_Inicial.Text) > StrToDate(Data_Final.Text) then
    begin
    MSG_Erro('Antes de prosseguir favor Verificar as datas Data Final menor que Data Inicial...');
    Data_Final.SetFocus;
    end
  else
    begin

    if Acc_Empresa.Text = 'Monibras' then
        begin

        Ampulheta();

        Application.CreateForm(TRelFaturamento03,RelFaturamento03);

        //*** Totaliza as OS ***

        Comando_SQL := 'Select * from pedidos, fb_clientes ';
        Comando_SQL := Comando_SQL + 'Where (pedido_data >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') +#39+') and (pedido_data <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') +#39+') ';
        Comando_SQL := Comando_SQL + 'and (pedido_empresa = '+#39+ 'Monibras' +#39+ ') ';
        Comando_SQL := Comando_SQL + 'and (pedido_cliente_codigo = fb_cliente_codigo) ';
        Comando_SQL := Comando_SQL + ' Order By pedido_data ASC, pedido_numero ASC';

        ConexaoBD.SQL_Rel_Faturamento_OS.Close;
        ConexaoBD.SQL_Rel_Faturamento_OS.SQL.Clear;
        ConexaoBD.SQL_Rel_Faturamento_OS.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Rel_Faturamento_OS.Open;

        //*** Prepara as Informações ***

        vlr_faturado1   := 0;
        vlr_a_vista1    := 0;
        vlr_total1      := 0;
        qtde_faturado1  := 0;
        qtde_a_vista1   := 0;
        qtde_total1     := 0;
        vlr_faturado2   := 0;
        vlr_a_vista2    := 0;
        vlr_total2      := 0;
        qtde_faturado2  := 0;
        qtde_a_vista2   := 0;
        qtde_total2     := 0;
        vlr_faturado3   := 0;
        vlr_a_vista3    := 0;
        vlr_total3      := 0;
        qtde_faturado3  := 0;
        qtde_a_vista3   := 0;
        qtde_total3     := 0;

        //*** Efetua os Cálculos ***

        While NOT ConexaoBD.SQL_Rel_Faturamento_OS.Eof Do
              Begin

              //*** Total ***

              If Trim(ConexaoBD.SQL_Rel_Faturamento_OSfb_cliente_estado.Text)= 'SP' Then
                 Begin
                 vlr_total1  := vlr_total1 + ConexaoBD.SQL_Rel_Faturamento_OSpedido_valor_pedido.AsFloat;
                 qtde_total1 := qtde_total1 + 1;
                 End
              Else If Trim(ConexaoBD.SQL_Rel_Faturamento_OSfb_cliente_estado.Text)<> 'SP' Then
                 Begin
                 vlr_total2  := vlr_total2 + ConexaoBD.SQL_Rel_Faturamento_OSpedido_valor_pedido.AsFloat;
                 qtde_total2 := qtde_total2 + 1;
              End;

              vlr_total3  := vlr_total3 + ConexaoBD.SQL_Rel_Faturamento_OSpedido_valor_pedido.AsFloat;
              qtde_total3 := qtde_total3 + 1;

              ConexaoBD.SQL_Rel_Faturamento_OS.Next;
        End;

        //*** Envia dados para relatório ***

        RelFaturamento03.QRNFS_Faturadas_Estadual_Vlr.Caption         := 'R$ ' + Trim(FormatFloat('0.00',vlr_total1));
        RelFaturamento03.QRNFS_Faturadas_Inter_Estadual_Vlr.Caption   := 'R$ ' + Trim(FormatFloat('0.00',vlr_total2));
        RelFaturamento03.QRNFS_Faturadas_Total_Vlr.Caption            := 'R$ ' + Trim(FormatFloat('0.00',vlr_total3));
        RelFaturamento03.QRNFS_Faturadas_Estadual_Qtde.Caption        := IntToStr(qtde_total1);
        RelFaturamento03.QRNFS_Faturadas_Inter_Estadual_Qtde.Caption  := IntToStr(qtde_total2);
        RelFaturamento03.QRNFS_Faturadas_Total_Qtde.Caption           := IntToStr(qtde_total3);

        //*** Seleciona todas as OS Emitidas no Período ***

        ConexaoBD.SQL_Rel_Faturamento_OS.First;
        RelFaturamento03.QR_Empresa.Caption := 'Monibras';
        RelFaturamento03.QR_Periodo.Caption := 'Período de ' + Trim(Data_Inicial.Text) + ' até ' + Trim(Data_Final.Text);

        Seta();

        RelFaturamento03.QR_Faturamento.Preview;
        RelFaturamento03.Destroy;

        ConexaoBD.SQL_Rel_Faturamento_OS.Close;

        end
    else
        begin
        Ampulheta();

        Application.CreateForm(TRelFaturamento03,RelFaturamento03);

        //*** Totaliza as OS ***

        Comando_SQL := 'Select * from pedidos, fb_clientes ';
        Comando_SQL := Comando_SQL + 'Where (pedido_data >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') +#39+') and (pedido_data <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') +#39+') ';
        Comando_SQL := Comando_SQL + 'and (pedido_empresa = '+#39+ 'Ibrasmak' +#39+ ') ';
        Comando_SQL := Comando_SQL + 'and (pedido_cliente_codigo = fb_cliente_codigo) ';
        Comando_SQL := Comando_SQL + ' Order By pedido_data ASC, pedido_numero ASC';

        ConexaoBD.SQL_Rel_Faturamento_OS.Close;
        ConexaoBD.SQL_Rel_Faturamento_OS.SQL.Clear;
        ConexaoBD.SQL_Rel_Faturamento_OS.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Rel_Faturamento_OS.Open;

        //*** Prepara as Informações ***

        vlr_faturado1   := 0;
        vlr_a_vista1    := 0;
        vlr_total1      := 0;
        qtde_faturado1  := 0;
        qtde_a_vista1   := 0;
        qtde_total1     := 0;
        vlr_faturado2   := 0;
        vlr_a_vista2    := 0;
        vlr_total2      := 0;
        qtde_faturado2  := 0;
        qtde_a_vista2   := 0;
        qtde_total2     := 0;
        vlr_faturado3   := 0;
        vlr_a_vista3    := 0;
        vlr_total3      := 0;
        qtde_faturado3  := 0;
        qtde_a_vista3   := 0;
        qtde_total3     := 0;

        //*** Efetua os Cálculos ***

        While NOT ConexaoBD.SQL_Rel_Faturamento_OS.Eof Do
              Begin

              //*** Total ***

              If Trim(ConexaoBD.SQL_Rel_Faturamento_OSfb_cliente_estado.Text)= 'SP' Then
                 Begin
                 vlr_total1  := vlr_total1 + ConexaoBD.SQL_Rel_Faturamento_OSpedido_valor_pedido.AsFloat;
                 qtde_total1 := qtde_total1 + 1;
                 End
              Else If Trim(ConexaoBD.SQL_Rel_Faturamento_OSfb_cliente_estado.Text)<> 'SP' Then
                 Begin
                 vlr_total2  := vlr_total2 + ConexaoBD.SQL_Rel_Faturamento_OSpedido_valor_pedido.AsFloat;
                 qtde_total2 := qtde_total2 + 1;
              End;

              vlr_total3  := vlr_total3 + ConexaoBD.SQL_Rel_Faturamento_OSpedido_valor_pedido.AsFloat;
              qtde_total3 := qtde_total3 + 1;

              ConexaoBD.SQL_Rel_Faturamento_OS.Next;
        End;

        //*** Envia dados para relatório ***

        RelFaturamento03.QRNFS_Faturadas_Estadual_Vlr.Caption         := 'R$ ' + Trim(FormatFloat('0.00',vlr_total1));
        RelFaturamento03.QRNFS_Faturadas_Inter_Estadual_Vlr.Caption   := 'R$ ' + Trim(FormatFloat('0.00',vlr_total2));
        RelFaturamento03.QRNFS_Faturadas_Total_Vlr.Caption            := 'R$ ' + Trim(FormatFloat('0.00',vlr_total3));
        RelFaturamento03.QRNFS_Faturadas_Estadual_Qtde.Caption        := IntToStr(qtde_total1);
        RelFaturamento03.QRNFS_Faturadas_Inter_Estadual_Qtde.Caption  := IntToStr(qtde_total2);
        RelFaturamento03.QRNFS_Faturadas_Total_Qtde.Caption           := IntToStr(qtde_total3);

        //*** Seleciona todas as OS Emitidas no Período ***

        ConexaoBD.SQL_Rel_Faturamento_OS.First;
        RelFaturamento03.QR_Empresa.Caption := 'Ibrasmak';
        RelFaturamento03.QR_Periodo.Caption := 'Período de ' + Trim(Data_Inicial.Text) + ' até ' + Trim(Data_Final.Text);

        Seta();

        RelFaturamento03.QR_Faturamento.Preview;
        RelFaturamento03.Destroy;

        ConexaoBD.SQL_Rel_Faturamento_OS.Close;
    end;

  end;

end;

end.
