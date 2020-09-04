unit Registro_Notas_Fiscais_Saidas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, DBCtrls;

type
  TRegistroNotasFiscaisSaidas00 = class(TForm)
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
    DBG_FB_Cliente_Observacao_Nota: TDBMemo;
    DBG_FB_Cliente_Observacao: TDBMemo;
    Label6: TLabel;
    Opc_Ibrasmak: TRadioButton;
    Opc_Monibras: TRadioButton;
    DBG_Notas_Saidas_MB: TDBGrid;
    DBG_MB_Cliente_Observacao: TDBMemo;
    DBG_MB_Cliente_Observacao_Nota: TDBMemo;
    Tipo_Emissao_Nota: TEdit;
    Nome_Cliente: TEdit;
    Label7: TLabel;
    Label8: TLabel;
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
    procedure DBG_Notas_Saidas_MBCellClick(Column: TColumn);
    procedure Nome_ClienteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistroNotasFiscaisSaidas00: TRegistroNotasFiscaisSaidas00;
  Selecionado: string;
  
implementation

uses Conexao_BD, Rotinas_Gerais, Registro_Notas_Fiscais_Saidas_01,
  Registro_Notas_Fiscais_Saidas_02;

{$R *.dfm}

procedure TRegistroNotasFiscaisSaidas00.BT_SairClick(Sender: TObject);
begin
     RegistroNotasFiscaisSaidas00.Close;
end;

procedure TRegistroNotasFiscaisSaidas00.BT_ProcurarClick(Sender: TObject);

var
   Comando_SQL: String;

begin
     If Opc_Ibrasmak.Checked Then
        Begin

        Ampulheta();

        DBG_Notas_Saidas.Visible := True;
        DBG_Notas_Saidas_MB.Visible := False;

        ConexaoBD.SQL_FB_Nota_Fiscal.Close;
        ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;

        If Trim(Numero_Nota.Text) <> '' Then
           Begin
           ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add('Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Trim(Numero_Nota.Text) + ' Order By fb_nota_fiscal_data_emissao Desc, fb_nota_fiscal_numero Desc');
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

              Comando_SQL := 'Select * from fb_notas_fiscais ';
              Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+' and ';
              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+') ';

              If Trim(Nome_Cliente.Text) <> '' Then
                 Begin
                 Comando_SQL := Comando_SQL + 'and fb_nota_fiscal_nome Like ' +#39+'%'+ Trim(Nome_Cliente.Text) +'%'+#39+ ' ';
              End;

              Comando_SQL := Comando_SQL + 'Order By fb_nota_fiscal_data_emissao Desc, fb_nota_fiscal_numero Desc';
              ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
           End;
        End;

        ConexaoBD.SQL_FB_Nota_Fiscal.Open;

        Total_Pedidos_Ibrasmak.Caption := IntToStr(ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount);

        Seta();

        End
     Else
        Begin

        Ampulheta();

        DBG_Notas_Saidas.Visible := False;
        DBG_Notas_Saidas_MB.Visible := True;

        ConexaoBD.SQL_MB_Nota_Fiscal.Close;
        ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Clear;

        If Trim(Numero_Nota.Text) <> '' Then
           Begin
           ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Add('Select * from mb_notas_fiscais Where mb_nota_fiscal_numero = ' + Trim(Numero_Nota.Text) + ' Order By mb_nota_fiscal_data_emissao Desc, mb_nota_fiscal_numero Desc');
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

              Comando_SQL := 'Select * from mb_notas_fiscais ';
              Comando_SQL := Comando_SQL + 'Where (mb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+' and ';
              Comando_SQL := Comando_SQL + 'mb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+') ';

              If Trim(Nome_Cliente.Text) <> '' Then
                 Begin
                 Comando_SQL := Comando_SQL + 'and mb_nota_fiscal_nome Like ' +#39+'%'+ Trim(Nome_Cliente.Text) +'%'+#39+ ' ';
              End;

              Comando_SQL := Comando_SQL + 'Order By mb_nota_fiscal_data_emissao Desc, mb_nota_fiscal_numero Desc';
              ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Add(Comando_SQL);
           End;
        End;

        ConexaoBD.SQL_MB_Nota_Fiscal.Open;

        Total_Pedidos_Ibrasmak.Caption := IntToStr(ConexaoBD.SQL_MB_Nota_Fiscal.RecordCount);

        Seta();

     End;

end;

procedure TRegistroNotasFiscaisSaidas00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRegistroNotasFiscaisSaidas00.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
     Release;
     RegistroNotasFiscaisSaidas00 := Nil;
end;

procedure TRegistroNotasFiscaisSaidas00.FormShow(Sender: TObject);
begin
    //*** Carrega data atual nos campos de periodo ***

    Data_Final.Text   := DateToStr(Date());
    Data_Inicial.Text := '01/' + Trim(Copy(Data_Final.Text,4,2)) + '/' + Trim(Copy(Data_Final.Text,7,4));
