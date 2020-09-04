unit Arquivo_Integracao_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellAPI, Mapi, Mask;

type
  TArquivoIntegracao00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    BT_Sair: TBitBtn;
    BT_Gerar: TBitBtn;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Exibe_Integracao: TLabel;
    Label5: TLabel;
    DT_Inicial: TMaskEdit;
    Label6: TLabel;
    DT_Fim: TMaskEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_GerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Integracao_MesKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DT_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure DT_FimKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function SendEMail(Handle: THandle; Mail: TStrings): Cardinal;
    procedure Gera_Integracao();

  public
    { Public declarations }
  end;

var
  ArquivoIntegracao00: TArquivoIntegracao00;

implementation

uses DateUtils, Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TArquivoIntegracao00.SendEMail(Handle: THandle; Mail: TStrings): Cardinal;
type
  TAttachAccessArray = array [0..0] of TMapiFileDesc;
  PAttachAccessArray = ^TAttachAccessArray;
var
  MapiMessage: TMapiMessage;
  Receip: TMapiRecipDesc;
  Attachments: PAttachAccessArray;
  AttachCount: Integer;
  i1: integer;
  FileName: string;
  dwRet: Cardinal;
  MAPI_Session: Cardinal;
  WndList: Pointer;
begin
  dwRet := MapiLogon(Handle,PChar(''),PChar(''),MAPI_LOGON_UI or MAPI_NEW_SESSION,0, @MAPI_Session);

  if (dwRet <> SUCCESS_SUCCESS) then
    begin
    MessageBox(Handle,PChar('Error while trying to send email'),PChar('Error'),MB_ICONERROR or MB_OK);
    end
  else
    begin
    FillChar(MapiMessage, SizeOf(MapiMessage), #0);
    Attachments := nil;
    FillChar(Receip, SizeOf(Receip), #0);

    if Mail.Values['to'] <> '' then
      begin
      Receip.ulReserved := 0;
      Receip.ulRecipClass := MAPI_TO;
      Receip.lpszName := StrNew(PChar(Mail.Values['to']));
      Receip.lpszAddress := StrNew(PChar('SMTP:' + Mail.Values['to']));
      Receip.ulEIDSize := 0;

      MapiMessage.nRecipCount := 1;
      MapiMessage.lpRecips := @Receip;
    end;

    AttachCount := 0;

    for i1 := 0 to MaxInt do
      begin
      if Mail.Values['attachment' + IntToStr(i1)] = '' then break;
      Inc(AttachCount);
    end;

    if AttachCount > 0 then
      begin
      GetMem(Attachments, SizeOf(TMapiFileDesc) * AttachCount);

      for i1 := 0 to AttachCount - 1 do
        begin
        FileName := Mail.Values['attachment' + IntToStr(i1)];
        Attachments[i1].ulReserved := 0;
        Attachments[i1].flFlags := 0;
        Attachments[i1].nPosition := ULONG($FFFFFFFF);
        Attachments[i1].lpszPathName := StrNew(PChar(FileName));
        Attachments[i1].lpszFileName := StrNew(PChar(ExtractFileName(FileName)));
        Attachments[i1].lpFileType := nil;
      end;

      MapiMessage.nFileCount := AttachCount;
      MapiMessage.lpFiles := @Attachments^;
    end;

    if Mail.Values['subject'] <> '' then MapiMessage.lpszSubject := StrNew(PChar(Mail.Values['subject']));
    if Mail.Values['body'] <> '' then MapiMessage.lpszNoteText := StrNew(PChar(Mail.Values['body']));

    WndList := DisableTaskWindows(0);

    try
      Result := MapiSendMail(MAPI_Session, Handle, MapiMessage, MAPI_DIALOG, 0);
    finally
      EnableTaskWindows( WndList );
    end;

    for i1 := 0 to AttachCount - 1 do
      begin
      StrDispose(Attachments[i1].lpszPathName);
      StrDispose(Attachments[i1].lpszFileName);
    end;

    if Assigned(MapiMessage.lpszSubject) then StrDispose(MapiMessage.lpszSubject);
    if Assigned(MapiMessage.lpszNoteText) then StrDispose(MapiMessage.lpszNoteText);
    if Assigned(Receip.lpszAddress) then StrDispose(Receip.lpszAddress);
    if Assigned(Receip.lpszName) then StrDispose(Receip.lpszName);

    MapiLogOff(MAPI_Session, Handle, 0, 0);
  end;
end;

//******************
//*** Procedures ***
//******************

procedure TArquivoIntegracao00.Gera_Integracao();

var
   Ultimo_Registro, Material_Consumo: Boolean;

   Impressora, Arq_Integracao_Entrada, Arq_Integracao_Saida, Arq_Integracao_Leitura: TextFile;
   Linha, Ind, Qtde_Notas, Conta_Linha: Integer;
   Comando_SQL, Nome_Arq_Integracao_Entrada, Nome_Arq_Integracao_Saida, Nome_Arq_Integracao_Saida_R54, Nome_Arq_Integracao_Entrada_R54, Nome_Arq_Integracao_Saida_R75, Nome_Arq_Integracao_Entrada_R75, Grava_Linha, Linha_Leitura, DT_Inicio, DT_Final, Dia_Integracao, Mes_Integracao, Ano_Integracao, Nota_Inicio, Nota_Final: String;
   Data_Emissao, Dia_Emissao, Mes_Emissao: String;
   Codigo_CFOP, CFOP_Str, Tipo_Nota, Classificacao_Fiscal, Classificacao_Tributaria: String;
   Aliquota_ICMS, CFOP_Nro: Integer;
   Aliquota_ICMS_Float, Aliquota_IPI, Aliquota_IPI_54_75, IPI_54_75, Diferenca_54_75, Diferenca_Base_54_75, Base_54_75, Base2_54_75: Real;
   Qtde_54_75, Qtde2_54_75: Integer;
   Aliquota_ICMS_Str: String;
   Vlr_Total, Vlr_Total_Separado, BC_ICMS_Isento, BC_ICMS_Reduzida, BC_ICMS_Normal, BC_ICMS_Normal_Separado, VLR_ICMS_Reduzida, VLR_ICMS_Separado, VLR_ICMS_Normal: Real;
   Vlr_Total_Str, Vlr_Total_Separado_Str, BC_ICMS_Isento_Str, BC_ICMS_Str, BC_ICMS_Separado_Str, Vlr_ICMS_Str, Vlr_ICMS_Separado_Str, Codigo_Cliente: String;

   BC_IPI_Isento, BC_IPI, BC_IPI_Separado, VLR_IPI, VLR_IPI_Separado, VLR_IPI_Isento, VLR_Pis_Cofins: Real;
   BC_IPI_Isento_Str, BC_IPI_Str, BC_IPI_Separado_Str, Vlr_IPI_Str, Vlr_IPI_Separado_Str, Vlr_IPI_Isento_Str, VLR_Pis_Cofins_Str: String;

   Desconto_PVV, ICMS_Fonte: Real;
   Desconto_PVV_Str, ICMS_Fonte_Str: String;

   Produto_Codigo, Produto_Descricao: String;

   Bonificacao: Real;

   Relacao_Arquivo: Array of String;

   Email, Anexo_Entrada, Anexo_Saida, Anexo_Saida_R54, Anexo_Saida_R75, Anexo_Entrada_R54, Anexo_Entrada_R75: string;
   mail: TStringList;

   Codigo_CFOP_2, Grava_CFOP, Vlr_Str: String;
   Posicao_Produto, Conta_Registro_50, Conta_Registro_54, Conta_Registro_75: Integer;

   Relacao_Produtos_Outro_CFOP: Array[0..50] of String;
   Ind_Produtos_CFOP: Integer;
   Outro_CFOP, Gera_Produto_Outro_CFOP: Boolean;
   Valor_Str: String;

begin
     Ampulheta();

     BT_Gerar.Enabled := False;
     BT_Sair.Enabled  := False;

     //***********************************
     //*** Geração das Notas de Saídas ***
     //***********************************

     DT_Inicio      := DT_Inicial.Text;
     DT_Final       := DT_Fim.Text;
     Mes_Integracao := Copy(Trim(DT_Fim.Text),4,2);

     //*** Efetua as Buscas das Notas de Saídas ***

     Comando_SQL := 'Select * from fb_notas_fiscais Where ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_data_emissao >= ' +#39+ Inverte_Data_Plus(Trim(DT_Inicio),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' And fb_nota_fiscal_data_emissao <= ' +#39+ Inverte_Data_Plus(Trim(DT_Final),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_numero';

     ConexaoBD.SQL_FB_Nota_Fiscal.Close;
     ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
     ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_FB_Nota_Fiscal.Open;

     //*** Prepara Array para Verificar as Notas Canceladas ***

     If conexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
        Begin

        //*** Prepara a Geração do Arquivo de Integração ***

        Nome_Arq_Integracao_Saida := 'IBRASMAK.S'+ Trim(Mes_Integracao);

        If FileExists('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida) Then
           Begin
           DeleteFile('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida);
        End;

        AssignFile(Arq_Integracao_Saida,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida);

        Rewrite(Arq_Integracao_Saida);

        //*** Gera as Notas Dentro do Arquivo ***

        Exibe_Integracao.Caption := 'Aguarde...';
        Exibe_Integracao.Refresh;

        Exibe_Integracao.Caption := 'Gerando Notas de Saídas...';
        Exibe_Integracao.Refresh;

        Dia_Emissao := '01';
        Mes_Emissao := Trim(Mes_Integracao);

        conexaoBD.SQL_FB_Nota_Fiscal.First;

        While Not conexaoBD.SQL_FB_Nota_Fiscal.Eof Do
            Begin

            Vlr_Total          := 0;
            Vlr_Total_Separado := 0;
            Vlr_Total          := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;

            Str(Vlr_Total:13:2,Valor_Str);
            Vlr_Total := StrToFloat(Ponto_Virgula(Valor_Str));

            //*** Início - Zera Produtos de Outro CFOP ***

            Outro_CFOP := False;

            For Ind_Produtos_CFOP := 0 To 50 Do
                Begin
                Relacao_Produtos_Outro_CFOP[Ind_Produtos_CFOP] := '';
            End;

            Ind_Produtos_CFOP := 0;

            //*** Final - Zera Produtos de Outro CFOP ***

            Nota_Inicio := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

            Exibe_Integracao.Caption := 'Posição - Saídas: ' + Nota_Inicio;
            Exibe_Integracao.Refresh;

            //If (UpperCase(Trim(DBG_Observacao_Nota.Text)) = 'MATERIAL DESTINA-SE PARA CONSUMO') And
            //   (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6.107') And
            //   (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6107') Then
            //   Begin
            //   Material_Consumo := True;
            //   End
            //Else
            //   Begin
               Material_Consumo := False;
            //End;

            CFOP_Str := Copy(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text,1,1);

            If Trim(CFOP_Str) = '' Then
               Begin
               CFOP_Str := '0';
            End;

            CFOP_Nro := StrToInt(CFOP_Str);

            If CFOP_Nro >= 5 Then
               Begin

               Data_Emissao := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;

               Dia_Emissao  := Gera_Zeros_Str((Data_Emissao[1]+Data_Emissao[2]),2);
               Mes_Emissao  := Gera_Zeros_Str((Data_Emissao[4]+Data_Emissao[5]),2);

               Codigo_CFOP   := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text;
               Codigo_CFOP_2 := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop_2.Text);

               If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_estado.Text) <> 'SP' Then
                  Begin

                  If Copy(Codigo_CFOP,1,1) = '5' Then
                     Begin
                     Codigo_CFOP := '6'+ Copy(Codigo_CFOP,2,4);
                     Codigo_CFOP := Trim(Codigo_CFOP);
                  End;
               End;

               If Vlr_Total > 0 Then
                  Begin
                  Aliquota_ICMS_Str := FloatToStr(((conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_icms.AsVariant) / ((Vlr_Total) - (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsVariant))) * 100);
                  Aliquota_ICMS_Str := Obtem_Antes(Aliquota_ICMS_Str,',');
                  Aliquota_ICMS := StrToInt(Aliquota_ICMS_Str);

                  If Aliquota_ICMS >= 17 Then
                     Begin
                     Aliquota_ICMS := 18;
                     End
                  Else If Aliquota_ICMS >= 11 Then
                     Begin
                     Aliquota_ICMS := 12;
                     End
                  Else If Aliquota_ICMS >= 6 Then
                     Begin
                     Aliquota_ICMS := 7;
                  End;

                  If (Trim(Codigo_CFOP_2) = '5.401') Or (Trim(Codigo_CFOP_2) = '5401') Then
                     Begin
                     Aliquota_ICMS := 18;
                  End;

                  End
               Else
                  Begin
                  Aliquota_ICMS := 0;
               End;

               Tipo_Nota     := '00';

               //*** Obtem os Produtos da Nota Fiscal ***

               BC_IPI_Isento           := 0;
               BC_IPI                  := 0;
               BC_IPI_Separado         := 0;
               VLR_IPI                 := 0;
               VLR_IPI_Separado        := 0;
               VLR_Pis_Cofins          := 0;

               BC_ICMS_Isento          := 0;
               BC_ICMS_Reduzida        := 0;
               BC_ICMS_Normal          := 0;
               BC_ICMS_Normal_Separado := 0;

               VLR_ICMS_Reduzida       := 0;
               VLR_ICMS_Normal         := 0;
               VLR_ICMS_Separado       := 0;

               Comando_SQL := 'Select * from fb_notas_fiscais_produtos Where ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_numero = ' + Trim(Nota_Inicio);
               Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_produto_codigo';

               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

               If conexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount > 0 Then
                  Begin

                  conexaoBD.SQL_FB_Nota_Fiscal_Produto.First;

                  While Not conexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof Do
                        Begin
                        Comando_SQL := 'Select * from fb_produtos Where ';
                        Comando_SQL := Comando_SQL + 'fb_produto_codigo = ' +#39+ Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text) +#39;
                        Comando_SQL := Comando_SQL + ' Order By fb_produto_codigo';

                        If Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text) <> '' Then
                           Begin
                           ConexaoBD.SQL_FB_Produtos.Close;
                           ConexaoBD.SQL_FB_Produtos.SQL.Clear;
                           ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
                           ConexaoBD.SQL_FB_Produtos.Open;

                           Classificacao_Fiscal := ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text;

                           ConexaoBD.SQL_FB_Produtos.Close;
                           End
                        Else
                           Begin
                           Classificacao_Fiscal := ' ';
                        End;

                        //*** Separa os Produtos de Outro CFOP ***

                        Gera_Produto_Outro_CFOP := False;

                        If Trim(Codigo_CFOP_2) <> '' Then
                           Begin

                           If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_estado.Text) = 'SP' Then
                              Begin

                              If (UpperCase(Trim(Classificacao_Fiscal)) = 'A') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'B') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'C') Then
                                 Begin
                                 Gera_Produto_Outro_CFOP                        := True;
                                 Outro_CFOP                                     := True;
                                 Relacao_Produtos_Outro_CFOP[Ind_Produtos_CFOP] := Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text);
                                 Ind_Produtos_CFOP                              := Ind_Produtos_CFOP + 1;
                              End;

                           End;
                        End;

                        If Gera_Produto_Outro_CFOP = False Then
                           Begin
                           BC_ICMS_Normal := BC_ICMS_Normal + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));
                           BC_IPI         := BC_IPI + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));
                           End
                        Else
                           Begin
                           Vlr_Total_Separado      := Vlr_Total_Separado + conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant;
                           BC_ICMS_Normal_Separado := BC_ICMS_Normal_Separado + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));
                           BC_IPI_Separado         := BC_IPI_Separado + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));

                           VLR_IPI_Separado        := VLR_IPI_Separado + ((StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text)) * StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.Text))) / 100);
                           VLR_ICMS_Separado       := VLR_ICMS_Separado + ((StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text)) * Aliquota_ICMS) / 100);
                        End;

                        conexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
                  End;
               End;

               //*** Preparacao para Impressao do ICMS ***

               //*** Monta a Linha de Gravação ***

               If (Trim(Codigo_CFOP_2) = '5.401') Or (Trim(Codigo_CFOP_2) = '5401') Then
                  Begin
                  Vlr_Total := (Vlr_Total - Vlr_Total_Separado) - VLR_IPI_Separado;
                  Str(Vlr_Total:13:2,Valor_Str);
                  Vlr_Total := StrToFloat(Ponto_Virgula(Valor_Str));
                  End
               Else
                  Begin
                  Vlr_Total := Vlr_Total - Vlr_Total_Separado;
                  Str(Vlr_Total:13:2,Valor_Str);
                  Vlr_Total := StrToFloat(Ponto_Virgula(Valor_Str));
               End;

               If Material_Consumo Then
                  Begin
                  Vlr_IPI     := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text));
                  Vlr_IPI     := Vlr_IPI - VLR_IPI_Separado;

                  Bonificacao := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_desconto.Text));

                  If Bonificacao > 0 Then
                     Begin
                     If BC_ICMS_Normal > 0 Then
                        Begin
                        BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
                     End;

                     If BC_ICMS_Reduzida > 0 Then
                        Begin
                        BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
                     End;
                  End;

                  VLR_ICMS_Normal   := (((BC_ICMS_Normal + Vlr_IPI) * Aliquota_ICMS) / 100);
                  VLR_ICMS_Reduzida := 0;

                  VLR_Pis_Cofins    := 0;
                  Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                  VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin
                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_ICMS_Isento := ((BC_ICMS_Normal + BC_ICMS_Reduzida) - (((BC_ICMS_Normal + BC_ICMS_Reduzida) * 7) / 100));
                        //Str(BC_ICMS_Isento:13:2,Valor_Str);
                        //BC_ICMS_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_ICMS_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_ICMS_Isento := (BC_ICMS_Normal + BC_ICMS_Reduzida);
                     End;

                     BC_ICMS_Normal    := 0;
                     BC_ICMS_Reduzida  := 0;

                     VLR_ICMS_Normal   := 0;
                     VLR_ICMS_Reduzida := 0;

                     Str(Vlr_Total:13:2,Vlr_Total_Str);

                     VLR_Pis_Cofins    := 0;
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 0.65) / 100);
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 3) / 100);
                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                     VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                     If ((Trim(Codigo_CFOP) = '5.901') Or (Trim(Codigo_CFOP) = '5901') Or (Trim(Codigo_CFOP) = '7.101') Or (Trim(Codigo_CFOP) = '7101')) Then
                        Begin
                        Vlr_Total      := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_ICMS_Isento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_IPI         := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        Str(Vlr_Total:13:2,Vlr_Total_Str);
                        VLR_Pis_Cofins    := 0;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                        End
                     Else If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        VLR_Pis_Cofins    := BC_ICMS_Isento;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                     End;

                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);

                     End
                  Else If ((Trim(Codigo_CFOP) = '6.107') Or (Trim(Codigo_CFOP) = '6107')) Then
                     Begin
                     Vlr_Total         := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text));
                     BC_ICMS_Normal    := Vlr_Total;
                     BC_ICMS_Reduzida  := 0;
                     VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  End;

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin
                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_IPI_Isento := (BC_IPI - ((BC_IPI * 7) / 100));
                        //Str(BC_IPI_Isento:13:2,Valor_Str);
                        //BC_IPI_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_IPI_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_IPI_Isento := BC_IPI;
                     End;

                     BC_IPI        := 0;
                     BC_IPI_Str    := '0.00';
                     Vlr_IPI_Str   := '0.00';
                     End
                  Else
                     Begin
                     Vlr_IPI_Str := '0.00';
                     //Str((BC_IPI + Vlr_IPI):13:2,BC_IPI_Str);
                     Str((BC_IPI):13:2,BC_IPI_Str);
                  End;

                  If Aliquota_ICMS <= 0 Then
                     Begin
                     BC_ICMS_Normal   := 0;
                     BC_ICMS_Reduzida := 0;
                  End;

                  Str(BC_IPI_Isento:13:2,BC_IPI_Isento_Str);

                  Str(BC_ICMS_Isento:13:2,BC_ICMS_Isento_Str);
                  Str(((BC_ICMS_Normal + BC_ICMS_Reduzida)+Vlr_IPI):13:2,BC_ICMS_Str);
                  Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);

                  End
               Else
                  Begin

                  Bonificacao := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_desconto.Text));

                  If Bonificacao > 0 Then
                     Begin
                     If BC_ICMS_Normal > 0 Then
                        Begin
                        BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
                     End;

                     If BC_ICMS_Reduzida > 0 Then
                        Begin
                        BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
                     End;
                  End;

                  VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  VLR_ICMS_Reduzida := 0;

                  VLR_Pis_Cofins    := 0;
                  Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                  VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_ICMS_Isento := ((BC_ICMS_Normal + BC_ICMS_Reduzida) - (((BC_ICMS_Normal + BC_ICMS_Reduzida) * 7) / 100));
                        //Str(BC_ICMS_Isento:13:2,Valor_Str);
                        //BC_ICMS_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_ICMS_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_ICMS_Isento := (BC_ICMS_Normal + BC_ICMS_Reduzida);
                     End;

                     BC_ICMS_Normal    := 0;
                     BC_ICMS_Reduzida  := 0;

                     VLR_ICMS_Normal   := 0;
                     VLR_ICMS_Reduzida := 0;

                     Str(Vlr_Total:13:2,Vlr_Total_Str);

                     VLR_Pis_Cofins    := 0;
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 0.65) / 100);
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 3) / 100);
                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                     VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                     If ((Trim(Codigo_CFOP) = '5.901') Or (Trim(Codigo_CFOP) = '5901') Or (Trim(Codigo_CFOP) = '7.101') Or (Trim(Codigo_CFOP) = '7101')) Then
                        Begin
                        Vlr_Total      := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_ICMS_Isento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_IPI         := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        Str(Vlr_Total:13:2,Vlr_Total_Str);
                        VLR_Pis_Cofins := 0;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                        End
                     Else If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        VLR_Pis_Cofins    := BC_ICMS_Isento;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                     End;

                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);

                     End
                  Else If ((Trim(Codigo_CFOP) = '6.107') Or (Trim(Codigo_CFOP) = '6107')) Then
                     Begin
                     Vlr_Total         := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text));
                     BC_ICMS_Normal    := Vlr_Total;
                     BC_ICMS_Reduzida  := 0;
                     VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  End;

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_IPI_Isento := (BC_IPI - ((BC_IPI * 7) / 100));
                        //Str(BC_IPI_Isento:13:2,Valor_Str);
                        //BC_IPI_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_IPI_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_IPI_Isento := BC_IPI;
                     End;

                     BC_IPI        := 0;
                     BC_IPI_Str    := '0.00';
                     Vlr_IPI_Str   := '0.00';
                     End
                  Else
                     Begin
                     Vlr_IPI := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text));
                     Vlr_IPI := Vlr_IPI - VLR_IPI_Separado;

                     If Vlr_IPI <= 0 Then
                        Begin
                        BC_IPI := 0;
                     End;

                     Str(BC_IPI:13:2,BC_IPI_Str);
                     Str(Vlr_IPI:13:2,Vlr_IPI_Str);
                  End;

                  If Aliquota_ICMS <= 0 Then
                     Begin
                     BC_ICMS_Normal   := 0;
                     BC_ICMS_Reduzida := 0;
                  End;

                  Str(BC_IPI_Isento:13:2,BC_IPI_Isento_Str);

                  Str(BC_ICMS_Isento:13:2,BC_ICMS_Isento_Str);
                  Str((BC_ICMS_Normal + BC_ICMS_Reduzida):13:2,BC_ICMS_Str);
                  Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);

               End;

               //*** Primeira Linha + Valores de ICMS 1 ***

               Str(Vlr_Total:13:2,Vlr_Total_Str);

               Grava_Linha := 'R1' + Trim(Dia_Emissao) + Trim(Mes_Emissao) + Trim(Dia_Emissao) + Trim(Mes_Emissao) + '00NF    ' + Gera_Zeros_Str(Nota_Inicio, 6) + Gera_Zeros_Str('0', 6) + Gera_Espacos(Trim(Codigo_CFOP),5);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Total_Str),',')),12);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Str),',')),12);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(IntToStr(Aliquota_ICMS)),',')),2) + '0000';
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_ICMS_Str),',')),12);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Isento_Str),',')),12);
               Grava_linha := Grava_Linha + '000000000000';

               //*** Valores de ICMS 2 ***

               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';

               //*** Valores de ICMS 3 ***

               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';

               //*** Valores de ICMS 4 ***

               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';

               //*** Valores de ICMS 5 ***

               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';

               //*** Valores de IPI ***

               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_IPI_Str),',')),12);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_IPI_Str),',')),12);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_IPI_Isento_Str),',')),12);
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + '000000000000';
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(VLR_Pis_Cofins_Str),',')),12);
               Grava_linha := Grava_Linha + '0';
               Grava_linha := Grava_Linha + Trim(Tipo_Nota);
               Grava_linha := Grava_Linha + '00';
               Grava_linha := Grava_Linha + Gera_Espacos('',14);

               Codigo_Cliente := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text);

               Comando_SQL := 'Select * from fb_clientes Where ';
               Comando_SQL := Comando_SQL + 'fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39;
               Comando_SQL := Comando_SQL + ' Order By fb_cliente_codigo';

               ConexaoBD.SQL_FB_Clientes.Close;
               ConexaoBD.SQL_FB_Clientes.SQL.Clear;
               ConexaoBD.SQL_FB_Clientes.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Clientes.Open;

               If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo_tipo.Text) = 'CNPJ' Then
                  Begin
                  If Length(Trim(Codigo_Cliente)) < 11 Then
                     Begin
                     Codigo_Cliente := '';
                     End
                  Else
                     Begin
                     Codigo_Cliente := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                  End;
                  End
               Else
                  Begin
                  If Length(Trim(Codigo_Cliente)) < 11 Then
                     Begin
                     Codigo_Cliente := '';
                     End
                  Else
                     Begin
                     Codigo_Cliente := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                  End;
               End;

               Grava_linha := Grava_Linha + Gera_Espacos(Codigo_Cliente,14);
               Grava_linha := Grava_Linha + Gera_Espacos(Retira_Caracter(Retira_Caracter(Retira_Caracter(Copy(ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_estadual.Text,1,16),'.'),'-'),'/'),16);
               Grava_linha := Grava_Linha + Gera_Espacos(Copy(ConexaoBD.SQL_FB_Clientesfb_cliente_razao_social.Text,1,35),35);
               Grava_linha := Grava_Linha + Gera_Espacos('',18);
               Grava_linha := Grava_Linha + Gera_Espacos(Copy(ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text,1,2),2);
               Grava_linha := Grava_Linha + '0000';
               Grava_linha := Grava_Linha + Gera_Espacos('',50);

               ConexaoBD.SQL_FB_Clientes.Close;

               WriteLn(Arq_Integracao_Saida,Grava_Linha);

               //*************************************
               //*** INÍCIO - Gera os Registros R2 ***
               //*************************************

               Comando_SQL := 'Select * from fb_notas_fiscais_produtos Where ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_numero = ' + Trim(Nota_Inicio);
               Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_produto_codigo';

               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

               If conexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount > 0 Then
                  Begin

                  conexaoBD.SQL_FB_Nota_Fiscal_Produto.First;

                  While Not conexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof Do
                        Begin
                        Comando_SQL := 'Select * from fb_produtos Where ';
                        Comando_SQL := Comando_SQL + 'fb_produto_codigo = ' +#39+ Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text) +#39;
                        Comando_SQL := Comando_SQL + ' Order By fb_produto_codigo Desc';

                        ConexaoBD.SQL_FB_Produtos.Close;
                        ConexaoBD.SQL_FB_Produtos.SQL.Clear;
                        ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_FB_Produtos.Open;

                        If ConexaoBD.SQL_FB_Produtos.RecordCount > 0 Then
                           Begin

                           Gera_Produto_Outro_CFOP := False;
                           Classificacao_Fiscal    := Trim(conexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text);

                           If Trim(Codigo_CFOP_2) <> '' Then
                              Begin

                              If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_estado.Text) = 'SP' Then
                                 Begin

                                 If (UpperCase(Trim(Classificacao_Fiscal)) = 'A') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'B') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'C') Then
                                    Begin
                                    Gera_Produto_Outro_CFOP := True;
                                 End;

                              End;
                           End;

                           If Gera_Produto_Outro_CFOP = False Then
                              Begin

                              //*** Início - Obtem o NCM ***

                              Comando_SQL := 'Select * from classificacoes_fiscais_letras Where ';
                              Comando_SQL := Comando_SQL + 'classificacao_fiscal_letra_letra = ' +#39+ Trim(ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text) +#39;
                              Comando_SQL := Comando_SQL + ' Order By classificacao_fiscal_letra_ncm Desc';

                              ConexaoBD.SQL_Classificacao_Letra.Close;
                              ConexaoBD.SQL_Classificacao_Letra.SQL.Clear;
                              ConexaoBD.SQL_Classificacao_Letra.SQL.Add(Comando_SQL);
                              ConexaoBD.SQL_Classificacao_Letra.Open;

                              If ConexaoBD.SQL_Classificacao_Letra.RecordCount > 0 Then
                                 Begin
                                 Produto_Codigo    := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm.Text;
                                 Produto_Descricao := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm_descricao.Text;
                                 End
                              Else
                                 Begin
                                 Produto_Codigo    := '84385000';
                                 Produto_Descricao := 'MAQS.E APARS.P/PREPAR.DE CARNES';
                              End;

                              //*** Fim - Obtem o NCM ***

                              Produto_Codigo    := Retira_Caracter(Produto_Codigo,',');
                              Produto_Codigo    := Retira_Caracter(Produto_Codigo,'"');
                              Produto_Codigo    := Retira_Caracter(Produto_Codigo,'#39');
                              Produto_Codigo    := Retira_Caracter(Produto_Codigo,'.');

                              Produto_Descricao := Retira_Caracter(Produto_Descricao,',');
                              Produto_Descricao := Retira_Caracter(Produto_Descricao,'"');
                              Produto_Descricao := Retira_Caracter(Produto_Descricao,#39);

                              BC_IPI            := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));
                              VLR_IPI           := 0;
                              VLR_IPI_Isento    := 0;

                              If StrToFloat(Ponto_Virgula(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.Text))) <= 0 Then
                                 Begin

                                 //*** Início - Aliquota do IPI ***

                                 Aliquota_IPI := 0;

                                 If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Produtosfb_produto_ipi.Text)) <= 0 Then
                                    Begin

                                    If Trim(Produto_Codigo) = '84385000' Then
                                       Begin
                                       Aliquota_IPI := 15;
                                       End
                                    Else If Trim(Produto_Codigo) = '85365090' Then
                                       Begin
                                       Aliquota_IPI := 15;
                                       End
                                    Else If Trim(Produto_Codigo) = '85366990' Then
                                       Begin
                                       Aliquota_IPI := 15;
                                       End
                                    Else If Trim(Produto_Codigo) = '90309020' Then
                                       Begin
                                       Aliquota_IPI := 5;
                                       End
                                    Else If Trim(Produto_Codigo) = '85472000' Then
                                       Begin
                                       Aliquota_IPI := 15;
                                       End
                                    Else If Trim(Produto_Codigo) = '74082200' Then
                                       Begin
                                       Aliquota_IPI := 5;
                                       End
                                    Else If Trim(Produto_Codigo) = '85444100' Then
                                       Begin
                                       Aliquota_IPI := 5;
                                       End
                                    Else If Trim(Produto_Codigo) = '90184999' Then
                                       Begin
                                       Aliquota_IPI := 8;
                                       End
                                    Else If Trim(Produto_Codigo) = '39173230' Then
                                       Begin
                                       Aliquota_IPI := 5;
                                       End
                                    Else If Trim(Produto_Codigo) = '85441100' Then
                                       Begin
                                       Aliquota_IPI := 0;
                                       End
                                    Else If Trim(Produto_Codigo) = '85334011' Then
                                       Begin
                                       Aliquota_IPI := 10;
                                       End
                                    Else If Trim(Produto_Codigo) = '85291019' Then
                                       Begin
                                       Aliquota_IPI := 10;
                                       End
                                    Else If Trim(Produto_Codigo) = '85369090' Then
                                       Begin
                                       Aliquota_IPI := 15;
                                       End
                                    Else If Trim(Produto_Codigo) = '85389090' Then
                                       Begin
                                       Aliquota_IPI := 15;
                                    End;

                                    End
                                 Else
                                    Begin
                                    Aliquota_IPI := StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Produtosfb_produto_ipi.Text));
                                 End;

                                 //*** Fim - Aliquota do IPI ***

                                 VLR_IPI_Isento := ((BC_IPI * Aliquota_IPI) / 100);
                                 End
                              Else
                                 Begin
                                 VLR_IPI        := ((BC_IPI * StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.Text))) / 100);
                              End;

                              ConexaoBD.SQL_FB_Produtos.Close;

                              //*** Linha dos Produtos ***

                              If Vlr_IPI <= 0 Then
                                 Begin
                                 BC_IPI := 0;
                              End;

                              Str(BC_IPI:13:2,BC_IPI_Str);
                              Str(VLR_IPI:13:2,VLR_IPI_Str);
                              Str(VLR_IPI_Isento:13:2,VLR_IPI_Isento_Str);

                              Grava_Linha := 'R2';
                              Grava_linha := Grava_Linha + Gera_Espacos('',8);
                              Grava_linha := Grava_Linha + Gera_Espacos(Produto_Codigo,10);
                              Grava_linha := Grava_Linha + Gera_Espacos(Produto_Descricao,25);
                              Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_IPI_Str),',')),12);
                              Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(VLR_IPI_Str),',')),12);
                              Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(VLR_IPI_Isento_Str),',')),12);
                              Grava_linha := Grava_Linha + Gera_Espacos('',50);

                              WriteLn(Arq_Integracao_Saida,Grava_Linha);

                           End;

                        End;

                        conexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
                  End;

               End;

               //************************************
               //*** FINAL - Gera os Registros R2 ***
               //************************************

               //*** Geração da Segunda ***

               //*****************************************************
               //*** INICIO - Gera os Registros R1 - CFOP Separado ***
               //*****************************************************

               If Outro_CFOP Then
                  Begin

                  //*** Primeira Linha + Valores de ICMS 1 ***

                  Str(BC_ICMS_Normal_Separado:13:2,BC_ICMS_Separado_Str);
                  Str(BC_IPI_Separado:13:2,BC_IPI_Separado_Str);
                  Str(VLR_IPI_Separado:13:2,VLR_IPI_Separado_Str);
                  Str(VLR_ICMS_Separado:13:2,VLR_ICMS_Separado_Str);

                  If StrToDate(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text) < StrToDate('16/07/2008') Then
                     Begin
                     //IVA = 45%
                     Desconto_PVV := ((BC_IPI_Separado + Vlr_IPI_Separado) * 1.45);
                     ICMS_Fonte   := ((Desconto_PVV * 18) / 100) - Vlr_ICMS_Separado;
                     End
                  Else If StrToDate(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text) < StrToDate('25/05/2009') Then
                     Begin
                     //IVA = 34,57%
                     Desconto_PVV := ((BC_IPI_Separado + Vlr_IPI_Separado) * 1.3457);
                     ICMS_Fonte   := ((Desconto_PVV * 18) / 100) - Vlr_ICMS_Separado;
                     End
                  Else
                     Begin
                     //IVA = 33,54%
                     Desconto_PVV := ((BC_IPI_Separado + Vlr_IPI_Separado) * 1.3354);
                     ICMS_Fonte   := ((Desconto_PVV * 18) / 100) - Vlr_ICMS_Separado;
                  End;

                  Str((Vlr_Total_Separado + ICMS_Fonte + VLR_IPI_Separado):13:2,Vlr_Total_Separado_Str);
                  Str(Desconto_PVV:13:2,Desconto_PVV_Str);
                  Str(ICMS_Fonte:13:2,ICMS_Fonte_Str);

                  Grava_Linha := 'R1' + Trim(Dia_Emissao) + Trim(Mes_Emissao) + Trim(Dia_Emissao) + Trim(Mes_Emissao) + '00NF    ' + Gera_Zeros_Str(Nota_Inicio, 6) + Gera_Zeros_Str('0', 6) + Gera_Espacos(Trim(Codigo_CFOP_2),5);
                  Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Total_Separado_Str),',')),12);
                  Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Separado_Str),',')),12);
                  Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(IntToStr(Aliquota_ICMS)),',')),2) + '0000';
                  Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_ICMS_Separado_Str),',')),12);
                  Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Isento_Str),',')),12);
                  Grava_linha := Grava_Linha + '000000000000';

                  //*** Valores de ICMS 2 ***

                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000';
                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000000000';

                  //*** Valores de ICMS 3 ***

                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000';
                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000000000';

                  //*** Valores de ICMS 4 ***

                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000';
                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000000000';

                  //*** Valores de ICMS 5 ***

                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000';
                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000000000';

                  //*** Valores de IPI ***  

                  Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_IPI_Separado_Str),',')),12);
                  Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_IPI_Separado_Str),',')),12);
                  Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_IPI_Isento_Str),',')),12);
                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(ICMS_Fonte_Str),',')),12);
                  Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Desconto_PVV_Str),',')),12);

                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + '000000000000';
                  Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(VLR_Pis_Cofins_Str),',')),12);
                  Grava_linha := Grava_Linha + '0';
                  Grava_linha := Grava_Linha + '22';
                  Grava_linha := Grava_Linha + '00';
                  Grava_linha := Grava_Linha + Gera_Espacos('',14);

                  Codigo_Cliente := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text);

                  Comando_SQL := 'Select * from fb_clientes Where ';
                  Comando_SQL := Comando_SQL + 'fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39;
                  Comando_SQL := Comando_SQL + ' Order By fb_cliente_codigo';

                  ConexaoBD.SQL_FB_Clientes.Close;
                  ConexaoBD.SQL_FB_Clientes.SQL.Clear;
                  ConexaoBD.SQL_FB_Clientes.SQL.Add(Comando_SQL);
                  ConexaoBD.SQL_FB_Clientes.Open;

                  If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo_tipo.Text) = 'CNPJ' Then
                     Begin
                     If Length(Trim(Codigo_Cliente)) < 11 Then
                        Begin
                        Codigo_Cliente := '';
                        End
                     Else
                        Begin
                        Codigo_Cliente := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                     End;
                     End
                  Else
                     Begin
                     If Length(Trim(Codigo_Cliente)) < 11 Then
                        Begin
                        Codigo_Cliente := '';
                        End
                     Else
                        Begin
                        Codigo_Cliente := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                     End;
                  End;

                  Grava_linha := Grava_Linha + Gera_Espacos(Codigo_Cliente,14);
                  Grava_linha := Grava_Linha + Gera_Espacos(Retira_Caracter(Retira_Caracter(Retira_Caracter(Copy(ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_estadual.Text,1,16),'.'),'-'),'/'),16);
                  Grava_linha := Grava_Linha + Gera_Espacos(Copy(ConexaoBD.SQL_FB_Clientesfb_cliente_razao_social.Text,1,35),35);
                  Grava_linha := Grava_Linha + Gera_Espacos('',18);
                  Grava_linha := Grava_Linha + Gera_Espacos(Copy(ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text,1,2),2);
                  Grava_linha := Grava_Linha + '0000';
                  Grava_linha := Grava_Linha + Gera_Espacos('',50);

                  ConexaoBD.SQL_FB_Clientes.Close;

                  WriteLn(Arq_Integracao_Saida,Grava_Linha);

                  //****************************************************
                  //*** FINAL - Gera os Registros R1 - CFOP Separado ***
                  //****************************************************

                  //*****************************************************
                  //*** INÍCIO - Gera os Registros R2 - CFOP Separado ***
                  //*****************************************************

                  For Ind_Produtos_CFOP := 0 To 50 Do
                      Begin

                      If Trim(Relacao_Produtos_Outro_CFOP[Ind_Produtos_CFOP]) <> '' Then
                        Begin

                        Comando_SQL := 'Select * from fb_produtos Where ';
                        Comando_SQL := Comando_SQL + 'fb_produto_codigo = ' +#39+ Trim(Relacao_Produtos_Outro_CFOP[Ind_Produtos_CFOP]) +#39;
                        Comando_SQL := Comando_SQL + ' Order By fb_produto_codigo Desc';

                        ConexaoBD.SQL_FB_Produtos.Close;
                        ConexaoBD.SQL_FB_Produtos.SQL.Clear;
                        ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_FB_Produtos.Open;

                        If ConexaoBD.SQL_FB_Produtos.RecordCount > 0 Then
                           Begin

                           Comando_SQL := 'Select * from fb_notas_fiscais_produtos Where ';
                           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_numero = ' +#39+ Trim(Nota_Inicio) +#39+ ' And ';
                           Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_codigo = ' +#39+ Trim(Relacao_Produtos_Outro_CFOP[Ind_Produtos_CFOP]) +#39;
                           Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_produto_posicao Desc';

                           ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
                           ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
                           ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add(Comando_SQL);
                           ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

                           Classificacao_Fiscal := Trim(conexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text);

                           //*** Início - Obtem o NCM ***

                           Comando_SQL := 'Select * from classificacoes_fiscais_letras Where ';
                           Comando_SQL := Comando_SQL + 'classificacao_fiscal_letra_letra = ' +#39+ Trim(ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text) +#39;
                           Comando_SQL := Comando_SQL + ' Order By classificacao_fiscal_letra_ncm Desc';

                           ConexaoBD.SQL_Classificacao_Letra.Close;
                           ConexaoBD.SQL_Classificacao_Letra.SQL.Clear;
                           ConexaoBD.SQL_Classificacao_Letra.SQL.Add(Comando_SQL);
                           ConexaoBD.SQL_Classificacao_Letra.Open;

                           If ConexaoBD.SQL_Classificacao_Letra.RecordCount > 0 Then
                              Begin
                              Produto_Codigo    := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm.Text;
                              Produto_Descricao := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm_descricao.Text;
                              End
                           Else
                              Begin
                              Produto_Codigo    := '84385000';
                              Produto_Descricao := 'MAQS.E APARS.P/PREPAR.DE CARNES';
                           End;

                           //*** Fim - Obtem o NCM ***

                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,',');
                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,'"');
                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,'#39');
                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,'.');

                           Produto_Descricao := Retira_Caracter(Produto_Descricao,',');
                           Produto_Descricao := Retira_Caracter(Produto_Descricao,'"');
                           Produto_Descricao := Retira_Caracter(Produto_Descricao,#39);

                           BC_IPI            := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));
                           VLR_IPI           := 0;
                           VLR_IPI_Isento    := 0;

                           If StrToFloat(Ponto_Virgula(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.Text))) <= 0 Then
                              Begin

                              //*** Início - Aliquota do IPI ***

                              Aliquota_IPI := 0;

                              If StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Produtosfb_produto_ipi.Text)) <= 0 Then
                                 Begin

                                 If Trim(Produto_Codigo) = '84385000' Then
                                    Begin
                                    Aliquota_IPI := 15;
                                    End
                                 Else If Trim(Produto_Codigo) = '85365090' Then
                                    Begin
                                    Aliquota_IPI := 15;
                                    End
                                 Else If Trim(Produto_Codigo) = '85366990' Then
                                    Begin
                                    Aliquota_IPI := 15;
                                    End
                                 Else If Trim(Produto_Codigo) = '90309020' Then
                                    Begin
                                    Aliquota_IPI := 5;
                                    End
                                 Else If Trim(Produto_Codigo) = '85472000' Then
                                    Begin
                                    Aliquota_IPI := 15;
                                    End
                                 Else If Trim(Produto_Codigo) = '74082200' Then
                                    Begin
                                    Aliquota_IPI := 5;
                                    End
                                 Else If Trim(Produto_Codigo) = '85444100' Then
                                    Begin
                                    Aliquota_IPI := 5;
                                    End
                                 Else If Trim(Produto_Codigo) = '90184999' Then
                                    Begin
                                    Aliquota_IPI := 8;
                                    End
                                 Else If Trim(Produto_Codigo) = '39173230' Then
                                    Begin
                                    Aliquota_IPI := 5;
                                    End
                                 Else If Trim(Produto_Codigo) = '85441100' Then
                                    Begin
                                    Aliquota_IPI := 0;
                                    End
                                 Else If Trim(Produto_Codigo) = '85334011' Then
                                    Begin
                                    Aliquota_IPI := 10;
                                    End
                                 Else If Trim(Produto_Codigo) = '85291019' Then
                                    Begin
                                    Aliquota_IPI := 10;
                                    End
                                 Else If Trim(Produto_Codigo) = '85369090' Then
                                    Begin
                                    Aliquota_IPI := 15;
                                    End
                                 Else If Trim(Produto_Codigo) = '85389090' Then
                                    Begin
                                    Aliquota_IPI := 15;
                                 End;

                                 End
                              Else
                                 Begin
                                 Aliquota_IPI := StrToFloat(Ponto_Virgula(ConexaoBD.SQL_FB_Produtosfb_produto_ipi.Text));
                              End;

                              //*** Fim - Aliquota do IPI ***

                              VLR_IPI_Isento := ((BC_IPI * Aliquota_IPI) / 100);
                              End
                           Else
                              Begin
                              VLR_IPI        := ((BC_IPI * StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.Text))) / 100);
                           End;

                           ConexaoBD.SQL_FB_Produtos.Close;

                           //*** Linha dos Produtos ***

                           If Vlr_IPI <= 0 Then
                              Begin
                              BC_IPI := 0;
                           End;

                           Str(BC_IPI:13:2,BC_IPI_Str);
                           Str(VLR_IPI:13:2,VLR_IPI_Str);
                           Str(VLR_IPI_Isento:13:2,VLR_IPI_Isento_Str);

                           Grava_Linha := 'R2';
                           Grava_linha := Grava_Linha + Gera_Espacos('',8);
                           Grava_linha := Grava_Linha + Gera_Espacos(Produto_Codigo,10);
                           Grava_linha := Grava_Linha + Gera_Espacos(Produto_Descricao,25);
                           Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_IPI_Str),',')),12);
                           Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(VLR_IPI_Str),',')),12);
                           Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(VLR_IPI_Isento_Str),',')),12);
                           Grava_linha := Grava_Linha + Gera_Espacos('',50);

                           WriteLn(Arq_Integracao_Saida,Grava_Linha);

                        End;

                      End;
                  End;

                  //****************************************************
                  //*** FINAL - Gera os Registros R2 - CFOP Separado ***
                  //****************************************************

               End;

            End;

            ConexaoBD.SQL_FB_Nota_Fiscal.Next;
        End;

        //*** Finaliza a Gravação do Arquivo ***

        CloseFile(Arq_Integracao_Saida);

        //*** Inicio - Remove a Última Linha do Arquivo ***

        Ind         := 0;
        Conta_Linha := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);

              If Trim(Linha_Leitura) <> '' Then
                 Begin
                 Ind := Ind + 1;
              End;
        End;

        Conta_Linha := Ind;

        Closefile(Arq_Integracao_Leitura);

        SetLength(Relacao_Arquivo, Conta_Linha);

        Ind := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);
              Relacao_Arquivo[Ind] := Copy(Linha_Leitura,1,595);
              Ind := Ind + 1;
        End;

        Closefile(Arq_Integracao_Leitura);

        AssignFile(Arq_Integracao_Saida,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida);
        Rewrite(Arq_Integracao_Saida);

        For Ind := 0 To (Conta_Linha - 1) Do
            Begin

            Grava_Linha := Relacao_Arquivo[Ind];

            If Ind = (Conta_Linha - 1) Then
               Begin
               Write(Arq_Integracao_Saida,Grava_Linha);
               End
            Else
               Begin
               WriteLn(Arq_Integracao_Saida,Grava_Linha);
            End;
        End;

        CloseFile(Arq_Integracao_Saida);

        //*** Final - Remove a Última Linha do Arquivo ***

        End
     Else
        Begin
        Seta();

        MSG_Erro('Nenhuma Nota Fiscal de Saída foi encontrada...');

        Nome_Arq_Integracao_Saida := '';
     End;

     //******************************************************************
     //*** SINTEGRA - Geração das Notas de Saídas - Arquivo R54 e R75 ***
     //******************************************************************

     //*********************
     //*** Registro - 54 ***
     //*********************

     DT_Inicio      := DT_Inicial.Text;
     DT_Final       := DT_Fim.Text;
     Mes_Integracao := Copy(Trim(DT_Fim.Text),4,2);

     //*** Efetua as Buscas das Notas de Saídas ***

     Comando_SQL := 'Select * from fb_notas_fiscais Where ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_data_emissao >= ' +#39+ Inverte_Data_Plus(Trim(DT_Inicio),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' And fb_nota_fiscal_data_emissao <= ' +#39+ Inverte_Data_Plus(Trim(DT_Final),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_numero';

     ConexaoBD.SQL_FB_Nota_Fiscal.Close;
     ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
     ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_FB_Nota_Fiscal.Open;

     //*** Prepara Array para Verificar as Notas Canceladas ***

     If conexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
        Begin

        //*** Prepara a Geração do Arquivo de Integração ***

        Nome_Arq_Integracao_Saida_R54 := 'IBRASMAK54S' + Trim(Mes_Integracao) + '.TXT';

        If FileExists('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R54) Then
           Begin
           DeleteFile('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R54);
        End;

        AssignFile(Arq_Integracao_Saida,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R54);

        Rewrite(Arq_Integracao_Saida);

        //*** Gera as Notas Dentro do Arquivo ***

        Exibe_Integracao.Caption := 'Aguarde...';
        Exibe_Integracao.Refresh;

        Exibe_Integracao.Caption := 'Gerando Notas de Saídas...';
        Exibe_Integracao.Refresh;

        Dia_Emissao := '01';
        Mes_Emissao := Trim(Mes_Integracao);

        //*** Primeira Linha - Mestre do Estabelecimento ***

        //Grava_Linha := '1047139456000109581034396119  FUSI-BRAS FUSIVEIS BRASILEIROS LTDASAO PAULO                     SP1126014308' + Trim(Ano_Integracao) + Trim(Mes_Integracao) + '01' + Trim(Ano_Integracao) + Trim(Mes_Integracao) + Trim(Dia_Integracao) + '331';
        //WriteLn(Arq_Integracao_Saida,Grava_Linha);

        //*** Segunda Linha - Dados Complementares ***

        //Grava_Linha := '11RUA BARRETOS                      00138                      ALTO DA MOOCA  03184080WALTER BRUZA                001126011501';
        //WriteLn(Arq_Integracao_Saida,Grava_Linha);

        //*** Linhas 50, 54 e 75 ***

        Conta_Registro_50 := 0;
        Conta_Registro_54 := 0;
        Conta_Registro_75 := 0;

        conexaoBD.SQL_FB_Nota_Fiscal.First;

        While Not conexaoBD.SQL_FB_Nota_Fiscal.Eof Do
            Begin
            Vlr_Total          := 0;
            Vlr_Total_Separado := 0;
            Vlr_Total          := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
            Str(Vlr_Total:13:2,Valor_Str);
            Vlr_Total := StrToFloat(Ponto_Virgula(Valor_Str));

            Nota_Inicio        := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

            Exibe_Integracao.Caption := 'Posição - Saídas R54: ' + Trim(Nota_Inicio);
            Exibe_Integracao.Refresh;

            //If (UpperCase(Trim(DBG_Observacao_Nota.Text)) = 'MATERIAL DESTINA-SE PARA CONSUMO') And
            //   (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6.107') And
            //   (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6107') Then
            //   Begin
            //   Material_Consumo := True;
            //   End
            //Else
            //   Begin
               Material_Consumo := False;
            //End;

            CFOP_Str := Copy(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text,1,1);

            If Trim(CFOP_Str) = '' Then
               Begin
               CFOP_Str := '0';
            End;

            CFOP_Nro := StrToInt(CFOP_Str);

            If CFOP_Nro >= 5 Then
               Begin

               Data_Emissao := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;

               Dia_Emissao  := Gera_Zeros_Str((Data_Emissao[1]+Data_Emissao[2]),2);
               Mes_Emissao  := Gera_Zeros_Str((Data_Emissao[4]+Data_Emissao[5]),2);

               Codigo_CFOP   := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text);
               Codigo_CFOP_2 := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop_2.Text);

               If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_estado.Text) <> 'SP' Then
                  Begin

                  If Copy(Codigo_CFOP,1,1) = '5' Then
                     Begin
                     Codigo_CFOP := '6'+ Copy(Codigo_CFOP,2,4);
                     Codigo_CFOP := Trim(Codigo_CFOP);
                  End;
               End;

               If Vlr_Total > 0 Then
                  Begin
                  Aliquota_ICMS_Str := FloatToStr(((conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_icms.AsVariant) / ((Vlr_Total) - (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsVariant))) * 100);
                  Aliquota_ICMS_Str := Obtem_Antes(Aliquota_ICMS_Str,',');
                  Aliquota_ICMS := StrToInt(Aliquota_ICMS_Str);

                  If Aliquota_ICMS >= 17 Then
                     Begin
                     Aliquota_ICMS := 18;
                     End
                  Else If Aliquota_ICMS >= 11 Then
                     Begin
                     Aliquota_ICMS := 12;
                     End
                  Else If Aliquota_ICMS >= 6 Then
                     Begin
                     Aliquota_ICMS := 7;
                  End;

                  If (Trim(Codigo_CFOP_2) = '5.401') Or (Trim(Codigo_CFOP_2) = '5401') Then
                     Begin
                     Aliquota_ICMS := 18;
                  End;

                  End
               Else
                  Begin
                  Aliquota_ICMS := 0;
               End;

               Tipo_Nota     := '00';

               //*** Obtem os Produtos da Nota Fiscal ***

               BC_IPI_Isento     := 0;
               BC_IPI            := 0;
               VLR_IPI           := 0;
               VLR_Pis_Cofins    := 0;

               BC_ICMS_Isento    := 0;
               BC_ICMS_Reduzida  := 0;
               BC_ICMS_Normal    := 0;

               VLR_ICMS_Reduzida := 0;
               VLR_ICMS_Normal   := 0;

               Comando_SQL := 'Select * from fb_notas_fiscais_produtos Where ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_numero = ' + Trim(Nota_Inicio);
               Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_produto_codigo';

               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

               If conexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount > 0 Then
                  Begin

                  conexaoBD.SQL_FB_Nota_Fiscal_Produto.First;

                  While Not conexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof Do
                        Begin
                        Comando_SQL := 'Select * from fb_produtos Where ';
                        Comando_SQL := Comando_SQL + 'fb_produto_codigo = ' +#39+ Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text) +#39;
                        Comando_SQL := Comando_SQL + ' Order By fb_produto_codigo';

                        If Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text) <> '' Then
                           Begin
                           ConexaoBD.SQL_FB_Produtos.Close;
                           ConexaoBD.SQL_FB_Produtos.SQL.Clear;
                           ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
                           ConexaoBD.SQL_FB_Produtos.Open;

                           Classificacao_Fiscal := ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text;

                           ConexaoBD.SQL_FB_Produtos.Close;
                           End
                        Else
                           Begin
                           Classificacao_Fiscal := ' ';
                        End;

                        BC_ICMS_Normal := BC_ICMS_Normal + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));
                        BC_IPI         := BC_IPI + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));

                        conexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
                  End;
               End;

               //*** Preparacao para Impressao do ICMS ***

               //*** Monta a Linha de Gravação ***

               If Material_Consumo Then
                  Begin
                  Vlr_IPI     := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text));

                  Bonificacao := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_desconto.Text));

                  If Bonificacao > 0 Then
                     Begin
                     If BC_ICMS_Normal > 0 Then
                        Begin
                        BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
                     End;

                     If BC_ICMS_Reduzida > 0 Then
                        Begin
                        BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
                     End;
                  End;

                  VLR_ICMS_Normal   := (((BC_ICMS_Normal + Vlr_IPI) * Aliquota_ICMS) / 100);
                  VLR_ICMS_Reduzida := 0;

                  VLR_Pis_Cofins    := 0;
                  Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                  VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_ICMS_Isento := ((BC_ICMS_Normal + BC_ICMS_Reduzida) - (((BC_ICMS_Normal + BC_ICMS_Reduzida) * 7) / 100));
                        //Str(BC_ICMS_Isento:13:2,Valor_Str);
                        //BC_ICMS_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_ICMS_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_ICMS_Isento := (BC_ICMS_Normal + BC_ICMS_Reduzida);
                     End;

                     BC_ICMS_Normal    := 0;
                     BC_ICMS_Reduzida  := 0;

                     VLR_ICMS_Normal   := 0;
                     VLR_ICMS_Reduzida := 0;

                     Str(Vlr_Total:13:2,Vlr_Total_Str);

                     VLR_Pis_Cofins    := 0;
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 0.65) / 100);
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 3) / 100);
                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                     VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                     If ((Trim(Codigo_CFOP) = '5.901') Or (Trim(Codigo_CFOP) = '5901') Or (Trim(Codigo_CFOP) = '7.101') Or (Trim(Codigo_CFOP) = '7101')) Then
                        Begin
                        Vlr_Total      := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_ICMS_Isento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_IPI         := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        Str(Vlr_Total:13:2,Vlr_Total_Str);
                        VLR_Pis_Cofins := 0;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                        End
                     Else If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        VLR_Pis_Cofins    := BC_ICMS_Isento;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                     End;

                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);

                     End
                  Else If ((Trim(Codigo_CFOP) = '6.107') Or (Trim(Codigo_CFOP) = '6107')) Then
                     Begin
                     Vlr_Total         := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text));
                     BC_ICMS_Normal    := Vlr_Total;
                     BC_ICMS_Reduzida  := 0;
                     VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  End;

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_IPI_Isento := (BC_IPI - ((BC_IPI * 7) / 100));
                        //Str(BC_IPI_Isento:13:2,Valor_Str);
                        //BC_IPI_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_IPI_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_IPI_Isento := BC_IPI;
                     End;

                     BC_IPI        := 0;
                     BC_IPI_Str    := '0.00';
                     Vlr_IPI_Str   := '0.00';
                     End
                  Else
                     Begin
                     Vlr_IPI_Str := '0.00';
                     //Str((BC_IPI + Vlr_IPI):13:2,BC_IPI_Str);
                     Str((BC_IPI):13:2,BC_IPI_Str);
                  End;

                  If Aliquota_ICMS <= 0 Then
                     Begin
                     BC_ICMS_Normal   := 0;
                     BC_ICMS_Reduzida := 0;
                  End;

                  Str(BC_IPI_Isento:13:2,BC_IPI_Isento_Str);

                  Str(BC_ICMS_Isento:13:2,BC_ICMS_Isento_Str);
                  Str(((BC_ICMS_Normal + BC_ICMS_Reduzida)+Vlr_IPI):13:2,BC_ICMS_Str);
                  Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);

                  End
               Else
                  Begin

                  Bonificacao := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_desconto.Text));

                  If Bonificacao > 0 Then
                     Begin
                     If BC_ICMS_Normal > 0 Then
                        Begin
                        BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
                     End;

                     If BC_ICMS_Reduzida > 0 Then
                        Begin
                        BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
                     End;
                  End;

                  VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  VLR_ICMS_Reduzida := 0;

                  VLR_Pis_Cofins    := 0;
                  Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                  VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_ICMS_Isento := ((BC_ICMS_Normal + BC_ICMS_Reduzida) - (((BC_ICMS_Normal + BC_ICMS_Reduzida) * 7) / 100));
                        //Str(BC_ICMS_Isento:13:2,Valor_Str);
                        //BC_ICMS_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_ICMS_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_ICMS_Isento := (BC_ICMS_Normal + BC_ICMS_Reduzida);
                     End;

                     BC_ICMS_Normal    := 0;
                     BC_ICMS_Reduzida  := 0;

                     VLR_ICMS_Normal   := 0;
                     VLR_ICMS_Reduzida := 0;

                     Str(Vlr_Total:13:2,Vlr_Total_Str);

                     VLR_Pis_Cofins    := 0;
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 0.65) / 100);
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 3) / 100);
                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                     VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                     If ((Trim(Codigo_CFOP) = '5.901') Or (Trim(Codigo_CFOP) = '5901') Or (Trim(Codigo_CFOP) = '7.101') Or (Trim(Codigo_CFOP) = '7101')) Then
                        Begin
                        Vlr_Total      := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_ICMS_Isento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_IPI         := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        Str(Vlr_Total:13:2,Vlr_Total_Str);
                        VLR_Pis_Cofins := 0;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                        End
                     Else If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        VLR_Pis_Cofins    := BC_ICMS_Isento;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                     End;

                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);

                     End
                  Else If ((Trim(Codigo_CFOP) = '6.107') Or (Trim(Codigo_CFOP) = '6107')) Then
                     Begin
                     Vlr_Total         := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text));
                     BC_ICMS_Normal    := Vlr_Total;
                     BC_ICMS_Reduzida  := 0;
                     VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  End;

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_IPI_Isento := (BC_IPI - ((BC_IPI * 7) / 100));
                        //Str(BC_IPI_Isento:13:2,Valor_Str);
                        //BC_IPI_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_IPI_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_IPI_Isento := BC_IPI;
                     End;

                     BC_IPI        := 0;
                     BC_IPI_Str    := '0.00';
                     Vlr_IPI_Str   := '0.00';
                     End
                  Else
                     Begin
                     Str(BC_IPI:13:2,BC_IPI_Str);
                     Vlr_IPI_Str := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text;
                  End;

                  If Aliquota_ICMS <= 0 Then
                     Begin
                     BC_ICMS_Normal   := 0;
                     BC_ICMS_Reduzida := 0;
                  End;

                  Str(BC_IPI_Isento:13:2,BC_IPI_Isento_Str);

                  Str(BC_ICMS_Isento:13:2,BC_ICMS_Isento_Str);
                  Str((BC_ICMS_Normal + BC_ICMS_Reduzida):13:2,BC_ICMS_Str);
                  Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);

               End;

               //*** Monta a Linha de Gravação ***

               //*** Registro 50 - Saídas ***

               Conta_Registro_50 := Conta_Registro_50 + 1;

               Grava_Linha := '50';

               Codigo_Cliente := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text);

               Comando_SQL := 'Select * from fb_clientes Where ';
               Comando_SQL := Comando_SQL + 'fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39;
               Comando_SQL := Comando_SQL + ' Order By fb_cliente_codigo';

               ConexaoBD.SQL_FB_Clientes.Close;
               ConexaoBD.SQL_FB_Clientes.SQL.Clear;
               ConexaoBD.SQL_FB_Clientes.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Clientes.Open;

               If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo_tipo.Text) = 'CNPJ' Then
                  Begin
                  If Length(Trim(Codigo_Cliente)) < 11 Then
                     Begin
                     Codigo_Cliente := '';
                     End
                  Else
                     Begin
                     Codigo_Cliente := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                  End;
                  End
               Else
                  Begin
                  If Length(Trim(Codigo_Cliente)) < 11 Then
                     Begin
                     Codigo_Cliente := '';
                     End
                  Else
                     Begin
                     Codigo_Cliente := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                  End;
               End;

               Grava_linha := Grava_Linha + Gera_Zeros_Str(Codigo_Cliente,14);
               Grava_linha := Grava_Linha + Gera_Espacos(Retira_Caracter(Retira_Caracter(Retira_Caracter(ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_estadual.Text,'.'),'-'),'/'),14);
               Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text,'amd',''),8);
               Grava_linha := Grava_Linha + Gera_Espacos(ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text,2);
               Grava_linha := Grava_Linha + Gera_Zeros_Str('01',2) + '   ';
               Grava_linha := Grava_Linha + Gera_Zeros_Str(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text,6);

               Classificacao_Fiscal     := ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text;
               Classificacao_Tributaria := ConexaoBD.SQL_FB_Produtosfb_produto_classif_tributaria.Text;
               Grava_CFOP               := Codigo_CFOP;

               If Trim(Codigo_CFOP_2) <> '' Then
                  Begin

                  If Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_estado_entrega.Text) = 'SP' Then
                     Begin

                     If (UpperCase(Trim(Classificacao_Fiscal)) = 'A') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'B') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'C') Then
                        Begin
                        Classificacao_Tributaria := '010';
                        Grava_CFOP               := Codigo_CFOP_2;
                     End;

                  End;
               End;

               Str(Vlr_Total:13:2,Vlr_Total_Str);

               Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Trim(Grava_CFOP),'.'),4);
               Grava_linha := Grava_Linha + 'P';
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Total_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_ICMS_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Isento_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros_Str('0',13);
               Grava_linha := Grava_Linha + Gera_Zeros(Aliquota_ICMS,2) + '00';
               Grava_linha := Grava_Linha + 'N';

               //WriteLn(Arq_Integracao_Saida,Grava_Linha);

               //*** Gera uma Linha para cada Produto ***

               Comando_SQL := 'Select * from fb_notas_fiscais_produtos Where ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_numero = ' + Trim(Nota_Inicio);
               Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_produto_posicao, fb_nota_fiscal_produto_codigo';

               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

               If conexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount > 0 Then
                  Begin

                  //*** Obtem o IPI ***

                  Aliquota_IPI_54_75   := 0;
                  IPI_54_75            := 0;
                  Diferenca_54_75      := 0;
                  Diferenca_Base_54_75 := 0;
                  Qtde_54_75           := 0;
                  Qtde2_54_75          := 0;
                  Base_54_75           := 0;
                  Base2_54_75          := 0;

                  conexaoBD.SQL_FB_Nota_Fiscal_Produto.First;

                  While Not conexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof Do
                        Begin
                        Qtde_54_75 := Qtde_54_75 + 1;

                        Aliquota_IPI_54_75 := 0;

                        If conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.AsFloat > 0 Then
                           Begin
                           Aliquota_IPI_54_75 := conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.AsFloat;
                           End
                        Else
                           Begin
                           Aliquota_IPI_54_75 := ((conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsFloat / conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat) * 100);
                        End;

                        IPI_54_75  := IPI_54_75 + ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsFloat * Aliquota_IPI_54_75) / 100);

                        conexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
                  End;

                  Str(IPI_54_75:13:2, Vlr_Str);
                  IPI_54_75 := StrToFloat(Ponto_Virgula(Vlr_Str));

                  Diferenca_54_75 := (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsFloat - IPI_54_75);
                  Diferenca_54_75 := (Diferenca_54_75 / Qtde_54_75);

                  //If (UpperCase(Trim(DBG_Observacao_Nota.Text)) = 'MATERIAL DESTINA-SE PARA CONSUMO') And
                  //   (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6.107') And
                  //   (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6107') Then
                  //   Begin
                  //   Material_Consumo := True;
                  //   End
                  //Else
                  //   Begin
                     Material_Consumo := False;
                  //End;

                  If Material_Consumo Then
                     Begin
                     Diferenca_54_75      := 0;
                     IPI_54_75            := 0;
                     Diferenca_Base_54_75 := (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsFloat / Qtde_54_75)
                     End
                  Else
                     Begin
                     Diferenca_Base_54_75 := 0;
                  End;

                  If (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) = '6.107') Or
                     (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) = '6107') Then
                     Begin
                     Diferenca_Base_54_75 := (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsFloat / Qtde_54_75)
                  End;

                  Str(Diferenca_54_75:13:2, Vlr_Str);
                  Diferenca_54_75 := StrToFloat(Ponto_Virgula(Vlr_Str));

                  IPI_54_75 := 0;

                  //*** Continua a Geração dos Registros ***

                  conexaoBD.SQL_FB_Nota_Fiscal_Produto.First;

                  Posicao_Produto := 0;
                  Qtde2_54_75     := 0;

                  While Not conexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof Do
                        Begin
                        Qtde2_54_75 := Qtde2_54_75 + 1;

                        Comando_SQL := 'Select * from fb_produtos Where ';
                        Comando_SQL := Comando_SQL + 'fb_produto_codigo = ' +#39+ Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text) +#39;
                        Comando_SQL := Comando_SQL + ' Order By fb_produto_codigo Desc';

                        ConexaoBD.SQL_FB_Produtos.Close;
                        ConexaoBD.SQL_FB_Produtos.SQL.Clear;
                        ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_FB_Produtos.Open;

                        If ConexaoBD.SQL_FB_Produtos.RecordCount > 0 Then
                           Begin

                           //*** Registro 54 - Saídas ***

                           Conta_Registro_54 := Conta_Registro_54 + 1;

                           Grava_Linha := '54';
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Codigo_Cliente,14);
                           Grava_linha := Grava_Linha + '01   ' + Gera_Zeros_Str(Nota_Inicio, 6);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Trim(Grava_CFOP),'.'),4);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Trim(Classificacao_Tributaria),3);

                           Posicao_Produto := Posicao_Produto + 1;
                           Grava_linha := Grava_Linha + Gera_Zeros(Posicao_Produto,3);
                           Grava_linha := Grava_Linha + Gera_Espacos(ConexaoBD.SQL_FB_Produtosfb_produto_codigo.Text,14);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_qtde.Text),'.'),','),11);

                           If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                              Begin
                              If Material_Consumo  And
                                (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6.107') And
                                (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6107') Then
                                 Begin
                                 Str( ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant + Diferenca_Base_54_75) - ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant * 7) / 100)) :13:2, Vlr_Str);
                                 End
                              Else
                                 Begin
                                 Str( ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant) - ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant * 7) / 100)) :13:2, Vlr_Str);
                              End;
                              End
                           Else
                              Begin
                              If Material_Consumo  And
                                (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6.107') And
                                (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6107') Then
                                 Begin
                                 Str( (conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant + Diferenca_Base_54_75) :13:2, Vlr_Str);
                                 End
                              Else
                                 Begin
                                 Str( (conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant) :13:2, Vlr_Str);
                              End;
                           End;

                           Base2_54_75 := Base2_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                           If Qtde2_54_75 = Qtde_54_75 Then
                              Begin
                              If Diferenca_Base_54_75 <> 0 Then
                                 Begin

                                 If Material_Consumo  And
                                    (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6.107') And
                                    (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6107') Then
                                    Begin
                                    Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat - Base2_54_75)) :13:2, Vlr_Str);
                                    End
                                 Else
                                    Begin

                                    If (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) = '6.107') Or
                                       (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) = '6107') Then
                                       Begin
                                       Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + ((conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat - conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsFloat)  - Base2_54_75)) :13:2, Vlr_Str);
                                       End
                                    Else
                                       Begin
                                       Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat - Base2_54_75)) :13:2, Vlr_Str);
                                    End;

                                 End;

                              End;
                           End;

                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);

                           If Trim(Codigo_CFOP_2) <> '' Then
                              Begin

                              If Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_estado_entrega.Text) = 'SP' Then
                                 Begin

                                 If (UpperCase(Trim(Classificacao_Fiscal)) = 'A') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'B') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'C') Then
                                    Begin
                                    Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                    Str( (conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsFloat + Diferenca_Base_54_75) :13:2, Vlr_Str);

                                    Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                                    If Qtde2_54_75 = Qtde_54_75 Then
                                       Begin
                                       If Diferenca_Base_54_75 <> 0 Then
                                          Begin
                                          Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                       End;
                                    End;

                                    Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                                    End
                                 Else
                                    Begin
                                    Str( (conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsFloat + Diferenca_Base_54_75) :13:2, Vlr_Str);

                                    Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                                    If Qtde2_54_75 = Qtde_54_75 Then
                                       Begin
                                       If Diferenca_Base_54_75 <> 0 Then
                                          Begin
                                          Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                       End;
                                    End;

                                    Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                                    Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                 End;

                                 End
                              Else
                                 Begin
                                 Str( (conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsFloat + Diferenca_Base_54_75) :13:2, Vlr_Str);

                                 Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                                 If Qtde2_54_75 = Qtde_54_75 Then
                                    Begin
                                    If Diferenca_Base_54_75 <> 0 Then
                                       Begin
                                       Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                    End;
                                 End;

                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                              End;

                              End
                           Else
                              Begin

                              If ((Trim(Codigo_CFOP) = '6.109') Or
                                  (Trim(Codigo_CFOP) = '6109') Or
                                  (Trim(Codigo_CFOP) = '5.901') Or
                                  (Trim(Codigo_CFOP) = '5901') Or
                                  (Trim(Codigo_CFOP) = '5.902') Or
                                  (Trim(Codigo_CFOP) = '5902') Or
                                  (Trim(Codigo_CFOP) = '5.914') Or
                                  (Trim(Codigo_CFOP) = '5914') Or
                                  (Trim(Codigo_CFOP) = '5.915') Or
                                  (Trim(Codigo_CFOP) = '5915') Or
                                  (Trim(Codigo_CFOP) = '6.916') Or
                                  (Trim(Codigo_CFOP) = '6916') Or
                                  (Trim(Codigo_CFOP) = '7.101') Or
                                  (Trim(Codigo_CFOP) = '7101') ) Then
                                 Begin
                                 If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                                    Begin
                                    Str( ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant + Diferenca_Base_54_75) - ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant * 7) / 100)) :13:2, Vlr_Str);

                                    Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                                    If Qtde2_54_75 = Qtde_54_75 Then
                                       Begin
                                       If Diferenca_Base_54_75 <> 0 Then
                                          Begin
                                          Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                       End;
                                    End;

                                    Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                    Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                                    End
                                 Else
                                    Begin
                                    Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);

                                    Str( (conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsFloat + Diferenca_Base_54_75) :13:2, Vlr_Str);

                                    Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                                    If Qtde2_54_75 = Qtde_54_75 Then
                                       Begin
                                       If Diferenca_Base_54_75 <> 0 Then
                                          Begin
                                          Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                       End;
                                    End;

                                    Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                                 End;
                                 End
                              Else
                                 Begin
                                 Str( (conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsFloat + Diferenca_Base_54_75) :13:2, Vlr_Str);

                                 Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                                 If Qtde2_54_75 = Qtde_54_75 Then
                                    Begin
                                    If Diferenca_Base_54_75 <> 0 Then
                                       Begin
                                       Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                    End;
                                 End;

                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                              End;

                           End;

                           Aliquota_IPI_54_75 := 0;

                           If Material_Consumo Then
                              Begin

                              Aliquota_IPI_54_75 := 0;

                              End
                           Else
                              Begin

                              If conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.AsFloat > 0 Then
                                 Begin
                                 Aliquota_IPI_54_75 := conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.AsFloat;
                                 End
                              Else
                                 Begin
                                 Aliquota_IPI_54_75 := ((conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsFloat / conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsFloat) * 100);
                              End;

                           End;

                           If Qtde2_54_75 = Qtde_54_75 Then
                              Begin

                              If Material_Consumo Then
                                 Begin
                                 Str( 0.00:13:2, Vlr_Str);
                                 IPI_54_75 := IPI_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));
                                 End
                              Else
                                 Begin
                                 Str( (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsFloat - IPI_54_75):13:2, Vlr_Str);
                                 IPI_54_75 := IPI_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));
                              End;

                              End
                           Else
                              Begin
                              Str( (((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsFloat * Aliquota_IPI_54_75) / 100) + Diferenca_54_75) :13:2, Vlr_Str);
                              IPI_54_75 := IPI_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));
                           End;

                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                           Grava_linha := Grava_Linha + Gera_Zeros(Aliquota_ICMS,2) + '00';

                           WriteLn(Arq_Integracao_Saida,Grava_Linha);

                           //*** Registro 75 ***

                           Conta_Registro_75 := Conta_Registro_75 + 1;

                           Grava_linha := '75';
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text,'amd',''),8);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text,'amd',''),8);
                           Grava_linha := Grava_Linha + Gera_Espacos(ConexaoBD.SQL_FB_Produtosfb_produto_codigo.Text,14);

                           //*** Início - Obtem o NCM ***

                           Comando_SQL := 'Select * from classificacoes_fiscais_letras Where ';
                           Comando_SQL := Comando_SQL + 'classificacao_fiscal_letra_letra = ' +#39+ Trim(ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text) +#39;
                           Comando_SQL := Comando_SQL + ' Order By classificacao_fiscal_letra_ncm Desc';

                           ConexaoBD.SQL_Classificacao_Letra.Close;
                           ConexaoBD.SQL_Classificacao_Letra.SQL.Clear;
                           ConexaoBD.SQL_Classificacao_Letra.SQL.Add(Comando_SQL);
                           ConexaoBD.SQL_Classificacao_Letra.Open;

                           If ConexaoBD.SQL_Classificacao_Letra.RecordCount > 0 Then
                              Begin
                              Produto_Codigo    := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm.Text;
                              Produto_Descricao := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm_descricao.Text;
                              End
                           Else
                              Begin
                              Produto_Codigo    := '84385000';
                              Produto_Descricao := 'MAQS.E APARS.P/PREPAR.DE CARNES';
                           End;

                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,',');
                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,'"');
                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,'#39');
                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,'.');

                           Produto_Descricao := Retira_Caracter(Produto_Descricao,',');
                           Produto_Descricao := Retira_Caracter(Produto_Descricao,'"');
                           Produto_Descricao := Retira_Caracter(Produto_Descricao,#39);

                           //*** Fim - Obtem o NCM ***

                           Grava_linha := Grava_Linha + Gera_Espacos(Produto_Codigo,8);
                           Grava_linha := Grava_Linha + Gera_Espacos(Produto_Descricao,53);

                           If Trim(ConexaoBD.SQL_FB_Produtosfb_produto_unidade.Text) = '' Then
                              Begin
                              Grava_linha := Grava_Linha + Gera_Espacos('UN',6);
                              End
                           Else
                              Begin
                              Grava_linha := Grava_Linha + Gera_Espacos(Trim(ConexaoBD.SQL_FB_Produtosfb_produto_unidade.Text),6);
                           End;

                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Trim(Classificacao_Tributaria),3);
                           Grava_linha := Grava_Linha + '00' + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.Text),'.'),','),2);
                           Grava_linha := Grava_Linha + '00' + Gera_Zeros(Aliquota_ICMS,2);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str('0',4);

                           If Trim(Classificacao_Tributaria) = '010' Then
                              Begin
                              Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_uni.Text),'.'),','),12);
                              End
                           Else
                              Begin
                              Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                           End;

                           //WriteLn(Arq_Integracao_Saida,Grava_Linha);

                        End;

                        conexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
                  End;

               End;

            End;

            ConexaoBD.SQL_FB_Nota_Fiscal.Next;
        End;

        Grava_linha := '9047139456000109581034396119  ';
        Grava_linha := Grava_linha + '50' + Gera_Zeros(Conta_Registro_50,8);
        Grava_linha := Grava_linha + '54' + Gera_Zeros(Conta_Registro_54,8);
        Grava_linha := Grava_linha + '75' + Gera_Zeros(Conta_Registro_75,8);
        Grava_linha := Grava_linha + '99' + Gera_Espacos('',63)+'1';

        //WriteLn(Arq_Integracao_Saida,Grava_Linha);

        CloseFile(Arq_Integracao_Saida);

        //*** Inicio - Remove a Última Linha do Arquivo ***

        Ind         := 0;
        Conta_Linha := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R54);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);

              If Trim(Linha_Leitura) <> '' Then
                 Begin
                 Ind := Ind + 1;
              End;
        End;

        Conta_Linha := Ind;

        Closefile(Arq_Integracao_Leitura);

        SetLength(Relacao_Arquivo, Conta_Linha);

        Ind := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R54);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);
              Relacao_Arquivo[Ind] := Copy(Linha_Leitura,1,126);
              Ind := Ind + 1;
        End;

        Closefile(Arq_Integracao_Leitura);

        AssignFile(Arq_Integracao_Saida,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R54);
        Rewrite(Arq_Integracao_Saida);

        For Ind := 0 To (Conta_Linha - 1) Do
            Begin

            Grava_Linha := Relacao_Arquivo[Ind];

            If Ind = (Conta_Linha - 1) Then
               Begin
               Write(Arq_Integracao_Saida,Grava_Linha);
               End
            Else
               Begin
               WriteLn(Arq_Integracao_Saida,Grava_Linha);
            End;
        End;

        CloseFile(Arq_Integracao_Saida);

        //*** Final - Remove a Última Linha do Arquivo ***

        End
     Else
        Begin
        Seta();

        MSG_Erro('Nenhuma Nota Fiscal foi encontrada...');

        Nome_Arq_Integracao_Saida_R54 := '';
     End;

     //*********************
     //*** Registro - 75 ***
     //*********************

     DT_Inicio      := DT_Inicial.Text;
     DT_Final       := DT_Fim.Text;
     Mes_Integracao := Copy(Trim(DT_Fim.Text),4,2);

     //*** Efetua as Buscas das Notas de Saídas ***

     Comando_SQL := 'Select * from fb_notas_fiscais Where ';
     Comando_SQL := Comando_SQL + 'fb_nota_fiscal_data_emissao >= ' +#39+ Inverte_Data_Plus(Trim(DT_Inicio),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' And fb_nota_fiscal_data_emissao <= ' +#39+ Inverte_Data_Plus(Trim(DT_Final),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_numero';

     ConexaoBD.SQL_FB_Nota_Fiscal.Close;
     ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Clear;
     ConexaoBD.SQL_FB_Nota_Fiscal.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_FB_Nota_Fiscal.Open;

     //*** Prepara Array para Verificar as Notas Canceladas ***

     If conexaoBD.SQL_FB_Nota_Fiscal.RecordCount > 0 Then
        Begin

        //*** Prepara a Geração do Arquivo de Integração ***

        Nome_Arq_Integracao_Saida_R75 := 'IBRASMAK75S' + Trim(Mes_Integracao) + '.TXT';

        If FileExists('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R75) Then
           Begin
           DeleteFile('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R75);
        End;

        AssignFile(Arq_Integracao_Saida,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R75);

        Rewrite(Arq_Integracao_Saida);

        //*** Gera as Notas Dentro do Arquivo ***

        Exibe_Integracao.Caption := 'Aguarde...';
        Exibe_Integracao.Refresh;

        Exibe_Integracao.Caption := 'Gerando Notas de Saídas...';
        Exibe_Integracao.Refresh;

        Dia_Emissao := '01';
        Mes_Emissao := Trim(Mes_Integracao);

        //*** Primeira Linha - Mestre do Estabelecimento ***

        //Grava_Linha := '1047139456000109581034396119  FUSI-BRAS FUSIVEIS BRASILEIROS LTDASAO PAULO                     SP1126014308' + Trim(Ano_Integracao) + Trim(Mes_Integracao) + '01' + Trim(Ano_Integracao) + Trim(Mes_Integracao) + Trim(Dia_Integracao) + '331';
        //WriteLn(Arq_Integracao_Saida,Grava_Linha);

        //*** Segunda Linha - Dados Complementares ***

        //Grava_Linha := '11RUA BARRETOS                      00138                      ALTO DA MOOCA  03184080WALTER BRUZA                001126011501';
        //WriteLn(Arq_Integracao_Saida,Grava_Linha);

        //*** Linhas 50, 54 e 75 ***

        Conta_Registro_50 := 0;
        Conta_Registro_54 := 0;
        Conta_Registro_75 := 0;

        conexaoBD.SQL_FB_Nota_Fiscal.First;

        While Not conexaoBD.SQL_FB_Nota_Fiscal.Eof Do
            Begin

            Vlr_Total          := 0;
            Vlr_Total_Separado := 0;
            Vlr_Total          := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
            Str(Vlr_Total:13:2,Valor_Str);
            Vlr_Total := StrToFloat(Ponto_Virgula(Valor_Str));

            Nota_Inicio        := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text;

            Exibe_Integracao.Caption := 'Posição - Saídas R75: ' + Trim(Nota_Inicio);
            Exibe_Integracao.Refresh;

            //If (UpperCase(Trim(DBG_Observacao_Nota.Text)) = 'MATERIAL DESTINA-SE PARA CONSUMO') And
            //   (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6.107') And
            //   (Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text) <> '6107') Then
            //   Begin
            //   Material_Consumo := True;
            //   End
            //Else
            //   Begin
               Material_Consumo := False;
            //End;

            CFOP_Str := Copy(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text,1,1);

            If Trim(CFOP_Str) = '' Then
               Begin
               CFOP_Str := '0';
            End;

            CFOP_Nro := StrToInt(CFOP_Str);

            If CFOP_Nro >= 5 Then
               Begin

               Data_Emissao := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text;

               Dia_Emissao  := Gera_Zeros_Str((Data_Emissao[1]+Data_Emissao[2]),2);
               Mes_Emissao  := Gera_Zeros_Str((Data_Emissao[4]+Data_Emissao[5]),2);

               Codigo_CFOP   := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop.Text);
               Codigo_CFOP_2 := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_cfop_2.Text);

               If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_estado.Text) <> 'SP' Then
                  Begin

                  If Copy(Codigo_CFOP,1,1) = '5' Then
                     Begin
                     Codigo_CFOP := '6'+ Copy(Codigo_CFOP,2,4);
                     Codigo_CFOP := Trim(Codigo_CFOP);
                  End;
               End;

               If Vlr_Total > 0 Then
                  Begin
                  Aliquota_ICMS_Str := FloatToStr(((conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_icms.AsVariant) / ((Vlr_Total) - (conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.AsVariant))) * 100);
                  Aliquota_ICMS_Str := Obtem_Antes(Aliquota_ICMS_Str,',');
                  Aliquota_ICMS := StrToInt(Aliquota_ICMS_Str);

                  If Aliquota_ICMS >= 17 Then
                     Begin
                     Aliquota_ICMS := 18;
                     End
                  Else If Aliquota_ICMS >= 11 Then
                     Begin
                     Aliquota_ICMS := 12;
                     End
                  Else If Aliquota_ICMS >= 6 Then
                     Begin
                     Aliquota_ICMS := 7;
                  End;

                  If (Trim(Codigo_CFOP_2) = '5.401') Or (Trim(Codigo_CFOP_2) = '5401') Then
                     Begin
                     Aliquota_ICMS := 18;
                  End;

                  End
               Else
                  Begin
                  Aliquota_ICMS := 0;
               End;

               Tipo_Nota     := '00';

               //*** Obtem os Produtos da Nota Fiscal ***

               BC_IPI_Isento     := 0;
               BC_IPI            := 0;
               VLR_IPI           := 0;
               VLR_Pis_Cofins    := 0;

               BC_ICMS_Isento    := 0;
               BC_ICMS_Reduzida  := 0;
               BC_ICMS_Normal    := 0;

               VLR_ICMS_Reduzida := 0;
               VLR_ICMS_Normal   := 0;

               Comando_SQL := 'Select * from fb_notas_fiscais_produtos Where ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_numero = ' + Trim(Nota_Inicio);
               Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_produto_codigo';

               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

               If conexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount > 0 Then
                  Begin

                  conexaoBD.SQL_FB_Nota_Fiscal_Produto.First;

                  While Not conexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof Do
                        Begin
                        Comando_SQL := 'Select * from fb_produtos Where ';
                        Comando_SQL := Comando_SQL + 'fb_produto_codigo = ' +#39+ Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text) +#39;
                        Comando_SQL := Comando_SQL + ' Order By fb_produto_codigo';

                        If Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text) <> '' Then
                           Begin
                           ConexaoBD.SQL_FB_Produtos.Close;
                           ConexaoBD.SQL_FB_Produtos.SQL.Clear;
                           ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
                           ConexaoBD.SQL_FB_Produtos.Open;

                           Classificacao_Fiscal := ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text;

                           ConexaoBD.SQL_FB_Produtos.Close;
                           End
                        Else
                           Begin
                           Classificacao_Fiscal := ' ';
                        End;

                        BC_ICMS_Normal := BC_ICMS_Normal + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));
                        BC_IPI         := BC_IPI + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text));

                        conexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
                  End;
               End;

               //*** Preparacao para Impressao do ICMS ***

               //*** Monta a Linha de Gravação ***

               If Material_Consumo Then
                  Begin
                  Vlr_IPI     := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text));

                  Bonificacao := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_desconto.Text));

                  If Bonificacao > 0 Then
                     Begin
                     If BC_ICMS_Normal > 0 Then
                        Begin
                        BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
                     End;

                     If BC_ICMS_Reduzida > 0 Then
                        Begin
                        BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
                     End;
                  End;

                  VLR_ICMS_Normal   := (((BC_ICMS_Normal + Vlr_IPI) * Aliquota_ICMS) / 100);
                  VLR_ICMS_Reduzida := 0;

                  VLR_Pis_Cofins    := 0;
                  Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                  VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_ICMS_Isento := ((BC_ICMS_Normal + BC_ICMS_Reduzida) - (((BC_ICMS_Normal + BC_ICMS_Reduzida) * 7) / 100));
                        //Str(BC_ICMS_Isento:13:2,Valor_Str);
                        //BC_ICMS_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_ICMS_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_ICMS_Isento := (BC_ICMS_Normal + BC_ICMS_Reduzida);
                     End;

                     BC_ICMS_Normal    := 0;
                     BC_ICMS_Reduzida  := 0;

                     VLR_ICMS_Normal   := 0;
                     VLR_ICMS_Reduzida := 0;

                     Str(Vlr_Total:13:2,Vlr_Total_Str);

                     VLR_Pis_Cofins    := 0;
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 0.65) / 100);
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 3) / 100);
                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                     VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                     If ((Trim(Codigo_CFOP) = '5.901') Or (Trim(Codigo_CFOP) = '5901') Or (Trim(Codigo_CFOP) = '7.101') Or (Trim(Codigo_CFOP) = '7101')) Then
                        Begin
                        Vlr_Total      := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_ICMS_Isento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_IPI         := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        Str(Vlr_Total:13:2,Vlr_Total_Str);
                        VLR_Pis_Cofins := 0;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                        End
                     Else If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        VLR_Pis_Cofins    := BC_ICMS_Isento;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                     End;

                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);

                     End
                  Else If ((Trim(Codigo_CFOP) = '6.107') Or (Trim(Codigo_CFOP) = '6107')) Then
                     Begin
                     Vlr_Total         := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text));
                     BC_ICMS_Normal    := Vlr_Total;
                     BC_ICMS_Reduzida  := 0;
                     VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  End;

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_IPI_Isento := (BC_IPI - ((BC_IPI * 7) / 100));
                        //Str(BC_IPI_Isento:13:2,Valor_Str);
                        //BC_IPI_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_IPI_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_IPI_Isento := BC_IPI;
                     End;

                     BC_IPI        := 0;
                     BC_IPI_Str    := '0.00';
                     Vlr_IPI_Str   := '0.00';
                     End
                  Else
                     Begin
                     Vlr_IPI_Str := '0.00';
                     //Str((BC_IPI + Vlr_IPI):13:2,BC_IPI_Str);
                     Str((BC_IPI):13:2,BC_IPI_Str);
                  End;

                  If Aliquota_ICMS <= 0 Then
                     Begin
                     BC_ICMS_Normal   := 0;
                     BC_ICMS_Reduzida := 0;
                  End;

                  Str(BC_IPI_Isento:13:2,BC_IPI_Isento_Str);

                  Str(BC_ICMS_Isento:13:2,BC_ICMS_Isento_Str);
                  Str(((BC_ICMS_Normal + BC_ICMS_Reduzida)+Vlr_IPI):13:2,BC_ICMS_Str);
                  Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);

                  End
               Else
                  Begin

                  Bonificacao := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_desconto.Text));

                  If Bonificacao > 0 Then
                     Begin
                     If BC_ICMS_Normal > 0 Then
                        Begin
                        BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
                     End;

                     If BC_ICMS_Reduzida > 0 Then
                        Begin
                        BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
                     End;
                  End;

                  VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  VLR_ICMS_Reduzida := 0;

                  VLR_Pis_Cofins    := 0;
                  Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                  VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_ICMS_Isento := ((BC_ICMS_Normal + BC_ICMS_Reduzida) - (((BC_ICMS_Normal + BC_ICMS_Reduzida) * 7) / 100));
                        //Str(BC_ICMS_Isento:13:2,Valor_Str);
                        //BC_ICMS_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_ICMS_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_ICMS_Isento := (BC_ICMS_Normal + BC_ICMS_Reduzida);
                     End;

                     BC_ICMS_Normal    := 0;
                     BC_ICMS_Reduzida  := 0;

                     VLR_ICMS_Normal   := 0;
                     VLR_ICMS_Reduzida := 0;

                     Str(Vlr_Total:13:2,Vlr_Total_Str);

                     VLR_Pis_Cofins    := 0;
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 0.65) / 100);
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text))) * 3) / 100);
                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                     VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                     If ((Trim(Codigo_CFOP) = '5.901') Or (Trim(Codigo_CFOP) = '5901') Or (Trim(Codigo_CFOP) = '7.101') Or (Trim(Codigo_CFOP) = '7101')) Then
                        Begin
                        Vlr_Total      := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_ICMS_Isento := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        BC_IPI         := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.AsVariant;
                        Str(Vlr_Total:13:2,Vlr_Total_Str);
                        VLR_Pis_Cofins := 0;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                        End
                     Else If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        VLR_Pis_Cofins    := BC_ICMS_Isento;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                     End;

                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);

                     End
                  Else If ((Trim(Codigo_CFOP) = '6.107') Or (Trim(Codigo_CFOP) = '6107')) Then
                     Begin
                     Vlr_Total         := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_total.Text));
                     BC_ICMS_Normal    := Vlr_Total;
                     BC_ICMS_Reduzida  := 0;
                     VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  End;

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_IPI_Isento := (BC_IPI - ((BC_IPI * 7) / 100));
                        //Str(BC_IPI_Isento:13:2,Valor_Str);
                        //BC_IPI_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_IPI_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_IPI_Isento := BC_IPI;
                     End;

                     BC_IPI        := 0;
                     BC_IPI_Str    := '0.00';
                     Vlr_IPI_Str   := '0.00';
                     End
                  Else
                     Begin
                     Str(BC_IPI:13:2,BC_IPI_Str);
                     Vlr_IPI_Str := conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_valor_ipi.Text;
                  End;

                  If Aliquota_ICMS <= 0 Then
                     Begin
                     BC_ICMS_Normal   := 0;
                     BC_ICMS_Reduzida := 0;
                  End;

                  Str(BC_IPI_Isento:13:2,BC_IPI_Isento_Str);

                  Str(BC_ICMS_Isento:13:2,BC_ICMS_Isento_Str);
                  Str((BC_ICMS_Normal + BC_ICMS_Reduzida):13:2,BC_ICMS_Str);
                  Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);

               End;

               //*** Monta a Linha de Gravação ***

               //*** Registro 50 - Saídas ***

               Conta_Registro_50 := Conta_Registro_50 + 1;

               Grava_Linha := '50';

               Codigo_Cliente := Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo.Text);

               Comando_SQL := 'Select * from fb_clientes Where ';
               Comando_SQL := Comando_SQL + 'fb_cliente_codigo = ' +#39+ Trim(Codigo_Cliente) +#39;
               Comando_SQL := Comando_SQL + ' Order By fb_cliente_codigo';

               ConexaoBD.SQL_FB_Clientes.Close;
               ConexaoBD.SQL_FB_Clientes.SQL.Clear;
               ConexaoBD.SQL_FB_Clientes.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Clientes.Open;

               If Trim(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_codigo_tipo.Text) = 'CNPJ' Then
                  Begin
                  If Length(Trim(Codigo_Cliente)) < 11 Then
                     Begin
                     Codigo_Cliente := '';
                     End
                  Else
                     Begin
                     Codigo_Cliente := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
                  End;
                  End
               Else
                  Begin
                  If Length(Trim(Codigo_Cliente)) < 11 Then
                     Begin
                     Codigo_Cliente := '';
                     End
                  Else
                     Begin
                     Codigo_Cliente := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[3]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[7]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[11]+Codigo_Cliente[13]+Codigo_Cliente[14];
                  End;
               End;

               Grava_linha := Grava_Linha + Gera_Zeros_Str(Codigo_Cliente,14);
               Grava_linha := Grava_Linha + Gera_Espacos(Retira_Caracter(Retira_Caracter(Retira_Caracter(ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_estadual.Text,'.'),'-'),'/'),14);
               Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text,'amd',''),8);
               Grava_linha := Grava_Linha + Gera_Espacos(ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text,2);
               Grava_linha := Grava_Linha + Gera_Zeros_Str('01',2) + '   ';
               Grava_linha := Grava_Linha + Gera_Zeros_Str(ConexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_numero.Text,6);

               Classificacao_Fiscal     := ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text;
               Classificacao_Tributaria := ConexaoBD.SQL_FB_Produtosfb_produto_classif_tributaria.Text;
               Grava_CFOP               := Codigo_CFOP;

               If Trim(Codigo_CFOP_2) <> '' Then
                  Begin

                  If Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_estado_entrega.Text) = 'SP' Then
                     Begin

                     If (UpperCase(Trim(Classificacao_Fiscal)) = 'A') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'B') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'C') Then
                        Begin
                        Classificacao_Tributaria := '010';
                        Grava_CFOP               := Codigo_CFOP_2;
                     End;

                  End;
               End;

               Str(Vlr_Total:13:2,Vlr_Total_Str);

               Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Trim(Grava_CFOP),'.'),4);
               Grava_linha := Grava_Linha + 'P';
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Total_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_ICMS_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Isento_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros_Str('0',13);
               Grava_linha := Grava_Linha + Gera_Zeros(Aliquota_ICMS,2) + '00';
               Grava_linha := Grava_Linha + 'N';

               //WriteLn(Arq_Integracao_Saida,Grava_Linha);

               //*** Gera uma Linha para cada Produto ***

               Comando_SQL := 'Select * from fb_notas_fiscais_produtos Where ';
               Comando_SQL := Comando_SQL + 'fb_nota_fiscal_produto_numero = ' + Trim(Nota_Inicio);
               Comando_SQL := Comando_SQL + ' Order By fb_nota_fiscal_produto_posicao, fb_nota_fiscal_produto_codigo';

               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Close;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Clear;
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Nota_Fiscal_Produto.Open;

               If conexaoBD.SQL_FB_Nota_Fiscal_Produto.RecordCount > 0 Then
                  Begin

                  conexaoBD.SQL_FB_Nota_Fiscal_Produto.First;

                  Posicao_Produto := 0;

                  While Not conexaoBD.SQL_FB_Nota_Fiscal_Produto.Eof Do
                        Begin
                        Comando_SQL := 'Select * from fb_produtos Where ';
                        Comando_SQL := Comando_SQL + 'fb_produto_codigo = ' +#39+ Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_codigo.Text) +#39;
                        Comando_SQL := Comando_SQL + ' Order By fb_produto_codigo Desc';

                        ConexaoBD.SQL_FB_Produtos.Close;
                        ConexaoBD.SQL_FB_Produtos.SQL.Clear;
                        ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_FB_Produtos.Open;

                        If ConexaoBD.SQL_FB_Produtos.RecordCount > 0 Then
                           Begin

                           //*** Registro 54 - Saídas ***

                           Conta_Registro_54 := Conta_Registro_54 + 1;

                           Grava_Linha := '54';
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Codigo_Cliente,14);
                           Grava_linha := Grava_Linha + '01   ' + Gera_Zeros_Str(Nota_Inicio, 6);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Trim(Grava_CFOP),'.'),4);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Trim(Classificacao_Tributaria),3);

                           Posicao_Produto := Posicao_Produto + 1;
                           Grava_linha := Grava_Linha + Gera_Zeros(Posicao_Produto,3);
                           Grava_linha := Grava_Linha + Gera_Espacos(ConexaoBD.SQL_FB_Produtosfb_produto_codigo.Text,14);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_qtde.Text),'.'),','),11);

                           If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                              Begin
                              Str( ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant) - ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant * 7) / 100)) :13:2, Vlr_Str);
                              End
                           Else
                              Begin
                              Str( (conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_qtde.AsVariant * ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_uni.AsVariant) / 100)) :13:2, Vlr_Str);
                           End;

                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);

                           If Trim(Codigo_CFOP_2) <> '' Then
                              Begin

                              If Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_estado_entrega.Text) = 'SP' Then
                                 Begin

                                 If (UpperCase(Trim(Classificacao_Fiscal)) = 'A') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'B') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'C') Then
                                    Begin
                                    Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                    Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text),'.'),','),12);
                                    End
                                 Else
                                    Begin
                                    Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text),'.'),','),12);
                                    Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                 End;

                                 End
                              Else
                                 Begin
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text),'.'),','),12);
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                              End;

                              End
                           Else
                              Begin
                              
                              If ((Trim(Codigo_CFOP) = '6.109') Or
                                  (Trim(Codigo_CFOP) = '6109') Or
                                  (Trim(Codigo_CFOP) = '5.901') Or
                                  (Trim(Codigo_CFOP) = '5901') Or
                                  (Trim(Codigo_CFOP) = '5.902') Or
                                  (Trim(Codigo_CFOP) = '5902') Or
                                  (Trim(Codigo_CFOP) = '5.914') Or
                                  (Trim(Codigo_CFOP) = '5914') Or
                                  (Trim(Codigo_CFOP) = '5.915') Or
                                  (Trim(Codigo_CFOP) = '5915') Or
                                  (Trim(Codigo_CFOP) = '6.916') Or
                                  (Trim(Codigo_CFOP) = '6916') Or
                                  (Trim(Codigo_CFOP) = '7.101') Or
                                  (Trim(Codigo_CFOP) = '7101') ) Then
                                 Begin
                                 If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                                    Begin
                                    Str( ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant) - ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsVariant * 7) / 100)) :13:2, Vlr_Str);

                                    Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                    Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                                    End
                                 Else
                                    Begin
                                    Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                    Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text),'.'),','),12);
                                 End;
                                 End
                              Else
                                 Begin
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.Text),'.'),','),12);
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                              End;

                           End;

                           Str( ((conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_tot.AsFloat * conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.AsFloat) / 100) :13:2, Vlr_Str);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                           Grava_linha := Grava_Linha + Gera_Zeros(Aliquota_ICMS,2) + '00';

                           //WriteLn(Arq_Integracao_Saida,Grava_Linha);

                           //*** Registro 75 ***

                           Conta_Registro_75 := Conta_Registro_75 + 1;

                           Grava_linha := '75';
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text,'amd',''),8);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Nota_Fiscalfb_nota_fiscal_data_emissao.Text,'amd',''),8);
                           Grava_linha := Grava_Linha + Gera_Espacos(ConexaoBD.SQL_FB_Produtosfb_produto_codigo.Text,14);

                           //*** Início - Obtem o NCM ***

                           Comando_SQL := 'Select * from classificacoes_fiscais_letras Where ';
                           Comando_SQL := Comando_SQL + 'classificacao_fiscal_letra_letra = ' +#39+ Trim(ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text) +#39;
                           Comando_SQL := Comando_SQL + ' Order By classificacao_fiscal_letra_ncm Desc';

                           ConexaoBD.SQL_Classificacao_Letra.Close;
                           ConexaoBD.SQL_Classificacao_Letra.SQL.Clear;
                           ConexaoBD.SQL_Classificacao_Letra.SQL.Add(Comando_SQL);
                           ConexaoBD.SQL_Classificacao_Letra.Open;

                           If ConexaoBD.SQL_Classificacao_Letra.RecordCount > 0 Then
                              Begin
                              Produto_Codigo    := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm.Text;
                              Produto_Descricao := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm_descricao.Text;
                              End
                           Else
                              Begin
                              Produto_Codigo    := '84385000';
                              Produto_Descricao := 'MAQS.E APARS.P/PREPAR.DE CARNES';
                           End;

                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,',');
                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,'"');
                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,'#39');
                           Produto_Codigo    := Retira_Caracter(Produto_Codigo,'.');

                           Produto_Descricao := Retira_Caracter(Produto_Descricao,',');
                           Produto_Descricao := Retira_Caracter(Produto_Descricao,'"');
                           Produto_Descricao := Retira_Caracter(Produto_Descricao,#39);

                           //*** Fim - Obtem o NCM ***

                           Grava_linha := Grava_Linha + Gera_Espacos(Produto_Codigo,8);
                           Grava_linha := Grava_Linha + Gera_Espacos(Produto_Descricao,53);

                           If Trim(ConexaoBD.SQL_FB_Produtosfb_produto_unidade.Text) = '' Then
                              Begin
                              Grava_linha := Grava_Linha + Gera_Espacos('UN',6);
                              End
                           Else
                              Begin
                              Grava_linha := Grava_Linha + Gera_Espacos(Trim(ConexaoBD.SQL_FB_Produtosfb_produto_unidade.Text),6);
                           End;

                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Trim(Classificacao_Tributaria),3);
                           Grava_linha := Grava_Linha + '00' + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_ipi.Text),'.'),','),2);
                           Grava_linha := Grava_Linha + '00' + Gera_Zeros(Aliquota_ICMS,2);
                           Grava_linha := Grava_Linha + Gera_Zeros_Str('0',4);

                           If Trim(Classificacao_Tributaria) = '010' Then
                              Begin
                              Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Nota_Fiscal_Produtofb_nota_fiscal_produto_vlr_uni.Text),'.'),','),12);
                              End
                           Else
                              Begin
                              Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                           End;

                           WriteLn(Arq_Integracao_Saida,Grava_Linha);

                        End;

                        conexaoBD.SQL_FB_Nota_Fiscal_Produto.Next;
                  End;

               End;

            End;

            ConexaoBD.SQL_FB_Nota_Fiscal.Next;

        End;

        Grava_linha := '9047139456000109581034396119  ';
        Grava_linha := Grava_linha + '50' + Gera_Zeros(Conta_Registro_50,8);
        Grava_linha := Grava_linha + '54' + Gera_Zeros(Conta_Registro_54,8);
        Grava_linha := Grava_linha + '75' + Gera_Zeros(Conta_Registro_75,8);
        Grava_linha := Grava_linha + '99' + Gera_Espacos('',63)+'1';

        //WriteLn(Arq_Integracao_Saida,Grava_Linha);

        //*** Finaliza a Gravação do Arquivo ***

        CloseFile(Arq_Integracao_Saida);

        //*** Inicio - Remove a Última Linha do Arquivo ***

        Ind         := 0;
        Conta_Linha := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R75);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);

              If Trim(Linha_Leitura) <> '' Then
                 Begin
                 Ind := Ind + 1;
              End;
        End;

        Conta_Linha := Ind;

        Closefile(Arq_Integracao_Leitura);

        SetLength(Relacao_Arquivo, Conta_Linha);

        Ind := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R75);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);
              Relacao_Arquivo[Ind] := Copy(Linha_Leitura,1,126);
              Ind := Ind + 1;
        End;

        Closefile(Arq_Integracao_Leitura);

        AssignFile(Arq_Integracao_Saida,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R75);
        Rewrite(Arq_Integracao_Saida);

        For Ind := 0 To (Conta_Linha - 1) Do
            Begin

            Grava_Linha := Relacao_Arquivo[Ind];

            If Ind = (Conta_Linha - 1) Then
               Begin
               Write(Arq_Integracao_Saida,Grava_Linha);
               End
            Else
               Begin
               WriteLn(Arq_Integracao_Saida,Grava_Linha);
            End;
        End;

        CloseFile(Arq_Integracao_Saida);

        //*** Final - Remove a Última Linha do Arquivo ***

        End
     Else
        Begin
        Seta();

        MSG_Erro('Nenhuma Nota Fiscal foi encontrada...');

        Nome_Arq_Integracao_Saida_R75 := '';
     End;

     Exibe_Integracao.Caption := '';
     Exibe_Integracao.Refresh;

     //*************************************
     //*** Geração das Notas de Entradas ***
     //*************************************

     DT_Inicio      := DT_Inicial.Text;
     DT_Final       := DT_Fim.Text;
     Mes_Integracao := Copy(Trim(DT_Fim.Text),4,2);

     //*** Efetua as Buscas das Notas de Saídas ***

     Comando_SQL := 'Select * from fb_notas_entradas Where ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_data_emissao >= ' +#39+ Inverte_Data_Plus(Trim(DT_Inicio),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' And fb_nota_entrada_data_emissao <= ' +#39+ Inverte_Data_Plus(Trim(DT_Final),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' And fb_nota_entrada_cfop <> ' +#39+ '0' +#39;
     Comando_SQL := Comando_SQL + ' Order By fb_nota_entrada_data_emissao Asc, fb_nota_entrada_numero_nota Asc';

     ConexaoBD.SQL_FB_Notas_Entradas.Close;
     ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
     ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_FB_Notas_Entradas.Open;

     //*** Prepara Array para Verificar as Notas Canceladas ***

     If conexaoBD.SQL_FB_Notas_Entradas.RecordCount > 0 Then
        Begin

        //*** Prepara a Geração do Arquivo de Integração ***

        Nome_Arq_Integracao_Entrada := 'IBRASMAK.E'+ Trim(Mes_Integracao);

        If FileExists('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada) Then
           Begin
           DeleteFile('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada);
        End;

        AssignFile(Arq_Integracao_Entrada,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada);

        Rewrite(Arq_Integracao_Entrada);

        //*** Gera as Notas Dentro do Arquivo ***

        Exibe_Integracao.Caption := 'Aguarde...';
        Exibe_Integracao.Refresh;

        Exibe_Integracao.Caption := 'Gerando Notas de Entradas...';
        Exibe_Integracao.Refresh;

        Dia_Emissao := '01';
        Mes_Emissao := Trim(Mes_Integracao);

        conexaoBD.SQL_FB_Notas_Entradas.First;

        While Not conexaoBD.SQL_FB_Notas_Entradas.Eof Do
            Begin

            Nota_Inicio := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_numero_nota.Text;

            Exibe_Integracao.Caption := 'Posição - Entradas: ' + Nota_Inicio;
            Exibe_Integracao.Refresh;

            Data_Emissao := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_emissao.Text;

            Dia_Emissao  := Gera_Zeros_Str((Data_Emissao[1]+Data_Emissao[2]),2);
            Mes_Emissao  := Gera_Zeros_Str((Data_Emissao[4]+Data_Emissao[5]),2);

            Codigo_CFOP   := Obtem_CFOP_Entrada(Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text));

            If conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_base_icms.AsVariant > 0 Then
               Begin
               Aliquota_ICMS_Str := FloatToStr((conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_icms.AsVariant / conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_base_icms.AsVariant) * 100);
               Aliquota_ICMS_Str := Obtem_Antes(Aliquota_ICMS_Str,',');
               Aliquota_ICMS := StrToInt(Aliquota_ICMS_Str);

               If Aliquota_ICMS >= 17 Then
                  Begin
                  Aliquota_ICMS := 18;
                  End
               Else If Aliquota_ICMS >= 11 Then
                  Begin
                  Aliquota_ICMS := 12;
                  End
               Else If Aliquota_ICMS >= 6 Then
                  Begin
                  Aliquota_ICMS := 7;
               End;

               End
            Else
               Begin
               Aliquota_ICMS := 0;
            End;

            Tipo_Nota     := '00';

            //*** Obtem os Produtos da Nota Fiscal ***

            BC_ICMS_Reduzida  := 0;
            BC_ICMS_Normal    := 0;
            VLR_ICMS_Reduzida := 0;
            VLR_ICMS_Normal   := 0;

            Comando_SQL := 'Select * from fb_notas_entradas_produtos Where ';
            Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_numero = ' + Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_numero.Text);
            Comando_SQL := Comando_SQL + ' Order By fb_nota_entrada_produto_codigo';

            ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;
            ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Clear;
            ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Open;

            If conexaoBD.SQL_FB_Notas_Entradas_Produtos.RecordCount > 0 Then
               Begin

               conexaoBD.SQL_FB_Notas_Entradas_Produtos.First;

               While Not conexaoBD.SQL_FB_Notas_Entradas_Produtos.Eof Do
                     Begin
                     Comando_SQL := 'Select * from fb_produtos Where ';
                     Comando_SQL := Comando_SQL + 'fb_produto_codigo = ' +#39+ Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_codigo.Text) +#39;
                     Comando_SQL := Comando_SQL + ' Order By fb_produto_codigo';

                     If Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_codigo.Text) <> '' Then
                        Begin
                        ConexaoBD.SQL_FB_Produtos.Close;
                        ConexaoBD.SQL_FB_Produtos.SQL.Clear;
                        ConexaoBD.SQL_FB_Produtos.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_FB_Produtos.Open;

                        Classificacao_Fiscal := ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text;

                        ConexaoBD.SQL_FB_Produtos.Close;
                        End
                     Else
                        Begin
                        Classificacao_Fiscal := ' ';
                     End;

                     BC_ICMS_Normal := BC_ICMS_Normal + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text));

                     conexaoBD.SQL_FB_Notas_Entradas_Produtos.Next;
               End;
            End;

            BC_ICMS_Normal := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_base_icms.Text));

            //*** Preparacao para Impressao do ICMS ***

            Bonificacao := 0;

            If Bonificacao > 0 Then
               Begin
               If BC_ICMS_Normal > 0 Then
                  Begin
                  BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
               End;

               If BC_ICMS_Reduzida > 0 Then
                  Begin
                  BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
               End;
            End;

            VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
            VLR_ICMS_Reduzida := 0;

            //*** Monta a Linha de Gravação ***

            If Aliquota_ICMS <= 0 Then
               Begin
               BC_ICMS_Normal   := 0;
               BC_ICMS_Reduzida := 0;
            End;

            Str((BC_ICMS_Normal + BC_ICMS_Reduzida):13:2,BC_ICMS_Str);
            Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);

            //*** Primeira Linha + Valores de ICMS 1 ***

            Grava_Linha := 'R1' + Trim(Dia_Emissao) + Trim(Mes_Emissao) + Trim(Dia_Emissao) + Trim(Mes_Emissao) + '00NF    ' + Gera_Zeros_Str(Nota_Inicio, 6) + Gera_Zeros_Str('0', 6) + Gera_Espacos(Trim(Codigo_CFOP),5);
            Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.Text),',')),12);
            Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Str),',')),12);
            Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(IntToStr(Aliquota_ICMS)),',')),2) + '0000';
            Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_ICMS_Str),',')),12);
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';

            //*** Valores de ICMS 2 ***

            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';

            //*** Valores de ICMS 3 ***

            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';

            //*** Valores de ICMS 4 ***

            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';

            //*** Valores de ICMS 5 ***

            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';

            //*** Valores de IPI ***

            Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.Text),',')),12);
            Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text),',')),12);
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';

            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '000000000000';
            Grava_linha := Grava_Linha + '0';
            Grava_linha := Grava_Linha + Trim(Tipo_Nota);
            Grava_linha := Grava_Linha + '00';
            Grava_linha := Grava_Linha + Gera_Espacos('',14);

            Codigo_Cliente := Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_fornecedor_nro.Text);

            Comando_SQL := 'Select * from fb_fornecedores Where ';
            Comando_SQL := Comando_SQL + 'fb_fornecedor_numero = ' +#39+ Trim(Codigo_Cliente) +#39;
            Comando_SQL := Comando_SQL + ' Order By fb_fornecedor_codigo';

            ConexaoBD.SQL_Fornecedores.Close;
            ConexaoBD.SQL_Fornecedores.SQL.Clear;
            ConexaoBD.SQL_Fornecedores.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Fornecedores.Open;

            If Not ConexaoBD.SQL_Fornecedores.Eof Then
               Begin
               Codigo_Cliente := ConexaoBD.SQL_Fornecedoresfb_fornecedor_codigo.Text;
               End
            Else
               Begin
               Codigo_Cliente := '00.000.000/0000-00';
            End;

            If Trim(Codigo_Cliente) = '' Then
               Begin
               Codigo_Cliente := '00.000.000/0000-00';
            End;

            If ((Trim(Codigo_CFOP) = '3.101') Or (Trim(Codigo_CFOP) = '3101')) Then
               Begin
               Codigo_Cliente := '00.000.000/0000-00';
            End;

            Codigo_Cliente := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];

            Grava_linha := Grava_Linha + Gera_Espacos(Codigo_Cliente,14);
            Grava_linha := Grava_Linha + Gera_Espacos(Retira_Caracter(Retira_Caracter(Retira_Caracter(Copy(ConexaoBD.SQL_Fornecedoresfb_fornecedor_inscricao_estadual.Text,1,16),'.'),'-'),'/'),16);
            Grava_linha := Grava_Linha + Gera_Espacos(Copy(ConexaoBD.SQL_Fornecedoresfb_fornecedor_razao_social.Text,1,35),35);
            Grava_linha := Grava_Linha + Gera_Espacos('',18);

            If ((Trim(Codigo_CFOP) = '3.101') Or (Trim(Codigo_CFOP) = '3101')) Then
               Begin
               Grava_linha := Grava_Linha + Gera_Espacos('EX',2);
               End
            Else
               Begin
               Grava_linha := Grava_Linha + Gera_Espacos(Copy(ConexaoBD.SQL_Fornecedoresfb_fornecedor_estado.Text,1,2),2);
            End;

            Grava_linha := Grava_Linha + '0000';
            Grava_linha := Grava_Linha + Gera_Espacos('',50);

            ConexaoBD.SQL_Fornecedores.Close;

            WriteLn(Arq_Integracao_Entrada,Grava_Linha);

            //*************************************
            //*** INÍCIO - Gera os Registros R2 ***
            //*************************************

            Comando_SQL := 'Select * from fb_notas_entradas_produtos Where ';
            Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_numero = ' + Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_numero.Text);
            Comando_SQL := Comando_SQL + ' Order By fb_nota_entrada_produto_codigo';

            ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;
            ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Clear;
            ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Open;

            If conexaoBD.SQL_FB_Notas_Entradas_Produtos.RecordCount > 0 Then
               Begin

               conexaoBD.SQL_FB_Notas_Entradas_Produtos.First;

               While Not conexaoBD.SQL_FB_Notas_Entradas_Produtos.Eof Do
                     Begin

                     Produto_Codigo    := conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_cf.Text;
                     Produto_Codigo    := Retira_Caracter(Produto_Codigo,',');
                     Produto_Codigo    := Retira_Caracter(Produto_Codigo,'"');
                     Produto_Codigo    := Retira_Caracter(Produto_Codigo,'#39');
                     Produto_Codigo    := Retira_Caracter(Produto_Codigo,'.');

                     If Trim(Produto_Codigo) <> '' Then
                        Begin

                        //*** Início - Obtem a Descrição do NCM ***

                        Comando_SQL := 'Select * from classificacoes_fiscais_numeros Where ';
                        Comando_SQL := Comando_SQL + 'classificacao_fiscal_numero_ncm = ' +#39+ Trim(Produto_Codigo) +#39;
                        Comando_SQL := Comando_SQL + ' Order By classificacao_fiscal_numero_ncm Desc';

                        ConexaoBD.SQL_Classificacao_Numero.Close;
                        ConexaoBD.SQL_Classificacao_Numero.SQL.Clear;
                        ConexaoBD.SQL_Classificacao_Numero.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Classificacao_Numero.Open;

                        If ConexaoBD.SQL_Classificacao_Numero.RecordCount > 0 Then
                           Begin
                           Produto_Descricao := ConexaoBD.SQL_Classificacao_Numeroclassificacao_fiscal_numero_descricao.Text;
                           End
                        Else
                           Begin
                           Produto_Descricao := '---';
                        End;

                        //*** Fim - Obtem a Descrição do NCM ***

                        Produto_Descricao := Retira_Caracter(Produto_Descricao,',');
                        Produto_Descricao := Retira_Caracter(Produto_Descricao,'"');
                        Produto_Descricao := Retira_Caracter(Produto_Descricao,#39);

                        BC_IPI            := StrToFloat(Ponto_Virgula(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text)));
                        VLR_IPI           := 0;
                        VLR_IPI_Isento    := 0;

                        If StrToFloat(Ponto_Virgula(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_ipi.Text))) <= 0 Then
                           Begin
                           VLR_IPI_Isento := ((BC_IPI * StrToFloat(Ponto_Virgula(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_ipi.Text)))) / 100);
                           End
                        Else
                           Begin
                           VLR_IPI        := ((BC_IPI * StrToFloat(Ponto_Virgula(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_ipi.Text)))) / 100);
                        End;

                        //*** Linha dos Produtos ***

                        If Vlr_IPI <= 0 Then
                           Begin
                           BC_IPI := 0;
                        End;

                        Str(BC_IPI:13:2,BC_IPI_Str);
                        Str(VLR_IPI:13:2,VLR_IPI_Str);
                        Str(VLR_IPI_Isento:13:2,VLR_IPI_Isento_Str);

                        Grava_Linha := 'R2';
                        Grava_linha := Grava_Linha + Gera_Espacos('',8);
                        Grava_linha := Grava_Linha + Gera_Espacos(Produto_Codigo,10);
                        Grava_linha := Grava_Linha + Gera_Espacos(Produto_Descricao,25);
                        Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_IPI_Str),',')),12);
                        Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(VLR_IPI_Str),',')),12);
                        Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(VLR_IPI_Isento_Str),',')),12);
                        Grava_linha := Grava_Linha + Gera_Espacos('',50);

                        WriteLn(Arq_Integracao_Entrada,Grava_Linha);

                     End;

                     conexaoBD.SQL_FB_Notas_Entradas_Produtos.Next;
               End;
            End;

            //************************************
            //*** FINAL - Gera os Registros R2 ***
            //************************************

            ConexaoBD.SQL_FB_Notas_Entradas.Next;
        End;

        //*** Finaliza a Gravação do Arquivo ***

        CloseFile(Arq_Integracao_Entrada);

        //*** Inicio - Remove a Última Linha do Arquivo ***

        Ind         := 0;
        Conta_Linha := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);

              If Trim(Linha_Leitura) <> '' Then
                 Begin
                 Ind := Ind + 1;
              End;
        End;

        Conta_Linha := Ind;

        Closefile(Arq_Integracao_Leitura);

        SetLength(Relacao_Arquivo, Conta_Linha);

        Ind := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);
              Relacao_Arquivo[Ind] := Copy(Linha_Leitura,1,595);
              Ind := Ind + 1;
        End;

        Closefile(Arq_Integracao_Leitura);

        AssignFile(Arq_Integracao_Entrada,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada);
        Rewrite(Arq_Integracao_Entrada);

        For Ind := 0 To (Conta_Linha - 1) Do
            Begin

            Grava_Linha := Relacao_Arquivo[Ind];

            If Ind = (Conta_Linha - 1) Then
               Begin
               Write(Arq_Integracao_Entrada,Grava_Linha);
               End
            Else
               Begin
               WriteLn(Arq_Integracao_Entrada,Grava_Linha);
            End;
        End;

        CloseFile(Arq_Integracao_Entrada);

        //*** Final - Remove a Última Linha do Arquivo ***

        End
     Else
        Begin
        Seta();

        MSG_Erro('Nenhuma Nota Fiscal de Entrada foi encontrada...');

        Nome_Arq_Integracao_Entrada := '';
     End;

     //********************************************************************
     //*** SINTEGRA - Geração das Notas de Entradas - Arquivo R54 e R75 ***
     //********************************************************************

     //*********************
     //*** Registro - 54 ***
     //*********************

     DT_Inicio      := DT_Inicial.Text;
     DT_Final       := DT_Fim.Text;
     Mes_Integracao := Copy(Trim(DT_Fim.Text),4,2);

     //*** Efetua as Buscas das Notas de Entradas ***

     Comando_SQL := 'Select * from fb_notas_entradas Where ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_data_emissao >= ' +#39+ Inverte_Data_Plus(Trim(DT_Inicio),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' And fb_nota_entrada_data_emissao <= ' +#39+ Inverte_Data_Plus(Trim(DT_Final),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' Order By fb_nota_entrada_numero';

     ConexaoBD.SQL_FB_Notas_Entradas.Close;
     ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
     ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_FB_Notas_Entradas.Open;

     //*** Prepara Array para Verificar as Notas Canceladas ***

     If conexaoBD.SQL_FB_Notas_Entradas.RecordCount > 0 Then
        Begin

        //*** Prepara a Geração do Arquivo de Integração ***

        Nome_Arq_Integracao_Entrada_R54 := 'IBRASMAK54E' + Trim(Mes_Integracao) + '.TXT';

        If FileExists('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R54) Then
           Begin
           DeleteFile('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R54);
        End;

        AssignFile(Arq_Integracao_Entrada,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R54);

        Rewrite(Arq_Integracao_Entrada);

        //*** Gera as Notas Dentro do Arquivo ***

        Exibe_Integracao.Caption := 'Aguarde...';
        Exibe_Integracao.Refresh;

        Exibe_Integracao.Caption := 'Gerando Notas de Entradas...';
        Exibe_Integracao.Refresh;

        Dia_Emissao := '01';
        Mes_Emissao := Trim(Mes_Integracao);

        //*** Primeira Linha - Mestre do Estabelecimento ***

        //Grava_Linha := '1047139456000109581034396119  FUSI-BRAS FUSIVEIS BRASILEIROS LTDASAO PAULO                     SP1126014308' + Trim(Ano_Integracao) + Trim(Mes_Integracao) + '01' + Trim(Ano_Integracao) + Trim(Mes_Integracao) + Trim(Dia_Integracao) + '331';
        //WriteLn(Arq_Integracao_Entrada,Grava_Linha);

        //*** Segunda Linha - Dados Complementares ***

        //Grava_Linha := '11RUA BARRETOS                      00138                      ALTO DA MOOCA  03184080WALTER BRUZA                001126011501';
        //WriteLn(Arq_Integracao_Entrada,Grava_Linha);

        //*** Linhas 50, 54 e 75 ***

        Conta_Registro_50 := 0;
        Conta_Registro_54 := 0;
        Conta_Registro_75 := 0;

        conexaoBD.SQL_FB_Notas_Entradas.First;

        While Not conexaoBD.SQL_FB_Notas_Entradas.Eof Do
            Begin
            Vlr_Total          := 0;
            Vlr_Total_Separado := 0;
            Vlr_Total          := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
            Str(Vlr_Total:13:2,Valor_Str);
            Vlr_Total := StrToFloat(Ponto_Virgula(Valor_Str));

            Nota_Inicio        := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_numero.Text;

            Exibe_Integracao.Caption := 'Posição - Entradas R54: ' + Trim(Nota_Inicio);
            Exibe_Integracao.Refresh;

            //If (UpperCase(Trim(DBG_Observacao_Nota.Text)) = 'MATERIAL DESTINA-SE PARA CONSUMO') And
            //   (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6.107') And
            //   (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6107') Then
            //   Begin
            //   Material_Consumo := True;
            //   End
            //Else
            //   Begin
               Material_Consumo := False;
            //End;

            CFOP_Str := Copy(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text,1,1);

            If Trim(CFOP_Str) = '' Then
               Begin
               CFOP_Str := '0';
            End;

            CFOP_Nro := StrToInt(CFOP_Str);

            //If CFOP_Nro >= 5 Then
            //   Begin

               Data_Emissao := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_emissao.Text;

               Dia_Emissao  := Gera_Zeros_Str((Data_Emissao[1]+Data_Emissao[2]),2);
               Mes_Emissao  := Gera_Zeros_Str((Data_Emissao[4]+Data_Emissao[5]),2);

               Codigo_CFOP   := Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text);
               Codigo_CFOP_2 := Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop_2.Text);

               If Vlr_Total > 0 Then
                  Begin
                  If conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_base_icms.AsVariant > 0 Then
                     Begin
                     Aliquota_ICMS_Str := FloatToStr((conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_icms.AsVariant / conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_base_icms.AsVariant) * 100);
                     End
                  Else
                     Begin
                     Aliquota_ICMS_Str := '0';
                  End;
                  
                  Aliquota_ICMS_Str := Obtem_Antes(Aliquota_ICMS_Str,',');
                  Aliquota_ICMS := StrToInt(Aliquota_ICMS_Str);

                  If Aliquota_ICMS >= 17 Then
                     Begin
                     Aliquota_ICMS := 18;
                     End
                  Else If Aliquota_ICMS >= 11 Then
                     Begin
                     Aliquota_ICMS := 12;
                     End
                  Else If Aliquota_ICMS >= 6 Then
                     Begin
                     Aliquota_ICMS := 7;
                  End;

                  If (Trim(Codigo_CFOP_2) = '5.401') Or (Trim(Codigo_CFOP_2) = '5401') Then
                     Begin
                     Aliquota_ICMS := 18;
                  End;

                  End
               Else
                  Begin
                  Aliquota_ICMS := 0;
               End;

               Tipo_Nota     := '00';

               //*** Obtem os Produtos da Nota Fiscal ***

               BC_IPI_Isento     := 0;
               BC_IPI            := 0;
               VLR_IPI           := 0;
               VLR_Pis_Cofins    := 0;

               BC_ICMS_Isento    := 0;
               BC_ICMS_Reduzida  := 0;
               BC_ICMS_Normal    := 0;

               VLR_ICMS_Reduzida := 0;
               VLR_ICMS_Normal   := 0;

               Comando_SQL := 'Select * from fb_notas_entradas_produtos Where ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_numero = ' + Trim(Nota_Inicio);
               Comando_SQL := Comando_SQL + ' Order By fb_nota_entrada_produto_codigo';

               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Clear;
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Open;

               If conexaoBD.SQL_FB_Notas_Entradas_Produtos.RecordCount > 0 Then
                  Begin

                  conexaoBD.SQL_FB_Notas_Entradas_Produtos.First;

                  While Not conexaoBD.SQL_FB_Notas_Entradas_Produtos.Eof Do
                        Begin
                        Classificacao_Fiscal := conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_cf.Text;

                        BC_ICMS_Normal := BC_ICMS_Normal + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text));
                        BC_IPI         := BC_IPI + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text));

                        conexaoBD.SQL_FB_Notas_Entradas_Produtos.Next;
                  End;
               End;

               //*** Preparacao para Impressao do ICMS ***

               //*** Monta a Linha de Gravação ***

               If Material_Consumo Then
                  Begin
                  Vlr_IPI     := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text));

                  Bonificacao := StrToFloat(Ponto_Virgula('0'));

                  If Bonificacao > 0 Then
                     Begin
                     If BC_ICMS_Normal > 0 Then
                        Begin
                        BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
                     End;

                     If BC_ICMS_Reduzida > 0 Then
                        Begin
                        BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
                     End;
                  End;

                  VLR_ICMS_Normal   := (((BC_ICMS_Normal + Vlr_IPI) * Aliquota_ICMS) / 100);
                  VLR_ICMS_Reduzida := 0;

                  VLR_Pis_Cofins    := 0;
                  Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                  VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_ICMS_Isento := ((BC_ICMS_Normal + BC_ICMS_Reduzida) - (((BC_ICMS_Normal + BC_ICMS_Reduzida) * 7) / 100));
                        //Str(BC_ICMS_Isento:13:2,Valor_Str);
                        //BC_ICMS_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_ICMS_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_ICMS_Isento := (BC_ICMS_Normal + BC_ICMS_Reduzida);
                     End;

                     BC_ICMS_Normal    := 0;
                     BC_ICMS_Reduzida  := 0;

                     VLR_ICMS_Normal   := 0;
                     VLR_ICMS_Reduzida := 0;

                     Str(Vlr_Total:13:2,Vlr_Total_Str);

                     VLR_Pis_Cofins    := 0;
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text))) * 0.65) / 100);
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text))) * 3) / 100);
                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                     VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                     If ((Trim(Codigo_CFOP) = '5.901') Or (Trim(Codigo_CFOP) = '5901') Or (Trim(Codigo_CFOP) = '7.101') Or (Trim(Codigo_CFOP) = '7101')) Then
                        Begin
                        Vlr_Total      := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        BC_ICMS_Isento := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        BC_IPI         := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        Str(Vlr_Total:13:2,Vlr_Total_Str);
                        VLR_Pis_Cofins := 0;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                        End
                     Else If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        VLR_Pis_Cofins    := BC_ICMS_Isento;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                     End;

                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);

                     End
                  Else If ((Trim(Codigo_CFOP) = '6.107') Or (Trim(Codigo_CFOP) = '6107')) Then
                     Begin
                     Vlr_Total         := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.Text));
                     BC_ICMS_Normal    := Vlr_Total;
                     BC_ICMS_Reduzida  := 0;
                     VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  End;

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_IPI_Isento := (BC_IPI - ((BC_IPI * 7) / 100));
                        //Str(BC_IPI_Isento:13:2,Valor_Str);
                        //BC_IPI_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_IPI_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_IPI_Isento := BC_IPI;
                     End;

                     BC_IPI        := 0;
                     BC_IPI_Str    := '0.00';
                     Vlr_IPI_Str   := '0.00';
                     End
                  Else
                     Begin
                     Vlr_IPI_Str := '0.00';
                     //Str((BC_IPI + Vlr_IPI):13:2,BC_IPI_Str);
                     Str((BC_IPI):13:2,BC_IPI_Str);
                  End;

                  If Aliquota_ICMS <= 0 Then
                     Begin
                     BC_ICMS_Normal   := 0;
                     BC_ICMS_Reduzida := 0;
                  End;

                  Str(BC_IPI_Isento:13:2,BC_IPI_Isento_Str);

                  Str(BC_ICMS_Isento:13:2,BC_ICMS_Isento_Str);
                  Str(((BC_ICMS_Normal + BC_ICMS_Reduzida)+Vlr_IPI):13:2,BC_ICMS_Str);
                  Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);

                  End
               Else
                  Begin

                  Bonificacao := StrToFloat(Ponto_Virgula('0'));

                  If Bonificacao > 0 Then
                     Begin
                     If BC_ICMS_Normal > 0 Then
                        Begin
                        BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
                     End;

                     If BC_ICMS_Reduzida > 0 Then
                        Begin
                        BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
                     End;
                  End;

                  VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  VLR_ICMS_Reduzida := 0;

                  VLR_Pis_Cofins    := 0;
                  Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                  VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_ICMS_Isento := ((BC_ICMS_Normal + BC_ICMS_Reduzida) - (((BC_ICMS_Normal + BC_ICMS_Reduzida) * 7) / 100));
                        //Str(BC_ICMS_Isento:13:2,Valor_Str);
                        //BC_ICMS_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_ICMS_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_ICMS_Isento := (BC_ICMS_Normal + BC_ICMS_Reduzida);
                     End;

                     BC_ICMS_Normal    := 0;
                     BC_ICMS_Reduzida  := 0;

                     VLR_ICMS_Normal   := 0;
                     VLR_ICMS_Reduzida := 0;

                     Str(Vlr_Total:13:2,Vlr_Total_Str);

                     VLR_Pis_Cofins    := 0;
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text))) * 0.65) / 100);
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text))) * 3) / 100);
                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                     VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                     If ((Trim(Codigo_CFOP) = '5.901') Or (Trim(Codigo_CFOP) = '5901') Or (Trim(Codigo_CFOP) = '7.101') Or (Trim(Codigo_CFOP) = '7101')) Then
                        Begin
                        Vlr_Total      := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        BC_ICMS_Isento := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        BC_IPI         := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        Str(Vlr_Total:13:2,Vlr_Total_Str);
                        VLR_Pis_Cofins := 0;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                        End
                     Else If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        VLR_Pis_Cofins    := BC_ICMS_Isento;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                     End;

                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);

                     End
                  Else If ((Trim(Codigo_CFOP) = '6.107') Or (Trim(Codigo_CFOP) = '6107')) Then
                     Begin
                     Vlr_Total         := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.Text));
                     BC_ICMS_Normal    := Vlr_Total;
                     BC_ICMS_Reduzida  := 0;
                     VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  End;

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_IPI_Isento := (BC_IPI - ((BC_IPI * 7) / 100));
                        //Str(BC_IPI_Isento:13:2,Valor_Str);
                        //BC_IPI_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_IPI_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_IPI_Isento := BC_IPI;
                     End;

                     BC_IPI        := 0;
                     BC_IPI_Str    := '0.00';
                     Vlr_IPI_Str   := '0.00';
                     End
                  Else
                     Begin
                     Str(BC_IPI:13:2,BC_IPI_Str);
                     Vlr_IPI_Str := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text;
                  End;

                  If Aliquota_ICMS <= 0 Then
                     Begin
                     BC_ICMS_Normal   := 0;
                     BC_ICMS_Reduzida := 0;
                  End;

                  Str(BC_IPI_Isento:13:2,BC_IPI_Isento_Str);

                  Str(BC_ICMS_Isento:13:2,BC_ICMS_Isento_Str);
                  Str((BC_ICMS_Normal + BC_ICMS_Reduzida):13:2,BC_ICMS_Str);
                  Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);

               End;

               //*** Monta a Linha de Gravação ***

               //*** Registro 50 - Entradas ***

               Conta_Registro_50 := Conta_Registro_50 + 1;

               Grava_Linha := '50';

               Codigo_Cliente := Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_fornecedor_nro.Text);

               Comando_SQL := 'Select * from fb_fornecedores Where ';
               Comando_SQL := Comando_SQL + 'fb_fornecedor_numero = ' +#39+ Trim(Codigo_Cliente) +#39;
               Comando_SQL := Comando_SQL + ' Order By fb_fornecedor_numero';

               ConexaoBD.SQL_Fornecedores.Close;
               ConexaoBD.SQL_Fornecedores.SQL.Clear;
               ConexaoBD.SQL_Fornecedores.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Fornecedores.Open;

               Codigo_Cliente := ConexaoBD.SQL_Fornecedoresfb_fornecedor_codigo.Text;

               If Length(Trim(Codigo_Cliente)) < 11 Then
                  Begin
                  Codigo_Cliente := '';
                  End
               Else
                  Begin
                  Codigo_Cliente := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
               End;

               Grava_linha := Grava_Linha + Gera_Zeros_Str(Codigo_Cliente,14);
               Grava_linha := Grava_Linha + Gera_Espacos(Retira_Caracter(Retira_Caracter(Retira_Caracter(ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_estadual.Text,'.'),'-'),'/'),14);
               Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_emissao.Text,'amd',''),8);
               Grava_linha := Grava_Linha + Gera_Espacos(ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text,2);
               Grava_linha := Grava_Linha + Gera_Zeros_Str('01',2) + '   ';
               Grava_linha := Grava_Linha + Gera_Zeros_Str(ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_numero.Text,6);

               Classificacao_Fiscal     := ConexaoBD.SQL_FB_Produtosfb_produto_classif_fiscal.Text;
               Classificacao_Tributaria := ConexaoBD.SQL_FB_Produtosfb_produto_classif_tributaria.Text;
               Grava_CFOP               := Codigo_CFOP;

               If Trim(Codigo_CFOP_2) <> '' Then
                  Begin

                  If Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_estado_entrega.Text) = 'SP' Then
                     Begin

                     If (UpperCase(Trim(Classificacao_Fiscal)) = 'A') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'B') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'C') Then
                        Begin
                        Classificacao_Tributaria := '010';
                        Grava_CFOP               := Codigo_CFOP_2;
                     End;

                  End;
               End;

               Str(Vlr_Total:13:2,Vlr_Total_Str);

               Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Trim(Grava_CFOP),'.'),4);
               Grava_linha := Grava_Linha + 'P';
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Total_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_ICMS_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Isento_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros_Str('0',13);
               Grava_linha := Grava_Linha + Gera_Zeros(Aliquota_ICMS,2) + '00';
               Grava_linha := Grava_Linha + 'N';

               //WriteLn(Arq_Integracao_Entrada,Grava_Linha);

               //*** Gera uma Linha para cada Produto ***

               Comando_SQL := 'Select * from fb_notas_entradas_produtos Where ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_numero = ' + Trim(Nota_Inicio);
               Comando_SQL := Comando_SQL + ' Order By fb_nota_entrada_produto_posicao, fb_nota_entrada_produto_codigo';

               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Clear;
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Open;

               If conexaoBD.SQL_FB_Notas_Entradas_Produtos.RecordCount > 0 Then
                  Begin

                  //*** Obtem o IPI ***

                  Aliquota_IPI_54_75   := 0;
                  IPI_54_75            := 0;
                  Diferenca_54_75      := 0;
                  Diferenca_Base_54_75 := 0;
                  Qtde_54_75           := 0;
                  Qtde2_54_75          := 0;
                  Base_54_75           := 0;
                  Base2_54_75          := 0;

                  conexaoBD.SQL_FB_Notas_Entradas_Produtos.First;

                  While Not conexaoBD.SQL_FB_Notas_Entradas_Produtos.Eof Do
                        Begin
                        Qtde_54_75 := Qtde_54_75 + 1;

                        Aliquota_IPI_54_75 := 0;

                        If conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_ipi.AsFloat > 0 Then
                           Begin
                           Aliquota_IPI_54_75 := conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_ipi.AsFloat;
                           End
                        Else
                           Begin
                           If conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat > 0 Then
                              Begin
                              Aliquota_IPI_54_75 := ((conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.AsFloat / conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat) * 100);
                              End
                           Else
                              Begin
                              Aliquota_IPI_54_75 := 0;
                           End;
                        End;

                        IPI_54_75  := IPI_54_75 + ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsFloat * Aliquota_IPI_54_75) / 100);

                        conexaoBD.SQL_FB_Notas_Entradas_Produtos.Next;
                  End;

                  Str(IPI_54_75:13:2, Vlr_Str);
                  IPI_54_75 := StrToFloat(Ponto_Virgula(Vlr_Str));

                  Diferenca_54_75 := (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.AsFloat - IPI_54_75);
                  Diferenca_54_75 := (Diferenca_54_75 / Qtde_54_75);

                  //If (UpperCase(Trim(DBG_Observacao_Nota.Text)) = 'MATERIAL DESTINA-SE PARA CONSUMO') And
                  //   (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6.107') And
                  //   (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6107') Then
                  //   Begin
                  //   Material_Consumo := True;
                  //   End
                  //Else
                  //   Begin
                     Material_Consumo := False;
                  //End;

                  If Material_Consumo Then
                     Begin
                     Diferenca_54_75      := 0;
                     IPI_54_75            := 0;
                     Diferenca_Base_54_75 := (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.AsFloat / Qtde_54_75)
                     End
                  Else
                     Begin
                     Diferenca_Base_54_75 := 0;
                  End;

                  If (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) = '6.107') Or
                     (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) = '6107') Then
                     Begin
                     Diferenca_Base_54_75 := (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.AsFloat / Qtde_54_75)
                  End;

                  Str(Diferenca_54_75:13:2, Vlr_Str);
                  Diferenca_54_75 := StrToFloat(Ponto_Virgula(Vlr_Str));

                  IPI_54_75 := 0;

                  //*** Continua a Geração dos Registros ***

                  conexaoBD.SQL_FB_Notas_Entradas_Produtos.First;

                  Posicao_Produto := 0;
                  Qtde2_54_75     := 0;

                  While Not conexaoBD.SQL_FB_Notas_Entradas_Produtos.Eof Do
                        Begin
                        Qtde2_54_75 := Qtde2_54_75 + 1;

                        //*** Registro 54 - Entradas ***

                        Conta_Registro_54 := Conta_Registro_54 + 1;

                        Grava_Linha := '54';
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Codigo_Cliente,14);
                        Grava_linha := Grava_Linha + '01   ' + Gera_Zeros_Str(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_numero_nota.Text, 6);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Trim(Grava_CFOP),'.'),4);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Trim(Classificacao_Tributaria),3);

                        Posicao_Produto := Posicao_Produto + 1;
                        Grava_linha := Grava_Linha + Gera_Zeros(Posicao_Produto,3);
                        Grava_linha := Grava_Linha + Gera_Espacos(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_codigo.Text,14);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_qtde.Text),'.'),','),11);

                        If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                           Begin
                           If Material_Consumo  And
                             (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6.107') And
                             (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6107') Then
                              Begin
                              Str( ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant + Diferenca_Base_54_75) - ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant * 7) / 100)) :13:2, Vlr_Str);
                              End
                           Else
                              Begin
                              Str( ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant) - ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant * 7) / 100)) :13:2, Vlr_Str);
                           End;
                           End
                        Else
                           Begin
                           If Material_Consumo  And
                             (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6.107') And
                             (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6107') Then
                              Begin
                              Str( (conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant + Diferenca_Base_54_75) :13:2, Vlr_Str);
                              End
                           Else
                              Begin
                              Str( (conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant) :13:2, Vlr_Str);
                           End;
                        End;

                        Base2_54_75 := Base2_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                        If Qtde2_54_75 = Qtde_54_75 Then
                           Begin
                           If Diferenca_Base_54_75 <> 0 Then
                              Begin

                              If Material_Consumo  And
                                 (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6.107') And
                                 (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6107') Then
                                 Begin
                                 Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat - Base2_54_75)) :13:2, Vlr_Str);
                                 End
                              Else
                                 Begin

                                 If (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) = '6.107') Or
                                    (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) = '6107') Then
                                    Begin
                                    Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + ((conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat - conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.AsFloat)  - Base2_54_75)) :13:2, Vlr_Str);
                                    End
                                 Else
                                    Begin
                                    Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat - Base2_54_75)) :13:2, Vlr_Str);
                                 End;

                              End;

                           End;
                        End;

                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);

                        If Trim(Codigo_CFOP_2) <> '' Then
                           Begin

                           If Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_estado_entrega.Text) = 'SP' Then
                              Begin

                              If (UpperCase(Trim(Classificacao_Fiscal)) = 'A') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'B') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'C') Then
                                 Begin
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                 Str( (conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsFloat + Diferenca_Base_54_75) :13:2, Vlr_Str);

                                 Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                                 If Qtde2_54_75 = Qtde_54_75 Then
                                    Begin
                                    If Diferenca_Base_54_75 <> 0 Then
                                       Begin
                                       Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                    End;
                                 End;

                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                                 End
                              Else
                                 Begin
                                 Str( (conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsFloat + Diferenca_Base_54_75) :13:2, Vlr_Str);

                                 Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                                 If Qtde2_54_75 = Qtde_54_75 Then
                                    Begin
                                    If Diferenca_Base_54_75 <> 0 Then
                                       Begin
                                       Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                    End;
                                 End;

                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                              End;

                              End
                           Else
                              Begin
                              Str( (conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsFloat + Diferenca_Base_54_75) :13:2, Vlr_Str);

                              Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                              If Qtde2_54_75 = Qtde_54_75 Then
                                 Begin
                                 If Diferenca_Base_54_75 <> 0 Then
                                    Begin
                                    Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                 End;
                              End;

                              Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                              Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                           End;

                           End
                        Else
                           Begin

                           If ((Trim(Codigo_CFOP) = '6.109') Or
                               (Trim(Codigo_CFOP) = '6109') Or
                               (Trim(Codigo_CFOP) = '5.901') Or
                               (Trim(Codigo_CFOP) = '5901') Or
                               (Trim(Codigo_CFOP) = '5.902') Or
                               (Trim(Codigo_CFOP) = '5902') Or
                               (Trim(Codigo_CFOP) = '5.914') Or
                               (Trim(Codigo_CFOP) = '5914') Or
                               (Trim(Codigo_CFOP) = '5.915') Or
                               (Trim(Codigo_CFOP) = '5915') Or
                               (Trim(Codigo_CFOP) = '6.916') Or
                               (Trim(Codigo_CFOP) = '6916') Or
                               (Trim(Codigo_CFOP) = '7.101') Or
                               (Trim(Codigo_CFOP) = '7101') ) Then
                              Begin
                              If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                                 Begin
                                 Str( ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant + Diferenca_Base_54_75) - ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant * 7) / 100)) :13:2, Vlr_Str);

                                 Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                                 If Qtde2_54_75 = Qtde_54_75 Then
                                    Begin
                                    If Diferenca_Base_54_75 <> 0 Then
                                       Begin
                                       Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                    End;
                                 End;

                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                                 End
                              Else
                                 Begin
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);

                                 Str( (conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsFloat + Diferenca_Base_54_75) :13:2, Vlr_Str);

                                 Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                                 If Qtde2_54_75 = Qtde_54_75 Then
                                    Begin
                                    If Diferenca_Base_54_75 <> 0 Then
                                       Begin
                                       Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                    End;
                                 End;

                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                              End;
                              End
                           Else
                              Begin
                              Str( (conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsFloat + Diferenca_Base_54_75) :13:2, Vlr_Str);

                              Base_54_75 := Base_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));

                              If Qtde2_54_75 = Qtde_54_75 Then
                                 Begin
                                 If Diferenca_Base_54_75 <> 0 Then
                                    Begin
                                    Str( (StrToFloat(Ponto_Virgula(Vlr_Str)) + (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat - Base_54_75)) :13:2, Vlr_Str);
                                 End;
                              End;

                              Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                              Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                           End;

                        End;

                        Aliquota_IPI_54_75 := 0;

                        If Material_Consumo Then
                           Begin

                           Aliquota_IPI_54_75 := 0;

                           End
                        Else
                           Begin

                           If conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_ipi.AsFloat > 0 Then
                              Begin
                              Aliquota_IPI_54_75 := conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_ipi.AsFloat;
                              End
                           Else
                              Begin
                              If conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat > 0 Then
                                 Begin
                                 Aliquota_IPI_54_75 := ((conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.AsFloat / conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsFloat) * 100);
                                 End
                              Else
                                 Begin
                                 Aliquota_IPI_54_75 := 0;
                              End;
                           End;

                        End;

                        If Qtde2_54_75 = Qtde_54_75 Then
                           Begin

                           If Material_Consumo Then
                              Begin
                              Str( 0.00:13:2, Vlr_Str);
                              IPI_54_75 := IPI_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));
                              End
                           Else
                              Begin
                              Str( (conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.AsFloat - IPI_54_75):13:2, Vlr_Str);
                              IPI_54_75 := IPI_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));
                           End;

                           End
                        Else
                           Begin
                           Str( (((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsFloat * Aliquota_IPI_54_75) / 100) + Diferenca_54_75) :13:2, Vlr_Str);
                           IPI_54_75 := IPI_54_75 + StrToFloat(Ponto_Virgula(Vlr_Str));
                        End;

                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                        Grava_linha := Grava_Linha + Gera_Zeros(Aliquota_ICMS,2) + '00';

                        WriteLn(Arq_Integracao_Entrada,Grava_Linha);

                        //*** Registro 75 ***

                        Conta_Registro_75 := Conta_Registro_75 + 1;

                        Grava_linha := '75';
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_emissao.Text,'amd',''),8);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_emissao.Text,'amd',''),8);
                        Grava_linha := Grava_Linha + Gera_Espacos(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_codigo.Text,14);

                        //*** Início - Obtem o NCM ***

                        Comando_SQL := 'Select * from classificacoes_fiscais_letras Where ';   
                        Comando_SQL := Comando_SQL + 'classificacao_fiscal_letra_letra = ' +#39+ Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_cf.Text),'.') +#39;
                        Comando_SQL := Comando_SQL + ' Order By classificacao_fiscal_letra_ncm Desc';

                        ConexaoBD.SQL_Classificacao_Letra.Close;
                        ConexaoBD.SQL_Classificacao_Letra.SQL.Clear;
                        ConexaoBD.SQL_Classificacao_Letra.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Classificacao_Letra.Open;

                        If ConexaoBD.SQL_Classificacao_Letra.RecordCount > 0 Then
                           Begin
                           Produto_Codigo    := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm.Text;
                           Produto_Descricao := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm_descricao.Text;
                           End
                        Else
                           Begin
                           Produto_Codigo    := '84385000';
                           Produto_Descricao := 'MAQS.E APARS.P/PREPAR.DE CARNES';
                        End;

                        Produto_Codigo    := Retira_Caracter(Produto_Codigo,',');
                        Produto_Codigo    := Retira_Caracter(Produto_Codigo,'"');
                        Produto_Codigo    := Retira_Caracter(Produto_Codigo,'#39');
                        Produto_Codigo    := Retira_Caracter(Produto_Codigo,'.');

                        Produto_Descricao := Retira_Caracter(Produto_Descricao,',');
                        Produto_Descricao := Retira_Caracter(Produto_Descricao,'"');
                        Produto_Descricao := Retira_Caracter(Produto_Descricao,#39);

                        //*** Fim - Obtem o NCM ***

                        Grava_linha := Grava_Linha + Gera_Espacos(Produto_Codigo,8);
                        Grava_linha := Grava_Linha + Gera_Espacos(Produto_Descricao,53);

                        If Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_unid.Text) = '' Then
                           Begin
                           Grava_linha := Grava_Linha + Gera_Espacos('UN',6);
                           End
                        Else
                           Begin
                           Grava_linha := Grava_Linha + Gera_Espacos(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_unid.Text),6);
                        End;

                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Trim(Classificacao_Tributaria),3);
                        Grava_linha := Grava_Linha + '00' + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_ipi.Text),'.'),','),2);
                        Grava_linha := Grava_Linha + '00' + Gera_Zeros(Aliquota_ICMS,2);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str('0',4);

                        If Trim(Classificacao_Tributaria) = '010' Then
                           Begin
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_unit.Text),'.'),','),12);
                           End
                        Else
                           Begin
                           Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                        End;

                        //WriteLn(Arq_Integracao_Entrada,Grava_Linha);

                        conexaoBD.SQL_FB_Notas_Entradas_Produtos.Next;
                  End;

               End;

            //End;

            ConexaoBD.SQL_FB_Notas_Entradas.Next;
        End;

        Grava_linha := '9047139456000109581034396119  ';
        Grava_linha := Grava_linha + '50' + Gera_Zeros(Conta_Registro_50,8);
        Grava_linha := Grava_linha + '54' + Gera_Zeros(Conta_Registro_54,8);
        Grava_linha := Grava_linha + '75' + Gera_Zeros(Conta_Registro_75,8);
        Grava_linha := Grava_linha + '99' + Gera_Espacos('',63)+'1';

        //WriteLn(Arq_Integracao_Entrada,Grava_Linha);

        CloseFile(Arq_Integracao_Entrada);

        //*** Inicio - Remove a Última Linha do Arquivo ***

        Ind         := 0;
        Conta_Linha := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R54);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);

              If Trim(Linha_Leitura) <> '' Then
                 Begin
                 Ind := Ind + 1;
              End;
        End;

        Conta_Linha := Ind;

        Closefile(Arq_Integracao_Leitura);

        SetLength(Relacao_Arquivo, Conta_Linha);

        Ind := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R54);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);
              Relacao_Arquivo[Ind] := Copy(Linha_Leitura,1,126);
              Ind := Ind + 1;
        End;

        Closefile(Arq_Integracao_Leitura);

        AssignFile(Arq_Integracao_Entrada,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R54);
        Rewrite(Arq_Integracao_Entrada);

        For Ind := 0 To (Conta_Linha - 1) Do
            Begin

            Grava_Linha := Relacao_Arquivo[Ind];

            If Ind = (Conta_Linha - 1) Then
               Begin
               Write(Arq_Integracao_Entrada,Grava_Linha);
               End
            Else
               Begin
               WriteLn(Arq_Integracao_Entrada,Grava_Linha);
            End;
        End;

        CloseFile(Arq_Integracao_Entrada);

        //*** Final - Remove a Última Linha do Arquivo ***

        End
     Else
        Begin
        Seta();

        MSG_Erro('Nenhuma Nota Fiscal foi encontrada...');

        Nome_Arq_Integracao_Entrada_R54 := '';
     End;

     //*********************
     //*** Registro - 75 ***
     //*********************

     DT_Inicio      := DT_Inicial.Text;
     DT_Final       := DT_Fim.Text;
     Mes_Integracao := Copy(Trim(DT_Fim.Text),4,2);

     //*** Efetua as Buscas das Notas de Entradas ***

     Comando_SQL := 'Select * from fb_notas_entradas Where ';
     Comando_SQL := Comando_SQL + 'fb_nota_entrada_data_emissao >= ' +#39+ Inverte_Data_Plus(Trim(DT_Inicio),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' And fb_nota_entrada_data_emissao <= ' +#39+ Inverte_Data_Plus(Trim(DT_Final),'amd','/') +#39;
     Comando_SQL := Comando_SQL + ' Order By fb_nota_entrada_numero';

     ConexaoBD.SQL_FB_Notas_Entradas.Close;
     ConexaoBD.SQL_FB_Notas_Entradas.SQL.Clear;
     ConexaoBD.SQL_FB_Notas_Entradas.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_FB_Notas_Entradas.Open;

     //*** Prepara Array para Verificar as Notas Canceladas ***

     If conexaoBD.SQL_FB_Notas_Entradas.RecordCount > 0 Then
        Begin

        //*** Prepara a Geração do Arquivo de Integração ***

        Nome_Arq_Integracao_Entrada_R75 := 'IBRASMAK75E' + Trim(Mes_Integracao) + '.TXT';

        If FileExists('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R75) Then
           Begin
           DeleteFile('C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R75);
        End;

        AssignFile(Arq_Integracao_Entrada,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R75);

        Rewrite(Arq_Integracao_Entrada);

        //*** Gera as Notas Dentro do Arquivo ***

        Exibe_Integracao.Caption := 'Aguarde...';
        Exibe_Integracao.Refresh;

        Exibe_Integracao.Caption := 'Gerando Notas de Entradas...';
        Exibe_Integracao.Refresh;

        Dia_Emissao := '01';
        Mes_Emissao := Trim(Mes_Integracao);

        //*** Primeira Linha - Mestre do Estabelecimento ***

        //Grava_Linha := '1047139456000109581034396119  FUSI-BRAS FUSIVEIS BRASILEIROS LTDASAO PAULO                     SP1126014308' + Trim(Ano_Integracao) + Trim(Mes_Integracao) + '01' + Trim(Ano_Integracao) + Trim(Mes_Integracao) + Trim(Dia_Integracao) + '331';
        //WriteLn(Arq_Integracao_Entrada,Grava_Linha);

        //*** Segunda Linha - Dados Complementares ***

        //Grava_Linha := '11RUA BARRETOS                      00138                      ALTO DA MOOCA  03184080WALTER BRUZA                001126011501';
        //WriteLn(Arq_Integracao_Entrada,Grava_Linha);

        //*** Linhas 50, 54 e 75 ***

        Conta_Registro_50 := 0;
        Conta_Registro_54 := 0;
        Conta_Registro_75 := 0;

        conexaoBD.SQL_FB_Notas_Entradas.First;

        While Not conexaoBD.SQL_FB_Notas_Entradas.Eof Do
            Begin

            Vlr_Total          := 0;
            Vlr_Total_Separado := 0;
            Vlr_Total          := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
            Str(Vlr_Total:13:2,Valor_Str);
            Vlr_Total := StrToFloat(Ponto_Virgula(Valor_Str));

            Nota_Inicio        := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_numero.Text;

            Exibe_Integracao.Caption := 'Posição - Entradas R75: ' + Trim(Nota_Inicio);
            Exibe_Integracao.Refresh;

            //If (UpperCase(Trim(DBG_Observacao_Nota.Text)) = 'MATERIAL DESTINA-SE PARA CONSUMO') And
            //   (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6.107') And
            //   (Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text) <> '6107') Then
            //   Begin
            //   Material_Consumo := True;
            //   End
            //Else
            //   Begin
               Material_Consumo := False;
            //End;

            CFOP_Str := Copy(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text,1,1);

            If Trim(CFOP_Str) = '' Then
               Begin
               CFOP_Str := '0';
            End;

            CFOP_Nro := StrToInt(CFOP_Str);

            //If CFOP_Nro >= 5 Then
            //   Begin

               Data_Emissao := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_emissao.Text;

               Dia_Emissao  := Gera_Zeros_Str((Data_Emissao[1]+Data_Emissao[2]),2);
               Mes_Emissao  := Gera_Zeros_Str((Data_Emissao[4]+Data_Emissao[5]),2);

               Codigo_CFOP   := Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop.Text);
               Codigo_CFOP_2 := Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_cfop_2.Text);

               If Vlr_Total > 0 Then
                  Begin
                  If conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_base_icms.AsVariant > 0 Then
                     Begin
                     Aliquota_ICMS_Str := FloatToStr((conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_icms.AsVariant / conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_base_icms.AsVariant) * 100);
                     End
                  Else
                     Begin
                     Aliquota_ICMS_Str := '0';
                  End;
                  Aliquota_ICMS_Str := Obtem_Antes(Aliquota_ICMS_Str,',');
                  Aliquota_ICMS := StrToInt(Aliquota_ICMS_Str);

                  If Aliquota_ICMS >= 17 Then
                     Begin
                     Aliquota_ICMS := 18;
                     End
                  Else If Aliquota_ICMS >= 11 Then
                     Begin
                     Aliquota_ICMS := 12;
                     End
                  Else If Aliquota_ICMS >= 6 Then
                     Begin
                     Aliquota_ICMS := 7;
                  End;

                  If (Trim(Codigo_CFOP_2) = '5.401') Or (Trim(Codigo_CFOP_2) = '5401') Then
                     Begin
                     Aliquota_ICMS := 18;
                  End;

                  End
               Else
                  Begin
                  Aliquota_ICMS := 0;
               End;

               Tipo_Nota     := '00';

               //*** Obtem os Produtos da Nota Fiscal ***

               BC_IPI_Isento     := 0;
               BC_IPI            := 0;
               VLR_IPI           := 0;
               VLR_Pis_Cofins    := 0;

               BC_ICMS_Isento    := 0;
               BC_ICMS_Reduzida  := 0;
               BC_ICMS_Normal    := 0;

               VLR_ICMS_Reduzida := 0;
               VLR_ICMS_Normal   := 0;

               Comando_SQL := 'Select * from fb_notas_entradas_produtos Where ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_numero = ' + Trim(Nota_Inicio);
               Comando_SQL := Comando_SQL + ' Order By fb_nota_entrada_produto_codigo';

               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Clear;
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Open;

               If conexaoBD.SQL_FB_Notas_Entradas_Produtos.RecordCount > 0 Then
                  Begin

                  conexaoBD.SQL_FB_Notas_Entradas_Produtos.First;

                  While Not conexaoBD.SQL_FB_Notas_Entradas_Produtos.Eof Do
                        Begin
                        Classificacao_Fiscal := conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_cf.Text;

                        BC_ICMS_Normal := BC_ICMS_Normal + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text));
                        BC_IPI         := BC_IPI + StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text));

                        conexaoBD.SQL_FB_Notas_Entradas_Produtos.Next;
                  End;
               End;

               //*** Preparacao para Impressao do ICMS ***

               //*** Monta a Linha de Gravação ***

               If Material_Consumo Then
                  Begin
                  Vlr_IPI     := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text));

                  Bonificacao := StrToFloat(Ponto_Virgula('0'));

                  If Bonificacao > 0 Then
                     Begin
                     If BC_ICMS_Normal > 0 Then
                        Begin
                        BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
                     End;

                     If BC_ICMS_Reduzida > 0 Then
                        Begin
                        BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
                     End;
                  End;

                  VLR_ICMS_Normal   := (((BC_ICMS_Normal + Vlr_IPI) * Aliquota_ICMS) / 100);
                  VLR_ICMS_Reduzida := 0;

                  VLR_Pis_Cofins    := 0;
                  Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                  VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_ICMS_Isento := ((BC_ICMS_Normal + BC_ICMS_Reduzida) - (((BC_ICMS_Normal + BC_ICMS_Reduzida) * 7) / 100));
                        //Str(BC_ICMS_Isento:13:2,Valor_Str);
                        //BC_ICMS_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_ICMS_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_ICMS_Isento := (BC_ICMS_Normal + BC_ICMS_Reduzida);
                     End;

                     BC_ICMS_Normal    := 0;
                     BC_ICMS_Reduzida  := 0;

                     VLR_ICMS_Normal   := 0;
                     VLR_ICMS_Reduzida := 0;

                     Str(Vlr_Total:13:2,Vlr_Total_Str);

                     VLR_Pis_Cofins    := 0;
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text))) * 0.65) / 100);
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text))) * 3) / 100);
                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                     VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                     If ((Trim(Codigo_CFOP) = '5.901') Or (Trim(Codigo_CFOP) = '5901') Or (Trim(Codigo_CFOP) = '7.101') Or (Trim(Codigo_CFOP) = '7101')) Then
                        Begin
                        Vlr_Total      := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        BC_ICMS_Isento := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        BC_IPI         := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        Str(Vlr_Total:13:2,Vlr_Total_Str);
                        VLR_Pis_Cofins := 0;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                        End
                     Else If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        VLR_Pis_Cofins    := BC_ICMS_Isento;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                     End;

                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);

                     End
                  Else If ((Trim(Codigo_CFOP) = '6.107') Or (Trim(Codigo_CFOP) = '6107')) Then
                     Begin
                     Vlr_Total         := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.Text));
                     BC_ICMS_Normal    := Vlr_Total;
                     BC_ICMS_Reduzida  := 0;
                     VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  End;

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_IPI_Isento := (BC_IPI - ((BC_IPI * 7) / 100));
                        //Str(BC_IPI_Isento:13:2,Valor_Str);
                        //BC_IPI_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_IPI_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_IPI_Isento := BC_IPI;
                     End;

                     BC_IPI        := 0;
                     BC_IPI_Str    := '0.00';
                     Vlr_IPI_Str   := '0.00';
                     End
                  Else
                     Begin
                     Vlr_IPI_Str := '0.00';
                     //Str((BC_IPI + Vlr_IPI):13:2,BC_IPI_Str);
                     Str((BC_IPI):13:2,BC_IPI_Str);
                  End;

                  If Aliquota_ICMS <= 0 Then
                     Begin
                     BC_ICMS_Normal   := 0;
                     BC_ICMS_Reduzida := 0;
                  End;

                  Str(BC_IPI_Isento:13:2,BC_IPI_Isento_Str);

                  Str(BC_ICMS_Isento:13:2,BC_ICMS_Isento_Str);
                  Str(((BC_ICMS_Normal + BC_ICMS_Reduzida)+Vlr_IPI):13:2,BC_ICMS_Str);
                  Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);

                  End
               Else
                  Begin

                  Bonificacao := StrToFloat(Ponto_Virgula('0'));

                  If Bonificacao > 0 Then
                     Begin
                     If BC_ICMS_Normal > 0 Then
                        Begin
                        BC_ICMS_Normal := BC_ICMS_Normal - ((BC_ICMS_Normal * Bonificacao) / 100);
                     End;

                     If BC_ICMS_Reduzida > 0 Then
                        Begin
                        BC_ICMS_Reduzida := BC_ICMS_Reduzida - ((BC_ICMS_Reduzida * Bonificacao) / 100);
                     End;
                  End;

                  VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  VLR_ICMS_Reduzida := 0;

                  VLR_Pis_Cofins    := 0;
                  Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                  VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_ICMS_Isento := ((BC_ICMS_Normal + BC_ICMS_Reduzida) - (((BC_ICMS_Normal + BC_ICMS_Reduzida) * 7) / 100));
                        //Str(BC_ICMS_Isento:13:2,Valor_Str);
                        //BC_ICMS_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_ICMS_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_ICMS_Isento := (BC_ICMS_Normal + BC_ICMS_Reduzida);
                     End;

                     BC_ICMS_Normal    := 0;
                     BC_ICMS_Reduzida  := 0;

                     VLR_ICMS_Normal   := 0;
                     VLR_ICMS_Reduzida := 0;

                     Str(Vlr_Total:13:2,Vlr_Total_Str);

                     VLR_Pis_Cofins    := 0;
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text))) * 0.65) / 100);
                     VLR_Pis_Cofins    := VLR_Pis_Cofins + (((StrToFloat(Ponto_Virgula(Vlr_Total_Str)) - StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text))) * 3) / 100);
                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                     VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));

                     If ((Trim(Codigo_CFOP) = '5.901') Or (Trim(Codigo_CFOP) = '5901') Or (Trim(Codigo_CFOP) = '7.101') Or (Trim(Codigo_CFOP) = '7101')) Then
                        Begin
                        Vlr_Total      := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        BC_ICMS_Isento := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        BC_IPI         := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.AsVariant;
                        Str(Vlr_Total:13:2,Vlr_Total_Str);
                        VLR_Pis_Cofins := 0;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                        End
                     Else If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        VLR_Pis_Cofins    := BC_ICMS_Isento;
                        Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);
                        VLR_Pis_Cofins := StrToFloat(Ponto_Virgula(VLR_Pis_Cofins_Str));
                     End;

                     Str(VLR_Pis_Cofins:13:2,VLR_Pis_Cofins_Str);

                     End
                  Else If ((Trim(Codigo_CFOP) = '6.107') Or (Trim(Codigo_CFOP) = '6107')) Then
                     Begin
                     Vlr_Total         := StrToFloat(Ponto_Virgula(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_nota.Text));
                     BC_ICMS_Normal    := Vlr_Total;
                     BC_ICMS_Reduzida  := 0;
                     VLR_ICMS_Normal   := ((BC_ICMS_Normal * Aliquota_ICMS) / 100);
                  End;

                  If ((Trim(Codigo_CFOP) = '6.109') Or
                      (Trim(Codigo_CFOP) = '6109') Or
                      (Trim(Codigo_CFOP) = '5.901') Or
                      (Trim(Codigo_CFOP) = '5901') Or
                      (Trim(Codigo_CFOP) = '5.902') Or
                      (Trim(Codigo_CFOP) = '5902') Or
                      (Trim(Codigo_CFOP) = '5.914') Or
                      (Trim(Codigo_CFOP) = '5914') Or
                      (Trim(Codigo_CFOP) = '5.915') Or
                      (Trim(Codigo_CFOP) = '5915') Or
                      (Trim(Codigo_CFOP) = '6.916') Or
                      (Trim(Codigo_CFOP) = '6916') Or
                      (Trim(Codigo_CFOP) = '7.101') Or
                      (Trim(Codigo_CFOP) = '7101') ) Then
                     Begin

                     If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                        Begin
                        //BC_IPI_Isento := (BC_IPI - ((BC_IPI * 7) / 100));
                        //Str(BC_IPI_Isento:13:2,Valor_Str);
                        //BC_IPI_Isento := StrToFloat(Ponto_Virgula(Valor_Str));
                        BC_IPI_Isento := Vlr_Total;
                        End
                     Else
                        Begin
                        BC_IPI_Isento := BC_IPI;
                     End;

                     BC_IPI        := 0;
                     BC_IPI_Str    := '0.00';
                     Vlr_IPI_Str   := '0.00';
                     End
                  Else
                     Begin
                     Str(BC_IPI:13:2,BC_IPI_Str);
                     Vlr_IPI_Str := conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_p_vlr_ipi.Text;
                  End;

                  If Aliquota_ICMS <= 0 Then
                     Begin
                     BC_ICMS_Normal   := 0;
                     BC_ICMS_Reduzida := 0;
                  End;

                  Str(BC_IPI_Isento:13:2,BC_IPI_Isento_Str);

                  Str(BC_ICMS_Isento:13:2,BC_ICMS_Isento_Str);
                  Str((BC_ICMS_Normal + BC_ICMS_Reduzida):13:2,BC_ICMS_Str);
                  Str((VLR_ICMS_Normal + VLR_ICMS_Reduzida):13:2,Vlr_ICMS_Str);

               End;

               //*** Monta a Linha de Gravação ***

               //*** Registro 50 - Entradas ***

               Conta_Registro_50 := Conta_Registro_50 + 1;

               Grava_Linha := '50';

               Codigo_Cliente := Trim(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_fornecedor_nro.Text);

               Comando_SQL := 'Select * from fb_fornecedores Where ';
               Comando_SQL := Comando_SQL + 'fb_fornecedor_numero = ' +#39+ Trim(Codigo_Cliente) +#39;
               Comando_SQL := Comando_SQL + ' Order By fb_fornecedor_numero';

               ConexaoBD.SQL_Fornecedores.Close;
               ConexaoBD.SQL_Fornecedores.SQL.Clear;
               ConexaoBD.SQL_Fornecedores.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_Fornecedores.Open;

               Codigo_Cliente := Trim(conexaoBD.SQL_Fornecedoresfb_fornecedor_codigo.Text);

               If Length(Trim(Codigo_Cliente)) < 11 Then
                  Begin
                  Codigo_Cliente := '';
                  End
               Else
                  Begin
                  Codigo_Cliente := Codigo_Cliente[1]+Codigo_Cliente[2]+Codigo_Cliente[4]+Codigo_Cliente[5]+Codigo_Cliente[6]+Codigo_Cliente[8]+Codigo_Cliente[9]+Codigo_Cliente[10]+Codigo_Cliente[12]+Codigo_Cliente[13]+Codigo_Cliente[14]+Codigo_Cliente[15]+Codigo_Cliente[17]+Codigo_Cliente[18];
               End;

               Grava_linha := Grava_Linha + Gera_Zeros_Str(Codigo_Cliente,14);
               Grava_linha := Grava_Linha + Gera_Espacos(Retira_Caracter(Retira_Caracter(Retira_Caracter(ConexaoBD.SQL_FB_Clientesfb_cliente_inscricao_estadual.Text,'.'),'-'),'/'),14);
               Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_emissao.Text,'amd',''),8);
               Grava_linha := Grava_Linha + Gera_Espacos(ConexaoBD.SQL_FB_Clientesfb_cliente_estado.Text,2);
               Grava_linha := Grava_Linha + Gera_Zeros_Str('01',2) + '   ';
               Grava_linha := Grava_Linha + Gera_Zeros_Str(ConexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_numero.Text,6);

               Classificacao_Fiscal     := conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_cf.Text;
               Classificacao_Tributaria := conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_st.Text;
               Grava_CFOP               := Codigo_CFOP;

               If Trim(Codigo_CFOP_2) <> '' Then
                  Begin

                  If Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_estado_entrega.Text) = 'SP' Then
                     Begin

                     If (UpperCase(Trim(Classificacao_Fiscal)) = 'A') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'B') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'C') Then
                        Begin
                        Classificacao_Tributaria := '010';
                        Grava_CFOP               := Codigo_CFOP_2;
                     End;

                  End;
               End;

               Str(Vlr_Total:13:2,Vlr_Total_Str);

               Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Trim(Grava_CFOP),'.'),4);
               Grava_linha := Grava_Linha + 'P';
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_Total_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(Vlr_ICMS_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros(StrToInt(Retira_Caracter(Ponto_Virgula(BC_ICMS_Isento_Str),',')),13);
               Grava_linha := Grava_Linha + Gera_Zeros_Str('0',13);
               Grava_linha := Grava_Linha + Gera_Zeros(Aliquota_ICMS,2) + '00';
               Grava_linha := Grava_Linha + 'N';

               //WriteLn(Arq_Integracao_Entrada,Grava_Linha);

               //*** Gera uma Linha para cada Produto ***

               Comando_SQL := 'Select * from fb_notas_entradas_produtos Where ';
               Comando_SQL := Comando_SQL + 'fb_nota_entrada_produto_numero = ' + Trim(Nota_Inicio);
               Comando_SQL := Comando_SQL + ' Order By fb_nota_entrada_produto_posicao, fb_nota_entrada_produto_codigo';

               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Close;
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Clear;
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.SQL.Add(Comando_SQL);
               ConexaoBD.SQL_FB_Notas_Entradas_Produtos.Open;

               If conexaoBD.SQL_FB_Notas_Entradas_Produtos.RecordCount > 0 Then
                  Begin

                  conexaoBD.SQL_FB_Notas_Entradas_Produtos.First;

                  Posicao_Produto := 0;

                  While Not conexaoBD.SQL_FB_Notas_Entradas_Produtos.Eof Do
                        Begin
                        //*** Registro 54 - Entradas ***

                        Conta_Registro_54 := Conta_Registro_54 + 1;

                        Grava_Linha := '54';
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Codigo_Cliente,14);
                        Grava_linha := Grava_Linha + '01   ' + Gera_Zeros_Str(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_numero_nota.Text, 6);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Trim(Grava_CFOP),'.'),4);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Trim(Classificacao_Tributaria),3);

                        Posicao_Produto := Posicao_Produto + 1;
                        Grava_linha := Grava_Linha + Gera_Zeros(Posicao_Produto,3);
                        Grava_linha := Grava_Linha + Gera_Espacos(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_codigo.Text,14);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_qtde.Text),'.'),','),11);

                        If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                           Begin
                           Str( ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant) - ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant * 7) / 100)) :13:2, Vlr_Str);
                           End
                        Else
                           Begin
                           Str( (conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_qtde.AsVariant * ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant) / 100)) :13:2, Vlr_Str);
                        End;

                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);

                        If Trim(Codigo_CFOP_2) <> '' Then
                           Begin

                           If Trim(ConexaoBD.SQL_FB_Clientesfb_cliente_estado_entrega.Text) = 'SP' Then
                              Begin

                              If (UpperCase(Trim(Classificacao_Fiscal)) = 'A') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'B') Or (UpperCase(Trim(Classificacao_Fiscal)) = 'C') Then
                                 Begin
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text),'.'),','),12);
                                 End
                              Else
                                 Begin
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text),'.'),','),12);
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                              End;

                              End
                           Else
                              Begin
                              Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text),'.'),','),12);
                              Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                           End;

                           End
                        Else
                           Begin

                           If ((Trim(Codigo_CFOP) = '6.109') Or
                               (Trim(Codigo_CFOP) = '6109') Or
                               (Trim(Codigo_CFOP) = '5.901') Or
                               (Trim(Codigo_CFOP) = '5901') Or
                               (Trim(Codigo_CFOP) = '5.902') Or
                               (Trim(Codigo_CFOP) = '5902') Or
                               (Trim(Codigo_CFOP) = '5.914') Or
                               (Trim(Codigo_CFOP) = '5914') Or
                               (Trim(Codigo_CFOP) = '5.915') Or
                               (Trim(Codigo_CFOP) = '5915') Or
                               (Trim(Codigo_CFOP) = '6.916') Or
                               (Trim(Codigo_CFOP) = '6916') Or
                               (Trim(Codigo_CFOP) = '7.101') Or
                               (Trim(Codigo_CFOP) = '7101') ) Then
                              Begin
                              If ((Trim(Codigo_CFOP) = '6.109') Or (Trim(Codigo_CFOP) = '6109')) Then
                                 Begin
                                 Str( ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant) - ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsVariant * 7) / 100)) :13:2, Vlr_Str);

                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                                 End
                              Else
                                 Begin
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                                 Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text),'.'),','),12);
                              End;
                              End
                           Else
                              Begin
                              Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.Text),'.'),','),12);
                              Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                           End;

                        End;

                        Str( ((conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_total.AsFloat * conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_ipi.AsFloat) / 100) :13:2, Vlr_Str);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(Vlr_Str),'.'),','),12);
                        Grava_linha := Grava_Linha + Gera_Zeros(Aliquota_ICMS,2) + '00';

                        //WriteLn(Arq_Integracao_Entrada,Grava_Linha);

                        //*** Registro 75 ***

                        Conta_Registro_75 := Conta_Registro_75 + 1;

                        Grava_linha := '75';
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_emissao.Text,'amd',''),8);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Inverte_Data_Plus(conexaoBD.SQL_FB_Notas_Entradasfb_nota_entrada_data_emissao.Text,'amd',''),8);
                        Grava_linha := Grava_Linha + Gera_Espacos(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_codigo.Text,14);

                        //*** Início - Obtem o NCM ***

                        Comando_SQL := 'Select * from classificacoes_fiscais_letras Where ';
                        Comando_SQL := Comando_SQL + 'classificacao_fiscal_letra_letra = ' +#39+ Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_cf.Text),'.') +#39;
                        Comando_SQL := Comando_SQL + ' Order By classificacao_fiscal_letra_ncm Desc';

                        ConexaoBD.SQL_Classificacao_Letra.Close;
                        ConexaoBD.SQL_Classificacao_Letra.SQL.Clear;
                        ConexaoBD.SQL_Classificacao_Letra.SQL.Add(Comando_SQL);
                        ConexaoBD.SQL_Classificacao_Letra.Open;

                        If ConexaoBD.SQL_Classificacao_Letra.RecordCount > 0 Then
                           Begin
                           Produto_Codigo    := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm.Text;
                           Produto_Descricao := ConexaoBD.SQL_Classificacao_Letraclassificacao_fiscal_letra_ncm_descricao.Text;
                           End
                        Else
                           Begin
                           Produto_Codigo    := '84385000';
                           Produto_Descricao := 'MAQS.E APARS.P/PREPAR.DE CARNES';
                        End;

                        Produto_Codigo    := Retira_Caracter(Produto_Codigo,',');
                        Produto_Codigo    := Retira_Caracter(Produto_Codigo,'"');
                        Produto_Codigo    := Retira_Caracter(Produto_Codigo,'#39');
                        Produto_Codigo    := Retira_Caracter(Produto_Codigo,'.');

                        Produto_Descricao := Retira_Caracter(Produto_Descricao,',');
                        Produto_Descricao := Retira_Caracter(Produto_Descricao,'"');
                        Produto_Descricao := Retira_Caracter(Produto_Descricao,#39);

                        //*** Fim - Obtem o NCM ***

                        Grava_linha := Grava_Linha + Gera_Espacos(Produto_Codigo,8);
                        Grava_linha := Grava_Linha + Gera_Espacos(Produto_Descricao,53);

                        If Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_unid.Text) = '' Then
                           Begin
                           Grava_linha := Grava_Linha + Gera_Espacos('UN',6);
                           End
                        Else
                           Begin
                           Grava_linha := Grava_Linha + Gera_Espacos(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_unid.Text),6);
                        End;

                        Grava_linha := Grava_Linha + Gera_Zeros_Str(Trim(Classificacao_Tributaria),3);
                        Grava_linha := Grava_Linha + '00' + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_ipi.Text),'.'),','),2);
                        Grava_linha := Grava_Linha + '00' + Gera_Zeros(Aliquota_ICMS,2);
                        Grava_linha := Grava_Linha + Gera_Zeros_Str('0',4);

                        If Trim(Classificacao_Tributaria) = '010' Then
                           Begin
                           Grava_linha := Grava_Linha + Gera_Zeros_Str(Retira_Caracter(Retira_Caracter(Trim(conexaoBD.SQL_FB_Notas_Entradas_Produtosfb_nota_entrada_produto_vlr_unit.Text),'.'),','),12);
                           End
                        Else
                           Begin
                           Grava_linha := Grava_Linha + Gera_Zeros_Str('0',12);
                        End;

                        WriteLn(Arq_Integracao_Entrada,Grava_Linha);

                        conexaoBD.SQL_FB_Notas_Entradas_Produtos.Next;
                  End;

               End;

            //End;

            ConexaoBD.SQL_FB_Notas_Entradas.Next;

        End;

        Grava_linha := '9047139456000109581034396119  ';
        Grava_linha := Grava_linha + '50' + Gera_Zeros(Conta_Registro_50,8);
        Grava_linha := Grava_linha + '54' + Gera_Zeros(Conta_Registro_54,8);
        Grava_linha := Grava_linha + '75' + Gera_Zeros(Conta_Registro_75,8);
        Grava_linha := Grava_linha + '99' + Gera_Espacos('',63)+'1';

        //WriteLn(Arq_Integracao_Entrada,Grava_Linha);

        //*** Finaliza a Gravação do Arquivo ***

        CloseFile(Arq_Integracao_Entrada);

        //*** Inicio - Remove a Última Linha do Arquivo ***

        Ind         := 0;
        Conta_Linha := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R75);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);

              If Trim(Linha_Leitura) <> '' Then
                 Begin
                 Ind := Ind + 1;
              End;
        End;

        Conta_Linha := Ind;

        Closefile(Arq_Integracao_Leitura);

        SetLength(Relacao_Arquivo, Conta_Linha);

        Ind := 0;

        AssignFile(Arq_Integracao_Leitura,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R75);
        Reset(Arq_Integracao_Leitura);

        While Not Eof(Arq_Integracao_Leitura) do
              Begin
              Readln(Arq_Integracao_Leitura,Linha_Leitura);
              Relacao_Arquivo[Ind] := Copy(Linha_Leitura,1,126);
              Ind := Ind + 1;
        End;

        Closefile(Arq_Integracao_Leitura);

        AssignFile(Arq_Integracao_Entrada,'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R75);
        Rewrite(Arq_Integracao_Entrada);

        For Ind := 0 To (Conta_Linha - 1) Do
            Begin

            Grava_Linha := Relacao_Arquivo[Ind];

            If Ind = (Conta_Linha - 1) Then
               Begin
               Write(Arq_Integracao_Entrada,Grava_Linha);
               End
            Else
               Begin
               WriteLn(Arq_Integracao_Entrada,Grava_Linha);
            End;
        End;

        CloseFile(Arq_Integracao_Entrada);

        //*** Final - Remove a Última Linha do Arquivo ***

        End
     Else
        Begin
        Seta();

        MSG_Erro('Nenhuma Nota Fiscal foi encontrada...');

        Nome_Arq_Integracao_Entrada_R75 := '';
     End;

     Exibe_Integracao.Caption := '';
     Exibe_Integracao.Refresh;

     //***********************
     //*** Envio do E-Mail ***
     //***********************

     Seta();

     BT_Gerar.Enabled := True;
     BT_Sair.Enabled  := True;

     If Confirma('Geração do Arquivo de Integracao está Finalizada. Clque em SIM para abrir o E-Mail com os arquivos em anexo.') = 6 Then
        Begin

        If (Trim(Nome_Arq_Integracao_Saida_R75) <> '') Or (Trim(Nome_Arq_Integracao_Saida_R54) <> '') Or (Trim(Nome_Arq_Integracao_Saida) <> '') Or (Trim(Nome_Arq_Integracao_Entrada) <> '') Then
           Begin

           //*** Abrindo o E-Mail ***

           Email := '';
           Email := Email + 'IBRASMAK - Arquivos de Integração - CONTMATIC.:' + Trim(Mes_Integracao) + '/' + Trim(Ano_Integracao);

           Anexo_Saida       := '';
           Anexo_Saida_R54   := '';
           Anexo_Saida_R75   := '';
           Anexo_Entrada     := '';
           Anexo_Entrada_R54 := '';
           Anexo_Entrada_R75 := '';

           If Trim(Nome_Arq_Integracao_Saida_R54) <> '' Then
              Begin
              Anexo_Saida_R54 := 'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R54;
           End;

           If Trim(Nome_Arq_Integracao_Saida_R75) <> '' Then
              Begin
              Anexo_Saida_R75 := 'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida_R75;
           End;

           If Trim(Nome_Arq_Integracao_Saida) <> '' Then
              Begin
              Anexo_Saida   := 'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Saida;
           End;

           If Trim(Nome_Arq_Integracao_Entrada) <> '' Then
              Begin
              Anexo_Entrada := 'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada;
           End;

           If Trim(Nome_Arq_Integracao_Entrada_R54) <> '' Then
              Begin
              Anexo_Entrada_R54 := 'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R54;
           End;

           If Trim(Nome_Arq_Integracao_Entrada_R75) <> '' Then
              Begin
              Anexo_Entrada_R75 := 'C:\Ibrasmak\Contabilidade\'+Nome_Arq_Integracao_Entrada_R75;
           End;

           mail := TStringList.Create;
           try
              mail.values['to'] := Trim(''); ///AQUI VAI O EMAIL DO DESTINATARIO///
              mail.values['subject'] := 'IBRASMAK - Arquivos de Integração - CONTMATIC.:' + Trim(Mes_Integracao) + '/' + Trim(Ano_Integracao); ///AQUI O ASSUNTO///
              mail.values['body'] := Email; ///AQUI O TEXTO NO CORPO DO EMAIL///
              mail.values['attachment0'] := Anexo_Saida; ////AQUI O ENDEREÇO ONDE ENCONTRAM OS ARQUIVOS//
              mail.values['attachment1'] := Anexo_Saida_R54; ////AQUI O ENDEREÇO ONDE ENCONTRAM OS ARQUIVOS//
              mail.values['attachment2'] := Anexo_Saida_R75; ////AQUI O ENDEREÇO ONDE ENCONTRAM OS ARQUIVOS//
              mail.values['attachment3'] := Anexo_Entrada; ////AQUI O ENDEREÇO ONDE ENCONTRAM OS ARQUIVOS//
              mail.values['attachment4'] := Anexo_Entrada_R54; ////AQUI O ENDEREÇO ONDE ENCONTRAM OS ARQUIVOS//
              mail.values['attachment5'] := Anexo_Entrada_R75; ////AQUI O ENDEREÇO ONDE ENCONTRAM OS ARQUIVOS//
              sendEMail(Application.Handle, mail);
           finally
              mail.Free;
           end;
        End;
     End;

     ArquivoIntegracao00.Close;
end;

procedure TArquivoIntegracao00.BT_SairClick(Sender: TObject);
begin
     ArquivoIntegracao00.Close;
end;

procedure TArquivoIntegracao00.BT_GerarClick(Sender: TObject);
begin
      Gera_Integracao();
end;

procedure TArquivoIntegracao00.FormShow(Sender: TObject);

Var
   Mes_Reajuste: Integer;
   Ano_01, Ano_02: String;

begin
     DT_Inicial.Text := '01'+Copy(DateToStr(Date()),3,8);
     DT_Fim.Text     := DateToStr(Date());
end;

procedure TArquivoIntegracao00.Integracao_MesKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TArquivoIntegracao00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TArquivoIntegracao00.DT_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TArquivoIntegracao00.DT_FimKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
