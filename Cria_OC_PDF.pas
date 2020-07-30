unit Cria_OC_PDF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, PReport, OleCtrls, PdfLib_TLB,
  PdfDoc, ShellAPI, Mapi, jpeg, PRJpegImage;

type
  TCriaOCPDF = class(TForm)
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
    PRRect3: TPRRect;
    PRRect4: TPRRect;
    PRL_Ordem_Nro: TPRLabel;
    PRL_Entrega: TPRLabel;
    PRL_Pagamento: TPRLabel;
    PRL_Fax: TPRLabel;
    PRL_Fone_1: TPRLabel;
    PRL_Contato: TPRLabel;
    PRL_Nome: TPRLabel;
    PRRect14: TPRRect;
    PRRect15: TPRRect;
    PRRect16: TPRRect;
    PRRect17: TPRRect;
    PRLabel1: TPRLabel;
    PRLabel2: TPRLabel;
    PRLabel3: TPRLabel;
    PRLabel4: TPRLabel;
    BT_Ok: TBitBtn;
    PRL_Data_Cotacao: TPRLabel;
    PRLabel5: TPRLabel;
    PRLabel6: TPRLabel;
    PRLabel7: TPRLabel;
    PRLabel8: TPRLabel;
    PRLabel18: TPRLabel;
    PRLabel19: TPRLabel;
    PRRect22: TPRRect;
    PRLabel9: TPRLabel;
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
    PRL_Unit_01: TPRLabel;
    PRL_Total_01: TPRLabel;
    PRLabel23: TPRLabel;
    PRL_Funcionario: TPRLabel;
    PRLabel25: TPRLabel;
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
    PRL_Unit_02: TPRLabel;
    PRL_Unit_03: TPRLabel;
    PRL_Unit_04: TPRLabel;
    PRL_Unit_05: TPRLabel;
    PRL_Unit_06: TPRLabel;
    PRL_Unit_07: TPRLabel;
    PRL_Unit_08: TPRLabel;
    PRL_Unit_09: TPRLabel;
    PRL_Unit_10: TPRLabel;
    PRL_Unit_11: TPRLabel;
    PRL_Unit_12: TPRLabel;
    PRL_Unit_13: TPRLabel;
    PRL_Unit_14: TPRLabel;
    PRL_Unit_15: TPRLabel;
    PRL_Total_02: TPRLabel;
    PRL_Total_03: TPRLabel;
    PRL_Total_04: TPRLabel;
    PRL_Total_05: TPRLabel;
    PRL_Total_06: TPRLabel;
    PRL_Total_07: TPRLabel;
    PRL_Total_08: TPRLabel;
    PRL_Total_09: TPRLabel;
    PRL_Total_10: TPRLabel;
    PRL_Total_11: TPRLabel;
    PRL_Total_12: TPRLabel;
    PRL_Total_13: TPRLabel;
    PRL_Total_14: TPRLabel;
    PRL_Total_15: TPRLabel;
    Opcao_Anterior: TEdit;
    Cliente_Email: TEdit;
    Nro_Ordem: TEdit;
    PRLabel24: TPRLabel;
    PRRect130: TPRRect;
    PRL_VlrIPI: TPRLabel;
    PRLabel28: TPRLabel;
    PRLabel30: TPRLabel;
    PRLabel31: TPRLabel;
    PRLabel32: TPRLabel;
    PRRect131: TPRRect;
    PRLabel33: TPRLabel;
    PRRect132: TPRRect;
    PRRect133: TPRRect;
    PRRect134: TPRRect;
    PRRect135: TPRRect;
    PRRect136: TPRRect;
    PRRect137: TPRRect;
    PRRect138: TPRRect;
    PRRect139: TPRRect;
    PRRect140: TPRRect;
    PRRect141: TPRRect;
    PRRect142: TPRRect;
    PRRect143: TPRRect;
    PRRect144: TPRRect;
    PRRect145: TPRRect;
    PRL_Unid_15: TPRLabel;
    PRL_Unid_14: TPRLabel;
    PRL_Unid_13: TPRLabel;
    PRL_Unid_12: TPRLabel;
    PRL_Unid_11: TPRLabel;
    PRL_Unid_10: TPRLabel;
    PRL_Unid_09: TPRLabel;
    PRL_Unid_08: TPRLabel;
    PRL_Unid_07: TPRLabel;
    PRL_Unid_06: TPRLabel;
    PRL_Unid_05: TPRLabel;
    PRLabel52: TPRLabel;
    PRRect153: TPRRect;
    PRL_Unid_03: TPRLabel;
    PRL_Unid_02: TPRLabel;
    PRL_Unid_01: TPRLabel;
    PRL_Unid_04: TPRLabel;
    PRRect164: TPRRect;
    PRLabel35: TPRLabel;
    PRRect177: TPRRect;
    PRLabel36: TPRLabel;
    PRRect178: TPRRect;
    PRRect179: TPRRect;
    PRRect180: TPRRect;
    PRRect181: TPRRect;
    PRRect182: TPRRect;
    PRRect183: TPRRect;
    PRRect184: TPRRect;
    PRRect185: TPRRect;
    PRRect186: TPRRect;
    PRRect187: TPRRect;
    PRRect188: TPRRect;
    PRRect189: TPRRect;
    PRRect190: TPRRect;
    PRRect191: TPRRect;
    PRRect192: TPRRect;
    PRRect193: TPRRect;
    PRL_Imp_15: TPRLabel;
    PRL_Imp_14: TPRLabel;
    PRL_Imp_13: TPRLabel;
    PRL_Imp_12: TPRLabel;
    PRL_Imp_11: TPRLabel;
    PRL_Imp_10: TPRLabel;
    PRL_Imp_09: TPRLabel;
    PRL_Imp_08: TPRLabel;
    PRL_Imp_07: TPRLabel;
    PRL_Imp_06: TPRLabel;
    PRL_Imp_05: TPRLabel;
    PRL_Imp_04: TPRLabel;
    PRL_Imp_03: TPRLabel;
    PRL_Imp_02: TPRLabel;
    PRL_Imp_01: TPRLabel;
    PRLabel64: TPRLabel;
    PRRect201: TPRRect;
    PRRect202: TPRRect;
    PRRect203: TPRRect;
    PRRect204: TPRRect;
    PRRect205: TPRRect;
    PRRect206: TPRRect;
    PRRect207: TPRRect;
    PRRect208: TPRRect;
    PRRect209: TPRRect;
    PRRect210: TPRRect;
    PRRect211: TPRRect;
    PRRect212: TPRRect;
    PRRect213: TPRRect;
    PRRect214: TPRRect;
    PRRect215: TPRRect;
    PRRect216: TPRRect;
    PRL_Aliq_15: TPRLabel;
    PRL_Aliq_14: TPRLabel;
    PRL_Aliq_13: TPRLabel;
    PRL_Aliq_12: TPRLabel;
    PRL_Aliq_11: TPRLabel;
    PRL_Aliq_10: TPRLabel;
    PRL_Aliq_09: TPRLabel;
    PRL_Aliq_08: TPRLabel;
    PRL_Aliq_07: TPRLabel;
    PRL_Aliq_06: TPRLabel;
    PRL_Aliq_05: TPRLabel;
    PRL_Aliq_04: TPRLabel;
    PRL_Aliq_03: TPRLabel;
    PRL_Aliq_02: TPRLabel;
    PRL_Aliq_01: TPRLabel;
    PRLabel87: TPRLabel;
    PRRect224: TPRRect;
    PRRect225: TPRRect;
    PRLabel17: TPRLabel;
    PRLabel41: TPRLabel;
    PRLabel42: TPRLabel;
    PRLabel20: TPRLabel;
    PRL_Frete: TPRLabel;
    PRLabel44: TPRLabel;
    PRL_Desconto: TPRLabel;
    PRLabel21: TPRLabel;
    PRL_Vendedor: TPRLabel;
    PRL_Endereco: TPRLabel;
    PRLabel10: TPRLabel;
    PRL_CNPJ: TPRLabel;
    PRLabel12: TPRLabel;
    PRL_IE: TPRLabel;
    PRLabel11: TPRLabel;
    PRLabel13: TPRLabel;
    PRLabel45: TPRLabel;
    PRL_Celular: TPRLabel;
    PRL_Paginacao: TPRLabel;
    Label1: TLabel;
    LBL_Ini: TLabel;
    Label3: TLabel;
    LBL_Fim: TLabel;
    BT_Avanca: TButton;
    BT_Retorna: TButton;
    Endereco_01: TPRLabel;
    Endereco_02: TPRLabel;
    Endereco_03: TPRLabel;
    Endereco_04: TPRLabel;
    Endereco_05: TPRLabel;
    PRLabel29: TPRLabel;
    Empresa_01: TPRLabel;
    Empresa_02: TPRLabel;
    PRLabel26: TPRLabel;
    PRL_VlrTotalOC: TPRLabel;
    Valor_Total: TEdit;
    PRLabel14: TPRLabel;
    PRL_Observacao: TPRText;
    PRRect5: TPRRect;
    PRLabel27: TPRLabel;
    PRLabel34: TPRLabel;
    PRRect6: TPRRect;
    PRRect7: TPRRect;
    PRRect8: TPRRect;
    PRRect9: TPRRect;
    PRRect10: TPRRect;
    PRRect11: TPRRect;
    PRRect12: TPRRect;
    PRRect13: TPRRect;
    PRRect95: TPRRect;
    PRRect96: TPRRect;
    PRRect97: TPRRect;
    PRRect98: TPRRect;
    PRRect99: TPRRect;
    PRRect100: TPRRect;
    PRRect101: TPRRect;
    PRL_Prazo_Entrega_01: TPRLabel;
    PRL_Prazo_Entrega_02: TPRLabel;
    PRL_Prazo_Entrega_03: TPRLabel;
    PRL_Prazo_Entrega_04: TPRLabel;
    PRL_Prazo_Entrega_05: TPRLabel;
    PRL_Prazo_Entrega_06: TPRLabel;
    PRL_Prazo_Entrega_07: TPRLabel;
    PRL_Prazo_Entrega_08: TPRLabel;
    PRL_Prazo_Entrega_09: TPRLabel;
    PRL_Prazo_Entrega_10: TPRLabel;
    PRL_Prazo_Entrega_11: TPRLabel;
    PRL_Prazo_Entrega_12: TPRLabel;
    PRL_Prazo_Entrega_13: TPRLabel;
    PRL_Prazo_Entrega_14: TPRLabel;
    PRL_Prazo_Entrega_15: TPRLabel;
    PRLabel37: TPRLabel;
    PRL_Utilizacao: TPRLabel;
    PRLabel38: TPRLabel;
    PRLabel39: TPRLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_SairKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BT_OkClick(Sender: TObject);
    procedure BT_AvancaClick(Sender: TObject);
    procedure BT_RetornaClick(Sender: TObject);
  private
    { Private declarations }
    function SendEMail(Handle: THandle; Mail: TStrings): Cardinal;
    procedure Criar_PDF(Posicao_Ini, Posicao_Fim, Pagina_Ini, Pagina_Fim: String);

  public
    { Public declarations }
  end;

