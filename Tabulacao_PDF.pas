unit Tabulacao_PDF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, PReport, OleCtrls, PdfLib_TLB,
  PdfDoc, ShellAPI, Mapi, jpeg, PRJpegImage;

type
  TTabulacaoPDF = class(TForm)
    Menu_Principal: TPanel;
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    GroupBox1: TGroupBox;
    Pdf: TPdf;
    PRPage: TPRPage;
    OpenDialog1: TOpenDialog;
    BT_Ok: TBitBtn;
    Opcao_Anterior: TEdit;
    Cliente_Email: TEdit;
    Nro_Ordem: TEdit;
    Label1: TLabel;
    LBL_Ini: TLabel;
    Label3: TLabel;
    LBL_Fim: TLabel;
    BT_Avanca: TButton;
    BT_Retorna: TButton;
    PRLayoutPanel1: TPRLayoutPanel;
    PRLabel52: TPRLabel;
    PRLabel43: TPRLabel;
    PRLabel41: TPRLabel;
    Requisicao: TPRLabel;
    Empresa_01: TPRLabel;
    Empresa_02: TPRLabel;
    PRLabel1: TPRLabel;
    PRLabel5: TPRLabel;
    PRLabel6: TPRLabel;
    Equipamento: TPRLabel;
    OS: TPRLabel;
    Secao: TPRLabel;
    PRRect5: TPRRect;
    PRLabel13: TPRLabel;
    PRRect6: TPRRect;
    PRLabel14: TPRLabel;
    PRRect7: TPRRect;
    PRLabel11: TPRLabel;
    Data: TPRLabel;
    PRRect1: TPRRect;
    Fornecedor_1: TPRLabel;
    PReport1: TPReport;
    PRRect2: TPRRect;
    Fornecedor_2: TPRLabel;
    PRRect3: TPRRect;
    Fornecedor_3: TPRLabel;
    PRRect4: TPRRect;
    Fornecedor_4: TPRLabel;
    PRRect8: TPRRect;
    Fornecedor_5: TPRLabel;
    PRRect9: TPRRect;
    Fornecedor_6: TPRLabel;
    PRRect10: TPRRect;
    Fornecedor_7: TPRLabel;
    PRRect11: TPRRect;
    PRRect12: TPRRect;
    PRRect13: TPRRect;
    PRRect14: TPRRect;
    PRRect15: TPRRect;
    PRRect16: TPRRect;
    PRRect17: TPRRect;
    Contato_7: TPRLabel;
    Contato_6: TPRLabel;
    Contato_5: TPRLabel;
    Contato_4: TPRLabel;
    Contato_3: TPRLabel;
    Contato_2: TPRLabel;
    Contato_1: TPRLabel;
    PRRect18: TPRRect;
    PRRect19: TPRRect;
    PRRect20: TPRRect;
    PRRect21: TPRRect;
    PRRect22: TPRRect;
    PRRect23: TPRRect;
    PRRect24: TPRRect;
    Fone_7: TPRLabel;
    Fone_6: TPRLabel;
    Fone_5: TPRLabel;
    Fone_4: TPRLabel;
    Fone_3: TPRLabel;
    Fone_2: TPRLabel;
    Fone_1: TPRLabel;
    PRRect25: TPRRect;
    Item_1: TPRLabel;
    PRRect26: TPRRect;
    Fornecedor_Item_1_1: TPRLabel;
    PRRect27: TPRRect;
    Fornecedor_Item_2_1: TPRLabel;
    PRRect28: TPRRect;
    Fornecedor_Item_3_1: TPRLabel;
    PRRect29: TPRRect;
    Fornecedor_Item_4_1: TPRLabel;
    PRRect30: TPRRect;
    Fornecedor_Item_5_1: TPRLabel;
    PRRect31: TPRRect;
    Fornecedor_Item_6_1: TPRLabel;
    PRRect32: TPRRect;
    Fornecedor_Item_7_1: TPRLabel;
    PRRect33: TPRRect;
    Item_2: TPRLabel;
    PRRect34: TPRRect;
    Fornecedor_Item_1_2: TPRLabel;
    PRRect35: TPRRect;
    Fornecedor_Item_2_2: TPRLabel;
    PRRect36: TPRRect;
    Fornecedor_Item_3_2: TPRLabel;
    PRRect37: TPRRect;
    Fornecedor_Item_4_2: TPRLabel;
    PRRect38: TPRRect;
    Fornecedor_Item_5_2: TPRLabel;
    PRRect39: TPRRect;
    Fornecedor_Item_6_2: TPRLabel;
    PRRect40: TPRRect;
    Fornecedor_Item_7_2: TPRLabel;
    PRRect41: TPRRect;
    Item_3: TPRLabel;
    PRRect42: TPRRect;
    Fornecedor_Item_1_3: TPRLabel;
    PRRect43: TPRRect;
    Fornecedor_Item_2_3: TPRLabel;
    PRRect44: TPRRect;
    Fornecedor_Item_3_3: TPRLabel;
    PRRect45: TPRRect;
    Fornecedor_Item_4_3: TPRLabel;
    PRRect46: TPRRect;
    Fornecedor_Item_5_3: TPRLabel;
    PRRect47: TPRRect;
    Fornecedor_Item_6_3: TPRLabel;
    PRRect48: TPRRect;
    Fornecedor_Item_7_3: TPRLabel;
    PRRect49: TPRRect;
    Item_4: TPRLabel;
    PRRect50: TPRRect;
    Fornecedor_Item_1_4: TPRLabel;
    PRRect51: TPRRect;
    Fornecedor_Item_2_4: TPRLabel;
    PRRect52: TPRRect;
    Fornecedor_Item_3_4: TPRLabel;
    PRRect53: TPRRect;
    Fornecedor_Item_4_4: TPRLabel;
    PRRect54: TPRRect;
    Fornecedor_Item_5_4: TPRLabel;
    PRRect55: TPRRect;
    Fornecedor_Item_6_4: TPRLabel;
    PRRect56: TPRRect;
    Fornecedor_Item_7_4: TPRLabel;
    PRRect57: TPRRect;
    Item_5: TPRLabel;
    PRRect58: TPRRect;
    Fornecedor_Item_1_5: TPRLabel;
    PRRect59: TPRRect;
    Fornecedor_Item_2_5: TPRLabel;
    PRRect60: TPRRect;
    Fornecedor_Item_3_5: TPRLabel;
    PRRect61: TPRRect;
    Fornecedor_Item_4_5: TPRLabel;
    PRRect62: TPRRect;
    Fornecedor_Item_5_5: TPRLabel;
    PRRect63: TPRRect;
    Fornecedor_Item_6_5: TPRLabel;
    PRRect64: TPRRect;
    Fornecedor_Item_7_5: TPRLabel;
    PRRect65: TPRRect;
    PRRect66: TPRRect;
    PRRect67: TPRRect;
    PRRect68: TPRRect;
    PRRect69: TPRRect;
    Item_6: TPRLabel;
    Item_7: TPRLabel;
    Item_8: TPRLabel;
    Item_9: TPRLabel;
    Item_10: TPRLabel;
    PRRect70: TPRRect;
    PRRect71: TPRRect;
    PRRect72: TPRRect;
    PRRect73: TPRRect;
    PRRect74: TPRRect;
    Fornecedor_Item_1_6: TPRLabel;
    Fornecedor_Item_1_7: TPRLabel;
    Fornecedor_Item_1_8: TPRLabel;
    Fornecedor_Item_1_9: TPRLabel;
    Fornecedor_Item_1_10: TPRLabel;
    PRRect75: TPRRect;
    PRRect76: TPRRect;
    PRRect77: TPRRect;
    PRRect78: TPRRect;
    PRRect79: TPRRect;
    Fornecedor_Item_2_6: TPRLabel;
    Fornecedor_Item_2_7: TPRLabel;
    Fornecedor_Item_2_8: TPRLabel;
    Fornecedor_Item_2_9: TPRLabel;
    Fornecedor_Item_2_10: TPRLabel;
    PRRect80: TPRRect;
    PRRect81: TPRRect;
    PRRect82: TPRRect;
    PRRect83: TPRRect;
    PRRect84: TPRRect;
    Fornecedor_Item_3_6: TPRLabel;
    Fornecedor_Item_3_7: TPRLabel;
    Fornecedor_Item_3_8: TPRLabel;
    Fornecedor_Item_3_9: TPRLabel;
    Fornecedor_Item_3_10: TPRLabel;
    PRRect85: TPRRect;
    Fornecedor_Item_4_10: TPRLabel;
    PRRect86: TPRRect;
    Fornecedor_Item_4_9: TPRLabel;
    PRRect87: TPRRect;
    Fornecedor_Item_4_8: TPRLabel;
    PRRect88: TPRRect;
    Fornecedor_Item_4_7: TPRLabel;
    PRRect89: TPRRect;
    Fornecedor_Item_4_6: TPRLabel;
    PRRect90: TPRRect;
    Fornecedor_Item_5_10: TPRLabel;
    PRRect91: TPRRect;
    Fornecedor_Item_5_9: TPRLabel;
    PRRect92: TPRRect;
    Fornecedor_Item_5_8: TPRLabel;
    PRRect93: TPRRect;
    Fornecedor_Item_5_7: TPRLabel;
    PRRect94: TPRRect;
    Fornecedor_Item_5_6: TPRLabel;
    PRRect95: TPRRect;
    Fornecedor_Item_6_10: TPRLabel;
    PRRect96: TPRRect;
    Fornecedor_Item_6_9: TPRLabel;
    PRRect97: TPRRect;
    Fornecedor_Item_6_8: TPRLabel;
    PRRect98: TPRRect;
    Fornecedor_Item_6_7: TPRLabel;
    PRRect99: TPRRect;
    Fornecedor_Item_6_6: TPRLabel;
    PRRect100: TPRRect;
    Fornecedor_Item_7_10: TPRLabel;
    PRRect101: TPRRect;
    Fornecedor_Item_7_9: TPRLabel;
    PRRect102: TPRRect;
    Fornecedor_Item_7_8: TPRLabel;
    PRRect103: TPRRect;
    Fornecedor_Item_7_7: TPRLabel;
    PRRect104: TPRRect;
    Fornecedor_Item_7_6: TPRLabel;
    PRRect105: TPRRect;
    PRRect106: TPRRect;
    PRRect107: TPRRect;
    PRRect108: TPRRect;
    PRRect109: TPRRect;
    Item_11: TPRLabel;
    Item_12: TPRLabel;
    Item_13: TPRLabel;
    Item_14: TPRLabel;
    Item_15: TPRLabel;
    PRRect110: TPRRect;
    PRRect111: TPRRect;
    PRRect112: TPRRect;
    PRRect113: TPRRect;
    PRRect114: TPRRect;
    Fornecedor_Item_1_11: TPRLabel;
    Fornecedor_Item_1_12: TPRLabel;
    Fornecedor_Item_1_13: TPRLabel;
    Fornecedor_Item_1_14: TPRLabel;
    Fornecedor_Item_1_15: TPRLabel;
    PRRect115: TPRRect;
    PRRect116: TPRRect;
    PRRect117: TPRRect;
    PRRect118: TPRRect;
    PRRect119: TPRRect;
    Fornecedor_Item_2_11: TPRLabel;
    Fornecedor_Item_2_12: TPRLabel;
    Fornecedor_Item_2_13: TPRLabel;
    Fornecedor_Item_2_14: TPRLabel;
    Fornecedor_Item_2_15: TPRLabel;
    PRRect120: TPRRect;
    PRRect121: TPRRect;
    PRRect122: TPRRect;
    PRRect123: TPRRect;
    PRRect124: TPRRect;
    Fornecedor_Item_3_11: TPRLabel;
    Fornecedor_Item_3_12: TPRLabel;
    Fornecedor_Item_3_13: TPRLabel;
    Fornecedor_Item_3_14: TPRLabel;
    Fornecedor_Item_3_15: TPRLabel;
    PRRect125: TPRRect;
    Fornecedor_Item_4_15: TPRLabel;
    PRRect126: TPRRect;
    Fornecedor_Item_4_14: TPRLabel;
    PRRect127: TPRRect;
    Fornecedor_Item_4_13: TPRLabel;
    PRRect128: TPRRect;
    Fornecedor_Item_4_12: TPRLabel;
    PRRect129: TPRRect;
    Fornecedor_Item_4_11: TPRLabel;
    PRRect130: TPRRect;
    Fornecedor_Item_5_15: TPRLabel;
    PRRect131: TPRRect;
    Fornecedor_Item_5_14: TPRLabel;
    PRRect132: TPRRect;
    Fornecedor_Item_5_13: TPRLabel;
    PRRect133: TPRRect;
    Fornecedor_Item_5_12: TPRLabel;
    PRRect134: TPRRect;
    Fornecedor_Item_5_11: TPRLabel;
    PRRect135: TPRRect;
    Fornecedor_Item_6_15: TPRLabel;
    PRRect136: TPRRect;
    Fornecedor_Item_6_14: TPRLabel;
    PRRect137: TPRRect;
    Fornecedor_Item_6_13: TPRLabel;
    PRRect138: TPRRect;
    Fornecedor_Item_6_12: TPRLabel;
    PRRect139: TPRRect;
    Fornecedor_Item_6_11: TPRLabel;
    PRRect140: TPRRect;
    Fornecedor_Item_7_15: TPRLabel;
    PRRect141: TPRRect;
    Fornecedor_Item_7_14: TPRLabel;
    PRRect142: TPRRect;
    Fornecedor_Item_7_13: TPRLabel;
    PRRect143: TPRRect;
    Fornecedor_Item_7_12: TPRLabel;
    PRRect144: TPRRect;
    Fornecedor_Item_7_11: TPRLabel;
    PRRect145: TPRRect;
    PRRect146: TPRRect;
    PRRect147: TPRRect;
    PRRect148: TPRRect;
    PRRect149: TPRRect;
    Item_16: TPRLabel;
    Item_17: TPRLabel;
    Item_18: TPRLabel;
    Item_19: TPRLabel;
    Item_20: TPRLabel;
    PRRect150: TPRRect;
    PRRect151: TPRRect;
    PRRect152: TPRRect;
    PRRect153: TPRRect;
    PRRect154: TPRRect;
    Fornecedor_Item_1_16: TPRLabel;
    Fornecedor_Item_1_17: TPRLabel;
    Fornecedor_Item_1_18: TPRLabel;
    Fornecedor_Item_1_19: TPRLabel;
    Fornecedor_Item_1_20: TPRLabel;
    PRRect155: TPRRect;
    PRRect156: TPRRect;
    PRRect157: TPRRect;
    PRRect158: TPRRect;
    PRRect159: TPRRect;
    Fornecedor_Item_2_16: TPRLabel;
    Fornecedor_Item_2_17: TPRLabel;
    Fornecedor_Item_2_18: TPRLabel;
    Fornecedor_Item_2_19: TPRLabel;
    Fornecedor_Item_2_20: TPRLabel;
    PRRect160: TPRRect;
    PRRect161: TPRRect;
    PRRect162: TPRRect;
    PRRect163: TPRRect;
    PRRect164: TPRRect;
    Fornecedor_Item_3_16: TPRLabel;
    Fornecedor_Item_3_17: TPRLabel;
    Fornecedor_Item_3_18: TPRLabel;
    Fornecedor_Item_3_19: TPRLabel;
    Fornecedor_Item_3_20: TPRLabel;
    PRRect165: TPRRect;
    Fornecedor_Item_4_20: TPRLabel;
    PRRect166: TPRRect;
    Fornecedor_Item_4_19: TPRLabel;
    PRRect167: TPRRect;
    Fornecedor_Item_4_18: TPRLabel;
    PRRect168: TPRRect;
    Fornecedor_Item_4_17: TPRLabel;
    PRRect169: TPRRect;
    Fornecedor_Item_4_16: TPRLabel;
    PRRect170: TPRRect;
    Fornecedor_Item_5_20: TPRLabel;
    PRRect171: TPRRect;
    Fornecedor_Item_5_19: TPRLabel;
    PRRect172: TPRRect;
    Fornecedor_Item_5_18: TPRLabel;
    PRRect173: TPRRect;
    Fornecedor_Item_5_17: TPRLabel;
    PRRect174: TPRRect;
    Fornecedor_Item_5_16: TPRLabel;
    PRRect175: TPRRect;
    Fornecedor_Item_6_20: TPRLabel;
    PRRect176: TPRRect;
    Fornecedor_Item_6_19: TPRLabel;
    PRRect177: TPRRect;
    Fornecedor_Item_6_18: TPRLabel;
    PRRect178: TPRRect;
    Fornecedor_Item_6_17: TPRLabel;
    PRRect179: TPRRect;
    Fornecedor_Item_6_16: TPRLabel;
    PRRect180: TPRRect;
    Fornecedor_Item_7_20: TPRLabel;
    PRRect181: TPRRect;
    Fornecedor_Item_7_19: TPRLabel;
    PRRect182: TPRRect;
    Fornecedor_Item_7_18: TPRLabel;
    PRRect183: TPRRect;
    Fornecedor_Item_7_17: TPRLabel;
    PRRect184: TPRRect;
    Fornecedor_Item_7_16: TPRLabel;
    PRRect185: TPRRect;
    PRRect186: TPRRect;
    PRRect187: TPRRect;
    PRRect188: TPRRect;
    PRRect189: TPRRect;
    Item_21: TPRLabel;
    Item_22: TPRLabel;
    Item_23: TPRLabel;
    PRLabel199: TPRLabel;
    PRLabel200: TPRLabel;
    PRRect190: TPRRect;
    PRRect191: TPRRect;
    PRRect192: TPRRect;
    PRRect193: TPRRect;
    PRRect194: TPRRect;
    Fornecedor_Item_1_21: TPRLabel;
    Fornecedor_Item_1_22: TPRLabel;
    Fornecedor_Item_1_23: TPRLabel;
    Pgto_1: TPRLabel;
    PRRect195: TPRRect;
    PRRect196: TPRRect;
    PRRect197: TPRRect;
    PRRect198: TPRRect;
    PRRect199: TPRRect;
    Fornecedor_Item_2_21: TPRLabel;
    Fornecedor_Item_2_22: TPRLabel;
    Fornecedor_Item_2_23: TPRLabel;
    Pgto_2: TPRLabel;
    PRRect200: TPRRect;
    PRRect201: TPRRect;
    PRRect202: TPRRect;
    PRRect203: TPRRect;
    PRRect204: TPRRect;
    Fornecedor_Item_3_21: TPRLabel;
    Fornecedor_Item_3_22: TPRLabel;
    Fornecedor_Item_3_23: TPRLabel;
    Pgto_3: TPRLabel;
    PRRect205: TPRRect;
    PRRect206: TPRRect;
    Pgto_4: TPRLabel;
    PRRect207: TPRRect;
    Fornecedor_Item_4_23: TPRLabel;
    PRRect208: TPRRect;
    Fornecedor_Item_4_22: TPRLabel;
    PRRect209: TPRRect;
    Fornecedor_Item_4_21: TPRLabel;
    PRRect210: TPRRect;
    PRRect211: TPRRect;
    Pgto_5: TPRLabel;
    PRRect212: TPRRect;
    Fornecedor_Item_5_23: TPRLabel;
    PRRect213: TPRRect;
    Fornecedor_Item_5_22: TPRLabel;
    PRRect214: TPRRect;
    Fornecedor_Item_5_21: TPRLabel;
    PRRect215: TPRRect;
    PRRect216: TPRRect;
    Pgto_6: TPRLabel;
    PRRect217: TPRRect;
    Fornecedor_Item_6_23: TPRLabel;
    PRRect218: TPRRect;
    Fornecedor_Item_6_22: TPRLabel;
    PRRect219: TPRRect;
    Fornecedor_Item_6_21: TPRLabel;
    PRRect220: TPRRect;
    PRRect221: TPRRect;
    Pgto_7: TPRLabel;
    PRRect222: TPRRect;
    Fornecedor_Item_7_23: TPRLabel;
    PRRect223: TPRRect;
    Fornecedor_Item_7_22: TPRLabel;
    PRRect224: TPRRect;
    Fornecedor_Item_7_21: TPRLabel;
    Titulo: TPRLabel;
    PRRect225: TPRRect;
    PRLabel237: TPRLabel;
    PRRect226: TPRRect;
    Observacao_1: TPRLabel;
    Entrega_1: TPRText;
    Entrega_2: TPRText;
    Entrega_3: TPRText;
    Entrega_4: TPRText;
    Entrega_5: TPRText;
    Entrega_6: TPRText;
    Entrega_7: TPRText;
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
  TabulacaoPDF: TTabulacaoPDF;
  ind : Integer;

