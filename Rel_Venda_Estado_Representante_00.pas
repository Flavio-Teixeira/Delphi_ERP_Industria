unit Rel_Venda_Estado_Representante_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TRelVendaEstadoRepresentante00 = class(TForm)
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
    Exibe_Registro: TLabel;
    Acc_Empresa: TEdit;
    Opc_NF: TRadioButton;
    Opc_OS: TRadioButton;
    procedure BT_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelVendaEstadoRepresentante00: TRelVendaEstadoRepresentante00;

implementation

uses Conexao_BD, Rotinas_Gerais, Rel_Venda_Estado_Representante_01,
  Ibrasmak_00;

{$R *.dfm}

procedure TRelVendaEstadoRepresentante00.BT_SairClick(Sender: TObject);
begin
     RelVendaEstadoRepresentante00.Close;
end;

procedure TRelVendaEstadoRepresentante00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRelVendaEstadoRepresentante00.FormShow(Sender: TObject);
begin
    //*** Carrega data atual nos campos de periodo ***
    Data_Final.Text   := DateToStr(Date());
    Data_Inicial.Text := '01/01/' + Trim(Copy(Data_Final.Text,7,4));
end;

procedure TRelVendaEstadoRepresentante00.BT_ImprimirClick(Sender: TObject);

var
  Comando_SQL: String;
  Nome_Tabela: String;
  Estado, Nro_Representante, Empresa, Nome_Representante, DT_Emissao, Exibe_Nota: String;
  Mes_Emissao, Calculo_Media: Integer;
  Vlr_Janeiro, Vlr_Fevereiro, Vlr_Marco, Vlr_Abril, Vlr_Maio, Vlr_Junho, Vlr_Julho, Vlr_Agosto, Vlr_Setembro, Vlr_Outubro, Vlr_Novembro, Vlr_Dezembro: String;

