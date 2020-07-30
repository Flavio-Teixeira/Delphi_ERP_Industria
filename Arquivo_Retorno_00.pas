unit Arquivo_Retorno_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, FileCtrl, Grids;

type
  TArquivoRetorno00 = class(TForm)
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Importar: TBitBtn;
    Lista_Arquivos: TFileListBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Exibe_Progresso: TLabel;
    Arquivos_Obtidos: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArquivoRetorno00: TArquivoRetorno00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TArquivoRetorno00.FormShow(Sender: TObject);

var
   Ind: Integer;

begin
     //*** Exibe a Menssagem de Processo ***

     Exibe_Progresso.Caption := 'Aguarde... Carregando os arquivos...';
     Exibe_Progresso.Refresh;

     //*** Efetuando a Cópia dos Arquivos Baixados ***
     //*** Limpa o Diretório de Destino ***

     Lista_Arquivos.Directory := 'C:\Grupo_Ibrasmak\Ibrasmak\Retorno';

     If Lista_Arquivos.Count > 0 Then
        Begin

        For Ind := 0 To Lista_Arquivos.Count Do
            Begin
            Lista_Arquivos.ItemIndex := Ind;

            DeleteFile(Trim(Lista_Arquivos.FileName));
        End;
     End;

     //*** Banco do Brasil ***
     //*** Copia os Arquivos de Retorno do Banco do Brasil ***

     Lista_Arquivos.Directory := 'C:\BancoBrasil\BBTransf\Retorno';

     If Lista_Arquivos.Count > 0 Then
        Begin

        For Ind := 0 To Lista_Arquivos.Count Do
            Begin
            Lista_Arquivos.ItemIndex := Ind;

            CopyFile(PChar(Trim(Lista_Arquivos.FileName)),PChar('C:\Grupo_Ibrasmak\Ibrasmak\Retorno\'+Copy(Trim(Lista_Arquivos.FileName),33, (Length(Trim(Lista_Arquivos.FileName)) - 32))),True);
        End;
     End;

     //*** Limpa o Diretório de Origem ***

     Lista_Arquivos.Directory := 'C:\BancoBrasil\BBTransf\Retorno';

     If Lista_Arquivos.Count > 0 Then
        Begin

        For Ind := 0 To Lista_Arquivos.Count Do
            Begin
            Lista_Arquivos.ItemIndex := Ind;

            DeleteFile(Trim(Lista_Arquivos.FileName));
        End;
     End;

     //*** Bradesco ***
     //*** Copia os Arquivos de Retorno do Bradesco ***

     Lista_Arquivos.Directory := 'C:\Grupo_Ibrasmak\Ibrasmak\Retorno\Bradesco';

     If Lista_Arquivos.Count > 0 Then
        Begin

        For Ind := 0 To Lista_Arquivos.Count Do
            Begin
            Lista_Arquivos.ItemIndex := Ind;

            CopyFile(PChar(Trim(Lista_Arquivos.FileName)),PChar('C:\Grupo_Ibrasmak\Ibrasmak\Retorno\'+Copy(Trim(Lista_Arquivos.FileName),47, (Length(Trim(Lista_Arquivos.FileName)) - 46))),True);
        End;
     End;

     //*** Limpa o Diretório de Origem ***

     Lista_Arquivos.Directory := 'C:\Grupo_Ibrasmak\Ibrasmak\Retorno\Bradesco';

     If Lista_Arquivos.Count > 0 Then
        Begin

        For Ind := 0 To Lista_Arquivos.Count Do
            Begin
            Lista_Arquivos.ItemIndex := Ind;

            DeleteFile(Trim(Lista_Arquivos.FileName));
        End;
     End;

     //*** Prepara o Localização dos Arquivos ***

     Lista_Arquivos.Directory   := 'C:\Grupo_Ibrasmak\Ibrasmak\Retorno';

     If Lista_Arquivos.Count > 0 Then
        Begin
        //*** Prepara a Quantidade de Linhas ***
        Arquivos_Obtidos.RowCount  := (Lista_Arquivos.Count + 1);
        Arquivos_Obtidos.FixedRows := 1;

        //*** Monta o Nome das Colunas ***
        //*** Nome do Arquivo ***
        Arquivos_Obtidos.Cells[0,0]   := 'Nome do Arquivo';
        Arquivos_Obtidos.ColWidths[0] := 270;

        //*** Status do Arquivo ***
        Arquivos_Obtidos.Cells[1,0]   := 'Status';
        Arquivos_Obtidos.ColWidths[1] := 90;

        For Ind := 0 To Lista_Arquivos.Count Do
            Begin
            Lista_Arquivos.ItemIndex := Ind;

            Arquivos_Obtidos.Cells[0,(Ind + 1)] := Trim(Lista_Arquivos.FileName);
            Arquivos_Obtidos.Cells[1,(Ind + 1)] := 'Aguardando';

            Arquivos_Obtidos.Refresh;
        End;

        Exibe_Progresso.Caption := ' ';
        Exibe_Progresso.Refresh;

        End
     Else
        Begin
        //*** Prepara a Quantidade de Linhas ***
        Arquivos_Obtidos.RowCount  := 2;
        Arquivos_Obtidos.FixedRows := 1;

        //*** Monta o Nome das Colunas ***
        //*** Nome do Arquivo ***
        Arquivos_Obtidos.Cells[0,0]   := 'Nome do Arquivo';
        Arquivos_Obtidos.ColWidths[0] := 270;

        //*** Status do Arquivo ***
        Arquivos_Obtidos.Cells[1,0]   := 'Status';
        Arquivos_Obtidos.ColWidths[1] := 90;

        BT_Importar.Enabled := False;

        Exibe_Progresso.Caption := 'ATENÇÂO: Nenhum arquivo foi encontrado para importação...';
        Exibe_Progresso.Refresh;
     End;

end;

procedure TArquivoRetorno00.BT_SairClick(Sender: TObject);
begin
     ArquivoRetorno00.Close;
end;

procedure TArquivoRetorno00.BT_ImportarClick(Sender: TObject);

var
   Ind: Integer;
   Nome_Arq_Retorno, Linha, Ponteiro: String;
   Arq_Retorno: TextFile;

   Tipo_Arquivo, Tipo_Registro, Tipo_Segmento, Cod_Empresa, Cod_Cliente, Cod_Movimento, Baixa: String;
   Cod_Bancario, Nro_Documento, DT_Pagamento, Vlr_Documento, Vlr_Juros, Vlr_Pagamento: String;
   Comando_SQL: String;

begin
     For Ind := 1 To (Arquivos_Obtidos.RowCount - 1) Do
         Begin
         Arquivos_Obtidos.Row := Ind;

         Arquivos_Obtidos.Cells[1,Ind] := 'Importando';
         Arquivos_Obtidos.Refresh;

         //*** Obtem o Primeiro Arquivo ***

         Nome_Arq_Retorno := Arquivos_Obtidos.Cells[0,Ind];
         Tipo_Arquivo     := Copy(Nome_Arq_Retorno,38,3);

         Exibe_Progresso.Caption  := 'Lendo Arquivo: ' + Trim(Nome_Arq_Retorno);
         Exibe_Progresso.Refresh;

         //*** Ler os Arquivos de Retorno ***

         //*** Banco do Brasil ***

         If UpperCase(Trim(Tipo_Arquivo)) = 'IED' Then
            Begin
            AssignFile(Arq_Retorno,Nome_Arq_Retorno);
            Reset(Arq_Retorno);
            Readln(Arq_Retorno,Linha);

            Ponteiro      := '';
            Tipo_Registro := '';
            Cod_Empresa   := '';
            Cod_Cliente   := '';

            While Not Eof(Arq_Retorno) Do
                  Begin
                  If Trim(Ponteiro) = '' Then
                     Begin
                     Ponteiro := ' - ';
                     End
                  Else If Ponteiro = ' - ' Then
                     Begin
                     Ponteiro := ' \ ';
                     End
                  Else If Ponteiro = ' \ ' Then
                     Begin
                     Ponteiro := ' | ';
                     End
                  Else If Ponteiro = ' | ' Then
                     Begin
                     Ponteiro := ' / ';
                     End
                  Else If Ponteiro = ' / ' Then
                     Begin
                     Ponteiro := ' - ';
                  End;

                  Arquivos_Obtidos.Cells[1,Ind] := Ponteiro;
                  Arquivos_Obtidos.Refresh;

                  Exibe_Progresso.Caption  := 'Lendo Arquivo: ' + Trim(Nome_Arq_Retorno) + ': ' + Ponteiro;
                  Exibe_Progresso.Refresh;

                  //*** Registrando os Dados de Retorno ***

                  Tipo_Registro := Copy(Linha,8,1);

                  If Trim(Tipo_Registro) = '0' Then
                     Begin
                     Cod_Empresa := Copy(Linha,19,14);
                     Cod_Cliente := Cod_Empresa[1] + Cod_Empresa[2] + '.' + Cod_Empresa[3] + Cod_Empresa[4] + Cod_Empresa[5] + '.' + Cod_Empresa[6] + Cod_Empresa[7] + Cod_Empresa[8] + '/' + Cod_Empresa[9] + Cod_Empresa[10] + Cod_Empresa[11] + Cod_Empresa[12] + '-' + Cod_Empresa[13] + Cod_Empresa[14];
                     Cod_Cliente := Trim(Cod_Cliente);
                  End;

                  If Trim(Tipo_Registro) = '3' Then
                     Begin
                     //*** Obtem Dados de Baixa ***

                     Tipo_Segmento := Copy(Linha,14,1);

                     If Trim(Tipo_Segmento) = 'T' Then
                        Begin
                        Cod_Movimento := Copy(Linha,16,2);
                        Nro_Documento := Copy(Linha,59,15);
                        Cod_Bancario  := Copy(Linha,38,20);

                        Vlr_Documento := Copy(Linha,82,15);
                        Vlr_Documento := Vlr_Documento[1] + Vlr_Documento[2] + Vlr_Documento[3] + Vlr_Documento[4] + Vlr_Documento[5] + Vlr_Documento[6] + Vlr_Documento[7] + Vlr_Documento[8] + Vlr_Documento[9] + Vlr_Documento[10] + Vlr_Documento[11] + Vlr_Documento[12] + Vlr_Documento[13] + '.' +  Vlr_Documento[14] + Vlr_Documento[15];
                        Vlr_Documento := Trim(Vlr_Documento);

                        End
                     Else If Trim(Tipo_Segmento) = 'U' Then
                        Begin

                        If ((Trim(Cod_Movimento) = '06') Or (Trim(Cod_Movimento) = '09') Or (Trim(Cod_Movimento) = '12') Or (Trim(Cod_Movimento) = '13') Or (Trim(Cod_Movimento) = '14') Or (Trim(Cod_Movimento) = '17') Or (Trim(Cod_Movimento) = '19') Or (Trim(Cod_Movimento) = '20')) Then
                           Begin
                           DT_Pagamento := Copy(Linha,138,8);
                           DT_Pagamento := DT_Pagamento[1] + DT_Pagamento[2] + '/' + DT_Pagamento[3] + DT_Pagamento[4] + '/' + DT_Pagamento[5] + DT_Pagamento[6] + DT_Pagamento[7] + DT_Pagamento[8];
                           DT_Pagamento := Trim(DT_Pagamento);

                           Vlr_Juros := Copy(Linha,18,15);
                           Vlr_Juros := Vlr_Juros[1] + Vlr_Juros[2] + Vlr_Juros[3] + Vlr_Juros[4] + Vlr_Juros[5] + Vlr_Juros[6] + Vlr_Juros[7] + Vlr_Juros[8] + Vlr_Juros[9] + Vlr_Juros[10] + Vlr_Juros[11] + Vlr_Juros[12] + Vlr_Juros[13] + '.' +  Vlr_Juros[14] + Vlr_Juros[15];
                           Vlr_Juros := Trim(Vlr_Juros);

                           Vlr_Pagamento := Copy(Linha,78,15);
                           Vlr_Pagamento := Vlr_Pagamento[1] + Vlr_Pagamento[2] + Vlr_Pagamento[3] + Vlr_Pagamento[4] + Vlr_Pagamento[5] + Vlr_Pagamento[6] + Vlr_Pagamento[7] + Vlr_Pagamento[8] + Vlr_Pagamento[9] + Vlr_Pagamento[10] + Vlr_Pagamento[11] + Vlr_Pagamento[12] + Vlr_Pagamento[13] + '.' +  Vlr_Pagamento[14] + Vlr_Pagamento[15];
                           Vlr_Pagamento := Trim(Vlr_Pagamento);

                           Baixa := '1';

                           If Localiza_Caracter(Trim(Nro_Documento), 'A') Then
                              Begin
                              Baixa := '1';
                              End
                           Else If Localiza_Caracter(Trim(Nro_Documento), 'B') Then
                              Begin
                              Baixa := '2';
                              End
                           Else If Localiza_Caracter(Trim(Nro_Documento), 'C') Then
                              Begin
                              Baixa := '3';
                           End;

                           //*** Processa a Ibrasmak ***

                           If Trim(Cod_Empresa) = '30863575000107' Then
                              Begin

                              If Baixa = '1' Then
                                 Begin
                                 Comando_SQL := 'Update fb_notas_fiscais Set ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_1 ='+#39+Trim(Cod_Bancario)+#39+', ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_1 ='+#39+Inverte_Data_Plus(Trim(DT_Pagamento),'amd','/')+#39+', ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_1 ='+Virgula_Ponto(Vlr_Juros)+', ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_1 ='+Virgula_Ponto(Vlr_Pagamento)+' ';
                                 Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_dup_nro_1 = '+#39+Trim(Nro_Documento)+#39+') And (fb_nota_fiscal_tipo_fatura ='+#39+ 'Nota Fiscal' +#39+')';
                                 End
                              Else if Baixa = '2' Then
                                 Begin
                                 Comando_SQL := 'Update fb_notas_fiscais Set ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_2 ='+#39+Trim(Cod_Bancario)+#39+', ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_2 ='+#39+Inverte_Data_Plus(Trim(DT_Pagamento),'amd','/')+#39+', ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_2 ='+Virgula_Ponto(Vlr_Juros)+', ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_2 ='+Virgula_Ponto(Vlr_Pagamento)+' ';
                                 Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_dup_nro_2 = '+#39+Trim(Nro_Documento)+#39+') And (fb_nota_fiscal_tipo_fatura ='+#39+ 'Nota Fiscal' +#39+')';
                                 End
                              Else
                                 Begin
                                 Comando_SQL := 'Update fb_notas_fiscais Set ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_3 ='+#39+Trim(Cod_Bancario)+#39+', ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_3 ='+#39+Inverte_Data_Plus(Trim(DT_Pagamento),'amd','/')+#39+', ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_3 ='+Virgula_Ponto(Vlr_Juros)+', ';
                                 Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_3 ='+Virgula_Ponto(Vlr_Pagamento)+' ';
                                 Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_dup_nro_3 = '+#39+Trim(Nro_Documento)+#39+') And (fb_nota_fiscal_tipo_fatura ='+#39+ 'Nota Fiscal' +#39+')';
                              End;

                              ConexaoBD.SQL_Comunitario.Close;
                              ConexaoBD.SQL_Comunitario.SQL.Clear;
                              ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                              ConexaoBD.SQL_Comunitario.ExecSQL;

                              //Atualiza o Cadastro de Clientes
                              If Trim(DT_Pagamento) <> '/  /' Then
                                 Begin
                                 Comando_SQL := 'Update fb_clientes Set ';
                                 Comando_SQL := Comando_SQL + 'fb_cliente_status_credito ='+#39+'N'+#39+' ';
                                 Comando_SQL := Comando_SQL + 'Where fb_cliente_codigo = '+#39+Trim(Cod_Cliente)+#39;

                                 ConexaoBD.SQL_Comunitario.Close;
                                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                                 ConexaoBD.SQL_Comunitario.ExecSQL;
                              End;

                              End

                           //*** Processa a Vital ***

                           Else If Trim(Cod_Empresa) = '48558779000191' Then
                              Begin

                              If Baixa = '1' Then
                                 Begin
                                 Comando_SQL := 'Update vt_notas_fiscais Set ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_cod_bco_1 ='+#39+Trim(Cod_Bancario)+#39+', ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_dt_pgto_1 ='+#39+Inverte_Data_Plus(Trim(DT_Pagamento),'amd','/')+#39+', ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_vlr_juros_1 ='+Virgula_Ponto(Vlr_Juros)+', ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_vlr_pgto_1 ='+Virgula_Ponto(Vlr_Pagamento)+' ';
                                 Comando_SQL := Comando_SQL + 'Where (vt_nota_fiscal_dup_nro_1 = '+#39+Trim(Nro_Documento)+#39+') And (vt_nota_fiscal_tipo_fatura ='+#39+ 'Nota Fiscal' +#39+')';
                                 End
                              Else if Baixa = '2' Then
                                 Begin
                                 Comando_SQL := 'Update vt_notas_fiscais Set ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_cod_bco_2 ='+#39+Trim(Cod_Bancario)+#39+', ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_dt_pgto_2 ='+#39+Inverte_Data_Plus(Trim(DT_Pagamento),'amd','/')+#39+', ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_vlr_juros_2 ='+Virgula_Ponto(Vlr_Juros)+', ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_vlr_pgto_2 ='+Virgula_Ponto(Vlr_Pagamento)+' ';
                                 Comando_SQL := Comando_SQL + 'Where (vt_nota_fiscal_dup_nro_2 = '+#39+Trim(Nro_Documento)+#39+') And (vt_nota_fiscal_tipo_fatura ='+#39+ 'Nota Fiscal' +#39+')';
                                 End
                              Else
                                 Begin
                                 Comando_SQL := 'Update vt_notas_fiscais Set ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_cod_bco_3 ='+#39+Trim(Cod_Bancario)+#39+', ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_dt_pgto_3 ='+#39+Inverte_Data_Plus(Trim(DT_Pagamento),'amd','/')+#39+', ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_vlr_juros_3 ='+Virgula_Ponto(Vlr_Juros)+', ';
                                 Comando_SQL := Comando_SQL + 'vt_nota_fiscal_dup_vlr_pgto_3 ='+Virgula_Ponto(Vlr_Pagamento)+' ';
                                 Comando_SQL := Comando_SQL + 'Where (vt_nota_fiscal_dup_nro_3 = '+#39+Trim(Nro_Documento)+#39+') And (vt_nota_fiscal_tipo_fatura ='+#39+ 'Nota Fiscal' +#39+')';
                              End;

                              ConexaoBD.SQL_Comunitario.Close;
                              ConexaoBD.SQL_Comunitario.SQL.Clear;
                              ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                              ConexaoBD.SQL_Comunitario.ExecSQL;

                              //Atualiza o Cadastro de Clientes
                              If Trim(DT_Pagamento) <> '/  /' Then
                                 Begin
                                 Comando_SQL := 'Update vt_clientes Set ';
                                 Comando_SQL := Comando_SQL + 'vt_cliente_status_credito ='+#39+'N'+#39+' ';
                                 Comando_SQL := Comando_SQL + 'Where vt_cliente_codigo = '+#39+Trim(Cod_Cliente)+#39;

                                 ConexaoBD.SQL_Comunitario.Close;
                                 ConexaoBD.SQL_Comunitario.SQL.Clear;
                                 ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                                 ConexaoBD.SQL_Comunitario.ExecSQL;
                              End;

                           End;
                        End;
                     End;
                  End;

                  Readln(Arq_Retorno,Linha);
            End;

            CloseFile(Arq_Retorno);

            End

         //*** Bradesco ***

         Else If ((UpperCase(Trim(Tipo_Arquivo)) = 'CB0') Or (UpperCase(Trim(Tipo_Arquivo)) = 'CB1') Or (UpperCase(Trim(Tipo_Arquivo)) = 'CB2') Or (UpperCase(Trim(Tipo_Arquivo)) = 'CB3')) Then
            Begin
            AssignFile(Arq_Retorno,Nome_Arq_Retorno);
            Reset(Arq_Retorno);
            Readln(Arq_Retorno,Linha);

            Ponteiro      := '';
            Tipo_Registro := '';
            Cod_Empresa   := '';
            Cod_Cliente   := '';

            While Not Eof(Arq_Retorno) Do
                  Begin
                  If Trim(Ponteiro) = '' Then
                     Begin
                     Ponteiro := ' - ';
                     End
                  Else If Ponteiro = ' - ' Then
                     Begin
                     Ponteiro := ' \ ';
                     End
                  Else If Ponteiro = ' \ ' Then
                     Begin
                     Ponteiro := ' | ';
                     End
                  Else If Ponteiro = ' | ' Then
                     Begin
                     Ponteiro := ' / ';
                     End
                  Else If Ponteiro = ' / ' Then
                     Begin
                     Ponteiro := ' - ';
                  End;

                  Arquivos_Obtidos.Cells[1,Ind] := Ponteiro;
                  Arquivos_Obtidos.Refresh;

                  Exibe_Progresso.Caption  := 'Lendo Arquivo: ' + Trim(Nome_Arq_Retorno) + ': ' + Ponteiro;
                  Exibe_Progresso.Refresh;

                  //*** Registrando os Dados de Retorno ***

                  Tipo_Registro := Copy(Linha,1,1);

                  If Trim(Tipo_Registro) = '0' Then
                     Begin
                     Cod_Empresa := Copy(Linha,40,7);

                     If Trim(Cod_Empresa) = '4036057' Then
                        Begin
                        Cod_Empresa := '30863575000107';
                        End
                     Else
                        Begin
                        Cod_Empresa := '48558779000191';
                     End;
                  End;

                  If Trim(Tipo_Registro) = '1' Then
                     Begin
                     //*** Obtem Dados de Baixa ***

                     Cod_Bancario  := Copy(Linha,127,20);
                     Cod_Movimento := Copy(Linha,109,2);
                     Nro_Documento := Copy(Linha,076,5);

                     Vlr_Documento := Copy(Linha,153,13);
                     Vlr_Documento := Vlr_Documento[1] + Vlr_Documento[2] + Vlr_Documento[3] + Vlr_Documento[4] + Vlr_Documento[5] + Vlr_Documento[6] + Vlr_Documento[7] + Vlr_Documento[8] + Vlr_Documento[9] + Vlr_Documento[10] + Vlr_Documento[11] + '.' + Vlr_Documento[12] + Vlr_Documento[13];
                     Vlr_Documento := Trim(Vlr_Documento);

                     Vlr_Pagamento := Copy(Linha,254,13);
                     Vlr_Pagamento := Vlr_Pagamento[1] + Vlr_Pagamento[2] + Vlr_Pagamento[3] + Vlr_Pagamento[4] + Vlr_Pagamento[5] + Vlr_Pagamento[6] + Vlr_Pagamento[7] + Vlr_Pagamento[8] + Vlr_Pagamento[9] + Vlr_Pagamento[10] + Vlr_Pagamento[11] + '.' + Vlr_Pagamento[12] + Vlr_Pagamento[13];
                     Vlr_Pagamento := Trim(Vlr_Pagamento);

                     If (StrToFloat(Ponto_Virgula(Trim(Vlr_Pagamento))) > 0) Then
                        Begin
                        DT_Pagamento := Copy(Linha,296,6);
                        DT_Pagamento := DT_Pagamento[1] + DT_Pagamento[2] + '/' + DT_Pagamento[3] + DT_Pagamento[4] + '/20' + DT_Pagamento[5] + DT_Pagamento[6];
                        DT_Pagamento := Trim(DT_Pagamento);

                        Vlr_Juros := Copy(Linha,267,13);
                        Vlr_Juros := Vlr_Juros[1] + Vlr_Juros[2] + Vlr_Juros[3] + Vlr_Juros[4] + Vlr_Juros[5] + Vlr_Juros[6] + Vlr_Juros[7] + Vlr_Juros[8] + Vlr_Juros[9] + Vlr_Juros[10] + Vlr_Juros[11] + '.' + Vlr_Juros[12] + Vlr_Juros[13];
                        Vlr_Juros := Trim(Vlr_Juros);

                        Baixa := Copy(Linha,081,1);

                        //*** Processa a Ibrasmak ***

                        If Trim(Cod_Empresa) = '30863575000107' Then
                           Begin

                           If Baixa = '1' Then
                              Begin
                              Comando_SQL := 'Update fb_notas_fiscais Set ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_1 ='+#39+Trim(Cod_Bancario)+#39+', ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_1 ='+#39+Inverte_Data_Plus(Trim(DT_Pagamento),'amd','/')+#39+', ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_1 ='+Virgula_Ponto(Vlr_Juros)+', ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_1 ='+Virgula_Ponto(Vlr_Pagamento)+' ';
                              Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_dup_nro_1 = '+#39+Trim(Nro_Documento)+#39+' Or fb_nota_fiscal_dup_nro_1 = '+#39+Trim(Nro_Documento)+'A'+#39+') And (fb_nota_fiscal_tipo_fatura ='+#39+ 'Nota Fiscal' +#39+')';
                              End
                           Else if Baixa = '2' Then
                              Begin
                              Comando_SQL := 'Update fb_notas_fiscais Set ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_2 ='+#39+Trim(Cod_Bancario)+#39+', ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_2 ='+#39+Inverte_Data_Plus(Trim(DT_Pagamento),'amd','/')+#39+', ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_2 ='+Virgula_Ponto(Vlr_Juros)+', ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_2 ='+Virgula_Ponto(Vlr_Pagamento)+' ';
                              Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_dup_nro_2 = '+#39+Trim(Nro_Documento)+#39+' Or fb_nota_fiscal_dup_nro_2 = '+#39+Trim(Nro_Documento)+'B'+#39+') And (fb_nota_fiscal_tipo_fatura ='+#39+ 'Nota Fiscal' +#39+')';
                              End
                           Else
                              Begin
                              Comando_SQL := 'Update fb_notas_fiscais Set ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_3 ='+#39+Trim(Cod_Bancario)+#39+', ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_3 ='+#39+Inverte_Data_Plus(Trim(DT_Pagamento),'amd','/')+#39+', ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_3 ='+Virgula_Ponto(Vlr_Juros)+', ';
                              Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_3 ='+Virgula_Ponto(Vlr_Pagamento)+' ';
                              Comando_SQL := Comando_SQL + 'Where (fb_nota_fiscal_dup_nro_3 = '+#39+Trim(Nro_Documento)+#39+' Or fb_nota_fiscal_dup_nro_3 = '+#39+Trim(Nro_Documento)+'C'+#39+') And (fb_nota_fiscal_tipo_fatura ='+#39+ 'Nota Fiscal' +#39+')';
                           End;

                           ConexaoBD.SQL_Comunitario.Close;
                           ConexaoBD.SQL_Comunitario.SQL.Clear;
                           ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                           ConexaoBD.SQL_Comunitario.ExecSQL;

                           //Atualiza o Cadastro de Clientes
                           If Trim(DT_Pagamento) <> '/  /' Then
                              Begin

                              If Baixa = '1' Then
                                 Begin
                                 Comando_SQL := 'Select * From fb_notas_fiscais Where (fb_nota_fiscal_dup_nro_1 = '+#39+Trim(Nro_Documento)+#39+' Or fb_nota_fiscal_dup_nro_1 = '+#39+Trim(Nro_Documento)+'A'+#39+')';
                                 End
                              Else If Baixa = '2' Then
                                 Begin
                                 Comando_SQL := 'Select * From fb_notas_fiscais Where (fb_nota_fiscal_dup_nro_2 = '+#39+Trim(Nro_Documento)+#39+' Or fb_nota_fiscal_dup_nro_2 = '+#39+Trim(Nro_Documento)+'B'+#39+')';
                                 End
                              Else
                                 Begin
                                 Comando_SQL := 'Select * From fb_notas_fiscais Where (fb_nota_fiscal_dup_nro_3 = '+#39+Trim(Nro_Documento)+#39+' Or fb_nota_fiscal_dup_nro_3 = '+#39+Trim(Nro_Documento)+'C'+#39+')';
                              End;

                              ConexaoBD.SQL_FB_Nota_Fiscal.Close;
                              ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
                              ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
                              ConexaoBD.SQL_FB_Nota_Fiscal.Open;

                              Cod_Cliente := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text;

                              Comando_SQL := 'Update fb_clientes Set ';
                              Comando_SQL := Comando_SQL + 'fb_cliente_status_credito ='+#39+'N'+#39+' ';
                              Comando_SQL := Comando_SQL + 'Where fb_cliente_codigo = '+#39+Trim(Cod_Cliente)+#39;

                              ConexaoBD.SQL_Comunitario.Close;
                              ConexaoBD.SQL_Comunitario.SQL.Clear;
                              ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                              ConexaoBD.SQL_Comunitario.ExecSQL;
                           End;
                        End;
                     End;
                  End;

                  Readln(Arq_Retorno,Linha);
            End;

            CloseFile(Arq_Retorno);

         End;

         //*** Apaga o Arquivo Lido ***

         DeleteFile(Nome_Arq_Retorno);

         //*** Exibe aviso de Término ***

         Arquivos_Obtidos.Cells[1,Ind] := 'Ok';
         Arquivos_Obtidos.Refresh;
     End;

     //*** Encerra a Importação ***

     Exibe_Progresso.Caption  := 'Importação Finalizada';
     Exibe_Progresso.Refresh;

     BT_Importar.Enabled := False;