var
  CriaOCPDF: TCriaOCPDF;
  ind : Integer;
  Anexo : array[1..7] of string;

implementation

uses Conexao_BD, Rotinas_Gerais, Ordem_02;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TCriaOCPDF.SendEMail(Handle: THandle; Mail: TStrings): Cardinal;
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

procedure TCriaOCPDF.BT_SairClick(Sender: TObject);
begin
     CriaOCPDF.Close;
end;

procedure TCriaOCPDF.FormShow(Sender: TObject);
begin
  ind:= 1;

  with PReport1 do
    begin
    FileName := 'C:\Ibrasmak\Fax\OC'+Trim(Ordem02.Nro_Ordem.Text)+'_'+Trim(LBL_Ini.Caption)+'.pdf';

    Anexo[StrtoInt(LBL_Ini.Caption)] := FileName;

    //*** Gera o Documento PDF ***
    BeginDoc;
    Print(PRPage);
    EndDoc;

    ShowMessage('O arquivo foi nomeado como "OC' + Trim(Ordem02.Nro_Ordem.Text) + '.pdf"' + chr(13) + chr(13) + 'Foi criado em "C:\Ibrasmak\Fax"');

    //*** Exibe o Documento ***

    If Trim(Opcao_Anterior.Text) = 'FAX' Then
       Begin
       MSG_Erro('Para enviar o FAX, utilize um programa de'+#10+#13+'FAX de seu Computador anexando o arquivo'+#10+#13+'de ordem de compra gerada na pasta C:\Ibrasmak\Fax');
    End;

    Pdf.LoadFile(FileName);
  end;
end;

procedure TCriaOCPDF.BT_SairKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 Then
    begin
    CriaOCPDF.Close;
  end;
end;

procedure TCriaOCPDF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 Then
    begin
    CriaOCPDF.Close;
  end;
end;

procedure TCriaOCPDF.BT_OkClick(Sender: TObject);

var
   Email: string;
   mail: TStringList;

begin
     If Trim(Opcao_Anterior.Text) = 'EMail' Then
        Begin
        Email := '';
        Email := Email + 'Ordem de Compra Nro.: '+Trim(Nro_Ordem.Text)+#10+#13+#10+#13;
        Email := Email + 'Os dados da Ordem de Compra estão em anexo no arquivo "PDF".'+#10+#13;
        Email := Email + 'Confirmar o recebimento deste pedido e informar imediatamente em caso de dúvidas ou divergências.'+#10+#13+#10+#13;
        Email := Email + 'ATENÇÃO: É obrigatório o envio do arquivo XML referente a Nota Fiscal desta Ordem de Compra para o e-mail: nfe@ibrasmak.com.br'+#10+#13;
        Email := Email + 'A falta do arquivo XML implicará no não recebimento da mercadoria em nossa portaria.'+#10+#13+#10+#13;
        Email := Email + 'Caso você não o possua o "Adobe Acrobat" para poder visualizá-lo'+#10+#13;
        Email := Email + 'acesse o link a baixo para obtê-lo.'+#10+#13;
        Email := Email + 'http://www.adobe.com/'+#10+#13+#10+#13;
        Email := Email + 'Vanessa dos Santos Oliveira'+#10+#13;
        Email := Email + 'Departamento de Compras'+#10+#13;
        Email := Email + 'compras@ibrasmak.com.br'+#10+#13+#10+#13;
        Email := Email + 'IBRASMAK - IND. BRASILEIRA DE MÁQUINAS LTDA.'+#10+#13;
        Email := Email + 'DDR: (11) 4828-9707'+#10+#13;
        Email := Email + 'PABX: (11) 4828-9700'+#10+#13;
        Email := Email + 'FAX: (11) 4828-9705'+#10+#13;

        mail := TStringList.Create;
        try
           mail.values['to'] := Trim(Cliente_Email.Text); ///AQUI VAI O EMAIL DO DESTINATARIO///
           mail.values['subject'] := 'IBRASMAK - Ordem de Compra Nro.:'+Trim(Nro_Ordem.Text); ///AQUI O ASSUNTO///
           mail.values['body'] := Email; ///AQUI O TEXTO NO CORPO DO EMAIL///

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

        CriaOCPDF.Close;

        End
     Else If Trim(Opcao_Anterior.Text) = 'FAX' Then
        Begin
        MSG_Erro('Para enviar o FAX, utilize um programa de'+#10+#13+'FAX de seu Computador anexando o arquivo'+#10+#13+'de ordem de compra gerada na pasta C:\Ibrasmak\Fax');

        CriaOCPDF.Close;

        End
     Else If Trim(Opcao_Anterior.Text) = 'Imprimir' Then
        Begin
        MSG_Erro('Para imprimir esta Ordem de Compra clique no icone da Impressora');
     End;
end;

procedure TCriaOCPDF.BT_AvancaClick(Sender: TObject);

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
             Criar_PDF('1','15',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 2 Then
             Begin
             Criar_PDF('16','30',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 3 Then
             Begin
             Criar_PDF('31','45',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 4 Then
             Begin
             Criar_PDF('46','60',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 5 Then
             Begin
             Criar_PDF('61','75',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 6 Then
             Begin
             Criar_PDF('76','90',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 7 Then
             Begin
             Criar_PDF('91','105',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 8 Then
             Begin
             Criar_PDF('106','120',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 9 Then
             Begin
             Criar_PDF('121','135',LBL_Ini.Caption,LBL_Fim.Caption);
             End
          Else If Pos = 10 Then
             Begin
             Criar_PDF('136','150',LBL_Ini.Caption,LBL_Fim.Caption);
          End;

       End;

    End;

    Menu_Principal.Refresh;
end;

procedure TCriaOCPDF.BT_RetornaClick(Sender: TObject);

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
           Criar_PDF('1','15',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 2 Then
           Begin
           Criar_PDF('16','30',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 3 Then
           Begin
           Criar_PDF('31','45',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 4 Then
           Begin
           Criar_PDF('46','60',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 5 Then
           Begin
           Criar_PDF('61','75',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 6 Then
           Begin
           Criar_PDF('76','90',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 7 Then
           Begin
           Criar_PDF('91','105',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 8 Then
           Begin
           Criar_PDF('106','120',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 9 Then
           Begin
           Criar_PDF('121','135',LBL_Ini.Caption,LBL_Fim.Caption);
           End
        Else If Pos = 10 Then
           Begin
           Criar_PDF('136','150',LBL_Ini.Caption,LBL_Fim.Caption);
        End;

     End;

     Menu_Principal.Refresh;
end;

procedure TCriaOCPDF.Criar_PDF(Posicao_Ini, Posicao_Fim, Pagina_Ini, Pagina_Fim: String);

var
   Ind, Posicao: Integer;
   Cond_Pgto, Vlr_Exibicao: string;
   Vlr_Total, Vlr_IPI, Vlr_Total_OC: Real;

begin
  Ampulheta();

  CriaOCPDF.PRL_Utilizacao.Caption := Trim(Ordem02.Ordem_Utilizacao.Text);

  CriaOCPDF.PRL_Paginacao.Caption := 'PÁGINA ' + Trim(Pagina_Ini) + ' DE ' + Trim(Pagina_Fim);
  CriaOCPDF.LBL_Ini.Caption       := Trim(Pagina_Ini);
  CriaOCPDF.LBL_Fim.Caption       := Trim(Pagina_Fim);

  CriaOCPDF.Cliente_Email.Text  := Ordem02.Fornecedor_Email.Text;
  CriaOCPDF.Nro_Ordem.Text    := Nro_Ordem.Text;

  CriaOCPDF.PRL_Ordem_Nro.Caption  := Trim(Nro_Ordem.Text);
  CriaOCPDF.PRL_Data_Cotacao.Caption := Trim(DateToStr(Date()));
  CriaOCPDF.PRL_Nome.Caption         := Trim(Ordem02.Fornecedor_Nome.Text);
  CriaOCPDF.PRL_Contato.Caption      := Trim(Ordem02.Fornecedor_Contato.Text);
  CriaOCPDF.PRL_Vendedor.Caption     := Trim(Ordem02.Ordem_Vendedor.Text);

  CriaOCPDF.PRL_CNPJ.Caption         := Trim(Ordem02.Fornecedor_Codigo.Text);
  CriaOCPDF.PRL_IE.Caption           := Trim(Ordem02.Fornecedor_IE.Text);

  CriaOCPDF.PRL_Endereco.Caption     := Trim(Ordem02.Fornecedor_Endereco.Text) + ' - ' + Trim(Ordem02.Fornecedor_Bairro.Text) + ' - ' + Trim(Ordem02.Fornecedor_Cidade.Text) + ' - ' + Trim(Ordem02.Fornecedor_Estado.Text) + '   CEP: ' + Trim(Ordem02.Fornecedor_Cep.Text);

  If Trim(Ordem02.Valor_Desconto.Text) <> '0,00' Then
     Begin
     CriaOCPDF.PRL_Desconto.Caption := 'R$ ' + Trim(Ordem02.Valor_Desconto.Text);
     End
  Else
     Begin
     CriaOCPDF.PRL_Desconto.Caption := '';
  End;

  If Trim(Ordem02.Fornecedor_Fone_Comercial.Text) <> '' Then
     Begin
     CriaOCPDF.PRL_Fone_1.Caption   := Trim(Ordem02.Fornecedor_Fone_Comercial.Text);
     End
  Else If Trim(Ordem02.Fornecedor_Fone_Celular.Text) <> '' Then
     Begin
     CriaOCPDF.PRL_Fone_1.Caption   := Trim(Ordem02.Fornecedor_Fone_Celular.Text);
  End;

  CriaOCPDF.PRL_Fax.Caption         := Trim(Ordem02.Fornecedor_Fone_Fax.Text);
  CriaOCPDF.PRL_Celular.Caption     := Trim(Ordem02.Fornecedor_Fone_Celular.Text);

  If Trim(Ordem02.Ordem_Condicao_Pgto_1.Text) <> '' Then
     Begin
     Cond_Pgto := Trim(Ordem02.Ordem_Condicao_Pgto_1.Text);
  End;

  If Trim(Cond_Pgto) = '' Then
     Begin
     Cond_Pgto := 'À VISTA';
     End
  Else
     Begin
     Cond_Pgto := Cond_Pgto;
  End;

  CriaOCPDF.PRL_Pagamento.Caption := Trim(Cond_Pgto);
  CriaOCPDF.PRL_Entrega.Caption   := Trim(Ordem02.Ordem_Prazo.Text);

  If Trim(Ordem02.Valor_Frete.Text) <> '0,00' Then
     Begin
     CriaOCPDF.PRL_Frete.Caption    := 'R$ ' + Trim(Ordem02.Valor_Frete.Text);
     End
  Else
     Begin
     CriaOCPDF.PRL_Frete.Caption    := '';
  End;

  Vlr_Total    := 0;
  Vlr_IPI      := 0;
  Vlr_Total_OC := 0;

  //*** Coloca os Itens no PDF ***

  CriaOCPDF.PRL_Item_01.Caption  := '';
  CriaOCPDF.PRL_Qtde_01.Caption  := '';
  CriaOCPDF.PRL_Unid_01.Caption  := '';
  CriaOCPDF.PRL_Desc_01.Caption  := '';
  CriaOCPDF.PRL_Unit_01.Caption  := '';
  CriaOCPDF.PRL_Total_01.Caption := '';
  CriaOCPDF.PRL_Aliq_01.Caption  := '';
  CriaOCPDF.PRL_Imp_01.Caption   := '';

  CriaOCPDF.PRL_Item_02.Caption  := '';
  CriaOCPDF.PRL_Qtde_02.Caption  := '';
  CriaOCPDF.PRL_Unid_02.Caption  := '';
  CriaOCPDF.PRL_Desc_02.Caption  := '';
  CriaOCPDF.PRL_Unit_02.Caption  := '';
  CriaOCPDF.PRL_Total_02.Caption := '';
  CriaOCPDF.PRL_Aliq_02.Caption  := '';
  CriaOCPDF.PRL_Imp_02.Caption   := '';

  CriaOCPDF.PRL_Item_03.Caption  := '';
  CriaOCPDF.PRL_Qtde_03.Caption  := '';
  CriaOCPDF.PRL_Unid_03.Caption  := '';
  CriaOCPDF.PRL_Desc_03.Caption  := '';
  CriaOCPDF.PRL_Unit_03.Caption  := '';
  CriaOCPDF.PRL_Total_03.Caption := '';
  CriaOCPDF.PRL_Aliq_03.Caption  := '';
  CriaOCPDF.PRL_Imp_03.Caption   := '';

  CriaOCPDF.PRL_Item_04.Caption  := '';
  CriaOCPDF.PRL_Qtde_04.Caption  := '';
  CriaOCPDF.PRL_Unid_04.Caption  := '';
  CriaOCPDF.PRL_Desc_04.Caption  := '';
  CriaOCPDF.PRL_Unit_04.Caption  := '';
  CriaOCPDF.PRL_Total_04.Caption := '';
  CriaOCPDF.PRL_Aliq_04.Caption  := '';
  CriaOCPDF.PRL_Imp_04.Caption   := '';

  CriaOCPDF.PRL_Item_05.Caption  := '';
  CriaOCPDF.PRL_Qtde_05.Caption  := '';
  CriaOCPDF.PRL_Unid_05.Caption  := '';
  CriaOCPDF.PRL_Desc_05.Caption  := '';
  CriaOCPDF.PRL_Unit_05.Caption  := '';
  CriaOCPDF.PRL_Total_05.Caption := '';
  CriaOCPDF.PRL_Aliq_05.Caption  := '';
  CriaOCPDF.PRL_Imp_05.Caption   := '';

  CriaOCPDF.PRL_Item_06.Caption  := '';
  CriaOCPDF.PRL_Qtde_06.Caption  := '';
  CriaOCPDF.PRL_Unid_06.Caption  := '';
  CriaOCPDF.PRL_Desc_06.Caption  := '';
  CriaOCPDF.PRL_Unit_06.Caption  := '';
  CriaOCPDF.PRL_Total_06.Caption := '';
  CriaOCPDF.PRL_Aliq_06.Caption  := '';
  CriaOCPDF.PRL_Imp_06.Caption   := '';

  CriaOCPDF.PRL_Item_07.Caption  := '';
  CriaOCPDF.PRL_Qtde_07.Caption  := '';
  CriaOCPDF.PRL_Unid_07.Caption  := '';
  CriaOCPDF.PRL_Desc_07.Caption  := '';
  CriaOCPDF.PRL_Unit_07.Caption  := '';
  CriaOCPDF.PRL_Total_07.Caption := '';
  CriaOCPDF.PRL_Aliq_07.Caption  := '';
  CriaOCPDF.PRL_Imp_07.Caption   := '';

  CriaOCPDF.PRL_Item_08.Caption  := '';
  CriaOCPDF.PRL_Qtde_08.Caption  := '';
  CriaOCPDF.PRL_Unid_08.Caption  := '';
  CriaOCPDF.PRL_Desc_08.Caption  := '';
  CriaOCPDF.PRL_Unit_08.Caption  := '';
  CriaOCPDF.PRL_Total_08.Caption := '';
  CriaOCPDF.PRL_Aliq_08.Caption  := '';
  CriaOCPDF.PRL_Imp_08.Caption   := '';

  CriaOCPDF.PRL_Item_09.Caption  := '';
  CriaOCPDF.PRL_Qtde_09.Caption  := '';
  CriaOCPDF.PRL_Unid_09.Caption  := '';
  CriaOCPDF.PRL_Desc_09.Caption  := '';
  CriaOCPDF.PRL_Unit_09.Caption  := '';
  CriaOCPDF.PRL_Total_09.Caption := '';
  CriaOCPDF.PRL_Aliq_09.Caption  := '';
  CriaOCPDF.PRL_Imp_09.Caption   := '';

  CriaOCPDF.PRL_Item_10.Caption  := '';
  CriaOCPDF.PRL_Qtde_10.Caption  := '';
  CriaOCPDF.PRL_Unid_10.Caption  := '';
  CriaOCPDF.PRL_Desc_10.Caption  := '';
  CriaOCPDF.PRL_Unit_10.Caption  := '';
  CriaOCPDF.PRL_Total_10.Caption := '';
  CriaOCPDF.PRL_Aliq_10.Caption  := '';
  CriaOCPDF.PRL_Imp_10.Caption   := '';

  CriaOCPDF.PRL_Item_11.Caption  := '';
  CriaOCPDF.PRL_Qtde_11.Caption  := '';
  CriaOCPDF.PRL_Unid_11.Caption  := '';
  CriaOCPDF.PRL_Desc_11.Caption  := '';
  CriaOCPDF.PRL_Unit_11.Caption  := '';
  CriaOCPDF.PRL_Total_11.Caption := '';
  CriaOCPDF.PRL_Aliq_11.Caption  := '';
  CriaOCPDF.PRL_Imp_11.Caption   := '';

  CriaOCPDF.PRL_Item_12.Caption  := '';
  CriaOCPDF.PRL_Qtde_12.Caption  := '';
  CriaOCPDF.PRL_Unid_12.Caption  := '';
  CriaOCPDF.PRL_Desc_12.Caption  := '';
  CriaOCPDF.PRL_Unit_12.Caption  := '';
  CriaOCPDF.PRL_Total_12.Caption := '';
  CriaOCPDF.PRL_Aliq_12.Caption  := '';
  CriaOCPDF.PRL_Imp_12.Caption   := '';

  CriaOCPDF.PRL_Item_13.Caption  := '';
  CriaOCPDF.PRL_Qtde_13.Caption  := '';
  CriaOCPDF.PRL_Unid_13.Caption  := '';
  CriaOCPDF.PRL_Desc_13.Caption  := '';
  CriaOCPDF.PRL_Unit_13.Caption  := '';
  CriaOCPDF.PRL_Total_13.Caption := '';
  CriaOCPDF.PRL_Aliq_13.Caption  := '';
  CriaOCPDF.PRL_Imp_13.Caption   := '';

  CriaOCPDF.PRL_Item_14.Caption  := '';
  CriaOCPDF.PRL_Qtde_14.Caption  := '';
  CriaOCPDF.PRL_Unid_14.Caption  := '';
  CriaOCPDF.PRL_Desc_14.Caption  := '';
  CriaOCPDF.PRL_Unit_14.Caption  := '';
  CriaOCPDF.PRL_Total_14.Caption := '';
  CriaOCPDF.PRL_Aliq_14.Caption  := '';
  CriaOCPDF.PRL_Imp_14.Caption   := '';

  CriaOCPDF.PRL_Item_15.Caption  := '';
  CriaOCPDF.PRL_Qtde_15.Caption  := '';
  CriaOCPDF.PRL_Unid_15.Caption  := '';
  CriaOCPDF.PRL_Desc_15.Caption  := '';
  CriaOCPDF.PRL_Unit_15.Caption  := '';
  CriaOCPDF.PRL_Total_15.Caption := '';
  CriaOCPDF.PRL_Aliq_15.Caption  := '';
  CriaOCPDF.PRL_Imp_15.Caption   := '';

  CriaOCPDF.PRL_Prazo_Entrega_01.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_02.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_03.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_04.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_05.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_06.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_07.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_08.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_09.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_10.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_11.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_12.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_13.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_14.Caption  := '';
  CriaOCPDF.PRL_Prazo_Entrega_15.Caption  := '';
  {
  CriaOCPDF.PRL_OS_01.Caption  := '';
  CriaOCPDF.PRL_OS_02.Caption  := '';
  CriaOCPDF.PRL_OS_03.Caption  := '';
  CriaOCPDF.PRL_OS_04.Caption  := '';
  CriaOCPDF.PRL_OS_05.Caption  := '';
  CriaOCPDF.PRL_OS_06.Caption  := '';
  CriaOCPDF.PRL_OS_07.Caption  := '';
  CriaOCPDF.PRL_OS_08.Caption  := '';
  CriaOCPDF.PRL_OS_09.Caption  := '';
  CriaOCPDF.PRL_OS_10.Caption  := '';
  CriaOCPDF.PRL_OS_11.Caption  := '';
  CriaOCPDF.PRL_OS_12.Caption  := '';
  CriaOCPDF.PRL_OS_13.Caption  := '';
  CriaOCPDF.PRL_OS_14.Caption  := '';
  CriaOCPDF.PRL_OS_15.Caption  := '';
  }
  Posicao := StrToInt(Posicao_Fim);

  For Ind := StrToInt(Posicao_Ini) To Posicao Do
      Begin
      If (Ind = 1) Or (Ind = 16) Or (Ind = 31) Or (Ind = 46) Or (Ind = 61) Or (Ind = 76) Or (Ind = 91) Or  (Ind = 106) Or (Ind = 121) Or (Ind = 136) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_01.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_01.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_01.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_01.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_01.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_01.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_01.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_01.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_01.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_01.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_01.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_01.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_01.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 2) Or (Ind = 17) Or (Ind = 32) Or (Ind = 47) Or (Ind = 62) Or (Ind = 77) Or (Ind = 92) Or  (Ind = 107) Or (Ind = 122) Or (Ind = 137) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_02.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_02.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_02.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_02.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_02.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_02.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_02.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_02.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_02.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_02.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_02.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_02.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_02.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 3) Or (Ind = 18) Or (Ind = 33) Or (Ind = 48) Or (Ind = 63) Or (Ind = 78) Or (Ind = 93) Or  (Ind = 108) Or (Ind = 123) Or (Ind = 138) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_03.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_03.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_03.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_03.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_03.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_03.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_03.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_03.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_03.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_03.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_03.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_03.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_03.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 4) Or (Ind = 19) Or (Ind = 34) Or (Ind = 49) Or (Ind = 64) Or (Ind = 79) Or (Ind = 94) Or  (Ind = 109) Or (Ind = 124) Or (Ind = 139) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_04.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_04.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_04.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_04.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_04.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_04.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_04.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_04.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_04.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_04.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_04.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_04.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_04.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 5) Or (Ind = 20) Or (Ind = 35) Or (Ind = 50) Or (Ind = 65) Or (Ind = 80) Or (Ind = 95) Or  (Ind = 110) Or (Ind = 125) Or (Ind = 140) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_05.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_05.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_05.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_05.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_05.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_05.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_05.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_05.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_05.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_05.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_05.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_05.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_05.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 6) Or (Ind = 21) Or (Ind = 36) Or (Ind = 51) Or (Ind = 66) Or (Ind = 81) Or (Ind = 96) Or  (Ind = 111) Or (Ind = 126) Or (Ind = 141) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_06.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_06.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_06.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_06.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_06.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_06.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_06.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_06.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_06.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_06.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_06.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_06.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_06.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 7) Or (Ind = 22) Or (Ind = 37) Or (Ind = 52) Or (Ind = 67) Or (Ind = 82) Or (Ind = 97) Or  (Ind = 112) Or (Ind = 127) Or (Ind = 142) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_07.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_07.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_07.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_07.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_07.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_07.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_07.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_07.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_07.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_07.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_07.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_07.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_07.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 8) Or (Ind = 23) Or (Ind = 38) Or (Ind = 53) Or (Ind = 68) Or (Ind = 83) Or (Ind = 98) Or  (Ind = 113) Or (Ind = 128) Or (Ind = 143) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_08.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_08.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_08.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_08.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_08.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_08.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_08.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_08.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_08.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_08.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_08.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_08.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_08.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 9) Or (Ind = 24) Or (Ind = 39) Or (Ind = 54) Or (Ind = 69) Or (Ind = 84) Or (Ind = 99) Or  (Ind = 114) Or (Ind = 129) Or (Ind = 144) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_09.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_09.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_09.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_09.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_09.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_09.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_09.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_09.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_09.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_09.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_09.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_09.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_09.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 10) Or (Ind = 25) Or (Ind = 40) Or (Ind = 55) Or (Ind = 70) Or (Ind = 85) Or (Ind = 100) Or (Ind = 115) Or (Ind = 130) Or (Ind = 145) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_10.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_10.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_10.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_10.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_10.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_10.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_10.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_10.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_10.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_10.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_10.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_10.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_10.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 11) Or (Ind = 26) Or (Ind = 41) Or (Ind = 56) Or (Ind = 71) Or (Ind = 86) Or (Ind = 101) Or (Ind = 116) Or (Ind = 131) Or (Ind = 146) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_11.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_11.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_11.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_11.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_11.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_11.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_11.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_11.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_11.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_11.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_11.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_11.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_11.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 12) Or (Ind = 27) Or (Ind = 42) Or (Ind = 57) Or (Ind = 72) Or (Ind = 87) Or (Ind = 102) Or (Ind = 117) Or (Ind = 132) Or (Ind = 147) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_12.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_12.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_12.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_12.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_12.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_12.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_12.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_12.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_12.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_12.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_12.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_12.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_12.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 13) Or (Ind = 28) Or (Ind = 43) Or (Ind = 58) Or (Ind = 73) Or (Ind = 88) Or (Ind = 103) Or (Ind = 118) Or (Ind = 133) Or (Ind = 148) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_13.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_13.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_13.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_13.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_13.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_13.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_13.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_13.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_13.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_13.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_13.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_13.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_13.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 14) Or (Ind = 29) Or (Ind = 44) Or (Ind = 59) Or (Ind = 74) Or (Ind = 89) Or (Ind = 104) Or (Ind = 119) Or (Ind = 134) Or (Ind = 149) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_14.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_14.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_14.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_14.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_14.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_14.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_14.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_14.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_14.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_14.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_14.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_14.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_14.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

         End
      Else If (Ind = 15) Or (Ind = 30) Or (Ind = 45) Or (Ind = 60) Or (Ind = 75) Or (Ind = 90) Or (Ind = 105) Or (Ind = 120) Or (Ind = 135) Or (Ind = 150) Then
         Begin

         If Trim(Ordem02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         CriaOCPDF.PRL_Item_15.Caption  := IntToStr(Ind);
         CriaOCPDF.PRL_Qtde_15.Caption  := Trim(Ordem02.SGD_Produtos.Cells[0,Ind]);
         CriaOCPDF.PRL_Unid_15.Caption  := Trim(Ordem02.SGD_Produtos.Cells[4,Ind]);
         CriaOCPDF.PRL_Desc_15.Caption  := Trim(Ordem02.SGD_Produtos.Cells[2,Ind]) + ' - ' + Copy(Trim(Ordem02.SGD_Produtos.Cells[3,Ind]),1,100);

         If Trim(Ordem02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Unit_15.Caption  := Zera_Centavos(Ordem02.SGD_Produtos.Cells[5,Ind]);
            End
         Else
            Begin
            CriaOCPDF.PRL_Unit_15.Caption  := '';
         End;

         If Trim(Ordem02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            CriaOCPDF.PRL_Total_15.Caption := Ordem02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            CriaOCPDF.PRL_Total_15.Caption := '';
         End;

         CriaOCPDF.PRL_Aliq_15.Caption  := Trim(Ordem02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Ordem02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Ordem02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         CriaOCPDF.PRL_Imp_15.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Ordem02.SGD_Produtos.Cells[6,Ind])));

         If Trim(Ordem02.SGD_Produtos.Cells[14,Ind]) = '/  /' Then
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_15.Caption := '';
            End
         Else
            Begin
            CriaOCPDF.PRL_Prazo_Entrega_15.Caption := Ordem02.SGD_Produtos.Cells[14,Ind];
         End;

         //CriaOCPDF.PRL_OS_15.Caption := Ordem02.SGD_Produtos.Cells[10,Ind];

         End;

      End;
  End;

  If Trim(Ordem02.Ordem_OBS_1.Text) <> '' Then
     Begin
     CriaOCPDF.PRL_Desc_11.Caption := Trim(Ordem02.Ordem_OBS_1.Text);
  End;

  If Trim(Ordem02.Ordem_OBS_2.Text) <> '' Then
     Begin
     CriaOCPDF.PRL_Desc_12.Caption := Trim(Ordem02.Ordem_OBS_2.Text);
  End;

  If Trim(Ordem02.Ordem_OBS_3.Text) <> '' Then
     Begin
     CriaOCPDF.PRL_Desc_13.Caption := Trim(Ordem02.Ordem_OBS_3.Text);
  End;

  If Trim(Ordem02.Ordem_OBS_4.Text) <> '' Then
     Begin
     CriaOCPDF.PRL_Desc_14.Caption := Trim(Ordem02.Ordem_OBS_4.Text);
  End;

  If Trim(Ordem02.Ordem_OBS_5.Text) <> '' Then
     Begin
     CriaOCPDF.PRL_Desc_15.Caption := Trim(Ordem02.Ordem_OBS_5.Text);
  End;

  //*** Coloca o Valor no PDF ***

  If Trim(Ordem02.Valor_IPI.Text) <> '0,00' Then
     Begin
     CriaOCPDF.PRL_VlrIPI.Caption := Trim(Ordem02.Valor_IPI.Text);
     End
  Else
     Begin
     CriaOCPDF.PRL_VlrIPI.Caption := '';
  End;

  If Trim(Ordem02.Valor_Total.Text) <> '0,00' Then
     Begin
     CriaOCPDF.PRL_VlrTotal.Caption := Trim(Ordem02.Valor_Total.Text);
     End
  Else
     Begin
     CriaOCPDF.PRL_VlrTotal.Caption := '';
  End;

  CriaOCPDF.PRL_Funcionario.Caption := Trim(Ordem02.Ordem_Funcionario.Text);

  //*** Exibe os Totais ***

  Str(Vlr_IPI:13:2,Vlr_Exibicao);
  CriaOCPDF.PRL_VlrIPI.Caption  := Ponto_Virgula(Trim(Vlr_Exibicao));

  Str(Vlr_Total:13:2,Vlr_Exibicao);
  CriaOCPDF.PRL_VlrTotal.Caption  := Ponto_Virgula(Trim(Vlr_Exibicao));

  Str((Vlr_Total + Vlr_IPI):13:2,Vlr_Exibicao);
  CriaOCPDF.PRL_VlrTotalOC.Caption  := Ponto_Virgula(Trim(Valor_Total.Text));

  //*** Exibe o PDF ***

  ind:= 1;

  with PReport1 do
    begin
    FileName := 'C:\Ibrasmak\Fax\OC'+Trim(Ordem02.Nro_Ordem.Text)+'_'+Trim(LBL_Ini.Caption)+'.pdf';

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
