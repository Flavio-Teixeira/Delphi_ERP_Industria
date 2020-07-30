unit Cria_PDF_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, PReport, OleCtrls, PdfLib_TLB,
  PdfDoc, ShellAPI, Mapi, jpeg, PRJpegImage;

type
  TCriaPDF02 = class(TForm)
    Menu_Principal: TPanel;
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    GroupBox1: TGroupBox;
    Pdf: TPdf;
    PRPage: TPRPage;
    PRLayoutPanel1: TPRLayoutPanel;
    OpenDialog1: TOpenDialog;
    PReport1: TPReport;
    PRRect1: TPRRect;
    PRLabel15: TPRLabel;
    PRRect2: TPRRect;
    PRLabel16: TPRLabel;
    PRRect4: TPRRect;
    PRRect5: TPRRect;
    PRRect6: TPRRect;
    PRRect7: TPRRect;
    PRRect8: TPRRect;
    PRRect11: TPRRect;
    PRRect12: TPRRect;
    PRRect13: TPRRect;
    PRLabel17: TPRLabel;
    PRL_Entrega: TPRLabel;
    PRL_Pagamento: TPRLabel;
    PRL_Fax: TPRLabel;
    PRL_Fone_1: TPRLabel;
    PRL_Contato: TPRLabel;
    PRL_Nome: TPRLabel;
    PRL_OBS1: TPRLabel;
    PRRect14: TPRRect;
    PRRect15: TPRRect;
    PRRect16: TPRRect;
    PRRect17: TPRRect;
    PRLabel1: TPRLabel;
    PRLabel2: TPRLabel;
    PRLabel3: TPRLabel;
    PRLabel4: TPRLabel;
    BT_Ok: TBitBtn;
    PRL_Data_Requisicao: TPRLabel;
    PRLabel5: TPRLabel;
    PRLabel6: TPRLabel;
    PRLabel7: TPRLabel;
    PRLabel8: TPRLabel;
    PRLabel18: TPRLabel;
    PRLabel19: TPRLabel;
    PRL_VlrTotal: TPRLabel;
    PRRect18: TPRRect;
    PRLabel22: TPRLabel;
    PRRect19: TPRRect;
    PRRect20: TPRRect;
    PRRect21: TPRRect;
    PRRect23: TPRRect;
    PRRect24: TPRRect;
    PRRect25: TPRRect;
    PRRect26: TPRRect;
    PRRect27: TPRRect;
    PRRect28: TPRRect;
    PRRect29: TPRRect;
    PRL_Item_01: TPRLabel;
    PRL_Qtde_01: TPRLabel;
    PRL_Desc_01: TPRLabel;
    PRL_Valor_01: TPRLabel;
    PRL_IPI_01: TPRLabel;
    PRRect30: TPRRect;
    PRRect31: TPRRect;
    PRRect32: TPRRect;
    PRRect33: TPRRect;
    PRRect34: TPRRect;
    PRRect35: TPRRect;
    PRRect36: TPRRect;
    PRRect37: TPRRect;
    PRRect38: TPRRect;
    PRRect39: TPRRect;
    PRRect40: TPRRect;
    PRRect41: TPRRect;
    PRRect42: TPRRect;
    PRRect43: TPRRect;
    PRRect44: TPRRect;
    PRRect45: TPRRect;
    PRRect46: TPRRect;
    PRRect47: TPRRect;
    PRRect48: TPRRect;
    PRRect49: TPRRect;
    PRRect50: TPRRect;
    PRRect51: TPRRect;
    PRRect52: TPRRect;
    PRRect53: TPRRect;
    PRRect54: TPRRect;
    PRRect55: TPRRect;
    PRRect56: TPRRect;
    PRRect57: TPRRect;
    PRRect58: TPRRect;
    PRRect59: TPRRect;
    PRRect60: TPRRect;
    PRRect61: TPRRect;
    PRRect62: TPRRect;
    PRRect63: TPRRect;
    PRRect64: TPRRect;
    PRRect65: TPRRect;
    PRRect66: TPRRect;
    PRRect67: TPRRect;
    PRRect68: TPRRect;
    PRRect69: TPRRect;
    PRRect70: TPRRect;
    PRRect71: TPRRect;
    PRRect72: TPRRect;
    PRRect73: TPRRect;
    PRRect74: TPRRect;
    PRRect75: TPRRect;
    PRRect76: TPRRect;
    PRRect77: TPRRect;
    PRRect78: TPRRect;
    PRRect79: TPRRect;
    PRRect80: TPRRect;
    PRRect81: TPRRect;
    PRRect82: TPRRect;
    PRRect83: TPRRect;
    PRRect84: TPRRect;
    PRRect85: TPRRect;
    PRRect86: TPRRect;
    PRRect87: TPRRect;
    PRRect88: TPRRect;
    PRRect89: TPRRect;
    PRRect90: TPRRect;
    PRRect91: TPRRect;
    PRRect92: TPRRect;
    PRRect93: TPRRect;
    PRRect94: TPRRect;
    PRRect95: TPRRect;
    PRRect96: TPRRect;
    PRRect97: TPRRect;
    PRRect98: TPRRect;
    PRRect99: TPRRect;
    PRRect100: TPRRect;
    PRRect101: TPRRect;
    PRRect102: TPRRect;
    PRRect103: TPRRect;
    PRRect104: TPRRect;
    PRRect105: TPRRect;
    PRRect106: TPRRect;
    PRRect107: TPRRect;
    PRRect108: TPRRect;
    PRRect109: TPRRect;
    PRRect110: TPRRect;
    PRRect111: TPRRect;
    PRRect112: TPRRect;
    PRRect113: TPRRect;
    PRRect114: TPRRect;
    PRRect115: TPRRect;
    PRRect116: TPRRect;
    PRRect117: TPRRect;
    PRRect118: TPRRect;
    PRRect119: TPRRect;
    PRRect120: TPRRect;
    PRRect121: TPRRect;
    PRRect122: TPRRect;
    PRRect123: TPRRect;
    PRRect124: TPRRect;
    PRRect125: TPRRect;
    PRRect126: TPRRect;
    PRRect127: TPRRect;
    PRRect128: TPRRect;
    PRRect129: TPRRect;
    PRL_Item_02: TPRLabel;
    PRL_Item_03: TPRLabel;
    PRL_Item_04: TPRLabel;
    PRL_Item_05: TPRLabel;
    PRL_Item_06: TPRLabel;
    PRL_Item_07: TPRLabel;
    PRL_Item_08: TPRLabel;
    PRL_Item_09: TPRLabel;
    PRL_Item_10: TPRLabel;
    PRL_Item_11: TPRLabel;
    PRL_Item_12: TPRLabel;
    PRL_Item_14: TPRLabel;
    PRL_Item_15: TPRLabel;
    PRL_Item_16: TPRLabel;
    PRL_Item_17: TPRLabel;
    PRL_Item_18: TPRLabel;
    PRL_Item_19: TPRLabel;
    PRL_Item_20: TPRLabel;
    PRL_Item_21: TPRLabel;
    PRL_Item_22: TPRLabel;
    PRL_Item_13: TPRLabel;
    PRL_Qtde_02: TPRLabel;
    PRL_Qtde_03: TPRLabel;
    PRL_Qtde_04: TPRLabel;
    PRL_Qtde_05: TPRLabel;
    PRL_Qtde_06: TPRLabel;
    PRL_Qtde_07: TPRLabel;
    PRL_Qtde_08: TPRLabel;
    PRL_Qtde_09: TPRLabel;
    PRL_Qtde_10: TPRLabel;
    PRL_Qtde_11: TPRLabel;
    PRL_Qtde_12: TPRLabel;
    PRL_Qtde_13: TPRLabel;
    PRL_Qtde_14: TPRLabel;
    PRL_Qtde_15: TPRLabel;
    PRL_Qtde_16: TPRLabel;
    PRL_Qtde_17: TPRLabel;
    PRL_Qtde_18: TPRLabel;
    PRL_Qtde_19: TPRLabel;
    PRL_Qtde_20: TPRLabel;
    PRL_Qtde_21: TPRLabel;
    PRL_Qtde_22: TPRLabel;
    PRL_Desc_02: TPRLabel;
    PRL_Desc_03: TPRLabel;
    PRL_Desc_04: TPRLabel;
    PRL_Desc_05: TPRLabel;
    PRL_Desc_06: TPRLabel;
    PRL_Desc_07: TPRLabel;
    PRL_Desc_08: TPRLabel;
    PRL_Desc_09: TPRLabel;
    PRL_Desc_10: TPRLabel;
    PRL_Desc_11: TPRLabel;
    PRL_Desc_12: TPRLabel;
    PRL_Desc_13: TPRLabel;
    PRL_Desc_14: TPRLabel;
    PRL_Desc_15: TPRLabel;
    PRL_Desc_16: TPRLabel;
    PRL_Desc_17: TPRLabel;
    PRL_Desc_18: TPRLabel;
    PRL_Desc_19: TPRLabel;
    PRL_Desc_20: TPRLabel;
    PRL_Desc_21: TPRLabel;
    PRL_Desc_22: TPRLabel;
    PRL_Valor_02: TPRLabel;
    PRL_Valor_03: TPRLabel;
    PRL_Valor_04: TPRLabel;
    PRL_Valor_05: TPRLabel;
    PRL_Valor_06: TPRLabel;
    PRL_Valor_07: TPRLabel;
    PRL_Valor_08: TPRLabel;
    PRL_Valor_09: TPRLabel;
    PRL_Valor_10: TPRLabel;
    PRL_Valor_11: TPRLabel;
    PRL_Valor_12: TPRLabel;
    PRL_Valor_13: TPRLabel;
    PRL_Valor_14: TPRLabel;
    PRL_Valor_15: TPRLabel;
    PRL_Valor_16: TPRLabel;
    PRL_Valor_17: TPRLabel;
    PRL_Valor_18: TPRLabel;
    PRL_Valor_19: TPRLabel;
    PRL_Valor_20: TPRLabel;
    PRL_Valor_21: TPRLabel;
    PRL_Valor_22: TPRLabel;
    PRL_IPI_02: TPRLabel;
    PRL_IPI_03: TPRLabel;
    PRL_IPI_04: TPRLabel;
    PRL_IPI_05: TPRLabel;
    PRL_IPI_06: TPRLabel;
    PRL_IPI_07: TPRLabel;
    PRL_IPI_08: TPRLabel;
    PRL_IPI_09: TPRLabel;
    PRL_IPI_10: TPRLabel;
    PRL_IPI_11: TPRLabel;
    PRL_IPI_12: TPRLabel;
    PRL_IPI_13: TPRLabel;
    PRL_IPI_14: TPRLabel;
    PRL_IPI_15: TPRLabel;
    PRL_IPI_16: TPRLabel;
    PRL_IPI_17: TPRLabel;
    PRL_IPI_18: TPRLabel;
    PRL_IPI_19: TPRLabel;
    PRL_IPI_22: TPRLabel;
    PRL_IPI_20: TPRLabel;
    PRL_IPI_21: TPRLabel;
    Opcao_Anterior: TEdit;
    Cliente_Email: TEdit;
    Nro_Requisicao: TEdit;
    PRLabel24: TPRLabel;
    Label1: TLabel;
    LBL_Ini: TLabel;
    Label3: TLabel;
    LBL_Fim: TLabel;
    BT_Retorna: TButton;
    BT_Avanca: TButton;
    PRL_VlrIPI: TPRLabel;
    PRRect132: TPRRect;
    PRL_Paginacao: TPRLabel;
    PRRect3: TPRRect;
    PRL_Requisicao_Nro: TPRLabel;
    PRRect9: TPRRect;
    PRLabel20: TPRLabel;
    PRRect10: TPRRect;
    PRLabel21: TPRLabel;
    PRRect133: TPRRect;
    PRRect134: TPRRect;
    PRL_Equipamento: TPRLabel;
    PRL_OS: TPRLabel;
    PRLabel23: TPRLabel;
    PRL_Centro: TPRLabel;
    PRRect135: TPRRect;
    Empresa_01: TPRLabel;
    Empresa_02: TPRLabel;
    Endereco_01: TPRLabel;
    Endereco_02: TPRLabel;
    Endereco_03: TPRLabel;
    Endereco_04: TPRLabel;
    Endereco_05: TPRLabel;
    PRRect22: TPRRect;
    PRLabel9: TPRLabel;
    PRRect130: TPRRect;
    PRL_Unid_01: TPRLabel;
    PRRect131: TPRRect;
    PRL_Unid_02: TPRLabel;
    PRRect136: TPRRect;
    PRL_Unid_03: TPRLabel;
    PRRect137: TPRRect;
    PRL_Unid_04: TPRLabel;
    PRRect138: TPRRect;
    PRL_Unid_05: TPRLabel;
    PRRect139: TPRRect;
    PRL_Unid_06: TPRLabel;
    PRRect140: TPRRect;
    PRL_Unid_07: TPRLabel;
    PRRect141: TPRRect;
    PRL_Unid_08: TPRLabel;
    PRRect142: TPRRect;
    PRL_Unid_09: TPRLabel;
    PRRect143: TPRRect;
    PRL_Unid_10: TPRLabel;
    PRRect144: TPRRect;
    PRL_Unid_11: TPRLabel;
    PRRect145: TPRRect;
    PRL_Unid_12: TPRLabel;
    PRRect146: TPRRect;
    PRL_Unid_13: TPRLabel;
    PRRect147: TPRRect;
    PRL_Unid_14: TPRLabel;
    PRRect148: TPRRect;
    PRL_Unid_15: TPRLabel;
    PRRect149: TPRRect;
    PRL_Unid_16: TPRLabel;
    PRRect150: TPRRect;
    PRL_Unid_17: TPRLabel;
    PRRect151: TPRRect;
    PRL_Unid_18: TPRLabel;
    PRRect152: TPRRect;
    PRL_Unid_19: TPRLabel;
    PRRect153: TPRRect;
    PRL_Unid_20: TPRLabel;
    PRRect154: TPRRect;
    PRL_Unid_21: TPRLabel;
    PRRect155: TPRRect;
    PRL_Unid_22: TPRLabel;
    PRRect156: TPRRect;
    PRRect157: TPRRect;
    PRLabel10: TPRLabel;
    PRLabel11: TPRLabel;
    PRL_Requisitante: TPRLabel;
    PRL_Solicitante: TPRLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BT_OkClick(Sender: TObject);
    procedure BT_RetornaClick(Sender: TObject);
    procedure BT_AvancaClick(Sender: TObject);
  private
    { Private declarations }
    function SendEMail(Handle: THandle; Mail: TStrings): Cardinal;
    procedure Criar_PDF(Posicao_Ini, Posicao_Fim, Pagina_Ini, Pagina_Fim: String);

  public
    { Public declarations }
  end;