begin
      If Trim(Data_Inicial.Text) = '/  /' Then
         begin
         MSG_Erro('Data Inicial não preenchida...');
         Data_Inicial.SetFocus;
         end
      Else if Trim(Data_Final.Text) = '/  /' then
         begin
         MSG_Erro('Data Final não preenchida...');
         Data_Final.SetFocus;
         end
      Else if StrToDate(Data_Inicial.Text) > StrToDate(Data_Final.Text) then
         begin
         MSG_Erro('Data Inicial deve ser menor que a Data Final...');
         Data_Final.SetFocus;
         end
      Else
         begin

         If Opc_NF.Checked Then
            Begin

            If (Acc_Empresa.Text = 'Monibras') then begin
                Ampulheta();

                Exibe_Registro.Caption := 'Aguarde... Abrindo Tabelas...';
                Exibe_Registro.Refresh;

                //*** Prepara a Criação de Tabelas Temporárias ***

                Nome_Tabela := 'swap_estados_representantes_'+Trim(Numero_HD('C'));

                //*** Apaga a Tabela Temporária ***

                Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;

                //*** Cria a Tabela Temporária ***

                Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela + ' (';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_uf char(2) NOT NULL default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_rep int(3) NOT NULL default '+#39+'0'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_emp varchar(10) NOT NULL default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nome varchar(100) default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'PRIMARY KEY  (swap_estado_representante_uf,swap_estado_representante_rep,swap_estado_representante_emp)';
                Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;

                //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

                //*** Notas Fiscais e Papeletas da Ibrasmak ***

                //*** Dados Sobre a Nota Fiscal ***

                Comando_SQL := 'Select * from mb_notas_fiscais Where ';
                Comando_SQL := Comando_SQL + '((mb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') and ';
                Comando_SQL := Comando_SQL + '(mb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) and ';
                Comando_SQL := Comando_SQL + '(mb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' Or mb_nota_fiscal_natureza_oper Like '+#39+'%Exporta%'+#39+') Order By mb_nota_fiscal_estado, mb_nota_fiscal_vendedor';

                ConexaoBD.SQL_MB_Nota_Fiscal.Close;
                ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Clear;
                ConexaoBD.SQL_MB_Nota_Fiscal.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_MB_Nota_Fiscal.Open;

                If ConexaoBD.SQL_MB_Nota_Fiscal.RecordCount > 0 Then
                   Begin
                   ConexaoBD.SQL_MB_Nota_Fiscal.First;

                   While Not ConexaoBD.SQL_MB_Nota_Fiscal.Eof Do
                         Begin
                         Estado            := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_estado.Text;
                         Nro_Representante := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_vendedor.Text;
                         Empresa           := 'Geral';

                         DT_Emissao        := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_data_emissao.Text;
                         Mes_Emissao       := StrToInt(Copy(DT_Emissao,4,2));

                         Exibe_Nota             := 'Monibras -> Nota-Fiscal - Nro.Nota: ' + ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_numero.Text;
                         Exibe_Registro.Caption := Exibe_Nota;
                         Exibe_Registro.Refresh;

                         Vlr_Janeiro   := '0.00';
                         Vlr_Fevereiro := '0.00';
                         Vlr_Marco     := '0.00';
                         Vlr_Abril     := '0.00';
                         Vlr_Maio      := '0.00';
                         Vlr_Junho     := '0.00';
                         Vlr_Julho     := '0.00';
                         Vlr_Agosto    := '0.00';
                         Vlr_Setembro  := '0.00';
                         Vlr_Outubro   := '0.00';
                         Vlr_Novembro  := '0.00';
                         Vlr_Dezembro  := '0.00';

                         If Mes_Emissao = 1 Then
                            Begin
                            Vlr_Janeiro := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 2 Then
                            Begin
                            Vlr_Fevereiro := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 3 Then
                            Begin
                            Vlr_Marco := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 4 Then
                            Begin
                            Vlr_Abril := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 5 Then
                            Begin
                            Vlr_Maio := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 6 Then
                            Begin
                            Vlr_Junho := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 7 Then
                            Begin
                            Vlr_Julho := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 8 Then
                            Begin
                            Vlr_Agosto := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 9 Then
                            Begin
                            Vlr_Setembro := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 10 Then
                            Begin
                            Vlr_Outubro := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 11 Then
                            Begin
                            Vlr_Novembro := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 12 Then
                            Begin
                            Vlr_Dezembro := ConexaoBD.SQL_MB_Nota_Fiscalmb_nota_fiscal_valor_total.Text;
                         End;

                         //*** Dados Sobre a Nota Fiscal ***

                         Comando_SQL := 'Select * from fb_representantes Where fb_representante_codigo = '+ Trim(Nro_Representante);

                         ConexaoBD.SQL_FB_Representantes.Close;
                         ConexaoBD.SQL_FB_Representantes.SQL.Clear;
                         ConexaoBD.SQL_FB_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_FB_Representantes.Open;

                         If ConexaoBD.SQL_FB_Representantes.RecordCount > 0 Then
                            Begin
                            Nome_Representante := ConexaoBD.SQL_FB_Representantesfb_representante_nome.Text;
                            End
                         Else
                            Begin
                            Nome_Representante := '-';
                         End;

                         //*** Verifica se já Incluiu o Registro na Tabela Temporária ***

                         Comando_SQL := 'Select ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez, ';
                         Comando_SQL := Comando_SQL + '((swap_estado_representante_jan + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ') as swap_estado_representante_media ';
                         Comando_SQL := Comando_SQL + 'from ' + Nome_Tabela + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;

                         ConexaoBD.SQL_Rel_Estados_Representantes.Close;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Clear;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Rel_Estados_Representantes.Open;

                         If ConexaoBD.SQL_Rel_Estados_Representantes.RecordCount <= 0 Then
                            Begin
                            Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) ';

                            Comando_SQL := Comando_SQL + ' Values(';

                            Comando_SQL := Comando_SQL + #39 + Trim(Estado) + #39 + ',';
                            Comando_SQL := Comando_SQL + Trim(Nro_Representante) + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Empresa) + #39 + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Nome_Representante) + #39 + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Dezembro) + ')';
                            End
                         Else
                            Begin
                            Comando_SQL := 'Update ' + Nome_Tabela + ' Set ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan = swap_estado_representante_jan + ' + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev = swap_estado_representante_fev + ' + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar = swap_estado_representante_mar + ' + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr = swap_estado_representante_abr + ' + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai = swap_estado_representante_mai + ' + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun = swap_estado_representante_jun + ' + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul = swap_estado_representante_jul + ' + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago = swap_estado_representante_ago + ' + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set = swap_estado_representante_set + ' + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out = swap_estado_representante_out + ' + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov = swap_estado_representante_nov + ' + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez = swap_estado_representante_dez + ' + Virgula_Ponto(Vlr_Dezembro);
                            Comando_SQL := Comando_SQL + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;
                         End;

                         ConexaoBD.SQL_Comunitario.Close;
                         ConexaoBD.SQL_Comunitario.SQL.Clear;
                         ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Comunitario.ExecSQL;

                         ConexaoBD.SQL_MB_Nota_Fiscal.Next;
                   End;
                End;

                //*** Dados Sobre a Papeleta ***

                Comando_SQL := 'Select * from mb_papeletas Where ';
                Comando_SQL := Comando_SQL + '((mb_papeleta_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') and ';
                Comando_SQL := Comando_SQL + '(mb_papeleta_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) and ';
                Comando_SQL := Comando_SQL + '(mb_papeleta_natureza_oper Like '+#39+'%Venda%'+#39+' Or mb_papeleta_natureza_oper Like '+#39+'%Exporta%'+#39+') Order By mb_papeleta_estado, mb_papeleta_vendedor';

                ConexaoBD.SQL_MB_Papeletas.Close;
                ConexaoBD.SQL_MB_Papeletas.SQL.Clear;
                ConexaoBD.SQL_MB_Papeletas.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_MB_Papeletas.Open;

                If ConexaoBD.SQL_MB_Papeletas.RecordCount > 0 Then
                   Begin
                   ConexaoBD.SQL_MB_Papeletas.First;

                   While Not ConexaoBD.SQL_MB_Papeletas.Eof Do
                         Begin
                         Estado            := ConexaoBD.SQL_MB_Papeletasmb_papeleta_estado.Text;
                         Nro_Representante := ConexaoBD.SQL_MB_Papeletasmb_papeleta_vendedor.Text;
                         Empresa           := 'Geral';

                         DT_Emissao        := ConexaoBD.SQL_MB_Papeletasmb_papeleta_data_emissao.Text;
                         Mes_Emissao       := StrToInt(Copy(DT_Emissao,4,2));

                         Exibe_Nota             := 'Monibras -> Papeleta - Nro.Nota: ' + ConexaoBD.SQL_MB_Papeletasmb_papeleta_numero.Text;
                         Exibe_Registro.Caption := Exibe_Nota;
                         Exibe_Registro.Refresh;

                         Vlr_Janeiro   := '0.00';
                         Vlr_Fevereiro := '0.00';
                         Vlr_Marco     := '0.00';
                         Vlr_Abril     := '0.00';
                         Vlr_Maio      := '0.00';
                         Vlr_Junho     := '0.00';
                         Vlr_Julho     := '0.00';
                         Vlr_Agosto    := '0.00';
                         Vlr_Setembro  := '0.00';
                         Vlr_Outubro   := '0.00';
                         Vlr_Novembro  := '0.00';
                         Vlr_Dezembro  := '0.00';

                         If Mes_Emissao = 1 Then
                            Begin
                            Vlr_Janeiro := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 2 Then
                            Begin
                            Vlr_Fevereiro := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 3 Then
                            Begin
                            Vlr_Marco := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 4 Then
                            Begin
                            Vlr_Abril := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 5 Then
                            Begin
                            Vlr_Maio := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 6 Then
                            Begin
                            Vlr_Junho := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 7 Then
                            Begin
                            Vlr_Julho := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 8 Then
                            Begin
                            Vlr_Agosto := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 9 Then
                            Begin
                            Vlr_Setembro := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 10 Then
                            Begin
                            Vlr_Outubro := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 11 Then
                            Begin
                            Vlr_Novembro := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 12 Then
                            Begin
                            Vlr_Dezembro := ConexaoBD.SQL_MB_Papeletasmb_papeleta_valor_total.Text;
                         End;

                         //*** Dados Sobre a Nota Fiscal ***

                         Comando_SQL := 'Select * from fb_representantes Where fb_representante_codigo = '+ Trim(Nro_Representante);

                         ConexaoBD.SQL_FB_Representantes.Close;
                         ConexaoBD.SQL_FB_Representantes.SQL.Clear;
                         ConexaoBD.SQL_FB_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_FB_Representantes.Open;

                         If ConexaoBD.SQL_FB_Representantes.RecordCount > 0 Then
                            Begin
                            Nome_Representante := ConexaoBD.SQL_FB_Representantesfb_representante_nome.Text;
                            End
                         Else
                            Begin
                            Nome_Representante := '-';
                         End;

                         //*** Verifica se já Incluiu o Registro na Tabela Temporária ***

                         Comando_SQL := 'Select ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez, ';
                         Comando_SQL := Comando_SQL + '((swap_estado_representante_jan + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ') as swap_estado_representante_media ';
                         Comando_SQL := Comando_SQL + 'from ' + Nome_Tabela + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;

                         ConexaoBD.SQL_Rel_Estados_Representantes.Close;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Clear;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Rel_Estados_Representantes.Open;

                         If ConexaoBD.SQL_Rel_Estados_Representantes.RecordCount <= 0 Then
                            Begin
                            Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) ';

                            Comando_SQL := Comando_SQL + ' Values(';

                            Comando_SQL := Comando_SQL + #39 + Trim(Estado) + #39 + ',';
                            Comando_SQL := Comando_SQL + Trim(Nro_Representante) + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Empresa) + #39 + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Nome_Representante) + #39 + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Dezembro) + ')';
                            End
                         Else
                            Begin
                            Comando_SQL := 'Update ' + Nome_Tabela + ' Set ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan = swap_estado_representante_jan + ' + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev = swap_estado_representante_fev + ' + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar = swap_estado_representante_mar + ' + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr = swap_estado_representante_abr + ' + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai = swap_estado_representante_mai + ' + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun = swap_estado_representante_jun + ' + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul = swap_estado_representante_jul + ' + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago = swap_estado_representante_ago + ' + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set = swap_estado_representante_set + ' + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out = swap_estado_representante_out + ' + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov = swap_estado_representante_nov + ' + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez = swap_estado_representante_dez + ' + Virgula_Ponto(Vlr_Dezembro);
                            Comando_SQL := Comando_SQL + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;
                         End;

                         ConexaoBD.SQL_Comunitario.Close;
                         ConexaoBD.SQL_Comunitario.SQL.Clear;
                         ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Comunitario.ExecSQL;

                         ConexaoBD.SQL_MB_Papeletas.Next;
                   End;
                End;

                Exibe_Registro.Caption := 'Aguarde... Gerando Relatório...';
                Exibe_Registro.Refresh;

                //*** Preparação para a Emissão do Relatório ***

                Application.CreateForm(TRelVendaEstadoRepresentante01,RelVendaEstadoRepresentante01);

                //*** Obtem os Dados da Tabela de Swap ***

                Calculo_Media  := StrToInt(Copy(Data_Final.Text,4,2));

                Comando_SQL := 'Select ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez, ';
                Comando_SQL := Comando_SQL + '((swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ') as swap_estado_representante_media ';
                Comando_SQL := Comando_SQL + 'From ' + Nome_Tabela + ' Order By  swap_estado_representante_uf, swap_estado_representante_media Desc, swap_estado_representante_rep';

                ConexaoBD.SQL_Rel_Estados_Representantes.Close;
                ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Clear;
                ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Rel_Estados_Representantes.Open;

                //*** Envia dados para relatório ***

                RelVendaEstadoRepresentante01.QRL_Empresa.Caption := 'Monibras';

                RelVendaEstadoRepresentante01.QRL_Periodo.Caption := Trim(Data_Inicial.Text) + ' A ' + Trim(Data_Final.Text);
                RelVendaEstadoRepresentante01.QRL_Media.Caption   := Trim(Copy(Data_Final.Text,4,2)) + ' Mes(es)';

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + '))';

                RelVendaEstadoRepresentante01.Rel_Media_Representante.Expression := Comando_SQL;

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',SUM(((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ')))';

                RelVendaEstadoRepresentante01.Rel_Total_Media_Representante.Expression := Comando_SQL;

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',SUM(((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ')))';

                RelVendaEstadoRepresentante01.Rel_Geral_Media_Representante.Expression := Comando_SQL;

                Seta();

                RelVendaEstadoRepresentante01.RelVendasEstadosRepresentantes.Preview;
                RelVendaEstadoRepresentante01.RelVendasEstadosRepresentantes.Destroy;
                RelVendaEstadoRepresentante01.Destroy;

                Exibe_Registro.Caption := '';
                Exibe_Registro.Refresh;

                //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***

                Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;
               end
            Else begin
                Ampulheta();

                Exibe_Registro.Caption := 'Aguarde... Abrindo Tabelas...';
                Exibe_Registro.Refresh;

                //*** Prepara a Criação de Tabelas Temporárias ***

                Nome_Tabela := 'swap_estados_representantes_'+Trim(Numero_HD('C'));

                //*** Apaga a Tabela Temporária ***

                Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;

                //*** Cria a Tabela Temporária ***

                Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela + ' (';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_uf char(2) NOT NULL default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_rep int(3) NOT NULL default '+#39+'0'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_emp varchar(10) NOT NULL default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nome varchar(100) default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'PRIMARY KEY  (swap_estado_representante_uf,swap_estado_representante_rep,swap_estado_representante_emp)';
                Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;

                //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

                //*** Notas Fiscais e Papeletas da Ibrasmak ***

                //*** Dados Sobre a Nota Fiscal ***

                Comando_SQL := 'Select * from fb_notas_fiscais Where ';
                Comando_SQL := Comando_SQL + '((fb_nota_fiscal_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') and ';
                Comando_SQL := Comando_SQL + '(fb_nota_fiscal_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) and ';
                Comando_SQL := Comando_SQL + '(fb_nota_fiscal_natureza_oper Like '+#39+'%Venda%'+#39+' Or fb_nota_fiscal_natureza_oper Like '+#39+'%Exporta%'+#39+') Order By fb_nota_fiscal_estado, fb_nota_fiscal_vendedor';

                ConexaoBD.SQL_FB_Nota_Fiscal.Close;
                ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
                ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_FB_Nota_Fiscal.Open;

                If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
                   Begin
                   ConexaoBD.SQL_FB_Nota_Fiscal.First;

                   While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
                         Begin
                         Estado            := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_estado.Text;
                         Nro_Representante := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_vendedor.Text;
                         Empresa           := 'Geral';

                         DT_Emissao        := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;
                         Mes_Emissao       := StrToInt(Copy(DT_Emissao,4,2));

                         Exibe_Nota             := 'Ibrasmak -> Nota-Fiscal - Nro.Nota: ' + ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;
                         Exibe_Registro.Caption := Exibe_Nota;
                         Exibe_Registro.Refresh;

                         Vlr_Janeiro   := '0.00';
                         Vlr_Fevereiro := '0.00';
                         Vlr_Marco     := '0.00';
                         Vlr_Abril     := '0.00';
                         Vlr_Maio      := '0.00';
                         Vlr_Junho     := '0.00';
                         Vlr_Julho     := '0.00';
                         Vlr_Agosto    := '0.00';
                         Vlr_Setembro  := '0.00';
                         Vlr_Outubro   := '0.00';
                         Vlr_Novembro  := '0.00';
                         Vlr_Dezembro  := '0.00';

                         If Mes_Emissao = 1 Then
                            Begin
                            Vlr_Janeiro := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 2 Then
                            Begin
                            Vlr_Fevereiro := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 3 Then
                            Begin
                            Vlr_Marco := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 4 Then
                            Begin
                            Vlr_Abril := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 5 Then
                            Begin
                            Vlr_Maio := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 6 Then
                            Begin
                            Vlr_Junho := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 7 Then
                            Begin
                            Vlr_Julho := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 8 Then
                            Begin
                            Vlr_Agosto := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 9 Then
                            Begin
                            Vlr_Setembro := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 10 Then
                            Begin
                            Vlr_Outubro := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 11 Then
                            Begin
                            Vlr_Novembro := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                            End
                         Else If Mes_Emissao = 12 Then
                            Begin
                            Vlr_Dezembro := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text;
                         End;

                         //*** Dados Sobre a Nota Fiscal ***

                         Comando_SQL := 'Select * from fb_representantes Where fb_representante_codigo = '+ Trim(Nro_Representante);

                         ConexaoBD.SQL_FB_Representantes.Close;
                         ConexaoBD.SQL_FB_Representantes.SQL.Clear;
                         ConexaoBD.SQL_FB_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_FB_Representantes.Open;

                         If ConexaoBD.SQL_FB_Representantes.RecordCount > 0 Then
                            Begin
                            Nome_Representante := ConexaoBD.SQL_FB_Representantesfb_representante_nome.Text;
                            End
                         Else
                            Begin
                            Nome_Representante := '-';
                         End;

                         //*** Verifica se já Incluiu o Registro na Tabela Temporária ***

                         Comando_SQL := 'Select ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez, ';
                         Comando_SQL := Comando_SQL + '((swap_estado_representante_jan + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ') as swap_estado_representante_media ';
                         Comando_SQL := Comando_SQL + 'from ' + Nome_Tabela + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;

                         ConexaoBD.SQL_Rel_Estados_Representantes.Close;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Clear;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Rel_Estados_Representantes.Open;

                         If ConexaoBD.SQL_Rel_Estados_Representantes.RecordCount <= 0 Then
                            Begin
                            Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) ';

                            Comando_SQL := Comando_SQL + ' Values(';

                            Comando_SQL := Comando_SQL + #39 + Trim(Estado) + #39 + ',';
                            Comando_SQL := Comando_SQL + Trim(Nro_Representante) + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Empresa) + #39 + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Nome_Representante) + #39 + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Dezembro) + ')';
                            End
                         Else
                            Begin
                            Comando_SQL := 'Update ' + Nome_Tabela + ' Set ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan = swap_estado_representante_jan + ' + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev = swap_estado_representante_fev + ' + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar = swap_estado_representante_mar + ' + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr = swap_estado_representante_abr + ' + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai = swap_estado_representante_mai + ' + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun = swap_estado_representante_jun + ' + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul = swap_estado_representante_jul + ' + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago = swap_estado_representante_ago + ' + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set = swap_estado_representante_set + ' + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out = swap_estado_representante_out + ' + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov = swap_estado_representante_nov + ' + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez = swap_estado_representante_dez + ' + Virgula_Ponto(Vlr_Dezembro);
                            Comando_SQL := Comando_SQL + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;
                         End;

                         ConexaoBD.SQL_Comunitario.Close;
                         ConexaoBD.SQL_Comunitario.SQL.Clear;
                         ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Comunitario.ExecSQL;

                         ConexaoBD.SQL_FB_Nota_Fiscal.Next;
                   End;
                End;

                //*** Dados Sobre a Papeleta ***

                Comando_SQL := 'Select * from fb_papeletas Where ';
                Comando_SQL := Comando_SQL + '((fb_papeleta_data_emissao >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') and ';
                Comando_SQL := Comando_SQL + '(fb_papeleta_data_emissao <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) and ';
                Comando_SQL := Comando_SQL + '(fb_papeleta_natureza_oper Like '+#39+'%Venda%'+#39+' Or fb_papeleta_natureza_oper Like '+#39+'%Exporta%'+#39+') Order By fb_papeleta_estado, fb_papeleta_vendedor';

                ConexaoBD.SQL_FB_Papeletas.Close;
                ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
                ConexaoBD.SQL_FB_Papeletas.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_FB_Papeletas.Open;

                If ConexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then
                   Begin
                   ConexaoBD.SQL_FB_Papeletas.First;

                   While Not ConexaoBD.SQL_FB_Papeletas.Eof Do
                         Begin
                         Estado            := ConexaoBD.SQL_FB_Papeletasfb_papeleta_estado.Text;
                         Nro_Representante := ConexaoBD.SQL_FB_Papeletasfb_papeleta_vendedor.Text;
                         Empresa           := 'Geral';

                         DT_Emissao        := ConexaoBD.SQL_FB_Papeletasfb_papeleta_data_emissao.Text;
                         Mes_Emissao       := StrToInt(Copy(DT_Emissao,4,2));

                         Exibe_Nota             := 'Ibrasmak -> Papeleta - Nro.Nota: ' + ConexaoBD.SQL_FB_Papeletasfb_papeleta_numero.Text;
                         Exibe_Registro.Caption := Exibe_Nota;
                         Exibe_Registro.Refresh;

                         Vlr_Janeiro   := '0.00';
                         Vlr_Fevereiro := '0.00';
                         Vlr_Marco     := '0.00';
                         Vlr_Abril     := '0.00';
                         Vlr_Maio      := '0.00';
                         Vlr_Junho     := '0.00';
                         Vlr_Julho     := '0.00';
                         Vlr_Agosto    := '0.00';
                         Vlr_Setembro  := '0.00';
                         Vlr_Outubro   := '0.00';
                         Vlr_Novembro  := '0.00';
                         Vlr_Dezembro  := '0.00';

                         If Mes_Emissao = 1 Then
                            Begin
                            Vlr_Janeiro := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 2 Then
                            Begin
                            Vlr_Fevereiro := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 3 Then
                            Begin
                            Vlr_Marco := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 4 Then
                            Begin
                            Vlr_Abril := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 5 Then
                            Begin
                            Vlr_Maio := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 6 Then
                            Begin
                            Vlr_Junho := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 7 Then
                            Begin
                            Vlr_Julho := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 8 Then
                            Begin
                            Vlr_Agosto := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 9 Then
                            Begin
                            Vlr_Setembro := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 10 Then
                            Begin
                            Vlr_Outubro := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 11 Then
                            Begin
                            Vlr_Novembro := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                            End
                         Else If Mes_Emissao = 12 Then
                            Begin
                            Vlr_Dezembro := ConexaoBD.SQL_FB_Papeletasfb_papeleta_valor_total.Text;
                         End;

                         //*** Dados Sobre a Nota Fiscal ***

                         Comando_SQL := 'Select * from fb_representantes Where fb_representante_codigo = '+ Trim(Nro_Representante);

                         ConexaoBD.SQL_FB_Representantes.Close;
                         ConexaoBD.SQL_FB_Representantes.SQL.Clear;
                         ConexaoBD.SQL_FB_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_FB_Representantes.Open;

                         If ConexaoBD.SQL_FB_Representantes.RecordCount > 0 Then
                            Begin
                            Nome_Representante := ConexaoBD.SQL_FB_Representantesfb_representante_nome.Text;
                            End
                         Else
                            Begin
                            Nome_Representante := '-';
                         End;

                         //*** Verifica se já Incluiu o Registro na Tabela Temporária ***

                         Comando_SQL := 'Select ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez, ';
                         Comando_SQL := Comando_SQL + '((swap_estado_representante_jan + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ') as swap_estado_representante_media ';
                         Comando_SQL := Comando_SQL + 'from ' + Nome_Tabela + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;

                         ConexaoBD.SQL_Rel_Estados_Representantes.Close;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Clear;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Rel_Estados_Representantes.Open;

                         If ConexaoBD.SQL_Rel_Estados_Representantes.RecordCount <= 0 Then
                            Begin
                            Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) ';

                            Comando_SQL := Comando_SQL + ' Values(';

                            Comando_SQL := Comando_SQL + #39 + Trim(Estado) + #39 + ',';
                            Comando_SQL := Comando_SQL + Trim(Nro_Representante) + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Empresa) + #39 + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Nome_Representante) + #39 + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Dezembro) + ')';
                            End
                         Else
                            Begin
                            Comando_SQL := 'Update ' + Nome_Tabela + ' Set ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan = swap_estado_representante_jan + ' + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev = swap_estado_representante_fev + ' + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar = swap_estado_representante_mar + ' + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr = swap_estado_representante_abr + ' + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai = swap_estado_representante_mai + ' + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun = swap_estado_representante_jun + ' + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul = swap_estado_representante_jul + ' + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago = swap_estado_representante_ago + ' + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set = swap_estado_representante_set + ' + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out = swap_estado_representante_out + ' + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov = swap_estado_representante_nov + ' + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez = swap_estado_representante_dez + ' + Virgula_Ponto(Vlr_Dezembro);
                            Comando_SQL := Comando_SQL + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;
                         End;

                         ConexaoBD.SQL_Comunitario.Close;
                         ConexaoBD.SQL_Comunitario.SQL.Clear;
                         ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Comunitario.ExecSQL;

                         ConexaoBD.SQL_FB_Papeletas.Next;
                   End;
                End;

                Exibe_Registro.Caption := 'Aguarde... Gerando Relatório...';
                Exibe_Registro.Refresh;

                //*** Preparação para a Emissão do Relatório ***

                Application.CreateForm(TRelVendaEstadoRepresentante01,RelVendaEstadoRepresentante01);

                //*** Obtem os Dados da Tabela de Swap ***

                Calculo_Media  := StrToInt(Copy(Data_Final.Text,4,2));

                Comando_SQL := 'Select ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez, ';
                Comando_SQL := Comando_SQL + '((swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ') as swap_estado_representante_media ';
                Comando_SQL := Comando_SQL + 'From ' + Nome_Tabela + ' Order By  swap_estado_representante_uf, swap_estado_representante_media Desc, swap_estado_representante_rep';

                ConexaoBD.SQL_Rel_Estados_Representantes.Close;
                ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Clear;
                ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Rel_Estados_Representantes.Open;

                //*** Envia dados para relatório ***

                RelVendaEstadoRepresentante01.QRL_Empresa.Caption := 'Ibrasmak';

                RelVendaEstadoRepresentante01.QRL_Periodo.Caption := Trim(Data_Inicial.Text) + ' A ' + Trim(Data_Final.Text);
                RelVendaEstadoRepresentante01.QRL_Media.Caption   := Trim(Copy(Data_Final.Text,4,2)) + ' Mes(es)';

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + '))';

                RelVendaEstadoRepresentante01.Rel_Media_Representante.Expression := Comando_SQL;

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',SUM(((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ')))';

                RelVendaEstadoRepresentante01.Rel_Total_Media_Representante.Expression := Comando_SQL;

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',SUM(((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ')))';

                RelVendaEstadoRepresentante01.Rel_Geral_Media_Representante.Expression := Comando_SQL;

                Seta();

                RelVendaEstadoRepresentante01.RelVendasEstadosRepresentantes.Preview;
                RelVendaEstadoRepresentante01.RelVendasEstadosRepresentantes.Destroy;
                RelVendaEstadoRepresentante01.Destroy;

                Exibe_Registro.Caption := '';
                Exibe_Registro.Refresh;

                //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***

                Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;
            End;

            End
         Else
            Begin

            If (Acc_Empresa.Text = 'Monibras') then begin
                Ampulheta();

                Exibe_Registro.Caption := 'Aguarde... Abrindo Tabelas...';
                Exibe_Registro.Refresh;

                //*** Prepara a Criação de Tabelas Temporárias ***

                Nome_Tabela := 'swap_estados_representantes_'+Trim(Numero_HD('C'));

                //*** Apaga a Tabela Temporária ***

                Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;

                //*** Cria a Tabela Temporária ***

                Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela + ' (';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_uf char(2) NOT NULL default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_rep int(3) NOT NULL default '+#39+'0'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_emp varchar(10) NOT NULL default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nome varchar(100) default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'PRIMARY KEY  (swap_estado_representante_uf,swap_estado_representante_rep,swap_estado_representante_emp)';
                Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;

                //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

                //*** Notas Fiscais e Papeletas da Ibrasmak ***

                //*** Dados Sobre a Nota Fiscal ***

                Comando_SQL := 'Select * from pedidos Where ';
                Comando_SQL := Comando_SQL + 'pedido_empresa = '+#39+'Monibras'+#39+' and ';
                Comando_SQL := Comando_SQL + '((pedido_data >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') and ';
                Comando_SQL := Comando_SQL + '(pedido_data <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By pedido_numero';

                ConexaoBD.SQL_Pedidos.Close;
                ConexaoBD.SQL_Pedidos.SQL.Clear;
                ConexaoBD.SQL_Pedidos.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Pedidos.Open;

                If ConexaoBD.SQL_Pedidos.RecordCount > 0 Then
                   Begin
                   ConexaoBD.SQL_Pedidos.First;

                   While Not ConexaoBD.SQL_Pedidos.Eof Do
                         Begin
                         Comando_SQL := 'Select * from fb_clientes Where fb_cliente_codigo = '+#39+Trim(ConexaoBD.SQL_Pedidospedido_cliente_codigo.Text)+#39;

                         ConexaoBD.SQL_Clientes.Close;
                         ConexaoBD.SQL_Clientes.SQL.Clear;
                         ConexaoBD.SQL_Clientes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Clientes.Open;

                         Estado            := ConexaoBD.SQL_Clientesfb_cliente_estado.Text;
                         Nro_Representante := ConexaoBD.SQL_Pedidospedido_vendedor_numero.Text;
                         Empresa           := 'Geral';

                         DT_Emissao        := ConexaoBD.SQL_Pedidospedido_data.Text;
                         Mes_Emissao       := StrToInt(Copy(DT_Emissao,4,2));

                         Exibe_Nota             := 'Monibras -> OS - Nro.: ' + ConexaoBD.SQL_Pedidospedido_numero.Text;
                         Exibe_Registro.Caption := Exibe_Nota;
                         Exibe_Registro.Refresh;

                         Vlr_Janeiro   := '0.00';
                         Vlr_Fevereiro := '0.00';
                         Vlr_Marco     := '0.00';
                         Vlr_Abril     := '0.00';
                         Vlr_Maio      := '0.00';
                         Vlr_Junho     := '0.00';
                         Vlr_Julho     := '0.00';
                         Vlr_Agosto    := '0.00';
                         Vlr_Setembro  := '0.00';
                         Vlr_Outubro   := '0.00';
                         Vlr_Novembro  := '0.00';
                         Vlr_Dezembro  := '0.00';

                         If Mes_Emissao = 1 Then
                            Begin
                            Vlr_Janeiro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 2 Then
                            Begin
                            Vlr_Fevereiro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 3 Then
                            Begin
                            Vlr_Marco := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 4 Then
                            Begin
                            Vlr_Abril := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 5 Then
                            Begin
                            Vlr_Maio := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 6 Then
                            Begin
                            Vlr_Junho := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 7 Then
                            Begin
                            Vlr_Julho := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 8 Then
                            Begin
                            Vlr_Agosto := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 9 Then
                            Begin
                            Vlr_Setembro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 10 Then
                            Begin
                            Vlr_Outubro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 11 Then
                            Begin
                            Vlr_Novembro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 12 Then
                            Begin
                            Vlr_Dezembro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                         End;

                         //*** Dados Sobre a Nota Fiscal ***

                         Comando_SQL := 'Select * from fb_representantes Where fb_representante_codigo = '+ Trim(Nro_Representante);

                         ConexaoBD.SQL_FB_Representantes.Close;
                         ConexaoBD.SQL_FB_Representantes.SQL.Clear;
                         ConexaoBD.SQL_FB_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_FB_Representantes.Open;

                         If ConexaoBD.SQL_FB_Representantes.RecordCount > 0 Then
                            Begin
                            Nome_Representante := ConexaoBD.SQL_FB_Representantesfb_representante_nome.Text;
                            End
                         Else
                            Begin
                            Nome_Representante := '-';
                         End;

                         //*** Verifica se já Incluiu o Registro na Tabela Temporária ***

                         Comando_SQL := 'Select ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez, ';
                         Comando_SQL := Comando_SQL + '((swap_estado_representante_jan + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ') as swap_estado_representante_media ';
                         Comando_SQL := Comando_SQL + 'from ' + Nome_Tabela + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;

                         ConexaoBD.SQL_Rel_Estados_Representantes.Close;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Clear;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Rel_Estados_Representantes.Open;

                         If ConexaoBD.SQL_Rel_Estados_Representantes.RecordCount <= 0 Then
                            Begin
                            Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) ';

                            Comando_SQL := Comando_SQL + ' Values(';

                            Comando_SQL := Comando_SQL + #39 + Trim(Estado) + #39 + ',';
                            Comando_SQL := Comando_SQL + Trim(Nro_Representante) + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Empresa) + #39 + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Nome_Representante) + #39 + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Dezembro) + ')';
                            End
                         Else
                            Begin
                            Comando_SQL := 'Update ' + Nome_Tabela + ' Set ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan = swap_estado_representante_jan + ' + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev = swap_estado_representante_fev + ' + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar = swap_estado_representante_mar + ' + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr = swap_estado_representante_abr + ' + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai = swap_estado_representante_mai + ' + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun = swap_estado_representante_jun + ' + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul = swap_estado_representante_jul + ' + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago = swap_estado_representante_ago + ' + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set = swap_estado_representante_set + ' + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out = swap_estado_representante_out + ' + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov = swap_estado_representante_nov + ' + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez = swap_estado_representante_dez + ' + Virgula_Ponto(Vlr_Dezembro);
                            Comando_SQL := Comando_SQL + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;
                         End;

                         ConexaoBD.SQL_Comunitario.Close;
                         ConexaoBD.SQL_Comunitario.SQL.Clear;
                         ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Comunitario.ExecSQL;

                         ConexaoBD.SQL_Pedidos.Next;
                   End;
                End;

                Exibe_Registro.Caption := 'Aguarde... Gerando Relatório...';
                Exibe_Registro.Refresh;

                //*** Preparação para a Emissão do Relatório ***

                Application.CreateForm(TRelVendaEstadoRepresentante01,RelVendaEstadoRepresentante01);

                //*** Obtem os Dados da Tabela de Swap ***

                Calculo_Media  := StrToInt(Copy(Data_Final.Text,4,2));

                Comando_SQL := 'Select ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez, ';
                Comando_SQL := Comando_SQL + '((swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ') as swap_estado_representante_media ';
                Comando_SQL := Comando_SQL + 'From ' + Nome_Tabela + ' Order By  swap_estado_representante_uf, swap_estado_representante_media Desc, swap_estado_representante_rep';

                ConexaoBD.SQL_Rel_Estados_Representantes.Close;
                ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Clear;
                ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Rel_Estados_Representantes.Open;

                //*** Envia dados para relatório ***

                RelVendaEstadoRepresentante01.QRL_Empresa.Caption := 'Monibras';

                RelVendaEstadoRepresentante01.QRL_Periodo.Caption := Trim(Data_Inicial.Text) + ' A ' + Trim(Data_Final.Text);
                RelVendaEstadoRepresentante01.QRL_Media.Caption   := Trim(Copy(Data_Final.Text,4,2)) + ' Mes(es) - OS(Ordens de Serviço)';

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + '))';

                RelVendaEstadoRepresentante01.Rel_Media_Representante.Expression := Comando_SQL;

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',SUM(((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ')))';

                RelVendaEstadoRepresentante01.Rel_Total_Media_Representante.Expression := Comando_SQL;

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',SUM(((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ')))';

                RelVendaEstadoRepresentante01.Rel_Geral_Media_Representante.Expression := Comando_SQL;

                Seta();

                RelVendaEstadoRepresentante01.RelVendasEstadosRepresentantes.Preview;
                RelVendaEstadoRepresentante01.RelVendasEstadosRepresentantes.Destroy;
                RelVendaEstadoRepresentante01.Destroy;

                Exibe_Registro.Caption := '';
                Exibe_Registro.Refresh;

                //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***

                Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;
                End
            Else
                Begin
                Exibe_Registro.Caption := 'Aguarde... Abrindo Tabelas...';
                Exibe_Registro.Refresh;

                //*** Prepara a Criação de Tabelas Temporárias ***

                Nome_Tabela := 'swap_estados_representantes_'+Trim(Numero_HD('C'));

                //*** Apaga a Tabela Temporária ***

                Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;

                //*** Cria a Tabela Temporária ***

                Comando_SQL := 'CREATE TEMPORARY TABLE ' + Nome_Tabela + ' (';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_uf char(2) NOT NULL default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_rep int(3) NOT NULL default '+#39+'0'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_emp varchar(10) NOT NULL default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nome varchar(100) default '+#39+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez double(13,2) default '+#39+'0.00'+#39+',';
                Comando_SQL := Comando_SQL + 'PRIMARY KEY  (swap_estado_representante_uf,swap_estado_representante_rep,swap_estado_representante_emp)';
                Comando_SQL := Comando_SQL + ') TYPE=MyISAM';

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;

                //*** Efetua o Carregamento das Tabelas Temporárias para a Geração do Relatório ***

                //*** Notas Fiscais e Papeletas da Ibrasmak ***

                //*** Dados Sobre a Nota Fiscal ***

                Comando_SQL := 'Select * from pedidos Where ';
                Comando_SQL := Comando_SQL + 'pedido_empresa = '+#39+'Ibrasmak'+#39+' and ';
                Comando_SQL := Comando_SQL + '((pedido_data >='+#39+Inverte_Data_Plus(Trim(Data_Inicial.Text),'amd','/')+#39+') and ';
                Comando_SQL := Comando_SQL + '(pedido_data <='+#39+Inverte_Data_Plus(Trim(Data_Final.Text),'amd','/')+#39+')) Order By pedido_numero';

                ConexaoBD.SQL_Pedidos.Close;
                ConexaoBD.SQL_Pedidos.SQL.Clear;
                ConexaoBD.SQL_Pedidos.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Pedidos.Open;

                If ConexaoBD.SQL_Pedidos.RecordCount > 0 Then
                   Begin
                   ConexaoBD.SQL_Pedidos.First;

                   While Not ConexaoBD.SQL_Pedidos.Eof Do
                         Begin
                         Comando_SQL := 'Select * from fb_clientes Where fb_cliente_codigo = '+#39+Trim(ConexaoBD.SQL_Pedidospedido_cliente_codigo.Text)+#39;

                         ConexaoBD.SQL_Clientes.Close;
                         ConexaoBD.SQL_Clientes.SQL.Clear;
                         ConexaoBD.SQL_Clientes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Clientes.Open;

                         Estado            := ConexaoBD.SQL_Clientesfb_cliente_estado.Text;
                         Nro_Representante := ConexaoBD.SQL_Pedidospedido_vendedor_numero.Text;
                         Empresa           := 'Geral';

                         DT_Emissao        := ConexaoBD.SQL_Pedidospedido_data.Text;
                         Mes_Emissao       := StrToInt(Copy(DT_Emissao,4,2));

                         Exibe_Nota             := 'Ibrasmak -> OS - Nro.: ' + ConexaoBD.SQL_Pedidospedido_numero.Text;
                         Exibe_Registro.Caption := Exibe_Nota;
                         Exibe_Registro.Refresh;

                         Vlr_Janeiro   := '0.00';
                         Vlr_Fevereiro := '0.00';
                         Vlr_Marco     := '0.00';
                         Vlr_Abril     := '0.00';
                         Vlr_Maio      := '0.00';
                         Vlr_Junho     := '0.00';
                         Vlr_Julho     := '0.00';
                         Vlr_Agosto    := '0.00';
                         Vlr_Setembro  := '0.00';
                         Vlr_Outubro   := '0.00';
                         Vlr_Novembro  := '0.00';
                         Vlr_Dezembro  := '0.00';

                         If Mes_Emissao = 1 Then
                            Begin
                            Vlr_Janeiro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 2 Then
                            Begin
                            Vlr_Fevereiro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 3 Then
                            Begin
                            Vlr_Marco := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 4 Then
                            Begin
                            Vlr_Abril := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 5 Then
                            Begin
                            Vlr_Maio := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 6 Then
                            Begin
                            Vlr_Junho := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 7 Then
                            Begin
                            Vlr_Julho := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 8 Then
                            Begin
                            Vlr_Agosto := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 9 Then
                            Begin
                            Vlr_Setembro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 10 Then
                            Begin
                            Vlr_Outubro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 11 Then
                            Begin
                            Vlr_Novembro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                            End
                         Else If Mes_Emissao = 12 Then
                            Begin
                            Vlr_Dezembro := ConexaoBD.SQL_Pedidospedido_valor_pedido.Text;
                         End;

                         //*** Dados Sobre a Nota Fiscal ***

                         Comando_SQL := 'Select * from fb_representantes Where fb_representante_codigo = '+ Trim(Nro_Representante);

                         ConexaoBD.SQL_FB_Representantes.Close;
                         ConexaoBD.SQL_FB_Representantes.SQL.Clear;
                         ConexaoBD.SQL_FB_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_FB_Representantes.Open;

                         If ConexaoBD.SQL_FB_Representantes.RecordCount > 0 Then
                            Begin
                            Nome_Representante := ConexaoBD.SQL_FB_Representantesfb_representante_nome.Text;
                            End
                         Else
                            Begin
                            Nome_Representante := '-';
                         End;

                         //*** Verifica se já Incluiu o Registro na Tabela Temporária ***

                         Comando_SQL := 'Select ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez, ';
                         Comando_SQL := Comando_SQL + '((swap_estado_representante_jan + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                         Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ') as swap_estado_representante_media ';
                         Comando_SQL := Comando_SQL + 'from ' + Nome_Tabela + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;

                         ConexaoBD.SQL_Rel_Estados_Representantes.Close;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Clear;
                         ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Rel_Estados_Representantes.Open;

                         If ConexaoBD.SQL_Rel_Estados_Representantes.RecordCount <= 0 Then
                            Begin
                            Comando_SQL := 'Insert into ' + Nome_Tabela + ' (';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) ';

                            Comando_SQL := Comando_SQL + ' Values(';

                            Comando_SQL := Comando_SQL + #39 + Trim(Estado) + #39 + ',';
                            Comando_SQL := Comando_SQL + Trim(Nro_Representante) + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Empresa) + #39 + ',';
                            Comando_SQL := Comando_SQL + #39 + Trim(Nome_Representante) + #39 + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + Virgula_Ponto(Vlr_Dezembro) + ')';
                            End
                         Else
                            Begin
                            Comando_SQL := 'Update ' + Nome_Tabela + ' Set ';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jan = swap_estado_representante_jan + ' + Virgula_Ponto(Vlr_Janeiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_fev = swap_estado_representante_fev + ' + Virgula_Ponto(Vlr_Fevereiro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mar = swap_estado_representante_mar + ' + Virgula_Ponto(Vlr_Marco) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_abr = swap_estado_representante_abr + ' + Virgula_Ponto(Vlr_Abril) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_mai = swap_estado_representante_mai + ' + Virgula_Ponto(Vlr_Maio) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jun = swap_estado_representante_jun + ' + Virgula_Ponto(Vlr_Junho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_jul = swap_estado_representante_jul + ' + Virgula_Ponto(Vlr_Julho) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_ago = swap_estado_representante_ago + ' + Virgula_Ponto(Vlr_Agosto) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_set = swap_estado_representante_set + ' + Virgula_Ponto(Vlr_Setembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_out = swap_estado_representante_out + ' + Virgula_Ponto(Vlr_Outubro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_nov = swap_estado_representante_nov + ' + Virgula_Ponto(Vlr_Novembro) + ',';
                            Comando_SQL := Comando_SQL + 'swap_estado_representante_dez = swap_estado_representante_dez + ' + Virgula_Ponto(Vlr_Dezembro);
                            Comando_SQL := Comando_SQL + ' Where swap_estado_representante_uf = ' +#39+ Trim(Estado) +#39+ ' And swap_estado_representante_rep = ' + Trim(Nro_Representante) + ' And swap_estado_representante_emp = ' +#39+ Trim(Empresa) +#39;
                         End;

                         ConexaoBD.SQL_Comunitario.Close;
                         ConexaoBD.SQL_Comunitario.SQL.Clear;
                         ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                         ConexaoBD.SQL_Comunitario.ExecSQL;

                         ConexaoBD.SQL_Pedidos.Next;
                   End;
                End;

                Exibe_Registro.Caption := 'Aguarde... Gerando Relatório...';
                Exibe_Registro.Refresh;

                //*** Preparação para a Emissão do Relatório ***

                Application.CreateForm(TRelVendaEstadoRepresentante01,RelVendaEstadoRepresentante01);

                //*** Obtem os Dados da Tabela de Swap ***

                Calculo_Media  := StrToInt(Copy(Data_Final.Text,4,2));

                Comando_SQL := 'Select ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_uf, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_rep, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_emp, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nome, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov, ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez, ';
                Comando_SQL := Comando_SQL + '((swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ') as swap_estado_representante_media ';
                Comando_SQL := Comando_SQL + 'From ' + Nome_Tabela + ' Order By  swap_estado_representante_uf, swap_estado_representante_media Desc, swap_estado_representante_rep';

                ConexaoBD.SQL_Rel_Estados_Representantes.Close;
                ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Clear;
                ConexaoBD.SQL_Rel_Estados_Representantes.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Rel_Estados_Representantes.Open;

                //*** Envia dados para relatório ***

                RelVendaEstadoRepresentante01.QRL_Empresa.Caption := 'Ibrasmak';

                RelVendaEstadoRepresentante01.QRL_Periodo.Caption := Trim(Data_Inicial.Text) + ' A ' + Trim(Data_Final.Text);
                RelVendaEstadoRepresentante01.QRL_Media.Caption   := Trim(Copy(Data_Final.Text,4,2)) + ' Mes(es) - OS(Ordens de Serviço)';

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + '))';

                RelVendaEstadoRepresentante01.Rel_Media_Representante.Expression := Comando_SQL;

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',SUM(((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ')))';

                RelVendaEstadoRepresentante01.Rel_Total_Media_Representante.Expression := Comando_SQL;

                Comando_SQL := 'FORMATNUMERIC('+#39+'0.00'+#39+',SUM(((';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jan + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_fev + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mar + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_abr + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_mai + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jun + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_jul + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_ago + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_set + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_out + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_nov + ';
                Comando_SQL := Comando_SQL + 'swap_estado_representante_dez) / ' + IntToStr(Calculo_Media) + ')))';

                RelVendaEstadoRepresentante01.Rel_Geral_Media_Representante.Expression := Comando_SQL;

                Seta();

                RelVendaEstadoRepresentante01.RelVendasEstadosRepresentantes.Preview;
                RelVendaEstadoRepresentante01.RelVendasEstadosRepresentantes.Destroy;
                RelVendaEstadoRepresentante01.Destroy;

                Exibe_Registro.Caption := '';
                Exibe_Registro.Refresh;

                //*** Apaga a Tabela Temporária de Notas Fiscais e Papeletas ***

                Comando_SQL := 'DROP TABLE IF EXISTS ' + Nome_Tabela;

                ConexaoBD.SQL_Comunitario.Close;
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;
            End;

         End;

      End;
end;

end.
