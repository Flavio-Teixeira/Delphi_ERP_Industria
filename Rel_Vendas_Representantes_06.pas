unit Rel_Vendas_Representantes_06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelVendasRepresentantes06 = class(TForm)
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
  RelVendasRepresentantes06: TRelVendasRepresentantes06;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Vendas_Representantes_07,
  Ibrasmak_00, Rel_Vendas_Representantes_08;

{$R *.dfm}

procedure TRelVendasRepresentantes06.Data_InicialKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelVendasRepresentantes06.Data_FinalKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelVendasRepresentantes06.BT_ImprimirClick(Sender: TObject);
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

        Application.CreateForm(TRelVendasRepresentantes08,RelVendasRepresentantes08);

        Comando_SQL := '';

        if Trim(CMB_Representante.Text) = 'Todos os Repesentantes' Then
          Begin
          Comando_SQL := 'Select * from pedidos, fb_representantes ';
          Comando_SQL := Comando_SQL + 'Where (pedido_data >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') +#39+') and (pedido_data <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') +#39+') ';
          Comando_SQL := Comando_SQL + 'and (pedido_vendedor_numero = fb_representante_codigo) and (fb_representante_relatorio = '+#39+'S'+#39+') ';
          Comando_SQL := Comando_SQL + 'and (pedido_empresa = '+#39+ 'Monibras' +#39+ ') ';
          Comando_SQL := Comando_SQL + ' Order By pedido_vendedor_numero, pedido_numero';
          End
        Else
          Begin
          Representante := '';
          Representante := Obtem_Nro_Antes_Traco(CMB_Representante.Text);
          Comando_SQL := 'Select * from pedidos, fb_representantes ';
          Comando_SQL := Comando_SQL + 'Where (pedido_vendedor_numero='+Trim(Representante)+') and (pedido_data >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') +#39+') and (pedido_data <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') +#39+') ';
          Comando_SQL := Comando_SQL + 'and (pedido_vendedor_numero = fb_representante_codigo) ';
          Comando_SQL := Comando_SQL + 'and (pedido_empresa = '+#39+ 'Monibras' +#39+ ') ';
          Comando_SQL := Comando_SQL + ' Order By pedido_vendedor_numero, pedido_numero';
        End;

        ConexaoBD.SQL_MB_Rel_Vendas_OS.Close;
        ConexaoBD.SQL_MB_Rel_Vendas_OS.SQL.Clear;
        ConexaoBD.SQL_MB_Rel_Vendas_OS.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_MB_Rel_Vendas_OS.Open;

        RelVendasRepresentantes08.LBL_Periodo.Caption := 'Período de ' + Trim(Data_Inicial.Text) + ' até ' + Trim(Data_Final.Text);

        Seta();

        RelVendasRepresentantes08.QR_Representantes.Preview;
        RelVendasRepresentantes08.Destroy;

        ConexaoBD.SQL_mb_nota_Fiscal.Close;

        end
    else
        begin
        Ampulheta();

        Application.CreateForm(TRelVendasRepresentantes07,RelVendasRepresentantes07);

        Comando_SQL := '';

        if Trim(CMB_Representante.Text) = 'Todos os Repesentantes' Then
          Begin
          Comando_SQL := 'Select * from pedidos, fb_representantes ';
          Comando_SQL := Comando_SQL + 'Where (pedido_data >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') +#39+') and (pedido_data <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') +#39+') ';
          Comando_SQL := Comando_SQL + 'and (pedido_vendedor_numero = fb_representante_codigo) and (fb_representante_relatorio = '+#39+'S'+#39+') ';
          Comando_SQL := Comando_SQL + 'and (pedido_empresa = '+#39+ 'Ibrasmak' +#39+ ') ';
          Comando_SQL := Comando_SQL + 'Order By pedido_vendedor_numero, pedido_numero';
          End
        Else
          Begin
          Representante := '';
          Representante := Obtem_Nro_Antes_Traco(CMB_Representante.Text);
          Comando_SQL := 'Select * from pedidos, fb_representantes ';
          Comando_SQL := Comando_SQL + 'Where (pedido_vendedor_numero='+Trim(Representante)+') and (pedido_data >= '+#39+ Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-') +#39+') and (pedido_data <='+#39+ Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-') +#39+') ';
          Comando_SQL := Comando_SQL + 'and (pedido_vendedor_numero = fb_representante_codigo) ';
          Comando_SQL := Comando_SQL + 'and (pedido_empresa = '+#39+ 'Ibrasmak' +#39+ ') ';
          Comando_SQL := Comando_SQL + 'Order By pedido_vendedor_numero, pedido_numero';
        End;

        ConexaoBD.SQL_Rel_Vendas_OS.Close;
        ConexaoBD.SQL_Rel_Vendas_OS.SQL.Clear;
        ConexaoBD.SQL_Rel_Vendas_OS.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Rel_Vendas_OS.Open;

        RelVendasRepresentantes07.LBL_Periodo.Caption := 'Período de ' + Trim(Data_Inicial.Text) + ' até ' + Trim(Data_Final.Text);

        Seta();

        RelVendasRepresentantes07.QR_Representantes.Preview;
        RelVendasRepresentantes07.Destroy;

        ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    end;


  end;
end;

procedure TRelVendasRepresentantes06.RepresentanteKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelVendasRepresentantes06.BT_SairClick(Sender: TObject);
begin
  RelVendasRepresentantes06.Close;
end;

procedure TRelVendasRepresentantes06.FormShow(Sender: TObject);
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

procedure TRelVendasRepresentantes06.CMB_RepresentanteKeyPress(
  Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

end.
