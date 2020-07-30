unit Avulso_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask;

type
  TAvulso00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    Label41: TLabel;
    Avulso_Conta: TComboBox;
    Panel2: TPanel;
    DBGrid_Conta: TDBGrid;
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    Panel6: TPanel;
    Panel7: TPanel;
    BT_Sair: TBitBtn;
    Panel8: TPanel;
    Label2: TLabel;
    Avulso_Total_Pagar: TLabel;
    GroupBox2: TGroupBox;
    SGD_Saldos: TStringGrid;
    Label3: TLabel;
    Avulso_Data_Inicial: TMaskEdit;
    BT_Procurar: TBitBtn;
    Label1: TLabel;
    Avulso_Status: TComboBox;
    Label4: TLabel;
    Qtde_Titulos_Selecionados: TLabel;
    Label5: TLabel;
    Link_Baixar_Titulos: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Avulso_Fornecedor_Numero: TEdit;
    Avulso_Fornecedor_Nome: TEdit;
    BT_Fornecedor: TBitBtn;
    Label11: TLabel;
    Avulso_Lancamento: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBGrid_ContaCellClick(Column: TColumn);
    procedure Avulso_Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_ContaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure Avulso_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure Avulso_StatusKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid_ContaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid_ContaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid_ContaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_ContaDblClick(Sender: TObject);
    procedure Link_Baixar_TitulosClick(Sender: TObject);
    procedure Avulso_ContaChange(Sender: TObject);
    procedure BT_FornecedorClick(Sender: TObject);
    procedure Avulso_LancamentoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    procedure Obtem_Contas();

  public
    { Public declarations }
  end;

var
  Avulso00: TAvulso00;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00, Avulso_01, Avulso_02,
  Fornecedor_00;

{$R *.dfm}

procedure TAvulso00.BT_SairClick(Sender: TObject);
begin
     Avulso00.Close;
end;

procedure TAvulso00.FormShow(Sender: TObject);
begin
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

       Avulso_Data_Inicial.Text := DateToStr(Date());
    End;

    Obtem_Contas();
end;

procedure TAvulso00.Obtem_Contas();

var
   Nro_Conta, Data_Fixo, Comando_SQL: String;
   Ind: Integer;

