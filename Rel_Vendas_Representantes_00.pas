unit Rel_Vendas_Representantes_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelVendasRepresentantes00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Data_Inicial: TMaskEdit;
    Data_Final: TMaskEdit;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    CMB_Representante: TComboBox;
    Acc_Empresa: TEdit;
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure RepresentanteKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CMB_RepresentanteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelVendasRepresentantes00: TRelVendasRepresentantes00;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Vendas_Representantes_01,
  Ibrasmak_00, Rel_Vendas_Representantes_04;

{$R *.dfm}

procedure TRelVendasRepresentantes00.Data_InicialKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelVendasRepresentantes00.Data_FinalKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelVendasRepresentantes00.BT_ImprimirClick(Sender: TObject);
var
  Comando_SQL, Representante : String;
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

        Application.CreateForm(TRelVendasRepresentantes04,RelVendasRepresentantes04);

        Comando_SQL := '';

        if Trim(CMB_Representante.Text) = 'Todos os Repesentantes' Then
          Begin
          Comando_SQL := 'Select * from mb_notas_fiscais, fb_representantes ';
          Comando_SQL := Comando_SQL + 'Where (mb_nota_fiscal_data_emissao >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') +#39+') and (mb_nota_fiscal_data_emissao <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') +#39+' and (mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+')) ';
          Comando_SQL := Comando_SQL + 'and (mb_nota_fiscal_vendedor = fb_representante_codigo) and (fb_representante_relatorio = '+#39+'S'+#39+') and (mb_nota_fiscal_tipo_fatura = '+#39+'Nota Fiscal'+#39+')';
          Comando_SQL := Comando_SQL + ' Order By mb_nota_fiscal_vendedor, mb_nota_fiscal_numero';
          End
        Else
          Begin
          Representante := '';
          Representante := Obtem_Nro_Antes_Traco(CMB_Representante.Text);
          Comando_SQL := 'Select * from mb_notas_fiscais, fb_representantes ';
          Comando_SQL := Comando_SQL + 'Where (mb_nota_fiscal_vendedor='+Trim(Representante)+') and (mb_nota_fiscal_data_emissao >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') +#39+') and (mb_nota_fiscal_data_emissao <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') +#39+') and (mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+') ';
          Comando_SQL := Comando_SQL + 'and (mb_nota_fiscal_vendedor = fb_representante_codigo) and (mb_nota_fiscal_tipo_fatura = '+#39+'Nota Fiscal'+#39+')';
          Comando_SQL := Comando_SQL + ' Order By mb_nota_fiscal_vendedor, mb_nota_fiscal_numero';
        End;

        ConexaoBD.SQL_MB_Rel_Vendas.Close;
        ConexaoBD.SQL_MB_Rel_Vendas.SQL.Clear;
        ConexaoBD.SQL_MB_Rel_Vendas.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_MB_Rel_Vendas.Open;

        RelVendasRepresentantes04.LBL_Periodo.Caption := 'Período de ' + Trim(Data_Inicial.Text) + ' até ' + Trim(Data_Final.Text);

        Seta();

        RelVendasRepresentantes04.QR_Representantes.Preview;
        RelVendasRepresentantes04.Destroy;

        ConexaoBD.SQL_mb_nota_Fiscal.Close;


        end
    else
        begin
        Ampulheta();

        Application.CreateForm(TRelVendasRepresentantes01,RelVendasRepresentantes01);

        Comando_SQL := '';

        if Trim(CMB_Representante.Text) = 'Todos os Repesentantes' Then
          Begin
          Comando_SQL := 'Select * from fb_notas_fiscais, fb_representantes ';
          Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_data_emissao >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') +#39+') and (fb_nota_fiscal_data_emissao <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') +#39+' and (fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+')) ';
          Comando_SQL := Comando_SQL + 'and (fb_nota_fiscal_vendedor = fb_representante_codigo) and (fb_representante_relatorio = '+#39+'S'+#39+') and (fb_nota_fiscal_tipo_fatura = '+#39+'Nota Fiscal'+#39+')';
          Comando_SQL := Comando_SQL + 'Order By fb_nota_fiscal_vendedor, fb_nota_fiscal_numero';
          End
        Else
          Begin
          Representante := '';
          Representante := Obtem_Nro_Antes_Traco(CMB_Representante.Text);
          Comando_SQL := 'Select * from fb_notas_fiscais, fb_representantes ';
          Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_vendedor='+Trim(Representante)+') and (fb_nota_fiscal_data_emissao >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') +#39+') and (fb_nota_fiscal_data_emissao <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') +#39+') and (fb_nota_fiscal_natureza_oper like '+#39+'%Venda%'+#39+') ';
          Comando_SQL := Comando_SQL + 'and (fb_nota_fiscal_vendedor = fb_representante_codigo) and (fb_nota_fiscal_tipo_fatura = '+#39+'Nota Fiscal'+#39+')';
          Comando_SQL := Comando_SQL + 'Order By fb_nota_fiscal_vendedor, fb_nota_fiscal_numero';
        End;

        ConexaoBD.SQL_Rel_Vendas.Close;
        ConexaoBD.SQL_Rel_Vendas.SQL.Clear;
        ConexaoBD.SQL_Rel_Vendas.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Rel_Vendas.Open;

        RelVendasRepresentantes01.LBL_Periodo.Caption := 'Período de ' + Trim(Data_Inicial.Text) + ' até ' + Trim(Data_Final.Text);

        Seta();

        RelVendasRepresentantes01.QR_Representantes.Preview;
        RelVendasRepresentantes01.Destroy;

        ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    end;


  end;
end;

procedure TRelVendasRepresentantes00.RepresentanteKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelVendasRepresentantes00.BT_SairClick(Sender: TObject);
begin
  RelVendasRepresentantes00.Close;
end;

procedure TRelVendasRepresentantes00.FormShow(Sender: TObject);
begin
  Ampulheta();

  // Obtem as Transportadoras
  ConexaoBD.SQL_FB_Representantes.Close;
  ConexaoBD.SQL_FB_Representantes.SQL.Clear;
  ConexaoBD.SQL_FB_Representantes.SQL.Add('Select * from fb_representantes Order By fb_representante_nome');
  ConexaoBD.SQL_FB_Representantes.Open;

  CMB_Representante.Items.Clear;
  CMB_Representante.Items.Add('Todos os Repesentantes');
  If ConexaoBD.SQL_FB_Representantes.RecordCount > 0 Then
     begin
     ConexaoBD.SQL_FB_Representantes.First;

     While Not ConexaoBD.SQL_FB_Representantes.Eof Do
       begin
         CMB_Representante.Items.Add(IntToStr(ConexaoBD.SQL_FB_Representantesfb_representante_codigo.AsInteger)+' - '+ConexaoBD.SQL_FB_Representantesfb_representante_nome.AsString);
         ConexaoBD.SQL_FB_Representantes.Next;
     End;
  end;

  ConexaoBD.SQL_FB_Representantes.Close;
  CMB_Representante.ItemIndex := 0;

  // Carrega data atual nos campos de periodo
  Data_Inicial.Text := DateToStr(Date());
  Data_Final.Text   := DateToStr(Date());

  Seta();
end;

procedure TRelVendasRepresentantes00.CMB_RepresentanteKeyPress(
  Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

end.
