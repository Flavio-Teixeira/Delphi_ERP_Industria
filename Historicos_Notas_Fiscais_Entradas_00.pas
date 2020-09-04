unit Historicos_Notas_Fiscais_Entradas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask;

type
  THistoricosNotasFiscaisEntradas00 = class(TForm)
    Panel2: TPanel;
    DBGrid_Notas: TDBGrid;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    DBG_Cliente_Observacao: TDBMemo;
    DBG_Observacao_Nota: TDBMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dados_Procura: TEdit;
    BT_Procurar: TBitBtn;
    Opcoes_Procura: TComboBox;
    Label4: TLabel;
    Data_Inicial: TMaskEdit;
    Label5: TLabel;
    Data_Final: TMaskEdit;
    BT_Imprimir: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_NotasCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Procura_Notas();
  public
    { Public declarations }
  end;

var
  HistoricosNotasFiscaisEntradas00: THistoricosNotasFiscaisEntradas00;
  Selecionado: string;

implementation

uses Conexao_BD, Rotinas_Gerais, Notas_Fiscais_Entradas_01,
  Notas_Fiscais_Entradas_02, Notas_Fiscais_Entradas_06,
  Historicos_Notas_Fiscais_Entradas_01, Rel_Faturamento_01;

{$R *.dfm}

procedure THistoricosNotasFiscaisEntradas00.Procura_Notas();
begin
     Ampulheta();

     ConexaoBD.SQL_FB_Notas_Entradas.Close;
     ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin

        If Opcoes_Procura.Text = 'Nro.Nota' Then
           Begin
           ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * from fb_notas_entradas Where fb_nota_entrada_numero_nota = ' + Trim(Dados_Procura.Text) + ' and fb_nota_entrada_data_emissao >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_nota_entrada_data_emissao <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_nota_entrada_data_emissao Desc');
           End
        Else If Opcoes_Procura.Text = 'Fornecedor' Then
           Begin
           ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * from fb_notas_entradas Where fb_nota_entrada_fornecedor_nome Like '  +#39+ Trim(Dados_Procura.Text) +'%'+#39+ ' and fb_nota_entrada_data_emissao >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_nota_entrada_data_emissao <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_nota_entrada_data_emissao Desc');
        End;

        End
     Else
        Begin

        If Opcoes_Procura.Text = 'Nro.Nota' Then
           Begin
           ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * from fb_notas_entradas where fb_nota_entrada_data_emissao >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_nota_entrada_data_emissao <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_nota_entrada_data_emissao Desc');
           End
        Else If Opcoes_Procura.Text = 'Fornecedor' Then
           Begin
           ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * from fb_notas_entradas where fb_nota_entrada_data_emissao >= ' + #39 + Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') + #39 + ' and fb_nota_entrada_data_emissao <= ' + #39 + Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') + #39 + ' Order By fb_nota_entrada_data_emissao Desc');
        End;

     End;

     ConexaoBD.SQL_FB_Notas_Entradas.Open;
     Seta();
end;

procedure THistoricosNotasFiscaisEntradas00.BT_SairClick(Sender: TObject);
begin
     HistoricosNotasFiscaisEntradas00.Close;
end;

procedure THistoricosNotasFiscaisEntradas00.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosNotasFiscaisEntradas00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure THistoricosNotasFiscaisEntradas00.BT_ProcurarClick(Sender: TObject);
begin
   Procura_Notas();
end;

procedure THistoricosNotasFiscaisEntradas00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure THistoricosNotasFiscaisEntradas00.FormShow(Sender: TObject);
begin
    //*** Carrega data atual nos campos de periodo ***
    Data_Final.Text   := DateToStr(Date());
    Data_Inicial.Text := '01/01/' + Trim(Copy(Data_Final.Text,7,4));
    
    If Trim(Dados_Procura.Text) <> '' Then
       Begin
       BT_ProcurarClick(Sender);
       End
    Else
       Begin
       ConexaoBD.SQL_FB_Notas_Entradas.Close;
       ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
       ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add('Select * from fb_notas_entradas Order By fb_nota_entrada_data_emissao Desc');
       ConexaoBD.SQL_FB_Notas_Entradas.Open;
    End;
end;

procedure THistoricosNotasFiscaisEntradas00.DBGrid_NotasCellClick(Column: TColumn);
var
    Selecionado: String;
    Posicao_Nota: String;
    Erro: Integer;
    Vlr_Numero: Real;
begin
    If DBGrid_Notas.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Notas.Fields[0].Text;

      If (HistoricosNotasFiscaisEntradas01 = Nil) Then
        Begin
        Ampulheta();
        Application.CreateForm(THistoricosNotasFiscaisEntradas01,HistoricosNotasFiscaisEntradas01);

        Posicao_Nota                                       := DBGrid_Notas.Fields[5].Text;
        HistoricosNotasFiscaisEntradas01.Posicao_Nota.Text := Posicao_Nota;

        Seta();
      End;

      HistoricosNotasFiscaisEntradas01.ShowModal;

      Procura_Notas();

      ConexaoBD.SQL_FB_Notas_Entradas.Locate('fb_nota_entrada_numero_nota',Trim(Selecionado),[]);

    End;
end;

procedure THistoricosNotasFiscaisEntradas00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     HistoricosNotasFiscaisEntradas00 := Nil;
end;

procedure THistoricosNotasFiscaisEntradas00.BT_ImprimirClick(
  Sender: TObject);

var
   Comando_SQL: String;

begin
     Ampulheta();

     Application.CreateForm(TRelFaturamento01,RelFaturamento01);

     Comando_SQL := 'Select ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_numero_nota As fb_nota_fiscal_numero, ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_data_emissao As fb_nota_fiscal_data_emissao, ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_cfop As fb_nota_fiscal_cfop, ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_natureza_operacao As fb_nota_fiscal_natureza_oper_desc, ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_fornecedor_nro As fb_nota_fiscal_codigo, ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_fornecedor_nome As fb_nota_fiscal_nome, ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_vlr_nota As fb_nota_fiscal_valor_total, ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_vlr_icms As fb_nota_fiscal_icms, ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_vlr_ipi As fb_nota_fiscal_valor_ipi, ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_p_vlr_produtos As fb_nota_fiscal_valor_pedido, ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_utilizacao As fb_nota_fiscal_utilizacao ';
     Comando_SQL := Comando_SQL + 'from fb_notas_entradas Where ';
     Comando_SQL := Comando_SQL + '((fb_nota_entrada_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') and ';
     Comando_SQL := Comando_SQL + '(fb_nota_entrada_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) ';
     Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_cfop, fb_nota_fiscal_data_emissao, fb_nota_fiscal_numero';

     ConexaoBD.SQL_FB_Rel_Faturamento.Close;
     ConexaoBD.SQL_FB_Rel_Faturamento.SQL.Clear;
     ConexaoBD.SQL_FB_Rel_Faturamento.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_FB_Rel_Faturamento.Open;

     RelFaturamento01.LBL_Empresa.Caption := 'Ibrasmak';
     RelFaturamento01.QR_Titulo.Caption   := 'Relatório de Notas de Entradas';
     RelFaturamento01.QRLabel17.Caption   := 'Fornecedor';
     RelFaturamento01.QR_Periodo.Caption  := 'Péríodo de ' + Data_Inicial.Text + ' a ' + Data_Final.Text;

     Seta();

     RelFaturamento01.QR_Faturamento.Preview;
     RelFaturamento01.QR_Faturamento.Destroy;
     RelFaturamento01.Destroy;
end;

end.
