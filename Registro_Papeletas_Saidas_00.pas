unit Registro_Papeletas_Saidas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, DBCtrls;

type
  TRegistroPapeletasSaidas00 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBG_Notas_Saidas: TDBGrid;
    Panel5: TPanel;
    Label1: TLabel;
    Total_Pedidos_Ibrasmak: TLabel;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    Numero_Nota: TEdit;
    BT_Procurar: TBitBtn;
    BT_Incluir: TBitBtn;
    Label3: TLabel;
    Data_Inicial: TMaskEdit;
    Label4: TLabel;
    Data_Final: TMaskEdit;
    Label5: TLabel;
    DBG_Cliente_Observacao_Nota: TDBMemo;
    DBG_Cliente_Observacao: TDBMemo;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Numero_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_IncluirClick(Sender: TObject);
    procedure DBG_Notas_SaidasCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistroPapeletasSaidas00: TRegistroPapeletasSaidas00;
  Selecionado: string;
  
implementation

uses Conexao_BD, Rotinas_Gerais, Registro_Notas_Fiscais_Saidas_01,
  Registro_Notas_Fiscais_Saidas_00, Registro_Papeletas_Saidas_01;

{$R *.dfm}

procedure TRegistroPapeletasSaidas00.BT_SairClick(Sender: TObject);
begin
     RegistroPapeletasSaidas00.Close;
end;

procedure TRegistroPapeletasSaidas00.BT_ProcurarClick(Sender: TObject);
begin
     Ampulheta();

     ConexaoBD.SQL_FB_Papeletas.Close;
     ConexaoBD.SQL_FB_Papeletas.SQL.Clear;

     If Trim(Numero_Nota.Text) <> '' Then
        Begin
        ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * from fb_papeletas Where fb_papeleta_numero = ' + Trim(Numero_Nota.Text) + ' Order By fb_papeleta_data_emissao Desc, fb_papeleta_numero Desc');
        End
     Else
        Begin

        Seta();

        If Trim(Data_Inicial.Text) = '/  /' Then
           Begin
           MSG_Erro('Antes de prosseguir favor preencher o campo Data inicial...');
           Data_Inicial.SetFocus;
           End
        Else if Trim(Data_Final.Text) = '/  /' then
           Begin
           MSG_Erro('Antes de prosseguir favor preencher o campo Data final...');
           Data_Final.SetFocus;
           End
        Else if StrToDate(Data_Inicial.Text) > StrToDate(Data_Final.Text) then
           Begin
           MSG_Erro('Antes de prosseguir favor Verificar as datas Data Final menor que Data Inicial...');
           Data_Final.SetFocus;
           End
        Else
           Begin
           Ampulheta();
           ConexaoBD.SQL_FB_Papeletas.SQL.Add('Select * from fb_papeletas Where (fb_papeleta_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+' and fb_papeleta_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+') Order By fb_papeleta_data_emissao Desc, fb_papeleta_numero Desc');
        End;
     End;

     ConexaoBD.SQL_FB_Papeletas.Open;

     Total_Pedidos_Ibrasmak.Caption := IntToStr(ConexaoBD.SQL_FB_Papeletas.RecordCount);

     Seta();
end;

procedure TRegistroPapeletasSaidas00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRegistroPapeletasSaidas00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     RegistroPapeletasSaidas00 := Nil;
end;

procedure TRegistroPapeletasSaidas00.FormShow(Sender: TObject);
begin
    //*** Carrega data atual nos campos de periodo ***

    Data_Final.Text   := DateToStr(Date());
    Data_Inicial.Text := '01/' + Trim(Copy(Data_Final.Text,4,2)) + '/' + Trim(Copy(Data_Final.Text,7,4));
end;

procedure TRegistroPapeletasSaidas00.Numero_NotaKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroPapeletasSaidas00.Data_InicialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroPapeletasSaidas00.Data_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroPapeletasSaidas00.BT_IncluirClick(Sender: TObject);
begin
     If (RegistroPapeletasSaidas01 = Nil) Then
        Begin
        Application.CreateForm(TRegistroPapeletasSaidas01,RegistroPapeletasSaidas01);
     End;

     RegistroPapeletasSaidas01.BT_Incluir.Visible := True;
     RegistroPapeletasSaidas01.BT_Alterar.Visible := False;
     RegistroPapeletasSaidas01.BT_Excluir.Visible := False;

     RegistroPapeletasSaidas01.Show;
end;

procedure TRegistroPapeletasSaidas00.DBG_Notas_SaidasCellClick(
  Column: TColumn);
var
    Comando_SQL: String;