implementation

uses Conexao_BD, Rotinas_Gerais, Requisicao_02;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TTabulacaoPDF.SendEMail(Handle: THandle; Mail: TStrings): Cardinal;
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

procedure TTabulacaoPDF.BT_SairClick(Sender: TObject);
begin
     TabulacaoPDF.Close;
end;

procedure TTabulacaoPDF.FormShow(Sender: TObject);
begin
  ind:= 1;

  with PReport1 do
    begin
    FileName := 'C:\Ibrasmak\Fax\TB'+Trim(Requisicao02.DBGrid_Grupos.Fields[0].Text)+'.pdf';

    //*** Gera o Documento PDF ***
    BeginDoc;
    Print(PRPage);
    EndDoc;

    ShowMessage('O arquivo foi nomeado como "TB' + Trim(Requisicao02.DBGrid_Grupos.Fields[0].Text) + '.pdf"' + chr(13) + chr(13) + 'Foi criado em "C:\Ibrasmak\Fax"');

    //*** Exibe o Documento ***

    If Trim(Opcao_Anterior.Text) = 'FAX' Then
       Begin
       MSG_Erro('Para enviar o FAX, utilize um programa de'+#10+#13+'FAX de seu Computador anexando o arquivo'+#10+#13+'de Requisição gerada na pasta C:\Ibrasmak\Fax');
    End;

    Pdf.LoadFile(FileName);
  end;
end;

procedure TTabulacaoPDF.BT_SairKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 Then
    begin
    TabulacaoPDF.Close;
  end;
end;

procedure TTabulacaoPDF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 Then
    begin
    TabulacaoPDF.Close;
  end;
end;

procedure TTabulacaoPDF.BT_OkClick(Sender: TObject);

var
   Email, Anexo: string;
   mail: TStringList;

begin
     If Trim(Opcao_Anterior.Text) = 'EMail' Then
        Begin
        Email := '';
        Email := Email + 'Requisição Nro.: '+Trim(Requisicao02.DBGrid_Grupos.Fields[0].Text)+#10+#13+#10+#13;
        Email := Email + 'Os dados da Requisição estão em anexo no arquivo "PDF".'+#10+#13;
        Email := Email + 'Confirmar o recebimento deste pedido e informar imediatamente em caso de dúvidas ou divergências.'+#10+#13+#10+#13;
        Email := Email + 'Caso você não o possua o "Adobe Acrobat" para poder visualizá-lo'+#10+#13;
        Email := Email + 'acesse o link a baixo para obtê-lo.'+#10+#13;
        Email := Email + 'http://www.adobe.com/'+#10+#13+#10+#13;
        Email := Email + 'IBRASMAK - IND. BRASILEIRA DE MÁQUINAS LTDA.';

        Anexo := PReport1.FileName;

        mail := TStringList.Create;
        try
           mail.values['to'] := ''; ///AQUI VAI O EMAIL DO DESTINATARIO///
           mail.values['subject'] := 'IBRASMAK - Requisição Nro.:'+Trim(Requisicao02.DBGrid_Grupos.Fields[0].Text); ///AQUI O ASSUNTO///
           mail.values['body'] := Email; ///AQUI O TEXTO NO CORPO DO EMAIL///
           mail.values['attachment0'] := Anexo; ////AQUI O ENDEREÇO ONDE ENCONTRAM OS ARQUIVOS//
           sendEMail(Application.Handle, mail);
        finally
           mail.Free;
        end;

        TabulacaoPDF.Close;

        End
     Else If Trim(Opcao_Anterior.Text) = 'FAX' Then
        Begin
        MSG_Erro('Para enviar o FAX, utilize um programa de'+#10+#13+'FAX de seu Computador anexando o arquivo'+#10+#13+'de Requisição gerada na pasta C:\Ibrasmak\Fax');

        TabulacaoPDF.Close;

        End
     Else If Trim(Opcao_Anterior.Text) = 'Imprimir' Then
        Begin
        MSG_Erro('Para imprimir esta Requisição clique no icone da Impressora');
     End;
end;

procedure TTabulacaoPDF.BT_AvancaClick(Sender: TObject);

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

procedure TTabulacaoPDF.BT_RetornaClick(Sender: TObject);

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

procedure TTabulacaoPDF.Criar_PDF(Posicao_Ini, Posicao_Fim, Pagina_Ini, Pagina_Fim: String);

var
   Ind, Posicao: Integer;
   Cond_Pgto, Vlr_Exibicao: string;
   Vlr_Total, Vlr_IPI, Vlr_Total_OC: Real;

begin
  { Ampulheta();

  TabulacaoPDF.PRL_Paginacao.Caption := 'PÁGINA ' + Trim(Pagina_Ini) + ' DE ' + Trim(Pagina_Fim);
  TabulacaoPDF.LBL_Ini.Caption       := Trim(Pagina_Ini);
  TabulacaoPDF.LBL_Fim.Caption       := Trim(Pagina_Fim);

  TabulacaoPDF.Cliente_Email.Text  := Requisicao02.Fornecedor_Email.Text;
  TabulacaoPDF.Nro_Ordem.Text    := Nro_Ordem.Text;

  TabulacaoPDF.PRL_Ordem_Nro.Caption  := Trim(Nro_Ordem.Text);
  TabulacaoPDF.PRL_Data_Cotacao.Caption := Trim(DateToStr(Date()));
  TabulacaoPDF.PRL_Nome.Caption         := Trim(Requisicao02.Fornecedor_Nome.Text);
  TabulacaoPDF.PRL_Contato.Caption      := Trim(Requisicao02.Fornecedor_Contato.Text);
  TabulacaoPDF.PRL_Vendedor.Caption     := Trim(Requisicao02.Ordem_Vendedor.Text);

  TabulacaoPDF.PRL_CNPJ.Caption         := Trim(Requisicao02.Fornecedor_Codigo.Text);
  TabulacaoPDF.PRL_IE.Caption           := Trim(Requisicao02.Fornecedor_IE.Text);

  TabulacaoPDF.PRL_Endereco.Caption     := Trim(Requisicao02.Fornecedor_Endereco.Text) + ' - ' + Trim(Requisicao02.Fornecedor_Bairro.Text) + ' - ' + Trim(Requisicao02.Fornecedor_Cidade.Text) + ' - ' + Trim(Requisicao02.Fornecedor_Estado.Text) + '   CEP: ' + Trim(Requisicao02.Fornecedor_Cep.Text);

  If Trim(Requisicao02.Valor_Desconto.Text) <> '0,00' Then
     Begin
     TabulacaoPDF.PRL_Desconto.Caption := 'R$ ' + Trim(Requisicao02.Valor_Desconto.Text);
     End
  Else
     Begin
     TabulacaoPDF.PRL_Desconto.Caption := '';
  End;

  If Trim(Requisicao02.Fornecedor_Fone_Comercial.Text) <> '' Then
     Begin
     TabulacaoPDF.PRL_Fone_1.Caption   := Trim(Requisicao02.Fornecedor_Fone_Comercial.Text);
     End
  Else If Trim(Requisicao02.Fornecedor_Fone_Celular.Text) <> '' Then
     Begin
     TabulacaoPDF.PRL_Fone_1.Caption   := Trim(Requisicao02.Fornecedor_Fone_Celular.Text);
  End;

  TabulacaoPDF.PRL_Fax.Caption         := Trim(Requisicao02.Fornecedor_Fone_Fax.Text);
  TabulacaoPDF.PRL_Celular.Caption     := Trim(Requisicao02.Fornecedor_Fone_Celular.Text);

  If Trim(Requisicao02.Ordem_Condicao_Pgto_1.Text) <> '' Then
     Begin
     If StrToInt(Requisicao02.Ordem_Condicao_Pgto_1.Text) > 0 Then
        Cond_Pgto := Trim(Requisicao02.Ordem_Condicao_Pgto_1.Text);
  End;

  If Trim(Requisicao02.Ordem_Condicao_Pgto_2.Text) <> '' Then
     Begin
     If StrToInt(Requisicao02.Ordem_Condicao_Pgto_2.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ', ' + Trim(Requisicao02.Ordem_Condicao_Pgto_2.Text);
  End;

  If Trim(Requisicao02.Ordem_Condicao_Pgto_3.Text) <> '' Then
     Begin
     If StrToInt(Requisicao02.Ordem_Condicao_Pgto_3.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ', ' + Trim(Requisicao02.Ordem_Condicao_Pgto_3.Text);
  End;

  If Trim(Requisicao02.Ordem_Condicao_Pgto_4.Text) <> '' Then
     Begin
     If StrToInt(Requisicao02.Ordem_Condicao_Pgto_4.Text) > 0 Then
        Cond_Pgto := Cond_Pgto + ' e ' + Trim(Requisicao02.Ordem_Condicao_Pgto_4.Text);
  End;

  If Trim(Cond_Pgto) = '' Then
     Begin
     Cond_Pgto := 'À VISTA';
     End
  Else
     Begin
     Cond_Pgto := Cond_Pgto + ' DD';
  End;

  TabulacaoPDF.PRL_Pagamento.Caption := Trim(Cond_Pgto);
  TabulacaoPDF.PRL_Entrega.Caption   := Trim(Requisicao02.Ordem_Prazo.Text);

  If Trim(Requisicao02.Valor_Frete.Text) <> '0,00' Then
     Begin
     TabulacaoPDF.PRL_Frete.Caption    := 'R$ ' + Trim(Requisicao02.Valor_Frete.Text);
     End
  Else
     Begin
     TabulacaoPDF.PRL_Frete.Caption    := '';
  End;

  Vlr_Total    := 0;
  Vlr_IPI      := 0;
  Vlr_Total_OC := 0;

  //*** Coloca os Itens no PDF ***

  TabulacaoPDF.PRL_Item_01.Caption  := '';
  TabulacaoPDF.PRL_Qtde_01.Caption  := '';
  TabulacaoPDF.PRL_Unid_01.Caption  := '';
  TabulacaoPDF.PRL_Cod_01.Caption   := '';
  TabulacaoPDF.PRL_Desc_01.Caption  := '';
  TabulacaoPDF.PRL_Unit_01.Caption  := '';
  TabulacaoPDF.PRL_Total_01.Caption := '';
  TabulacaoPDF.PRL_Aliq_01.Caption  := '';
  TabulacaoPDF.PRL_Imp_01.Caption   := '';

  TabulacaoPDF.PRL_Item_02.Caption  := '';
  TabulacaoPDF.PRL_Qtde_02.Caption  := '';
  TabulacaoPDF.PRL_Unid_02.Caption  := '';
  TabulacaoPDF.PRL_Cod_02.Caption   := '';
  TabulacaoPDF.PRL_Desc_02.Caption  := '';
  TabulacaoPDF.PRL_Unit_02.Caption  := '';
  TabulacaoPDF.PRL_Total_02.Caption := '';
  TabulacaoPDF.PRL_Aliq_02.Caption  := '';
  TabulacaoPDF.PRL_Imp_02.Caption   := '';

  TabulacaoPDF.PRL_Item_03.Caption  := '';
  TabulacaoPDF.PRL_Qtde_03.Caption  := '';
  TabulacaoPDF.PRL_Unid_03.Caption  := '';
  TabulacaoPDF.PRL_Cod_03.Caption   := '';
  TabulacaoPDF.PRL_Desc_03.Caption  := '';
  TabulacaoPDF.PRL_Unit_03.Caption  := '';
  TabulacaoPDF.PRL_Total_03.Caption := '';
  TabulacaoPDF.PRL_Aliq_03.Caption  := '';
  TabulacaoPDF.PRL_Imp_03.Caption   := '';

  TabulacaoPDF.PRL_Item_04.Caption  := '';
  TabulacaoPDF.PRL_Qtde_04.Caption  := '';
  TabulacaoPDF.PRL_Unid_04.Caption  := '';
  TabulacaoPDF.PRL_Cod_04.Caption   := '';
  TabulacaoPDF.PRL_Desc_04.Caption  := '';
  TabulacaoPDF.PRL_Unit_04.Caption  := '';
  TabulacaoPDF.PRL_Total_04.Caption := '';
  TabulacaoPDF.PRL_Aliq_04.Caption  := '';
  TabulacaoPDF.PRL_Imp_04.Caption   := '';

  TabulacaoPDF.PRL_Item_05.Caption  := '';
  TabulacaoPDF.PRL_Qtde_05.Caption  := '';
  TabulacaoPDF.PRL_Unid_05.Caption  := '';
  TabulacaoPDF.PRL_Cod_05.Caption   := '';
  TabulacaoPDF.PRL_Desc_05.Caption  := '';
  TabulacaoPDF.PRL_Unit_05.Caption  := '';
  TabulacaoPDF.PRL_Total_05.Caption := '';
  TabulacaoPDF.PRL_Aliq_05.Caption  := '';
  TabulacaoPDF.PRL_Imp_05.Caption   := '';

  TabulacaoPDF.PRL_Item_06.Caption  := '';
  TabulacaoPDF.PRL_Qtde_06.Caption  := '';
  TabulacaoPDF.PRL_Unid_06.Caption  := '';
  TabulacaoPDF.PRL_Cod_06.Caption   := '';
  TabulacaoPDF.PRL_Desc_06.Caption  := '';
  TabulacaoPDF.PRL_Unit_06.Caption  := '';
  TabulacaoPDF.PRL_Total_06.Caption := '';
  TabulacaoPDF.PRL_Aliq_06.Caption  := '';
  TabulacaoPDF.PRL_Imp_06.Caption   := '';

  TabulacaoPDF.PRL_Item_07.Caption  := '';
  TabulacaoPDF.PRL_Qtde_07.Caption  := '';
  TabulacaoPDF.PRL_Unid_07.Caption  := '';
  TabulacaoPDF.PRL_Cod_07.Caption   := '';
  TabulacaoPDF.PRL_Desc_07.Caption  := '';
  TabulacaoPDF.PRL_Unit_07.Caption  := '';
  TabulacaoPDF.PRL_Total_07.Caption := '';
  TabulacaoPDF.PRL_Aliq_07.Caption  := '';
  TabulacaoPDF.PRL_Imp_07.Caption   := '';

  TabulacaoPDF.PRL_Item_08.Caption  := '';
  TabulacaoPDF.PRL_Qtde_08.Caption  := '';
  TabulacaoPDF.PRL_Unid_08.Caption  := '';
  TabulacaoPDF.PRL_Cod_08.Caption   := '';
  TabulacaoPDF.PRL_Desc_08.Caption  := '';
  TabulacaoPDF.PRL_Unit_08.Caption  := '';
  TabulacaoPDF.PRL_Total_08.Caption := '';
  TabulacaoPDF.PRL_Aliq_08.Caption  := '';
  TabulacaoPDF.PRL_Imp_08.Caption   := '';

  TabulacaoPDF.PRL_Item_09.Caption  := '';
  TabulacaoPDF.PRL_Qtde_09.Caption  := '';
  TabulacaoPDF.PRL_Unid_09.Caption  := '';
  TabulacaoPDF.PRL_Cod_09.Caption   := '';
  TabulacaoPDF.PRL_Desc_09.Caption  := '';
  TabulacaoPDF.PRL_Unit_09.Caption  := '';
  TabulacaoPDF.PRL_Total_09.Caption := '';
  TabulacaoPDF.PRL_Aliq_09.Caption  := '';
  TabulacaoPDF.PRL_Imp_09.Caption   := '';

  TabulacaoPDF.PRL_Item_10.Caption  := '';
  TabulacaoPDF.PRL_Qtde_10.Caption  := '';
  TabulacaoPDF.PRL_Unid_10.Caption  := '';
  TabulacaoPDF.PRL_Cod_10.Caption   := '';
  TabulacaoPDF.PRL_Desc_10.Caption  := '';
  TabulacaoPDF.PRL_Unit_10.Caption  := '';
  TabulacaoPDF.PRL_Total_10.Caption := '';
  TabulacaoPDF.PRL_Aliq_10.Caption  := '';
  TabulacaoPDF.PRL_Imp_10.Caption   := '';

  TabulacaoPDF.PRL_Item_11.Caption  := '';
  TabulacaoPDF.PRL_Qtde_11.Caption  := '';
  TabulacaoPDF.PRL_Unid_11.Caption  := '';
  TabulacaoPDF.PRL_Cod_11.Caption   := '';
  TabulacaoPDF.PRL_Desc_11.Caption  := '';
  TabulacaoPDF.PRL_Unit_11.Caption  := '';
  TabulacaoPDF.PRL_Total_11.Caption := '';
  TabulacaoPDF.PRL_Aliq_11.Caption  := '';
  TabulacaoPDF.PRL_Imp_11.Caption   := '';

  TabulacaoPDF.PRL_Item_12.Caption  := '';
  TabulacaoPDF.PRL_Qtde_12.Caption  := '';
  TabulacaoPDF.PRL_Unid_12.Caption  := '';
  TabulacaoPDF.PRL_Cod_12.Caption   := '';
  TabulacaoPDF.PRL_Desc_12.Caption  := '';
  TabulacaoPDF.PRL_Unit_12.Caption  := '';
  TabulacaoPDF.PRL_Total_12.Caption := '';
  TabulacaoPDF.PRL_Aliq_12.Caption  := '';
  TabulacaoPDF.PRL_Imp_12.Caption   := '';

  TabulacaoPDF.PRL_Item_13.Caption  := '';
  TabulacaoPDF.PRL_Qtde_13.Caption  := '';
  TabulacaoPDF.PRL_Unid_13.Caption  := '';
  TabulacaoPDF.PRL_Cod_13.Caption   := '';
  TabulacaoPDF.PRL_Desc_13.Caption  := '';
  TabulacaoPDF.PRL_Unit_13.Caption  := '';
  TabulacaoPDF.PRL_Total_13.Caption := '';
  TabulacaoPDF.PRL_Aliq_13.Caption  := '';
  TabulacaoPDF.PRL_Imp_13.Caption   := '';

  TabulacaoPDF.PRL_Item_14.Caption  := '';
  TabulacaoPDF.PRL_Qtde_14.Caption  := '';
  TabulacaoPDF.PRL_Unid_14.Caption  := '';
  TabulacaoPDF.PRL_Cod_14.Caption   := '';
  TabulacaoPDF.PRL_Desc_14.Caption  := '';
  TabulacaoPDF.PRL_Unit_14.Caption  := '';
  TabulacaoPDF.PRL_Total_14.Caption := '';
  TabulacaoPDF.PRL_Aliq_14.Caption  := '';
  TabulacaoPDF.PRL_Imp_14.Caption   := '';

  TabulacaoPDF.PRL_Item_15.Caption  := '';
  TabulacaoPDF.PRL_Qtde_15.Caption  := '';
  TabulacaoPDF.PRL_Unid_15.Caption  := '';
  TabulacaoPDF.PRL_Cod_15.Caption   := '';
  TabulacaoPDF.PRL_Desc_15.Caption  := '';
  TabulacaoPDF.PRL_Unit_15.Caption  := '';
  TabulacaoPDF.PRL_Total_15.Caption := '';
  TabulacaoPDF.PRL_Aliq_15.Caption  := '';
  TabulacaoPDF.PRL_Imp_15.Caption   := '';

  Posicao := StrToInt(Posicao_Fim);

  For Ind := StrToInt(Posicao_Ini) To Posicao Do
      Begin
      If (Ind = 1) Or (Ind = 16) Or (Ind = 31) Or (Ind = 46) Or (Ind = 61) Or (Ind = 76) Or (Ind = 91) Or  (Ind = 106) Or (Ind = 121) Or (Ind = 136) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_01.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_01.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_01.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_01.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_01.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_01.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_01.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_01.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_01.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_01.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_01.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 2) Or (Ind = 17) Or (Ind = 32) Or (Ind = 47) Or (Ind = 62) Or (Ind = 77) Or (Ind = 92) Or  (Ind = 107) Or (Ind = 122) Or (Ind = 137) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_02.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_02.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_02.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_02.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_02.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_02.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_02.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_02.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_02.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_02.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_02.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 3) Or (Ind = 18) Or (Ind = 33) Or (Ind = 48) Or (Ind = 63) Or (Ind = 78) Or (Ind = 93) Or  (Ind = 108) Or (Ind = 123) Or (Ind = 138) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_03.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_03.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_03.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_03.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_03.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_03.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_03.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_03.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_03.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_03.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_03.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 4) Or (Ind = 19) Or (Ind = 34) Or (Ind = 49) Or (Ind = 64) Or (Ind = 79) Or (Ind = 94) Or  (Ind = 109) Or (Ind = 124) Or (Ind = 139) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_04.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_04.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_04.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_04.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_04.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_04.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_04.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_04.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_04.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_04.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_04.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 5) Or (Ind = 20) Or (Ind = 35) Or (Ind = 50) Or (Ind = 65) Or (Ind = 80) Or (Ind = 95) Or  (Ind = 110) Or (Ind = 125) Or (Ind = 140) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_05.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_05.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_05.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_05.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_05.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_05.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_05.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_05.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_05.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_05.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_05.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 6) Or (Ind = 21) Or (Ind = 36) Or (Ind = 51) Or (Ind = 66) Or (Ind = 81) Or (Ind = 96) Or  (Ind = 111) Or (Ind = 126) Or (Ind = 141) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_06.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_06.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_06.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_06.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_06.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_06.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_06.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_06.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_06.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_06.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_06.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 7) Or (Ind = 22) Or (Ind = 37) Or (Ind = 52) Or (Ind = 67) Or (Ind = 82) Or (Ind = 97) Or  (Ind = 112) Or (Ind = 127) Or (Ind = 142) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_07.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_07.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_07.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_07.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_07.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_07.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_07.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_07.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_07.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_07.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_07.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 8) Or (Ind = 23) Or (Ind = 38) Or (Ind = 53) Or (Ind = 68) Or (Ind = 83) Or (Ind = 98) Or  (Ind = 113) Or (Ind = 128) Or (Ind = 143) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_08.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_08.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_08.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_08.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_08.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_08.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_08.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_08.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_08.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_08.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_08.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 9) Or (Ind = 24) Or (Ind = 39) Or (Ind = 54) Or (Ind = 69) Or (Ind = 84) Or (Ind = 99) Or  (Ind = 114) Or (Ind = 129) Or (Ind = 144) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_09.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_09.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_09.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_09.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_09.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_09.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_09.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_09.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_09.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_09.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_09.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 10) Or (Ind = 25) Or (Ind = 40) Or (Ind = 55) Or (Ind = 70) Or (Ind = 85) Or (Ind = 100) Or (Ind = 115) Or (Ind = 130) Or (Ind = 145) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_10.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_10.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_10.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_10.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_10.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_10.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_10.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_10.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_10.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_10.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_10.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 11) Or (Ind = 26) Or (Ind = 41) Or (Ind = 56) Or (Ind = 71) Or (Ind = 86) Or (Ind = 101) Or (Ind = 116) Or (Ind = 131) Or (Ind = 146) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_11.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_11.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_11.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_11.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_11.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_11.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_11.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_11.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_11.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_11.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_11.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 12) Or (Ind = 27) Or (Ind = 42) Or (Ind = 57) Or (Ind = 72) Or (Ind = 87) Or (Ind = 102) Or (Ind = 117) Or (Ind = 132) Or (Ind = 147) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_12.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_12.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_12.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_12.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_12.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_12.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_12.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_12.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_12.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_12.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_12.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 13) Or (Ind = 28) Or (Ind = 43) Or (Ind = 58) Or (Ind = 73) Or (Ind = 88) Or (Ind = 103) Or (Ind = 118) Or (Ind = 133) Or (Ind = 148) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_13.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_13.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_13.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_13.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_13.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_13.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_13.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_13.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_13.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_13.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_13.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 14) Or (Ind = 29) Or (Ind = 44) Or (Ind = 59) Or (Ind = 74) Or (Ind = 89) Or (Ind = 104) Or (Ind = 119) Or (Ind = 134) Or (Ind = 149) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_14.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_14.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_14.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_14.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_14.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_14.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_14.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_14.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_14.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_14.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_14.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

         End
      Else If (Ind = 15) Or (Ind = 30) Or (Ind = 45) Or (Ind = 60) Or (Ind = 75) Or (Ind = 90) Or (Ind = 105) Or (Ind = 120) Or (Ind = 135) Or (Ind = 150) Then
         Begin

         If Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]) <> '' Then
            Begin

         TabulacaoPDF.PRL_Item_15.Caption  := IntToStr(Ind);
         TabulacaoPDF.PRL_Qtde_15.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[0,Ind]);
         TabulacaoPDF.PRL_Unid_15.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[4,Ind]);
         TabulacaoPDF.PRL_Cod_15.Caption   := Trim(Requisicao02.SGD_Produtos.Cells[2,Ind]);
         TabulacaoPDF.PRL_Desc_15.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[3,Ind]);

         If Trim(Requisicao02.SGD_Produtos.Cells[5,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Unit_15.Caption  := Requisicao02.SGD_Produtos.Cells[5,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Unit_15.Caption  := '';
         End;

         If Trim(Requisicao02.SGD_Produtos.Cells[6,Ind]) <> '0,00' Then
            Begin
            TabulacaoPDF.PRL_Total_15.Caption := Requisicao02.SGD_Produtos.Cells[6,Ind];
            End
         Else
            Begin
            TabulacaoPDF.PRL_Total_15.Caption := '';
         End;

         TabulacaoPDF.PRL_Aliq_15.Caption  := Trim(Requisicao02.SGD_Produtos.Cells[8,Ind]) + ' %';

         Str(((StrToFloat(Requisicao02.SGD_Produtos.Cells[6,Ind]) * StrToFloat(Requisicao02.SGD_Produtos.Cells[8,Ind])) / 100):13:2,Vlr_Exibicao);
         TabulacaoPDF.PRL_Imp_15.Caption   := Ponto_Virgula(Trim(Vlr_Exibicao));

         Vlr_IPI   := Vlr_IPI + StrToFloat(Ponto_Virgula(Trim(Vlr_Exibicao)));
         Vlr_Total := Vlr_Total + StrToFloat(Ponto_Virgula(Trim(Requisicao02.SGD_Produtos.Cells[6,Ind])));

         End;

      End;
  End;

  If Trim(Requisicao02.Ordem_OBS_1.Text) <> '' Then
     Begin
     TabulacaoPDF.PRL_Desc_11.Caption := Trim(Requisicao02.Ordem_OBS_1.Text);
  End;

  If Trim(Requisicao02.Ordem_OBS_2.Text) <> '' Then
     Begin
     TabulacaoPDF.PRL_Desc_12.Caption := Trim(Requisicao02.Ordem_OBS_2.Text);
  End;

  If Trim(Requisicao02.Ordem_OBS_3.Text) <> '' Then
     Begin
     TabulacaoPDF.PRL_Desc_13.Caption := Trim(Requisicao02.Ordem_OBS_3.Text);
  End;

  If Trim(Requisicao02.Ordem_OBS_4.Text) <> '' Then
     Begin
     TabulacaoPDF.PRL_Desc_14.Caption := Trim(Requisicao02.Ordem_OBS_4.Text);
  End;

  If Trim(Requisicao02.Ordem_OBS_5.Text) <> '' Then
     Begin
     TabulacaoPDF.PRL_Desc_15.Caption := Trim(Requisicao02.Ordem_OBS_5.Text);
  End;

  //*** Coloca o Valor no PDF ***

  If Trim(Requisicao02.Valor_IPI.Text) <> '0,00' Then
     Begin
     TabulacaoPDF.PRL_VlrIPI.Caption := Trim(Requisicao02.Valor_IPI.Text);
     End
  Else
     Begin
     TabulacaoPDF.PRL_VlrIPI.Caption := '';
  End;

  If Trim(Requisicao02.Valor_Total.Text) <> '0,00' Then
     Begin
     TabulacaoPDF.PRL_VlrTotal.Caption := Trim(Requisicao02.Valor_Total.Text);
     End
  Else
     Begin
     TabulacaoPDF.PRL_VlrTotal.Caption := '';
  End;

  TabulacaoPDF.PRL_Funcionario.Caption := Trim(Requisicao02.Ordem_Funcionario.Text);

  //*** Exibe os Totais ***

  Str(Vlr_IPI:13:2,Vlr_Exibicao);
  TabulacaoPDF.PRL_VlrIPI.Caption  := Ponto_Virgula(Trim(Vlr_Exibicao));

  Str(Vlr_Total:13:2,Vlr_Exibicao);
  TabulacaoPDF.PRL_VlrTotal.Caption  := Ponto_Virgula(Trim(Vlr_Exibicao));

  Str((Vlr_Total + Vlr_IPI):13:2,Vlr_Exibicao);
  TabulacaoPDF.PRL_VlrTotalOC.Caption  := Ponto_Virgula(Trim(Vlr_Exibicao));

  //*** Exibe o PDF ***

  ind:= 1;

  with PReport1 do
    begin
    FileName := 'C:\Ibrasmak\Fax\TB'+Trim(Requisicao02.Nro_Ordem.Text)+'_'+Trim(LBL_Ini.Caption)+'.pdf';

    //*** Gera o Documento PDF ***
    BeginDoc;
    Print(PRPage);
    EndDoc;

    //*** Exibe o Documento ***

    Pdf.LoadFile(FileName);
  end;

  Pdf.Refresh;

  Seta();    }
end;

end.