end;

procedure TRegistroNotasFiscaisSaidas00.Numero_NotaKeyPress(
  Sender: TObject; var Key: Char);
begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas00.Data_InicialKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas00.Data_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TRegistroNotasFiscaisSaidas00.BT_IncluirClick(Sender: TObject);

var
   Nro_Nota: Integer;
   
begin
     If Opc_Ibrasmak.Checked Then
        Begin

        If (RegistroNotasFiscaisSaidas01 = Nil) Then
           Begin
           Application.CreateForm(TRegistroNotasFiscaisSaidas01,RegistroNotasFiscaisSaidas01);
        End;

        //*** Pega a Numeração da Ibrasmak ***

        ConexaoBD.SQL_FB_NF_Anterior.Close;
        ConexaoBD.SQL_FB_NF_Anterior.SQL.Clear;
        ConexaoBD.SQL_FB_NF_Anterior.SQL.Add('Select * from fb_nf_anterior');
        ConexaoBD.SQL_FB_NF_Anterior.Open;

        If conexaoBD.SQL_FB_NF_Anterior.RecordCount > 0 Then
           Begin
           Nro_Nota := StrToInt(ConexaoBD.SQL_FB_NF_AnteriorFB_NF_Anterior_Numero.Text);
           Nro_Nota := Nro_Nota + 1;
           RegistroNotasFiscaisSaidas01.Nota_Numero.Text := IntToStr(Nro_Nota);
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas01.Nota_Numero.Text := '1';
        End;

        RegistroNotasFiscaisSaidas01.BT_Incluir.Visible := True;
        RegistroNotasFiscaisSaidas01.BT_Alterar.Visible := False;
        RegistroNotasFiscaisSaidas01.BT_Excluir.Visible := False;

        RegistroNotasFiscaisSaidas01.Tipo_Nota_Emissao.Text := Tipo_Emissao_Nota.Text;

        RegistroNotasFiscaisSaidas01.Show;

        End
     Else
        Begin

        If (RegistroNotasFiscaisSaidas02 = Nil) Then
           Begin
           Application.CreateForm(TRegistroNotasFiscaisSaidas02,RegistroNotasFiscaisSaidas02);
        End;

        //*** Pega a Numeração da Ibrasmak ***

        ConexaoBD.SQL_MB_NF_Anterior.Close;
        ConexaoBD.SQL_MB_NF_Anterior.SQL.Clear;
        ConexaoBD.SQL_MB_NF_Anterior.SQL.Add('Select * from mb_nf_anterior');
        ConexaoBD.SQL_MB_NF_Anterior.Open;

        If conexaoBD.SQL_MB_NF_Anterior.RecordCount > 0 Then
           Begin
           Nro_Nota := StrToInt(ConexaoBD.SQL_MB_NF_AnteriorMB_NF_Anterior_Numero.Text);
           Nro_Nota := Nro_Nota + 1;
           RegistroNotasFiscaisSaidas02.Nota_Numero.Text := IntToStr(Nro_Nota);
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas02.Nota_Numero.Text := '1';
        End;

        RegistroNotasFiscaisSaidas02.BT_Incluir.Visible := True;
        RegistroNotasFiscaisSaidas02.BT_Alterar.Visible := False;
        RegistroNotasFiscaisSaidas02.BT_Excluir.Visible := False;

        RegistroNotasFiscaisSaidas02.Tipo_Nota_Emissao.Text := Tipo_Emissao_Nota.Text;

        RegistroNotasFiscaisSaidas02.Show;

     End;

end;

procedure TRegistroNotasFiscaisSaidas00.DBG_Notas_SaidasCellClick(
  Column: TColumn);
var
    Comando_SQL: String;
    Erro: Integer;
    Vlr_Centavos_Nro: Real;
    Vlr_Centavos_Str: String;