begin
    If Trim(Avulso_Lancamento.Text) <> '' Then
       Begin
       ConexaoBD.SQL_FB_Conta_Pagar.Close;
       ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
       ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where fb_conta_pagar_nro = ' + Trim(Avulso_Lancamento.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
       ConexaoBD.SQL_FB_Conta_Pagar.Open;

       ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
       ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
       ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where fb_conta_pagar_nro = ' + Trim(Avulso_Lancamento.Text) );
       ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;

       Avulso_Total_Pagar.Caption := 'R$ ' + Trim(ConexaoBD.SQL_FB_Conta_Pagar_Totalfb_conta_pagar_total.Text);
       End
    Else
       Begin

       Nro_Conta   := Obtem_Nro_Antes_Traco(Avulso_Conta.Text);

       If Trim(Nro_Conta) <> '' Then
          Begin
          //*** Obtem as Contas a Pagar ***

          If Trim(Avulso_Status.Text) = '--- Todos ---' Then
             Begin
             If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                Begin
                ConexaoBD.SQL_FB_Conta_Pagar.Close;
                ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                ConexaoBD.SQL_FB_Conta_Pagar.Open;

                ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+'))');
                ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                End
             Else
                Begin
                ConexaoBD.SQL_FB_Conta_Pagar.Close;
                ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                ConexaoBD.SQL_FB_Conta_Pagar.Open;

                ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text));
                ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
             End;
             End
          Else
             Begin

             If Trim(Avulso_Status.Text) = 'Em Aberto' Then
                Begin

                If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;

                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ')');
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                   End
                Else
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;

                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) );
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                End;

                End
             Else
                Begin

                If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Avulso_Status.Text) + #39 + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;

                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Avulso_Status.Text) + #39);
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                   End
                Else
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Avulso_Status.Text) + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;

                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(Nro_Conta) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Avulso_Status.Text) + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) );
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                End;

             End;

          End;

          Avulso_Total_Pagar.Caption := 'R$ ' + Trim(ConexaoBD.SQL_FB_Conta_Pagar_Totalfb_conta_pagar_total.Text);
          End
       Else
          Begin

          If Trim(Avulso_Status.Text) = '--- Todos ---' Then
             Begin
             If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                Begin
                ConexaoBD.SQL_FB_Conta_Pagar.Close;
                ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                ConexaoBD.SQL_FB_Conta_Pagar.Open;

                ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+'))');
                ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                End
             Else
                Begin
                ConexaoBD.SQL_FB_Conta_Pagar.Close;
                ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                ConexaoBD.SQL_FB_Conta_Pagar.Open;

                ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) );
                ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
             End;
             End
          Else
             Begin

             If Trim(Avulso_Status.Text) = 'Em Aberto' Then
                Begin

                If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;

                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ')');
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                   End
                Else
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;

                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And (fb_conta_pagar_status = ' + #39 + 'Em Aberto' + #39 + ' Or fb_conta_pagar_status = ' + #39 + 'Pago Parcial' + #39 + ') And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) );
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                End;

                End
             Else
                Begin

                If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Avulso_Status.Text) + #39 + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;

                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Avulso_Status.Text) + #39);
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                   End
                Else
                   Begin
                   ConexaoBD.SQL_FB_Conta_Pagar.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar.SQL.Add('Select * from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Avulso_Status.Text) + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) + ' Order By fb_conta_pagar_data ASC, fb_conta_pagar_posicao ASC, fb_conta_pagar_descricao ASC');
                   ConexaoBD.SQL_FB_Conta_Pagar.Open;

                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Avulso_Status.Text) + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) );
                   ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                End;

             End;
          End;

          Avulso_Total_Pagar.Caption := 'R$ ' + Trim(ConexaoBD.SQL_FB_Conta_Pagar_Totalfb_conta_pagar_total.Text);
       End;

    End;

    //*** Prepara Grid dos Saldos ***

    //*** Zera Grid ***

    For Ind := 0 To SGD_Saldos.RowCount Do
        Begin
        SGD_Saldos.Cells[0,Ind] := '';
        SGD_Saldos.Cells[1,Ind] := '';
        SGD_Saldos.Cells[2,Ind] := '';
        SGD_Saldos.Cells[3,Ind] := '';
    End;

    ConexaoBD.SQL_FB_Conta_Bancaria.Close;
    ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Clear;
    ConexaoBD.SQL_FB_Conta_Bancaria.SQL.Add('Select * from fb_contas_bancarias Order By fb_conta_bancaria_banco, fb_conta_bancaria_nro');
    ConexaoBD.SQL_FB_Conta_Bancaria.Open;

    If ConexaoBD.SQL_FB_Conta_Bancaria.RecordCount > 0 Then
       Begin
       SGD_Saldos.RowCount  := 2;
       SGD_Saldos.Refresh;

       SGD_Saldos.RowCount  := (ConexaoBD.SQL_FB_Conta_Bancaria.RecordCount + 1);
       SGD_Saldos.FixedRows := 1;
       Ind := 0;

       ConexaoBD.SQL_FB_Conta_Bancaria.First;

       While Not ConexaoBD.SQL_FB_Conta_Bancaria.Eof Do
             Begin
             Ind := Ind + 1;

             SGD_Saldos.Cells[0,Ind] := Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_banco.Text) + ' - AG: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_agencia.Text) + ' - CC: ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_conta.Text) + ' - ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_titular.Text);

             //*** Obtem o Saldo da Conta ***

             ConexaoBD.SQL_FB_Saldo.Close;
             ConexaoBD.SQL_FB_Saldo.SQL.Clear;
             ConexaoBD.SQL_FB_Saldo.SQL.Add('Select * from fb_saldos Where (fb_saldo_conta = ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ') And ((fb_saldo_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_saldo_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) Order By fb_saldo_data Desc, fb_saldo_nro Desc');
             ConexaoBD.SQL_FB_Saldo.Open;

             If ConexaoBD.SQL_FB_Saldo.RecordCount > 0 Then
                Begin
                SGD_Saldos.Cells[1,Ind] := ConexaoBD.SQL_FB_Saldofb_saldo_valor.Text;
                End
             Else
                Begin
                SGD_Saldos.Cells[1,Ind] := '0,00'
             End;

             //*** Obtem os Pagamentos das Contas ***

             If Trim(Avulso_Lancamento.Text) <> '' Then
                Begin
                ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ') And (fb_conta_pagar_nro = ' + Trim(Avulso_Lancamento.Text) + ')');
                ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                End
             Else
                Begin

                If Trim(Avulso_Fornecedor_Numero.Text) = '0' Then
                   Begin
                   If Trim(Avulso_Status.Text) = '--- Todos ---' Then
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+'))');
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                      End
                   Else
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Avulso_Status.Text) + #39);
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                   End;
                   End
                Else
                   Begin
                   If Trim(Avulso_Status.Text) = '--- Todos ---' Then
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) );
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                      End
                   Else
                      Begin
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.Close;
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Clear;
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.SQL.Add('select sum(fb_conta_pagar_valor_ser_pago) as fb_conta_pagar_total from fb_contas_pagar Where (fb_conta_pagar_conta = ' + Trim(ConexaoBD.SQL_FB_Conta_Bancariafb_conta_bancaria_nro.Text) + ') And ((fb_conta_pagar_data >= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+') And (fb_conta_pagar_data <= '+#39+Inverte_Data_Plus(Trim(Avulso_Data_Inicial.Text),'amd','/')+#39+')) And fb_conta_pagar_status = ' + #39 + Trim(Avulso_Status.Text) + #39 + ' And fb_conta_pagar_fornecedor_numero = ' + Trim(Avulso_Fornecedor_Numero.Text) );
                      ConexaoBD.SQL_FB_Conta_Pagar_Total.Open;
                   End;
                End;

             End;

             If ConexaoBD.SQL_FB_Conta_Pagar_Total.RecordCount > 0 Then
                Begin
                If Trim(ConexaoBD.SQL_FB_Conta_Pagar_Totalfb_conta_pagar_total.Text) <> '' Then
                   Begin
                   SGD_Saldos.Cells[2,Ind] := ConexaoBD.SQL_FB_Conta_Pagar_Totalfb_conta_pagar_total.Text;
                   End
                Else
                   Begin
                   SGD_Saldos.Cells[2,Ind] := '0,00';
                End;
                End
             Else
                Begin
                SGD_Saldos.Cells[2,Ind] := '0,00'
             End;

             //*** Totaliza os Pagamentos ***

             SGD_Saldos.Cells[3,Ind] := FloatToStr(StrToFloat(SGD_Saldos.Cells[1,Ind]) - StrToFloat(SGD_Saldos.Cells[2,Ind]));

             ConexaoBD.SQL_FB_Conta_Bancaria.Next;
       End;

       End
    Else
       Begin
       SGD_Saldos.RowCount  := 2;
       SGD_Saldos.FixedRows := 1;
    End;

    //*** Conta ***
    SGD_Saldos.Cells[0,0]   := 'Conta';
    SGD_Saldos.ColWidths[0] := 430;

    //*** Código do Produto ***
    SGD_Saldos.Cells[1,0]   := 'Saldo Inicial (R$)';
    SGD_Saldos.ColWidths[1] := 90;

    //*** Descrição do Produto ***
    SGD_Saldos.Cells[2,0]   := 'Pagamentos (R$)';
    SGD_Saldos.ColWidths[2] := 90;

    //*** Valor Unitário ***
    SGD_Saldos.Cells[3,0]   := 'Saldo Final (R$)';
    SGD_Saldos.ColWidths[3] := 90;
