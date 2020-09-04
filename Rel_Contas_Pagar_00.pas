unit Rel_Contas_Pagar_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelContasPagar00 = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Calculo_Periodo_Inicial: TMaskEdit;
    Calculo_Periodo_Final: TMaskEdit;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Label41: TLabel;
    Calculo_Status: TComboBox;
    Label1: TLabel;
    Avulso_Conta: TComboBox;
    Label8: TLabel;
    Avulso_Descricao: TEdit;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Avulso_Fornecedor_Numero: TEdit;
    Avulso_Fornecedor_Nome: TEdit;
    BT_Procurar: TBitBtn;
    BT_Excluir: TBitBtn;
    Label2: TLabel;
    Avulso_Lancamento: TEdit;
    Label3: TLabel;
    procedure Calculo_Periodo_InicialKeyPress(Sender: TObject;
      var Key: Char);
    procedure Calculo_Periodo_FinalKeyPress(Sender: TObject;
      var Key: Char);
    procedure Calculo_StatusKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure Avulso_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Avulso_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure Avulso_LancamentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Obtem_Contas();

  public
    { Public declarations }
  end;

var
  RelContasPagar00: TRelContasPagar00;

implementation

uses Adiciona_Fornecedor_Pedido, Conexao_BD, Rotinas_Gerais,
  Rel_Contas_Pagar_01, Fornecedor_00;

{$R *.dfm}

procedure TRelContasPagar00.Calculo_Periodo_InicialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelContasPagar00.Calculo_Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelContasPagar00.Calculo_StatusKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelContasPagar00.BT_SairClick(Sender: TObject);
begin
     RelContasPagar00.Close;
end;

procedure TRelContasPagar00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRelContasPagar00.FormShow(Sender: TObject);
begin
     Calculo_Periodo_Inicial.Text := DateToStr(Date());
     Calculo_Periodo_Final.Text   := DateToStr(Date());

     If Trim(Avulso_Conta.Text) = '' Then
        Begin
        ConexaoBD.SQL_FB_Conta_Bancaria.Close;
        ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Clear;
        ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Add('Select * from fb_contas_bancarias Order By fb_conta_bancaria_banco, fb_conta_bancaria_nro');
        ConexaoBD.SQL_FB_Conta_Bancaria.Open;

        Avulso_Conta.Items.Clear;
        Avulso_Conta.Items.Add('--- TODAS AS CONTAS ---');

        If ConexaoBD.SQL_FB_Conta_Bancaria.RecordCount > 0 Then
           Begin
           ConexaoBD.SQL_FB_Conta_Bancaria.First;

           While Not ConexaoBD.SQL_FB_Conta_Bancaria.Eof Do
                 begin
                 Avulso_Conta.Items.Add(Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_banco.Text) + ' - AG: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_agencia.Text) + ' - CC: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_conta.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_titular.Text));

                 ConexaoBD.SQL_FB_Conta_Bancaria.Next;
           End;
        End;

        ConexaoBD.SQL_FB_Conta_Bancaria.Close;

        Avulso_Conta.ItemIndex := 0;
     End;
end;

procedure TRelContasPagar00.BT_ImprimirClick(Sender: TObject);
begin
     If (Trim(Avulso_Lancamento.Text) <> '') Then
        Begin

        Ampulheta();

        Obtem_Contas();

        Application.CreateForm(TRelContasPagar01,RelContasPagar01);
        RelContasPagar01.QR_Periodo.Caption := 'Nro. do Lançamento: ' + Trim(Avulso_Lancamento.Text);

        Seta();

        RelContasPagar01.QR_Cobranca.Preview;
        RelContasPagar01.Destroy;

        End
     Else
        Begin

        If ((Trim(Calculo_Periodo_Inicial.Text) <> '/  /') And (Trim(Calculo_Periodo_Final.Text) <> '/  /') And (StrToDate(Calculo_Periodo_Inicial.Text) <= StrToDate(Calculo_Periodo_Final.Text))) Then
           Begin
           Ampulheta();

           Obtem_Contas();

           Application.CreateForm(TRelContasPagar01,RelContasPagar01);

           If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
              Begin

              If Trim(Avulso_Descricao.Text) = '' Then
                 Begin
                 RelContasPagar01.QR_Periodo.Caption := 'Péríodo de ' + Trim(Calculo_Periodo_Inicial.Text) + ' a ' + Trim(Calculo_Periodo_Final.Text) + ' - Opção de Status: ' + Trim(Calculo_Status.Text) + ' - Opção de Conta: ' + Trim(Avulso_Conta.Text);
                 End
              Else
                 Begin
                 RelContasPagar01.QR_Periodo.Caption := 'Péríodo de ' + Trim(Calculo_Periodo_Inicial.Text) + ' a ' + Trim(Calculo_Periodo_Final.Text) + ' - Opção de Status: ' + Trim(Calculo_Status.Text) + ' - Opção de Conta: ' + Trim(Avulso_Conta.Text) + ' - Descrição: ' + Trim(Avulso_Descricao.Text);
              End;

              End
           Else
              Begin

              If Trim(Avulso_Descricao.Text) = '' Then
                 Begin
                 RelContasPagar01.QR_Periodo.Caption := 'Péríodo de ' + Trim(Calculo_Periodo_Inicial.Text) + ' a ' + Trim(Calculo_Periodo_Final.Text) + ' - Opção de Status: ' + Trim(Calculo_Status.Text) + ' - Opção de Conta: ' + Trim(Avulso_Conta.Text) + ' - Fornecedor: ' + Trim(Avulso_Fornecedor_Nome.Text);
                 End
              Else
                 Begin
                 RelContasPagar01.QR_Periodo.Caption := 'Péríodo de ' + Trim(Calculo_Periodo_Inicial.Text) + ' a ' + Trim(Calculo_Periodo_Final.Text) + ' - Opção de Status: ' + Trim(Calculo_Status.Text) + ' - Opção de Conta: ' + Trim(Avulso_Conta.Text) + ' - Descrição: ' + Trim(Avulso_Descricao.Text) + ' - Fornecedor: ' + Trim(Avulso_Fornecedor_Nome.Text);
              End;

           End;

           Seta();

           RelContasPagar01.QR_Cobranca.Preview;
           RelContasPagar01.Destroy;
           End
        Else
           Begin
           MSG_Erro('O Período deve ser preenchido corretamente');
           Calculo_Periodo_Inicial.SetFocus;
        End;

     End;
