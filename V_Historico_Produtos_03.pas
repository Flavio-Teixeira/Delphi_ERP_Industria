unit V_Historico_Produtos_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TVHistoricoProdutos03 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    editCodigo: TEdit;
    editDescricao: TEdit;
    GroupBox2: TGroupBox;
    cbEstado: TComboBox;
    cbCidade: TComboBox;
    cbBairro: TComboBox;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    btnFiltrar: TBitBtn;
    btnSair: TBitBtn;
    Tipo_Historico: TEdit;
    Label8: TLabel;
    editReferencia: TEdit;
    procedure FormShow(Sender: TObject);
    procedure cbEstadoSelect(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cbCidadeSelect(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure edtDataInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtDataFinalKeyPress(Sender: TObject; var Key: Char);
    procedure cbEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure cbCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure cbBairroKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Carrega_Combo_Estado();
    procedure Carrega_Combo_Cidade();
    procedure Carrega_Combo_Bairro();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VHistoricoProdutos03: TVHistoricoProdutos03;

implementation

uses Conexao_BD, Rotinas_Gerais, V_Historico_Produtos_01,
  V_Historico_Clientes_02, V_Historico_Clientes_03;

{$R *.dfm}

procedure TVHistoricoProdutos03.Carrega_Combo_Estado;
var Comando_SQL: String;
begin
    Ampulheta();
    Comando_SQL := 'Select * from fb_clientes ';
    Comando_SQL := Comando_SQL + 'Group By fb_cliente_estado ';
    Comando_SQL := Comando_SQL + 'Order By fb_cliente_estado';

    ConexaoBD.SQL_FB_Clientes.Close;
    ConexaoBD.SQL_FB_Clientes.SQL.Clear;
    ConexaoBD.SQL_FB_Clientes.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Clientes.Open;

    cbEstado.Items.Clear;
    cbEstado.Items.Add('- Todos -');
    While ConexaoBD.SQL_FB_Clientes.Eof = False Do Begin
        cbEstado.Items.Add(Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text));
        ConexaoBD.SQL_FB_Clientes.Next;
    End;
    cbEstado.ItemIndex := 0;
    ConexaoBD.SQL_FB_Clientes.Close;
    Seta();
end;

procedure TVHistoricoProdutos03.Carrega_Combo_Cidade;
var Comando_SQL: String;
begin
    Ampulheta();
    If Trim(cbEstado.Text) <> '- Todos -' Then Begin
        Comando_SQL := 'Select * from fb_clientes ';
        Comando_SQL := Comando_SQL + 'Where fb_cliente_estado ='+#39+Trim(cbEstado.Text)+#39;
        Comando_SQL := Comando_SQL + 'Group By fb_cliente_cidade ';
        Comando_SQL := Comando_SQL + 'Order By fb_cliente_cidade';

        ConexaoBD.SQL_FB_Clientes.Close;
        ConexaoBD.SQL_FB_Clientes.SQL.Clear;
        ConexaoBD.SQL_FB_Clientes.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_FB_Clientes.Open;

        cbCidade.Items.Clear;
        cbCidade.Items.Add('- - - - - - - - - - Todas - - - - - - - - - -');
        While ConexaoBD.SQL_FB_Clientes.Eof = False Do Begin
            cbCidade.Items.Add(Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_cidade.Text));
            ConexaoBD.SQL_FB_Clientes.Next;
        End;
        cbCidade.ItemIndex := 0;
        ConexaoBD.SQL_FB_Clientes.Close;
        End
    Else Begin
        cbCidade.Items.Clear;
        cbCidade.Items.Add('- - - - - - - - - - Todas - - - - - - - - - -');
        cbCidade.ItemIndex := 0;
    End;
    Seta();
end;