begin
    If DBG_Notas_Saidas.Fields[0].Text <> '' Then Begin
      Selecionado := DBG_Notas_Saidas.Fields[0].Text;

      If (RegistroPapeletasSaidas01 = Nil) Then Begin
        Application.CreateForm(TRegistroPapeletasSaidas01,RegistroPapeletasSaidas01);
      End;

      Comando_SQL := 'Select * from fb_papeletas Where fb_papeleta_numero = ' + Trim(DBG_Notas_Saidas.Fields[0].Text);

      ConexaoBD.SQL_FB_Papeletas.Close;
      ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
      ConexaoBD.SQL_FB_Papeletas.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_FB_Papeletas.Open;

      If ConexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then Begin

        RegistroPapeletasSaidas01.BT_Incluir.Visible := False;
        RegistroPapeletasSaidas01.BT_Alterar.Visible := True;
        RegistroPapeletasSaidas01.BT_Excluir.Visible := True;

        RegistroPapeletasSaidas01.Cliente_Codigo_Tipo.Text          := 'CNPJ';
        RegistroPapeletasSaidas01.Cliente_Codigo.Text               := ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text;
        RegistroPapeletasSaidas01.Cliente_Nome.Text                 := ConexaoBD.SQL_FB_Papeletasfb_papeleta_nome.Text;

        RegistroPapeletasSaidas01.Nota_Numero.Text                  := ConexaoBD.SQL_FB_Papeletasfb_papeleta_numero.Text;
        RegistroPapeletasSaidas01.Nota_Emissao.Text                 := ConexaoBD.SQL_FB_Papeletasfb_papeleta_data_emissao.Text;
        RegistroPapeletasSaidas01.Cliente_CFOP.Text                 := ConexaoBD.SQL_FB_Papeletasfb_papeleta_cfop.Text;

        RegistroPapeletasSaidas01.Nro_Natureza_Operacao.Text        := IntToStr(Obtem_Nro_Natureza_Operacao(ConexaoBD.SQL_FB_Papeletasfb_papeleta_natureza_oper.Text,ConexaoBD.SQL_FB_Papeletasfb_papeleta_cfop.Text));

        RegistroPapeletasSaidas01.Cliente_Tipo_Transporte.ItemIndex := Obtem_Nro_Tipo_Transporte(ConexaoBD.SQL_FB_Papeletasfb_papeleta_tipo_transp.Text);
        RegistroPapeletasSaidas01.Cliente_Pgto_Frete.ItemIndex      := Obtem_Nro_Pgto_Frete(ConexaoBD.SQL_FB_Papeletasfb_papeleta_pgto_frete.Text);
        RegistroPapeletasSaidas01.Nro_Transportadora.Text           := IntToStr(Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Papeletasfb_papeleta_transporta.Text));

        If Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_emite_lote.Text) = 'N' Then Begin
          RegistroPapeletasSaidas01.Cliente_Emite_Lote.ItemIndex   := 0;
          End
        Else Begin
          RegistroPapeletasSaidas01.Cliente_Emite_Lote.ItemIndex   := 1;
        End;

        //*** Obtem o Cliente ***

        ConexaoBD.SQL_Clientes.Close;
        ConexaoBD.SQL_Clientes.SQL.Clear;
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text) + #39 );
        ConexaoBD.SQL_Clientes.Open;

        //*** Endereço Normal ***

        RegistroPapeletasSaidas01.Cliente_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Clientesfb_cliente_estado.Text);
        RegistroPapeletasSaidas01.Cliente_Cep.Text              := conexaoBD.SQL_Clientesfb_cliente_cep.Text;
        RegistroPapeletasSaidas01.Cliente_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Clientesfb_cliente_pais.Text);
        RegistroPapeletasSaidas01.Cliente_Endereco.Text         := conexaoBD.SQL_Clientesfb_cliente_endereco.Text;
        RegistroPapeletasSaidas01.Cliente_Complemento.Text      := conexaoBD.SQL_Clientesfb_cliente_complemento.Text;
        RegistroPapeletasSaidas01.Cliente_Bairro.Text           := conexaoBD.SQL_Clientesfb_cliente_bairro.Text;
        RegistroPapeletasSaidas01.Cliente_Cidade.Text           := conexaoBD.SQL_Clientesfb_cliente_cidade.Text;

        //*** Endereço de Cobrança ***

        RegistroPapeletasSaidas01.Cliente_Endereco_Cobranca.Text    := conexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text;
        RegistroPapeletasSaidas01.Cliente_Complemento_Cobranca.Text := conexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
        RegistroPapeletasSaidas01.Cliente_Bairro_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
        RegistroPapeletasSaidas01.Cliente_Cidade_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
        RegistroPapeletasSaidas01.Cliente_Estado_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
        RegistroPapeletasSaidas01.Cliente_Cep_Cobranca.Text         := conexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text;
        RegistroPapeletasSaidas01.Cliente_Pais_Cobranca.Text        := conexaoBD.SQL_Clientesfb_cliente_pais_cobranca.Text;

        //*** Continua Carregando os Dados ***

        RegistroPapeletasSaidas01.Cliente_Contato.Text          := conexaoBD.SQL_Clientesfb_cliente_contato.Text;
        RegistroPapeletasSaidas01.Cliente_DDD.Text              := conexaoBD.SQL_Clientesfb_cliente_ddd.Text;
        RegistroPapeletasSaidas01.Cliente_Fone_Ramal.Text       := conexaoBD.SQL_Clientesfb_cliente_fone_ramal.Text;
        RegistroPapeletasSaidas01.Cliente_Fone_Comercial.Text   := conexaoBD.SQL_Clientesfb_cliente_fone.Text;
        RegistroPapeletasSaidas01.Cliente_Fone_Residencial.Text := conexaoBD.SQL_Clientesfb_cliente_fone_residencial.Text;
        RegistroPapeletasSaidas01.Cliente_Fone_Celular.Text     := conexaoBD.SQL_Clientesfb_cliente_fone_celular.Text;
        RegistroPapeletasSaidas01.Cliente_Fone_Fax.Text         := conexaoBD.SQL_Clientesfb_cliente_fax.Text;
        RegistroPapeletasSaidas01.Cliente_Email.Text            := conexaoBD.SQL_Clientesfb_cliente_email.Text;

        RegistroPapeletasSaidas01.Cliente_Tipo_Pessoa.Text           := conexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text;
        RegistroPapeletasSaidas01.Cliente_Inscricao_Estadual.Text    := conexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text;
        RegistroPapeletasSaidas01.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(ConexaoBD.SQL_FB_Papeletasfb_papeleta_tipo_transp.Text);
        RegistroPapeletasSaidas01.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Papeletasfb_papeleta_transporta.Text));
        RegistroPapeletasSaidas01.Codigo_Transportadora.Text         := ConexaoBD.SQL_FB_Papeletasfb_papeleta_transporta.Text;
        RegistroPapeletasSaidas01.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete(ConexaoBD.SQL_FB_Papeletasfb_papeleta_pgto_frete.Text));

        RegistroPapeletasSaidas01.Nro_Natureza_Operacao.Text         := IntToStr(Obtem_Nro_Natureza_Operacao(Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_natureza_oper.Text),Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_cfop.Text)));

        RegistroPapeletasSaidas01.Cliente_Suframa.Text               := conexaoBD.SQL_Clientesfb_cliente_suframa.Text;

        RegistroPapeletasSaidas01.Observacao_Nota.Lines.Clear;
        RegistroPapeletasSaidas01.Observacao_Nota.Lines.Add(DBG_Cliente_Observacao.Text);

        RegistroPapeletasSaidas01.Cliente_Observacao.Lines.Clear;
        RegistroPapeletasSaidas01.Cliente_Observacao.Lines.Add(DBG_Cliente_Observacao_Nota.Text);

        RegistroPapeletasSaidas01.Cliente_Desconto.Text            := ConexaoBD.SQL_FB_Papeletasfb_papeleta_desconto.Text;
        RegistroPapeletasSaidas01.Cliente_Ordem_Compra.Text        := ConexaoBD.SQL_FB_Papeletasfb_papeleta_ordem_compra.Text;

        RegistroPapeletasSaidas01.Cliente_Condicao_Pgto_1.Text     := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_1.Text;
        RegistroPapeletasSaidas01.Cliente_Condicao_Pgto_Vlr_1.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_1.Text;
        RegistroPapeletasSaidas01.Cliente_Condicao_Pgto_2.Text     := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_2.Text;
        RegistroPapeletasSaidas01.Cliente_Condicao_Pgto_Vlr_2.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_2.Text;
        RegistroPapeletasSaidas01.Cliente_Condicao_Pgto_3.Text     := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_3.Text;
        RegistroPapeletasSaidas01.Cliente_Condicao_Pgto_Vlr_3.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_3.Text;
        RegistroPapeletasSaidas01.Cliente_Condicao_Pgto_4.Text     := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_dt_vcto_4.Text;
        RegistroPapeletasSaidas01.Cliente_Condicao_Pgto_Vlr_4.Text := ConexaoBD.SQL_FB_Papeletasfb_papeleta_dup_vlr_4.Text;

        RegistroPapeletasSaidas01.Nota_Valor_Produto.Text          := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text)) - StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_ipi.Text))));
        RegistroPapeletasSaidas01.Valor_Frete.Text                 := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_frete.Text;
        RegistroPapeletasSaidas01.Valor_Total.Text                 := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;

        RegistroPapeletasSaidas01.Imprime_Nota_Apos.Checked := False;
        RegistroPapeletasSaidas01.Programa_Anterior.Text    := 'Alteração-Exclusão';

        If(ConexaoBD.SQL_FB_Papeletasfb_papeleta_nao_possui_duplicatas.Text = 'S') Then
           Begin
           RegistroPapeletasSaidas01.Opcao_Sem_Duplicata.Checked := True;
           End
        Else
           Begin
           RegistroPapeletasSaidas01.Opcao_Sem_Duplicata.Checked := False;
        End;

        RegistroPapeletasSaidas01.Show;

        ConexaoBD.SQL_FB_Papeletas.Locate('fb_papeleta_numero',Trim(Selecionado),[]);
      End;
    End;
end;

end.
