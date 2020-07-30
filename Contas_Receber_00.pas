unit Contas_Receber_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TContasReceber00 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Data_Inicial: TMaskEdit;
    Data_Final: TMaskEdit;
    Panel2: TPanel;
    BT_Imprimir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Opc_Data_Emissao: TRadioButton;
    Opc_Data_Vencto: TRadioButton;
    Opc_Em_Aberto: TRadioButton;
    Panel5: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Dados_Procura: TEdit;
    Opcoes_Procura: TComboBox;
    BT_Procurar: TBitBtn;
    BT_Procura_Cliente: TBitBtn;
    Dados_Cliente: TGroupBox;
    LBL_Endereco_1: TLabel;
    LBL_Endereco_2: TLabel;
    LBL_Endereco_3: TLabel;
    Label2: TLabel;
    Numero_Docto: TEdit;
    Cliente_Codigo: TEdit;
    Acc_Empresa: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_Procura_ClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure Opc_Data_EmissaoKeyPress(Sender: TObject; var Key: Char);
    procedure Opc_Data_VenctoKeyPress(Sender: TObject; var Key: Char);
    procedure Opc_Em_AbertoKeyPress(Sender: TObject; var Key: Char);
    procedure Numero_DoctoKeyPress(Sender: TObject; var Key: Char);
    procedure Dados_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Opcoes_ProcuraKeyPress(Sender: TObject; var Key: Char);
    procedure Data_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Data_FinalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContasReceber00: TContasReceber00;

implementation

uses Conexao_BD, Rotinas_Gerais, Clientes_00, Contas_Receber_01;

{$R *.dfm}

procedure TContasReceber00.BT_SairClick(Sender: TObject);
begin
     ContasReceber00.Close;
end;

procedure TContasReceber00.BT_ProcurarClick(Sender: TObject);

var
   Codigo_Cliente, Endereco_1, Endereco_2, Endereco_3: String;

begin
    If Trim(Opcoes_Procura.Text) = 'Código' Then
      Begin
      ConexaoBD.SQL_Clientes.Close;
      ConexaoBD.SQL_Clientes.SQL.Clear;
      ConexaoBD.SQL_Clientes.SQL.Add('Select * from fb_clientes Where fb_cliente_codigo = ' +#39+ Trim(Dados_Procura.Text) +#39 );
      ConexaoBD.SQL_Clientes.Open;

      If conexaoBD.SQL_Clientes.RecordCount > 0 Then
        Begin
        Endereco_1 := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_razao_social.Text));
        Endereco_1 := Endereco_1 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo_tipo.Text)) + ': ';
        Endereco_1 := Endereco_1 + Trim(ConexaoBD.SQL_Clientesfb_cliente_codigo.Text);

        Endereco_2 := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_endereco_cobranca.Text));

        If Trim(ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text) <> '' Then
          Begin
          Endereco_2 := Endereco_2 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_complemento_cobranca.Text));
        End;

        Endereco_2 := Endereco_2 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_bairro_cobranca.Text));

        Endereco_3 := UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_cidade_cobranca.Text));
        Endereco_3 := Endereco_3 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_estado_cobranca.Text));
        Endereco_3 := Endereco_3 + ' - CEP:' + Trim(ConexaoBD.SQL_Clientesfb_cliente_cep_cobranca.Text);
        Endereco_3 := Endereco_3 + ' - ' + UpperCase(Trim(ConexaoBD.SQL_Clientesfb_cliente_pais_cobranca.Text));

        Endereco_1 := Letra_Maiuscula(Endereco_1);
        Endereco_2 := Letra_Maiuscula(Endereco_2);
        Endereco_3 := Letra_Maiuscula(Endereco_3);

        LBL_Endereco_1.Caption := Endereco_1;
        LBL_Endereco_2.Caption := Endereco_2;
        LBL_Endereco_3.Caption := Endereco_3;

        Cliente_Codigo.Text := Trim(Dados_Procura.Text);

        End
      Else
        Begin
        MSG_Erro('Código do Cliente não existe');
        Dados_Procura.SetFocus;
      End;
    End;
end;