end;

procedure TAvulso00.BT_IncluirClick(Sender: TObject);

var
   Nro_Conta: String;

begin
     Avulso00.Visible := False;

     Application.CreateForm(TAvulso01,Avulso01);

     Nro_Conta := Obtem_Nro_Antes_Traco(Avulso_Conta.Text);

     If Trim(Nro_Conta) <> '' Then
        Begin
        Avulso01.Posicao_Nro_Conta.Text := Nro_Conta;
        End
     Else
        Begin
        Avulso01.Posicao_Nro_Conta.Text := '0';
     End;

     Avulso01.Avulso_Fornecedor_Numero.Text := '0';
     Avulso01.Avulso_Fornecedor_Nome.Text   := '--- Sem Fornecedor ---';

     Avulso01.ShowModal;
     Avulso01.Destroy;

     Avulso00.Visible := True;
end;

procedure TAvulso00.DBGrid_ContaCellClick(Column: TColumn);
var Selecionado: string;
begin
    If DBGrid_Conta.Fields[0].Text <> '' Then
       Begin
       Qtde_Titulos_Selecionados.Caption := IntToStr(DBGrid_Conta.SelectedRows.Count);
       Qtde_Titulos_Selecionados.Refresh;
    End;
end;

procedure TAvulso00.Avulso_Data_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso00.DBGrid_ContaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If Trim(DBGrid_Conta.Fields[9].Text) <> '' Then
        Begin
        If Trim(DBGrid_Conta.Fields[9].Text) = 'Em Aberto' Then
           Begin
           DBGrid_Conta.Canvas.Brush.Color := clRed;
           End
        Else If Trim(DBGrid_Conta.Fields[9].Text) = 'Pago' Then
           Begin
           DBGrid_Conta.Canvas.Brush.Color := clMoneyGreen;
           End
        Else If Trim(DBGrid_Conta.Fields[9].Text) = 'Pago Parcial' Then
           Begin
           DBGrid_Conta.Canvas.Brush.Color := $006FB7FF;
           End
        Else If (Trim(DBGrid_Conta.Fields[9].Text) = 'Cancelado') Or (Trim(DBGrid_Conta.Fields[9].Text) = 'Devolução') Then
           Begin
           DBGrid_Conta.Canvas.Brush.Color := clSkyBlue;
        End;
     End;

     DBGrid_Conta.DefaultDrawDataCell(Rect, DBGrid_Conta.columns[datacol].field, State);
