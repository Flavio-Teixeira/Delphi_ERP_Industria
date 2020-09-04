unit Rel_Vendas_Representantes_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelVendasRepresentantes02 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    CMB_Representante: TComboBox;
    Data_Inicial: TMaskEdit;
    Data_Final: TMaskEdit;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure CMB_RepresentanteKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelVendasRepresentantes02: TRelVendasRepresentantes02;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Vendas_Representantes_03,
  Ibrasmak_00;

{$R *.dfm}

procedure TRelVendasRepresentantes02.FormShow(Sender: TObject);
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

procedure TRelVendasRepresentantes02.Data_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TRelVendasRepresentantes02.Data_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TRelVendasRepresentantes02.CMB_RepresentanteKeyPress(
  Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TRelVendasRepresentantes02.BT_ImprimirClick(Sender: TObject);
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
    Ampulheta();

    Application.CreateForm(TRelVendasRepresentantes03,RelVendasRepresentantes03);

    Comando_SQL := '';

    if Trim(CMB_Representante.Text) = 'Todos os Repesentantes' Then
      Begin
      Comando_SQL := 'Select * from fb_papeletas, fb_representantes ';
      Comando_SQL := Comando_SQL + 'Where (fb_papeleta_data_emissao >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/') +#39+') and (fb_papeleta_data_emissao <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/') +#39+' and (fb_papeleta_natureza_oper='+#39+'Vendas'+#39+' Or fb_papeleta_natureza_oper='+#39+'Exportação'+#39+')) ';
      Comando_SQL := Comando_SQL + 'and (fb_papeleta_vendedor = fb_representante_codigo) and (fb_representante_relatorio = '+#39+'S'+#39+') and (fb_papeleta_tipo_fatura = '+#39+'Papeleta'+#39+')';
      Comando_SQL := Comando_SQL + 'Order By fb_papeleta_vendedor, fb_papeleta_numero';
      End
    Else
      Begin
      Representante := '';
      Representante := Obtem_Nro_Antes_Traco(CMB_Representante.Text);
      Comando_SQL := 'Select * from fb_papeletas, fb_representantes ';
      Comando_SQL := Comando_SQL + 'Where (fb_papeleta_vendedor='+Trim(Representante)+') and (fb_papeleta_data_emissao >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/') +#39+') and (fb_papeleta_data_emissao <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/') +#39+') and (fb_papeleta_natureza_oper='+#39+'Vendas'+#39+' Or fb_papeleta_natureza_oper='+#39+'Exportação'+#39+') ';
      Comando_SQL := Comando_SQL + 'and (fb_papeleta_vendedor = fb_representante_codigo) and (fb_papeleta_tipo_fatura = '+#39+'Papeleta'+#39+')';
      Comando_SQL := Comando_SQL + 'Order By fb_papeleta_vendedor, fb_papeleta_numero';
    End;

    ConexaoBD.SQL_Rel_Vendas_Papeletas.Close;
    ConexaoBD.SQL_Rel_Vendas_Papeletas.SQL.Clear;
    ConexaoBD.SQL_Rel_Vendas_Papeletas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Rel_Vendas_Papeletas.Open;

    RelVendasRepresentantes03.LBL_Periodo.Caption := 'Período de ' + Trim(Data_Inicial.Text) + ' até ' + Trim(Data_Final.Text);

    Seta();

    RelVendasRepresentantes03.QR_Representantes.Preview;
    RelVendasRepresentantes03.Destroy;
  end;
end;

procedure TRelVendasRepresentantes02.BT_SairClick(Sender: TObject);
begin
  RelVendasRepresentantes02.Close;
end;

end.