procedure TContasReceber00.BT_Procura_ClienteClick(Sender: TObject);
begin
     ContasReceber00.Visible := False;

     Ampulheta();

     If (Clientes00 = Nil) Then
        Begin
        Application.CreateForm(TClientes00,Clientes00);
        Clientes00.Programa_Anterior.Text := 'ContasReceber';
     End;

     Seta();

     Clientes00.ShowModal;

     ContasReceber00.Visible := True;

     If Trim(Dados_Procura.Text) <> '' Then
        Begin
        BT_Procurar.Click;
     End;
end;

procedure TContasReceber00.FormShow(Sender: TObject);
begin
     Data_Inicial.SetFocus;
end;

procedure TContasReceber00.BT_ImprimirClick(Sender: TObject);

var
   Comando_SQL, Comando_SQL_2, MSG_Rel, Nome_Tabela, Banco, DT_Vcto_1, DT_Vcto_2, DT_Vcto_3, DT_Vcto_4: String;

begin
     Ampulheta();

     Comando_SQL_2 := '';

     If Trim(Acc_Empresa.Text) = 'Monibras' Then
        Begin

         If Trim(Numero_Docto.Text) <> '' Then
            Begin
            Comando_SQL_2 := 'Select * from mb_notas_fiscais Where mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
            Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_numero = ' + Trim(Numero_Docto.Text) + ') Or ';
            Comando_SQL_2 := Comando_SQL_2 + '(mb_nota_fiscal_dup_nro_1 = ' +#39+ Trim(Numero_Docto.Text) +#39+ ') Or ';
            Comando_SQL_2 := Comando_SQL_2 + '(mb_nota_fiscal_dup_nro_2 = ' +#39+ Trim(Numero_Docto.Text) +#39+ ') Or ';
            Comando_SQL_2 := Comando_SQL_2 + '(mb_nota_fiscal_dup_nro_3 = ' +#39+ Trim(Numero_Docto.Text) +#39+ ') Or ';
            Comando_SQL_2 := Comando_SQL_2 + '(mb_nota_fiscal_dup_nro_4 = ' +#39+ Trim(Numero_Docto.Text) +#39+ ')) ';
            Comando_SQL_2 := Comando_SQL_2 + ' Order By mb_nota_fiscal_numero';
            MSG_Rel       := '--- Por Número de Documento: ' + Trim(Numero_Docto.Text) + ' ---';
            End
         Else If Opc_Data_Emissao.Checked Then
            Begin

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

               If (Trim(Cliente_Codigo.Text) <> '') And (Trim(Cliente_Codigo.Text) <> '0') Then
                  Begin

                  Comando_SQL_2 := 'Select * from mb_notas_fiscais Where mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) ';
                  Comando_SQL_2 := Comando_SQL_2 + 'And (mb_nota_fiscal_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39+ ') ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By mb_nota_fiscal_numero';
                  MSG_Rel       := '--- Por Data de Emissão - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' e Por Cliente ---';

                  End
               Else
                  Begin

                  Comando_SQL_2 := 'Select * from mb_notas_fiscais Where mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By mb_nota_fiscal_numero';
                  MSG_Rel       := '--- Por Data de Emissão - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' ---';

               End;

            End;

            End
         Else If Opc_Data_Vencto.Checked Then
            Begin

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

               If (Trim(Cliente_Codigo.Text) <> '') And (Trim(Cliente_Codigo.Text) <> '0') Then
                  Begin

                  Comando_SQL_2 := 'Select * from mb_notas_fiscais Where mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((mb_nota_fiscal_dup_dt_vcto_1 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_1 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_2 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_2 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_3 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_3 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_4 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_4 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+'))) ';
                  Comando_SQL_2 := Comando_SQL_2 + 'And (mb_nota_fiscal_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39+ ') ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By mb_nota_fiscal_numero';
                  MSG_Rel       := '--- Por Data de Vencimento - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' e Por Cliente ---';

                  End
               Else
                  Begin

                  Comando_SQL_2 := 'Select * from mb_notas_fiscais Where mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((mb_nota_fiscal_dup_dt_vcto_1 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_1 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_2 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_2 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_3 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_3 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_4 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_4 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+'))) ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By mb_nota_fiscal_numero';
                  MSG_Rel       := '--- Por Data de Vencimento - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' ---';

               End;

            End;

            End
         Else If Opc_Em_Aberto.Checked Then
            Begin

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

               If (Trim(Cliente_Codigo.Text) <> '') And (Trim(Cliente_Codigo.Text) <> '0') Then
                  Begin

                  Comando_SQL_2 := 'Select * from mb_notas_fiscais Where mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((mb_nota_fiscal_dup_dt_vcto_1 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_1 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_2 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_2 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_3 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_3 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_4 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_4 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+'))) And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((mb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0000-00-00'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_1 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0000-00-00'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_2 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0000-00-00'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_3 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_pgto_4 = '+#39+'0000-00-00'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_4 = '+#39+'0'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_4 = '+#39+#39+'))) ';
                  Comando_SQL_2 := Comando_SQL_2 + 'And (mb_nota_fiscal_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39+ ') ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By mb_nota_fiscal_numero';
                  MSG_Rel       := '--- Em Aberto - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' e Por Cliente ---';

                  End
               Else
                  Begin

                  Comando_SQL_2 := 'Select * from mb_notas_fiscais Where mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((mb_nota_fiscal_dup_dt_vcto_1 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_1 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_2 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_2 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_3 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_3 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_vcto_4 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (mb_nota_fiscal_dup_dt_vcto_4 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+'))) And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((mb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0000-00-00'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_1 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0000-00-00'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_2 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0000-00-00'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_3 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((mb_nota_fiscal_dup_dt_pgto_4 = '+#39+'0000-00-00'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_4 = '+#39+'0'+#39+') Or (mb_nota_fiscal_dup_dt_pgto_4 = '+#39+#39+'))) ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By mb_nota_fiscal_numero';
                  MSG_Rel       := '--- Em Aberto - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' ---';

               End;

            End;

         End;

         If Trim(Comando_SQL_2) <> '' Then
            Begin
            //*** Prepara a Criação de Tabela Temporária ***

            Nome_Tabela := 'swap_cobrancas_fb_'+Trim(Numero_HD('C'));

            //*** Apaga a Tabela Temporária ***

            Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

            ConexaoBD.SQL_Comunitario.Close;
            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            //*** Cria a Tabela Temporária ***

            Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela + ' (';
            Comando_SQL := Comando_SQL + 'swap_cobranca_nro int(11) NOT NULL auto_increment, ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_codigo varchar(80) default '+#39+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_nome varchar(100) default '+#39+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_data_emissao date default '+#39+'0000-00-00'+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_nro varchar(7) default '+#39+'0'+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_vcto date default '+#39+'0000-00-00'+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_vlr double(13,2) default '+#39+'0.00'+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_cod_bco varchar(20) default '+#39+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_pgto date default '+#39+'0000-00-00'+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_obs varchar(255) default '+#39+#39+', ';
            Comando_SQL := Comando_SQL + 'PRIMARY KEY  (swap_cobranca_nro)';
            Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

            ConexaoBD.SQL_Comunitario.Close;
            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            //*** Carrega a Tabela Temporária ***

            ConexaoBD.SQL_mb_nota_Fiscal.Close;
            ConexaoBD.SQL_mb_nota_Fiscal.SQL.Clear;
            ConexaoBD.SQL_mb_nota_Fiscal.SQL.Add(Comando_SQL_2);
            ConexaoBD.SQL_mb_nota_Fiscal.Open;

            If ConexaoBD.SQL_mb_nota_Fiscal.RecordCount > 0 Then
               Begin

               While Not ConexaoBD.SQL_mb_nota_Fiscal.Eof Do
                     Begin

                     ConexaoBD.SQL_Bancos.Close;
                     ConexaoBD.SQL_Bancos.SQL.Clear;
                     ConexaoBD.SQL_Bancos.SQL.Add('Select * From fb_bancos Where fb_banco_codigo = ' + Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_banco.Text) );
                     ConexaoBD.SQL_Bancos.Open;

                     If ConexaoBD.SQL_Bancos.RecordCount > 0 Then
                        Begin
                        Banco := ConexaoBD.SQL_Bancosfb_banco_descricao.Text;
                        End
                     Else
                        Begin
                        Banco := '';
                     End;

                     DT_Vcto_1 := ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_1.Text;
                     DT_Vcto_2 := ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_2.Text;
                     DT_Vcto_3 := ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_3.Text;
                     DT_Vcto_4 := ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_4.Text;

                     If ( Trim(DT_Vcto_1) <> '' ) Then
                        Begin
                        Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_codigo, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_nome, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_data_emissao, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_nro, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_vcto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_vlr, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_cod_bco, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_pgto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_obs) ';

                        Comando_SQL := Comando_SQL + ' Values(';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_codigo.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_nome.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_data_emissao.Text),'amd','-') + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_nro_1.Text + #39 + ', ';

                        If Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_1.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_1.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_vlr_1.Text) + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Trim(Banco) + #39 + ',';

                        If Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_pgto_1.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_pgto_1.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_obs_1.Text + #39 + ')';

                        ConexaoBD.SQL_Comunitario.Close;
                        ConexaoBD.SQL_Comunitario.SQL.Clear;
                        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Comunitario.ExecSQL;
                     End;

                     If ( Trim(DT_Vcto_2) <> '' ) Then
                        Begin
                        Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_codigo, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_nome, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_data_emissao, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_nro, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_vcto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_vlr, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_cod_bco, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_pgto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_obs) ';

                        Comando_SQL := Comando_SQL + ' Values(';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_codigo.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_nome.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_data_emissao.Text),'amd','-') + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_nro_2.Text + #39 + ', ';

                        If Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_2.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_2.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_vlr_2.Text) + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Trim(Banco) + #39 + ',';

                        If Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_pgto_2.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_pgto_2.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_obs_2.Text + #39 + ')';

                        ConexaoBD.SQL_Comunitario.Close;
                        ConexaoBD.SQL_Comunitario.SQL.Clear;
                        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Comunitario.ExecSQL;
                     End;

                     If ( Trim(DT_Vcto_3) <> '' ) Then
                        Begin
                        Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_codigo, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_nome, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_data_emissao, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_nro, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_vcto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_vlr, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_cod_bco, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_pgto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_obs) ';

                        Comando_SQL := Comando_SQL + ' Values(';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_codigo.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_nome.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_data_emissao.Text),'amd','-') + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_nro_3.Text + #39 + ', ';

                        If Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_3.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_3.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_vlr_3.Text) + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Trim(Banco) + #39 + ',';

                        If Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_pgto_3.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_pgto_3.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_obs_3.Text + #39 + ')';

                        ConexaoBD.SQL_Comunitario.Close;
                        ConexaoBD.SQL_Comunitario.SQL.Clear;
                        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Comunitario.ExecSQL;
                     End;

                     If ( Trim(DT_Vcto_4) <> '' ) Then
                        Begin
                        Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_codigo, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_nome, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_data_emissao, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_nro, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_vcto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_vlr, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_cod_bco, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_pgto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_obs) ';

                        Comando_SQL := Comando_SQL + ' Values(';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_codigo.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_nome.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_data_emissao.Text),'amd','-') + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_nro_4.Text + #39 + ', ';

                        If Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_4.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_vcto_4.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_vlr_4.Text) + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Trim(Banco) + #39 + ',';

                        If Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_pgto_4.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_dt_pgto_4.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_mb_nota_Fiscalmb_nota_fiscal_dup_obs_4.Text + #39 + ')';

                        ConexaoBD.SQL_Comunitario.Close;
                        ConexaoBD.SQL_Comunitario.SQL.Clear;
                        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Comunitario.ExecSQL;
                     End;

                     ConexaoBD.SQL_mb_nota_Fiscal.Next;
               End;
            End;

            //*** Seleciona os Registros da Tabela Temporária ***

            If Opc_Data_Emissao.Checked Then
               Begin
               Comando_SQL := 'Select * from ' + Nome_Tabela + ' Where ';
               Comando_SQL := Comando_SQL + '((swap_cobranca_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (swap_cobranca_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) ';
               Comando_SQL := Comando_SQL + ' Order By swap_cobranca_dup_nro';
               End
            Else If Opc_Data_Vencto.Checked Then
               Begin
               Comando_SQL := 'Select * from ' + Nome_Tabela + ' Where ';
               Comando_SQL := Comando_SQL + '((swap_cobranca_dup_dt_vcto >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (swap_cobranca_dup_dt_vcto <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) ';
               Comando_SQL := Comando_SQL + ' Order By swap_cobranca_dup_nro';
               End
            Else If Opc_Em_Aberto.Checked Then
               Begin
               Comando_SQL := 'Select * from ' + Nome_Tabela + ' Where ';
               Comando_SQL := Comando_SQL + '((swap_cobranca_dup_dt_vcto >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (swap_cobranca_dup_dt_vcto <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) And ';
               Comando_SQL := Comando_SQL + '((swap_cobranca_dup_dt_pgto = '+#39+'0000-00-00'+#39+') Or (swap_cobranca_dup_dt_pgto = '+#39+'0'+#39+') Or (swap_cobranca_dup_dt_pgto = '+#39+#39+')) ';
               Comando_SQL := Comando_SQL + ' Order By swap_cobranca_dup_nro';
               End
            Else
               Begin
               Comando_SQL := 'Select * from ' + Nome_Tabela + ' Order By swap_cobranca_dup_nro';
            End;

            ConexaoBD.SQL_Swap_Cobrancas.Close;
            ConexaoBD.SQL_Swap_Cobrancas.SQL.Clear;
            ConexaoBD.SQL_Swap_Cobrancas.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Swap_Cobrancas.Open;

            Seta();

            Application.CreateForm(TContasReceber01,ContasReceber01);

            ContasReceber01.QR_Periodo.Caption := MSG_Rel;

            ContasReceber01.QR_Cobranca.Preview;
            ContasReceber01.Destroy;

            //*** Apaga a Tabela Temporária ***

            Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

            ConexaoBD.SQL_Comunitario.Close;
            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            Cliente_Codigo.Text    := '0';
            LBL_Endereco_1.Caption := '';
            LBL_Endereco_2.Caption := '';
            LBL_Endereco_3.Caption := '';
            Dados_Procura.Text     := '';

         End;


        End
     Else
        Begin

         If Trim(Numero_Docto.Text) <> '' Then
            Begin
            Comando_SQL_2 := 'Select * from fb_notas_fiscais Where fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
            Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_numero = ' + Trim(Numero_Docto.Text) + ') Or ';
            Comando_SQL_2 := Comando_SQL_2 + '(fb_nota_fiscal_dup_nro_1 = ' +#39+ Trim(Numero_Docto.Text) +#39+ ') Or ';
            Comando_SQL_2 := Comando_SQL_2 + '(fb_nota_fiscal_dup_nro_2 = ' +#39+ Trim(Numero_Docto.Text) +#39+ ') Or ';
            Comando_SQL_2 := Comando_SQL_2 + '(fb_nota_fiscal_dup_nro_3 = ' +#39+ Trim(Numero_Docto.Text) +#39+ ') Or ';
            Comando_SQL_2 := Comando_SQL_2 + '(fb_nota_fiscal_dup_nro_4 = ' +#39+ Trim(Numero_Docto.Text) +#39+ ')) ';
            Comando_SQL_2 := Comando_SQL_2 + ' Order By fb_nota_fiscal_numero';
            MSG_Rel       := '--- Por Número de Documento: ' + Trim(Numero_Docto.Text) + ' ---';
            End
         Else If Opc_Data_Emissao.Checked Then
            Begin

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

               If (Trim(Cliente_Codigo.Text) <> '') And (Trim(Cliente_Codigo.Text) <> '0') Then
                  Begin

                  Comando_SQL_2 := 'Select * from fb_notas_fiscais Where fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) ';
                  Comando_SQL_2 := Comando_SQL_2 + 'And (fb_nota_fiscal_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39+ ') ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By fb_nota_fiscal_numero';
                  MSG_Rel       := '--- Por Data de Emissão - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' e Por Cliente ---';

                  End
               Else
                  Begin

                  Comando_SQL_2 := 'Select * from fb_notas_fiscais Where fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By fb_nota_fiscal_numero';
                  MSG_Rel       := '--- Por Data de Emissão - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' ---';

               End;

            End;

            End
         Else If Opc_Data_Vencto.Checked Then
            Begin

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

               If (Trim(Cliente_Codigo.Text) <> '') And (Trim(Cliente_Codigo.Text) <> '0') Then
                  Begin

                  Comando_SQL_2 := 'Select * from fb_notas_fiscais Where fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((fb_nota_fiscal_dup_dt_vcto_1 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_2 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_3 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_4 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_4 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+'))) ';
                  Comando_SQL_2 := Comando_SQL_2 + 'And (fb_nota_fiscal_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39+ ') ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By fb_nota_fiscal_numero';
                  MSG_Rel       := '--- Por Data de Vencimento - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' e Por Cliente ---';

                  End
               Else
                  Begin

                  Comando_SQL_2 := 'Select * from fb_notas_fiscais Where fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((fb_nota_fiscal_dup_dt_vcto_1 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_2 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_3 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_4 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_4 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+'))) ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By fb_nota_fiscal_numero';
                  MSG_Rel       := '--- Por Data de Vencimento - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' ---';

               End;

            End;

            End
         Else If Opc_Em_Aberto.Checked Then
            Begin

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

               If (Trim(Cliente_Codigo.Text) <> '') And (Trim(Cliente_Codigo.Text) <> '0') Then
                  Begin

                  Comando_SQL_2 := 'Select * from fb_notas_fiscais Where fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((fb_nota_fiscal_dup_dt_vcto_1 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_2 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_3 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_4 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_4 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+'))) And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((fb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0000-00-00'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_1 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0000-00-00'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_2 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0000-00-00'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_3 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_pgto_4 = '+#39+'0000-00-00'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_4 = '+#39+'0'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_4 = '+#39+#39+'))) ';
                  Comando_SQL_2 := Comando_SQL_2 + 'And (fb_nota_fiscal_codigo = ' +#39+ Trim(Cliente_Codigo.Text) +#39+ ') ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By fb_nota_fiscal_numero';
                  MSG_Rel       := '--- Em Aberto - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' e Por Cliente ---';

                  End
               Else
                  Begin

                  Comando_SQL_2 := 'Select * from fb_notas_fiscais Where fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((fb_nota_fiscal_dup_dt_vcto_1 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_1 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_2 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_2 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_3 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_3 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_vcto_4 >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (fb_nota_fiscal_dup_dt_vcto_4 <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+'))) And ';
                  Comando_SQL_2 := Comando_SQL_2 + '(((fb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0000-00-00'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_1 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0000-00-00'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_2 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0000-00-00'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_3 = '+#39+#39+')) Or ';
                  Comando_SQL_2 := Comando_SQL_2 + '((fb_nota_fiscal_dup_dt_pgto_4 = '+#39+'0000-00-00'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_4 = '+#39+'0'+#39+') Or (fb_nota_fiscal_dup_dt_pgto_4 = '+#39+#39+'))) ';
                  Comando_SQL_2 := Comando_SQL_2 + ' Order By fb_nota_fiscal_numero';
                  MSG_Rel       := '--- Em Aberto - Período de ' + Trim(Data_Inicial.Text) + ' Até ' + Trim(Data_Final.Text) + ' ---';

               End;

            End;

         End;

         If Trim(Comando_SQL_2) <> '' Then
            Begin
            //*** Prepara a Criação de Tabela Temporária ***

            Nome_Tabela := 'swap_cobrancas_fb_'+Trim(Numero_HD('C'));

            //*** Apaga a Tabela Temporária ***

            Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

            ConexaoBD.SQL_Comunitario.Close;
            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            //*** Cria a Tabela Temporária ***

            Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela + ' (';
            Comando_SQL := Comando_SQL + 'swap_cobranca_nro int(11) NOT NULL auto_increment, ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_codigo varchar(80) default '+#39+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_nome varchar(100) default '+#39+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_data_emissao date default '+#39+'0000-00-00'+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_nro varchar(7) default '+#39+'0'+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_vcto date default '+#39+'0000-00-00'+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_vlr double(13,2) default '+#39+'0.00'+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_cod_bco varchar(20) default '+#39+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_pgto date default '+#39+'0000-00-00'+#39+', ';
            Comando_SQL := Comando_SQL + 'swap_cobranca_dup_obs varchar(255) default '+#39+#39+', ';
            Comando_SQL := Comando_SQL + 'PRIMARY KEY  (swap_cobranca_nro)';
            Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

            ConexaoBD.SQL_Comunitario.Close;
            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            //*** Carrega a Tabela Temporária ***

            ConexaoBD.SQL_FB_Nota_Fiscal.Close;
            ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
            ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL_2);
            ConexaoBD.SQL_FB_Nota_Fiscal.Open;

            If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
               Begin

               While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
                     Begin

                     ConexaoBD.SQL_Bancos.Close;
                     ConexaoBD.SQL_Bancos.SQL.Clear;
                     ConexaoBD.SQL_Bancos.SQL.Add('Select * From fb_bancos Where fb_banco_codigo = ' + Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_banco.Text) );
                     ConexaoBD.SQL_Bancos.Open;

                     If ConexaoBD.SQL_Bancos.RecordCount > 0 Then
                        Begin
                        Banco := ConexaoBD.SQL_Bancosfb_banco_descricao.Text;
                        End
                     Else
                        Begin
                        Banco := '';
                     End;

                     DT_Vcto_1 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text;
                     DT_Vcto_2 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text;
                     DT_Vcto_3 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text;
                     DT_Vcto_4 := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_4.Text;

                     If ( Trim(DT_Vcto_1) <> '' ) Then
                        Begin
                        Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_codigo, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_nome, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_data_emissao, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_nro, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_vcto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_vlr, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_cod_bco, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_pgto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_obs) ';

                        Comando_SQL := Comando_SQL + ' Values(';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text),'amd','-') + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_1.Text + #39 + ', ';

                        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_1.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_1.Text) + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Trim(Banco) + #39 + ',';

                        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_1.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_1.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_obs_1.Text + #39 + ')';

                        ConexaoBD.SQL_Comunitario.Close;
                        ConexaoBD.SQL_Comunitario.SQL.Clear;
                        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Comunitario.ExecSQL;
                     End;

                     If ( Trim(DT_Vcto_2) <> '' ) Then
                        Begin
                        Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_codigo, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_nome, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_data_emissao, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_nro, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_vcto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_vlr, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_cod_bco, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_pgto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_obs) ';

                        Comando_SQL := Comando_SQL + ' Values(';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text),'amd','-') + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_2.Text + #39 + ', ';

                        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_2.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_2.Text) + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Trim(Banco) + #39 + ',';

                        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_2.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_2.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_obs_2.Text + #39 + ')';

                        ConexaoBD.SQL_Comunitario.Close;
                        ConexaoBD.SQL_Comunitario.SQL.Clear;
                        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Comunitario.ExecSQL;
                     End;

                     If ( Trim(DT_Vcto_3) <> '' ) Then
                        Begin
                        Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_codigo, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_nome, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_data_emissao, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_nro, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_vcto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_vlr, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_cod_bco, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_pgto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_obs) ';

                        Comando_SQL := Comando_SQL + ' Values(';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text),'amd','-') + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_3.Text + #39 + ', ';

                        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_3.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_3.Text) + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Trim(Banco) + #39 + ',';

                        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_3.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_3.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_obs_3.Text + #39 + ')';

                        ConexaoBD.SQL_Comunitario.Close;
                        ConexaoBD.SQL_Comunitario.SQL.Clear;
                        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Comunitario.ExecSQL;
                     End;

                     If ( Trim(DT_Vcto_4) <> '' ) Then
                        Begin
                        Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_codigo, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_nome, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_data_emissao, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_nro, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_vcto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_vlr, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_cod_bco, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_dt_pgto, ';
                        Comando_SQL := Comando_SQL + 'swap_cobranca_dup_obs) ';

                        Comando_SQL := Comando_SQL + ' Values(';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_nome.Text + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text),'amd','-') + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_nro_4.Text + #39 + ', ';

                        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_4.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_vcto_4.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + Virgula_Ponto(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_vlr_4.Text) + #39 + ', ';
                        Comando_SQL := Comando_SQL + #39 + Trim(Banco) + #39 + ',';

                        If Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_4.Text) = '' Then
                           Begin
                           Comando_SQL := Comando_SQL + #39 + '0000-00-00' + #39 + ', ';
                           End
                        Else
                           Begin
                           Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_dt_pgto_4.Text),'amd','-') + #39 + ', ';
                        End;

                        Comando_SQL := Comando_SQL + #39 + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_dup_obs_4.Text + #39 + ')';

                        ConexaoBD.SQL_Comunitario.Close;
                        ConexaoBD.SQL_Comunitario.SQL.Clear;
                        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Comunitario.ExecSQL;
                     End;

                     ConexaoBD.SQL_FB_Nota_Fiscal.Next;
               End;
            End;

            //*** Seleciona os Registros da Tabela Temporária ***

            If Opc_Data_Emissao.Checked Then
               Begin
               Comando_SQL := 'Select * from ' + Nome_Tabela + ' Where ';
               Comando_SQL := Comando_SQL + '((swap_cobranca_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (swap_cobranca_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) ';
               Comando_SQL := Comando_SQL + ' Order By swap_cobranca_dup_nro';
               End
            Else If Opc_Data_Vencto.Checked Then
               Begin
               Comando_SQL := 'Select * from ' + Nome_Tabela + ' Where ';
               Comando_SQL := Comando_SQL + '((swap_cobranca_dup_dt_vcto >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (swap_cobranca_dup_dt_vcto <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) ';
               Comando_SQL := Comando_SQL + ' Order By swap_cobranca_dup_nro';
               End
            Else If Opc_Em_Aberto.Checked Then
               Begin
               Comando_SQL := 'Select * from ' + Nome_Tabela + ' Where ';
               Comando_SQL := Comando_SQL + '((swap_cobranca_dup_dt_vcto >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','-')+#39+') and (swap_cobranca_dup_dt_vcto <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','-')+#39+')) And ';
               Comando_SQL := Comando_SQL + '((swap_cobranca_dup_dt_pgto = '+#39+'0000-00-00'+#39+') Or (swap_cobranca_dup_dt_pgto = '+#39+'0'+#39+') Or (swap_cobranca_dup_dt_pgto = '+#39+#39+')) ';
               Comando_SQL := Comando_SQL + ' Order By swap_cobranca_dup_nro';
               End
            Else
               Begin
               Comando_SQL := 'Select * from ' + Nome_Tabela + ' Order By swap_cobranca_dup_nro';
            End;

            ConexaoBD.SQL_Swap_Cobrancas.Close;
            ConexaoBD.SQL_Swap_Cobrancas.SQL.Clear;
            ConexaoBD.SQL_Swap_Cobrancas.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Swap_Cobrancas.Open;

            Seta();

            Application.CreateForm(TContasReceber01,ContasReceber01);

            ContasReceber01.QR_Periodo.Caption := MSG_Rel;

            ContasReceber01.QR_Cobranca.Preview;
            ContasReceber01.Destroy;

            //*** Apaga a Tabela Temporária ***

            Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

            ConexaoBD.SQL_Comunitario.Close;
            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            Cliente_Codigo.Text    := '0';
            LBL_Endereco_1.Caption := '';
            LBL_Endereco_2.Caption := '';
            LBL_Endereco_3.Caption := '';
            Dados_Procura.Text     := '';

         End;
     End;
end;

procedure TContasReceber00.Opc_Data_EmissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContasReceber00.Opc_Data_VenctoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContasReceber00.Opc_Em_AbertoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContasReceber00.Numero_DoctoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContasReceber00.Dados_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContasReceber00.Opcoes_ProcuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContasReceber00.Data_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TContasReceber00.Data_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