procedure TVHistoricoProdutos03.Carrega_Combo_Bairro;
var Comando_SQL: String;
begin
    Ampulheta();
    If Trim(cbCidade.Text) <> '- - - - - - - - - - Todas - - - - - - - - - -' Then Begin
        Comando_SQL := 'Select * from fb_clientes ';
        Comando_SQL := Comando_SQL + 'Where (fb_cliente_estado ='+#39+Trim(cbEstado.Text)+#39+') ';
        Comando_SQL := Comando_SQL + 'And (fb_cliente_cidade ='+#39+Trim(cbCidade.Text)+#39+')';
        Comando_SQL := Comando_SQL + 'Group By fb_cliente_bairro ';
        Comando_SQL := Comando_SQL + 'Order By fb_cliente_bairro';

        ConexaoBD.SQL_FB_Clientes.Close;
        ConexaoBD.SQL_FB_Clientes.SQL.Clear;
        ConexaoBD.SQL_FB_Clientes.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_FB_Clientes.Open;

        cbBairro.Items.Clear;
        cbBairro.Items.Add('- - - - - - - - - - Todos - - - - - - - - - -');
        While ConexaoBD.SQL_FB_Clientes.Eof = False Do Begin
            cbBairro.Items.Add(Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_bairro.Text));
            ConexaoBD.SQL_FB_Clientes.Next;
        End;
        cbBairro.ItemIndex := 0;
        ConexaoBD.SQL_FB_Clientes.Close;
        End
    Else Begin
        cbBairro.Items.Clear;
        cbBairro.Items.Add('- - - - - - - - - - Todos - - - - - - - - - -');
        cbBairro.ItemIndex := 0;
    End;
    Seta();
end;

procedure TVHistoricoProdutos03.FormShow(Sender: TObject);
begin
    edtDataInicial.Text := DateToStr(Date());
    edtDataFinal.Text   := DateToStr(Date());
    Carrega_Combo_Estado();
end;

procedure TVHistoricoProdutos03.cbEstadoSelect(Sender: TObject);
begin
    Carrega_Combo_Cidade();
end;

procedure TVHistoricoProdutos03.btnSairClick(Sender: TObject);
begin
    VHistoricoProdutos03.Close;
end;

procedure TVHistoricoProdutos03.cbCidadeSelect(Sender: TObject);
begin
    Carrega_Combo_Bairro();
end;

procedure TVHistoricoProdutos03.btnFiltrarClick(Sender: TObject);
begin
    IF Trim(edtDataInicial.Text) = '/  /' Then Begin
        MSG_Erro('Antes de proseguir preencha os campos de período...');
        edtDataInicial.SetFocus;
        End
    Else IF Trim(edtDataFinal.Text) = '/  /' Then Begin
        MSG_Erro('Antes de proseguir preencha os campos de período...');
        edtDataFinal.SetFocus;
        End
    Else IF StrToDate(edtDataFinal.Text) < StrToDate(edtDataInicial.Text) Then Begin
        MSG_Erro('A data de início do Período não pode ser '+#13+'maior que a data de termino.');
        edtDataInicial.SetFocus;
        End
    Else Begin
        If Trim(Tipo_Historico.Text) = 'Historico_Produtos' Then Begin
            Application.CreateForm(TVHistoricoProdutos01,VHistoricoProdutos01);

            VHistoricoProdutos01.editReferencia.Text := Trim(editReferencia.Text);
            VHistoricoProdutos01.editCodigo.Text     := Trim(editCodigo.Text);
            VHistoricoProdutos01.editDescricao.Text  := Trim(editDescricao.Text);
            VHistoricoProdutos01.edtDataInicial.Text := Trim(edtDataInicial.Text);
            VHistoricoProdutos01.edtDataFinal.Text   := Trim(edtDataFinal.Text);
            VHistoricoProdutos01.edtEstado.Text      := Trim(cbEstado.Text);
            VHistoricoProdutos01.edtCidade.Text      := Trim(cbCidade.Text);
            VHistoricoProdutos01.edtBairro.Text      := Trim(cbBairro.Text);

            VHistoricoProdutos01.ShowModal;
            VHistoricoProdutos01.Destroy;
            End
        Else Begin
            Application.CreateForm(TVHistoricoClientes03,VHistoricoClientes03);

            VHistoricoClientes03.editReferencia.Text := Trim(editReferencia.Text);
            VHistoricoClientes03.editCodigo.Text     := Trim(editCodigo.Text);
            VHistoricoClientes03.editDescricao.Text  := Trim(editDescricao.Text);
            VHistoricoClientes03.edtDataInicial.Text := Trim(edtDataInicial.Text);
            VHistoricoClientes03.edtDataFinal.Text   := Trim(edtDataFinal.Text);
            VHistoricoClientes03.edtEstado.Text      := Trim(cbEstado.Text);
            VHistoricoClientes03.edtCidade.Text      := Trim(cbCidade.Text);
            VHistoricoClientes03.edtBairro.Text      := Trim(cbBairro.Text);

            VHistoricoClientes03.ShowModal;
            VHistoricoClientes03.Destroy;
        End;
    End;
end;

procedure TVHistoricoProdutos03.edtDataInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TVHistoricoProdutos03.edtDataFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TVHistoricoProdutos03.cbEstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TVHistoricoProdutos03.cbCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TVHistoricoProdutos03.cbBairroKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