begin
    If DBG_Notas_Saidas.Fields[0].Text <> '' Then Begin
      Ampulheta();

      Selecionado := DBG_Notas_Saidas.Fields[0].Text;

      If (RegistroNotasFiscaisSaidas01 = Nil) Then Begin
        Application.CreateForm(TRegistroNotasFiscaisSaidas01,RegistroNotasFiscaisSaidas01);
      End;

      Comando_SQL := 'Select * from fb_notas_fiscais Where fb_nota_fiscal_numero = ' + Trim(DBG_Notas_Saidas.Fields[0].Text);

      ConexaoBD.SQL_FB_Nota_Fiscal.Close;
      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
      ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_FB_Nota_Fiscal.Open;

      Seta();

      If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then Begin

        Ampulheta();

        RegistroNotasFiscaisSaidas01.BT_Incluir.Visible := False;
        RegistroNotasFiscaisSaidas01.BT_Alterar.Visible := True;
        RegistroNotasFiscaisSaidas01.BT_Excluir.Visible := True;

        RegistroNotasFiscaisSaidas01.Cliente_Codigo_Tipo.Text          := 'CNPJ';
        RegistroNotasFiscaisSaidas01.Cliente_Codigo.Text               := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Nome.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text;

        RegistroNotasFiscaisSaidas01.Nota_Numero.Text                  := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;
        RegistroNotasFiscaisSaidas01.Nota_Emissao.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
        RegistroNotasFiscaisSaidas01.Cliente_CFOP.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text;

        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper_nro.Text) <> '' Then
           Begin
           RegistroNotasFiscaisSaidas01.Nro_Natureza_Operacao.Text     := IntToStr(Obtem_Nro_Natureza_Operacao_N(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper_nro.Text)));
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas01.Nro_Natureza_Operacao.Text     := IntToStr(Obtem_Nro_Natureza_Operacao(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper_desc.Text,ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text));
        End;

        RegistroNotasFiscaisSaidas01.Cliente_Natureza_Operacao.Text    := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper_desc.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Tipo_Transporte.ItemIndex := Obtem_Nro_Tipo_Transporte(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_transp.Text);
        RegistroNotasFiscaisSaidas01.Cliente_Pgto_Frete.ItemIndex      := Obtem_Nro_Pgto_Frete(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_pgto_frete.Text);
        RegistroNotasFiscaisSaidas01.Nro_Transportadora.Text           := IntToStr(Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text));

        RegistroNotasFiscaisSaidas01.Cliente_Base_Reduzida.Text        := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_icms_reduzida.Text;

        RegistroNotasFiscaisSaidas01.Especie.Text                      := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_especie.Text;
        RegistroNotasFiscaisSaidas01.Marca.Text                        := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_marca.Text;
        RegistroNotasFiscaisSaidas01.Peso_Bruto.Text                   := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_peso_bruto.Text;
        RegistroNotasFiscaisSaidas01.Peso_Liquido.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_peso_liquido.Text;

        If(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_nota.Text = 'S') Then
        Begin
            RegistroNotasFiscaisSaidas01.Tipo_Nota_Saida.Checked := True;
        End
        Else
        Begin
            RegistroNotasFiscaisSaidas01.Tipo_Nota_Entrada.Checked := True;
        End;

        If(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_consumo.Text = 'S') Then
        Begin
            RegistroNotasFiscaisSaidas01.Nota_Consumo.Checked := True;
        End
        Else
        Begin
            RegistroNotasFiscaisSaidas01.Nota_Consumo.Checked := False;
        End;

        If(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_zerar_icms.Text = 'S') Then
        Begin
            RegistroNotasFiscaisSaidas01.Zera_Base_ICMS.Checked := True;
        End
        Else
        Begin
            RegistroNotasFiscaisSaidas01.Zera_Base_ICMS.Checked := False;
        End;

        If(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_total_nf_ipi.Text = 'S') Then
        Begin
            RegistroNotasFiscaisSaidas01.Total_NF_IPI.Checked := True;
        End
        Else
        Begin
            RegistroNotasFiscaisSaidas01.Total_NF_IPI.Checked := False;
        End;

        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_emite_lote.Text) = 'N' Then Begin
          RegistroNotasFiscaisSaidas01.Cliente_Emite_Lote.ItemIndex   := 0;
          End
        Else Begin
          RegistroNotasFiscaisSaidas01.Cliente_Emite_Lote.ItemIndex   := 1;
        End;

        RegistroNotasFiscaisSaidas01.Cliente_Aliquota_ICMS.Text   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_aliquota_icms.Text;

        If(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nao_possui_duplicatas.Text = 'S') Then
           Begin
           RegistroNotasFiscaisSaidas01.Opcao_Sem_Duplicata.Checked := True;
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas01.Opcao_Sem_Duplicata.Checked := False;
        End;

        //*** Obtem o Cliente ***

        ConexaoBD.SQL_Clientes.Close;
        ConexaoBD.SQL_Clientes.SQL.Clear;
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text) + #39 );
        ConexaoBD.SQL_Clientes.Open;

        //*** Endereço Normal ***

        RegistroNotasFiscaisSaidas01.Cliente_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Clientesfb_cliente_estado.Text);
        RegistroNotasFiscaisSaidas01.Cliente_Cep.Text              := conexaoBD.SQL_Clientesfb_cliente_cep.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Clientesfb_cliente_pais.Text);
        RegistroNotasFiscaisSaidas01.Cliente_Endereco.Text         := conexaoBD.SQL_Clientesfb_cliente_endereco.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Complemento.Text      := conexaoBD.SQL_Clientesfb_cliente_complemento.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Bairro.Text           := conexaoBD.SQL_Clientesfb_cliente_bairro.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Cidade.Text           := conexaoBD.SQL_Clientesfb_cliente_cidade.Text;

        //*** Endereço de Cobrança ***

        RegistroNotasFiscaisSaidas01.Cliente_Endereco_Cobranca.Text    := conexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Complemento_Cobranca.Text := conexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Bairro_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Cidade_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Estado_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Cep_Cobranca.Text         := conexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Pais_Cobranca.Text        := conexaoBD.SQL_Clientesfb_cliente_pais_cobranca.Text;

        //*** Continua Carregando os Dados ***

        RegistroNotasFiscaisSaidas01.Cliente_Contato.Text          := conexaoBD.SQL_Clientesfb_cliente_contato.Text;
        RegistroNotasFiscaisSaidas01.Cliente_DDD.Text              := conexaoBD.SQL_Clientesfb_cliente_ddd.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Fone_Ramal.Text       := conexaoBD.SQL_Clientesfb_cliente_fone_ramal.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Fone_Comercial.Text   := conexaoBD.SQL_Clientesfb_cliente_fone.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Fone_Residencial.Text := conexaoBD.SQL_Clientesfb_cliente_fone_residencial.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Fone_Celular.Text     := conexaoBD.SQL_Clientesfb_cliente_fone_celular.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Fone_Fax.Text         := conexaoBD.SQL_Clientesfb_cliente_fax.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Email.Text            := conexaoBD.SQL_Clientesfb_cliente_email.Text;

        //RegistroNotasFiscaisSaidas01.Nro_Pedido_Vendas.Text        := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nro_pedido.Text;

        RegistroNotasFiscaisSaidas01.Cliente_Tipo_Pessoa.Text           := conexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Inscricao_Estadual.Text    := conexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_tipo_transp.Text);
        RegistroNotasFiscaisSaidas01.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text));
        RegistroNotasFiscaisSaidas01.Codigo_Transportadora.Text         := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_transporta.Text;
        RegistroNotasFiscaisSaidas01.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_pgto_frete.Text));

        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper_nro.Text) <> '' Then
           Begin
           RegistroNotasFiscaisSaidas01.Nro_Natureza_Operacao.Text     := IntToStr(Obtem_Nro_Natureza_Operacao_N(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper_nro.Text)));
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas01.Nro_Natureza_Operacao.Text     := IntToStr(Obtem_Nro_Natureza_Operacao(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper_desc.Text),Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text)));
        End;

        RegistroNotasFiscaisSaidas01.Cliente_Suframa.Text               := conexaoBD.SQL_Clientesfb_cliente_suframa.Text;

        If Trim(conexaoBD.SQL_Clientesfb_cliente_consumo.Text) = 'S' Then
           Begin
           RegistroNotasFiscaisSaidas01.Nota_Consumo.Checked := True;
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas01.Nota_Consumo.Checked := False;
        End;

        RegistroNotasFiscaisSaidas01.Observacao_Nota.Lines.Clear;
        RegistroNotasFiscaisSaidas01.Observacao_Nota.Lines.Add(DBG_FB_Cliente_Observacao_Nota.Text);

        RegistroNotasFiscaisSaidas01.Cliente_Observacao.Lines.Clear;
        RegistroNotasFiscaisSaidas01.Cliente_Observacao.Lines.Add(DBG_FB_Cliente_Observacao.Text);

        RegistroNotasFiscaisSaidas01.Cliente_Desconto.Text             := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_desconto.Text;

        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_natureza_oper.Text) <> 'Entrada' Then
          Begin
          RegistroNotasFiscaisSaidas01.Tipo_Nota_Saida.Checked        := True;
          End
        Else
          Begin
          RegistroNotasFiscaisSaidas01.Tipo_Nota_Entrada.Checked      := True;
        End;

        RegistroNotasFiscaisSaidas01.Cliente_Ordem_Compra.Text         := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_ordem_compra.Text;

        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_1.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_1.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_2.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_2.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_3.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_3.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_4.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_4.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_4.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_5.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_5.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_5.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_5.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_6.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_6.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_6.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_6.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_7.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_7.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_7.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_7.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_8.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_8.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_8.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_8.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_9.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_9.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_9.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_9.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_10.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_10.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_10.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_10.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_11.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_11.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_11.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_11.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_12.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_12.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_12.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_12.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_13.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_13.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_13.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_13.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_14.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_14.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_14.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_14.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_15.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_15.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_15.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_15.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_16.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_16.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_16.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_16.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_17.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_17.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_17.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_17.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_18.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_18.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_18.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_18.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_19.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_19.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_19.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_19.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_20.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_20.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_20.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_20.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_21.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_21.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_21.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_21.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_22.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_22.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_22.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_22.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_23.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_23.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_23.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_23.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_24.Text     := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_24.Text;
        RegistroNotasFiscaisSaidas01.Cliente_Condicao_Pgto_Vlr_24.Text := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_24.Text;

        RegistroNotasFiscaisSaidas01.Nota_Base_ICMS.Text              := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfaturado_base_icms.Text))));
        RegistroNotasFiscaisSaidas01.Nota_Valor_ICMS.Text             := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_icms.Text))));
        RegistroNotasFiscaisSaidas01.Nota_Base_ICMS_Sub.Text          := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_base_icms_sub.Text))));
        RegistroNotasFiscaisSaidas01.Nota_Valor_ICMS_Sub.Text         := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_icms_sub.Text))));
        RegistroNotasFiscaisSaidas01.Nota_Valor_Produto.Text          := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text)) - StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))));
        RegistroNotasFiscaisSaidas01.Valor_Frete.Text                 := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_frete.Text))));
        RegistroNotasFiscaisSaidas01.Nota_Valor_Seguro.Text           := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_seguro.Text))));
        RegistroNotasFiscaisSaidas01.Nota_Outras_Despesas.Text        := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_outras_despesas.Text))));
        RegistroNotasFiscaisSaidas01.Valor_IPI.Text                   := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))));
        RegistroNotasFiscaisSaidas01.Valor_Total.Text                 := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text))));
        RegistroNotasFiscaisSaidas01.Qtde_Volume.Text                 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_volume.Text;

        RegistroNotasFiscaisSaidas01.Imprime_Nota_Apos.Checked := False;
        RegistroNotasFiscaisSaidas01.Programa_Anterior.Text    := 'Alteração-Exclusão';

        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text) = '0,00' Then
           Begin
           RegistroNotasFiscaisSaidas01.IPI_Zerado.Text := 'S';
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas01.IPI_Zerado.Text := 'N';
        End;

        //*********************************************
        //*** Coloca os Centavos nos Campos da Nota ***
        //*********************************************

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.Nota_Base_ICMS.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas01.Nota_Base_ICMS.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.Nota_Valor_ICMS.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas01.Nota_Valor_ICMS.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.Nota_Base_ICMS_Sub.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas01.Nota_Base_ICMS_Sub.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.Nota_Valor_ICMS_Sub.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas01.Nota_Valor_ICMS_Sub.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.Nota_Valor_Produto.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas01.Nota_Valor_Produto.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.Valor_Frete.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas01.Valor_Frete.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.Nota_Valor_Seguro.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas01.Nota_Valor_Seguro.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.Nota_Outras_Despesas.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas01.Nota_Outras_Despesas.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.Valor_IPI.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas01.Valor_IPI.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas01.Valor_Total.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas01.Valor_Total.Text := Ponto_Virgula(Vlr_Centavos_Str);

        RegistroNotasFiscaisSaidas01.Tipo_Nota_Emissao.Text := Tipo_Emissao_Nota.Text;

        Seta();

        RegistroNotasFiscaisSaidas01.Show;

        ConexaoBD.SQL_FB_Nota_Fiscal.Locate('fb_nota_fiscal_numero',Trim(Selecionado),[]);
      End;
    End;