var
  CriaPDF02: TCriaPDF02;
  ind : Integer;
  Anexo : array[1..7] of string;

implementation

uses Conexao_BD, Rotinas_Gerais, Requisicao_04;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TCriaPDF02.SendEMail(Handle: THandle; Mail: TStrings): Cardinal;
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

//*****************
//*** Procedure ***
//*****************

procedure TCriaPDF02.BT_SairClick(Sender: TObject);
begin
     CriaPDF02.Close;
end;

procedure TCriaPDF02.FormShow(Sender: TObject);
begin
  ind:= 1;

  with PReport1 do
    begin
    FileName := 'C:\Ibrasmak\Fax\REQ_'+Trim(Requisicao04.Nro_Requisicao.Text)+'_'+Trim(LBL_Ini.Caption)+'.pdf';

    Anexo[StrtoInt(LBL_Ini.Caption)] := FileName;

    //*** Gera o Documento PDF ***
    BeginDoc;
    Print(PRPage);
    EndDoc;

    ShowMessage('O arquivo foi nomeado como "REQ_' + Trim(Requisicao04.Nro_Requisicao.Text) + '.pdf"' + chr(13) + chr(13) + 'Foi criado em "C:\Ibrasmak\Fax"');

    //*** Exibe o Documento ***

    If Trim(Opcao_Anterior.Text) = 'FAX' Then
       Begin
       MSG_Erro('Para enviar o FAX, utilize um programa de'+#10+#13+'FAX de seu Computador anexando o arquivo'+#10+#13+'de cotação gerado na pasta C:\Ibrasmak\Fax');
    End;

    Pdf.LoadFile(FileName);
  end;
end;

procedure TCriaPDF02.BT_SairKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 Then
    begin
    CriaPDF02.Close;
  end;
end;

procedure TCriaPDF02.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 Then
    begin
    CriaPDF02.Close;
  end;
end;

procedure TCriaPDF02.BT_OkClick(Sender: TObject);

var
   Email: string;
   mail: TStringList;

begin
     If Trim(Opcao_Anterior.Text) = 'EMail' Then
        Begin
        Email := '';
        Email := Email + 'Solicitação de Cotação Nro.: '+Trim(Nro_Requisicao.Text)+#10+#13+#10+#13;
        Email := Email + 'Os dados da cotação estão em anexo no arquivo "PDF".'+#10+#13;
        Email := Email + 'Confirmar o recebimento deste pedido e informar imediatamente em caso de dúvidas ou divergências.'+#10+#13+#10+#13;
        Email := Email + 'Caso você não o possua o "Adobe Acrobat" para poder visualizá-lo'+#10+#13;
        Email := Email + 'acesse o link a baixo para obtê-lo.'+#10+#13;
        Email := Email + 'http://www.adobe.com/'+#10+#13+#10+#13;
        Email := Email + 'IBRASMAK - IND. BRASILEIRA DE MÁQUINAS LTDA.';

        mail := TStringList.Create;
        try
           mail.values['to']      := Trim(Cliente_Email.Text); ///AQUI VAI O EMAIL DO DESTINATARIO///
           mail.values['subject'] := 'IBRASMAK - Solicitação de Cotação Nro.:'+Trim(Nro_Requisicao.Text); ///AQUI O ASSUNTO///
           mail.values['body']    := Email; ///AQUI O TEXTO NO CORPO DO EMAIL///

           If(StrtoInt(LBL_Fim.Caption) >= 1) Then
              Begin
              mail.values['attachment0'] := Anexo[1];
           End;
           
           If(StrtoInt(LBL_Fim.Caption) >= 2) Then
              Begin
              mail.values['attachment1'] := Anexo[2];
           End;

           If(StrtoInt(LBL_Fim.Caption) >= 3) Then
              Begin
              mail.values['attachment2'] := Anexo[3];
           End;

           If(StrtoInt(LBL_Fim.Caption) >= 4) Then
              Begin
              mail.values['attachment3'] := Anexo[4];
           End;

           If(StrtoInt(LBL_Fim.Caption) >= 5) Then
              Begin
              mail.values['attachment4'] := Anexo[5];
           End;

           If(StrtoInt(LBL_Fim.Caption) >= 6) Then
              Begin
              mail.values['attachment5'] := Anexo[6];
           End;

           If(StrtoInt(LBL_Fim.Caption) >= 7) Then
              Begin
              mail.values['attachment6'] := Anexo[7];
           End;
           
           sendEMail(Application.Handle, mail);
        finally
           mail.Free;
        end;

        CriaPDF02.Close;

        End
     Else If Trim(Opcao_Anterior.Text) = 'FAX' Then
        Begin
        MSG_Erro('Para enviar o FAX, utilize um programa de'+#10+#13+'FAX de seu Computador anexando o arquivo'+#10+#13+'de cotação gerado na pasta C:\Ibrasmak\Fax');

        CriaPDF02.Close;

        End
     Else If Trim(Opcao_Anterior.Text) = 'Imprimir' Then
        Begin
        MSG_Erro('Para imprimir esta cotação clique no icone da Impressora');
     End;
end;

procedure TCriaPDF02.BT_RetornaClick(Sender: TObject);

var
   Pos: Integer;

begin
     LBL_Ini.Caption := IntToStr((StrToInt(LBL_Ini.Caption) - 1));

     If StrToInt(LBL_Ini.Caption) <= 0 Then
        Begin
        LBL_Ini.Caption := IntToStr((StrToInt(LBL_Ini.Caption) + 1));
        End
     Else
        Begin

        Pos := StrToInt(LBL_Ini.Caption);

        If Pos = 1 Then
           Begin
           Criar_PDF('1','22',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 2 Then
           Begin
           Criar_PDF('23','44',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 3 Then
           Begin
           Criar_PDF('45','66',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 4 Then
           Begin
           Criar_PDF('67','88',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 5 Then
           Begin
           Criar_PDF('89','110',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 6 Then
           Begin
           Criar_PDF('111','132',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 7 Then
           Begin
           Criar_PDF('133','154',LBL_Ini.Caption,LBL_Fim.Caption);
        End;

     End;

     Menu_Principal.Refresh;
end;

procedure TCriaPDF02.BT_AvancaClick(Sender: TObject);

var
   Pos: Integer;

begin
    If StrToInt(LBL_Ini.Caption) < StrToInt(LBL_Fim.Caption) Then
       Begin

       LBL_Ini.Caption := IntToStr((StrToInt(LBL_Ini.Caption) + 1));

       If StrToInt(LBL_Ini.Caption) > StrToInt(LBL_fim.Caption) Then
          Begin
          LBL_Ini.Caption := IntToStr((StrToInt(LBL_Ini.Caption) - 1));
          End
       Else
          Begin

          Pos := StrToInt(LBL_Ini.Caption);

          If Pos = 1 Then
             Begin
             Criar_PDF('1','22',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 2 Then
             Begin
             Criar_PDF('23','44',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 3 Then
             Begin
             Criar_PDF('45','66',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 4 Then
             Begin
             Criar_PDF('67','88',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 5 Then
             Begin
             Criar_PDF('89','110',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 6 Then
             Begin
             Criar_PDF('111','132',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 7 Then
             Begin
             Criar_PDF('133','154',LBL_Ini.Caption,LBL_Fim.Caption);
          End;

       End;

    End;

    Menu_Principal.Refresh;
end;

procedure TCriaPDF02.Criar_PDF(Posicao_Ini, Posicao_Fim, Pagina_Ini, Pagina_Fim: String);

var
   Ind, Posicao: Integer;
   Cond_Pgto: string;

begin
  Ampulheta();

  If Trim(Requisicao04.Requisicao_Empresa.Text) = 'IBRASMAK' Then
     Begin
     CriaPDF02.Empresa_01.Caption := 'IBRASMAK';
     CriaPDF02.Empresa_02.Caption := '';

     CriaPDF02.Endereco_01.Caption := 'IBRASMAK IND. BRASILEIRA DE MÁQUINAS LTDA';
     CriaPDF02.Endereco_02.Caption := 'CNPJ: 47.139.456/0001-09                      IE: 581.034.396.119';
     CriaPDF02.Endereco_03.Caption := 'ESTRADA DE SAPOPEMBA, 159 KM 45 - CEP 09432-300 -  RIBEIRÃO PIRES - SP';
     CriaPDF02.Endereco_04.Caption := 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700';
     CriaPDF02.Endereco_05.Caption := 'e-mail: compras@ibrasmak.com.br';
     End
  Else If Trim(Requisicao04.Requisicao_Empresa.Text) = 'MONIBRAS' Then
     Begin
     CriaPDF02.Empresa_01.Caption := 'MONIBRAS';
     CriaPDF02.Empresa_02.Caption := '';

     CriaPDF02.Endereco_01.Caption := 'MONIBRAS MÁQUINAS E EQUIPAMENTOS LTDA';
     CriaPDF02.Endereco_02.Caption := 'CNPJ: 04.449.820/0001-16                      IE: 581.128.318.116';
     CriaPDF02.Endereco_03.Caption := 'ESTRADA DE SAPOPEMBA, 149 KM 45 - CEP 09432-300 -  RIBEIRÃO PIRES - SP';
     CriaPDF02.Endereco_04.Caption := 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700';
     CriaPDF02.Endereco_05.Caption := 'e-mail: compras@ibrasmak.com.br';
     End
  Else If Trim(Requisicao04.Requisicao_Empresa.Text) = 'FERRAMENTARIA' Then
     Begin
     CriaPDF02.Empresa_01.Caption := 'IBRASMAK';
     CriaPDF02.Empresa_02.Caption := '(FERRAMENTARIA)';

     CriaPDF02.Endereco_01.Caption := 'IBRASMAK IND. BRASILEIRA DE MÁQUINAS LTDA';
     CriaPDF02.Endereco_02.Caption := 'CNPJ: 47.139.456/0001-09                      IE: 581.034.396.119';
     CriaPDF02.Endereco_03.Caption := 'ESTRADA DE SAPOPEMBA, 159 KM 45 - CEP 09432-300 -  RIBEIRÃO PIRES - SP';
     CriaPDF02.Endereco_04.Caption := 'TEL:(0XX11) 4828-9700                   FAX:(0XX11) 4828-9700';
     CriaPDF02.Endereco_05.Caption := 'e-mail: compras@ibrasmak.com.br';
  End;

  CriaPDF02.Endereco_01.Caption := '';
  CriaPDF02.Endereco_02.Caption := '';
  CriaPDF02.Endereco_03.Caption := '';
  CriaPDF02.Endereco_04.Caption := '';
  CriaPDF02.Endereco_05.Caption := '';

  CriaPDF02.PRL_Paginacao.Caption := 'PÁGINA ' + Trim(Pagina_Ini) + ' DE ' + Trim(Pagina_Fim);
  CriaPDF02.LBL_Ini.Caption       := Trim(Pagina_Ini);
  CriaPDF02.LBL_Fim.Caption       := Trim(Pagina_Fim);

  CriaPDF02.PRL_OBS1.Caption      := Trim(Requisicao04.Requisicao_Obs.Text);

  CriaPDF02.Cliente_Email.Text    := Requisicao04.Fornecedor_Email.Text;
  CriaPDF02.Nro_Requisicao.Text   := Nro_Requisicao.Text;

  CriaPDF02.PRL_Requisicao_Nro.Caption  := Trim(Nro_Requisicao.Text);
  CriaPDF02.PRL_Data_Requisicao.Caption := Trim(DateToStr(Date()));
  CriaPDF02.PRL_Nome.Caption         := Trim(Requisicao04.Fornecedor_Nome.Text);
  CriaPDF02.PRL_Contato.Caption      := Trim(Requisicao04.Fornecedor_Contato.Text);

  CriaPDF02.PRL_Equipamento.Caption  := Trim(Requisicao04.Requisicao_Equipamento.Text);
  CriaPDF02.PRL_OS.Caption           := Trim(Requisicao04.Requisicao_OS.Text);
  CriaPDF02.PRL_Centro.Caption       := Trim(Requisicao04.Requisicao_Centro_Custo.Text);

  If Trim(Requisicao04.Fornecedor_Fone_Comercial.Text) <> '' Then
     Begin
     CriaPDF02.PRL_Fone_1.Caption   := Trim(Requisicao04.Fornecedor_Fone_Comercial.Text);
     End
  Else If Trim(Requisicao04.Fornecedor_Fone_Celular.Text) <> '' Then
     Begin
     CriaPDF02.PRL_Fone_1.Caption   := Trim(Requisicao04.Fornecedor_Fone_Celular.Text);
  End;

  CriaPDF02.PRL_Fax.Caption         := Trim(Requisicao04.Fornecedor_Fone_Fax.Text);

  If Trim(Requisicao04.Requisicao_Condicao_Pgto_1.Text) <> '' Then
     Begin
     If StrToInt(Requisicao04.Requisicao_Condicao_Pgto_1.Text) > 0 Then
        Cond_Pgto := Trim(Requisicao04.Requisicao_Condicao_Pgto_1.Text);
  End;

  If Trim(Requisicao04.Requisicao_Condicao_Pgto_2.Text) <> '' Then
     Begin
     If StrToInt(Requisicao04.Requisicao_Condicao_Pgto_2.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ', ' + Trim(Requisicao04.Requisicao_Condicao_Pgto_2.Text);
  End;

  If Trim(Requisicao04.Requisicao_Condicao_Pgto_3.Text) <> '' Then
     Begin
     If StrToInt(Requisicao04.Requisicao_Condicao_Pgto_3.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ', ' + Trim(Requisicao04.Requisicao_Condicao_Pgto_3.Text);
  End;

  If Trim(Requisicao04.Requisicao_Condicao_Pgto_4.Text) <> '' Then
     Begin
     If StrToInt(Requisicao04.Requisicao_Condicao_Pgto_4.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ' e ' + Trim(Requisicao04.Requisicao_Condicao_Pgto_4.Text);
  End;

  Cond_Pgto := Cond_Pgto;

  CriaPDF02.PRL_Pagamento.Caption := Trim(Cond_Pgto);
  CriaPDF02.PRL_Entrega.Caption   := Trim(Requisicao04.Requisicao_Prazo.Text);

{
  If Trim(Requisicao04.Valor_Frete.Text) <> '0,00' Then
     Begin
     CriaPDF02.PRL_Frete.Caption    := Trim(Requisicao04.Valor_Frete.Text);
     End
  Else
     Begin
     CriaPDF02.PRL_Frete.Caption    := '';
  End;
}
//  CriaPDF02.PRL_Validade.Caption := '';

  //*** Coloca os Itens no PDF ***

  CriaPDF02.PRL_Item_01.Caption  := '';
  CriaPDF02.PRL_Qtde_01.Caption  := '';
  CriaPDF02.PRL_Desc_01.Caption  := '';
  CriaPDF02.PRL_IPI_01.Caption   := '';
  CriaPDF02.PRL_Valor_01.Caption := '';
  CriaPDF02.PRL_Unid_01.Caption  := '';

  CriaPDF02.PRL_Item_02.Caption  := '';
  CriaPDF02.PRL_Qtde_02.Caption  := '';
  CriaPDF02.PRL_Desc_02.Caption  := '';
  CriaPDF02.PRL_IPI_02.Caption   := '';
  CriaPDF02.PRL_Valor_02.Caption := '';
  CriaPDF02.PRL_Unid_02.Caption  := '';

  CriaPDF02.PRL_Item_03.Caption  := '';
  CriaPDF02.PRL_Qtde_03.Caption  := '';
  CriaPDF02.PRL_Desc_03.Caption  := '';
  CriaPDF02.PRL_IPI_03.Caption   := '';
  CriaPDF02.PRL_Valor_03.Caption := '';
  CriaPDF02.PRL_Unid_03.Caption  := '';

  CriaPDF02.PRL_Item_04.Caption  := '';
  CriaPDF02.PRL_Qtde_04.Caption  := '';
  CriaPDF02.PRL_Desc_04.Caption  := '';
  CriaPDF02.PRL_IPI_04.Caption   := '';
  CriaPDF02.PRL_Valor_04.Caption := '';
  CriaPDF02.PRL_Unid_04.Caption  := '';

  CriaPDF02.PRL_Item_05.Caption  := '';
  CriaPDF02.PRL_Qtde_05.Caption  := '';
  CriaPDF02.PRL_Desc_05.Caption  := '';
  CriaPDF02.PRL_IPI_05.Caption   := '';
  CriaPDF02.PRL_Valor_05.Caption := '';
  CriaPDF02.PRL_Unid_05.Caption  := '';

  CriaPDF02.PRL_Item_06.Caption  := '';
  CriaPDF02.PRL_Qtde_06.Caption  := '';
  CriaPDF02.PRL_Desc_06.Caption  := '';
  CriaPDF02.PRL_IPI_06.Caption   := '';
  CriaPDF02.PRL_Valor_06.Caption := '';
  CriaPDF02.PRL_Unid_06.Caption  := '';

  CriaPDF02.PRL_Item_07.Caption  := '';
  CriaPDF02.PRL_Qtde_07.Caption  := '';
  CriaPDF02.PRL_Desc_07.Caption  := '';
  CriaPDF02.PRL_IPI_07.Caption   := '';
  CriaPDF02.PRL_Valor_07.Caption := '';
  CriaPDF02.PRL_Unid_07.Caption  := '';

  CriaPDF02.PRL_Item_08.Caption  := '';
  CriaPDF02.PRL_Qtde_08.Caption  := '';
  CriaPDF02.PRL_Desc_08.Caption  := '';
  CriaPDF02.PRL_IPI_08.Caption   := '';
  CriaPDF02.PRL_Valor_08.Caption := '';
  CriaPDF02.PRL_Unid_08.Caption  := '';

  CriaPDF02.PRL_Item_09.Caption  := '';
  CriaPDF02.PRL_Qtde_09.Caption  := '';
  CriaPDF02.PRL_Desc_09.Caption  := '';
  CriaPDF02.PRL_IPI_09.Caption   := '';
  CriaPDF02.PRL_Valor_09.Caption := '';
  CriaPDF02.PRL_Unid_09.Caption  := '';

  CriaPDF02.PRL_Item_10.Caption  := '';
  CriaPDF02.PRL_Qtde_10.Caption  := '';
  CriaPDF02.PRL_Desc_10.Caption  := '';
  CriaPDF02.PRL_IPI_10.Caption   := '';
  CriaPDF02.PRL_Valor_10.Caption := '';
  CriaPDF02.PRL_Unid_10.Caption  := '';

  CriaPDF02.PRL_Item_11.Caption  := '';
  CriaPDF02.PRL_Qtde_11.Caption  := '';
  CriaPDF02.PRL_Desc_11.Caption  := '';
  CriaPDF02.PRL_IPI_11.Caption   := '';
  CriaPDF02.PRL_Valor_11.Caption := '';
  CriaPDF02.PRL_Unid_11.Caption  := '';

  CriaPDF02.PRL_Item_12.Caption  := '';
  CriaPDF02.PRL_Qtde_12.Caption  := '';
  CriaPDF02.PRL_Desc_12.Caption  := '';
  CriaPDF02.PRL_IPI_12.Caption   := '';
  CriaPDF02.PRL_Valor_12.Caption := '';
  CriaPDF02.PRL_Unid_12.Caption  := '';

  CriaPDF02.PRL_Item_13.Caption  := '';
  CriaPDF02.PRL_Qtde_13.Caption  := '';
  CriaPDF02.PRL_Desc_13.Caption  := '';
  CriaPDF02.PRL_IPI_13.Caption   := '';
  CriaPDF02.PRL_Valor_13.Caption := '';
  CriaPDF02.PRL_Unid_13.Caption  := '';

  CriaPDF02.PRL_Item_14.Caption  := '';
  CriaPDF02.PRL_Qtde_14.Caption  := '';
  CriaPDF02.PRL_Desc_14.Caption  := '';
  CriaPDF02.PRL_IPI_14.Caption   := '';
  CriaPDF02.PRL_Valor_14.Caption := '';
  CriaPDF02.PRL_Unid_14.Caption  := '';

  CriaPDF02.PRL_Item_15.Caption  := '';
  CriaPDF02.PRL_Qtde_15.Caption  := '';
  CriaPDF02.PRL_Desc_15.Caption  := '';
  CriaPDF02.PRL_IPI_15.Caption   := '';
  CriaPDF02.PRL_Valor_15.Caption := '';
  CriaPDF02.PRL_Unid_15.Caption  := '';

  CriaPDF02.PRL_Item_16.Caption  := '';
  CriaPDF02.PRL_Qtde_16.Caption  := '';
  CriaPDF02.PRL_Desc_16.Caption  := '';
  CriaPDF02.PRL_IPI_16.Caption   := '';
  CriaPDF02.PRL_Valor_16.Caption := '';
  CriaPDF02.PRL_Unid_16.Caption  := '';

  CriaPDF02.PRL_Item_17.Caption  := '';
  CriaPDF02.PRL_Qtde_17.Caption  := '';
  CriaPDF02.PRL_Desc_17.Caption  := '';
  CriaPDF02.PRL_IPI_17.Caption   := '';
  CriaPDF02.PRL_Valor_17.Caption := '';
  CriaPDF02.PRL_Unid_17.Caption  := '';

  CriaPDF02.PRL_Item_18.Caption  := '';
  CriaPDF02.PRL_Qtde_18.Caption  := '';
  CriaPDF02.PRL_Desc_18.Caption  := '';
  CriaPDF02.PRL_IPI_18.Caption   := '';
  CriaPDF02.PRL_Valor_18.Caption := '';
  CriaPDF02.PRL_Unid_18.Caption  := '';

  CriaPDF02.PRL_Item_19.Caption  := '';
  CriaPDF02.PRL_Qtde_19.Caption  := '';
  CriaPDF02.PRL_Desc_19.Caption  := '';
  CriaPDF02.PRL_IPI_19.Caption   := '';
  CriaPDF02.PRL_Valor_19.Caption := '';
  CriaPDF02.PRL_Unid_19.Caption  := '';

  CriaPDF02.PRL_Item_20.Caption  := '';
  CriaPDF02.PRL_Qtde_20.Caption  := '';
  CriaPDF02.PRL_Desc_20.Caption  := '';
  CriaPDF02.PRL_IPI_20.Caption   := '';
  CriaPDF02.PRL_Valor_20.Caption := '';
  CriaPDF02.PRL_Unid_20.Caption  := '';

  CriaPDF02.PRL_Item_21.Caption  := '';
  CriaPDF02.PRL_Qtde_21.Caption  := '';
  CriaPDF02.PRL_Desc_21.Caption  := '';
  CriaPDF02.PRL_IPI_21.Caption   := '';
  CriaPDF02.PRL_Valor_21.Caption := '';
  CriaPDF02.PRL_Unid_21.Caption  := '';

  CriaPDF02.PRL_Item_22.Caption  := '';
  CriaPDF02.PRL_Qtde_22.Caption  := '';
  CriaPDF02.PRL_Desc_22.Caption  := '';
  CriaPDF02.PRL_IPI_22.Caption   := '';
  CriaPDF02.PRL_Valor_22.Caption := '';
  CriaPDF02.PRL_Unid_22.Caption  := '';

  Posicao := StrToInt(Posicao_Fim);

  For Ind := StrToInt(Posicao_Ini) To Posicao Do
      Begin
      If (Ind = 1)  Or (Ind = 23) Or (Ind = 45) Or (Ind = 67) Or (Ind = 89)  Or (Ind = 111) Or (Ind = 133) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_01.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_01.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_01.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_01.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_01.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_01.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_01.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_01.Caption := '';
         End;

         End;

         End
      Else If (Ind = 2)  Or (Ind = 24) Or (Ind = 46) Or (Ind = 68) Or (Ind = 90)  Or (Ind = 112) Or (Ind = 134) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_02.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_02.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_02.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_02.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_02.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_02.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_02.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_02.Caption := '';
         End;

         End;

         End
      Else If (Ind = 3)  Or (Ind = 25) Or (Ind = 47) Or (Ind = 69) Or (Ind = 91)  Or (Ind = 113) Or (Ind = 135) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_03.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_03.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_03.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_03.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_03.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_03.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_03.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_03.Caption := '';
         End;

         End;

         End
      Else If (Ind = 4)  Or (Ind = 26) Or (Ind = 48) Or (Ind = 70) Or (Ind = 92)  Or (Ind = 114) Or (Ind = 136) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_04.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_04.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_04.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_04.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_04.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_04.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_04.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_04.Caption := '';
         End;

         End;

         End
      Else If (Ind = 5)  Or (Ind = 27) Or (Ind = 49) Or (Ind = 71) Or (Ind = 93)  Or (Ind = 115) Or (Ind = 137) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_05.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_05.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_05.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_05.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_05.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_05.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_05.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_05.Caption := '';
         End;

         End;

         End
      Else If (Ind = 6)  Or (Ind = 28) Or (Ind = 50) Or (Ind = 72) Or (Ind = 94)  Or (Ind = 116) Or (Ind = 138) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_06.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_06.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_06.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_06.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_06.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_06.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_06.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_06.Caption := '';
         End;

         End;

         End
      Else If (Ind = 7)  Or (Ind = 29) Or (Ind = 51) Or (Ind = 73) Or (Ind = 95)  Or (Ind = 117) Or (Ind = 139) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_07.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_07.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_07.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_07.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_07.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_07.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_07.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_07.Caption := '';
         End;

         End;

         End
      Else If (Ind = 8)  Or (Ind = 30) Or (Ind = 52) Or (Ind = 74) Or (Ind = 96)  Or (Ind = 118) Or (Ind = 140) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_08.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_08.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_08.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_08.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_08.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_08.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_08.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_08.Caption := '';
         End;

         End;

         End
      Else If (Ind = 9)  Or (Ind = 31) Or (Ind = 53) Or (Ind = 75) Or (Ind = 97)  Or (Ind = 119) Or (Ind = 141) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_09.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_09.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_09.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_09.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_09.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_09.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_09.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_09.Caption := '';
         End;

         End;

         End
      Else If (Ind = 10) Or (Ind = 32) Or (Ind = 54) Or (Ind = 76) Or (Ind = 98)  Or (Ind = 120) Or (Ind = 142) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_10.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_10.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_10.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_10.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_10.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_10.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_10.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_10.Caption := '';
         End;

         End;

         End
      Else If (Ind = 11) Or (Ind = 33) Or (Ind = 55) Or (Ind = 77) Or (Ind = 99)  Or (Ind = 121) Or (Ind = 143) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_11.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_11.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_11.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_11.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_11.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_11.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_11.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_11.Caption := '';
         End;

         End;

         End
      Else If (Ind = 12) Or (Ind = 34) Or (Ind = 56) Or (Ind = 78) Or (Ind = 100) Or (Ind = 122) Or (Ind = 144) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_12.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_12.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_12.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_12.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_12.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_12.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_12.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_12.Caption := '';
         End;

         End;

         End
      Else If (Ind = 13) Or (Ind = 35) Or (Ind = 57) Or (Ind = 79) Or (Ind = 101) Or (Ind = 123) Or (Ind = 145) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_13.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_13.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_13.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_13.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_13.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_13.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_13.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_13.Caption := '';
         End;

         End;

         End
      Else If (Ind = 14) Or (Ind = 36) Or (Ind = 58) Or (Ind = 80) Or (Ind = 102) Or (Ind = 124) Or (Ind = 146) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_14.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_14.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_14.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_14.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_14.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_14.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_14.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_14.Caption := '';
         End;

         End;

         End
      Else If (Ind = 15) Or (Ind = 37) Or (Ind = 59) Or (Ind = 81) Or (Ind = 103) Or (Ind = 125) Or (Ind = 147) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_15.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_15.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_15.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_15.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_15.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_15.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_15.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_15.Caption := '';
         End;

         End;

         End
      Else If (Ind = 16) Or (Ind = 38) Or (Ind = 60) Or (Ind = 82) Or (Ind = 104) Or (Ind = 126) Or (Ind = 148) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_16.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_16.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_16.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_16.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_16.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_16.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_16.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_16.Caption := '';
         End;

         End;

         End
      Else If (Ind = 17) Or (Ind = 39) Or (Ind = 61) Or (Ind = 83) Or (Ind = 105) Or (Ind = 127) Or (Ind = 149) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_17.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_17.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_17.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_17.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_17.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_17.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_17.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_17.Caption := '';
         End;

         End;

         End
      Else If (Ind = 18) Or (Ind = 40) Or (Ind = 62) Or (Ind = 84) Or (Ind = 106) Or (Ind = 128) Or (Ind = 150) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_18.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_18.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_18.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_18.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_18.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_18.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_18.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_18.Caption := '';
         End;

         End;

         End
      Else If (Ind = 19) Or (Ind = 41) Or (Ind = 63) Or (Ind = 85) Or (Ind = 107) Or (Ind = 129) Or (Ind = 151) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_19.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_19.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_19.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_19.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_19.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_19.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_19.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_19.Caption := '';
         End;

         End;

         End
      Else If (Ind = 20) Or (Ind = 42) Or (Ind = 64) Or (Ind = 86) Or (Ind = 108) Or (Ind = 130) Or (Ind = 152) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_20.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_20.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_20.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_20.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_20.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_20.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_20.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_20.Caption := '';
         End;

         End;

         End
      Else If (Ind = 21) Or (Ind = 43) Or (Ind = 65) Or (Ind = 87) Or (Ind = 109) Or (Ind = 131) Or (Ind = 153) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_21.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_21.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_21.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_21.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_21.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_21.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_21.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_21.Caption := '';
         End;

         End;

         End
      Else If (Ind = 22) Or (Ind = 44) Or (Ind = 66) Or (Ind = 88) Or (Ind = 110) Or (Ind = 132) Or (Ind = 154) Then
         Begin

         If Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaPDF02.PRL_Item_22.Caption  := IntToStr(Ind);
         CriaPDF02.PRL_Qtde_22.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[0,Ind]);
         CriaPDF02.PRL_Unid_22.Caption  := Trim(Requisicao04.SGD_Produtos.Cells[4,Ind]);
         CriaPDF02.PRL_Desc_22.Caption  := Copy(Trim(Requisicao04.SGD_Produtos.Cells[2,Ind]) + ' - ' + Trim(Requisicao04.SGD_Produtos.Cells[3,Ind]), 1, 120);

         If Trim(Requisicao04.SGD_Produtos.Cells[10,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_IPI_22.Caption  := Requisicao04.SGD_Produtos.Cells[10,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_IPI_22.Caption  := '';
         End;

         If Trim(Requisicao04.SGD_Produtos.Cells[11,Ind]) <> '' Then
            Begin
            CriaPDF02.PRL_Valor_22.Caption := Requisicao04.SGD_Produtos.Cells[11,Ind];
            End
         Else
            Begin
            CriaPDF02.PRL_Valor_22.Caption := '';
         End;

         End;

      End;
  End;

  //*** Coloca o Valor no PDF ***

  If Trim(Requisicao04.Valor_IPI.Text) <> '0,00' Then
     Begin
     CriaPDF02.PRL_VlrIPI.Caption := Trim(Requisicao04.Valor_IPI.Text);
     End
  Else
     Begin
     CriaPDF02.PRL_VlrIPI.Caption := '';
  End;

  If Trim(Requisicao04.Valor_Total.Text) <> '0,00' Then
     Begin
     CriaPDF02.PRL_VlrTotal.Caption := Trim(Requisicao04.Valor_Total.Text);
     End
  Else
     Begin
     CriaPDF02.PRL_VlrTotal.Caption := '';
  End;

//  CriaPDF02.PRL_Funcionario.Caption := Trim(Requisicao04.Requisicao_Funcionario.Text);

  //*** Exibe o PDF ***

  ind:= 1;

  with PReport1 do
    begin
    FileName := 'C:\Ibrasmak\Fax\REQ_'+Trim(Requisicao04.Nro_Requisicao.Text)+'_'+Trim(LBL_Ini.Caption)+'.pdf';

    Anexo[StrtoInt(LBL_Ini.Caption)] := FileName;

    //*** Gera o Documento PDF ***
    BeginDoc;
    Print(PRPage);
    EndDoc;

    //*** Exibe o Documento ***

    Pdf.LoadFile(FileName);
  end;

  Pdf.Refresh;

  Seta();
end;

end.