end;

procedure TRelContasPagar00.Obtem_Contas();

var
   Nro_Conta, Comando_SQL: String;

begin

    If Trim(Avulso_Lancamento.Text) <> '' Then
       Begin
       ConexaoBD.SQL_FB_Conta_Pagar.Close;
       ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
       ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where fb_conta_pagar_nro = ' + Trim(Avulso_Lancamento.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
       ConexaoBD.SQL_FB_Conta_Pagar.Open;
       End
    Else
       Begin

       Nro_Conta   := Obtem_Nro_Antes_Traco(Avulso_Conta.Text);

       If Trim(Nro_Conta) <> '' Then
          Begin

          If Trim(Calculo_Status.Text) = '--- Todos ---' Then
             Begin

             If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                Begin

                If Trim(Avulso_Descricao.Text) = '' Then
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End
                Else
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;
                End;

                End
             Else
                Begin

                If Trim(Avulso_Descricao.Text) = '' Then
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End
                Else
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;
                End;

             End;

             End
          Else
             Begin

             If Trim(Calculo_Status.Text) = 'Em Aberto' Then
                Begin

                If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                   Begin

                   If Trim(Avulso_Descricao.Text) = '' Then
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                      End
                   Else
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End;

                   End
                Else
                   Begin

                   If Trim(Avulso_Descricao.Text) = '' Then
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                      End
                   Else
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End;

                End;

                End
             Else
                Begin

                If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                   Begin

                   If Trim(Avulso_Descricao.Text) = '' Then
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Calculo_Status.Text) + #39 + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                      End
                   Else
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Calculo_Status.Text) + #39 + ' And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End;

                   End
                Else
                   Begin

                   If Trim(Avulso_Descricao.Text) = '' Then
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Calculo_Status.Text) + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                      End
                   Else
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Calculo_Status.Text) + #39 + ' And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End;

                End;

             End;

          End;

          End
       Else
          Begin

          If Trim(Calculo_Status.Text) = '--- Todos ---' Then
             Begin

             If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                Begin

                If Trim(Avulso_Descricao.Text) = '' Then
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End
                Else
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;
                End;

                End
             Else
                Begin

                If Trim(Avulso_Descricao.Text) = '' Then
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End
                Else
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;
                End;

             End;

             End
          Else
             Begin

             If Trim(Calculo_Status.Text) = 'Em Aberto' Then
                Begin

                If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                   Begin

                   If Trim(Avulso_Descricao.Text) = '' Then
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                      End
                   Else
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End;

                   End
                Else
                   Begin

                   If Trim(Avulso_Descricao.Text) = '' Then
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                      End
                   Else
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End;

                End;

                End
             Else
                Begin

                If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                   Begin

                   If Trim(Avulso_Descricao.Text) = '' Then
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Calculo_Status.Text) + #39 + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                      End
                   Else
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Calculo_Status.Text) + #39 + ' And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End;

                   End
                Else
                   Begin

                   If Trim(Avulso_Descricao.Text) = '' Then
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Calculo_Status.Text) + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                      End
                   Else
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Calculo_Periodo_Final.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Calculo_Status.Text) + #39 + ' And fb_conta_pagar_descricao Like ' + #39 + '%' + Trim(Avulso_Descricao.Text) + '%' + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                      ConexaoBD.SQL_FB_Conta_Pagar.Open;
                   End;

                End;

             End;

          End
       End;

    End;

end;


procedure TRelContasPagar00.Avulso_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelContasPagar00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     RelContasPagar00 := Nil;
end;

procedure TRelContasPagar00.Avulso_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRelContasPagar00.BT_ExcluirClick(Sender: TObject);
begin
     Avulso_Fornecedor_Numero.Text := '0';
     Avulso_Fornecedor_Nome.Text   := '--- Todos ---';
end;

procedure TRelContasPagar00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();
     Application.CreateForm(TFornecedor00,Fornecedor00);

     Fornecedor00.Programa_Anterior.Text := 'Rel_Contas_Pagar';
     Fornecedor00.Fornecedor_Area.ItemIndex := 0;
     Fornecedor00.BT_Procurar.Click;

     Seta();
     Fornecedor00.ShowModal;
end;

procedure TRelContasPagar00.Avulso_LancamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