end;

procedure TArquivoRetorno00.FormClose(Sender: TObject;
  var Action: TCloseAction);

var
   Comando_SQL, Cod_Cliente, Nro_Documento: String;

begin
    //*** Atualiza o Cadastro da Ibrasmak ***

    Ampulheta();

    //*** Verifica Valores Pagos com Zero ***

    //*** Ibrasmak ***

    //*** Baixa 1 ***

    Exibe_Progresso.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 1';
    Exibe_Progresso.Refresh;

    Comando_SQL := 'Select * From fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '((fb_nota_fiscal_dup_dt_pgto_1 <> '+#39+#39+' And fb_nota_fiscal_dup_dt_pgto_1 <> '+#39+'0000-00-00'+#39+' And fb_nota_fiscal_dup_dt_pgto_1 <> '+#39+'0'+#39+') And fb_nota_fiscal_dup_vlr_pgto_1 <= 0)';

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Nota_Fiscal.First;

       While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
             Begin
             Nro_Documento := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

             Exibe_Progresso.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 1 - Nro.: '+Trim(Nro_Documento);
             Exibe_Progresso.Refresh;

             Comando_SQL := 'Update fb_notas_fiscais Set ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_1 ='+#39+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_1 ='+#39+'0000-00-00'+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_1 = 0.00, ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_1 = 0.00 ';
             Comando_SQL := Comando_SQL + 'Where fb_nota_fiscal_numero = '+Trim(Nro_Documento);

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Nota_Fiscal.Next;
       End
    End;

    //*** Baixa 2 ***

    Exibe_Progresso.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 2';
    Exibe_Progresso.Refresh;

    Comando_SQL := 'Select * From fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '((fb_nota_fiscal_dup_dt_pgto_2 <> '+#39+#39+' And fb_nota_fiscal_dup_dt_pgto_2 <> '+#39+'0000-00-00'+#39+' And fb_nota_fiscal_dup_dt_pgto_2 <> '+#39+'0'+#39+') And fb_nota_fiscal_dup_vlr_pgto_2 <= 0)';

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Nota_Fiscal.First;

       While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
             Begin
             Nro_Documento := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

             Exibe_Progresso.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 2 - Nro.: '+Trim(Nro_Documento);
             Exibe_Progresso.Refresh;

             Comando_SQL := 'Update fb_notas_fiscais Set ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_2 ='+#39+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_2 ='+#39+'0000-00-00'+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_2 = 0.00, ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_2 = 0.00 ';
             Comando_SQL := Comando_SQL + 'Where fb_nota_fiscal_numero = '+Trim(Nro_Documento);

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Nota_Fiscal.Next;
       End
    End;

    //*** Baixa 3 ***

    Exibe_Progresso.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 3';
    Exibe_Progresso.Refresh;

    Comando_SQL := 'Select * From fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '((fb_nota_fiscal_dup_dt_pgto_3 <> '+#39+#39+' And fb_nota_fiscal_dup_dt_pgto_3 <> '+#39+'0000-00-00'+#39+' And fb_nota_fiscal_dup_dt_pgto_3 <> '+#39+'0'+#39+') And fb_nota_fiscal_dup_vlr_pgto_3 <= 0)';

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
       Begin
       ConexaoBD.SQL_FB_Nota_Fiscal.First;

       While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
             Begin
             Nro_Documento := ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

             Exibe_Progresso.Caption  := 'Pagtos Zerados... Ibrasmak - Baixa 3 - Nro.: '+Trim(Nro_Documento);
             Exibe_Progresso.Refresh;

             Comando_SQL := 'Update fb_notas_fiscais Set ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_cod_bco_3 ='+#39+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_dt_pgto_3 ='+#39+'0000-00-00'+#39+', ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_juros_3 = 0.00, ';
             Comando_SQL := Comando_SQL + 'fb_nota_fiscal_dup_vlr_pgto_3 = 0.00 ';
             Comando_SQL := Comando_SQL + 'Where fb_nota_fiscal_numero = '+Trim(Nro_Documento);

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;

             ConexaoBD.SQL_FB_Nota_Fiscal.Next;
       End
    End;

    //*** Atualiza o Cadastro da Ibrasmak ***

    Exibe_Progresso.Caption := 'Aguarde... Atualizando Cadastros... Ibrasmak.';
    Exibe_Progresso.Refresh;

    //*** Verifica as Notas Fiscais ***

    Comando_SQL := 'Select * From fb_notas_fiscais Where ';
    Comando_SQL := Comando_SQL + '(((((fb_nota_fiscal_dup_dt_vcto_1 + 5) <= CURDATE()) and (fb_nota_fiscal_dup_dt_pgto_1 = '+#39+#39+' Or fb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0000-00-00'+#39+' Or fb_nota_fiscal_dup_dt_pgto_1 = '+#39+'0'+#39+') and (fb_nota_fiscal_dup_forma_1 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_1 <> '+#39+'0'+#39+')) or ';
    Comando_SQL := Comando_SQL + '(((fb_nota_fiscal_dup_dt_vcto_2 + 5) <= CURDATE()) and (fb_nota_fiscal_dup_dt_pgto_2 = '+#39+#39+' Or fb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0000-00-00'+#39+' Or fb_nota_fiscal_dup_dt_pgto_2 = '+#39+'0'+#39+') and (fb_nota_fiscal_dup_forma_2 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_2 <> '+#39+'0'+#39+')) or ';
    Comando_SQL := Comando_SQL + '(((fb_nota_fiscal_dup_dt_vcto_3 + 5) <= CURDATE()) and (fb_nota_fiscal_dup_dt_pgto_3 = '+#39+#39+' Or fb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0000-00-00'+#39+' Or fb_nota_fiscal_dup_dt_pgto_3 = '+#39+'0'+#39+') and (fb_nota_fiscal_dup_forma_3 <> '+#39+#39+' and fb_nota_fiscal_dup_forma_3 <> '+#39+'0'+#39+'))) and ';
    Comando_SQL := Comando_SQL + '(fb_nota_fiscal_natureza_oper = '+#39+'Vendas'+#39+'))';

    ConexaoBD.SQL_FB_Nota_Fiscal.Close;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
    ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Nota_Fiscal.Open;

    If ConexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
      Begin
      ConexaoBD.SQL_FB_Nota_Fiscal.First;

      While Not ConexaoBD.SQL_FB_Nota_Fiscal.Eof Do
        Begin
        Cod_Cliente := Trim(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text);

        Comando_SQL := 'Update fb_clientes Set ';
        Comando_SQL := Comando_SQL + 'fb_cliente_status_credito ='+#39+'S'+#39+' ';
        Comando_SQL := Comando_SQL + 'Where fb_cliente_codigo = '+#39+Trim(Cod_Cliente)+#39;

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        ConexaoBD.SQL_FB_Nota_Fiscal.Next;

        Exibe_Progresso.Caption := 'Ibrasmak - Nota Fiscal - Código do Cliente: '+Trim(Cod_Cliente);
        Exibe_Progresso.Refresh;
      End;
    End;

    //*** Verifica as Papeletas ***

    Comando_SQL := 'Select * From fb_papeletas Where ';
    Comando_SQL := Comando_SQL + '(((((fb_papeleta_dup_dt_vcto_1 + 5) <= CURDATE()) and (fb_papeleta_dup_dt_pgto_1 = '+#39+#39+' Or fb_papeleta_dup_dt_pgto_1 = '+#39+'0000-00-00'+#39+' Or fb_papeleta_dup_dt_pgto_1 = '+#39+'0'+#39+') and (fb_papeleta_dup_forma_1 <> '+#39+#39+' and fb_papeleta_dup_forma_1 <> '+#39+'0'+#39+')) or ';
    Comando_SQL := Comando_SQL + '(((fb_papeleta_dup_dt_vcto_2 + 5) <= CURDATE()) and (fb_papeleta_dup_dt_pgto_2 = '+#39+#39+' Or fb_papeleta_dup_dt_pgto_2 = '+#39+'0000-00-00'+#39+' Or fb_papeleta_dup_dt_pgto_2 = '+#39+'0'+#39+') and (fb_papeleta_dup_forma_2 <> '+#39+#39+' and fb_papeleta_dup_forma_2 <> '+#39+'0'+#39+')) or ';
    Comando_SQL := Comando_SQL + '(((fb_papeleta_dup_dt_vcto_3 + 5) <= CURDATE()) and (fb_papeleta_dup_dt_pgto_3 = '+#39+#39+' Or fb_papeleta_dup_dt_pgto_3 = '+#39+'0000-00-00'+#39+' Or fb_papeleta_dup_dt_pgto_3 = '+#39+'0'+#39+') and (fb_papeleta_dup_forma_3 <> '+#39+#39+' and fb_papeleta_dup_forma_3 <> '+#39+'0'+#39+'))) and ';
    Comando_SQL := Comando_SQL + '(fb_papeleta_natureza_oper = '+#39+'Vendas'+#39+'))';

    ConexaoBD.SQL_FB_Papeletas.Close;
    ConexaoBD.SQL_FB_Papeletas.SQL.Clear;
    ConexaoBD.SQL_FB_Papeletas.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_FB_Papeletas.Open;

    If ConexaoBD.SQL_FB_Papeletas.RecordCount > 0 Then
      Begin
      ConexaoBD.SQL_FB_Papeletas.First;

      While Not ConexaoBD.SQL_FB_Papeletas.Eof Do
            Begin
            Cod_Cliente := Trim(ConexaoBD.SQL_FB_Papeletasfb_papeleta_codigo.Text);

            Comando_SQL := 'Update fb_clientes Set ';
            Comando_SQL := Comando_SQL + 'fb_cliente_status_credito ='+#39+'S'+#39+' ';
            Comando_SQL := Comando_SQL + 'Where fb_cliente_codigo = '+#39+Trim(Cod_Cliente)+#39;

            ConexaoBD.SQL_Comunitario.Close;
            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario.ExecSQL;

            ConexaoBD.SQL_FB_Papeletas.Next;

            Exibe_Progresso.Caption := 'Ibrasmak - Papeleta - Código do Cliente: '+Trim(Cod_Cliente);
            Exibe_Progresso.Refresh;
      End;
    End;

    Seta();
end;

end.