end;

procedure TAvulso00.BT_ProcurarClick(Sender: TObject);
begin
     Obtem_Contas();
end;

procedure TAvulso00.Avulso_ContaKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso00.Avulso_StatusKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAvulso00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TAvulso00.DBGrid_ContaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     If DBGrid_Conta.Focused Then
        Begin
        DBGrid_Conta.Hint := DBGrid_Conta.Fields[3].Text;
     End;
end;

procedure TAvulso00.DBGrid_ContaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     If DBGrid_Conta.Focused Then
        Begin
        DBGrid_Conta.Hint := DBGrid_Conta.Fields[3].Text;
     End;
end;

procedure TAvulso00.DBGrid_ContaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     If DBGrid_Conta.Focused Then
        Begin
        DBGrid_Conta.Hint := DBGrid_Conta.Fields[3].Text;
     End;
end;

procedure TAvulso00.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     Avulso00 := Nil;
end;

procedure TAvulso00.DBGrid_ContaDblClick(Sender: TObject);

Var
   Selecionado: String;

begin
    If DBGrid_Conta.Fields[0].Text <> '' Then Begin
      Selecionado := DBGrid_Conta.Fields[0].Text;

      Avulso00.Visible := False;

      Ampulheta();
      Application.CreateForm(TAvulso02,Avulso02);

      Avulso02.Avulso_Nro.Text        := DBGrid_Conta.Fields[0].Text;
      Avulso02.Posicao_Nro_Conta.Text := DBGrid_Conta.Fields[1].Text;
      Avulso02.Avulso_Data.Text       := DBGrid_Conta.Fields[2].Text;
      Avulso02.Avulso_Descricao.Text  := DBGrid_Conta.Fields[3].Text;
      Avulso02.Avulso_Ser_Pago.Text   := DBGrid_Conta.Fields[4].Text;
      Avulso02.Avulso_Juros.Text      := DBGrid_Conta.Fields[5].Text;
      Avulso02.Avulso_Desconto.Text   := DBGrid_Conta.Fields[6].Text;
      Avulso02.Avulso_Valor.Text      := DBGrid_Conta.Fields[7].Text;
      Avulso02.Avulso_Saldo.Text      := DBGrid_Conta.Fields[8].Text;
      Avulso02.Avulso_Emissao.Text    := DBGrid_Conta.Fields[14].Text;

      If Trim(DBGrid_Conta.Fields[9].Text) = 'Em Aberto' Then
         Begin
         Avulso02.Avulso_Status.ItemIndex := 0;
         End
      Else If Trim(DBGrid_Conta.Fields[9].Text) = 'Pago' Then
         Begin
         Avulso02.Avulso_Status.ItemIndex := 1;
         End
      Else If Trim(DBGrid_Conta.Fields[9].Text) = 'Pago Parcial' Then
         Begin
         Avulso02.Avulso_Status.ItemIndex := 2;
         End
      Else If Trim(DBGrid_Conta.Fields[9].Text) = 'Cancelado' Then
         Begin
         Avulso02.Avulso_Status.ItemIndex := 3;
         End
      Else If Trim(DBGrid_Conta.Fields[9].Text) = 'Devolução' Then
         Begin
         Avulso02.Avulso_Status.ItemIndex := 4;
      End;

      Avulso02.Avulso_Observacao.Text        := DBGrid_Conta.Fields[10].Text;
      Avulso02.Avulso_Pagto.Text             := DBGrid_Conta.Fields[11].Text;
      Avulso02.Avulso_Fornecedor_Numero.Text := DBGrid_Conta.Fields[12].Text;
      Avulso02.Avulso_Fornecedor_Nome.Text   := DBGrid_Conta.Fields[13].Text;

      If Trim(Avulso02.Avulso_Juros.Text) = '' Then
         Begin
         Avulso02.Avulso_Juros.Text := '0,00';
      End;

      If Trim(Avulso02.Avulso_Desconto.Text) = '' Then
         Begin
         Avulso02.Avulso_Desconto.Text := '0,00';
      End;

      If Trim(Avulso02.Avulso_Valor.Text) = '' Then
         Begin
         Avulso02.Avulso_Valor.Text := '0,00';
      End;

      If Trim(Avulso02.Avulso_Saldo.Text) = '' Then
         Begin
         Avulso02.Avulso_Saldo.Text := '0,00';
      End;

      Seta();

      Avulso02.ShowModal;
      Avulso02.Destroy;

      Avulso00.Visible := True;

      ConexaoBD.SQL_FB_Conta_Pagar.Locate('fb_conta_pagar_nro',Trim(Selecionado),[]);
    End;
