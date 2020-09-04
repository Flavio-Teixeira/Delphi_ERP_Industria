unit Altera_Banco_Cobranca_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TAlteraBancoCobranca00 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    Label1: TLabel;
    Edit_Numero_Documento: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit_Codigo: TEdit;
    Label3: TLabel;
    Edit_Nome: TEdit;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Edit_Vlr_Pagamento: TEdit;
    Label40: TLabel;
    Cliente_Banco: TComboBox;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit_Codigo_BancarioKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_DT_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Vlr_JurosKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Vlr_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Numero_DocumentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure BT_AlterarClick(Sender: TObject);
    procedure Edit_Numero_DocumentoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Procedure Obtem_Dados_Baixa(var Nro: String);
    procedure Carrega_Bancos();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlteraBancoCobranca00: TAlteraBancoCobranca00;
  Documento, Nro_Documento, Baixa: String;

implementation

uses Conexao_BD, Rotinas_Gerais, Ibrasmak_00;

{$R *.dfm}

procedure TAlteraBancoCobranca00.BT_SairClick(Sender: TObject);
begin
     AlteraBancoCobranca00.Close;
end;

procedure TAlteraBancoCobranca00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***

     ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TAlteraBancoCobranca00.Edit_Codigo_BancarioKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
  So_Numero(Sender,Key);
end;

procedure TAlteraBancoCobranca00.Edit_DT_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TAlteraBancoCobranca00.Edit_Vlr_JurosKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
  So_Valor(Sender,Key);
end;

procedure TAlteraBancoCobranca00.Edit_Vlr_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
  So_Valor(Sender,Key);
end;

Procedure TAlteraBancoCobranca00.Obtem_Dados_Baixa(var Nro: String);
Begin

  Ampulheta();
  Baixa                       := '';
  Edit_Codigo.Text            := '';
  Edit_Nome.Text              := '';
  Edit_Vlr_Pagamento.Text     := '';

  // Verifica se o número do documento foi digitado

  If Trim(Nro) = '' Then
    Begin
    MSG_Erro('Preencha o Campo ' + #39 + 'Nro Documento' + #39 + ' Antes de Prosseguir...');
    Edit_Numero_Documento.SetFocus;
    End

  // Procura o número do documento

  Else
    Begin

    Documento := 'Nota Fiscal';

    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * From fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Trim(Nro));
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    // Verifica se o número da nota existe
    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount <= 0 Then
       Begin
       MSG_Erro('Documento Não Encontrado...');
       End
    Else
       Begin
       // Encontra nome do Banco
       ConexaoBD.SQL_FB_Bancos.SQL.Clear;
       ConexaoBD.SQL_FB_Bancos.SQL.Add('Select * from fb_bancos Where fb_banco_codigo='+ ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text);
       ConexaoBD.SQL_FB_Bancos.Open;

       // Carrega na Tela
       Edit_Codigo.Text        := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;
       Edit_Nome.Text          := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text;
       Edit_Vlr_Pagamento.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
       Cliente_Banco.ItemIndex := Obtem_Nro_Banco(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text);

       // Fecha os RecordSets
       ConexaoBD.SQL_FB_Bancos.Close;
       ConexaoBD.SQL_FB_Nota_Fiscal.Close;

       // Abilita Campo Para edição
       BT_Alterar.Enabled            := True;

       Cliente_Banco.SetFocus;
    End;

  End;
  Seta();
End;

procedure TAlteraBancoCobranca00.Edit_Numero_DocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
    Nro_Documento := Edit_Numero_Documento.Text;
    Obtem_Dados_Baixa(Nro_Documento);
  End;
end;

procedure TAlteraBancoCobranca00.BT_AlterarClick(Sender: TObject);
var
  Comando_SQL : String;
begin
    Comando_SQL := 'Update fb_notas_fiscais Set ';
    Comando_SQL := Comando_SQL + 'fb_nota_fiscal_banco = '  + Obtem_Nro_Antes_Traco(Cliente_Banco.Text) +' ';
    Comando_SQL := Comando_SQL + 'Where fb_nota_fiscal_numero = ' + Trim(Edit_Numero_Documento.Text);

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    BT_Alterar.Enabled            := False;

    // Apaga comteúdo dos Texts
    Edit_Numero_Documento.Text  := '';
    Edit_Codigo.Text            := '';
    Edit_Nome.Text              := '';
    Edit_Vlr_Pagamento.Text     := '';

    MSG_Erro('Baixa executada com sucesso...');
    Edit_Numero_Documento.SetFocus;
  
end;

procedure TAlteraBancoCobranca00.Edit_Numero_DocumentoChange(Sender: TObject);
begin

    Edit_Codigo.Text            := '';
    Edit_Nome.Text              := '';
    Edit_Vlr_Pagamento.Text     := '';

    BT_Alterar.Enabled            := False;
end;

procedure TAlteraBancoCobranca00.FormShow(Sender: TObject);
begin
    Carrega_Bancos();
end;

procedure TAlteraBancoCobranca00.Carrega_Bancos();
begin
     // Obtem os Bancos

     ConexaoBD.SQL_Bancos.Close;
     ConexaoBD.SQL_Bancos.SQL.Clear;
     ConexaoBD.SQL_Bancos.SQL.Add('Select * from fb_bancos Order By fb_banco_descricao');
     ConexaoBD.SQL_Bancos.Open;

     Cliente_Banco.Items.Clear;

     If conexaoBD.SQL_Bancos.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Bancos.First;

        While Not conexaoBD.SQL_Bancos.Eof Do
              begin
              Cliente_Banco.Items.Add(IntToStr(conexaoBD.SQL_Bancosfb_banco_codigo.AsInteger)+' - '+conexaoBD.SQL_Bancosfb_banco_descricao.AsString);
              conexaoBD.SQL_Bancos.Next;
        End;
     end;

     ConexaoBD.SQL_Bancos.Close;

     Cliente_Banco.ItemIndex := 0;
end;

end.