end;

procedure TRegistroNotasFiscaisSaidas00.DBG_Notas_Saidas_MBCellClick(
  Column: TColumn);
var
    Comando_SQL: String;
    Erro: Integer;
    Vlr_Centavos_Nro: Real;
    Vlr_Centavos_Str: String;
    
begin
    If DBG_Notas_Saidas_MB.Fields[0].Text <> '' Then Begin
      Ampulheta();

      Selecionado := DBG_Notas_Saidas_MB.Fields[0].Text;

      If (RegistroNotasFiscaisSaidas02 = Nil) Then Begin
        Application.CreateForm(TRegistroNotasFiscaisSaidas02,RegistroNotasFiscaisSaidas02);
      End;

      Comando_SQL := 'Select * from mb_notas_fiscais Where mb_nota_fiscal_numero = ' + Trim(DBG_Notas_Saidas_MB.Fields[0].Text);

      ConexaoBD.SQL_MB_Nota_Fiscal.Close;
      ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Clear;
      ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_MB_Nota_Fiscal.Open;

      Seta();

      If ConexaoBD.SQL_MB_Nota_Fiscal.RecordCount > 0 Then Begin

        Ampulheta();

        RegistroNotasFiscaisSaidas02.BT_Incluir.Visible := False;
        RegistroNotasFiscaisSaidas02.BT_Alterar.Visible := True;
        RegistroNotasFiscaisSaidas02.BT_Excluir.Visible := True;

        RegistroNotasFiscaisSaidas02.Cliente_Codigo_Tipo.Text          := 'CNPJ';
        RegistroNotasFiscaisSaidas02.Cliente_Codigo.Text               := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_codigo.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Nome.Text                 := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_nome.Text;

        RegistroNotasFiscaisSaidas02.Nota_Numero.Text                  := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_numero.Text;
        RegistroNotasFiscaisSaidas02.Nota_Emissao.Text                 := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_data_emissao.Text;
        RegistroNotasFiscaisSaidas02.Cliente_CFOP.Text                 := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_cfop.Text;

        If Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_natureza_oper_nro.Text) <> '' Then
           Begin
           RegistroNotasFiscaisSaidas02.Nro_Natureza_Operacao.Text     := IntToStr(Obtem_Nro_Natureza_Operacao_N(Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_natureza_oper_nro.Text)));
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas02.Nro_Natureza_Operacao.Text     := IntToStr(Obtem_Nro_Natureza_Operacao(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_natureza_oper_desc.Text,ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_cfop.Text));
        End;

        RegistroNotasFiscaisSaidas02.Cliente_Natureza_Operacao.Text    := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_natureza_oper_desc.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Tipo_Transporte.ItemIndex := Obtem_Nro_Tipo_Transporte(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_tipo_transp.Text);
        RegistroNotasFiscaisSaidas02.Cliente_Pgto_Frete.ItemIndex      := Obtem_Nro_Pgto_Frete(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_pgto_frete.Text);
        RegistroNotasFiscaisSaidas02.Nro_Transportadora.Text           := IntToStr(Obtem_Nro_Transportadora(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_transporta.Text));

        RegistroNotasFiscaisSaidas02.Cliente_Base_Reduzida.Text        := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_icms_reduzida.Text;

        RegistroNotasFiscaisSaidas02.Especie.Text                      := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_especie.Text;
        RegistroNotasFiscaisSaidas02.Marca.Text                        := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_marca.Text;
        RegistroNotasFiscaisSaidas02.Peso_Bruto.Text                   := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_peso_bruto.Text;
        RegistroNotasFiscaisSaidas02.Peso_Liquido.Text                 := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_peso_liquido.Text;

        If(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_tipo_nota.Text = 'S') Then
        Begin
            RegistroNotasFiscaisSaidas02.Tipo_Nota_Saida.Checked := True;
        End
        Else
        Begin
            RegistroNotasFiscaisSaidas02.Tipo_Nota_Entrada.Checked := True;
        End;

        If(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_consumo.Text = 'S') Then
        Begin
            RegistroNotasFiscaisSaidas02.Nota_Consumo.Checked := True;
        End
        Else
        Begin
            RegistroNotasFiscaisSaidas02.Nota_Consumo.Checked := False;
        End;

        If(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_zerar_icms.Text = 'S') Then
        Begin
            RegistroNotasFiscaisSaidas02.Zera_Base_ICMS.Checked := True;
        End
        Else
        Begin
            RegistroNotasFiscaisSaidas02.Zera_Base_ICMS.Checked := False;
        End;

        If(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_total_nf_ipi.Text = 'S') Then
        Begin
            RegistroNotasFiscaisSaidas02.Total_NF_IPI.Checked := True;
        End
        Else
        Begin
            RegistroNotasFiscaisSaidas02.Total_NF_IPI.Checked := False;
        End;

        If Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_emite_lote.Text) = 'N' Then Begin
          RegistroNotasFiscaisSaidas02.Cliente_Emite_Lote.ItemIndex   := 0;
          End
        Else Begin
          RegistroNotasFiscaisSaidas02.Cliente_Emite_Lote.ItemIndex   := 1;
        End;

        RegistroNotasFiscaisSaidas02.Cliente_Aliquota_ICMS.Text   := conexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_aliquota_icms.Text;

        If(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_nao_possui_duplicatas.Text = 'S') Then
           Begin
           RegistroNotasFiscaisSaidas02.Opcao_Sem_Duplicata.Checked := True;
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas02.Opcao_Sem_Duplicata.Checked := False;
        End;

        //*** Obtem o Cliente ***

        ConexaoBD.SQL_Clientes.Close;
        ConexaoBD.SQL_Clientes.SQL.Clear;
        ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' + #39 + Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_codigo.Text) + #39 );
        ConexaoBD.SQL_Clientes.Open;

        //*** Endereço Normal ***

        RegistroNotasFiscaisSaidas02.Cliente_Estado.ItemIndex      := Obtem_Nro_Estado(conexaoBD.SQL_Clientesfb_cliente_estado.Text);
        RegistroNotasFiscaisSaidas02.Cliente_Cep.Text              := conexaoBD.SQL_Clientesfb_cliente_cep.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Pais.ItemIndex        := Obtem_Nro_Pais(conexaoBD.SQL_Clientesfb_cliente_pais.Text);
        RegistroNotasFiscaisSaidas02.Cliente_Endereco.Text         := conexaoBD.SQL_Clientesfb_cliente_endereco.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Complemento.Text      := conexaoBD.SQL_Clientesfb_cliente_complemento.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Bairro.Text           := conexaoBD.SQL_Clientesfb_cliente_bairro.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Cidade.Text           := conexaoBD.SQL_Clientesfb_cliente_cidade.Text;

        //*** Endereço de Cobrança ***

        RegistroNotasFiscaisSaidas02.Cliente_Endereco_Cobranca.Text    := conexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Complemento_Cobranca.Text := conexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Bairro_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Cidade_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Estado_Cobranca.Text      := conexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Cep_Cobranca.Text         := conexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Pais_Cobranca.Text        := conexaoBD.SQL_Clientesfb_cliente_pais_cobranca.Text;

        //*** Continua Carregando os Dados ***

        RegistroNotasFiscaisSaidas02.Cliente_Contato.Text          := conexaoBD.SQL_Clientesfb_cliente_contato.Text;
        RegistroNotasFiscaisSaidas02.Cliente_DDD.Text              := conexaoBD.SQL_Clientesfb_cliente_ddd.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Fone_Ramal.Text       := conexaoBD.SQL_Clientesfb_cliente_fone_ramal.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Fone_Comercial.Text   := conexaoBD.SQL_Clientesfb_cliente_fone.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Fone_Residencial.Text := conexaoBD.SQL_Clientesfb_cliente_fone_residencial.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Fone_Celular.Text     := conexaoBD.SQL_Clientesfb_cliente_fone_celular.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Fone_Fax.Text         := conexaoBD.SQL_Clientesfb_cliente_fax.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Email.Text            := conexaoBD.SQL_Clientesfb_cliente_email.Text;

        //RegistroNotasFiscaisSaidas02.Nro_Pedido_Vendas.Text        := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_nro_pedido.Text;

        RegistroNotasFiscaisSaidas02.Cliente_Tipo_Pessoa.Text           := conexaoBD.SQL_Clientesfb_cliente_tipo_pessoa.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Inscricao_Estadual.Text    := conexaoBD.SQL_Clientesfb_cliente_inscricao_estadual.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Tipo_Transporte.ItemIndex  := Obtem_Nro_Tipo_Transporte(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_tipo_transp.Text);
        RegistroNotasFiscaisSaidas02.Nro_Transportadora.Text            := IntToStr(Obtem_Nro_Transportadora(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_transporta.Text));
        RegistroNotasFiscaisSaidas02.Codigo_Transportadora.Text         := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_transporta.Text;
        RegistroNotasFiscaisSaidas02.Nro_Pgto_Frete.Text                := IntToStr(Obtem_Nro_Pgto_Frete(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_pgto_frete.Text));

        If Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_natureza_oper_nro.Text) <> '' Then
           Begin
           RegistroNotasFiscaisSaidas02.Nro_Natureza_Operacao.Text     := IntToStr(Obtem_Nro_Natureza_Operacao_N(Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_natureza_oper_nro.Text)));
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas02.Nro_Natureza_Operacao.Text     := IntToStr(Obtem_Nro_Natureza_Operacao(Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_natureza_oper_desc.Text),Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_cfop.Text)));
        End;

        RegistroNotasFiscaisSaidas02.Cliente_Suframa.Text               := conexaoBD.SQL_Clientesfb_cliente_suframa.Text;

        If Trim(conexaoBD.SQL_Clientesfb_cliente_consumo.Text) = 'S' Then
           Begin
           RegistroNotasFiscaisSaidas02.Nota_Consumo.Checked := True;
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas02.Nota_Consumo.Checked := False;
        End;

        RegistroNotasFiscaisSaidas02.Observacao_Nota.Lines.Clear;
        RegistroNotasFiscaisSaidas02.Observacao_Nota.Lines.Add(DBG_MB_Cliente_Observacao_Nota.Text);

        RegistroNotasFiscaisSaidas02.Cliente_Observacao.Lines.Clear;
        RegistroNotasFiscaisSaidas02.Cliente_Observacao.Lines.Add(DBG_MB_Cliente_Observacao.Text);

        RegistroNotasFiscaisSaidas02.Cliente_Desconto.Text             := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_desconto.Text;

        If Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_natureza_oper.Text) <> 'Entrada' Then
          Begin
          RegistroNotasFiscaisSaidas02.Tipo_Nota_Saida.Checked        := True;
          End
        Else
          Begin
          RegistroNotasFiscaisSaidas02.Tipo_Nota_Entrada.Checked      := True;
        End;

        RegistroNotasFiscaisSaidas02.Cliente_Ordem_Compra.Text         := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_ordem_compra.Text;

        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_1.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_1.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_1.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_1.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_2.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_2.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_2.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_2.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_3.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_3.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_3.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_3.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_4.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_4.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_4.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_4.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_5.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_5.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_5.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_5.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_6.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_6.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_6.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_6.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_7.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_7.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_7.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_7.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_8.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_8.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_8.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_8.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_9.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_9.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_9.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_9.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_10.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_10.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_10.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_10.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_11.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_11.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_11.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_11.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_12.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_12.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_12.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_12.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_13.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_13.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_13.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_13.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_14.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_14.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_14.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_14.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_15.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_15.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_15.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_15.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_16.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_16.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_16.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_16.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_17.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_17.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_17.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_17.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_18.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_18.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_18.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_18.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_19.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_19.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_19.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_19.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_20.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_20.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_20.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_20.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_21.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_21.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_21.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_21.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_22.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_22.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_22.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_22.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_23.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_23.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_23.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_23.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_24.Text     := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_dt_vcto_24.Text;
        RegistroNotasFiscaisSaidas02.Cliente_Condicao_Pgto_Vlr_24.Text := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_dup_vlr_24.Text;

        RegistroNotasFiscaisSaidas02.Nota_Base_ICMS.Text              := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_MB_Nota_Fiscalfaturado_base_icms.Text))));
        RegistroNotasFiscaisSaidas02.Nota_Valor_ICMS.Text             := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_icms.Text))));
        RegistroNotasFiscaisSaidas02.Nota_Base_ICMS_Sub.Text          := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_base_icms_sub.Text))));
        RegistroNotasFiscaisSaidas02.Nota_Valor_ICMS_Sub.Text         := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_icms_sub.Text))));
        RegistroNotasFiscaisSaidas02.Nota_Valor_Produto.Text          := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text)) - StrToFloat(Ponto_Virgula(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_ipi.Text))));
        RegistroNotasFiscaisSaidas02.Valor_Frete.Text                 := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_frete.Text))));
        RegistroNotasFiscaisSaidas02.Nota_Valor_Seguro.Text           := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_seguro.Text))));
        RegistroNotasFiscaisSaidas02.Nota_Outras_Despesas.Text        := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_outras_despesas.Text))));
        RegistroNotasFiscaisSaidas02.Valor_IPI.Text                   := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_ipi.Text))));
        RegistroNotasFiscaisSaidas02.Valor_Total.Text                 := Trim(FloatToStr(StrToFloat(Ponto_Virgula(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text))));
        RegistroNotasFiscaisSaidas02.Qtde_Volume.Text                 := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_volume.Text;

        RegistroNotasFiscaisSaidas02.Imprime_Nota_Apos.Checked := False;
        RegistroNotasFiscaisSaidas02.Programa_Anterior.Text    := 'Alteração-Exclusão';

        If Trim(ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_ipi.Text) = '0,00' Then
           Begin
           RegistroNotasFiscaisSaidas02.IPI_Zerado.Text := 'S';
           End
        Else
           Begin
           RegistroNotasFiscaisSaidas02.IPI_Zerado.Text := 'N';
        End;

        //*********************************************
        //*** Coloca os Centavos nos Campos da Nota ***
        //*********************************************

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.Nota_Base_ICMS.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas02.Nota_Base_ICMS.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.Nota_Valor_ICMS.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas02.Nota_Valor_ICMS.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.Nota_Base_ICMS_Sub.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas02.Nota_Base_ICMS_Sub.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.Nota_Valor_ICMS_Sub.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas02.Nota_Valor_ICMS_Sub.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.Nota_Valor_Produto.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas02.Nota_Valor_Produto.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.Valor_Frete.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas02.Valor_Frete.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.Nota_Valor_Seguro.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas02.Nota_Valor_Seguro.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.Nota_Outras_Despesas.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas02.Nota_Outras_Despesas.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.Valor_IPI.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas02.Valor_IPI.Text := Ponto_Virgula(Vlr_Centavos_Str);

        Vlr_Centavos_Str := Trim(Virgula_Ponto(RegistroNotasFiscaisSaidas02.Valor_Total.Text));
        Val(Vlr_Centavos_Str,Vlr_Centavos_Nro,Erro);
        Str(Vlr_Centavos_Nro:13:2,Vlr_Centavos_Str);
        RegistroNotasFiscaisSaidas02.Valor_Total.Text := Ponto_Virgula(Vlr_Centavos_Str);

        RegistroNotasFiscaisSaidas02.Tipo_Nota_Emissao.Text := Tipo_Emissao_Nota.Text;

        Seta();

        RegistroNotasFiscaisSaidas02.Show;

        ConexaoBD.SQL_MB_Nota_Fiscal.Locate('mb_nota_fiscal_numero',Trim(Selecionado),[]);
      End;
    End;
end;

procedure TRegistroNotasFiscaisSaidas00.Nome_ClienteKeyPress(
  Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