end;

procedure TAvulso00.Link_Baixar_TitulosClick(Sender: TObject);

var
   Ind, Ind_Total: Integer;
   Selecionados: Array[0..1000] of Array[0..14] of String;

begin
     If DBGrid_Conta.SelectedRows.Count > 0 Then
        Begin

        //*** Carrega as Informações Selecionadas ***

        Ind_Total := (DBGrid_Conta.SelectedRows.Count-1);

        For Ind:=0 To Ind_Total Do
            Begin
            //*** Posiciona no Registro Selecionado ***
            DBGrid_Conta.DataSource.DataSet.GotoBookmark(Pointer(DBGrid_Conta.SelectedRows.Items[Ind]));

            Selecionados[Ind,0]  := DBGrid_Conta.Fields[0].Text;
            Selecionados[Ind,1]  := DBGrid_Conta.Fields[1].Text;
            Selecionados[Ind,2]  := DBGrid_Conta.Fields[2].Text;
            Selecionados[Ind,3]  := DBGrid_Conta.Fields[3].Text;
            Selecionados[Ind,4]  := DBGrid_Conta.Fields[4].Text;
            Selecionados[Ind,5]  := DBGrid_Conta.Fields[5].Text;
            Selecionados[Ind,6]  := DBGrid_Conta.Fields[6].Text;
            Selecionados[Ind,7]  := DBGrid_Conta.Fields[7].Text;
            Selecionados[Ind,8]  := DBGrid_Conta.Fields[8].Text;
            Selecionados[Ind,9]  := DBGrid_Conta.Fields[9].Text;
            Selecionados[Ind,10] := DBGrid_Conta.Fields[10].Text;
            Selecionados[Ind,11] := DBGrid_Conta.Fields[11].Text;
            Selecionados[Ind,12] := DBGrid_Conta.Fields[12].Text;
            Selecionados[Ind,13] := DBGrid_Conta.Fields[13].Text;
            Selecionados[Ind,14] := DBGrid_Conta.Fields[14].Text;
        End;

        //*** Exibe as Telas Com os Valores ***

        If Confirma('Atenção, serão abertas ' + IntToStr(Ind_Total+1) + ' Telas Sequências para Alteração dos Títulos. Deseja continuar.') = 6 Then
           Begin

           Avulso00.Visible := False;

           For Ind:=0 To Ind_Total Do
               Begin
               MSG_Erro('Próximo Título a Ser Aberto: ' + Selecionados[Ind,2] + ' | ' + Selecionados[Ind,3] + ' | R$ ' + Selecionados[Ind,4]);

               Ampulheta();
               Application.CreateForm(TAvulso02,Avulso02);

               Avulso02.Avulso_Nro.Text               := Selecionados[Ind,0];
               Avulso02.Posicao_Nro_Conta.Text        := Selecionados[Ind,1];
               Avulso02.Avulso_Data.Text              := Selecionados[Ind,2];
               Avulso02.Avulso_Descricao.Text         := Selecionados[Ind,3];
               Avulso02.Avulso_Ser_Pago.Text          := Selecionados[Ind,4];
               Avulso02.Avulso_Juros.Text             := Selecionados[Ind,5];
               Avulso02.Avulso_Desconto.Text          := Selecionados[Ind,6];
               Avulso02.Avulso_Valor.Text             := Selecionados[Ind,4];
               Avulso02.Avulso_Saldo.Text             := Selecionados[Ind,8];
               Avulso02.Avulso_Status.ItemIndex       := 1;
               Avulso02.Avulso_Observacao.Text        := Selecionados[Ind,10];
               Avulso02.Avulso_Pagto.Text             := Selecionados[Ind,2];
               Avulso02.Avulso_Fornecedor_Numero.Text := Selecionados[Ind,12];
               Avulso02.Avulso_Fornecedor_Nome.Text   := Selecionados[Ind,13];
               Avulso02.Avulso_Emissao.Text           := Selecionados[Ind,14];

               If Trim(Avulso02.Avulso_Juros.Text) = '' Then
                  Begin
                  Avulso02.Avulso_Juros.Text := '0,00';
               End;

               If Trim(Avulso02.Avulso_Desconto.Text) = '' Then
                  Begin
                  Avulso02.Avulso_Desconto.Text := '0,00';
               End;

               If Trim(Avulso02.Avulso_Valor.Text) = '' Then
                  Begin
                  Avulso02.Avulso_Valor.Text := '0,00';
               End;

               If Trim(Avulso02.Avulso_Saldo.Text) = '' Then
                  Begin
                  Avulso02.Avulso_Saldo.Text := '0,00';
               End;

               Seta();

               Avulso02.ShowModal;
               Avulso02.Destroy;
           End;

           Avulso00.Visible := True;

        End;

     End;
end;

procedure TAvulso00.Avulso_ContaChange(Sender: TObject);
begin
     Avulso_Fornecedor_Numero.Text := '0';
     Avulso_Fornecedor_Nome.Text   := '--- Todos ---';
end;

procedure TAvulso00.BT_FornecedorClick(Sender: TObject);
begin
     Ampulheta();
     Application.CreateForm(TFornecedor00,Fornecedor00);

     Fornecedor00.Programa_Anterior.Text := 'Avulso';
     Fornecedor00.Fornecedor_Area.ItemIndex := 0;
     Fornecedor00.BT_Procurar.Click;

     Seta();
     Fornecedor00.ShowModal;
end;

procedure TAvulso00.Avulso_LancamentoKeyPress(Sender: TObject;
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
